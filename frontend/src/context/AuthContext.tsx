import { createContext, useContext, useState, useEffect, type ReactNode } from 'react';
import type { User, AuthResponse } from '../types';
import { getToken, setToken, clearToken, initStore, SESSION_EXPIREE } from '../api/client';
import * as authApi from '../api/auth';

/**
 * CONTEXTE D'AUTHENTIFICATION.
 *
 * Conserve l'utilisateur connecté et le token pour toute l'application.
 * Au démarrage, si un token est présent (localStorage), la session est
 * considérée comme active : l'utilisateur n'a pas à se reconnecter et, en
 * naviguant vers un test, il retrouvera sa progression (gérée côté backend).
 *
 * En production, on pourrait ajouter un appel /api/auth/me pour rafraîchir le
 * profil ; ici on stocke le profil avec le token pour rester simple.
 */

interface AuthState {
  user: User | null;
  estConnecte: boolean;
  chargement: boolean;
  connexion: (email: string, motDePasse: string) => Promise<void>;
  inscription: (data: InscriptionData) => Promise<void>;
  deconnexion: () => void;
}

interface InscriptionData {
  email: string; motDePasse: string;
  prenom: string; nom: string; eglise: string;
}

const USER_KEY = 'christos_user';
const AuthContext = createContext<AuthState | undefined>(undefined);

export function AuthProvider({ children }: { children: ReactNode }) {
  const [user, setUser] = useState<User | null>(null);
  const [chargement, setChargement] = useState(true);

  // Une session restaurée localement peut ne plus correspondre à un compte serveur.
  useEffect(() => {
    const expirerSession = () => {
      clearToken();
      localStorage.removeItem(USER_KEY);
      setUser(null);
    };
    window.addEventListener(SESSION_EXPIREE, expirerSession);
    return () => window.removeEventListener(SESSION_EXPIREE, expirerSession);
  }, []);

  // Au montage : hydrate le store natif (mobile) puis restaure la session.
  useEffect(() => {
    (async () => {
      await initStore();
      const token = getToken();
      const userStr = localStorage.getItem(USER_KEY);
      if (token && userStr) {
        try { setUser(JSON.parse(userStr)); } catch { /* ignore */ }
      }
      setChargement(false);
    })();
  }, []);

  function appliquerAuth(res: AuthResponse) {
    setToken(res.token);
    localStorage.setItem(USER_KEY, JSON.stringify(res.user));
    setUser(res.user);
  }

  async function connexion(email: string, motDePasse: string) {
    const res = await authApi.login({ email, motDePasse });
    appliquerAuth(res);
  }

  async function inscription(data: InscriptionData) {
    const res = await authApi.register(data);
    appliquerAuth(res);
  }

  function deconnexion() {
    clearToken();
    localStorage.removeItem(USER_KEY);
    setUser(null);
  }

  return (
    <AuthContext.Provider value={{
      user, estConnecte: !!user, chargement,
      connexion, inscription, deconnexion,
    }}>
      {children}
    </AuthContext.Provider>
  );
}

export function useAuth(): AuthState {
  const ctx = useContext(AuthContext);
  if (!ctx) throw new Error('useAuth doit être utilisé dans un AuthProvider');
  return ctx;
}
