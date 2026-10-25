import { useEffect, useState } from 'react';
import { Link, useNavigate, useSearchParams } from 'react-router-dom';
import { useAuth } from '../context/AuthContext';
import { listerReferentiels } from '../api/referentiels';
import { chargerMonParcours, type SyntheseGlobale } from '../api/synthese';
import { SyntheseFruits } from '../components/SyntheseFruits';
import { destinationFruit, FRUITS_A_CONCEVOIR, ORDRE_FRUITS, passationPourFruit, referentielsIndividuels } from '../utils/parcours';
import type { ReferentielResume } from '../types';

export function MenuPage() {
  const { user, deconnexion } = useAuth();
  const navigate = useNavigate();
  const [params, setParams] = useSearchParams();
  const vue = params.get('vue') === 'individuel' ? 'individuel' : 'menu';
  const [refs, setRefs] = useState<ReferentielResume[]>([]);
  const [synthese, setSynthese] = useState<SyntheseGlobale | null>(null);
  const [chargement, setChargement] = useState(true);
  const [erreur, setErreur] = useState<string | null>(null);
  const [erreurParcours, setErreurParcours] = useState<string | null>(null);
  const [actualisation, setActualisation] = useState(0);

  useEffect(() => {
    let annule = false;
    setChargement(true);
    setErreur(null);
    setErreurParcours(null);
    Promise.allSettled([listerReferentiels(), chargerMonParcours()]).then(([catalogue, parcours]) => {
      if (annule) return;
      if (catalogue.status === 'fulfilled') setRefs(catalogue.value);
      else setErreur(catalogue.reason instanceof Error ? catalogue.reason.message : 'Catalogue indisponible.');
      if (parcours.status === 'fulfilled') setSynthese(parcours.value);
      else {
        setSynthese(null);
        setErreurParcours('Vos résultats ne peuvent pas être chargés pour le moment.');
      }
      setChargement(false);
    });
    return () => { annule = true; };
  }, [actualisation]);

  const individuels = referentielsIndividuels(refs);
  const couple = refs.find(r => r.type === 'COUPLE');
  const passationCouple = couple ? passationPourFruit(synthese?.passations ?? [], couple.code) : undefined;
  const aConcevoir = FRUITS_A_CONCEVOIR.filter(f => !individuels.some(r => r.code === f.code));
  const reessayer = () => setActualisation(valeur => valeur + 1);

  return (
    <div className="wrap menu-page">
      <div className="session-bar">
        <span>Bonjour {user?.prenom}</span>
        <div className="session-actions">
          <Link className="btn ghost sm" to="/mon-parcours">Mon parcours</Link>
          <button className="btn ghost sm" onClick={() => { deconnexion(); navigate('/'); }}>Se déconnecter</button>
        </div>
      </div>

      {chargement ? <p role="status">Chargement de vos parcours…</p> : erreur ? (
        <div className="card" role="alert">
          <h1>Impossible de charger le catalogue</h1>
          <p>{erreur}</p>
          <button className="btn" onClick={reessayer}>Réessayer</button>
        </div>
      ) : (
        <>
          {vue === 'menu' ? (
            <>
              <div className="eyebrow">CHRISTOSMETRICS · Auto-diagnostic</div>
              <h1>Que souhaitez-vous évaluer ?</h1>
              <p className="lede">Choisissez votre parcours. Chaque diagnostic produit une restitution personnelle avec vos scores, vos graphiques et votre PDF.</p>
              <div className="fruits parcours-choix">
                <button className="fruit" data-on="1" onClick={() => setParams({ vue: 'individuel' })}>
                  <span className="n">PARCOURS 1</span>
                  <span className="nm">Individuel</span>
                  <span className="st">Évaluez chaque fruit en profondeur. {individuels.length} questionnaires disponibles ; Douceur et Maîtrise de soi à concevoir.</span>
                </button>
                <button className="fruit" data-on={couple ? '1' : '0'} disabled={!couple}
                        onClick={() => couple && navigate(destinationFruit(couple.code, passationCouple))}>
                  <span className="n">PARCOURS 2</span>
                  <span className="nm">Couple</span>
                  <span className="st">Évaluez la dynamique spirituelle de votre couple sur les neuf fruits. Une affirmation par fruit.</span>
                  {passationCouple?.etat === 'TERMINEE' && passationCouple.scoreGlobalArrondi != null && (
                    <span className="fruit-progression">✓ Testé — {passationCouple.scoreGlobalArrondi}/36 · Voir ma restitution</span>
                  )}
                  {passationCouple?.etat === 'EN_COURS' && <span className="fruit-progression">En cours · Reprendre</span>}
                </button>
              </div>
            </>
          ) : (
            <>
              <button className="btn ghost sm lien-retour" onClick={() => setParams({})}>← Choisir un parcours</button>
              <div className="eyebrow">Auto-diagnostic individuel</div>
              <h1>Où en êtes-vous du fruit de l’Esprit ?</h1>
              <p className="lede">Choisissez un fruit. Retrouvez vos résultats ou reprenez un questionnaire en cours.</p>
              <div className="verse">
                « Mais le fruit de l’Esprit, c’est l’amour, la joie, la paix, la patience, la bonté, la bienveillance, la fidélité, la douceur, la maîtrise de soi. »
                <span>Galates 5.22</span>
              </div>
              <div className="fruits">
                {individuels.map((r, index) => {
                  const p = passationPourFruit(synthese?.passations ?? [], r.code);
                  const termine = p?.etat === 'TERMINEE' && p.scoreGlobalArrondi != null;
                  return (
                    <button key={r.code} className="fruit" data-on="1" onClick={() => navigate(destinationFruit(r.code, p))}>
                      <span className="n">{String(index + 1).padStart(2, '0')}</span>
                      <span className="nm">{r.nom}</span>
                      <span className="st">{r.nbDimensions} domaines · {r.nbQuestions} questions</span>
                      {termine && <span className="fruit-progression">✓ Testé — {p.scoreGlobalArrondi}% · Voir ma restitution</span>}
                      {p?.etat === 'EN_COURS' && <span className="fruit-progression">En cours · Reprendre</span>}
                    </button>
                  );
                })}
                {aConcevoir.map(f => (
                  <button key={f.code} className="fruit" data-on="0" disabled>
                    <span className="n">{String(ORDRE_FRUITS.indexOf(f.code) + 1).padStart(2, '0')}</span>
                    <span className="nm">{f.nom}</span>
                    <span className="st">À concevoir</span>
                  </button>
                ))}
              </div>
            </>
          )}

          {erreurParcours && (
            <div className="qualif erreur-parcours" role="alert">
              <p>{erreurParcours} Réessayez pour retrouver vos scores et vos questionnaires en cours.</p>
              <button className="btn ghost sm" onClick={reessayer}>Recharger mes résultats</button>
            </div>
          )}
          {synthese && <SyntheseFruits referentiels={individuels} synthese={synthese} />}
        </>
      )}

      <div className="menu-footer">
        <Link to="/">But et fonctionnement de l’application</Link>
        <Link className="suppression-discrete" to="/supprimer-compte">Supprimer mon compte</Link>
      </div>
    </div>
  );
}
