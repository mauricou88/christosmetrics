package com.christosmetrics.domain.model;

import jakarta.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Référentiel d'évaluation = un fruit (parcours individuel) OU le test couple.
 *
 * C'est le "modèle de test" : il porte ses dimensions, elles-mêmes portant
 * leurs questions. Le type distingue les deux parcours car leurs règles de
 * calcul diffèrent (individuel = moyenne des %, couple = total /36).
 */
@Entity
@Table(name = "referentiels")
public class Referentiel {
    /** Contenu localise ; NULL conserve le repli vers le francais. */
    @Column(name = "nom_en", length = 255)
    private String nomEn;

    @Column(name = "nom_es", length = 255)
    private String nomEs;

    @Column(name = "nom_pt", length = 255)
    private String nomPt;

    @Column(name = "verset_en", length = 255)
    private String versetEn;

    @Column(name = "verset_es", length = 255)
    private String versetEs;

    @Column(name = "verset_pt", length = 255)
    private String versetPt;

    /** Lit la traduction en, facultative avant validation du contenu. */
    public String getNomEn() { return nomEn; }
    /** Enregistre la traduction en sans modifier le texte francais. */
    public void setNomEn(String valeur) { this.nomEn = valeur; }

    /** Lit la traduction es, facultative avant validation du contenu. */
    public String getNomEs() { return nomEs; }
    /** Enregistre la traduction es sans modifier le texte francais. */
    public void setNomEs(String valeur) { this.nomEs = valeur; }

    /** Lit la traduction pt, facultative avant validation du contenu. */
    public String getNomPt() { return nomPt; }
    /** Enregistre la traduction pt sans modifier le texte francais. */
    public void setNomPt(String valeur) { this.nomPt = valeur; }

    /** Lit la traduction en, facultative avant validation du contenu. */
    public String getVersetEn() { return versetEn; }
    /** Enregistre la traduction en sans modifier le texte francais. */
    public void setVersetEn(String valeur) { this.versetEn = valeur; }

    /** Lit la traduction es, facultative avant validation du contenu. */
    public String getVersetEs() { return versetEs; }
    /** Enregistre la traduction es sans modifier le texte francais. */
    public void setVersetEs(String valeur) { this.versetEs = valeur; }

    /** Lit la traduction pt, facultative avant validation du contenu. */
    public String getVersetPt() { return versetPt; }
    /** Enregistre la traduction pt sans modifier le texte francais. */
    public void setVersetPt(String valeur) { this.versetPt = valeur; }

    public enum Type { INDIVIDUEL, COUPLE }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    /** Code technique stable (ex. "amour", "joie", "couple"). */
    @Column(nullable = false, unique = true)
    private String code;

    @Column(nullable = false)
    private String nom;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Type type;

    private String verset;

    /** Un référentiel désactivé n'apparaît pas dans l'application. */
    @Column(nullable = false)
    private boolean actif = true;

    /** Nombre de forces/faiblesses à afficher (0 = aucun, ex. Bonté). */
    @Column(name = "top_flop", nullable = false)
    private int topFlop = 3;

    @OneToMany(mappedBy = "referentiel", cascade = CascadeType.ALL, orphanRemoval = true)
    @OrderBy("position ASC")
    private List<Dimension> dimensions = new ArrayList<>();

    /** Barème d'interprétation provenant du POC, dans son ordre d'affichage. */
    @OneToMany(mappedBy = "referentiel", cascade = CascadeType.ALL, orphanRemoval = true)
    @OrderBy("position ASC")
    private List<TrancheInterpretation> tranchesInterpretation = new ArrayList<>();

    protected Referentiel() { }

    public Referentiel(String code, String nom, Type type, String verset, int topFlop) {
        this.code = code;
        this.nom = nom;
        this.type = type;
        this.verset = verset;
        this.topFlop = topFlop;
    }

    public Long getId() { return id; }
    public String getCode() { return code; }
    public String getNom() { return nom; }
    public Type getType() { return type; }
    public String getVerset() { return verset; }
    public boolean isActif() { return actif; }
    public int getTopFlop() { return topFlop; }
    public List<Dimension> getDimensions() { return dimensions; }
    public List<TrancheInterpretation> getTranchesInterpretation() {
        return tranchesInterpretation;
    }

    public void ajouterDimension(Dimension d) {
        d.setReferentiel(this);
        this.dimensions.add(d);
    }
}
