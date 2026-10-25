package com.christosmetrics.domain.model;

import jakarta.persistence.*;

/**
 * Question (affirmation) appartenant à une dimension.
 *
 * La POLARITÉ est essentielle au scoring (RG-02) :
 *  - DIRECTE : une réponse élevée = forte présence du fruit.
 *  - INVERSE : une réponse élevée = FAIBLE présence (ex. "Je m'irrite vite").
 *    Le score est alors inversé : (max+1) − points.
 */
@Entity
@Table(name = "questions")
public class Question {

    public enum Polarite { DIRECTE, INVERSE }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "dimension_id", nullable = false)
    private Dimension dimension;

    @Column(nullable = false)
    private int position;

    @Column(nullable = false, length = 1000)
    private String texte;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Polarite polarite = Polarite.DIRECTE;

    protected Question() { }

    public Question(int position, String texte, Polarite polarite) {
        this.position = position;
        this.texte = texte;
        this.polarite = polarite;
    }

    public Long getId() { return id; }
    public Dimension getDimension() { return dimension; }
    public int getPosition() { return position; }
    public String getTexte() { return texte; }
    public Polarite getPolarite() { return polarite; }

    public void setDimension(Dimension d) { this.dimension = d; }
    public boolean estInverse() { return polarite == Polarite.INVERSE; }
}
