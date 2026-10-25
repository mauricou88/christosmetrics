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
        ticks: { stepSize: 20, font: { size: 10 } },
        grid: { color: '#D8E4E7' },
        pointLabels: { font: { size: 11 } },
      },
    },
  };
  return <div style={{ height: 400 }}><Radar data={data} options={options} /></div>;
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
    afterDatasetsDraw(chart: ChartJS) {
      const { ctx } = chart;
      const meta = chart.getDatasetMeta(0);
      meta.data.forEach((bar: any, i: number) => {
        const val = (chart.data.datasets[0].data as number[])[i];
        const largeur = bar.x - bar.base;
        ctx.save();
        ctx.font = 'bold 12px Inter, sans-serif';
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
      y: { ticks: { font: { size: 11 } }, grid: { display: false } },
    },
  };

  return (
    <div style={{ height: 400 }}>
      <Bar data={data} options={options} plugins={[valuesPlugin]} />
    </div>
  );
}
