import { useState, useEffect, useCallback, useRef } from 'react';
import { useTranslation } from 'react-i18next';
import type { ReferentielComplet, QuestionDto } from '../types';
import { chargerReferentiel } from '../api/referentiels';
import { demarrerOuReprendre, repondre as apiRepondre, terminer } from '../api/passations';

/** Une réponse sauvegardée à la fois, puis une finalisation explicite. */
export function useQuestionnaire(code: string) {
  const { i18n } = useTranslation();
  const langue = i18n.resolvedLanguage ?? i18n.language;
  const [referentiel, setReferentiel] = useState<ReferentielComplet | null>(null);
  const [questionsAPlat, setQuestionsAPlat] = useState<QuestionDto[]>([]);
  const [passationId, setPassationId] = useState<number | null>(null);
  const [indexCourant, setIndexCourant] = useState(0);
  const [reponses, setReponses] = useState<Record<number, number>>({});
  const [chargement, setChargement] = useState(true);
  const [erreur, setErreur] = useState<string | null>(null);
  const [enregistrement, setEnregistrement] = useState(false);
  const [finalisation, setFinalisation] = useState(false);
  // Le verrou est immédiat, y compris avant le prochain rendu React.
  const actionEnCours = useRef(false);

  useEffect(() => {
    let annule = false;
    setChargement(true);
    setErreur(null);
    setReferentiel(null);
    setQuestionsAPlat([]);
    setPassationId(null);
    setReponses({});
    (async () => {
      try {
        const ref = await chargerReferentiel(code);
        const prog = await demarrerOuReprendre(code);
        if (annule) return;
        const plat = ref.dimensions.flatMap(d => d.questions);
        setReferentiel(ref);
        setQuestionsAPlat(plat);
        setPassationId(prog.passationId);
        setReponses(prog.reponses ?? {});
        // Un test entièrement répondu se rouvre sur la fin, prêt à terminer.
        const index = prog.complete ? plat.length - 1 : prog.indexProchaineQuestion;
        setIndexCourant(Math.max(0, Math.min(index, plat.length - 1)));
      } catch (e) {
        if (!annule) setErreur((e as Error).message);
      } finally {
        if (!annule) setChargement(false);
      }
    })();
    return () => { annule = true; };
  }, [code, langue]);

  const repondre = useCallback(async (valeur: number) => {
    if (passationId == null || chargement || actionEnCours.current) return;
    const question = questionsAPlat[indexCourant];
    if (!question) return;
    actionEnCours.current = true;
    setEnregistrement(true);
    setErreur(null);
    try {
      const prog = await apiRepondre(passationId, question.id, valeur);
      setReponses(anciennes => prog.reponses ?? { ...anciennes, [question.id]: valeur });
      // Se positionner à partir de la question enregistrée, jamais d'un index déjà incrémenté.
      setIndexCourant(Math.min(indexCourant + 1, questionsAPlat.length - 1));
    } catch (e) {
      setErreur((e as Error).message);
    } finally {
      actionEnCours.current = false;
      setEnregistrement(false);
    }
  }, [passationId, chargement, questionsAPlat, indexCourant]);

  const precedent = useCallback(() => {
    if (!actionEnCours.current) setIndexCourant(i => Math.max(0, i - 1));
  }, []);

  const nbRepondues = questionsAPlat.filter(q => reponses[q.id] != null).length;
  const total = questionsAPlat.length;
  const complet = total > 0 && nbRepondues === total;
  const premiereSansReponse = questionsAPlat.findIndex(q => reponses[q.id] == null);
  const allerPremiereSansReponse = useCallback(() => {
    if (!actionEnCours.current && premiereSansReponse >= 0) setIndexCourant(premiereSansReponse);
  }, [premiereSansReponse]);

  const finaliser = useCallback(async () => {
    if (passationId == null) throw new Error('Aucune passation en cours');
    if (actionEnCours.current) throw new Error('Veuillez attendre la fin de la sauvegarde.');
    if (!complet) {
      allerPremiereSansReponse();
      throw new Error(`Il reste ${total - nbRepondues} réponse(s) à enregistrer.`);
    }
    actionEnCours.current = true;
    setFinalisation(true);
    setErreur(null);
    try {
      return await terminer(passationId);
    } catch (e) {
      setErreur((e as Error).message);
      throw e;
    } finally {
      actionEnCours.current = false;
      setFinalisation(false);
    }
  }, [passationId, complet, allerPremiereSansReponse, total, nbRepondues]);

  return {
    referentiel, questionsAPlat, questionCourante: questionsAPlat[indexCourant],
    indexCourant, total, reponses, nbRepondues, complet,
    progression: total > 0 ? Math.round(nbRepondues / total * 100) : 0,
    chargement, erreur, enregistrement, finalisation,
    repondre, precedent, finaliser, allerPremiereSansReponse, premiereSansReponse,
    estDerniere: total > 0 && indexCourant === total - 1,
  };
}
