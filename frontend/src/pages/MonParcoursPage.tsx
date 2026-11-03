import { useEffect, useState } from 'react';
import { useTranslation } from 'react-i18next';
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
  const { t, i18n } = useTranslation();
  const langue = i18n.resolvedLanguage ?? i18n.language;
  const navigate = useNavigate();
  const { user } = useAuth();
  const [synthese, setSynthese] = useState<SyntheseGlobale | null>(null);
  const [erreur, setErreur] = useState<string | null>(null);
  const [chargement, setChargement] = useState(true);

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

  async function handleTelechargerPdf(passationId: number, nomFruit: string) {
    try {
      if (!user) throw new Error(t('mon_parcours.veuillez_reconnecter'));
      await telechargerPdfServeur(
        urlTelechargementPdf(passationId),
        nomRestitutionPdf(nomFruit, user.email),
      );
    } catch (e) {
      alert(t('mon_parcours.telechargement_impossible', { raison: (e as Error).message }));
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
                        {p.pdfDisponible && (
                          <button className="btn sec sm"
                                  onClick={() => handleTelechargerPdf(p.passationId, p.referentielNom)}>
                            {t('mon_parcours.cta_pdf')}
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
