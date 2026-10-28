import { useEffect, useState } from 'react';
import { useTranslation } from 'react-i18next';
import { useParams, useNavigate } from 'react-router-dom';
import { chargerResultat } from '../api/passations';
import type { Resultat } from '../types';
import { RadarPortrait, EntonnoirManifestation } from '../components/Graphes';
import { televerserPdf } from '../api/pdf';
import { genererRestitutionPdf } from '../utils/pdfGenerator';
import { donneesRestitutionPdf } from '../utils/donneesRestitutionPdf';
import { useAuth } from '../context/AuthContext';
import { telechargerOuPartagerPdf } from '../utils/telechargementPdf';

function icones(type: 'TRISTE' | 'NEUTRE' | 'CONTENT', nombre: number, couleurBareme?: string) {
  const couleur = couleurBareme ?? (type === 'CONTENT' ? '#ED621E' : '#5A6B70');
  const bouche =
    type === 'TRISTE'
      ? <path d="M8 18 Q13 14 18 18" fill="none" stroke={couleur} strokeWidth="1.6" strokeLinecap="round" />
      : type === 'NEUTRE'
      ? <line x1="8.5" y1="17" x2="17.5" y2="17" stroke={couleur} strokeWidth="1.6" strokeLinecap="round" />
      : <path d="M8 16 Q13 20 18 16" fill="none" stroke={couleur} strokeWidth="1.6" strokeLinecap="round" />;
  const un = (k: number) => (
    <svg key={k} width="26" height="26" viewBox="0 0 26 26"
         style={{ display: 'inline-block', verticalAlign: 'middle', marginRight: 2 }}>
      <circle cx="13" cy="13" r="11" fill="none" stroke={couleur} strokeWidth="1.6" />
      <circle cx="9" cy="10" r="1.4" fill={couleur} />
      <circle cx="17" cy="10" r="1.4" fill={couleur} />
      {bouche}
    </svg>
  );
  return <>{Array.from({ length: Math.max(1, nombre) }, (_, k) => un(k))}</>;
}

/**
 * Page RÉSULTATS — affiche la restitution complète d'une passation.
 *
 * Le calcul et l'interprétation sont faits côté serveur. Le frontend reçoit
 * le score, le barème et la tranche active, puis les présente conformément
 * au POC.
 */
