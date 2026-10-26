import sharp from 'sharp';
import { mkdir } from 'node:fs/promises';

const publicDir = new URL('../public/', import.meta.url);
await mkdir(publicDir, { recursive: true });

for (const { filename, size, margin } of [
  { filename: 'pwa-192x192.png', size: 192, margin: 0 },
  { filename: 'pwa-512x512.png', size: 512, margin: 0 },
  { filename: 'pwa-maskable-512x512.png', size: 512, margin: 80 },
]) {
  const contentSize = size - margin * 2;
  const svg = `<svg xmlns="http://www.w3.org/2000/svg" width="${size}" height="${size}" viewBox="0 0 ${size} ${size}">
    <rect width="${size}" height="${size}" fill="#2F6F7F" />
    <svg x="${margin}" y="${margin}" width="${contentSize}" height="${contentSize}" viewBox="0 0 512 512">
      <text x="256" y="256" dy="0.35em" text-anchor="middle" font-family="Arial, sans-serif" font-size="240" font-weight="bold" fill="white">CM</text>
    </svg>
  </svg>`;
  const outputPath = new URL(filename, publicDir);
  await sharp(Buffer.from(svg)).png().toFile(outputPath.pathname.replace(/^\/(?=[A-Za-z]:)/, ''));
  console.log(`Generated ${filename} (${size}x${size})`);
}