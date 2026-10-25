package com.christosmetrics.application.dto;

import jakarta.validation.constraints.*;

/**
 * DTOs d'authentification avec validation stricte des entrées.
 *
 * Politique de mot de passe (RG-SEC-01) :
 *   - 8 à 100 caractères
 *   - au moins 1 chiffre + 1 majuscule + 1 minuscule
 * Validée par expression régulière compatible JPMS.
 */
public class AuthDtos {

    public record RegisterRequest(
            @NotBlank @Email @Size(max = 254) String email,
            @NotBlank @Size(min = 8, max = 100)
            @Pattern(regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).{8,100}$",
                    message = "Le mot de passe doit contenir au moins 8 caractères, une majuscule, une minuscule et un chiffre")
            String motDePasse,
            @NotBlank @Size(min = 1, max = 60) String prenom,
            @NotBlank @Size(min = 1, max = 60) String nom,
            @Size(max = 80) String eglise) { }

    public record LoginRequest(
            @NotBlank @Email @Size(max = 254) String email,
            @NotBlank @Size(min = 1, max = 100) String motDePasse) { }

    public record AuthResponse(String token, UserDto user) { }
}
