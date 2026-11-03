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

  // Fermeture à la touche Échap.
  useEffect(() => {
    const onKey = (e: KeyboardEvent) => { if (e.key === 'Escape') onClose(); };
    window.addEventListener('keydown', onKey);
    return () => window.removeEventListener('keydown', onKey);
  }, [onClose]);

  return (
    <div className="intro-video-overlay" role="dialog" aria-modal="true" aria-label={t('intro_video.titre')}>
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
