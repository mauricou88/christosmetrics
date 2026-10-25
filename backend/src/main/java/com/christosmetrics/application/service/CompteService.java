package com.christosmetrics.application.service;

import com.christosmetrics.domain.model.User;
import com.christosmetrics.domain.repository.UserRepository;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Opérations sur le compte authentifié : logout global, changement mot de passe.
 * Toutes les actions révoquent les JWT existants via tokenVersion++.
 */
@Service
public class CompteService {

    private final UserRepository userRepo;
    private final PasswordEncoder encoder;

    public CompteService(UserRepository userRepo, PasswordEncoder encoder) {
        this.userRepo = userRepo;
        this.encoder = encoder;
    }

    @Transactional
    public void supprimerCompte(User user, String motDePasseConfirmation) {
        User frais = userRepo.findById(user.getId()).orElseThrow();
        if (!encoder.matches(motDePasseConfirmation, frais.getMotDePasseHash())) {
            throw new IllegalArgumentException("Mot de passe incorrect");
        }
        // Cascade DB déjà en place : passations, reponses, resultats, restitutions_pdf
        userRepo.delete(frais);
    }

    /** Logout "global" : invalide TOUS les tokens actifs de ce compte. */
    @Transactional
    public void invaliderTokens(User user) {
        User frais = userRepo.findById(user.getId()).orElseThrow();
        frais.invaliderTousLesTokens();
        userRepo.save(frais);
    }

    /** Change le mot de passe (après vérif de l'ancien) et invalide les tokens. */
    @Transactional
    public void changerMotDePasse(User user, String ancien, String nouveau) {
        User frais = userRepo.findById(user.getId()).orElseThrow();
        if (!encoder.matches(ancien, frais.getMotDePasseHash())) {
            throw new IllegalArgumentException("Ancien mot de passe incorrect");
        }
        if (encoder.matches(nouveau, frais.getMotDePasseHash())) {
            throw new IllegalArgumentException("Le nouveau mot de passe doit être différent de l'ancien");
        }
        frais.setMotDePasseHash(encoder.encode(nouveau));
        frais.invaliderTousLesTokens();
        userRepo.save(frais);
    }
}
