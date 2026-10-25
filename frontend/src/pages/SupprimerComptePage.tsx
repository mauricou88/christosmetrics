import { useState, type FormEvent } from 'react';
import { useNavigate } from 'react-router-dom';
import { apiRequest } from '../api/client';
import { useAuth } from '../context/AuthContext';

export function SupprimerComptePage() {
  const navigate = useNavigate();
  const { deconnexion } = useAuth();
  const [etape, setEtape] = useState<'avertissement' | 'confirmation' | 'suppression'>('avertissement');
  const [motDePasse, setMotDePasse] = useState('');
  const [erreur, setErreur] = useState<string | null>(null);

  async function supprimer(event: FormEvent<HTMLFormElement>) {
    event.preventDefault();
    if (etape !== 'confirmation' || !motDePasse.trim()) return;
    setErreur(null);
    setEtape('suppression');
    try {
      await apiRequest<void>('/api/compte', { method: 'DELETE', body: { motDePasse } });
      deconnexion();
      navigate('/', { replace: true });
    } catch (error) {
      setErreur(error instanceof Error ? error.message : 'La suppression a échoué. Veuillez réessayer.');
      setEtape('confirmation');
    }
  }

  return (
    <div className="wrap">
      <div className="eyebrow">Gestion du compte</div>
      <h1>Supprimer mon compte</h1>
      <div className="card">
        {etape === 'avertissement' ? (
          <>
            <p>Cette action est définitive. Votre compte, vos réponses, vos résultats et vos rapports PDF enregistrés sur le serveur seront supprimés.</p>
            <p className="hint">Les PDF déjà téléchargés sur vos appareils ou reçus par e-mail resteront en votre possession.</p>
            <div className="controls">
              <button className="btn" style={{ backgroundColor: '#d45219', color: '#fff' }}
                      onClick={() => setEtape('confirmation')}>
                Continuer vers la suppression
              </button>
              <button className="btn ghost" onClick={() => navigate('/menu')}>Annuler</button>
            </div>
          </>
        ) : (
          <form onSubmit={supprimer} aria-busy={etape === 'suppression'}>
            <p>Confirmez votre mot de passe pour supprimer définitivement votre compte et ses données.</p>
            <label htmlFor="mot-de-passe-suppression">Mot de passe actuel</label>
            <input id="mot-de-passe-suppression" type="password" autoComplete="current-password"
                   required autoFocus value={motDePasse} disabled={etape === 'suppression'}
                   onChange={event => setMotDePasse(event.target.value)} />
            {erreur && <p className="hint" role="alert" style={{ color: '#d45219' }}>{erreur}</p>}
            {etape === 'suppression' && <p className="hint" role="status">Suppression en cours…</p>}
            <div className="controls">
              <button className="btn" type="submit" style={{ backgroundColor: '#d45219', color: '#fff' }}
                      disabled={etape === 'suppression' || !motDePasse.trim()}>
                {etape === 'suppression' ? 'Suppression…' : 'Supprimer définitivement mon compte'}
              </button>
              <button className="btn ghost" type="button" disabled={etape === 'suppression'}
                      onClick={() => navigate('/menu')}>Annuler</button>
            </div>
          </form>
        )}
      </div>
    </div>
  );
}
