import { useEffect, useRef, useState } from 'react';
import { useTranslation } from 'react-i18next';

type LangueVideo = 'fr' | 'en';

/**
 * Lecteur de la vidéo d'introduction CHRISTOSMETRICS, intégré à l’accueil ou en dialogue.
 * - Le dialogue démarre en autoplay MUET ; sur l’accueil, la lecture attend un clic.
 *   Les sous-titres sont
 *   déjà incrustés dans la vidéo.
 * - Bouton son pour activer/couper l'audio.
 * - Sélecteur FR / EN : charge la version correspondante (français par défaut,
 *   ou la langue de l'application).
 */
export function IntroVideo({ onClose, affichage = 'dialogue', lectureDemandee = false, onLecture }: {
  onClose?: () => void;
  affichage?: 'dialogue' | 'integre';
  lectureDemandee?: boolean;
  onLecture?: () => void;
}) {
  const integre = affichage === 'integre';
  const { t, i18n } = useTranslation();
  const prefere = (i18n.resolvedLanguage ?? i18n.language ?? 'fr').slice(0, 2);
  const [langue, setLangue] = useState<LangueVideo>(prefere === 'en' ? 'en' : 'fr');
  const [muet, setMuet] = useState(true);
  const videoRef = useRef<HTMLVideoElement>(null);
  const dialogueRef = useRef<HTMLDivElement>(null);

  const base = import.meta.env.BASE_URL || '/';
  const src = `${base}videos/christos-intro-${langue}.mp4`;

  // Suit le choix global du menu ; les boutons FR/EN du lecteur restent utilisables ensuite.
  useEffect(() => {
    setLangue(prefere === 'en' ? 'en' : 'fr');
  }, [prefere]);

  // Applique l'état muet au vrai élément vidéo (React ne le reflète pas toujours)
  // et relance la lecture après un changement de langue.
  useEffect(() => {
    const v = videoRef.current;
    if (!v) return;
    v.muted = muet;
    if (integre && !lectureDemandee) return;
    const p = v.play();
    if (p && typeof p.catch === 'function') p.catch(() => { /* autoplay bloqué : l'utilisateur lancera via les contrôles */ });
  }, [muet, langue, integre, lectureDemandee]);

  // Place le focus dans le lecteur et empêche le défilement de la page derrière lui.
  useEffect(() => {
    if (integre) return;
    const precedent = document.activeElement;
    const overflowPrecedent = document.body.style.overflow;
    document.body.style.overflow = 'hidden';
    dialogueRef.current?.focus();
    return () => {
      document.body.style.overflow = overflowPrecedent;
      if (precedent instanceof HTMLElement && precedent.isConnected) precedent.focus();
    };
  }, [integre]);

  // Ferme avec Échap et garde la navigation clavier dans le dialogue.
  useEffect(() => {
    if (integre) return;
    const onKey = (e: KeyboardEvent) => {
      if (e.key === 'Escape') { e.preventDefault(); onClose?.(); }
      if (e.key !== 'Tab') return;
      const elements = dialogueRef.current?.querySelectorAll<HTMLElement>('video, button');
      if (!elements?.length) return;
      const premier = elements[0], dernier = elements[elements.length - 1];
      if (e.shiftKey && (document.activeElement === premier || document.activeElement === dialogueRef.current)) {
        e.preventDefault(); dernier.focus();
      } else if (!e.shiftKey && document.activeElement === dernier) {
        e.preventDefault(); premier.focus();
      }
    };
    window.addEventListener('keydown', onKey);
    return () => window.removeEventListener('keydown', onKey);
  }, [onClose, integre]);

  return (
    <div ref={dialogueRef} tabIndex={integre ? undefined : -1}
      className={integre ? 'intro-video-integree' : 'intro-video-overlay'}
      role={integre ? undefined : 'dialog'} aria-modal={integre ? undefined : true} aria-label={t('intro_video.titre')}>
      <div className="intro-video-box">
        <video
          key={langue}
          ref={videoRef}
          className="intro-video-player"
          src={src}
          autoPlay={!integre}
          muted={muet}
          playsInline
          controls
          tabIndex={0}
          preload={integre ? 'metadata' : 'auto'}
          onPlay={onLecture}
        />
        <div className="intro-video-controls">
          <div className="intro-video-langs" role="group" aria-label={t('profil.langue')}>
            <button type="button" className={langue === 'fr' ? 'iv-lang on' : 'iv-lang'} aria-pressed={langue === 'fr'} onClick={() => setLangue('fr')}>FR</button>
            <button type="button" className={langue === 'en' ? 'iv-lang on' : 'iv-lang'} aria-pressed={langue === 'en'} onClick={() => setLangue('en')}>EN</button>
          </div>
          <button type="button" className="btn ghost sm" onClick={() => setMuet(m => !m)}>
            {muet ? t('intro_video.son_on') : t('intro_video.son_off')}
          </button>
          {!integre && onClose && <button type="button" className="btn sm" onClick={onClose}>{t('intro_video.fermer')}</button>}
        </div>
      </div>
    </div>
  );
}
