package com.christosmetrics.application.dto;

import java.util.List;
import java.util.Map;

/** DTOs du cycle de vie d'une passation (démarrage, réponse, progression). */
public class PassationDtos {

    /** État d'avancement renvoyé au client (pour reprendre où il en était). */
    public record ProgressionDto(
            Long passationId, int totalQuestions, int questionsRepondues,
            int indexProchaineQuestion, boolean complete,Map<Long, Integer> reponses) { }

    /** Enregistrement d'une réponse : quelle question, quelle valeur (1..5). */
    public record RepondreRequest(Long questionId, int valeur) { }

    /** Envoi groupé de réponses (utile pour le mode couple ou une reprise). */
    public record RepondreLotRequest(List<RepondreRequest> reponses) { }
}
