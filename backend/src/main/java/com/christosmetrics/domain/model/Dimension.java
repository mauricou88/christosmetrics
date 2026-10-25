package com.christosmetrics.domain.model;

import jakarta.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Dimension d'un référentiel (ex. pour Amour : "Patient", "Non envieux"…).
 * Porte ses questions. Le libellé court sert aux axes du radar/entonnoir.
 */
@Entity
@Table(name = "dimensions")
public class Dimension {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "referentiel_id", nullable = false)
    private Referentiel referentiel;

    /** Ordre d'affichage (0-based). */
    @Column(nullable = false)
    private int position;

    @Column(nullable = false)
    private String libelle;

    @Column(name = "libelle_court")
    private String libelleCourt;

    @OneToMany(mappedBy = "dimension", cascade = CascadeType.ALL, orphanRemoval = true)
    @OrderBy("position ASC")
    private List<Question> questions = new ArrayList<>();

    protected Dimension() { }

    public Dimension(int position, String libelle, String libelleCourt) {
        this.position = position;
        this.libelle = libelle;
        this.libelleCourt = libelleCourt;
    }

    public Long getId() { return id; }
    public Referentiel getReferentiel() { return referentiel; }
    public int getPosition() { return position; }
    public String getLibelle() { return libelle; }
    public String getLibelleCourt() { return libelleCourt; }
    public List<Question> getQuestions() { return questions; }

    public void setReferentiel(Referentiel r) { this.referentiel = r; }
    public void ajouterQuestion(Question q) {
        q.setDimension(this);
        this.questions.add(q);
    }
}
