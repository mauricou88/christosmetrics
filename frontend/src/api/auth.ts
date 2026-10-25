/** Appels API d'authentification. */
import { apiRequest } from './client';
import type { AuthResponse } from '../types';

export function register(data: {
  email: string; motDePasse: string;
  prenom: string; nom: string; eglise: string;
}): Promise<AuthResponse> {
  return apiRequest('/api/auth/register', { method: 'POST', body: data, auth: false });
}

export function login(data: { email: string; motDePasse: string }): Promise<AuthResponse> {
  return apiRequest('/api/auth/login', { method: 'POST', body: data, auth: false });
}
