import { Link } from 'react-router-dom';

export function Footer() {
  const annee = new Date().getFullYear();
  return (
    <footer className="footer-global" role="contentinfo">
      <nav aria-label="Liens juridiques">
        <Link to="/politique-confidentialite">Politique de confidentialité</Link>
        <span aria-hidden="true"> · </span>
        <Link to="/conditions-utilisation">Conditions d'utilisation</Link>
      </nav>
      <p className="footer-copyright">
        © {annee} Christosmetrics by LA
      </p>
    </footer>
  );
}
