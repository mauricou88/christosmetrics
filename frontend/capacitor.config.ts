import type { CapacitorConfig } from '@capacitor/cli';

/**
 * Configuration de l'app native CHRISTOSMETRICS.
 * - appId : identifiant inversé (règles App Store / Play Store).
 * - webDir : où Vite produit les assets (après `npm run build`).
 * - server.androidScheme = 'https' pour que le WebView Android envoie des
 *   headers Origin corrects (sinon file:// → CORS cassé).
 */
const config: CapacitorConfig = {
  appId: 'app.christosmetrics.mobile',
  appName: 'CHRISTOSMETRICS',
  webDir: 'dist',
  bundledWebRuntime: false,
  server: {
    androidScheme: 'https',
  },
  plugins: {
    SplashScreen: {
      launchShowDuration: 1500,
      backgroundColor: '#F2F6F7',
      androidScaleType: 'CENTER_CROP',
      showSpinner: false,
    },
    StatusBar: {
      style: 'DARK',
      backgroundColor: '#F2F6F7',
    },
  },
};

export default config;
