package com.christosmetrics.application.dto;

import java.util.List;

/**
 * Résultat exposé au client : score global, tranche, scores par dimension,
 * top/flop. C'est ce que consomment le radar, l'entonnoir et le PDF.
 */
public record ResultatDto(
        Long passationId,
        String referentielCode,
        String referentielNom,
        String type,
        double scoreGlobal,          // % (individuel) ou points /36 (couple)
        int scoreGlobalArrondi,
        String unite,
        TrancheDto tranche,
        List<TrancheDto> bareme,
        List<ScoreDimensionDto> dimensions,
        List<ScoreDimensionDto> top,
        List<ScoreDimensionDto> flop) {

    public record ScoreDimensionDto(
            String libelle, String libelleCourt, double pourcentage) { }

    public record TrancheDto(
            int min,
            int max,
            String texte,
            String typeIcone,
            int nombreIcones,
            boolean active) { }
}
