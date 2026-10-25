/** Appels API du cycle de vie d'une passation (avec reprise de progression). */
import { apiRequest } from './client';
import type { Progression, Resultat } from '../types';

/** Démarre OU reprend la passation de l'utilisateur pour un référentiel. */
export function demarrerOuReprendre(code: string): Promise<Progression> {
  return apiRequest(`/api/passations/demarrer?code=${encodeURIComponent(code)}`, { method: 'POST' });
}

/** Enregistre une réponse (persistée immédiatement côté serveur). */
export function repondre(passationId: number, questionId: number, valeur: number): Promise<Progression> {
  return apiRequest(`/api/passations/${passationId}/repondre`, {
    method: 'POST', body: { questionId, valeur },
  });
}

/** Enregistre un lot de réponses (mode couple ou synchro d'une reprise). */
export function repondreLot(
  passationId: number,
  reponses: { questionId: number; valeur: number }[]
): Promise<Progression> {
  return apiRequest(`/api/passations/${passationId}/repondre-lot`, {
    method: 'POST', body: { reponses },
  });
}

/** Termine la passation et récupère le résultat calculé. */
export function terminer(passationId: number): Promise<Resultat> {
  return apiRequest(`/api/passations/${passationId}/terminer`, { method: 'POST' });
}

/** Relit un résultat déjà calculé. */
export function chargerResultat(passationId: number): Promise<Resultat> {
  return apiRequest(`/api/passations/${passationId}/resultat`);
}
