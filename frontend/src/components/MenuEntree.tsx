import { NavLink, useNavigate } from 'react-router-dom';
import { useTranslation } from 'react-i18next';
import { useAuth } from '../context/AuthContext';

/** Dessine un vrai drapeau, même quand Windows ne prend pas en charge les emojis de pays. */
function DrapeauLangue({ code }: { code: 'fr' | 'en' }) {
  return (
    <svg className="menu-drapeau" data-drapeau={code === 'fr' ? 'france' : 'usa'}
      width="27" height="18" viewBox="0 0 30 20" aria-hidden="true" focusable="false">
      {code === 'fr' ? <>
        <path fill="#002395" d="M0 0h10v20H0z" />
        <path fill="#fff" d="M10 0h10v20H10z" />
        <path fill="#ED2939" d="M20 0h10v20H20z" />
      </> : <>
        <path fill="#fff" d="M0 0h30v20H0z" />
        {Array.from({ length: 7 }, (_, i) => (
          <rect key={`bande-${i}`} x="0" y={i * 40 / 13} width="30" height={20 / 13} fill="#B22234" />
        ))}
        <path fill="#3C3B6E" d="M0 0h12v10.77H0z" />
        {Array.from({ length: 9 }, (_, ligne) =>
          Array.from({ length: ligne % 2 === 0 ? 6 : 5 }, (_, colonne) => (
            <path key={`${ligne}-${colonne}`} fill="#fff"
              d="M0-.45.106-.146.428-.139.171.056.265.364 0 .18-.265.364-.171.056-.428-.139-.106-.146Z"
              transform={`translate(${1 + colonne * 2 + (ligne % 2)}, ${1 + ligne * 1.1})`} />
          )),
        )}
      </>}
    </svg>
  );
}

/** Présente les accès au compte selon la session, dès l’entrée dans l’application. */
export function MenuEntree() {
  const { t, i18n } = useTranslation();
  const langueActive = (i18n.resolvedLanguage ?? i18n.language ?? 'fr').split('-')[0];
  const { estConnecte, chargement, deconnexion } = useAuth();
  const navigate = useNavigate();

  /** Ferme la session et revient à l’accueil ; le contexte rétablit le français. */
  function quitterSession() {
    deconnexion();
    navigate('/', { replace: true });
  }

  /** Change la langue dès l’accueil et conserve le choix quand le stockage est disponible. */
  async function changerLangue(code: 'fr' | 'en') {
    await i18n.changeLanguage(code);
    try {
      localStorage.setItem('langue-preference', code);
    } catch {
      // Le choix reste actif sur la page même si le navigateur refuse la mémorisation.
    }
  }

  if (chargement) return null;

  return (
    <details className="menu-entree" onKeyDown={event => {
      if (event.key === 'Escape') {
        event.currentTarget.open = false;
        event.currentTarget.querySelector('summary')?.focus();
      }
    }}>
      <summary className="btn ghost sm" aria-label={t('navigation_entree.menu')} title={t('navigation_entree.menu')}>
        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor"
          strokeWidth="1.75" strokeLinecap="round" aria-hidden="true" focusable="false">
          <path d="M4 6h16M4 12h16M4 18h16" />
        </svg>
      </summary>
      <nav className="menu-entree-liste" aria-label={t('navigation_entree.label')} onClick={event => {
        if ((event.target as HTMLElement).closest('a, button:not([data-choix-langue])')) {
          event.currentTarget.closest('details')?.removeAttribute('open');
        }
      }}>
      <fieldset className="menu-entree-langues">
        <legend><span aria-hidden="true">🌐</span> {t('profil.langue')}</legend>
        <div className="menu-entree-langues-choix">
          <button type="button" lang="fr" data-choix-langue aria-pressed={langueActive === 'fr'}
            aria-label="Français" title="Français" onClick={() => { void changerLangue('fr'); }}>
            <DrapeauLangue code="fr" /> FR
          </button>
          <button type="button" lang="en" data-choix-langue aria-pressed={langueActive === 'en'}
            aria-label="English" title="English" onClick={() => { void changerLangue('en'); }}>
            <DrapeauLangue code="en" /> EN
          </button>
        </div>
      </fieldset>
      <NavLink className="menu-entree-item" to="/notice-utilisation">
        <span className="menu-entree-icone" aria-hidden="true">📖</span>
        <span>{t('navigation_entree.notice')}</span>
      </NavLink>
      {estConnecte ? (
        <>
          <NavLink className="menu-entree-item" to="/menu">
            <span className="menu-entree-icone" aria-hidden="true">🏡</span>
            <span>{t('navigation_entree.espace')}</span>
          </NavLink>
          <button type="button" className="menu-entree-item menu-entree-deconnexion" onClick={quitterSession}>
            <span className="menu-entree-icone" aria-hidden="true">🚪</span>
            <span>{t('commun.deconnexion')}</span>
          </button>
        </>
      ) : (
        <>
          <NavLink className="menu-entree-item" to="/inscription">
            <span className="menu-entree-icone" aria-hidden="true">✨</span>
            <span>{t('navigation_entree.inscription')}</span>
          </NavLink>
          <NavLink className="menu-entree-item" to="/connexion">
            <span className="menu-entree-icone" aria-hidden="true">🔑</span>
            <span>{t('navigation_entree.connexion')}</span>
          </NavLink>
        </>
      )}
      </nav>
    </details>
  );
}
