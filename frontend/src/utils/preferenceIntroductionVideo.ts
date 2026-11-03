const CLE_INTRODUCTION_VIDEO = 'intro-video-proposee';
let traiteeEnMemoire = false;

/** Vérifie si la proposition vidéo a déjà été acceptée ou passée sur cet appareil. */
export function introductionVideoTraitee(): boolean {
  if (traiteeEnMemoire) return true;
  try {
    return localStorage.getItem(CLE_INTRODUCTION_VIDEO) === 'true';
  } catch {
    return false;
  }
}

/** Mémorise le choix sans bloquer la visite si le stockage du navigateur est indisponible. */
export function memoriserIntroductionVideo(): void {
  traiteeEnMemoire = true;
  try {
    localStorage.setItem(CLE_INTRODUCTION_VIDEO, 'true');
  } catch {
    // La mémorisation en mémoire évite les répétitions pendant cette session.
  }
}
