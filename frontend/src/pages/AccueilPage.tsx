import { Link } from 'react-router-dom';
import { useTranslation } from 'react-i18next';
import { useAuth } from '../context/AuthContext';
import { useMoi } from '../hooks/useMoi';
import { BadgeStreak } from '../components/BadgeStreak';
import { JaugeChristos } from '../components/JaugeChristos';
import { IntroVideo } from '../components/IntroVideo';

/** Présente la vidéo puis l’action principale : créer un compte, se connecter ou continuer son parcours. */
export function AccueilPage({ proposerVideo, onIntroductionTraitee }: {
  proposerVideo: boolean;
  onIntroductionTraitee: () => void;
}) {
  const { t } = useTranslation();
  const { estConnecte, user } = useAuth();
  const { moi, chargement, rafraichir } = useMoi();

  return (
    <div className="wrap accueil-page">
      {estConnecte && (
        <section className="accueil-progression" aria-label={t('progression.titre')}>
          <div className="progression-bonjour">
            <p>{t('commun.bonjour', { prenom: moi?.prenom ?? user?.prenom ?? '' })}</p>
            {moi && <BadgeStreak streakActuel={moi.streakActuel} streakRecord={moi.streakRecord} />}
          </div>
          {chargement ? <p className="hint progression-attente" role="status">{t('commun.chargement')}</p>
            : moi ? <JaugeChristos {...moi} variante="banniere" />
              : <p className="hint">{t('progression.indisponible')}{' '}<button type="button" className="btn ghost sm" onClick={() => { void rafraichir(); }}>{t('commun.reessayer')}</button></p>}
        </section>
      )}
      <div className="eyebrow">{t('accueil.eyebrow')}</div>
      <h1>{t('accueil.titre')}</h1>
      <p className="lede">{t('accueil.lede')}</p>
        <section className="card accueil-intro-video" aria-labelledby="accueil-intro-video-titre">
          <h2 id="accueil-intro-video-titre">{t('intro_video.decouvrir')}</h2>
          <IntroVideo affichage="integre" onLecture={onIntroductionTraitee} />
          {proposerVideo && <p className="hint">{t('intro_video.invitation')}</p>}
          <div className="accueil-actions-compte">
            {estConnecte ? (
              <Link className="btn" to="/menu" onClick={onIntroductionTraitee}>{t('accueil.cta_parcours')}</Link>
            ) : (
              <>
                <Link className="btn" to="/inscription" onClick={onIntroductionTraitee}>{t('accueil.cta_commencer')}</Link>
                <Link className="accueil-connexion" to="/connexion" onClick={onIntroductionTraitee}>{t('accueil.cta_connexion')}</Link>
              </>
            )}
          </div>
        </section>
      <div className="verse">
        {t('commun.verset')}
        <span>{t('commun.verset_ref')}</span>
      </div>

    </div>
  );
}
