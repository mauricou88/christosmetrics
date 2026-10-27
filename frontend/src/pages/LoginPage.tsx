import { useState, type FormEvent } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { useTranslation } from 'react-i18next';
import { useAuth } from '../context/AuthContext';

/**
 * Formulaire traduit de connexion et d’inscription, avec bascule via un lien.
 *
 * En cas de succès :
 *   - le token JWT est stocké dans localStorage (via AuthContext) ;
 *   - l'utilisateur est redirigé vers le menu ;
 *   - à la prochaine ouverture du site, il RESTE CONNECTÉ tant que le token
 *     n'a pas expiré → il retrouve directement sa progression.
 */
export function LoginPage({ modeInitial = 'connexion' }: { modeInitial?: 'connexion' | 'inscription' }) {
  const { t } = useTranslation();
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

  /** Soumet les identifiants et valeurs métier sans traduire les données envoyées à l’API. */
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
      <Link className="lien-retour" to="/">{t('commun.presentation')}</Link>
      <div className="eyebrow">{t('commun.marque')}</div>
      <h1>{t(`auth.${mode}.titre`)}</h1>
      <p className="lede">{t(`auth.${mode}.lede`)}</p>

      <form className="card" onSubmit={soumettre}>
        {mode === 'inscription' && (
          <>
            <div className="grid2">
              <div>
                <label>{t('auth.champs.prenom')}</label>
                <input value={prenom} onChange={e => setPrenom(e.target.value)} required />
              </div>
              <div>
                <label>{t('auth.champs.nom')}</label>
                <input value={nom} onChange={e => setNom(e.target.value)} required />
              </div>
            </div>
            <div style={{ marginTop: 14 }}>
              <label>{t('auth.champs.eglise')}</label>
              <select value={eglise} onChange={e => setEglise(e.target.value)}>
                <option value="Rouen">{t('auth.champs.eglises.rouen')}</option>
                <option value="Le Havre">{t('auth.champs.eglises.le_havre')}</option>
                <option value="Évreux">{t('auth.champs.eglises.evreux')}</option>
                <option value="Caen">{t('auth.champs.eglises.caen')}</option>
                <option value="Autre">{t('auth.champs.eglises.autre')}</option>
              </select>
            </div>
          </>
        )}
        <div style={{ marginTop: 14 }}>
          <label>{t('auth.champs.email')}</label>
          <input type="email" value={email} onChange={e => setEmail(e.target.value)} required autoComplete="email" />
        </div>
        <div style={{ marginTop: 14 }}>
          <label>{t('auth.champs.mot_de_passe')}</label>
          <input type="password" value={motDePasse} onChange={e => setMotDePasse(e.target.value)}
                 required minLength={mode === 'inscription' ? 8 : 1} maxLength={100}
                 pattern={mode === 'inscription' ? '^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).{8,100}$' : undefined}
                 title={mode === 'inscription' ? t('auth.champs.regles_mot_de_passe') : undefined}
                 aria-describedby={mode === 'inscription' ? 'regles-mot-de-passe' : undefined}
                 autoComplete={mode === 'connexion' ? 'current-password' : 'new-password'} />
          {mode === 'inscription' && (
            <p id="regles-mot-de-passe" className="hint">
              {t('auth.champs.regles_mot_de_passe')}
            </p>
          )}
        </div>

        {erreur && <p className="hint" style={{ color: '#d45219', marginTop: 12 }}>{erreur}</p>}

        <div className="controls" style={{ marginTop: 20 }}>
          <button className="btn" type="submit" disabled={enCours}>
            {enCours ? t('commun.en_cours') : t(`auth.${mode}.cta`)}
          </button>
        </div>
        <p className="hint" style={{ marginTop: 12 }}>
          {mode === 'connexion' ? t('auth.connexion.pas_de_compte') : t('auth.inscription.deja_compte')}{' '}
          <button type="button" onClick={() => setMode(mode === 'connexion' ? 'inscription' : 'connexion')}
                  style={{ background: 'none', border: 'none', color: 'var(--teal)', cursor: 'pointer', textDecoration: 'underline' }}>
            {mode === 'connexion' ? t('auth.connexion.inscription') : t('auth.inscription.connexion')}
          </button>
        </p>
      </form>
    </div>
  );
}
