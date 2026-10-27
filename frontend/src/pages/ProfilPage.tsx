import { useEffect, useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { useAuth } from '../context/AuthContext';
import { version } from '../../package.json';

type ThemePref = 'light' | 'dark' | 'auto';

export function ProfilPage() {
  const { user, deconnexion } = useAuth();
  const navigate = useNavigate();
  const [themePref, setThemePref] = useState<ThemePref>(() => {
    try {
      const preference = localStorage.getItem('theme-preference');
      return preference === 'light' || preference === 'dark' ? preference : 'auto';
    } catch {
      return 'auto';
    }
  });

  useEffect(() => {
    if (themePref === 'auto') {
      document.documentElement.removeAttribute('data-theme');
    } else {
      document.documentElement.setAttribute('data-theme', themePref);
    }
    try {
      localStorage.setItem('theme-preference', themePref);
    } catch {
      // Le choix reste actif pour cette session si le stockage est inaccessible.
    }
  }, [themePref]);

  function handleDeconnexion() {
    deconnexion();
    navigate('/', { replace: true });
  }

  return (
    <div className="wrap profil-page">
      <div>
        <div className="eyebrow">CHRISTOSMETRICS · Mon espace</div>
        <h1>Profil</h1>
        <p className="lede">Bonjour {user?.prenom}</p>
      </div>

      <section className="card" aria-labelledby="profil-theme">
        <h2 id="profil-theme">Thème</h2>
        <p className="hint" id="profil-theme-aide">Choisissez l’apparence de l’application. Automatique suit le thème de votre appareil.</p>
        <fieldset className="theme-choices" aria-labelledby="profil-theme" aria-describedby="profil-theme-aide">
          {([
            { value: 'light', label: 'Clair ☀️' },
            { value: 'dark', label: 'Sombre 🌙' },
            { value: 'auto', label: 'Automatique ⚙️' },
          ] as const).map(opt => (
            <label
              key={opt.value}
              className={themePref === opt.value ? 'theme-choice theme-choice--active' : 'theme-choice'}
            >
              <input
                type="radio"
                name="theme-preference"
                value={opt.value}
                checked={themePref === opt.value}
                onChange={() => setThemePref(opt.value)}
              />
              {opt.label}
            </label>
          ))}
        </fieldset>
      </section>

      <section className="card" aria-labelledby="profil-compte">
        <h2 id="profil-compte">Compte</h2>
        <p className="profil-identite">
          <strong>{user?.prenom} {user?.nom}</strong><br />
          <span>{user?.email}</span>
        </p>
        <div className="controls">
          <button type="button" className="btn" onClick={handleDeconnexion}>Se déconnecter</button>
          <Link to="/supprimer-compte" className="btn ghost">Supprimer mon compte</Link>
        </div>
      </section>

      <section className="card" aria-labelledby="profil-apropos">
        <h2 id="profil-apropos">À propos</h2>
        <p className="hint">CHRISTOSMETRICS · Version {version}</p>
        <div className="profil-liens">
          <Link to="/politique-confidentialite">Politique de confidentialité</Link>
          <Link to="/conditions-utilisation">Conditions d’utilisation</Link>
        </div>
      </section>
    </div>
  );
}
