/** Appels API PDF : upload + téléchargement. */
import { getToken } from './client';

const BASE_URL = import.meta.env.VITE_API_URL ?? 'http://localhost:8080';

/** Téléverse le PDF généré côté client ; le serveur le stocke + envoie par mail. */
export async function televerserPdf(
  passationId: number, fichier: Blob, nomFichier: string
): Promise<{ pdfId: number; tailleOctets: number; hashSha256: string; envoiMailDeclenche: boolean }> {
  const form = new FormData();
  form.append('fichier', fichier, nomFichier);
  const token = getToken();
  const res = await fetch(`${BASE_URL}/api/passations/${passationId}/pdf`, {
    method: 'POST',
    headers: {
      'ngrok-skip-browser-warning': 'true',
      ...(token ? { Authorization: `Bearer ${token}` } : {}),
    },
    body: form,
  });
  if (!res.ok) throw new Error(`Upload PDF échoué : ${res.status}`);
  return res.json();
}

export function urlTelechargementPdf(passationId: number): string {
  return `${BASE_URL}/api/passations/${passationId}/pdf`;
}
