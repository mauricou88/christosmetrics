import { useEffect, useState, type KeyboardEvent } from 'react';
import useEmblaCarousel from 'embla-carousel-react';
import { useNavigate } from 'react-router-dom';
import { useTranslation } from 'react-i18next';

/** Dessine les trois illustrations avec les couleurs du thème courant. */
function IllustrationIntroduction({ ecran }: { ecran: number }) {
  return (
    <svg viewBox="0 0 240 240" fill="none" stroke="var(--teal)" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true" focusable="false">
      {ecran === 0 ? (
        <>
          <circle cx="120" cy="105" r="85" fill="var(--teal-xl)" stroke="none" />
          <path d="M120 209V91M120 146l-33-30m33 12 35-35M78 210h84" strokeWidth="5" />
          <path d="M120 48C82 42 49 67 53 99c-22 29 4 62 38 56 20 22 47 19 61 0 40 4 58-35 36-60 6-33-30-55-68-47Z" fill="var(--surface)" />
          <path d="M120 176V85m0 51-29-27m29 7 30-29" strokeWidth="4" />
          <g fill="var(--orange)" stroke="none">
            <circle cx="82" cy="91" r="8" /><circle cx="153" cy="113" r="9" /><circle cx="119" cy="66" r="7" /><circle cx="99" cy="145" r="7" />
          </g>
        </>
      ) : ecran === 1 ? (
        <>
          <circle cx="120" cy="120" r="96" fill="var(--teal-xl)" stroke="none" />
          <path d="m120 35 74 43v84l-74 43-74-43V78Z" fill="var(--surface)" strokeWidth="3" />
          <path d="M120 35v170M46 78l148 84M194 78 46 162" opacity=".3" />
          <path d="m120 67 45 27v51l-45 27-45-27V94Z" fill="var(--teal-xl)" />
          <g fill="var(--orange)" stroke="var(--surface)" strokeWidth="4">
            <circle cx="120" cy="35" r="10" /><circle cx="194" cy="78" r="10" /><circle cx="194" cy="162" r="10" />
            <circle cx="120" cy="205" r="10" /><circle cx="46" cy="162" r="10" /><circle cx="46" cy="78" r="10" />
          </g>
          <circle cx="120" cy="120" r="8" fill="var(--teal)" />
        </>
      ) : (
        <>
          <circle cx="120" cy="120" r="96" fill="var(--orange-xl)" stroke="none" />
          <path d="M65 25h83l31 32v158H65Z" fill="var(--surface)" />
          <path d="M148 25v32h31M84 77h45M84 87h65M84 185h48M84 196h66" />
          <path d="m122 102 34 20v39l-34 20-34-20v-39Z" fill="var(--teal-xl)" />
          <path d="m122 113 26 15-8 28-18 15-25-22 6-20Z" fill="var(--teal-xl)" stroke="var(--orange)" strokeWidth="3" />
          <path d="M122 102v79m-34-59 68 39m0-39-68 39" opacity=".25" />
        </>
      )}
    </svg>
  );
}

/** Présentation swipable ; les boutons et les flèches permettent aussi de naviguer sans geste. */
export function OnboardingPage({ onTermine }: { onTermine: () => void }) {
  const { t } = useTranslation();
  const navigate = useNavigate();
  const [actif, setActif] = useState(0);
  const [emblaRef, emblaApi] = useEmblaCarousel({ loop: false });
  const ecrans = ['ecran1', 'ecran2', 'ecran3'] as const;

  useEffect(() => {
    if (!emblaApi) return;
    /** Synchronise les points et les boutons après un swipe ou un redimensionnement. */
    const synchroniserEcran = () => setActif(emblaApi.selectedScrollSnap());
    synchroniserEcran();
    emblaApi.on('select', synchroniserEcran).on('reInit', synchroniserEcran);
    return () => {
      emblaApi.off('select', synchroniserEcran).off('reInit', synchroniserEcran);
    };
  }, [emblaApi]);

  /** Termine l’introduction et retourne à l’accueil sans rester piégé par un stockage bloqué. */
  function terminer() {
    try { localStorage.setItem('onboarding-done', 'true'); }
    catch { /* L’état du layout conserve ce choix pour la session en cours. */ }
    onTermine();
    navigate('/', { replace: true });
  }

  /** Respecte la préférence de réduction des animations lors des déplacements par bouton. */
  function allerEcran(index: number) {
    const reduireMouvement = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
    emblaApi?.scrollTo(index, reduireMouvement);
  }

  /** Permet le parcours des écrans au clavier depuis le carrousel. */
  function parcourirEcrans(event: KeyboardEvent<HTMLDivElement>) {
    if (event.key !== 'ArrowRight' && event.key !== 'ArrowLeft') return;
    event.preventDefault();
    allerEcran(Math.max(0, Math.min(2, actif + (event.key === 'ArrowRight' ? 1 : -1))));
  }

  return (
    <div className="onboarding-page">
      <div className="onboarding-top">
        {actif < 2 && <button className="btn ghost sm" type="button" onClick={terminer}>{t('onboarding.passer')}</button>}
      </div>
      <div className="onboarding-viewport" ref={emblaRef} tabIndex={0} onKeyDown={parcourirEcrans} role="region" aria-label={t('onboarding.navigation')}>
        <div className="onboarding-track">
          {ecrans.map((ecran, index) => (
            <section className="onboarding-slide" key={ecran} aria-hidden={index !== actif} aria-labelledby={`intro-titre-${index}`}>
              <div className="onboarding-art"><IllustrationIntroduction ecran={index} /></div>
              <h1 id={`intro-titre-${index}`}>{t(`onboarding.${ecran}.titre`)}</h1>
              <p>{t(`onboarding.${ecran}.pitch`)}</p>
            </section>
          ))}
        </div>
      </div>
      <div className="onboarding-actions">
        <div className="onboarding-dots" role="group" aria-label={t('onboarding.navigation')}>
          {ecrans.map((ecran, index) => (
            <button className="onboarding-dot" type="button" key={ecran} onClick={() => allerEcran(index)}
              aria-label={t('onboarding.progression', { actuel: index + 1, total: 3 })}
              aria-current={index === actif ? 'step' : undefined} />
          ))}
        </div>
        <p className="onboarding-status" aria-live="polite" aria-atomic="true">{t('onboarding.progression', { actuel: actif + 1, total: 3 })}</p>
        {actif === 2
          ? <button type="button" className="btn" onClick={terminer}>{t('onboarding.commencer')}</button>
          : <button type="button" className="btn" onClick={() => allerEcran(actif + 1)}>{t('commun.suivant')}</button>}
      </div>
    </div>
  );
}
