const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const ts = require('typescript');
const React = require('react');
const { renderToStaticMarkup } = require('react-dom/server');
const { StaticRouter } = require('react-router-dom/server');

function charger(fichier, contexte = {}, imports = {}) {
  const source = fs.readFileSync(path.join(__dirname, '..', fichier), 'utf8');
  const exports = {};
  vm.runInNewContext(ts.transpileModule(source, {
    compilerOptions: { module: ts.ModuleKind.CommonJS, target: ts.ScriptTarget.ES2020, jsx: ts.JsxEmit.ReactJSX },
  }).outputText, { exports, require: nom => imports[nom] ?? require(nom), ...contexte });
  return exports;
}

test('première visite puis choix Regarder ou Passer : mémorisation entre deux chargements', () => {
  const valeurs = new Map();
  const localStorage = { getItem: cle => valeurs.get(cle) ?? null, setItem: (cle, valeur) => valeurs.set(cle, valeur) };
  const premiereVisite = charger('src/utils/preferenceIntroductionVideo.ts', { localStorage });
  assert.equal(premiereVisite.introductionVideoTraitee(), false);
  premiereVisite.memoriserIntroductionVideo();
  assert.equal(premiereVisite.introductionVideoTraitee(), true);
  // Une déconnexion n’efface que la session utilisateur, pas ce choix propre à l’appareil.
  valeurs.delete('christos_user');
  const visiteSuivante = charger('src/utils/preferenceIntroductionVideo.ts', { localStorage });
  assert.equal(visiteSuivante.introductionVideoTraitee(), true);
});

test('stockage bloqué : le choix reste mémorisé pendant la session sans exception', () => {
  const localStorage = { getItem() { throw Error('bloqué'); }, setItem() { throw Error('bloqué'); } };
  const preference = charger('src/utils/preferenceIntroductionVideo.ts', { localStorage });
  assert.equal(preference.introductionVideoTraitee(), false);
  assert.doesNotThrow(() => preference.memoriserIntroductionVideo());
  assert.equal(preference.introductionVideoTraitee(), true);
});

test('accueil : accès au compte sous la vidéo, puis action adaptée à la session', () => {
  let estConnecte = false;
  const fr = JSON.parse(fs.readFileSync(path.join(__dirname, '../src/i18n/locales/fr.json'), 'utf8'));
  const { AccueilPage } = charger('src/pages/AccueilPage.tsx', {}, {
    'react-i18next': { useTranslation: () => ({ t: cle => cle.split('.').reduce((obj, segment) => obj?.[segment], fr) ?? cle }) },
    '../context/AuthContext': { useAuth: () => ({ estConnecte, user: null }) },
    '../hooks/useMoi': { useMoi: () => ({ moi: null, chargement: false, rafraichir() {} }) },
    '../components/BadgeStreak': { BadgeStreak: () => null },
    '../components/JaugeChristos': { JaugeChristos: () => null },
    '../components/IntroVideo': { IntroVideo: props => React.createElement('video', { 'data-affichage': props.affichage }) },
  });
  const rendu = proposerVideo => renderToStaticMarkup(React.createElement(StaticRouter, { location: '/' },
    React.createElement(AccueilPage, { proposerVideo, onIntroductionTraitee() {} })));
  const initial = rendu(true);
  assert.ok(initial.includes('Découvrir CHRISTOSMETRICS en vidéo'));
  assert.ok(initial.includes('href="/inscription"'));
  assert.ok(initial.includes('href="/connexion"'));
  assert.ok(initial.includes('Créer mon compte'));
  assert.ok(initial.indexOf('accueil-actions-compte') > initial.indexOf('<video'));
  assert.ok(!initial.includes('etapes-parcours'));
  assert.ok(initial.includes('<video data-affichage="integre"'));
  const suivant = rendu(false);
  assert.ok(!suivant.includes('>Passer<'));
  assert.ok(!suivant.includes('Voir la vidéo de présentation'));
  assert.ok(suivant.includes('href="/inscription"'));
  assert.ok(suivant.includes('href="/connexion"'));
  assert.ok(suivant.includes('<video data-affichage="integre"'));
  estConnecte = true;
  const connecte = rendu(false);
  assert.ok(connecte.includes('Continuer mon parcours'));
  assert.ok(connecte.includes('href="/menu"'));
  assert.ok(!connecte.includes('href="/inscription"'));
  assert.ok(!connecte.includes('href="/connexion"'));
  assert.ok(!connecte.includes('Voir la vidéo de présentation'));
});

test('notice publique : les quatre étapes restent disponibles dans chaque langue', () => {
  for (const langue of ['fr', 'en', 'es', 'pt']) {
    const textes = JSON.parse(fs.readFileSync(path.join(__dirname, `../src/i18n/locales/${langue}.json`), 'utf8'));
    const { NoticeUtilisationPage } = charger('src/pages/NoticeUtilisationPage.tsx', {}, {
      'react-i18next': { useTranslation: () => ({ t: cle => cle.split('.').reduce((obj, segment) => obj?.[segment], textes) ?? cle }) },
    });
    const html = renderToStaticMarkup(React.createElement(StaticRouter, { location: '/notice-utilisation' },
      React.createElement(NoticeUtilisationPage)));
    assert.equal((html.match(/<li>/g) ?? []).length, 4);
    assert.ok(html.includes(textes.navigation_entree.notice));
    assert.ok(html.includes('href="/"'));
    assert.ok(!html.includes('accueil.etapes.'));
  }
});