export function ResultatPage() {
  const { i18n } = useTranslation();
  const langue = i18n.resolvedLanguage ?? i18n.language;
  const { passationId } = useParams<{ passationId: string }>();
  const navigate = useNavigate();
  const [resultat, setResultat] = useState<Resultat | null>(null);
  const [erreur, setErreur] = useState<string | null>(null);
  const [pdfEnCours, setPdfEnCours] = useState(false);
  const [pdfMessage, setPdfMessage] = useState<string | null>(null);
  const { user } = useAuth();

  useEffect(() => {
    if (!passationId) return;
    let annule = false;
    setResultat(null);
    setErreur(null);
    chargerResultat(Number(passationId))
      .then(resultatCharge => { if (!annule) setResultat(resultatCharge); })
      .catch(e => { if (!annule) setErreur((e as Error).message); });
    return () => { annule = true; };
  }, [passationId, langue]);

  if (erreur) {
    return <div className="wrap"><p className="hint" style={{ color: '#d45219' }}>{erreur}</p></div>;
  }
  if (!resultat) {
    return <div className="wrap"><p>Chargement du résultat…</p></div>;
  }

  const estCouple = resultat.type === 'COUPLE';
  const suffixeScore = resultat.unite === 'POURCENTAGE' ? '%' : '';
  const libelleScore = resultat.unite === 'POINTS_SUR_36'
    ? 'points sur 36'
    : 'de conformité globale';

  return (
    <div className="wrap result-page">
      <div className="eyebrow">Restitution personnelle · {resultat.referentielNom}</div>
      <h1>Votre portrait</h1>

      <div className="score-hero">
        <div>
          <div className="big">{resultat.scoreGlobalArrondi}{suffixeScore}</div>
          <div className="lb">{libelleScore}</div>
        </div>
        {resultat.tranche && (
          <div className="interp">
            <span className="interp-icon" aria-hidden="true">
              {icones(resultat.tranche.typeIcone, resultat.tranche.nombreIcones)}
            </span>
            <p>{resultat.tranche.texte}</p>
          </div>
        )}
      </div>

      <div className="charts">
        <div className="chart">
          <h3>{estCouple ? 'Portrait du couple' : 'Mon portrait'}</h3>
          <RadarPortrait dimensions={resultat.dimensions} />
        </div>
        <div className="chart">
          <h3>Niveau de manifestation par domaine</h3>
          <EntonnoirManifestation dimensions={resultat.dimensions} />
        </div>
      </div>

      {(resultat.top.length > 0 || resultat.flop.length > 0) && (
        <div className="tops">
          <div className="card">
            <h3>✨ Points forts</h3>
            <ol>
              {resultat.top.map((d, i) => (
                <li key={i}>
                  {d.libelleCourt}
                  <span className="pct">{Math.round(d.pourcentage)}%</span>
                </li>
              ))}
            </ol>
          </div>
          <div className="card">
            <h3>💪 À travailler</h3>
            <ol>
              {resultat.flop.map((d, i) => (
                <li key={i}>
                  {d.libelleCourt}
                  <span className="pct">{Math.round(d.pourcentage)}%</span>
                </li>
              ))}
            </ol>
          </div>
        </div>
      )}

      {resultat.bareme.length > 0 && (
        <section className="bareme" aria-labelledby="titre-bareme">
          <h2 id="titre-bareme">
            Barème d'interprétation de la conformité globale
          </h2>
          <p className="hint bareme-intro">Votre tranche est indiquée en rouge.</p>
          <div className="bareme-list">
            {resultat.bareme.map((tranche, index) => (
              <div
                key={`${tranche.min}-${tranche.max}-${index}`}
                className={`bareme-row ${tranche.active ? 'actif' : ''}`}
                aria-current={tranche.active ? 'true' : undefined}
              >
                <span className="tranche">
                  {tranche.min} – {tranche.max}{estCouple ? '' : '%'}
                </span>
                <span
                  className="emoji"
                  aria-label={`${tranche.nombreIcones} niveau(x) ${tranche.typeIcone.toLowerCase()}`}
                >
                  {icones(tranche.typeIcone, tranche.nombreIcones, tranche.active ? '#FF0000' : '#000000')}
                </span>
                <span className="txt">{tranche.texte}</span>
              </div>
            ))}
          </div>
        </section>
      )}

      <div className="controls">
        <button className="btn sec" onClick={telechargerEtEnvoyerPdf} disabled={pdfEnCours}>
          {pdfEnCours ? '⏳ Génération…' : '📄 Enregistrer le PDF et demander l’envoi par e-mail'}
        </button>
        <button className="btn ghost" onClick={() => navigate(estCouple ? '/menu' : '/menu?vue=individuel')}>
          {estCouple ? 'Retour au menu' : 'Choisir un autre fruit'}
        </button>
        <button className="btn ghost sm" onClick={() => navigate('/mon-parcours')}>
          📊 Mon parcours
        </button>
      </div>
      {pdfMessage && (
        <p className="hint" style={{ marginTop: 10, color: pdfMessage.startsWith('✓') ? 'var(--teal)' : undefined }}>
          {pdfMessage}
        </p>
      )}
    </div>
  );

  /** Génère le PDF (rendu POC) côté client, télécharge + envoie au serveur. */
  async function telechargerEtEnvoyerPdf() {
    if (!resultat || !user) return;
    setPdfEnCours(true); setPdfMessage(null);
    try {
      const { fruitConfig, resultatPoc } = donneesRestitutionPdf(resultat);
      const { blob, nomFichier } = genererRestitutionPdf(
        fruitConfig, resultatPoc,
        { prenom: user.prenom, nom: user.nom, email: user.email, eglise: user.eglise }
      );
      setPdfMessage('Choisissez où enregistrer le PDF. Sauvegarde serveur en cours…');
      // Les deux opérations restent indépendantes, même si le sélecteur est annulé.
      const [local, serveur] = await Promise.allSettled([
        telechargerOuPartagerPdf(blob, nomFichier),
        televerserPdf(resultat.passationId, blob, nomFichier),
      ]);
      const messageLocal = local.status === 'fulfilled'
        ? 'PDF enregistré. Ouverture ou partage effectué sur votre appareil.'
        : `Enregistrement local : ${local.reason instanceof Error ? local.reason.message : String(local.reason)}`;
      const messageServeur = serveur.status === 'fulfilled'
        ? serveur.value.envoiMailDeclenche
          ? 'PDF sauvegardé sur le serveur. Envoi par e-mail demandé.'
          : 'PDF sauvegardé sur le serveur. Envoi par e-mail désactivé : configuration SMTP nécessaire.'
        : `Sauvegarde serveur / e-mail : ${serveur.reason instanceof Error ? serveur.reason.message : String(serveur.reason)}`;
      setPdfMessage(`${local.status === 'fulfilled' && serveur.status === 'fulfilled' ? '✓ ' : ''}${messageLocal} ${messageServeur}`);
    } catch (e) {
      setPdfMessage('Erreur : ' + (e as Error).message);
    } finally {
      setPdfEnCours(false);
    }
  }
}
