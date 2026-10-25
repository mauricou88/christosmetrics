package com.christosmetrics.application.dto;

/** Profil utilisateur exposé au client (jamais le hash du mot de passe). */
public record UserDto(Long id, String email, String prenom, String nom, String eglise) { }
