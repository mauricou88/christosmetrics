package com.christosmetrics.domain.model;

import jakarta.persistence.*;

/**
 * Une ligne du barème d'interprétation d'un référentiel.
 *
 * Les textes et seuils viennent du POC validé. Ils restent côté serveur afin
 * que tous les clients obtiennent exactement la même interprétation.
 */
@Entity
@Table(name = "tranches_interpretation")
public class TrancheInterpretation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "referentiel_id", nullable = false)
    private Referentiel referentiel;

    @Column(nullable = false)
    private int position;

    @Column(name = "min_score", nullable = false)
    private int minScore;

    @Column(name = "max_score", nullable = false)
    private int maxScore;

    @Column(nullable = false, columnDefinition = "TEXT")
    private String texte;

    @Column(name = "type_icone", nullable = false)
    private String typeIcone;

    @Column(name = "nombre_icones", nullable = false)
    private int nombreIcones;

    protected TrancheInterpretation() { }

    public int getPosition() { return position; }
    public int getMinScore() { return minScore; }
    public int getMaxScore() { return maxScore; }
    public String getTexte() { return texte; }
    public String getTypeIcone() { return typeIcone; }
    public int getNombreIcones() { return nombreIcones; }

    public boolean contient(int score) {
        return score >= minScore && score <= maxScore;
    }
}
