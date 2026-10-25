import type { ReferentielResume } from '../types';
import type { PassationResume } from '../api/synthese';

export const ORDRE_FRUITS = ['amour', 'joie', 'paix', 'patience', 'bonte', 'fidelite', 'douceur', 'maitrise'];
export const FRUITS_A_CONCEVOIR = [
  { code: 'douceur', nom: 'Douceur' },
  { code: 'maitrise', nom: 'Maîtrise de soi' },
];

export function referentielsIndividuels(referentiels: ReferentielResume[]): ReferentielResume[] {
  const position = (code: string) => {
    const index = ORDRE_FRUITS.indexOf(code);
    return index < 0 ? ORDRE_FRUITS.length : index;
  };
  return referentiels.filter(r => r.type === 'INDIVIDUEL')
    .sort((a, b) => position(a.code) - position(b.code) || a.nom.localeCompare(b.nom, 'fr'));
}

/** Comme le serveur : résultat terminé prioritaire, puis test le plus récent. */
export function passationPourFruit(passations: PassationResume[], code: string): PassationResume | undefined {
  return passations.filter(p => p.referentielCode === code).sort((a, b) => {
    const priorite = Number(b.etat === 'TERMINEE') - Number(a.etat === 'TERMINEE');
    return priorite || Date.parse(b.debuteeLe) - Date.parse(a.debuteeLe);
  })[0];
}

export function destinationFruit(code: string, passation?: PassationResume): string {
  return passation?.etat === 'TERMINEE'
    ? `/resultat/${passation.passationId}`
    : `/test/${encodeURIComponent(code)}`;
}
