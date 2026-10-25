package com.christosmetrics.domain.model;

import jakarta.persistence.*;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

/**
 * PASSATION = une instance de test lancée par un utilisateur.
 *
 * C'est l'entité clé de la REPRISE DE PROGRESSION :
 *  - tant qu'elle est EN_COURS, chaque réponse est persistée au fur et à
 *    mesure ;
 *  - à la reconnexion, on retrouve la passation EN_COURS de l'utilisateur
 *    pour ce référentiel, et on reprend à la première question sans réponse.
 *
 * RÈGLE MÉTIER : au plus une passation EN_COURS par (user, referentiel).
 */
@Entity
@Table(name = "passations")
public class Passation {

    public enum Etat { EN_COURS, TERMINEE }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "referentiel_id", nullable = false)
    private Referentiel referentiel;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Etat etat = Etat.EN_COURS;

    @Column(name = "debutee_le", nullable = false)
    private Instant debuteeLe = Instant.now();

    @Column(name = "terminee_le")
    private Instant termineeLe;

    @OneToMany(mappedBy = "passation", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Reponse> reponses = new ArrayList<>();

    protected Passation() { }

    public Passation(User user, Referentiel referentiel) {
        this.user = user;
        this.referentiel = referentiel;
    }

    /**
     * Enregistre (ou met à jour) la réponse à une question.
     * Idempotent : répondre deux fois à la même question écrase la valeur.
     */
    public void repondre(Question question, int valeur) {
        if (etat == Etat.TERMINEE)
            throw new IllegalStateException("Passation déjà terminée");
        int maximum = referentiel.getType() == Referentiel.Type.COUPLE ? 4 : 5;
        if (valeur < 1 || valeur > maximum) {
            throw new IllegalArgumentException(
                    "Réponse hors barème : valeur attendue entre 1 et " + maximum);
        }
        Optional<Reponse> existante = reponses.stream()
                .filter(r -> r.getQuestion().getId().equals(question.getId()))
                .findFirst();
        if (existante.isPresent()) {
            existante.get().setValeur(valeur);
        } else {
            Reponse r = new Reponse(this, question, valeur);
            reponses.add(r);
        }
    }

    /** Fige la passation (aucune réponse ne pourra plus être modifiée). */
    public void terminer() {
        this.etat = Etat.TERMINEE;
        this.termineeLe = Instant.now();
    }

    public boolean estTerminee() { return etat == Etat.TERMINEE; }

    public Long getId() { return id; }
    public User getUser() { return user; }
    public Referentiel getReferentiel() { return referentiel; }
    public Etat getEtat() { return etat; }
    public Instant getDebuteeLe() { return debuteeLe; }
    public Instant getTermineeLe() { return termineeLe; }
    public List<Reponse> getReponses() { return reponses; }
}
