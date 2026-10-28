package com.christosmetrics.application.i18n;

import com.christosmetrics.domain.model.*;
import java.util.Locale;

/** Selectionne le contenu de presentation sans modifier les entites ni le scoring. */
public final class ContenuLocalise {
    private ContenuLocalise() { }

    /** Accepte les variantes regionales et replie les langues inconnues sur fr. */
    public static String normaliserLangue(String langue) {
        String code = langue == null ? "fr" : langue.trim().toLowerCase(Locale.ROOT).split("[-_]", 2)[0];
        return switch (code) { case "en", "es", "pt" -> code; default -> "fr"; };
    }

    /** Une traduction absente ou vide laisse toujours apparaitre le texte francais. */
    public static String choisir(String francais, String en, String es, String pt, String langue) {
        String traduction = switch (normaliserLangue(langue)) {
            case "en" -> en; case "es" -> es; case "pt" -> pt; default -> francais;
        };
        return traduction == null || traduction.isBlank() ? francais : traduction;
    }

    /** Localise le nom public du referentiel, jamais son code technique. */
    public static String nom(Referentiel r, String langue) {
        return choisir(r.getNom(), r.getNomEn(), r.getNomEs(), r.getNomPt(), langue);
    }

    /** Localise la reference biblique associee au referentiel. */
    public static String verset(Referentiel r, String langue) {
        return choisir(r.getVerset(), r.getVersetEn(), r.getVersetEs(), r.getVersetPt(), langue);
    }

    /** Localise le titre complet d'une dimension. */
    public static String libelle(Dimension d, String langue) {
        return choisir(d.getLibelle(), d.getLibelleEn(), d.getLibelleEs(), d.getLibellePt(), langue);
    }

    /** Un axe sans libelle court utilise le titre complet localise. */
    public static String libelleCourt(Dimension d, String langue) {
        String texte = choisir(d.getLibelleCourt(), d.getLibelleCourtEn(), d.getLibelleCourtEs(), d.getLibelleCourtPt(), langue);
        return texte == null || texte.isBlank() ? libelle(d, langue) : texte;
    }

    /** Localise un enonce sans exposer sa polarite. */
    public static String getContenuLocalise(Question q, String langue) {
        return choisir(q.getTexte(), q.getTexteEn(), q.getTexteEs(), q.getTextePt(), langue);
    }

    /** Localise une interpretation sans modifier les seuils du bareme. */
    public static String getContenuLocalise(TrancheInterpretation t, String langue) {
        return choisir(t.getTexte(), t.getTexteEn(), t.getTexteEs(), t.getTextePt(), langue);
    }
}
