/**
 * Types partagés du frontend, alignés sur les DTOs du backend.
 * Un seul endroit pour décrire les formes de données échangées avec l'API.
 */

export interface User {
  id: number;
  email: string;
  prenom: string;
  nom: string;
  eglise: string;
}

export interface AuthResponse {
  token: string;
  user: User;
}

export interface ReferentielResume {
  id: number;
  code: string;
  nom: string;
  type: 'INDIVIDUEL' | 'COUPLE';
  verset: string;
  topFlop: number;
  nbDimensions: number;
  nbQuestions: number;
}

export interface QuestionDto {
  id: number;
  position: number;
  texte: string;
}

export interface DimensionDto {
  id: number;
  position: number;
  libelle: string;
  libelleCourt: string;
  questions: QuestionDto[];
}

export interface ReferentielComplet {
  id: number;
  code: string;
  nom: string;
  type: 'INDIVIDUEL' | 'COUPLE';
  verset: string;
  topFlop: number;
  dimensions: DimensionDto[];
}

/** État d'avancement d'une passation (pour la reprise de progression). */
export interface Progression {
  passationId: number;
  totalQuestions: number;
  questionsRepondues: number;
  indexProchaineQuestion: number; // -1 si tout est répondu
  complete: boolean;
  reponses: Record<number, number>;
}

export interface ScoreDimension {
  libelle: string;
  libelleCourt: string;
  pourcentage: number;
}

export interface Tranche {
  min: number;
  max: number;
  texte: string;
  typeIcone: 'TRISTE' | 'NEUTRE' | 'CONTENT';
  nombreIcones: number;
  active: boolean;
}

export interface Resultat {
  passationId: number;
  referentielCode: string;
  referentielNom: string;
  type: 'INDIVIDUEL' | 'COUPLE';
  scoreGlobal: number;
  scoreGlobalArrondi: number;
  unite: 'POURCENTAGE' | 'POINTS_SUR_36';
  tranche: Tranche | null;
  bareme: Tranche[];
  dimensions: ScoreDimension[];
  top: ScoreDimension[];
  flop: ScoreDimension[];
}
