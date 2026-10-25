package com.christosmetrics.application.service;

import com.christosmetrics.application.dto.AuthDtos.*;
import com.christosmetrics.application.mapper.DomainMapper;
import com.christosmetrics.config.JwtService;
import com.christosmetrics.domain.model.User;
import com.christosmetrics.domain.repository.UserRepository;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * SERVICE APPLICATIF — Authentification (cas d'usage : inscription, connexion).
 *
 * Orchestre : validation → hachage BCrypt → persistance → émission d'un JWT.
 * Ne contient pas de règle "métier fruit" (ce n'est pas son rôle) mais gère le
 * cas d'usage transverse de l'accès. Les mots de passe sont hachés via
 * PasswordEncoder ; le JWT est émis par JwtService (couche config).
 */
@Service
public class AuthService {

    private final UserRepository userRepo;
    private final PasswordEncoder encoder;
    private final JwtService jwt;
    private final DomainMapper mapper;

    public AuthService(UserRepository userRepo, PasswordEncoder encoder,
                       JwtService jwt, DomainMapper mapper) {
        this.userRepo = userRepo;
        this.encoder = encoder;
        this.jwt = jwt;
        this.mapper = mapper;
    }

    /** Inscription : crée le compte (email unique) et renvoie un token. */
    @Transactional
    public AuthResponse register(RegisterRequest req) {
        if (userRepo.existsByEmail(req.email())) {
            throw new IllegalArgumentException("Un compte existe déjà avec cet e-mail");
        }
        User user = new User(
                req.email(),
                encoder.encode(req.motDePasse()),   // hachage BCrypt
                req.prenom(), req.nom(), req.eglise());
        user = userRepo.save(user);
        String token = jwt.genererToken(user.getEmail(), user.getTokenVersion());
        return new AuthResponse(token, mapper.toUserDto(user));
    }

    /** Connexion : vérifie l'e-mail + le mot de passe, renvoie un token. */
    @Transactional(readOnly = true)
    public AuthResponse login(LoginRequest req) {
        User user = userRepo.findByEmail(req.email())
                .orElseThrow(() -> new IllegalArgumentException("Identifiants invalides"));
        if (!encoder.matches(req.motDePasse(), user.getMotDePasseHash())) {
            throw new IllegalArgumentException("Identifiants invalides");
        }
        String token = jwt.genererToken(user.getEmail(), user.getTokenVersion());
        return new AuthResponse(token, mapper.toUserDto(user));
    }
}
