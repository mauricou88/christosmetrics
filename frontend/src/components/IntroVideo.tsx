import { useEffect, useRef, useState } from 'react';
import { useTranslation } from 'react-i18next';

type LangueVideo = 'fr' | 'en';

/**
 * Lecteur de la vidéo d'introduction CHRISTOSMETRICS, affiché en superposition.
 * - Démarre en autoplay MUET (exigence des navigateurs) avec les sous-titres
 *   déjà incrustés dans la vidéo.
 * - Bouton son pour activer/couper l'audio.
 * - Sélecteur FR / EN : charge la version correspondante (français par défaut,
 *   ou la langue de l'application).
 */
export function IntroVideo({ onClose }: { onClose: () => void }) {
  const { t, i18n } = useTranslation();
  const prefere = (i18n.resolvedLanguage ?? i18n.language ?? 'fr').slice(0, 2);
  const [langue, setLangue] = useState<LangueVideo>(prefere === 'en' ? 'en' : 'fr');
  const [muet, setMuet] = useState(true);
  const videoRef = useRef<HTMLVideoElement>(null);
  const dialogueRef = useRef<HTMLDivElement>(null);

  const base = import.meta.env.BASE_URL || '/';
  const src = `${base}videos/christos-intro-${langue}.mp4`;

  // Applique l'état muet au vrai élément vidéo (React ne le reflète pas toujours)
  // et relance la lecture après un changement de langue.
  useEffect(() => {
    const v = videoRef.current;
    if (!v) return;
    v.muted = muet;
    const p = v.play();
    if (p && typeof p.catch === 'function') p.catch(() => { /* autoplay bloqué : l'utilisateur lancera via les contrôles */ });
  }, [muet, langue]);

  // Place le focus dans le lecteur et empêche le défilement de la page derrière lui.
  useEffect(() => {
    const precedent = document.activeElement;
    const overflowPrecedent = document.body.style.overflow;
    document.body.style.overflow = 'hidden';
    dialogueRef.current?.focus();
    return () => {
      document.body.style.overflow = overflowPrecedent;
      if (precedent instanceof HTMLElement && precedent.isConnected) precedent.focus();
    };
  }, []);

  // Ferme avec Échap et garde la navigation clavier dans le dialogue.
  useEffect(() => {
    const onKey = (e: KeyboardEvent) => {
      if (e.key === 'Escape') { e.preventDefault(); onClose(); }
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
  }, [onClose]);

  return (
    <div ref={dialogueRef} tabIndex={-1} className="intro-video-overlay" role="dialog" aria-modal="true" aria-label={t('intro_video.titre')}>
      <div className="intro-video-box">
        <video
          key={langue}
          ref={videoRef}
          className="intro-video-player"
          src={src}
          autoPlay
          muted={muet}
          playsInline
          controls
          tabIndex={0}
          preload="auto"
        />
        <div className="intro-video-controls">
          <div className="intro-video-langs" role="group" aria-label={t('profil.langue')}>
            <button type="button" className={langue === 'fr' ? 'iv-lang on' : 'iv-lang'} aria-pressed={langue === 'fr'} onClick={() => setLangue('fr')}>FR</button>
            <button type="button" className={langue === 'en' ? 'iv-lang on' : 'iv-lang'} aria-pressed={langue === 'en'} onClick={() => setLangue('en')}>EN</button>
          </div>
          <button type="button" className="btn ghost sm" onClick={() => setMuet(m => !m)}>
            {muet ? t('intro_video.son_on') : t('intro_video.son_off')}
          </button>
          <button type="button" className="btn sm" onClick={onClose}>{t('intro_video.fermer')}</button>
        </div>
      </div>
    </div>
  );
}
