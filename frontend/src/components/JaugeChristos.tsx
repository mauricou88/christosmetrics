import { useNavigate } from 'react-router-dom';
import { useTranslation } from 'react-i18next';

type Props = {
  fruitsCompletes: number;
  fruitsTotal?: number;
  christosGlobalDisponible: boolean;
  scoreGlobal: number | null;
  variante?: 'banniere' | 'complete';
};

/** Jauge bornée, lisible au clavier ; le cercle démarre à midi et progresse dans le sens horaire. */
export function JaugeChristos({ fruitsCompletes, fruitsTotal = 6, christosGlobalDisponible, scoreGlobal, variante = 'complete' }: Props) {
  const { t, i18n } = useTranslation();
  const navigate = useNavigate();
  const total = Math.max(1, Math.trunc(Number.isFinite(fruitsTotal) ? fruitsTotal : 6));
  const faits = Math.min(total, Math.max(0, Math.trunc(Number.isFinite(fruitsCompletes) ? fruitsCompletes : 0)));
  const proportion = faits / total;
  const circonference = 2 * Math.PI * 64;
  const debloquee = christosGlobalDisponible && faits === total;
  const label = t('progression.jauge_label', { faits, total });
  const score = scoreGlobal != null && Number.isFinite(scoreGlobal)
    ? t('progression.score_global', { score: new Intl.NumberFormat(i18n.resolvedLanguage ?? 'fr', { maximumFractionDigits: 1 }).format(scoreGlobal) })
    : null;

  return (
    <button
      type="button"
      className={`jauge-christos jauge-christos--${variante}${debloquee ? ' jauge-christos--debloquee' : ''}`}
      onClick={() => navigate('/mon-parcours')}
      aria-label={[label, debloquee ? t('progression.christos_debloque') : null, debloquee ? score : null, t('progression.jauge_cta')].filter(Boolean).join(' · ')}
    >
      {variante === 'complete' ? (
        <span className="jauge-christos-cercle">
          <svg width="160" height="160" viewBox="0 0 160 160" aria-hidden="true" focusable="false">
            <circle cx="80" cy="80" r="64" fill="none" stroke="var(--line)" strokeWidth="8" />
            <circle className="jauge-christos-arc" cx="80" cy="80" r="64" fill="none" stroke="var(--teal)" strokeWidth="8" strokeLinecap="round"
              strokeDasharray={circonference} strokeDashoffset={circonference * (1 - proportion)} transform="rotate(-90 80 80)" opacity={faits === 0 ? 0 : 1} />
            <text className="jauge-christos-chiffre" x="80" y="80" textAnchor="middle">{faits} / {total}</text>
            <text className="jauge-christos-fruits" x="80" y="103" textAnchor="middle">{t('progression.fruits')}</text>
          </svg>
          {debloquee && <span className="jauge-christos-etoile" aria-hidden="true">⭐</span>}
        </span>
      ) : (
        <span className="jauge-christos-mesure">
          <strong>{label}</strong>
          <span className="jauge-christos-barre" aria-hidden="true"><span style={{ width: `${proportion * 100}%` }} /></span>
        </span>
      )}
      {debloquee ? (
        <span className="jauge-christos-message"><strong>{t('progression.christos_debloque')}</strong>{score && <span>{score}</span>}</span>
      ) : faits === 0 ? <span className="jauge-christos-message">{t('progression.premier_fruit')}</span> : null}
      <span className="jauge-christos-cta">{t('progression.jauge_cta')} <span aria-hidden="true">→</span></span>
    </button>
  );
}
