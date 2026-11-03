const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const ts = require('typescript');
const React = require('react');
const { renderToStaticMarkup } = require('react-dom/server');
const { StaticRouter } = require('react-router-dom/server');

function chargerMenu(etat, actions = {}) {
  const source = fs.readFileSync(path.join(__dirname, '../src/components/MenuEntree.tsx'), 'utf8');
  const exports = {};
  const imports = {
    'react-router-dom': { ...require('react-router-dom'), useNavigate: () => actions.navigate ?? (() => {}) },
    'react-i18next': { useTranslation: () => ({ t: cle => cle, i18n: actions.i18n ?? { resolvedLanguage: 'fr', changeLanguage: async () => {} } }) },
    '../context/AuthContext': { useAuth: () => ({ ...etat, deconnexion: actions.deconnexion ?? (() => {}) }) },
  };
  vm.runInNewContext(ts.transpileModule(source, {
    compilerOptions: { module: ts.ModuleKind.CommonJS, target: ts.ScriptTarget.ES2020, jsx: ts.JsxEmit.ReactJSX },
  }).outputText, { exports, require: nom => imports[nom] ?? require(nom), localStorage: actions.stockage });
  return exports.MenuEntree;
}

test('visiteur : inscription et connexion, sans déconnexion', () => {
  const Menu = chargerMenu({ estConnecte: false, chargement: false });
  const html = renderToStaticMarkup(React.createElement(StaticRouter, { location: '/' }, React.createElement(Menu)));
  assert.ok(html.includes('href="/inscription"'));
  assert.ok(html.includes('href="/connexion"'));
  assert.ok(html.includes('<details'));
  assert.ok(html.includes('<summary class="btn ghost sm" aria-label="navigation_entree.menu"'));
  assert.ok(html.includes('<svg'));
  assert.ok(!html.includes('>navigation_entree.menu<'));
  assert.ok(html.includes('href="/notice-utilisation"'));
  assert.ok(!html.includes('commun.deconnexion'));
});

test('session connectée : accès au parcours et déconnexion vers l’accueil', () => {
  const appels = [];
  const Menu = chargerMenu({ estConnecte: true, chargement: false }, {
    deconnexion: () => appels.push('deconnexion'), navigate: (url, options) => appels.push([url, options.replace]),
  });
  const element = Menu();
  const nav = React.Children.toArray(element.props.children).find(child => child.type === 'nav');
  const fragment = React.Children.toArray(nav.props.children).find(child => child.type === React.Fragment);
  const bouton = React.Children.toArray(fragment.props.children).find(child => child.type === 'button');
  bouton.props.onClick();
  assert.deepEqual(appels, ['deconnexion', ['/', true]]);
  const html = renderToStaticMarkup(React.createElement(StaticRouter, { location: '/menu' }, element));
  assert.ok(html.includes('href="/menu"'));
  assert.ok(html.includes('aria-current="page"'));
  assert.ok(!html.includes('href="/inscription"'));
});

test('restauration de session : aucun mauvais bouton affiché brièvement', () => {
  assert.equal(chargerMenu({ estConnecte: false, chargement: true })(), null);
});

test('langues disponibles sans compte : anglais régional reconnu et sélection accessible', () => {
  const Menu = chargerMenu({ estConnecte: false, chargement: false }, {
    i18n: { resolvedLanguage: 'en-GB' },
  });
  const html = renderToStaticMarkup(React.createElement(StaticRouter, { location: '/' }, React.createElement(Menu)));
  assert.match(html, /lang="en"[^>]*aria-pressed="true"[^>]*aria-label="English"/);
  assert.match(html, /lang="fr"[^>]*aria-pressed="false"[^>]*aria-label="Français"/);
  assert.ok(html.includes('data-drapeau="france"'));
  assert.ok(html.includes('data-drapeau="usa"'));
  assert.ok(html.includes('</svg> FR'));
  assert.ok(html.includes('</svg> EN'));
});

test('choix de langue : changement immédiat et préférence mémorisée', async () => {
  const appels = [];
  const Menu = chargerMenu({ estConnecte: false, chargement: false }, {
    i18n: { resolvedLanguage: 'fr', changeLanguage: async code => appels.push(['langue', code]) },
    stockage: { setItem: (cle, valeur) => appels.push([cle, valeur]) },
  });
  const nav = React.Children.toArray(Menu().props.children).find(child => child.type === 'nav');
  const selecteur = React.Children.toArray(nav.props.children).find(child => child.type === 'fieldset');
  const choix = React.Children.toArray(selecteur.props.children).find(child => child.type === 'div');
  const anglais = React.Children.toArray(choix.props.children).find(child => child.props.lang === 'en');
  anglais.props.onClick();
  await new Promise(resolve => setImmediate(resolve));
  assert.deepEqual(appels, [['langue', 'en'], ['langue-preference', 'en']]);
});
