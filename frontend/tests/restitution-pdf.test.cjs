const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const ts = require('typescript');

function charger(fichier, supplement = '', imports = {}) {
  const source = fs.readFileSync(path.join(__dirname, '..', fichier), 'utf8') + supplement;
  const exports = {};
  vm.runInNewContext(ts.transpileModule(source, {
    compilerOptions: { module: ts.ModuleKind.CommonJS, target: ts.ScriptTarget.ES2020 },
  }).outputText, { exports, Blob, atob, Uint8Array, require: nom => imports[nom] ?? require(nom) });
  return exports;
}
const { donneesRestitutionPdf } = charger('src/utils/donneesRestitutionPdf.ts');
const noms = charger('src/utils/nomRestitutionPdf.ts');
const moteur = charger('src/utils/pdfGenerator.ts', '\nexports.miniPDF = MiniPDF; exports.visages = dessinerVisagesPDF;', { './nomRestitutionPdf': noms });
const seed = fs.readFileSync(path.join(__dirname, '../../backend/src/main/resources/db/migration/V5__baremes_interpretation_poc.sql'), 'utf8');

function resultat(code, score) {
  const expression = new RegExp("\\(\\(SELECT id FROM referentiels WHERE code='" + code + "'\\),\\d+,(\\d+),(\\d+),'((?:''|[^'])*)','(TRISTE|NEUTRE|CONTENT)',(\\d+)\\)", 'g');
  const bareme = Array.from(seed.matchAll(expression), m => ({
    min: Number(m[1]), max: Number(m[2]), texte: m[3].replace(/''/g, "'"),
    typeIcone: m[4], nombreIcones: Number(m[5]), active: score >= Number(m[1]) && score <= Number(m[2]),
  }));
  assert.ok(bareme.length > 0);
  return {
    passationId: 1, referentielCode: code, referentielNom: code === 'paix' ? 'Paix' : code === 'joie' ? 'Joie' : 'Couple',
    type: code === 'couple' ? 'COUPLE' : 'INDIVIDUEL', unite: code === 'couple' ? 'POINTS_SUR_36' : 'POURCENTAGE',
    scoreGlobal: score, scoreGlobalArrondi: score, bareme,
    tranche: { ...bareme.find(t => t.active) },
    dimensions: ['En Dieu', 'Au quotidien', 'Avec les autres'].map(libelle => ({ libelle, libelleCourt: libelle, pourcentage: 70 })),
    top: [], flop: [],
  };
}
function generer(data) {
  const { fruitConfig, resultatPoc } = donneesRestitutionPdf(data);
  const evenements = [];
  const creer = moteur.miniPDF.creer;
  moteur.miniPDF.creer = () => {
    const doc = creer();
    for (const nom of ['text', 'rect', 'setDrawColor', 'circle']) {
      const original = doc[nom];
      doc[nom] = (...args) => { evenements.push({ nom, args }); return original(...args); };
    }
    return doc;
  };
  try {
    const pdf = moteur.genererRestitutionPdf(fruitConfig, resultatPoc, { prenom: 'Contrôle', nom: 'PDF', email: 'controle@example.test' });
    return { ...pdf, evenements };
  } finally { moteur.miniPDF.creer = creer; }
}

