import { useEffect, useRef, useState, type FormEvent } from 'react';
import { useTranslation } from 'react-i18next';
import { reconnaitreSujetAssistant, referenceSujetAssistant, type SujetAssistant } from '../utils/assistantFruits';

type Echange = { question: string; sujet: SujetAssistant | null; id: number };
const SUGGESTIONS = ['definition', 'liste', 'croissance', 'tests'] as const;

/** Propose une conversation FAQ locale ; les échanges restent en mémoire sur cette page. */
export function AssistantFruits() {
  const { t, i18n } = useTranslation();
  const [ouvert, setOuvert] = useState(false);
  const [question, setQuestion] = useState('');
  const [echanges, setEchanges] = useState<Echange[]>([]);
  const dialogueRef = useRef<HTMLDialogElement>(null);
  const champRef = useRef<HTMLInputElement>(null);
  const finRef = useRef<HTMLDivElement>(null);
  const prochainId = useRef(0);

  // Le dialogue natif gère le focus clavier et la fermeture avec Échap.
  useEffect(() => {
    const dialogue = dialogueRef.current;
    if (!dialogue) return;
    if (ouvert && !dialogue.open) { dialogue.showModal(); champRef.current?.focus(); }
    else if (!ouvert && dialogue.open) dialogue.close();
  }, [ouvert]);

  // Ferme aussi le dialogue si une navigation vers un test démonte le composant.
  useEffect(() => () => { dialogueRef.current?.close(); }, []);
  useEffect(() => { if (ouvert) finRef.current?.scrollIntoView({ block: 'nearest' }); }, [echanges, ouvert]);

  /** Ajoute une question et son sujet ; limite l’historique aux dix derniers échanges. */
  function poserQuestion(texte: string) {
    const saisie = texte.trim().slice(0, 300);
    if (!saisie) return;
    const echange = { question: saisie, sujet: reconnaitreSujetAssistant(saisie), id: prochainId.current++ };
    setEchanges(anciens => [...anciens.slice(-9), echange]);
    setQuestion('');
    champRef.current?.focus();
  }

  /** Envoie la saisie sans recharger la page ni appeler de service externe. */
  function soumettre(event: FormEvent) {
    event.preventDefault();
    poserQuestion(question);
  }

  /** Affiche un lien vers le passage biblique, dans une traduction adaptée à la langue. */
  function reference(sujet: SujetAssistant | null) {
    const ref = referenceSujetAssistant(sujet);
    if (!ref) return null;
    const langue = (i18n.resolvedLanguage ?? i18n.language ?? 'fr').split('-')[0];
    const version = ({ fr: 'LSG', en: 'NIV', es: 'NVI', pt: 'ARA' } as Record<string, string>)[langue] ?? 'LSG';
    const passage = ref === 'jean' ? 'John 15:4-5' : 'Galatians 5:22-23';
    return <a className="assistant-reference" href={`https://www.biblegateway.com/passage/?search=${encodeURIComponent(passage)}&version=${version}`}
      target="_blank" rel="noopener noreferrer">{t(`assistant_fruits.references.${ref}`)}</a>;
  }

  return (
    <>
      <button type="button" className="assistant-declencheur" aria-haspopup="dialog"
        aria-controls="assistant-fruits" aria-expanded={ouvert} onClick={() => setOuvert(true)}>
        <span aria-hidden="true">💬</span><span>{t('assistant_fruits.ouvrir')}</span>
      </button>
      <dialog id="assistant-fruits" ref={dialogueRef} className="assistant-dialogue"
        aria-labelledby="assistant-fruits-titre" onCancel={() => setOuvert(false)} onClose={() => setOuvert(false)}>
        <div className="assistant-entete">
          <div><h2 id="assistant-fruits-titre">{t('assistant_fruits.titre')}</h2>
            <p>{t('assistant_fruits.sous_titre')}</p></div>
          <button type="button" className="assistant-fermer" aria-label={t('assistant_fruits.fermer')}
            onClick={() => setOuvert(false)}>×</button>
        </div>
        <div className="assistant-conversation" role="log" aria-live="polite" aria-relevant="additions" aria-label={t('assistant_fruits.conversation')}>
          <p className="assistant-reponse">{t('assistant_fruits.bienvenue')}</p>
          {echanges.map(echange => (
            <div key={echange.id} className="assistant-echange">
              <p className="assistant-question"><span className="assistant-auteur">{t('assistant_fruits.vous')}</span>{echange.question}</p>
              <div className="assistant-reponse"><span className="assistant-auteur">{t('assistant_fruits.nom')}</span>
                <p>{echange.sujet ? t(`assistant_fruits.sujets.${echange.sujet}.reponse`) : t('assistant_fruits.inconnu')}</p>
                {reference(echange.sujet)}
              </div>
            </div>
          ))}
          <div ref={finRef} />
        </div>
        <div className="assistant-suggestions" aria-label={t('assistant_fruits.suggestions')}>
          {SUGGESTIONS.map(sujet => <button key={sujet} type="button" onClick={() => poserQuestion(t(`assistant_fruits.sujets.${sujet}.question`))}>
            {t(`assistant_fruits.sujets.${sujet}.question`)}</button>)}
        </div>
        <form className="assistant-formulaire" onSubmit={soumettre}>
          <label htmlFor="assistant-question">{t('assistant_fruits.votre_question')}</label>
          <div><input id="assistant-question" ref={champRef} value={question} maxLength={300}
            onChange={event => setQuestion(event.target.value)} placeholder={t('assistant_fruits.exemple')} autoComplete="off" />
            <button type="submit" className="btn sm" disabled={!question.trim()}>{t('assistant_fruits.envoyer')}</button></div>
        </form>
        <p className="assistant-note">{t('assistant_fruits.note')}</p>
      </dialog>
    </>
  );
}
