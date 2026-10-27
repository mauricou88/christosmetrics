import { Link } from 'react-router-dom';
import { Trans, useTranslation } from 'react-i18next';
import type { ReferentielResume } from '../types';
import type { SyntheseGlobale } from '../api/synthese';
import { destinationFruit, passationPourFruit } from '../utils/parcours';
import { RadarPortrait } from './Graphes';

/** Traduit la synthèse du menu, ses noms de fruits et les messages pluriels de progression. */
export function SyntheseFruits({ referentiels, synthese }: {
  referentiels: ReferentielResume[];
  synthese: SyntheseGlobale;
}) {
  const { t } = useTranslation();
  const restants = Math.max(0, synthese.nbTestsAttendus - synthese.nbTestsRealises);
  const dimensions = referentiels.flatMap(r => {
    const p = passationPourFruit(synthese.passations, r.code);
    return p?.etat === 'TERMINEE' && p.scoreGlobal != null
      ? [{ libelle: t(`menu.fruits.${r.code}`, { defaultValue: r.nom }), libelleCourt: t(`menu.fruits.${r.code}`, { defaultValue: r.nom }), pourcentage: p.scoreGlobal }]
      : [];
  });

  return (
    <section className="card synthese-fruits" aria-labelledby="titre-tests-effectues">
      <h2 id="titre-tests-effectues">{t('menu.synthese.titre', { realises: synthese.nbTestsRealises, attendus: synthese.nbTestsAttendus })}</h2>
      <dl className="liste-scores">
        {referentiels.map(r => {
          const p = passationPourFruit(synthese.passations, r.code);
          const termine = p?.etat === 'TERMINEE' && p.scoreGlobalArrondi != null;
          return (
            <div className="ligne-score" key={r.code}>
              <dt><Link to={destinationFruit(r.code, p)}>{t(`menu.fruits.${r.code}`, { defaultValue: r.nom })}</Link></dt>
              <dd className={termine ? 'score-termine' : 'score-attente'}>
                {termine ? t('menu.synthese.score', { score: p.scoreGlobalArrondi }) : p?.etat === 'EN_COURS' ? t('menu.synthese.en_cours') : t('menu.synthese.non_teste')}
              </dd>
            </div>
          );
        })}
      </dl>
      {synthese.complet && synthese.scoreGlobalArrondi != null ? (
        <div className="synthese-complete">
          <h3>{t('menu.synthese.titre_global')}</h3>
          <p className="synthese-score">{t('menu.synthese.score', { score: synthese.scoreGlobalArrondi })}</p>
          <p className="hint">{t('menu.synthese.moyenne')}</p>
          <RadarPortrait dimensions={dimensions} />
        </div>
      ) : (
        <p className="hint info">
          <Trans t={t} i18nKey="menu.synthese.debloquer" count={restants} components={{ strong: <strong /> }} />
        </p>
      )}
      <Link className="lien-parcours" to="/mon-parcours">{t('menu.synthese.voir_parcours')}</Link>
    </section>
  );
}
