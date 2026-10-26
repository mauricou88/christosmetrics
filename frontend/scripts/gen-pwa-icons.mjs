import sharp from 'sharp';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const ROOT = path.resolve(__dirname, '..');
const PUBLIC = path.join(ROOT, 'public');
const SOURCE = path.join(PUBLIC, 'christosmetrics-logo.png');

const BG = { r: 0xF2, g: 0xF6, b: 0xF7, alpha: 1 };

async function makeIcon({ size, logoRatio, outputName }) {
  const canvas = sharp({
    create: { width: size, height: size, channels: 4, background: BG }
  });

  const maxLogoWidth = Math.round(size * logoRatio);
  const resized = await sharp(SOURCE)
    .resize({ width: maxLogoWidth, fit: 'inside', withoutEnlargement: false })
    .toBuffer();

  const metadata = await sharp(resized).metadata();
  const left = Math.round((size - metadata.width) / 2);
  const top = Math.round((size - metadata.height) / 2);

  const outputPath = path.join(PUBLIC, outputName);
  await canvas
    .composite([{ input: resized, left, top }])
    .png()
    .toFile(outputPath);

  console.log(`✓ ${outputName} (${size}x${size}, logo ${metadata.width}x${metadata.height})`);
}

(async () => {
  await makeIcon({ size: 192, logoRatio: 0.78, outputName: 'pwa-192x192.png' });
  await makeIcon({ size: 512, logoRatio: 0.78, outputName: 'pwa-512x512.png' });
  // Maskable : safe zone 60% (le reste est "mangé" par les masques Android)
  await makeIcon({ size: 512, logoRatio: 0.56, outputName: 'pwa-maskable-512x512.png' });
  console.log('\nTerminé.');
})();
