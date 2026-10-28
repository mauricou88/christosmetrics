import { useCallback, useEffect, useRef, useState } from 'react';
import { apiRequest } from '../api/client';
import { useAuth } from '../context/AuthContext';

export type Moi = {
  prenom: string;
  nom: string;
  email: string;
  streakActuel: number;
  streakRecord: number;
  fruitsCompletes: number;
  fruitsTotal: number;
  christosGlobalDisponible: boolean;
  scoreGlobal: number | null;
};

/** Charge le profil actif ; ignore les réponses devenues obsolètes ou reçues après démontage. */
export function useMoi() {
  const { user, estConnecte, chargement: authentification } = useAuth();
  const [moi, setMoi] = useState<Moi | null>(null);
  const [chargement, setChargement] = useState(true);
  const requete = useRef(0);
  const compte = user?.id;

  /** Recharge explicitement la progression sans laisser une erreur API casser la page. */
  const rafraichir = useCallback(async () => {
    const numero = ++requete.current;
    if (!estConnecte || authentification) {
      setMoi(null);
      setChargement(authentification);
      return;
    }
    setChargement(true);
    try {
      const donnees = await apiRequest<Moi>('/api/moi');
      if (numero === requete.current) setMoi(donnees);
    } catch {
      // Le client central traite le 401 et notifie déjà AuthProvider de l’expiration.
      if (numero === requete.current) setMoi(null);
    } finally {
      if (numero === requete.current) setChargement(false);
    }
  }, [estConnecte, authentification, compte]);

  useEffect(() => {
    void rafraichir();
    return () => { requete.current++; };
  }, [rafraichir]);

  return {
    moi: estConnecte && moi?.email === user?.email ? moi : null,
    chargement: authentification || (estConnecte && chargement),
    rafraichir,
  };
}
