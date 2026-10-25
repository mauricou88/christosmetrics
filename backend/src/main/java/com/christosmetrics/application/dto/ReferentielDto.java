package com.christosmetrics.application.dto;

import java.util.List;

/**
 * DTOs de référentiel exposés au client pour afficher un questionnaire.
 * Le client reçoit les dimensions et leurs questions, mais JAMAIS la polarité
 * (directe/inverse) : cette information sert uniquement au scoring côté serveur
 * et ne doit pas fuiter (sinon on pourrait déduire les "bonnes" réponses).
 */
public class ReferentielDto {

    public record ReferentielResume(
            Long id, String code, String nom, String type,
            String verset, int topFlop, int nbDimensions, int nbQuestions) { }

    public record ReferentielComplet(
            Long id, String code, String nom, String type, String verset,
            int topFlop, List<DimensionDto> dimensions) { }

    public record DimensionDto(
            Long id, int position, String libelle, String libelleCourt,
            List<QuestionDto> questions) { }

    public record QuestionDto(Long id, int position, String texte) { }
}
