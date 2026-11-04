const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const ts = require('typescript');

const exportsAssistant = {};
vm.runInNewContext(ts.transpileModule(fs.readFileSync(path.join(__dirname, '../src/utils/assistantFruits.ts'), 'utf8'), {
  compilerOptions: { module: ts.ModuleKind.CommonJS, target: ts.ScriptTarget.ES2020 },
}).outputText, { exports: exportsAssistant });
const { reconnaitreSujetAssistant: sujet, referenceSujetAssistant: reference, SUJETS_ASSISTANT } = exportsAssistant;

test('toutes les questions préparées trouvent la bonne réponse dans les quatre langues', () => {
  let structure;
  for (const langue of ['fr', 'en', 'es', 'pt']) {
    const messages = JSON.parse(fs.readFileSync(path.join(__dirname, `../src/i18n/locales/${langue}.json`), 'utf8')).assistant_fruits;
    const cles = Object.keys(messages).sort();
    if (structure) assert.deepEqual(cles, structure);
    structure = cles;
    assert.deepEqual(Object.keys(messages.sujets).sort(), Array.from(SUJETS_ASSISTANT).sort());
    for (const id of SUJETS_ASSISTANT) {
      assert.ok(messages.sujets[id].reponse.length > 40);
      assert.equal(sujet(messages.sujets[id].question), id, `${langue}/${id}`);
    }
  }
});

test('accents, apostrophes et variantes de saisie sont reconnus', () => {
  for (const [question, attendu] of [
    ['C’est quoi le fruit de l’Esprit ?', 'definition'],
    ['LA FIDÉLITÉ', 'fidelite'], ['Como desenvolver domínio próprio?', 'maitrise'],
    ['What are the 9 fruits of the Spirit?', 'liste'], ['How can I grow in patience?', 'patience'],
    ['Comment développer la douceur ?', 'douceur'], ['Comment grandir spirituellement ?', 'croissance'],
    ['Bonjour !', 'bonjour'], ['Que signifie la bienveillance ?', 'bonte'],
  ]) assert.equal(sujet(question), attendu, question);
});

test('hors sujet et sous-chaînes ne produisent pas de réponse inventée', () => {
  for (const question of ['', '   ', 'Quelle météo demain ?', 'lovely', 'impatienceux', '<script>alert(1)</script>']) {
    assert.equal(sujet(question), null, question);
  }
});

test('les repères bibliques sont réservés aux sujets concernés', () => {
  assert.equal(reference('joie'), 'galates');
  assert.equal(reference('croissance'), 'jean');
  assert.equal(reference('tests'), null);
  assert.equal(reference(null), null);
});
