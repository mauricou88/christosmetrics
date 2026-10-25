import ReactDOM from 'react-dom/client';
import { App } from './App';
import './styles.css';

/**
 * Point d'entrée : monte l'App dans <div id="root"> de index.html.
 * Le démarrage reste simple afin de ne pas doubler les appels API en mode dev.
 */
ReactDOM.createRoot(document.getElementById('root')!).render(
  <App />
);
