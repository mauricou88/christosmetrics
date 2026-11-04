export const SUJETS_ASSISTANT = [
  'definition', 'liste', 'amour', 'joie', 'paix', 'patience', 'bonte', 'fidelite',
  'douceur', 'maitrise', 'croissance', 'tests', 'bonjour',
] as const;
export type SujetAssistant = typeof SUJETS_ASSISTANT[number];

const MOTS_SUJETS: Partial<Record<SujetAssistant, string[]>> = {
  maitrise: ['maitrise de soi', 'self control', 'dominio propio', 'dominio proprio', 'autocontrole'],
  amour: ['amour', 'love', 'amor'],
  joie: ['joie', 'joy', 'alegria'],
  paix: ['paix', 'peace', 'paz'],
  patience: ['patience', 'patient', 'forbearance', 'paciencia'],
  bonte: ['bonte', 'bienveillance', 'kindness', 'goodness', 'bondad', 'benevolencia', 'bondade', 'benignidade', 'amabilidad'],
  fidelite: ['fidelite', 'faithfulness', 'fidelidad', 'fidelidade'],
  douceur: ['douceur', 'gentleness', 'mansedumbre', 'humildad', 'mansidao'],
  croissance: ['grandir', 'cultiver', 'progresser', 'developper', 'grow', 'growth', 'develop', 'crecer', 'cultivar', 'crescer'],
  tests: ['christosmetrics', 'test', 'tests', 'testes', 'questionnaire', 'questionnaires', 'score', 'scores', 'resultat', 'resultats', 'assessment', 'results', 'resultados', 'evaluacion', 'avaliacao'],
};

/** Normalise accents, apostrophes et ponctuation sans transformer le texte saisi à l’écran. */
function normaliserQuestion(question: string): string {
  return question.toLowerCase().normalize('NFD').replace(/[\u0300-\u036f]/g, '')
    .replace(/[^a-z0-9]+/g, ' ').trim();
}

/** Identifie un sujet connu par mots entiers ; retourne null plutôt que d’inventer une réponse. */
export function reconnaitreSujetAssistant(question: string): SujetAssistant | null {
  const texte = normaliserQuestion(question);
  if (!texte) return null;
  if (/^(bonjour|salut|hello|hi|hola|ola|bonsoir|merci|thanks|gracias|obrigado|obrigada)$/.test(texte)) return 'bonjour';
  if (/\b(fruit|fruits|fruto|frutos|esprit|spirit|espiritu|espirito)\b/.test(texte)
    && /\b(9|neuf|nine|nueve|nove|liste|list|lista|quels|which|cuales|quais)\b/.test(texte)) return 'liste';
  const mots = ` ${texte} `;
  for (const [sujet, termes] of Object.entries(MOTS_SUJETS)) {
    if (termes.some(terme => mots.includes(` ${terme} `))) return sujet as SujetAssistant;
  }
  if (['fruit de l esprit', 'fruits de l esprit', 'fruit of the spirit', 'fruits of the spirit',
    'fruto del espiritu', 'frutos del espiritu', 'fruto do espirito', 'frutos do espirito']
    .some(expression => mots.includes(` ${expression} `))) return 'definition';
  return null;
}

/** Associe un repère biblique aux réponses concernées ; les conseils sont des pistes de réflexion. */
export function referenceSujetAssistant(sujet: SujetAssistant | null): 'galates' | 'jean' | null {
  if (!sujet || sujet === 'bonjour' || sujet === 'tests') return null;
  return sujet === 'croissance' ? 'jean' : 'galates';
}
