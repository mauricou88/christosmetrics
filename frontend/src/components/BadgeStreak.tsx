import { useId, useState } from 'react';
import { useTranslation } from 'react-i18next';

/** Badge discret ; le record est disponible au survol et par expansion au clic ou au clavier. */
export function BadgeStreak({ streakActuel, streakRecord }: { streakActuel: number; streakRecord: number }) {
  const { t } = useTranslation();
  const [ouvert, setOuvert] = useState(false);
  const id = useId();
  const jours = Number.isFinite(streakActuel) ? Math.max(0, Math.trunc(streakActuel)) : 0;
  const record = t('progression.streak_record', { count: Math.max(jours, Number.isFinite(streakRecord) ? Math.trunc(streakRecord) : 0) });
  // L’emoji de la traduction est remplacé visuellement par une flamme SVG à la couleur du thème.
  const label = (jours === 0 ? t('progression.streak_zero') : jours === 1 ? t('progression.streak_un') : t('progression.streak', { count: jours })).replace(/^🔥\s*/u, '');

  return (
    <div className={`badge-streak${jours >= 7 ? ' badge-streak--record' : ''}${jours === 0 ? ' badge-streak--debut' : ''}`}>
      <button type="button" className="badge-streak-bouton" title={record} aria-expanded={ouvert} aria-controls={id} onClick={() => setOuvert(valeur => !valeur)}>
        <svg className="badge-streak-flamme" width="20" height="24" viewBox="0 0 24 28" aria-hidden="true" focusable="false">
          <path d="M13 2c1 6-4 7-4 12-2-1-3-3-3-5C1 14 1 18 4 23c4 6 14 5 17-2 3-7-1-11-4-14 0 4-2 5-3 6 2-5 1-8-1-11Z" fill="currentColor" />
        </svg>
        <span>{label}</span>
      </button>
      <p className="badge-streak-detail" id={id} hidden={!ouvert}>{record}</p>
    </div>
  );
}
