package com.christosmetrics.application.dto;

import java.time.Instant;
import java.util.List;

/** DTOs de l'historique et de la synthèse CHRISTOS globale. */
public class HistoriqueDtos {

    public record PassationResume(
            Long passationId, String referentielCode, String referentielNom,
            String type, String etat, Instant debuteeLe, Instant termineeLe,
            Double scoreGlobal, Integer scoreGlobalArrondi, boolean pdfDisponible) { }

    /** complet = tous les référentiels INDIVIDUELS actifs ont une passation TERMINEE. */
    public record SyntheseGlobale(
            int nbTestsRealises, int nbTestsAttendus, boolean complet,
            Double scoreGlobal, Integer scoreGlobalArrondi,
            List<PassationResume> passations) { }
}
