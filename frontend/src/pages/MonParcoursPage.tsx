import { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { chargerMonParcours, type SyntheseGlobale } from '../api/synthese';
import { urlTelechargementPdf } from '../api/pdf';
import { telechargerPdfServeur } from '../utils/telechargementPdf';
import { nomRestitutionPdf } from '../utils/nomRestitutionPdf';
import { useAuth } from '../context/AuthContext';

/**
 * Mon parcours — historique de tous les tests + synthèse CHRISTOS globale.
 * La synthèse n'apparaît que si TOUS les fruits individuels sont terminés.
 */
export function MonParcoursPage() {
  const navigate = useNavigate();
  const { user } = useAuth();
  const [synthese, setSynthese] = useState<SyntheseGlobale | null>(null);
  const [erreur, setErreur] = useState<string | null>(null);
  const [chargement, setChargement] = useState(true);

  useEffect(() => {
    chargerMonParcours()
      .then(setSynthese)
      .catch(e => setErreur((e as Error).message))
      .finally(() => setChargement(false));
  }, []);

  async function handleTelechargerPdf(passationId: number, nomFruit: string) {
    try {
      if (!user) throw new Error('Veuillez vous reconnecter.');
      await telechargerPdfServeur(
        urlTelechargementPdf(passationId),
        nomRestitutionPdf(nomFruit, user.email),
      );
    } catch (e) {
      alert('Téléchargement impossible : ' + (e as Error).message);
    }
  }

  if (chargement) return <div className="wrap"><p>Chargement…</p></div>;
  if (erreur) return <div className="wrap"><p className="hint" style={{ color: '#d45219' }}>{erreur}</p></div>;
  if (!synthese) return null;

  return (
    <div className="wrap">
      <div className="eyebrow">Mon parcours</div>
      <h1>Vos tests et votre synthèse</h1>
      <button className="btn ghost sm" onClick={() => navigate('/menu?vue=individuel')} style={{ marginBottom: 20 }}>
        ← Choisir un autre fruit
      </button>

      {synthese.complet && synthese.scoreGlobalArrondi != null && (
        <div className="score-hero" style={{ marginBottom: 30 }}>
          <div>
            <div className="big">{synthese.scoreGlobalArrondi}%</div>
            <div className="lb">Manifestation globale du fruit de l'Esprit</div>
          </div>
          <div className="interp">
            Vous avez complété <strong>{synthese.nbTestsRealises} tests sur {synthese.nbTestsAttendus}</strong>.
            Ce score est la moyenne de vos différentes composantes — un instantané de votre cheminement.
          </div>
        </div>
      )}

      {!synthese.complet && (
        <div className="qualif" style={{ marginBottom: 24 }}>
          <h3>Votre progression vers la synthèse globale</h3>
          <p>
            <strong>{synthese.nbTestsRealises}</strong> test{synthese.nbTestsRealises > 1 ? 's' : ''} terminé{synthese.nbTestsRealises > 1 ? 's' : ''} sur <strong>{synthese.nbTestsAttendus}</strong>.
            Complétez tous vos diagnostics individuels pour débloquer la <strong>synthèse CHRISTOS globale</strong>.
          </p>
        </div>
      )}

      <h2 style={{ marginTop: 30, marginBottom: 12 }}>Historique de vos tests</h2>
      {synthese.passations.length === 0 ? (
        <p className="hint">Vous n'avez pas encore commencé de test.</p>
      ) : (
        <div className="card" style={{ padding: 0 }}>
          <table style={{ width: '100%', borderCollapse: 'collapse' }}>
            <thead>
              <tr style={{ background: 'var(--teal-xl)' }}>
                <th style={{ padding: 12, textAlign: 'left' }}>Fruit</th>
                <th style={{ padding: 12, textAlign: 'left' }}>État</th>
                <th style={{ padding: 12, textAlign: 'right' }}>Score</th>
                <th style={{ padding: 12, textAlign: 'right' }}>Actions</th>
              </tr>
            </thead>
            <tbody>
              {synthese.passations.map(p => (
                <tr key={p.passationId} style={{ borderBottom: '1px solid var(--line)' }}>
                  <td style={{ padding: 12 }}>
                    <strong>{p.referentielNom}</strong>
                    <br />
                    <span className="hint" style={{ fontSize: 12 }}>
                      Démarré le {new Date(p.debuteeLe).toLocaleDateString('fr-FR')}
                    </span>
                  </td>
                  <td style={{ padding: 12 }}>
                    {p.etat === 'TERMINEE' ? (
                      <span style={{ color: 'var(--teal)', fontWeight: 600 }}>✓ Terminé</span>
                    ) : (
                      <span style={{ color: 'var(--orange)', fontWeight: 600 }}>⏳ En cours</span>
                    )}
                  </td>
                  <td style={{ padding: 12, textAlign: 'right' }}>
                    {p.scoreGlobalArrondi != null ? (
                      <span style={{ color: 'var(--orange)', fontWeight: 'bold', fontSize: 18 }}>
                        {p.scoreGlobalArrondi}{p.type === 'COUPLE' ? '/36' : '%'}
                      </span>
                    ) : <span className="hint">—</span>}
                  </td>
                  <td style={{ padding: 12, textAlign: 'right' }}>
                    {p.etat === 'EN_COURS' && (
                      <button className="btn sm" onClick={() => navigate(`/test/${p.referentielCode}`)}>
                        Reprendre
                      </button>
                    )}
                    {p.etat === 'TERMINEE' && (
                      <>
                        <button className="btn ghost sm"
                                onClick={() => navigate(`/resultat/${p.passationId}`)}
                                style={{ marginRight: 6 }}>
                          Voir
                        </button>
                        {p.pdfDisponible && (
                          <button className="btn sec sm"
                                  onClick={() => handleTelechargerPdf(p.passationId, p.referentielNom)}>
                            📄 PDF
                          </button>
                        )}
                      </>
                    )}
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}
    </div>
  );
}
