import { Link } from 'react-router-dom';
import { useTranslation } from 'react-i18next';

/** Traduit les liens juridiques et interpole l’année dans la signature de marque inchangée. */
export function Footer() {
  const { t } = useTranslation();
  const annee = new Date().getFullYear();
  return (
    <footer className="footer-global" role="contentinfo">
      <nav aria-label={t('footer.label')}>
        <Link to="/politique-confidentialite">{t('footer.politique')}</Link>
        <span aria-hidden="true"> · </span>
        <Link to="/conditions-utilisation">{t('footer.cgu')}</Link>
      </nav>
      <p className="footer-copyright">
        {t('footer.copyright', { annee })}
      </p>
    </footer>
  );
}
