import type { Resultat, Tranche } from '../types';
import type { LanguePdf } from './pdfGenerator';

/** Textes locaux pour composer titrePdf et conformite dans la langue courante. */
const LOCAL_TEXTS: Record<LanguePdf, { sur: (nom: string) => string; couple: string; conformiteA: (nom: string) => string; conformiteCouple: string }> = {
  fr: {
    sur: nom => `sur ${nom}`,
    couple: 'du couple',
    conformiteA: nom => `à ${nom}`,
    conformiteCouple: 'au fruit de l’Esprit dans le couple',
  },
  en: {
    sur: nom => `on ${nom}`,
    couple: 'for the couple',
    conformiteA: nom => `to ${nom}`,
    conformiteCouple: 'to the fruit of the Spirit in the couple',
  },
  es: {
    sur: nom => `sobre ${nom}`,
    couple: 'de la pareja',
    conformiteA: nom => `a ${nom}`,
    conformiteCouple: 'al fruto del Espíritu en la pareja',
  },
  pt: {
    sur: nom => `sobre ${nom}`,
    couple: 'do casal',
    conformiteA: nom => `a ${nom}`,
    conformiteCouple: 'ao fruto do Espírito no casal',
  },
};

/** Adapter les données affichées à l’écran, sans recalculer ni réinterpréter les scores. */
export function donneesRestitutionPdf(resultat: Resultat, langue: LanguePdf = 'fr') {
  const t = LOCAL_TEXTS[langue] ?? LOCAL_TEXTS.fr;
  const convertirTranche = (tr: Tranche) => ({
    min: tr.min, max: tr.max, txt: tr.texte,
    face: tr.typeIcone.toLowerCase(), type: tr.typeIcone.toLowerCase(),
    faces: tr.nombreIcones, active: tr.active,
  });
  const bareme = resultat.bareme.map(convertirTranche);
  const tranche = resultat.tranche
    ? bareme.find(tr => tr.min === resultat.tranche!.min && tr.max === resultat.tranche!.max)
      ?? convertirTranche(resultat.tranche)
    : null;
  const dimension = (d: Resultat['dimensions'][number]) => ({
    nom: d.libelleCourt, nomComplet: d.libelle, pct: d.pourcentage, aff: Math.round(d.pourcentage),
  });
  return {
    fruitConfig: {
      nom: resultat.referentielNom,
      titrePdf: resultat.type === 'COUPLE' ? t.couple : t.sur(resultat.referentielNom),
      verset: 'Galates 5.22',
      topFlop: resultat.top.length,
      syntheseType: 'radar',
      unite: resultat.unite,
      bareme,
      conformite: resultat.type === 'COUPLE' ? t.conformiteCouple : t.conformiteA(resultat.referentielNom),
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
