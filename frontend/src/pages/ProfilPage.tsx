import { useEffect, useState, type KeyboardEvent } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { useTranslation } from 'react-i18next';
import { useAuth } from '../context/AuthContext';
import { version } from '../../package.json';

type ThemePref = 'light' | 'dark' | 'auto';
const langues = [
  { code: 'fr', label: '🇫🇷 Français' },
  { code: 'en', label: '🇬🇧 English' },
  { code: 'es', label: '🇪🇸 Español' },
  { code: 'pt', label: '🇵🇹 Português' },
] as const;
type Langue = typeof langues[number]['code'];

/** Présente le compte et les préférences de langue et de thème. */
export function ProfilPage() {
  const { t, i18n } = useTranslation();
  const langueActive = (i18n.resolvedLanguage ?? i18n.language ?? 'fr').split('-')[0];
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

  /** Applique la langue ; le stockage indisponible ne bloque pas le changement à l’écran. */
  async function changerLangue(code: Langue) {
    try {
      await i18n.changeLanguage(code);
      localStorage.setItem('langue-preference', code);
    } catch {
      // Le détecteur gère également la persistance lorsque le stockage est disponible.
    }
  }

  /** Permet de parcourir le groupe radio avec les flèches, Home et End. */
  function parcourirLangues(event: KeyboardEvent<HTMLButtonElement>, index: number) {
    let suivant: number;
    if (event.key === 'ArrowRight' || event.key === 'ArrowDown') suivant = (index + 1) % langues.length;
    else if (event.key === 'ArrowLeft' || event.key === 'ArrowUp') suivant = (index + langues.length - 1) % langues.length;
    else if (event.key === 'Home') suivant = 0;
    else if (event.key === 'End') suivant = langues.length - 1;
    else return;
    event.preventDefault();
    event.currentTarget.parentElement?.querySelectorAll<HTMLButtonElement>('[role="radio"]')[suivant]?.focus();
    void changerLangue(langues[suivant].code);
  }

  /** Ferme la session puis revient à l’accueil en conservant les préférences d’affichage. */
  function handleDeconnexion() {
    deconnexion();
    navigate('/', { replace: true });
  }

  return (
    <div className="wrap profil-page">
      <div>
        <div className="eyebrow">{t('profil.eyebrow')}</div>
        <h1>{t('profil.titre')}</h1>
        <p className="lede">{t('commun.bonjour', { prenom: user?.prenom ?? '' })}</p>
      </div>

      <section className="card" aria-labelledby="profil-langue">
        <h2 id="profil-langue">{t('profil.langue')}</h2>
        <div className="theme-choices" role="radiogroup" aria-labelledby="profil-langue">
          {langues.map((langue, index) => (
            <button
              key={langue.code}
              type="button"
              role="radio"
              lang={langue.code}
              aria-checked={langueActive === langue.code}
              tabIndex={langueActive === langue.code ? 0 : -1}
              className={langueActive === langue.code ? 'theme-choice theme-choice--active' : 'theme-choice'}
              onClick={() => { void changerLangue(langue.code); }}
              onKeyDown={event => parcourirLangues(event, index)}
            >
              {langue.label}
            </button>
          ))}
        </div>
      </section>

      <section className="card" aria-labelledby="profil-theme">
        <h2 id="profil-theme">{t('profil.theme')}</h2>
        <p className="hint" id="profil-theme-aide">{t('profil.theme_description')}</p>
        <fieldset className="theme-choices" aria-labelledby="profil-theme" aria-describedby="profil-theme-aide">
          {([
            { value: 'light', label: t('profil.theme_clair') },
            { value: 'dark', label: t('profil.theme_sombre') },
            { value: 'auto', label: t('profil.theme_auto') },
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
        <h2 id="profil-compte">{t('profil.compte')}</h2>
        <p className="profil-identite">
          <strong>{user?.prenom} {user?.nom}</strong><br />
          <span>{user?.email}</span>
        </p>
        <div className="controls">
          <button type="button" className="btn" onClick={handleDeconnexion}>{t('commun.deconnexion')}</button>
          <Link to="/supprimer-compte" className="btn ghost">{t('commun.supprimer_compte')}</Link>
        </div>
      </section>

      <section className="card" aria-labelledby="profil-apropos">
        <h2 id="profil-apropos">{t('profil.a_propos')}</h2>
        <p className="hint">{t('profil.version', { version })}</p>
        <div className="profil-liens">
          <Link to="/politique-confidentialite">{t('footer.politique')}</Link>
          <Link to="/conditions-utilisation">{t('footer.cgu')}</Link>
        </div>
      </section>
    </div>
  );
}
