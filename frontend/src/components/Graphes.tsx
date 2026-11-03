import { Radar, Bar } from 'react-chartjs-2';
import {
  Chart as ChartJS, RadialLinearScale, PointElement, LineElement,
  Filler, CategoryScale, LinearScale, BarElement, Tooltip,
} from 'chart.js';
import type { ScoreDimension } from '../types';

// Enregistrement des éléments Chart.js utilisés.
ChartJS.register(
  RadialLinearScale, PointElement, LineElement, Filler,
  CategoryScale, LinearScale, BarElement, Tooltip
);

const TEAL = '#0D6D80';

/** Résout les tokens CSS en pixels pour les API Canvas et Chart.js. */
function taillePolice(token: '--fs-caption' | '--fs-small'): number {
  const valeur = typeof window === 'undefined'
    ? ''
    : window.getComputedStyle(document.documentElement).getPropertyValue(token);
  const taille = Number.parseFloat(valeur);
  return Number.isFinite(taille) && taille > 0 ? taille : (ChartJS.defaults.font.size ?? 12);
}

/**
 * Decoupe un label en lignes de ~<= maxChars pour que Chart.js l'affiche sur
 * plusieurs lignes (API Chart.js : retourner un array = plusieurs lignes).
 * Preserve les mots entiers. Max 2 lignes pour garder le radar lisible.
 */
function wrapLabel(label: string, maxChars = 12): string | string[] {
  if (label.length <= maxChars) return label;
  const mots = label.split(/\s+/);
  if (mots.length === 1) return label; // un seul mot long, on garde (ex. "Intrapersonnelle")
  const lignes: string[] = ['', ''];
  let idx = 0;
  for (const mot of mots) {
    const prochaineLigne = lignes[idx] ? lignes[idx] + ' ' + mot : mot;
    if (prochaineLigne.length <= maxChars || idx === 1) {
      lignes[idx] = prochaineLigne;
    } else {
      idx = 1;
      lignes[idx] = mot;
    }
  }
  return lignes[1] ? lignes : lignes[0];
}

/**
 * RADAR « Votre portrait » — un axe par dimension, échelle 0..100 %.
 */
export function RadarPortrait({ dimensions }: { dimensions: ScoreDimension[] }) {
  const data = {
    labels: dimensions.map(d => d.libelleCourt),
    datasets: [{
      data: dimensions.map(d => Math.round(d.pourcentage)),
      borderColor: TEAL,
      backgroundColor: 'rgba(13,109,128,0.12)',
      pointBackgroundColor: '#ED621E',
      pointBorderColor: '#fff',
      pointBorderWidth: 2, borderWidth: 2, pointRadius: 4,
    }],
  };
  const options = {
    responsive: true, maintainAspectRatio: false,
    plugins: { legend: { display: false } },
    scales: {
      r: {
        beginAtZero: true, max: 100,
        ticks: { stepSize: 20, font: { size: taillePolice('--fs-caption') }, backdropColor: 'transparent' },
        grid: { color: '#D8E4E7' },
        pointLabels: {
          font: { size: taillePolice('--fs-caption') },
          padding: 10,
          centerPointLabels: false,
          callback: (label: string) => wrapLabel(label, 12),
        },
      },
    },
    layout: { padding: { top: 8, right: 8, bottom: 8, left: 8 } },
  };
  return <div style={{ height: 420, maxWidth: 460, margin: '0 auto' }}><Radar data={data} options={options} /></div>;
}

/**
 * ENTONNOIR « Votre niveau de manifestation » — barres horizontales
 * jointives, % centrés en blanc, sans axe (rendu épuré comme le PDF).
 */
export function EntonnoirManifestation({ dimensions }: { dimensions: ScoreDimension[] }) {
  const data = {
    labels: dimensions.map(d => d.libelleCourt),
    datasets: [{
      data: dimensions.map(d => Math.round(d.pourcentage)),
      backgroundColor: TEAL,
      categoryPercentage: 0.96,
      barPercentage: 1.0,
    }],
  };

  // Plugin : écrit le % centré dans la barre (ou à droite si trop courte).
  const valuesPlugin = {
    id: 'valuesOnBars',
    /** Dessine les pourcentages avec la taille canonique des métadonnées. */
    afterDatasetsDraw(chart: ChartJS) {
      const { ctx } = chart;
      const meta = chart.getDatasetMeta(0);
      meta.data.forEach((bar: any, i: number) => {
        const val = (chart.data.datasets[0].data as number[])[i];
        const largeur = bar.x - bar.base;
        ctx.save();
        ctx.font = `bold ${taillePolice('--fs-small')}px Inter, sans-serif`;
        ctx.textBaseline = 'middle';
        if (largeur > 26) {
          ctx.fillStyle = '#fff'; ctx.textAlign = 'center';
          ctx.fillText(`${val}%`, bar.base + largeur / 2, bar.y);
        } else {
          ctx.fillStyle = TEAL; ctx.textAlign = 'left';
          ctx.fillText(`${val}%`, bar.x + 5, bar.y);
        }
        ctx.restore();
      });
    },
  };

  const options = {
    indexAxis: 'y' as const,
    responsive: true, maintainAspectRatio: false,
    layout: { padding: { right: 16 } },
    plugins: { legend: { display: false }, tooltip: { enabled: false } },
    scales: {
      x: { beginAtZero: true, max: 100, display: false, grid: { display: false } },
      y: { ticks: { font: { size: taillePolice('--fs-caption') }, callback: function(this: any, val: unknown) { const lbl = this.getLabelForValue(val as number); return wrapLabel(lbl, 16); } }, grid: { display: false } },
    },
  };

  return (
    <div style={{ height: 400 }}>
      <Bar data={data} options={options} plugins={[valuesPlugin]} />
    </div>
  );
}
