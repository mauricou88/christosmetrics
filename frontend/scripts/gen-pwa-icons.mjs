import sharp from 'sharp';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const ROOT = path.resolve(__dirname, '..');
const PUBLIC = path.join(ROOT, 'public');
const SOURCE = path.join(PUBLIC, 'christosmetrics-logo.png');

const BG_OPAQUE = { r: 0xF2, g: 0xF6, b: 0xF7, alpha: 1 };
const BG_TRANSPARENT = { r: 0, g: 0, b: 0, alpha: 0 };

async function makeIcon({ size, logoRatio, outputName, background }) {
  const canvas = sharp({
    create: { width: size, height: size, channels: 4, background }
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

  console.log(`✓ ${outputName} (${size}x${size}, logo ${metadata.width}x${metadata.height}, fond ${background.alpha === 0 ? 'transparent' : 'opaque'})`);
}

(async () => {
  // Icônes classiques — fond transparent
  await makeIcon({ size: 192, logoRatio: 0.88, outputName: 'pwa-192x192.png', background: BG_TRANSPARENT });
  await makeIcon({ size: 512, logoRatio: 0.88, outputName: 'pwa-512x512.png', background: BG_TRANSPARENT });
  // Maskable — fond opaque OBLIGATOIRE pour Android (sinon le masque casse le rendu)
  await makeIcon({ size: 512, logoRatio: 0.56, outputName: 'pwa-maskable-512x512.png', background: BG_OPAQUE });
  // Apple touch icon — transparent (iOS 15+ gère bien)
  await makeIcon({ size: 180, logoRatio: 0.88, outputName: 'apple-touch-icon.png', background: BG_TRANSPARENT });
  console.log('\nTerminé.');
})();
