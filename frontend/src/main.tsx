import ReactDOM from 'react-dom/client';
import { App } from './App';
import './styles.css';
import './i18n';

/**
 * Point d'entrée : monte l'App dans <div id="root"> de index.html.
 * Le démarrage reste simple afin de ne pas doubler les appels API en mode dev.
 */
// Applique la préférence de thème avant le premier rendu React.
try {
  const themePref = localStorage.getItem('theme-preference');
  if (themePref === 'light' || themePref === 'dark') {
    document.documentElement.setAttribute('data-theme', themePref);
  } else {
    document.documentElement.removeAttribute('data-theme');
  }
} catch {
  document.documentElement.removeAttribute('data-theme');
}

ReactDOM.createRoot(document.getElementById('root')!).render(
  <App />
);
