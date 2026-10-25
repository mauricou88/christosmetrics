import { useParams, useNavigate } from 'react-router-dom';
import { useQuestionnaire } from '../hooks/useQuestionnaire';

/**
 * Page QUESTIONNAIRE — affiche une question à la fois avec l'échelle Likert.
 *
 * La REPRISE est transparente : le hook useQuestionnaire démarre le test si
 * l'utilisateur ne l'a jamais commencé, ou reprend là où il s'était arrêté.
 * Chaque réponse est envoyée au serveur AVANT de passer à la question
 * suivante : en cas de fermeture d'onglet ou de déconnexion, aucune donnée
 * n'est perdue.
 *
 * L'échelle affichée est adaptée au type de référentiel :
 *   - INDIVIDUEL : 5 niveaux (Jamais → Presque toujours)
 *   - COUPLE     : 4 niveaux (Jamais → Toujours)
 */
const ECHELLE_INDIVIDUEL = [
  { libelle: 'Jamais', valeur: 1 },
  { libelle: 'Rarement', valeur: 2 },
  { libelle: 'Parfois', valeur: 3 },
  { libelle: 'Souvent', valeur: 4 },
  { libelle: 'Presque toujours', valeur: 5 },
];
const ECHELLE_COUPLE = [
  { libelle: 'Jamais', valeur: 1 },
  { libelle: 'Rarement', valeur: 2 },
  { libelle: 'Souvent', valeur: 3 },
  { libelle: 'Toujours', valeur: 4 },
];

export function QuestionnairePage() {
  const { code } = useParams<{ code: string }>();
  const navigate = useNavigate();
  const {
    referentiel, questionCourante, indexCourant, total,
    reponses, chargement, erreur, nbRepondues, complet, progression,
    enregistrement, finalisation, premiereSansReponse, allerPremiereSansReponse,
    repondre, precedent, finaliser, estDerniere,
  } = useQuestionnaire(code!);

  if (chargement) return <div className="wrap"><p>Chargement du questionnaire…</p></div>;
  if (erreur && !referentiel) return (
    <div className="wrap">
      <p className="hint" role="alert" style={{ color: '#d45219' }}>{erreur}</p>
      <div className="controls">
        <button className="btn" onClick={() => window.location.reload()}>Réessayer</button>
        <button className="btn ghost" onClick={() => navigate('/menu?vue=individuel')}>Retour aux fruits</button>
      </div>
    </div>
  );
  if (!referentiel || !questionCourante) return <div className="wrap"><p>Aucune question disponible.</p></div>;

  const echelle = referentiel.type === 'COUPLE' ? ECHELLE_COUPLE : ECHELLE_INDIVIDUEL;
  const dejaRepondu = reponses[questionCourante.id];
  const occupe = enregistrement || finalisation;

  // Trouver la dimension dont fait partie la question courante (pour l'affichage).
  const dimensionCourante = referentiel.dimensions.find(
    d => d.questions.some(q => q.id === questionCourante.id)
  );

  async function terminer() {
    try {
      const resultat = await finaliser();
      // Redirige vers la page résultats en passant l'id de passation.
      navigate(`/resultat/${resultat.passationId}`);
    } catch { /* Le hook conserve le questionnaire et affiche l'erreur pour réessayer. */ }
  }

  return (
    <div className="wrap">
      {/* Barre de progression */}
      <div className="rail"><i style={{ width: `${progression}%` }} /></div>
      <div className="pcount">Question {indexCourant + 1} sur {total}</div>
      <p className="hint" role="status">{nbRepondues} réponse(s) enregistrée(s) sur {total}{enregistrement ? ' · Sauvegarde en cours…' : ''}</p>

      {dimensionCourante && (
        <div className="qhead">
          <span className="eyebrow">{referentiel.nom}</span>
          <div className="sec">{dimensionCourante.libelle}</div>
        </div>
      )}

      <div className="q answered" style={{ marginTop: 20 }}>
        <span className="t"><strong>Q{indexCourant + 1}.</strong> {questionCourante.texte}</span>
        <div className="opts" style={{
          gridTemplateColumns: `repeat(${echelle.length}, 1fr)`,
        }}>
          {echelle.map(e => (
            <button key={e.valeur}
                    className={`opt ${dejaRepondu === e.valeur ? 'selected' : ''}`}
                    disabled={occupe}
                    onClick={() => repondre(e.valeur)}>
              {e.libelle}
            </button>
          ))}
        </div>
      </div>

      {erreur && <p className="hint" role="alert" style={{ color: '#d45219' }}>{erreur} Vous pouvez réessayer.</p>}
      {estDerniere && !complet && !occupe && (
        <p className="hint">Pour terminer, toutes les réponses doivent être enregistrées. Sélectionnez votre réponse à cette question.</p>
      )}
      {estDerniere && premiereSansReponse >= 0 && premiereSansReponse !== indexCourant && (
        <button className="btn ghost" disabled={occupe} onClick={allerPremiereSansReponse}>Revenir à la première réponse manquante</button>
      )}

      <div className="controls">
        <button className="btn ghost" onClick={precedent} disabled={indexCourant === 0 || occupe}>
          ← Question précédente
        </button>
        {(estDerniere || complet) && (
          <button className="btn sec" onClick={terminer}
                  disabled={!complet || occupe}>
            {finalisation ? 'Calcul de votre restitution…' : 'Terminer et voir ma restitution'}
          </button>
        )}
        <button className="btn ghost sm" disabled={occupe} onClick={() => navigate(referentiel.type === 'INDIVIDUEL' ? '/menu?vue=individuel' : '/menu')}>
          Reprendre plus tard
        </button>
      </div>
      <p className="hint" style={{ marginTop: 10 }}>
        💾 Chaque réponse est sauvegardée automatiquement. Vous pouvez fermer l'onglet et reprendre plus tard.
      </p>
    </div>
  );
}
