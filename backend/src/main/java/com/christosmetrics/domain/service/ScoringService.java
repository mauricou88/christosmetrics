package com.christosmetrics.domain.service;

import com.christosmetrics.domain.model.*;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * MOTEUR DE SCORING — cœur métier pur (aucune dépendance base de données).
 *
 * Applique les règles RG-01 à RG-09. Ce service est volontairement isolé :
 *  - il ne connaît ni HTTP, ni JPA ;
 *  - il prend des entités du domaine + les valeurs saisies, et renvoie un
 *    objet de résultat calculé ;
 *  - il est donc trivial à tester unitairement (voir ScoringServiceTest).
 *
 * Deux modes selon le type de référentiel :
 *  - INDIVIDUEL : chaque dimension est notée en %, le global est la moyenne
 *    non pondérée des dimensions (échelle 1..5).
 *  - COUPLE : une seule "question" par dimension, échelle 1..4, le global est
 *    la SOMME des points (/36) ; le % par dimension = points/4 × 100.
 */
@Service
public class ScoringService {

    /** Échelle max selon le type (5 en individuel, 4 en couple). */
    private int maxEchelle(Referentiel.Type type) {
        return type == Referentiel.Type.COUPLE ? 4 : 5;
    }

    /**
     * Calcule le résultat complet d'une passation terminée.
     *
     * @param passation la passation (fournit référentiel + réponses)
     * @return le résultat calculé (scores par dimension, global, top/flop)
     */
    public ResultatCalcule calculer(Passation passation) {
        Referentiel ref = passation.getReferentiel();
        int max = maxEchelle(ref.getType());

        // Indexer les réponses par identifiant de question pour un accès O(1).
        Map<Long, Integer> valeurParQuestion = new HashMap<>();
        for (Reponse r : passation.getReponses()) {
            valeurParQuestion.put(r.getQuestion().getId(), r.getValeur());
        }

        List<ScoreDimension> scores = new ArrayList<>();
        for (Dimension dim : ref.getDimensions()) {
            scores.add(scorerDimension(dim, valeurParQuestion, max));
        }

        double global;
        int scoreBrutTotal = 0;
        if (ref.getType() == Referentiel.Type.COUPLE) {
            // RG-06 (couple) : somme des points bruts (une question par dimension).
            for (ScoreDimension s : scores) scoreBrutTotal += s.brut();
            global = scoreBrutTotal; // exprimé en points (/36)
        } else {
            // RG-06 (individuel) : moyenne non pondérée des pourcentages.
            global = scores.stream().mapToDouble(ScoreDimension::pourcentage).average().orElse(0);
        }

        // RG-09 : classements top/flop (sur le pourcentage), si demandé.
        List<ScoreDimension> tri = new ArrayList<>(scores);
        List<ScoreDimension> top = new ArrayList<>();
        List<ScoreDimension> flop = new ArrayList<>();
        int n = ref.getTopFlop();
        if (n > 0) {
            tri.sort(Comparator.comparingDouble(ScoreDimension::pourcentage).reversed());
            top = new ArrayList<>(tri.subList(0, Math.min(n, tri.size())));
            tri.sort(Comparator.comparingDouble(ScoreDimension::pourcentage));
            flop = new ArrayList<>(tri.subList(0, Math.min(n, tri.size())));
        }

        return new ResultatCalcule(scores, global, scoreBrutTotal, top, flop, ref.getType());
    }

    /**
     * Score d'une dimension.
     * RG-01/02 : points par question (inversés si polarité INVERSE).
     * RG-04/05 : normalisation en pourcentage sur l'amplitude de l'échelle.
     */
    private ScoreDimension scorerDimension(Dimension dim, Map<Long, Integer> valeurs, int max) {
        int brut = 0;
        int nbRepondues = 0;
        for (Question q : dim.getQuestions()) {
            Integer valeur = valeurs.get(q.getId());
            if (valeur == null) continue;              // question non répondue : ignorée
            int points = valeur;                        // RG-01
            if (q.estInverse()) points = (max + 1) - points; // RG-02
            brut += points;
            nbRepondues++;
        }
        // RG-05 : (brut − n·min) / (n·max − n·min) × 100, avec min = 1.
        double pourcentage = 0;
        if (nbRepondues > 0) {
            double amplitude = nbRepondues * (max - 1);
            pourcentage = (brut - nbRepondues) / amplitude * 100.0;
        }
        return new ScoreDimension(
                dim.getId(),
                dim.getLibelleCourt() != null ? dim.getLibelleCourt() : dim.getLibelle(),
                dim.getLibelle(),
                brut,
                nbRepondues,
                arrondi(pourcentage));
    }

    private double arrondi(double v) { return Math.round(v); }

    // ---- Objets de résultat (records immuables) ----

    /** Score d'une dimension : brut, nb de réponses, pourcentage arrondi. */
    public record ScoreDimension(
            Long dimensionId, String libelleCourt, String libelle,
            int brut, int nbRepondues, double pourcentage) { }

    /** Résultat complet d'une passation. */
    public record ResultatCalcule(
            List<ScoreDimension> dimensions,
            double global,          // % (individuel) ou points /36 (couple)
            int scoreBrutTotal,     // points bruts (utile pour le couple)
            List<ScoreDimension> top,
            List<ScoreDimension> flop,
            Referentiel.Type type) {

        /** Global arrondi (pratique pour la détection de tranche). */
        public int globalArrondi() { return (int) Math.round(global); }
    }
}
