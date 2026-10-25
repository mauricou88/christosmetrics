/** Appels API du parcours global (historique + synthèse CHRISTOS). */
import { apiRequest } from './client';

export interface PassationResume {
  passationId: number;
  referentielCode: string;
  referentielNom: string;
  type: 'INDIVIDUEL' | 'COUPLE';
  etat: 'EN_COURS' | 'TERMINEE';
  debuteeLe: string;
  termineeLe: string | null;
  scoreGlobal: number | null;
  scoreGlobalArrondi: number | null;
  pdfDisponible: boolean;
}

export interface SyntheseGlobale {
  nbTestsRealises: number;
  nbTestsAttendus: number;
  complet: boolean;
  scoreGlobal: number | null;
  scoreGlobalArrondi: number | null;
  passations: PassationResume[];
}

export function chargerMonParcours(): Promise<SyntheseGlobale> {
  return apiRequest('/api/mon-parcours');
}
