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

test('accueil : proposition facultative, aucun lecteur avant clic, bouton de relecture ensuite', () => {
  const fr = JSON.parse(fs.readFileSync(path.join(__dirname, '../src/i18n/locales/fr.json'), 'utf8'));
  const { AccueilPage } = charger('src/pages/AccueilPage.tsx', {}, {
    'react-i18next': { useTranslation: () => ({ t: cle => cle.split('.').reduce((obj, segment) => obj?.[segment], fr) ?? cle }) },
    '../context/AuthContext': { useAuth: () => ({ estConnecte: false, user: null }) },
    '../hooks/useMoi': { useMoi: () => ({ moi: null, chargement: false, rafraichir() {} }) },
    '../components/BadgeStreak': { BadgeStreak: () => null },
    '../components/JaugeChristos': { JaugeChristos: () => null },
    '../components/IntroVideo': { IntroVideo: () => React.createElement('video') },
  });
  const rendu = proposerVideo => renderToStaticMarkup(React.createElement(StaticRouter, { location: '/' },
    React.createElement(AccueilPage, { proposerVideo, onIntroductionTraitee() {} })));
  const initial = rendu(true);
  assert.ok(initial.includes('Découvrir CHRISTOSMETRICS en vidéo'));
  assert.ok(initial.includes('Passer'));
  assert.ok(initial.includes('href="/inscription"'));
  assert.ok(!initial.includes('<video'));
  const suivant = rendu(false);
  assert.ok(!suivant.includes('accueil-intro-video-titre'));
  assert.ok(suivant.includes('Voir la vidéo de présentation'));
  assert.ok(!suivant.includes('<video'));
});
