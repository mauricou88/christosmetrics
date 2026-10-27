import { useEffect, useState } from 'react';
import { Link, useNavigate, useSearchParams } from 'react-router-dom';
import { useTranslation } from 'react-i18next';
import { useAuth } from '../context/AuthContext';
import { listerReferentiels } from '../api/referentiels';
import { chargerMonParcours, type SyntheseGlobale } from '../api/synthese';
import { SyntheseFruits } from '../components/SyntheseFruits';
import { destinationFruit, FRUITS_A_CONCEVOIR, ORDRE_FRUITS, passationPourFruit, referentielsIndividuels } from '../utils/parcours';
import type { ReferentielResume } from '../types';

/** Affiche les parcours et leur progression dans la langue choisie, sans modifier les codes API. */
export function MenuPage() {
  const { t } = useTranslation();
  const { user, deconnexion } = useAuth();
  const navigate = useNavigate();
  const [params, setParams] = useSearchParams();
  const vue = params.get('vue') === 'individuel' ? 'individuel' : 'menu';
  const [refs, setRefs] = useState<ReferentielResume[]>([]);
  const [synthese, setSynthese] = useState<SyntheseGlobale | null>(null);
  const [chargement, setChargement] = useState(true);
  const [erreur, setErreur] = useState<{ message?: string } | null>(null);
  const [erreurParcours, setErreurParcours] = useState(false);
  const [actualisation, setActualisation] = useState(0);

  useEffect(() => {
    let annule = false;
    setChargement(true);
    setErreur(null);
    setErreurParcours(false);
    Promise.allSettled([listerReferentiels(), chargerMonParcours()]).then(([catalogue, parcours]) => {
      if (annule) return;
      if (catalogue.status === 'fulfilled') setRefs(catalogue.value);
      else setErreur({ message: catalogue.reason instanceof Error ? catalogue.reason.message : undefined });
      if (parcours.status === 'fulfilled') setSynthese(parcours.value);
      else {
        setSynthese(null);
        setErreurParcours(true);
      }
      setChargement(false);
    });
    return () => { annule = true; };
  }, [actualisation]);

  const individuels = referentielsIndividuels(refs);
  const couple = refs.find(r => r.type === 'COUPLE');
  const passationCouple = couple ? passationPourFruit(synthese?.passations ?? [], couple.code) : undefined;
  const aConcevoir = FRUITS_A_CONCEVOIR.filter(f => !individuels.some(r => r.code === f.code));
  /** Relance les chargements ; changer de langue ne déclenche aucun nouvel appel réseau. */
  const reessayer = () => setActualisation(valeur => valeur + 1);

  return (
    <div className="wrap menu-page">
      <div className="session-bar">
        <span>{t('commun.bonjour', { prenom: user?.prenom ?? '' })}</span>
        <div className="session-actions">
          <Link className="btn ghost sm" to="/mon-parcours">{t('commun.mon_parcours')}</Link>
          <button className="btn ghost sm" onClick={() => { deconnexion(); navigate('/'); }}>{t('commun.deconnexion')}</button>
        </div>
      </div>

      {chargement ? <p role="status">{t('menu.chargement')}</p> : erreur ? (
        <div className="card" role="alert">
          <h1>{t('menu.erreur_catalogue_titre')}</h1>
          <p>{erreur.message ?? t('menu.catalogue_indisponible')}</p>
          <button className="btn" onClick={reessayer}>{t('commun.reessayer')}</button>
        </div>
      ) : (
        <>
          {vue === 'menu' ? (
            <>
              <div className="eyebrow">{t('menu.eyebrow')}</div>
              <h1>{t('menu.titre')}</h1>
              <p className="lede">{t('menu.lede')}</p>
              <div className="fruits parcours-choix">
                <button className="fruit" data-on="1" onClick={() => setParams({ vue: 'individuel' })}>
                  <span className="n">{t('menu.parcours_individuel.numero')}</span>
                  <span className="nm">{t('menu.parcours_individuel.titre')}</span>
                  <span className="st">{t('menu.parcours_individuel.description', { nombre: individuels.length })}</span>
                </button>
                <button className="fruit" data-on={couple ? '1' : '0'} disabled={!couple}
                        onClick={() => couple && navigate(destinationFruit(couple.code, passationCouple))}>
                  <span className="n">{t('menu.parcours_couple.numero')}</span>
                  <span className="nm">{t('menu.parcours_couple.titre')}</span>
                  <span className="st">{t('menu.parcours_couple.description')}</span>
                  {passationCouple?.etat === 'TERMINEE' && passationCouple.scoreGlobalArrondi != null && (
                    <span className="fruit-progression">{t('menu.teste_couple', { score: passationCouple.scoreGlobalArrondi })}</span>
                  )}
                  {passationCouple?.etat === 'EN_COURS' && <span className="fruit-progression">{t('menu.reprendre')}</span>}
                </button>
              </div>
            </>
          ) : (
            <>
              <button className="btn ghost sm lien-retour" onClick={() => setParams({})}>{t('menu.individuel.retour')}</button>
              <div className="eyebrow">{t('menu.individuel.eyebrow')}</div>
              <h1>{t('menu.individuel.titre')}</h1>
              <p className="lede">{t('menu.individuel.lede')}</p>
              <div className="verse">
                {t('commun.verset')}
                <span>{t('commun.verset_ref')}</span>
              </div>
              <div className="fruits">
                {individuels.map((r, index) => {
                  const p = passationPourFruit(synthese?.passations ?? [], r.code);
                  const termine = p?.etat === 'TERMINEE' && p.scoreGlobalArrondi != null;
                  return (
                    <button key={r.code} className="fruit" data-on="1" onClick={() => navigate(destinationFruit(r.code, p))}>
                      <span className="n">{String(index + 1).padStart(2, '0')}</span>
                      <span className="nm">{t(`menu.fruits.${r.code}`, { defaultValue: r.nom })}</span>
                      <span className="st">{t('menu.domaines_questions', { domaines: r.nbDimensions, questions: r.nbQuestions })}</span>
                      {termine && <span className="fruit-progression">{t('menu.teste_pourcentage', { score: p.scoreGlobalArrondi })}</span>}
                      {p?.etat === 'EN_COURS' && <span className="fruit-progression">{t('menu.reprendre')}</span>}
                    </button>
                  );
                })}
                {aConcevoir.map(f => (
                  <button key={f.code} className="fruit" data-on="0" disabled>
                    <span className="n">{String(ORDRE_FRUITS.indexOf(f.code) + 1).padStart(2, '0')}</span>
                    <span className="nm">{t(`menu.fruits.${f.code}`, { defaultValue: f.nom })}</span>
                    <span className="st">{t('menu.a_concevoir')}</span>
                  </button>
                ))}
              </div>
            </>
          )}

          {erreurParcours && (
            <div className="qualif erreur-parcours" role="alert">
              <p>{t('menu.erreur_parcours')}{' '}{t('menu.erreur_parcours_aide')}</p>
              <button className="btn ghost sm" onClick={reessayer}>{t('menu.recharger_resultats')}</button>
            </div>
          )}
          {synthese && <SyntheseFruits referentiels={individuels} synthese={synthese} />}
        </>
      )}

      <div className="menu-footer">
        <Link to="/">{t('menu.presentation')}</Link>
        <Link className="suppression-discrete" to="/supprimer-compte">{t('commun.supprimer_compte')}</Link>
      </div>
    </div>
  );
}
