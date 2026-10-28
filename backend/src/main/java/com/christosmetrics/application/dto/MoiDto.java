package com.christosmetrics.application.dto;

/** Vue personnelle sans mot de passe, token ni autre donnée d’authentification. */
public record MoiDto(
        String prenom, String nom, String email,
        int streakActuel, int streakRecord,
        int fruitsCompletes, int fruitsTotal,
        boolean christosGlobalDisponible, Double scoreGlobal) { }
