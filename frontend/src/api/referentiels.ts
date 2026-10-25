/** Appels API du catalogue de référentiels (fruits + couple). */
import { apiRequest } from './client';
import type { ReferentielResume, ReferentielComplet } from '../types';

export function listerReferentiels(): Promise<ReferentielResume[]> {
  return apiRequest('/api/referentiels', { auth: false });
}

export function chargerReferentiel(code: string): Promise<ReferentielComplet> {
  return apiRequest(`/api/referentiels/${code}`, { auth: false });
}
