import { Link } from 'react-router-dom';
import { useTranslation } from 'react-i18next';

/** Rassemble les instructions du parcours dans une notice publique accessible depuis le menu. */
export function NoticeUtilisationPage() {
  const { t } = useTranslation();
  const etapes = ['compte', 'parcours', 'reponses', 'restitution'] as const;

  return (
    <div className="wrap notice-utilisation">
      <Link className="lien-retour" to="/">{t('commun.presentation')}</Link>
      <h1>{t('navigation_entree.notice')}</h1>
      <section className="card" aria-labelledby="notice-fonctionnement">
        <h2 id="notice-fonctionnement">{t('accueil.comment_ca_marche')}</h2>
        <ol className="etapes-parcours">
          {etapes.map(etape => (
            <li key={etape}>
              <strong>{t(`accueil.etapes.${etape}.titre`)}</strong>{' '}
              {t(`accueil.etapes.${etape}.description`)}
            </li>
          ))}
        </ol>
        <p className="hint">{t('accueil.aide')}</p>
      </section>
      <p className="accueil-fruits">
        <strong>{t('accueil.individuel_label')}</strong>{' '}{t('accueil.fruits_disponibles')}{' '}
        {t('accueil.fruits_a_concevoir')}
      </p>
    </div>
  );
}
