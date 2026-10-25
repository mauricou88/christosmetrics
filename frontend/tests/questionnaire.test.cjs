const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const ts = require('typescript');

// Exécute le hook avec des API contrôlées, sans modifier de réponses utilisateur.
function questionnaire({ reponses = {}, index = 0, complete = false, enregistrer, terminer } = {}) {
  const slots = [];
  let curseur = 0;
  const effets = [];
  const appels = { reponses: 0, terminaisons: 0 };
  const questions = Array.from({ length: 280 }, (_, i) => ({ id: i + 1, texte: `Question ${i + 1}` }));
  const react = {
    useState(initial) {
      const k = curseur++;
      if (!(k in slots)) slots[k] = initial;
      return [slots[k], valeur => { slots[k] = typeof valeur === 'function' ? valeur(slots[k]) : valeur; }];
    },
    useRef(initial) {
      const k = curseur++;
      if (!(k in slots)) slots[k] = { current: initial };
      return slots[k];
    },
    useEffect(effet, deps) {
      const k = curseur++;
      if (!slots[k] || deps.some((d, i) => d !== slots[k][i])) { slots[k] = deps; effets.push(effet); }
    },
    useCallback: fn => fn,
  };
  const api = {
    demarrerOuReprendre: async () => ({ passationId: 7, reponses, indexProchaineQuestion: index, complete }),
    repondre: async (...args) => { appels.reponses++; return enregistrer ? enregistrer(...args) : { reponses: { ...reponses, [args[1]]: args[2] } }; },
    terminer: async id => { appels.terminaisons++; return terminer ? terminer(id) : { passationId: id }; },
  };
  const code = ts.transpileModule(fs.readFileSync(path.join(__dirname, '../src/hooks/useQuestionnaire.ts'), 'utf8'), {
    compilerOptions: { module: ts.ModuleKind.CommonJS, target: ts.ScriptTarget.ES2020 },
  }).outputText;
  const exports = {};
  vm.runInNewContext(code, { exports, require: nom => {
    if (nom === 'react') return react;
    if (nom === '../api/passations') return api;
    if (nom === '../api/referentiels') return { chargerReferentiel: async () => ({ code: 'amour', dimensions: [{ questions }] }) };
    throw new Error(nom);
  } });
  function rendre() {
    curseur = 0;
    const etat = exports.useQuestionnaire('amour');
    effets.splice(0).forEach(e => e());
    return etat;
  }
  return { rendre, appels, async charger() { rendre(); await new Promise(resolve => setImmediate(resolve)); return rendre(); } };
}
const toutes = Object.fromEntries(Array.from({ length: 280 }, (_, i) => [i + 1, 4]));

test('reprise Amour à 280/280 : dernière question et finalisation accessible', async () => {
  const h = questionnaire({ reponses: toutes, complete: true, index: -1 });
  const etat = await h.charger();
  assert.equal(etat.indexCourant, 279);
  assert.equal(etat.complet, true);
  assert.equal(etat.estDerniere, true);
  assert.equal((await etat.finaliser()).passationId, 7);
});
test('double clic : une sauvegarde et aucune question sautée', async () => {
  let liberer;
  const h = questionnaire({ enregistrer: () => new Promise(resolve => { liberer = resolve; }) });
  const etat = await h.charger();
  const premier = etat.repondre(4);
  await etat.repondre(5);
  assert.equal(h.appels.reponses, 1);
  assert.equal(h.rendre().enregistrement, true);
  liberer({ reponses: { 1: 4 } });
  await premier;
  assert.equal(h.rendre().indexCourant, 1);
  assert.equal(h.rendre().nbRepondues, 1);
});
test('dernière réponse : attendre la sauvegarde, puis finaliser à 280/280', async () => {
  const partielles = { ...toutes }; delete partielles[280];
  let liberer;
  const h = questionnaire({ reponses: partielles, index: 279,
    enregistrer: () => new Promise(resolve => { liberer = resolve; }) });
  const etat = await h.charger();
  assert.equal(etat.complet, false);
  const sauvegarde = etat.repondre(4);
  await assert.rejects(etat.finaliser(), /attendre/);
  liberer({ reponses: toutes });
  await sauvegarde;
  const fini = h.rendre();
  assert.equal(fini.nbRepondues, 280);
  assert.equal(fini.complet, true);
  await fini.finaliser();
  assert.equal(h.appels.terminaisons, 1);
});
test('une réponse antérieure manquante peut être retrouvée depuis la fin', async () => {
  const partielles = { ...toutes }; delete partielles[25];
  const h = questionnaire({ reponses: partielles, index: 279 });
  const etat = await h.charger();
  assert.equal(etat.complet, false);
  etat.allerPremiereSansReponse();
  assert.equal(h.rendre().indexCourant, 24);
});
test('échec réseau : conserver le questionnaire et permettre une nouvelle réponse', async () => {
  let panne = true;
  const h = questionnaire({ enregistrer: async () => { if (panne) throw new Error('Réseau indisponible'); return { reponses: { 1: 4 } }; } });
  const etat = await h.charger();
  await etat.repondre(4);
  assert.match(h.rendre().erreur, /Réseau/);
  assert.equal(h.rendre().indexCourant, 0);
  assert.ok(h.rendre().referentiel);
  panne = false;
  await h.rendre().repondre(4);
  assert.equal(h.rendre().erreur, null);
  assert.equal(h.rendre().indexCourant, 1);
});
test('échec de finalisation : réponses conservées et nouvelle tentative possible', async () => {
  let panne = true;
  const h = questionnaire({ reponses: toutes, complete: true, index: -1,
    terminer: async id => { if (panne) throw new Error('Serveur indisponible'); return { passationId: id }; } });
  await h.charger();
  await assert.rejects(h.rendre().finaliser(), /Serveur/);
  assert.equal(h.rendre().finalisation, false);
  assert.equal(h.rendre().nbRepondues, 280);
  panne = false;
  assert.equal((await h.rendre().finaliser()).passationId, 7);
});
