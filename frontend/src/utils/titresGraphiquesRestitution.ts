/** Composer les titres des graphiques à partir du code stable du fruit, dans la langue choisie. */
export function titresGraphiquesRestitution(code: string, langue = 'fr') {
  const textes = {
    fr: {
      portrait: 'Votre portrait', prefixe: 'Votre niveau de manifestation',
      fruits: {
        joie: 'de la joie', amour: 'de l’amour', patience: 'de la patience',
        fidelite: 'de la fidélité', paix: 'de la paix',
        bonte: 'de la bonté et de la bienveillance',
        couple: 'du fruit de l’Esprit dans le couple',
      },
    },
    en: {
      portrait: 'Your profile', prefixe: 'Your level of expression',
      fruits: {
        joie: 'of joy', amour: 'of love', patience: 'of patience',
        fidelite: 'of faithfulness', paix: 'of peace',
        bonte: 'of kindness and goodness', couple: 'of the fruit of the Spirit as a couple',
      },
    },
    es: {
      portrait: 'Su retrato', prefixe: 'Su nivel de manifestación',
      fruits: {
        joie: 'de la alegría', amour: 'del amor', patience: 'de la paciencia',
        fidelite: 'de la fidelidad', paix: 'de la paz',
        bonte: 'de la bondad y la benevolencia', couple: 'del fruto del Espíritu en la pareja',
      },
    },
    pt: {
      portrait: 'O seu retrato', prefixe: 'O seu nível de manifestação',
      fruits: {
        joie: 'da alegria', amour: 'do amor', patience: 'da paciência',
        fidelite: 'da fidelidade', paix: 'da paz',
        bonte: 'da bondade e da benevolência', couple: 'do fruto do Espírito no casal',
      },
    },
  };
  const langueCourte = langue.toLowerCase().split('-')[0] as keyof typeof textes;
  const t = textes[langueCourte] ?? textes.fr;
  const complement = t.fruits[code as keyof typeof t.fruits];
  return {
    portrait: t.portrait,
    manifestation: complement ? `${t.prefixe} ${complement}` : t.prefixe,
  };
}
