const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const ts = require('typescript');
const React = require('react');
const { renderToStaticMarkup } = require('react-dom/server');
const { StaticRouter } = require('react-router-dom/server');

function charger(source, imports = {}) {
  const code = ts.transpileModule(fs.readFileSync(path.join(__dirname, '..', source), 'utf8'), {
    compilerOptions: { module: ts.ModuleKind.CommonJS, target: ts.ScriptTarget.ES2020, jsx: ts.JsxEmit.ReactJSX },
  }).outputText;
  const exports = {};
  vm.runInNewContext(code, { exports, require: nom => imports[nom] ?? require(nom) });
  return exports;
}

const parcours = charger('src/utils/parcours.ts');
const { SyntheseFruits } = charger('src/components/SyntheseFruits.tsx', {
  '../utils/parcours': parcours,
  './Graphes': { RadarPortrait: () => React.createElement('div', { 'data-synthese-radar': true }) },
});
const codes = ['amour', 'joie', 'paix', 'patience', 'bonte', 'fidelite'];
const referentiels = codes.map((code, index) => ({ id: index + 1, code, nom: code, type: 'INDIVIDUEL' }));
const passation = (code, overrides = {}) => ({
  referentielCode: code, passationId: 42, etat: 'TERMINEE', type: 'INDIVIDUEL',
  scoreGlobal: 52, scoreGlobalArrondi: 52, debuteeLe: '2026-10-24T10:00:00Z', ...overrides,
});
const rendu = (passations, complet = false) => renderToStaticMarkup(React.createElement(StaticRouter, null,
  React.createElement(SyntheseFruits, { referentiels, synthese: {
    passations, complet, nbTestsAttendus: 6,
    nbTestsRealises: passations.filter(p => p.etat === 'TERMINEE').length,
    scoreGlobalArrondi: complet ? 52 : null,
  } })));

test('ordre du POC, couple exclu et catalogue source conserve', () => {
  const catalogue = [...referentiels].reverse().concat({ code: 'couple', nom: 'Couple', type: 'COUPLE' });
  const original = JSON.stringify(catalogue);
  assert.deepEqual(Array.from(parcours.referentielsIndividuels(catalogue), r => r.code), codes);
  assert.equal(JSON.stringify(catalogue), original);
});
test('une restitution terminee reste accessible devant un nouveau test en cours', () => {
  const terminee = passation('joie');
  const enCours = passation('joie', { etat: 'EN_COURS', debuteeLe: '2026-10-25T10:00:00Z' });
  const selection = parcours.passationPourFruit([enCours, terminee], 'joie');
  assert.equal(selection, terminee);
  assert.equal(parcours.destinationFruit('joie', selection), '/resultat/42');
});
test('le dernier resultat est choisi, un questionnaire en cours se reprend', () => {
  const recent = passation('joie', { passationId: 44, debuteeLe: '2026-10-25T10:00:00Z' });
  assert.equal(parcours.passationPourFruit([passation('joie'), recent], 'joie'), recent);
  assert.equal(parcours.destinationFruit('paix', passation('paix', { etat: 'EN_COURS' })), '/test/paix');
});
test('0/6 : six fruits non testes, sans synthese globale prematuree', () => {
  const html = rendu([]);
  assert.match(html, /Vos tests effectués \(0\/6\)/);
  assert.equal((html.match(/non testé/g) || []).length, 6);
  assert.match(html, /les 6 tests restants/);
  assert.doesNotMatch(html, /data-synthese-radar/);
});
test('1/6 : score de Joie et lien vers la restitution, cinq tests restants', () => {
  const html = rendu([passation('joie')]);
  assert.match(html, /Vos tests effectués \(1\/6\)/);
  assert.match(html, /52%/);
  assert.match(html, /href="\/resultat\/42"/);
  assert.match(html, /les 5 tests restants/);
});
test('un score de zero reste affiche, un test en cours ne compte pas comme termine', () => {
  const html = rendu([passation('amour', { scoreGlobal: 0, scoreGlobalArrondi: 0 }),
    passation('paix', { etat: 'EN_COURS', scoreGlobal: null, scoreGlobalArrondi: null })]);
  assert.match(html, /0%/);
  assert.match(html, /En cours/);
  assert.match(html, /\(1\/6\)/);
});
test('6/6 : synthese et radar visibles seulement apres tous les tests', () => {
  const html = rendu(codes.map(code => passation(code)), true);
  assert.match(html, /\(6\/6\)/);
  assert.match(html, /Votre synthèse globale/);
  assert.match(html, /data-synthese-radar/);
  assert.doesNotMatch(html, /tests restants/);
});
