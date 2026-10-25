import { Link } from 'react-router-dom';
import { useAuth } from '../context/AuthContext';

/** Présentation publique, avant le choix d'un parcours et l'authentification. */
export function AccueilPage() {
  const { estConnecte } = useAuth();

  return (
    <div className="wrap accueil-page">
      <div className="eyebrow">CHRISTOSMETRICS · Auto-diagnostic</div>
      <h1>Où en êtes-vous du fruit de l’Esprit ?</h1>
      <p className="lede">
        Prenez un temps pour faire le point sur votre cheminement chrétien.
        À partir de vos réponses, CHRISTOSMETRICS vous aide à reconnaître vos points forts
        et les domaines dans lesquels vous souhaitez grandir.
      </p>
      <div className="verse">
        « Mais le fruit de l’Esprit, c’est l’amour, la joie, la paix, la patience,
        la bonté, la bienveillance, la fidélité, la douceur, la maîtrise de soi. »
        <span>Galates 5.22</span>
      </div>

      <section className="card accueil-explications" aria-labelledby="fonctionnement">
        <h2 id="fonctionnement">Comment cela fonctionne ?</h2>
        <ol className="etapes-parcours">
          <li><strong>Créez votre compte ou connectez-vous.</strong> Retrouvez vos réponses et vos résultats dans votre espace personnel.</li>
          <li><strong>Choisissez Individuel ou Couple.</strong> Explorez un fruit en profondeur ou la dynamique de votre couple à travers les neuf fruits.</li>
          <li><strong>Répondez à votre rythme.</strong> Avec une connexion Internet, chaque réponse est sauvegardée. Vous pouvez vous arrêter et reprendre plus tard.</li>
          <li><strong>Découvrez votre restitution.</strong> Consultez vos scores, vos graphiques et votre PDF. Complétez les six tests individuels disponibles pour débloquer votre synthèse globale.</li>
        </ol>
        <p className="hint">Un support de réflexion personnelle fondé sur vos réponses, pour accompagner votre croissance spirituelle.</p>
      </section>

      <p className="accueil-fruits">
        <strong>En individuel :</strong> Amour, Joie, Paix, Patience, Bonté &amp; Bienveillance et Fidélité.
        Douceur et Maîtrise de soi sont à concevoir.
      </p>
      <div className="controls">
        {estConnecte ? (
          <Link className="btn sec" to="/menu">Retrouver mes parcours</Link>
        ) : (
          <>
            <Link className="btn sec" to="/inscription">Créer mon compte et commencer</Link>
            <Link className="btn ghost" to="/connexion">Se connecter</Link>
          </>
        )}
      </div>
    </div>
  );
}
