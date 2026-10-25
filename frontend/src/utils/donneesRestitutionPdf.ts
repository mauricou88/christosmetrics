import type { Resultat, Tranche } from '../types';

/** Adapter les données affichées à l'écran, sans recalculer ni réinterpréter les scores. */
export function donneesRestitutionPdf(resultat: Resultat) {
  const convertirTranche = (t: Tranche) => ({
    min: t.min, max: t.max, txt: t.texte,
    face: t.typeIcone.toLowerCase(), type: t.typeIcone.toLowerCase(),
    faces: t.nombreIcones, active: t.active,
  });
  const bareme = resultat.bareme.map(convertirTranche);
  const tranche = resultat.tranche
    ? bareme.find(t => t.min === resultat.tranche!.min && t.max === resultat.tranche!.max)
      ?? convertirTranche(resultat.tranche)
    : null;
  const dimension = (d: Resultat['dimensions'][number]) => ({
    nom: d.libelleCourt, nomComplet: d.libelle, pct: d.pourcentage, aff: Math.round(d.pourcentage),
  });
  return {
    fruitConfig: {
      nom: resultat.referentielNom,
      titrePdf: resultat.type === 'COUPLE' ? 'du couple' : `sur ${resultat.referentielNom}`,
      verset: 'Galates 5.22',
      topFlop: resultat.top.length,
      syntheseType: 'radar',
      unite: resultat.unite,
      bareme,
      conformite: resultat.type === 'COUPLE' ? "au fruit de l'Esprit dans le couple" : `à ${resultat.referentielNom}`,
    },
    resultatPoc: {
      dims: resultat.dimensions.map(dimension),
      global: resultat.scoreGlobal,
      globalAff: resultat.scoreGlobalArrondi,
      tranche,
      top: resultat.top.map(dimension),
      flop: resultat.flop.map(dimension),
    },
  };
}
