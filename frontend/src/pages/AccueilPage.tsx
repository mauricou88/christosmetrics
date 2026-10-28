import { Link } from 'react-router-dom';
import { useTranslation } from 'react-i18next';
import { useAuth } from '../context/AuthContext';
import { useMoi } from '../hooks/useMoi';
import { BadgeStreak } from '../components/BadgeStreak';
import { JaugeChristos } from '../components/JaugeChristos';

/** Présentation publique et progression personnelle pour le compte connecté. */
export function AccueilPage() {
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
      <div className="verse">
        {t('commun.verset')}
        <span>{t('commun.verset_ref')}</span>
      </div>

      <section className="card accueil-explications" aria-labelledby="fonctionnement">
        <h2 id="fonctionnement">{t('accueil.comment_ca_marche')}</h2>
        <ol className="etapes-parcours">
          <li><strong>{t('accueil.etapes.compte.titre')}</strong>{' '}{t('accueil.etapes.compte.description')}</li>
          <li><strong>{t('accueil.etapes.parcours.titre')}</strong>{' '}{t('accueil.etapes.parcours.description')}</li>
          <li><strong>{t('accueil.etapes.reponses.titre')}</strong>{' '}{t('accueil.etapes.reponses.description')}</li>
          <li><strong>{t('accueil.etapes.restitution.titre')}</strong>{' '}{t('accueil.etapes.restitution.description')}</li>
        </ol>
        <p className="hint">{t('accueil.aide')}</p>
      </section>

      <p className="accueil-fruits">
        <strong>{t('accueil.individuel_label')}</strong>{' '}{t('accueil.fruits_disponibles')}{' '}
        {t('accueil.fruits_a_concevoir')}
      </p>
      <div className="controls">
        {estConnecte ? (
          <Link className="btn sec" to="/menu">{t('accueil.cta_parcours')}</Link>
        ) : (
          <>
            <Link className="btn sec" to="/inscription">{t('accueil.cta_commencer')}</Link>
            <Link className="btn ghost" to="/connexion">{t('accueil.cta_connexion')}</Link>
          </>
        )}
      </div>
    </div>
  );
}
