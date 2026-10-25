package com.christosmetrics.domain.model;

import jakarta.persistence.*;
import java.time.Instant;

/**
 * Réponse d'un utilisateur à une question, dans le cadre d'une passation.
 * La valeur est l'index d'échelle + 1 (1..5 en individuel, 1..4 en couple).
 * Contrainte d'unicité (passation, question) : une seule réponse par question.
 */
@Entity
@Table(name = "reponses",
       uniqueConstraints = @UniqueConstraint(columnNames = {"passation_id", "question_id"}))
public class Reponse {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "passation_id", nullable = false)
    private Passation passation;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "question_id", nullable = false)
    private Question question;

    /** Points bruts choisis (1..5 individuel, 1..4 couple). */
    @Column(nullable = false)
    private int valeur;

    @Column(name = "repondue_le", nullable = false)
    private Instant repondueLe = Instant.now();

    protected Reponse() { }

    public Reponse(Passation passation, Question question, int valeur) {
        this.passation = passation;
        this.question = question;
        this.valeur = valeur;
    }

    public Long getId() { return id; }
    public Passation getPassation() { return passation; }
    public Question getQuestion() { return question; }
    public int getValeur() { return valeur; }

    public void setValeur(int valeur) {
        this.valeur = valeur;
        this.repondueLe = Instant.now();
    }
}
