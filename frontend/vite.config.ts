import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
import { VitePWA } from 'vite-plugin-pwa';

// Configuration Vite : plugin React + port dev.
// L'URL de l'API est lue via import.meta.env.VITE_API_URL (voir .env).
export default defineConfig({
  plugins: [
    react(),
    VitePWA({
      registerType: 'autoUpdate',
      includeAssets: ['favicon.ico', 'apple-touch-icon.png'],
      manifest: {
        name: 'CHRISTOSMETRICS',
        short_name: 'Christos',
        description: 'Diagnostic chrétien du fruit de l\'Esprit (Galates 5:22) — mesure, histoire et synthèse CHRISTOS.',
        theme_color: '#2F6F7F',
        background_color: '#F2F6F7',
        display: 'standalone',
        orientation: 'portrait',
        start_url: '/',
        scope: '/',
        lang: 'fr',
        icons: [
          { src: 'pwa-192x192.png', sizes: '192x192', type: 'image/png' },
          { src: 'pwa-512x512.png', sizes: '512x512', type: 'image/png' },
          { src: 'pwa-maskable-512x512.png', sizes: '512x512', type: 'image/png', purpose: 'maskable' }
        ]
      },
      workbox: {
        skipWaiting: true,
        clientsClaim: true,
        globPatterns: ['**/*.{js,css,html,svg,png,ico,woff2}'],
        navigateFallback: '/index.html',
        runtimeCaching: [
          {
            urlPattern: ({ url }) => url.origin === 'https://christosmetrics-backend.onrender.com' && url.pathname.startsWith('/api/referentiels'),
            handler: 'NetworkFirst',
            options: {
              cacheName: 'api-referentiels',
              networkTimeoutSeconds: 10,
              expiration: { maxEntries: 20, maxAgeSeconds: 60 * 60 * 24 * 7 }
            }
          },
          {
            urlPattern: ({ url }) => url.origin === 'https://christosmetrics-backend.onrender.com',
            handler: 'NetworkOnly'
          }
        ]
      }
    })
  ],
  server: { port: 5173 },
});
