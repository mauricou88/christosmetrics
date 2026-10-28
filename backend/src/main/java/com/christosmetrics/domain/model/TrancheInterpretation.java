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
    /** Contenu localise ; NULL conserve le repli vers le francais. */
    @Column(name = "texte_en", columnDefinition = "TEXT")
    private String texteEn;

    @Column(name = "texte_es", columnDefinition = "TEXT")
    private String texteEs;

    @Column(name = "texte_pt", columnDefinition = "TEXT")
    private String textePt;

    /** Lit la traduction en, facultative avant validation du contenu. */
    public String getTexteEn() { return texteEn; }
    /** Enregistre la traduction en sans modifier le texte francais. */
    public void setTexteEn(String valeur) { this.texteEn = valeur; }

    /** Lit la traduction es, facultative avant validation du contenu. */
    public String getTexteEs() { return texteEs; }
    /** Enregistre la traduction es sans modifier le texte francais. */
    public void setTexteEs(String valeur) { this.texteEs = valeur; }

    /** Lit la traduction pt, facultative avant validation du contenu. */
    public String getTextePt() { return textePt; }
    /** Enregistre la traduction pt sans modifier le texte francais. */
    public void setTextePt(String valeur) { this.textePt = valeur; }

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
