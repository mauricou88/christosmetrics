package com.christosmetrics.domain.model;

import jakarta.persistence.*;
import java.time.Instant;

/**
 * Résultat calculé et figé d'une passation terminée.
 *
 * On stocke le score global + le détail sérialisé en JSON (scores par
 * dimension, top/flop). Le JSON évite un schéma rigide et facilite le rendu
 * côté client comme la régénération du PDF. Un résultat par passation.
 */
@Entity
@Table(name = "resultats")
public class Resultat {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "passation_id", nullable = false, unique = true)
    private Passation passation;

    /** % (individuel) ou points /36 (couple). */
    @Column(name = "score_global", nullable = false)
    private double scoreGlobal;

    /** Détail complet sérialisé (scores par dimension, top/flop, tranche). */
    @Column(name = "detail_json", columnDefinition = "text", nullable = false)
    private String detailJson;

    @Column(name = "calcule_le", nullable = false)
    private Instant calculeLe = Instant.now();

    protected Resultat() { }

    public Resultat(Passation passation, double scoreGlobal, String detailJson) {
        this.passation = passation;
        this.scoreGlobal = scoreGlobal;
        this.detailJson = detailJson;
    }

    public Long getId() { return id; }
    public Passation getPassation() { return passation; }
    public double getScoreGlobal() { return scoreGlobal; }
    public String getDetailJson() { return detailJson; }
    public Instant getCalculeLe() { return calculeLe; }
}
