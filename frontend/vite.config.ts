import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

// Configuration Vite : plugin React + port dev.
// L'URL de l'API est lue via import.meta.env.VITE_API_URL (voir .env).
export default defineConfig({
  plugins: [react()],
  server: { port: 5173 },
});
