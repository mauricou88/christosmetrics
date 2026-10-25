import { useState, type FormEvent } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { useAuth } from '../context/AuthContext';

/**
 * Page de connexion ET d'inscription (bascule via un lien).
 *
 * En cas de succès :
 *   - le token JWT est stocké dans localStorage (via AuthContext) ;
 *   - l'utilisateur est redirigé vers le menu ;
 *   - à la prochaine ouverture du site, il RESTE CONNECTÉ tant que le token
 *     n'a pas expiré → il retrouve directement sa progression.
 */
export function LoginPage({ modeInitial = 'connexion' }: { modeInitial?: 'connexion' | 'inscription' }) {
  const [mode, setMode] = useState<'connexion' | 'inscription'>(modeInitial);
  const [email, setEmail] = useState('');
  const [motDePasse, setMotDePasse] = useState('');
  const [prenom, setPrenom] = useState('');
  const [nom, setNom] = useState('');
  const [eglise, setEglise] = useState('Rouen');
  const [erreur, setErreur] = useState<string | null>(null);
  const [enCours, setEnCours] = useState(false);
  const { connexion, inscription } = useAuth();
  const navigate = useNavigate();

  async function soumettre(e: FormEvent) {
    e.preventDefault();
    setErreur(null);
    setEnCours(true);
    try {
      if (mode === 'connexion') {
        await connexion(email, motDePasse);
      } else {
        await inscription({ email, motDePasse, prenom, nom, eglise });
      }
      navigate('/menu');
    } catch (e) {
      setErreur((e as Error).message);
    } finally {
      setEnCours(false);
    }
  }

  return (
    <div className="wrap">
      <Link className="lien-retour" to="/">← Présentation de l’application</Link>
      <div className="eyebrow">CHRISTOSMETRICS</div>
      <h1>{mode === 'connexion' ? 'Connexion' : 'Créer un compte'}</h1>
      <p className="lede">
        {mode === 'connexion'
          ? "Retrouvez vos tests en cours et vos restitutions."
          : "Votre compte permet de sauvegarder vos réponses et de reprendre plus tard."}
      </p>

      <form className="card" onSubmit={soumettre}>
        {mode === 'inscription' && (
          <>
            <div className="grid2">
              <div>
                <label>Prénom *</label>
                <input value={prenom} onChange={e => setPrenom(e.target.value)} required />
              </div>
              <div>
                <label>Nom *</label>
                <input value={nom} onChange={e => setNom(e.target.value)} required />
              </div>
            </div>
            <div style={{ marginTop: 14 }}>
              <label>Église</label>
              <select value={eglise} onChange={e => setEglise(e.target.value)}>
                <option>Rouen</option><option>Le Havre</option><option>Évreux</option>
                <option>Caen</option><option>Autre</option>
              </select>
            </div>
          </>
        )}
        <div style={{ marginTop: 14 }}>
          <label>Adresse e-mail *</label>
          <input type="email" value={email} onChange={e => setEmail(e.target.value)} required autoComplete="email" />
        </div>
        <div style={{ marginTop: 14 }}>
          <label>Mot de passe *</label>
          <input type="password" value={motDePasse} onChange={e => setMotDePasse(e.target.value)}
                 required minLength={mode === 'inscription' ? 8 : 1} maxLength={100}
                 pattern={mode === 'inscription' ? '^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).{8,100}$' : undefined}
                 title={mode === 'inscription' ? '8 à 100 caractères, avec une majuscule, une minuscule et un chiffre.' : undefined}
                 aria-describedby={mode === 'inscription' ? 'regles-mot-de-passe' : undefined}
                 autoComplete={mode === 'connexion' ? 'current-password' : 'new-password'} />
          {mode === 'inscription' && (
            <p id="regles-mot-de-passe" className="hint">
              8 à 100 caractères, avec une majuscule, une minuscule et un chiffre.
            </p>
          )}
        </div>

        {erreur && <p className="hint" style={{ color: '#d45219', marginTop: 12 }}>{erreur}</p>}

        <div className="controls" style={{ marginTop: 20 }}>
          <button className="btn" type="submit" disabled={enCours}>
            {enCours ? '…' : (mode === 'connexion' ? 'Se connecter' : 'Créer mon compte')}
          </button>
        </div>
        <p className="hint" style={{ marginTop: 12 }}>
          {mode === 'connexion' ? "Pas encore de compte ? " : "Déjà inscrit ? "}
          <button type="button" onClick={() => setMode(mode === 'connexion' ? 'inscription' : 'connexion')}
                  style={{ background: 'none', border: 'none', color: 'var(--teal)', cursor: 'pointer', textDecoration: 'underline' }}>
            {mode === 'connexion' ? "S'inscrire" : "Se connecter"}
          </button>
        </p>
      </form>
    </div>
  );
}