test('PDF : mêmes scores, textes, bornes et nombres de visages que le frontend', () => {
  const data = resultat('paix', 27);
  data.scoreGlobal = 27.4;
  const { fruitConfig, resultatPoc } = donneesRestitutionPdf(data);
  assert.equal(resultatPoc.globalAff, 27);
  assert.equal(resultatPoc.global, 27.4);
  assert.equal(resultatPoc.tranche, fruitConfig.bareme[1]);
  assert.deepEqual(Array.from(fruitConfig.bareme, t => t.faces), [1, 1, 1, 2, 3]);
  for (let i = 0; i < data.bareme.length; i++) assert.equal(fruitConfig.bareme[i].txt, data.bareme[i].texte);
});
test('nom exact du PDF : points de l’e-mail, accents du fruit et extension conservés', () => {
  assert.equal(noms.nomRestitutionPdf('Paix', 'massado.suzy@yahoo.com'), 'CHRISTOSMETRICS_Paix_massado.suzy_yahoo.com.pdf');
  assert.equal(noms.nomRestitutionPdf('Fidélité', 'maurice.mba.ulrich@gmail.com'), 'CHRISTOSMETRICS_Fidélité_maurice.mba.ulrich_gmail.com.pdf');
  assert.equal(generer(resultat('paix', 27)).nomFichier, 'CHRISTOSMETRICS_Paix_controle_example.test.pdf');
});
test('PDF : tranche active, visage et interprétation rouges ; autres lignes noires, fond blanc', () => {
  const { evenements } = generer(resultat('paix', 27));
  const lignes = evenements.filter(e => e.nom === 'text' && /^\d+ - \d+ %$/.test(e.args[0]));
  assert.equal(lignes.length, 5);
  assert.deepEqual(lignes.filter(e => e.args[3].gras).map(e => e.args[0]), ['20 - 39 %']);
  assert.deepEqual(Array.from(lignes[1].args[3].couleur), [255, 0, 0]);
  for (const ligne of lignes.filter(e => !e.args[3].gras)) assert.deepEqual(Array.from(ligne.args[3].couleur), [0, 0, 0]);
  const interpretation = evenements.find(e => e.nom === 'text' && Array.isArray(e.args[0]) && e.args[0].join(' ').includes('Plusieurs signes légers de Paix'));
  assert.equal(interpretation.args[3].gras, true);
  assert.deepEqual(Array.from(interpretation.args[3].couleur), [255, 0, 0]);
  const debutTableau = evenements.findIndex(e => e.nom === 'text' && e.args[0] === 'Score %');
  assert.equal(evenements.slice(debutTableau).filter(e => e.nom === 'rect' && e.args[4] === 'F').length, 0);
  let couleur;
  const visages = [];
  for (const evenement of evenements.slice(debutTableau)) {
    if (evenement.nom === 'setDrawColor') couleur = Array.from(evenement.args[0]);
    if (evenement.nom === 'circle' && evenement.args[3] === 'S') visages.push(couleur);
  }
  assert.equal(visages.filter(c => c.join(',') === '255,0,0').length, 1);
  assert.equal(visages.filter(c => c.join(',') === '0,0,0').length, 7);
});

test('PDF : une seule tranche rouge aux bornes de chaque intervalle de score', () => {
  for (const score of [0, 19, 20, 39, 40, 59, 60, 79, 80, 100]) {
    const data = resultat('paix', score);
    const { evenements } = generer(data);
    const lignesRouges = evenements.filter(e => e.nom === 'text' && /^\d+ - \d+ %$/.test(e.args[0]) && e.args[3].couleur.join(',') === '255,0,0');
    assert.equal(lignesRouges.length, 1);
    assert.equal(lignesRouges[0].args[0], `${data.tranche.min} - ${data.tranche.max} %`);
  }
});
test('PDF : un, deux ou trois visages selon le nombre fourni par le serveur', () => {
  for (const nombre of [1, 2, 3]) {
    let contours = 0;
    const doc = { setDrawColor() { return this; }, setLineWidth() { return this; },
      setFillColor() { return this; }, circle(x, y, r, mode) { if (mode === 'S') contours++; }, polyline() {} };
    moteur.visages(doc, 'content', 50, 50, [90, 107, 112], nombre);
    assert.equal(contours, nombre);
  }
});
test('PDF couple : score sur 36 et bornes sans pourcentage', () => {
  const { evenements } = generer(resultat('couple', 25));
  const textes = evenements.filter(e => e.nom === 'text').map(e => e.args[0]);
  assert.ok(textes.includes('Score / 36'));
  assert.ok(textes.includes('25 / 36'));
  assert.ok(!textes.includes('25 %'));
  assert.ok(!textes.some(t => typeof t === 'string' && /^\d+ - \d+ %$/.test(t)));
});
test('PDFs de contrôle générés avec le moteur réel pour la revue visuelle', async () => {
  for (const [code, score] of [['paix', 27], ['joie', 85]]) {
    const pdf = generer(resultat(code, score));
    const octets = Buffer.from(await pdf.blob.arrayBuffer());
    assert.equal(octets.subarray(0, 5).toString(), '%PDF-');
    if (process.env.PDF_QA_DIR) {
      fs.mkdirSync(process.env.PDF_QA_DIR, { recursive: true });
      fs.writeFileSync(path.join(process.env.PDF_QA_DIR, `${code}-controle.pdf`), octets);
    }
  }
});
