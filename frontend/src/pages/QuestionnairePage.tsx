import { useParams, useNavigate } from 'react-router-dom';
import { useTranslation } from 'react-i18next';
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
type Niveau = { libelle: string; valeur: number };
/** Construit l'echelle Likert dans la langue courante (lue via i18n). */
function echelleIndividuel(t: (k: string) => string): Niveau[] {
  return [
    { libelle: t('questionnaire.echelle.jamais'), valeur: 1 },
    { libelle: t('questionnaire.echelle.rarement'), valeur: 2 },
    { libelle: t('questionnaire.echelle.parfois'), valeur: 3 },
    { libelle: t('questionnaire.echelle.souvent'), valeur: 4 },
    { libelle: t('questionnaire.echelle.presque_toujours'), valeur: 5 },
  ];
}
function echelleCouple(t: (k: string) => string): Niveau[] {
  return [
    { libelle: t('questionnaire.echelle.jamais'), valeur: 1 },
    { libelle: t('questionnaire.echelle.rarement'), valeur: 2 },
    { libelle: t('questionnaire.echelle.souvent'), valeur: 3 },
    { libelle: t('questionnaire.echelle.toujours'), valeur: 4 },
  ];
}

export function QuestionnairePage() {
  const { code } = useParams<{ code: string }>();
  const navigate = useNavigate();
  const { t } = useTranslation();
  const {
    referentiel, questionCourante, indexCourant, total,
    reponses, chargement, erreur, nbRepondues, complet, progression,
    enregistrement, finalisation, premiereSansReponse, allerPremiereSansReponse,
    repondre, precedent, finaliser, estDerniere,
  } = useQuestionnaire(code!);

  if (chargement) return <div className="wrap"><p>{t('questionnaire.chargement')}</p></div>;
  if (erreur && !referentiel) return (
    <div className="wrap">
      <p className="hint" role="alert" style={{ color: '#d45219' }}>{erreur}</p>
      <div className="controls">
        <button className="btn" onClick={() => window.location.reload()}>{t('commun.reessayer')}</button>
        <button className="btn ghost" onClick={() => navigate('/menu?vue=individuel')}>{t('commun.retour')}</button>
      </div>
    </div>
  );
  if (!referentiel || !questionCourante) return <div className="wrap"><p>{t('questionnaire.aucune_question')}</p></div>;

  const echelle = referentiel.type === 'COUPLE' ? echelleCouple(t) : echelleIndividuel(t);
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
      <div className="pcount">{t('questionnaire.question_num', { num: indexCourant + 1, total })}</div>
      <p className="hint" role="status">{t('questionnaire.reponses_enregistrees', { nb: nbRepondues, total })}{enregistrement ? ` · ${t('questionnaire.sauvegarde_en_cours')}` : ''}</p>

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

      {erreur && <p className="hint" role="alert" style={{ color: '#d45219' }}>{erreur} {t('questionnaire.erreur_reessayer')}</p>}
      {estDerniere && !complet && !occupe && (
        <p className="hint">{t('questionnaire.pour_terminer')}</p>
      )}
      {estDerniere && premiereSansReponse >= 0 && premiereSansReponse !== indexCourant && (
        <button className="btn ghost" disabled={occupe} onClick={allerPremiereSansReponse}>{t('questionnaire.revenir_premiere_manquante')}</button>
      )}

      <div className="controls">
        <button className="btn ghost" onClick={precedent} disabled={indexCourant === 0 || occupe}>
          {t('questionnaire.question_precedente')}
        </button>
        {(estDerniere || complet) && (
          <button className="btn sec" onClick={terminer}
                  disabled={!complet || occupe}>
            {finalisation ? t('questionnaire.calcul_restitution') : t('questionnaire.terminer_voir_restitution')}
          </button>
        )}
        <button className="btn ghost sm" disabled={occupe} onClick={() => navigate(referentiel.type === 'INDIVIDUEL' ? '/menu?vue=individuel' : '/menu')}>
          {t('questionnaire.reprendre_plus_tard')}
        </button>
      </div>
      <p className="hint" style={{ marginTop: 10 }}>
        {t('questionnaire.sauvegarde_hint')}
      </p>
    </div>
  );
}
