const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const ts = require('typescript');

function modulePdf({ plateforme = 'android', token = 'test-token', statut = 200, contenu = '%PDF-1.4\ncontrole', lecteurPdf = true } = {}) {
  const appels = { fetch: [], fichiers: [], partages: [], enregistrements: [], downloads: [] };
  class LecteurBlob {
    readAsDataURL(blob) {
      blob.arrayBuffer().then(octets => {
        this.result = 'data:application/pdf;base64,' + Buffer.from(octets).toString('base64');
        this.onloadend();
      });
    }
  }
  const imports = {
    '@capacitor/core': {
      Capacitor: { isNativePlatform: () => plateforme !== 'web', getPlatform: () => plateforme },
      registerPlugin: () => ({ enregistrer: async options => { appels.enregistrements.push(options); return { uri: 'content://document/pdf', ouvert: lecteurPdf }; } }),
    },
    '@capacitor/filesystem': {
      Directory: { Cache: 'CACHE' },
      Filesystem: { writeFile: async options => { appels.fichiers.push(options); return { uri: 'file:///cache/' + options.path }; } },
    },
    '@capacitor/share': { Share: { share: async options => { appels.partages.push(options); } } },
    '../api/client': { getToken: () => token },
  };
  const code = ts.transpileModule(fs.readFileSync(path.join(__dirname, '../src/utils/telechargementPdf.ts'), 'utf8'), {
    compilerOptions: { module: ts.ModuleKind.CommonJS, target: ts.ScriptTarget.ES2020 },
  }).outputText;
  const exports = {};
  vm.runInNewContext(code, {
    exports, require: nom => imports[nom], Blob, TextDecoder, FileReader: LecteurBlob,
    fetch: async (url, options) => {
      appels.fetch.push({ url, options });
      return { status: statut, blob: async () => new Blob([contenu], { type: 'application/pdf' }) };
    },
    URL: { createObjectURL: () => 'blob:pdf-local', revokeObjectURL() {} },
    document: { body: { appendChild() {} }, createElement: () => {
      const lien = { click() { appels.downloads.push({ href: this.href, download: this.download }); }, remove() {} };
      return lien;
    } },
    setTimeout: callback => callback(),
  });
  return { exports, appels };
}

test('Mon Parcours Android : authentification et ngrok, téléchargement et lecture locale', async () => {
  const { exports, appels } = modulePdf();
  const url = 'https://exemple.ngrok-free.dev/api/passations/42/pdf';
  const nom = 'CHRISTOSMETRICS_Paix_massado.suzy_yahoo.com.pdf';
  await exports.telechargerPdfServeur(url, nom);
  assert.equal(appels.fetch[0].url, url);
  assert.equal(appels.fetch[0].options.headers.Authorization, 'Bearer test-token');
  assert.equal(appels.fetch[0].options.headers['ngrok-skip-browser-warning'], 'true');
  assert.equal(appels.enregistrements.length, 1);
  assert.equal(appels.enregistrements[0].nomFichier, nom);
  assert.equal(Buffer.from(appels.enregistrements[0].base64, 'base64').toString(), '%PDF-1.4\ncontrole');
  assert.equal(appels.fichiers.length, 0);
  assert.equal(appels.partages.length, 0);
  assert.equal(appels.downloads.length, 0);
});
test('web : téléchargement du blob local, sans navigation vers ngrok', async () => {
  const { exports, appels } = modulePdf({ plateforme: 'web' });
  await exports.telechargerPdfServeur('https://exemple.ngrok-free.dev/api/passations/42/pdf', 'joie.pdf');
  assert.deepEqual(appels.downloads, [{ href: 'blob:pdf-local', download: 'joie.pdf' }]);
  assert.equal(appels.partages.length, 0);
});
test('session absente : aucun appel non authentifié', async () => {
  const { exports, appels } = modulePdf({ token: null });
  await assert.rejects(exports.telechargerPdfServeur('https://exemple.test/pdf', 'joie.pdf'), /reconnecter/);
  assert.equal(appels.fetch.length, 0);
});
test('401 : erreur visible, aucun faux fichier partagé', async () => {
  const { exports, appels } = modulePdf({ statut: 401 });
  await assert.rejects(exports.telechargerPdfServeur('https://exemple.test/pdf', 'joie.pdf'), /HTTP 401/);
  assert.equal(appels.partages.length, 0);
});
test('page HTML ngrok en HTTP 200 : rejet avant sauvegarde ou partage', async () => {
  const { exports, appels } = modulePdf({ contenu: '<html>Visit Site</html>' });
  await assert.rejects(exports.telechargerPdfServeur('https://exemple.test/pdf', 'joie.pdf'), /PDF valide/);
  assert.equal(appels.fichiers.length, 0);
  assert.equal(appels.partages.length, 0);
});
test('résultats Android : enregistrer et ouvrir aussi le PDF généré', async () => {
  const { exports, appels } = modulePdf();
  await exports.telechargerOuPartagerPdf(new Blob(['%PDF-1.4']), 'joie.pdf');
  assert.equal(appels.enregistrements.length, 1);
  assert.equal(appels.partages.length, 0);
});
test('aucun lecteur PDF : indiquer que le fichier est enregistré, sans faux succès de lecture', async () => {
  const { exports, appels } = modulePdf({ lecteurPdf: false });
  await assert.rejects(exports.telechargerPdfServeur('https://exemple.test/pdf', 'joie.pdf'), /enregistré dans Téléchargements/);
  assert.equal(appels.enregistrements.length, 1);
});
