package com.christosmetrics.domain.model;

import jakarta.persistence.*;
import java.time.Instant;

/**
 * Utilisateur de l'application.
 *
 * Porte l'identité (email unique = identifiant de connexion) et les
 * informations de profil. Le mot de passe n'est jamais stocké en clair :
 * seul son hash (BCrypt) est persisté.
 *
 * Un utilisateur peut avoir plusieurs {@link Passation} (une par test lancé).
 * C'est ce lien qui permet, à la reconnexion, de retrouver sa progression.
 */
@Entity
@Table(name = "users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    /** Identifiant de connexion, unique. */
    @Column(nullable = false, unique = true)
    private String email;

    /** Hash BCrypt du mot de passe (jamais le mot de passe en clair). */
    @Column(name = "mot_de_passe_hash", nullable = false)
    private String motDePasseHash;

    private String prenom;
    private String nom;
    private String eglise;

    @Column(name = "cree_le", nullable = false)
    private Instant creeLe = Instant.now();

    /** Incrémenté à chaque invalidation (logout global, changement mot de passe). */
    @Column(name = "token_version", nullable = false)
    private long tokenVersion = 0L;

    protected User() { } // requis par JPA

    public User(String email, String motDePasseHash, String prenom, String nom, String eglise) {
        this.email = email;
        this.motDePasseHash = motDePasseHash;
        this.prenom = prenom;
        this.nom = nom;
        this.eglise = eglise;
    }

    public Long getId() { return id; }
    public String getEmail() { return email; }
    public String getMotDePasseHash() { return motDePasseHash; }
    public String getPrenom() { return prenom; }
    public String getNom() { return nom; }
    public String getEglise() { return eglise; }
    public Instant getCreeLe() { return creeLe; }
    public long getTokenVersion() { return tokenVersion; }
    public void invaliderTousLesTokens() { this.tokenVersion++; }

    public void setMotDePasseHash(String hash) { this.motDePasseHash = hash; }
    public void setPrenom(String prenom) { this.prenom = prenom; }
    public void setNom(String nom) { this.nom = nom; }
    public void setEglise(String eglise) { this.eglise = eglise; }
}
