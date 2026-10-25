import { Link } from 'react-router-dom';
import type { ReferentielResume } from '../types';
import type { SyntheseGlobale } from '../api/synthese';
import { destinationFruit, passationPourFruit } from '../utils/parcours';
import { RadarPortrait } from './Graphes';

export function SyntheseFruits({ referentiels, synthese }: {
  referentiels: ReferentielResume[];
  synthese: SyntheseGlobale;
}) {
  const restants = Math.max(0, synthese.nbTestsAttendus - synthese.nbTestsRealises);
  const dimensions = referentiels.flatMap(r => {
    const p = passationPourFruit(synthese.passations, r.code);
    return p?.etat === 'TERMINEE' && p.scoreGlobal != null
      ? [{ libelle: r.nom, libelleCourt: r.nom, pourcentage: p.scoreGlobal }]
      : [];
  });

  return (
    <section className="card synthese-fruits" aria-labelledby="titre-tests-effectues">
      <h2 id="titre-tests-effectues">Vos tests effectués ({synthese.nbTestsRealises}/{synthese.nbTestsAttendus})</h2>
      <dl className="liste-scores">
        {referentiels.map(r => {
          const p = passationPourFruit(synthese.passations, r.code);
          const termine = p?.etat === 'TERMINEE' && p.scoreGlobalArrondi != null;
          return (
            <div className="ligne-score" key={r.code}>
              <dt><Link to={destinationFruit(r.code, p)}>{r.nom}</Link></dt>
              <dd className={termine ? 'score-termine' : 'score-attente'}>
                {termine ? `${p.scoreGlobalArrondi}%` : p?.etat === 'EN_COURS' ? 'En cours' : '— non testé'}
              </dd>
            </div>
          );
        })}
      </dl>
      {synthese.complet && synthese.scoreGlobalArrondi != null ? (
        <div className="synthese-complete">
          <h3>Votre synthèse globale du fruit de l’Esprit</h3>
          <p className="synthese-score">{synthese.scoreGlobalArrondi}%</p>
          <p className="hint">Moyenne de vos six composantes évaluées, calculée à partir de vos réponses.</p>
          <RadarPortrait dimensions={dimensions} />
        </div>
      ) : (
        <p className="hint info">
          Complétez {restants === 1 ? 'le dernier test restant' : `les ${restants} tests restants`} pour débloquer votre <strong>synthèse globale du fruit de l’Esprit.</strong>
        </p>
      )}
      <Link className="lien-parcours" to="/mon-parcours">Voir mon parcours et mes restitutions →</Link>
    </section>
  );
}
