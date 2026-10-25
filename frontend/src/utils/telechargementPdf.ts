/**
 * Téléchargement/partage de PDF multi-plateforme.
 *
 * - Web : télécharge via <a download> (comportement natif du navigateur).
 * - Android : enregistre dans Téléchargements puis ouvre le lecteur PDF.
 * - iOS : prépare un fichier temporaire puis ouvre le partage natif.
 */

import { Capacitor, registerPlugin } from '@capacitor/core';
import { Filesystem, Directory } from '@capacitor/filesystem';
import { Share } from '@capacitor/share';
import { getToken } from '../api/client';

const EnregistrementPdf = registerPlugin<{
  enregistrer(options: { nomFichier: string; base64: string }): Promise<{ uri: string; ouvert: boolean }>;
}>('EnregistrementPdf');

/** Convertit un Blob en chaîne base64 (sans le préfixe data:). */
function blobEnBase64(blob: Blob): Promise<string> {
  return new Promise((resolve, reject) => {
    const reader = new FileReader();
    reader.onloadend = () => {
      const r = reader.result as string;
      const virgule = r.indexOf(',');
      resolve(virgule >= 0 ? r.substring(virgule + 1) : r);
    };
    reader.onerror = reject;
    reader.readAsDataURL(blob);
  });
}

/**
 * Télécharge (web), enregistre et ouvre (Android), ou partage (iOS) un PDF.
 * Renvoie une promesse résolue quand l'action utilisateur est terminée.
 */
export async function telechargerOuPartagerPdf(
  blob: Blob,
  nomFichier: string,
): Promise<void> {
  if (!Capacitor.isNativePlatform()) {
    // --- WEB : simple téléchargement ---
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = nomFichier;
    document.body.appendChild(a);
    a.click();
    setTimeout(() => { URL.revokeObjectURL(url); a.remove(); }, 1500);
    return;
  }

  const base64 = await blobEnBase64(blob);
  if (Capacitor.getPlatform() === 'android') {
    const resultat = await EnregistrementPdf.enregistrer({ nomFichier, base64 });
    if (!resultat.ouvert) throw new Error('PDF enregistré dans Téléchargements. Aucun lecteur PDF disponible pour l’ouvrir sur le téléphone.');
    return;
  }

  // Le cache est partageable via FileProvider sur Android, sans permission de stockage.
  const result = await Filesystem.writeFile({
    path: nomFichier,
    data: base64,
    directory: Directory.Cache,
    recursive: true,
  });
  await Share.share({
    title: 'Restitution CHRISTOSMETRICS',
    text: 'Votre restitution personnelle',
    files: [result.uri],
    dialogTitle: 'Partager ou enregistrer la restitution',
  });
}

/** Récupère un PDF privé avec les headers, puis enregistre et ouvre le fichier local. */
export async function telechargerPdfServeur(url: string, nomFichier: string): Promise<void> {
  const token = getToken();
  if (!token) throw new Error('Votre session est absente. Veuillez vous reconnecter.');
  const reponse = await fetch(url, {
    headers: {
      Authorization: `Bearer ${token}`,
      'ngrok-skip-browser-warning': 'true',
    },
  });
  if (reponse.status !== 200) throw new Error(`Erreur HTTP ${reponse.status}`);
  const blob = await reponse.blob();
  const signature = new TextDecoder().decode(await blob.slice(0, 5).arrayBuffer());
  if (signature !== '%PDF-') throw new Error('Le serveur ne renvoie pas un PDF valide.');
  await telechargerOuPartagerPdf(blob, nomFichier);
}
