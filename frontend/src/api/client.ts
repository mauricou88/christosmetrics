/**
 * Client HTTP central.
 *
 * - Ajoute automatiquement le token JWT (Authorization: Bearer …) s'il existe.
 * - Centralise la base d'URL et la gestion d'erreurs.
 *
 * Stockage du token :
 *   - Web : localStorage (simple, isolé par origine).
 *   - Capacitor (iOS/Android) : @capacitor/preferences (storage natif
 *     persistant, isolé par app ; sur iOS c'est stocké dans UserDefaults,
 *     sur Android dans SharedPreferences — plus sûr qu'un localStorage web).
 *
 * Les getters sont asynchrones sur mobile ; on expose une API synchrone
 * via un cache mémoire alimenté au démarrage par initStore().
 */

import { Capacitor } from '@capacitor/core';
import { Preferences } from '@capacitor/preferences';

const BASE_URL = import.meta.env.VITE_API_URL ?? 'http://localhost:8080';
const TOKEN_KEY = 'christos_token';
export const SESSION_EXPIREE = 'christos:session-expiree';

const estMobile = Capacitor.isNativePlatform();
let cacheToken: string | null = null;

/** À appeler une fois au démarrage de l'app pour hydrater le cache. */
export async function initStore(): Promise<void> {
  if (estMobile) {
    const { value } = await Preferences.get({ key: TOKEN_KEY });
    cacheToken = value ?? null;
  } else {
    cacheToken = localStorage.getItem(TOKEN_KEY);
  }
}

export function getToken(): string | null {
  if (estMobile) return cacheToken;
  return localStorage.getItem(TOKEN_KEY);
}

export function setToken(token: string): void {
  cacheToken = token;
  if (estMobile) {
    void Preferences.set({ key: TOKEN_KEY, value: token });
  } else {
    localStorage.setItem(TOKEN_KEY, token);
  }
}

export function clearToken(): void {
  cacheToken = null;
  if (estMobile) {
    void Preferences.remove({ key: TOKEN_KEY });
  } else {
    localStorage.removeItem(TOKEN_KEY);
  }
}

interface RequestOptions {
  method?: 'GET' | 'POST' | 'PUT' | 'DELETE';
  body?: unknown;
  auth?: boolean;
}

export async function apiRequest<T>(path: string, opts: RequestOptions = {}): Promise<T> {
  const { method = 'GET', body, auth = true } = opts;
  const headers: Record<string, string> = {
    'Content-Type': 'application/json',
    'ngrok-skip-browser-warning': 'true',
  };

  if (auth) {
    const token = getToken();
    if (token) headers['Authorization'] = `Bearer ${token}`;
  }

  const res = await fetch(`${BASE_URL}${path}`, {
    method,
    headers,
    body: body ? JSON.stringify(body) : undefined,
  });

  if (!res.ok) {
    if (auth && res.status === 401) {
      window.dispatchEvent(new Event(SESSION_EXPIREE));
      throw new Error('Votre session a expiré ou votre compte est introuvable. Veuillez vous reconnecter.');
    }
    let message = `Erreur ${res.status}`;
    try {
      const data = await res.json();
      if (data?.erreur) message = data.erreur;
      if (data?.champs && typeof data.champs === 'object') {
        const details = Object.values(data.champs).filter((valeur): valeur is string => typeof valeur === 'string');
        if (details.length > 0) message += ' : ' + [...new Set(details)].join(' ; ');
      }
    } catch { /* corps non JSON */ }
    throw new Error(message);
  }

  if (res.status === 204) return undefined as T;
  return res.json() as Promise<T>;
}
