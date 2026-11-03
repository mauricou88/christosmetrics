import { useEffect, useState } from 'react';
import { useTranslation } from 'react-i18next';
import { useNavigate } from 'react-router-dom';
import { chargerMonParcours, type SyntheseGlobale } from '../api/synthese';
import { chargerResultat } from '../api/passations';
import { televerserPdf } from '../api/pdf';
import { telechargerOuPartagerPdf } from '../utils/telechargementPdf';
import { nomRestitutionPdf } from '../utils/nomRestitutionPdf';
import { genererRestitutionPdf, type LanguePdf } from '../utils/pdfGenerator';
import { donneesRestitutionPdf } from '../utils/donneesRestitutionPdf';
import { useAuth } from '../context/AuthContext';

/**
 * Mon parcours — historique de tous les tests + synthèse CHRISTOS globale.
 * La synthèse n'apparaît que si TOUS les fruits individuels sont terminés.
 */
export function MonParcoursPage() {
  const { t, i18n } = useTranslation();
  const langue = i18n.resolvedLanguage ?? i18n.language;
  const navigate = useNavigate();
  const { user } = useAuth();
  const [synthese, setSynthese] = useState<SyntheseGlobale | null>(null);
  const [erreur, setErreur] = useState<string | null>(null);
  const [chargement, setChargement] = useState(true);
  const [regenerationEnCours, setRegenerationEnCours] = useState<number | null>(null);
  const [messageRegen, setMessageRegen] = useState<{ id: number; type: 'ok' | 'ko'; texte: string } | null>(null);

  useEffect(() => {
    let annule = false;
    setChargement(true);
    setErreur(null);
    chargerMonParcours()
      .then(parcours => { if (!annule) setSynthese(parcours); })
      .catch(e => { if (!annule) setErreur((e as Error).message); })
      .finally(() => { if (!annule) setChargement(false); });
    return () => { annule = true; };
  }, [langue]);

  /** Regenere le PDF dans la langue courante puis le partage ET le re-upload serveur. */
  async function handleTelechargerPdf(passationId: number, nomFruit: string) {
    if (regenerationEnCours != null) return;
    setRegenerationEnCours(passationId);
    setMessageRegen(null);
    try {
      if (!user) throw new Error(t('mon_parcours.veuillez_reconnecter'));
      const langueCourt = (langue ?? 'fr').slice(0, 2) as LanguePdf;
      // 1. Recharger le resultat complet (le backend renvoie les textes dans la langue courante)
      const resultat = await chargerResultat(passationId);
      // 2. Composer les donnees PDF dans la bonne langue
      const { fruitConfig, resultatPoc } = donneesRestitutionPdf(resultat, langueCourt);
      // 3. Generer le PDF client dans la langue courante
      const { blob, nomFichier } = genererRestitutionPdf(
        fruitConfig, resultatPoc,
        { prenom: user.prenom, nom: user.nom, email: user.email, eglise: user.eglise },
        undefined,
        langueCourt,
      );
      // 4. Partage/telechargement local + upload serveur en parallele
      const [local, serveur] = await Promise.allSettled([
        telechargerOuPartagerPdf(blob, nomFichier ?? nomRestitutionPdf(nomFruit, user.email)),
        televerserPdf(passationId, blob, nomFichier ?? nomRestitutionPdf(nomFruit, user.email)),
      ]);
      const localOk = local.status === 'fulfilled';
      const serveurOk = serveur.status === 'fulfilled';
      if (localOk && serveurOk) {
        setMessageRegen({ id: passationId, type: 'ok', texte: t('mon_parcours.regen_ok') });
      } else if (localOk) {
        setMessageRegen({ id: passationId, type: 'ok', texte: t('mon_parcours.regen_local_seul') });
      } else {
        const raison = local.status === 'rejected'
          ? (local.reason instanceof Error ? local.reason.message : String(local.reason))
          : '';
        throw new Error(raison || 'inconnue');
      }
    } catch (e) {
      setMessageRegen({ id: passationId, type: 'ko', texte: t('mon_parcours.telechargement_impossible', { raison: (e as Error).message }) });
    } finally {
      setRegenerationEnCours(null);
    }
  }

  if (chargement) return <div className="wrap"><p>Chargement…</p></div>;
  if (erreur) return <div className="wrap"><p className="hint" style={{ color: '#d45219' }}>{erreur}</p></div>;
  if (!synthese) return null;

  return (
    <div className="wrap">
      <div className="eyebrow">Mon parcours</div>
      <h1>{t('mon_parcours.page_titre')}</h1>
      <button className="btn ghost sm" onClick={() => navigate('/menu?vue=individuel')} style={{ marginBottom: 20 }}>
        {t('mon_parcours.retour_fruits')}
      </button>

      {synthese.complet && synthese.scoreGlobalArrondi != null && (
        <div className="score-hero" style={{ marginBottom: 30 }}>
          <div>
            <div className="big">{synthese.scoreGlobalArrondi}%</div>
            <div className="lb">{t('mon_parcours.manifestation_globale')}</div>
          </div>
          <div className="interp">
            {t('mon_parcours.synthese_phrase', { realises: synthese.nbTestsRealises, attendus: synthese.nbTestsAttendus })}
          </div>
        </div>
      )}

      {!synthese.complet && (
        <div className="qualif" style={{ marginBottom: 24 }}>
          <h3>{t('mon_parcours.progression_titre')}</h3>
          <p>{t('mon_parcours.progression_phrase', { realises: synthese.nbTestsRealises, attendus: synthese.nbTestsAttendus })}</p>
        </div>
      )}

      <h2 style={{ marginTop: 30, marginBottom: 12 }}>{t('mon_parcours.historique_titre')}</h2>
      {synthese.passations.length === 0 ? (
        <p className="hint">{t('mon_parcours.historique_vide')}</p>
      ) : (
        <div className="card" style={{ padding: 0 }}>
          <table style={{ width: '100%', borderCollapse: 'collapse' }}>
            <thead>
              <tr style={{ background: 'var(--teal-xl)' }}>
                <th style={{ padding: 12, textAlign: 'left' }}>{t('mon_parcours.col_fruit')}</th>
                <th style={{ padding: 12, textAlign: 'left' }}>{t('mon_parcours.col_etat')}</th>
                <th style={{ padding: 12, textAlign: 'right' }}>{t('mon_parcours.col_score')}</th>
                <th style={{ padding: 12, textAlign: 'right' }}>{t('mon_parcours.col_actions')}</th>
              </tr>
            </thead>
            <tbody>
              {synthese.passations.map(p => (
                <tr key={p.passationId} style={{ borderBottom: '1px solid var(--line)' }}>
                  <td style={{ padding: 12 }}>
                    <strong>{p.referentielNom}</strong>
                    <br />
                    <span className="hint" style={{ fontSize: 'var(--fs-small)' }}>
                      {t('mon_parcours.demarre_le', { date: new Date(p.debuteeLe).toLocaleDateString(i18n.resolvedLanguage ?? i18n.language) })}
                    </span>
                  </td>
                  <td style={{ padding: 12 }}>
                    {p.etat === 'TERMINEE' ? (
                      <span style={{ color: 'var(--teal)', fontWeight: 600 }}>{t('mon_parcours.etat_termine')}</span>
                    ) : (
                      <span style={{ color: 'var(--orange)', fontWeight: 600 }}>{t('mon_parcours.etat_en_cours')}</span>
                    )}
                  </td>
                  <td style={{ padding: 12, textAlign: 'right' }}>
                    {p.scoreGlobalArrondi != null ? (
                      <span style={{ color: 'var(--orange)', fontWeight: 'bold', fontSize: 'var(--fs-lead)' }}>
                        {p.scoreGlobalArrondi}{p.type === 'COUPLE' ? '/36' : '%'}
                      </span>
                    ) : <span className="hint">—</span>}
                  </td>
                  <td style={{ padding: 12, textAlign: 'right' }}>
                    {p.etat === 'EN_COURS' && (
                      <button className="btn sm" onClick={() => navigate(`/test/${p.referentielCode}`)}>
                        {t('mon_parcours.cta_reprendre')}
                      </button>
                    )}
                    {p.etat === 'TERMINEE' && (
                      <>
                        <button className="btn ghost sm"
                                onClick={() => navigate(`/resultat/${p.passationId}`)}
                                style={{ marginRight: 6 }}>
                          {t('mon_parcours.cta_voir')}
                        </button>
                        <button className="btn sec sm"
                                disabled={regenerationEnCours === p.passationId}
                                onClick={() => handleTelechargerPdf(p.passationId, p.referentielNom)}>
                          {regenerationEnCours === p.passationId
                            ? t('mon_parcours.regen_en_cours')
                            : t('mon_parcours.cta_pdf')}
                        </button>
                        {messageRegen?.id === p.passationId && (
                          <div className="hint" style={{
                            marginTop: 6,
                            fontSize: 'var(--fs-caption)',
                            color: messageRegen.type === 'ok' ? 'var(--teal)' : '#d45219',
                          }}>
                            {messageRegen.texte}
                          </div>
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
