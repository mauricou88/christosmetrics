package com.christosmetrics.web.controller;

import com.christosmetrics.application.service.CompteService;
import com.christosmetrics.domain.model.User;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.*;

/**
 * Endpoints de gestion du compte authentifié.
 *   POST /api/compte/logout           — invalide TOUS les JWT du compte
 *   POST /api/compte/change-password  — change le mot de passe + invalide tokens
 */
@RestController
@RequestMapping("/api/compte")
public class CompteController {

    private final CompteService compteService;

    public CompteController(CompteService compteService) {
        this.compteService = compteService;
    }

    @DeleteMapping
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void supprimerCompte(@AuthenticationPrincipal User user,
                                @Valid @RequestBody SuppressionCompte req) {
        compteService.supprimerCompte(user, req.motDePasse());
    }

    public record SuppressionCompte(@NotBlank String motDePasse) { }

    @PostMapping("/logout")
    public void logout(@AuthenticationPrincipal User user) {
        compteService.invaliderTokens(user);
    }

    @PostMapping("/change-password")
    public void changerMotDePasse(@AuthenticationPrincipal User user,
                                  @Valid @RequestBody ChangementMdp req) {
        compteService.changerMotDePasse(user, req.ancienMdp(), req.nouveauMdp());
    }

    public record ChangementMdp(
            @NotBlank String ancienMdp,
            @NotBlank @Size(min = 8, max = 100)
            @Pattern(regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).{8,100}$",
                    message = "Le mot de passe doit contenir au moins 8 caractères, une majuscule, une minuscule et un chiffre")
            String nouveauMdp) { }
}
