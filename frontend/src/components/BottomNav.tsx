import { Link, useLocation } from 'react-router-dom';
import { useTranslation } from 'react-i18next';

const onglets = [
  {
    to: '/',
    label: 'navigation.accueil',
    icone: <><path d="m3 10 9-7 9 7v10a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1Z" /><path d="M9 21V12h6v9" /></>,
  },
  {
    to: '/menu',
    label: 'navigation.tests',
    icone: <><path d="M9 3h6M10 3v7l-6 9a2 2 0 0 0 1.7 3h12.6a2 2 0 0 0 1.7-3l-6-9V3" /><path d="M7 15h10" /></>,
  },
  {
    to: '/mon-parcours',
    label: 'navigation.parcours',
    icone: <><path d="M4 3v18h17M8 16v-5M13 16V7M18 16V4" /></>,
  },
  {
    to: '/profil',
    label: 'navigation.profil',
    icone: <><circle cx="12" cy="8" r="4" /><path d="M4 21v-2a8 8 0 0 1 16 0v2" /></>,
  },
];

/** Rend les quatre destinations avec leurs libellés traduits et leur état actif. */
export function BottomNav() {
  const { t } = useTranslation();
  const { pathname } = useLocation();

  return (
    <nav className="bottom-nav" aria-label={t('navigation.label')}>
      {onglets.map(onglet => (
        <Link
          key={onglet.to}
          to={onglet.to}
          className="bottom-nav__link"
          aria-current={pathname === onglet.to ? 'page' : undefined}
        >
          <svg
            width="24" height="24" viewBox="0 0 24 24" fill="none"
            stroke="currentColor" strokeWidth={1.5} strokeLinecap="round" strokeLinejoin="round"
            aria-hidden="true" focusable="false"
          >
            {onglet.icone}
          </svg>
          <span>{t(onglet.label)}</span>
        </Link>
      ))}
    </nav>
  );
}
