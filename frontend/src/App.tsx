import { BrowserRouter, HashRouter, Routes, Route, Navigate, Link, useLocation } from 'react-router-dom';
import { Capacitor } from '@capacitor/core';
import { AuthProvider, useAuth } from './context/AuthContext';
import { LoginPage } from './pages/LoginPage';
import { MenuPage } from './pages/MenuPage';
import { QuestionnairePage } from './pages/QuestionnairePage';
import { ResultatPage } from './pages/ResultatPage';
import { MonParcoursPage } from './pages/MonParcoursPage';
import { ProfilPage } from './pages/ProfilPage';
import { SupprimerComptePage } from './pages/SupprimerComptePage';
import { PolitiqueConfidentialitePage } from './pages/PolitiqueConfidentialitePage';
import { ConditionsUtilisationPage } from './pages/ConditionsUtilisationPage';
import { StatusReseau } from './components/StatusReseau';
import { Footer } from './components/Footer';
import { BottomNav } from './components/BottomNav';
import { AccueilPage } from './pages/AccueilPage';
import { OnboardingPage } from './pages/OnboardingPage';
import { useEffect, useState, type ReactNode } from 'react';

function RetourEnHaut() {
  const { pathname, search } = useLocation();
  useEffect(() => { window.scrollTo(0, 0); }, [pathname, search]);
  return null;
}

/**
 * Racine de l'application.
 *
 * ROUTES :
 *   /            → présentation publique de l'application
 *   /connexion et /inscription → authentification
 *   /menu        → menu principal (protégé)
 *   /test/:code  → questionnaire d'un référentiel (protégé, avec REPRISE)
 *   /resultat/:id → restitution d'une passation (protégé)
 *
 * Le composant Protege redirige vers /login si la session n'est pas active.
 * Grâce à AuthProvider, la session est restaurée depuis localStorage au
 * démarrage → si le token est encore valide, l'utilisateur n'est PAS forcé de
 * se reconnecter et retrouve son état d'avancement.
 */
function Protege({ children }: { children: ReactNode }) {
  const { estConnecte, chargement } = useAuth();
  if (chargement) return <div className="wrap"><p>…</p></div>;
  if (!estConnecte) return <Navigate to="/connexion" replace />;
  return <>{children}</>;
}

function EntreeSiDeja({ inscription = false }: { inscription?: boolean }) {
  const { estConnecte, chargement } = useAuth();
  if (chargement) return <div className="wrap"><p>…</p></div>;
  return estConnecte ? <Navigate to="/menu" replace /> : <LoginPage key={String(inscription)} modeInitial={inscription ? 'inscription' : 'connexion'} />;
}

export function App() {
  const Router = Capacitor.isNativePlatform() ? HashRouter : BrowserRouter;
  return (
    <AuthProvider>
      <Router>
        <ContenuApp />
      </Router>
    </AuthProvider>
  );
}

/** Gère les routes, l’introduction initiale et les éléments masqués en mode immersif. */
function ContenuApp() {
  const { pathname } = useLocation();
  const { estConnecte, chargement } = useAuth();
  const [onboardingDone, setOnboardingDone] = useState(() => {
    try { return localStorage.getItem('onboarding-done') === 'true'; }
    catch { return false; }
  });
  const introduction = /^\/onboarding\/?$/i.test(pathname);
  const pagesSansFooter = /^\/(test\/[^/]+|onboarding)\/?$/i;
  const afficherFooter = !pagesSansFooter.test(pathname);
  const afficherBottomNav = estConnecte && afficherFooter;

  /** Retient aussi la fin de l’introduction en mémoire si localStorage est inaccessible. */
  function terminerIntroduction() {
    setOnboardingDone(true);
  }

  return (
    <div className={afficherBottomNav ? 'avec-bottom-nav' : undefined}>
        <RetourEnHaut />
        {!introduction && <Header />}
        <StatusReseau />
        <main className={introduction ? 'onboarding-main' : undefined}>
          <Routes>
            <Route path="/" element={chargement
              ? <div className="wrap" role="status">…</div>
              : onboardingDone || estConnecte ? <AccueilPage /> : <Navigate to="/onboarding" replace />} />
            <Route path="/onboarding" element={<OnboardingPage onTermine={terminerIntroduction} />} />
            <Route path="/connexion" element={<EntreeSiDeja />} />
            <Route path="/inscription" element={<EntreeSiDeja inscription />} />
            <Route path="/politique-confidentialite" element={<PolitiqueConfidentialitePage />} />
            <Route path="/conditions-utilisation" element={<ConditionsUtilisationPage />} />
            <Route path="/menu" element={<Protege><MenuPage /></Protege>} />
            <Route path="/test/:code" element={<Protege><QuestionnairePage /></Protege>} />
            <Route path="/resultat/:passationId" element={<Protege><ResultatPage /></Protege>} />
            <Route path="/mon-parcours" element={<Protege><MonParcoursPage /></Protege>} />
            <Route path="/profil" element={<Protege><ProfilPage /></Protege>} />
            <Route path="/supprimer-compte" element={<Protege><SupprimerComptePage /></Protege>} />
            <Route path="*" element={<Navigate to="/" replace />} />
          </Routes>
        </main>
        {afficherFooter && <Footer />}
        {afficherBottomNav && <BottomNav />}
    </div>
  );
}

/** Bandeau supérieur conforme au POC (logo officiel + baseline). */
function Header() {
  return (
    <header className="top">
      <div className="top-in">
        <Link to="/" aria-label="CHRISTOSMETRICS — Accueil"><img
          src="/christosmetrics-logo.png"
          alt="CHRISTOSMETRICS"
          className="brand-logo"
        /></Link>
        <span className="sig">Mesurer pour devenir Christ</span>
        <span className="spacer" />
        <span className="badge">{Capacitor.isNativePlatform() ? 'Mobile' : 'Web'}</span>
      </div>
    </header>
  );
}
