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
    /** Contenu localise ; NULL conserve le repli vers le francais. */
    @Column(name = "libelle_en", length = 500)
    private String libelleEn;

    @Column(name = "libelle_es", length = 500)
    private String libelleEs;

    @Column(name = "libelle_pt", length = 500)
    private String libellePt;

    @Column(name = "libelle_court_en", length = 500)
    private String libelleCourtEn;

    @Column(name = "libelle_court_es", length = 500)
    private String libelleCourtEs;

    @Column(name = "libelle_court_pt", length = 500)
    private String libelleCourtPt;

    /** Lit la traduction en, facultative avant validation du contenu. */
    public String getLibelleEn() { return libelleEn; }
    /** Enregistre la traduction en sans modifier le texte francais. */
    public void setLibelleEn(String valeur) { this.libelleEn = valeur; }

    /** Lit la traduction es, facultative avant validation du contenu. */
    public String getLibelleEs() { return libelleEs; }
    /** Enregistre la traduction es sans modifier le texte francais. */
    public void setLibelleEs(String valeur) { this.libelleEs = valeur; }

    /** Lit la traduction pt, facultative avant validation du contenu. */
    public String getLibellePt() { return libellePt; }
    /** Enregistre la traduction pt sans modifier le texte francais. */
    public void setLibellePt(String valeur) { this.libellePt = valeur; }

    /** Lit la traduction en, facultative avant validation du contenu. */
    public String getLibelleCourtEn() { return libelleCourtEn; }
    /** Enregistre la traduction en sans modifier le texte francais. */
    public void setLibelleCourtEn(String valeur) { this.libelleCourtEn = valeur; }

    /** Lit la traduction es, facultative avant validation du contenu. */
    public String getLibelleCourtEs() { return libelleCourtEs; }
    /** Enregistre la traduction es sans modifier le texte francais. */
    public void setLibelleCourtEs(String valeur) { this.libelleCourtEs = valeur; }

    /** Lit la traduction pt, facultative avant validation du contenu. */
    public String getLibelleCourtPt() { return libelleCourtPt; }
    /** Enregistre la traduction pt sans modifier le texte francais. */
    public void setLibelleCourtPt(String valeur) { this.libelleCourtPt = valeur; }

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
