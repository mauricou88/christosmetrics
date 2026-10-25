/** Exemple : Paix + massado.suzy@yahoo.com → CHRISTOSMETRICS_Paix_massado.suzy_yahoo.com.pdf. */
export function nomRestitutionPdf(fruit: string, email: string): string {
  const nomFruit = fruit.trim().normalize('NFC').replace(/[^\p{L}\p{N}]+/gu, '_').replace(/^_+|_+$/g, '');
  const identifiant = email.trim().normalize('NFC').replace(/@/g, '_').replace(/[^\p{L}\p{N}._+-]+/gu, '_');
  if (!nomFruit || !identifiant) throw new Error('Le nom du fruit et l’adresse e-mail sont nécessaires pour nommer le PDF.');
  return `CHRISTOSMETRICS_${nomFruit}_${identifiant}.pdf`;
}
