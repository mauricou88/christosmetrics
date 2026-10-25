package com.christosmetrics;

import com.christosmetrics.domain.model.*;
import com.christosmetrics.domain.service.ScoringService;
import com.christosmetrics.domain.service.ScoringService.ResultatCalcule;
import org.junit.jupiter.api.Test;

import java.lang.reflect.Field;

import static org.junit.jupiter.api.Assertions.*;

/**
 * Tests unitaires du moteur de scoring (RG-01 à RG-09).
 *
 * On construit des passations "à la main" (sans base de données) pour vérifier
 * que le calcul est exact. Comme les entités reçoivent leurs ids via JPA, on
 * les force par réflexion dans ces tests (les ids servent d'index de réponse).
 */
class ScoringServiceTest {

    private final ScoringService scoring = new ScoringService();

    // Force un id sur une entité (normalement attribué par la base).
    private void setId(Object entite, Long id) throws Exception {
        Field f = entite.getClass().getDeclaredField("id");
        f.setAccessible(true);
        f.set(entite, id);
    }

    /**
     * RG central : répondre "milieu" (3 sur une échelle 1..5) à des questions
     * DIRECTES doit donner exactement 50 %.
     */
    @Test
    void milieu_echelle_donne_50_pourcent() throws Exception {
        Referentiel ref = new Referentiel("test", "Test", Referentiel.Type.INDIVIDUEL, "v", 0);
        setId(ref, 1L);
        Dimension dim = new Dimension(0, "Dimension", "Dim");
        setId(dim, 1L);
        ref.ajouterDimension(dim);

        // 4 questions directes
        for (int i = 0; i < 4; i++) {
            Question q = new Question(i, "Q" + i, Question.Polarite.DIRECTE);
            setId(q, (long) (i + 1));
            dim.ajouterQuestion(q);
        }

        User user = new User("a@b.c", "hash", "P", "N", "E");
        setId(user, 1L);
        Passation p = new Passation(user, ref);
        // Répond "3" (milieu de 1..5) partout
        for (Question q : dim.getQuestions()) p.repondre(q, 3);

        ResultatCalcule r = scoring.calculer(p);
        assertEquals(50.0, r.dimensions().get(0).pourcentage(), 0.01);
        assertEquals(50, r.globalArrondi());
    }

    /**
     * RG-02 : sur une question INVERSE, une valeur haute (5) doit produire un
     * score bas (0 %). Vérifie l'inversion (6 − points).
     */
    @Test
    void question_inverse_valeur_haute_donne_score_bas() throws Exception {
        Referentiel ref = new Referentiel("test", "Test", Referentiel.Type.INDIVIDUEL, "v", 0);
        setId(ref, 1L);
        Dimension dim = new Dimension(0, "Dimension", "Dim");
        setId(dim, 1L);
        ref.ajouterDimension(dim);

        Question q = new Question(0, "Je m'irrite vite", Question.Polarite.INVERSE);
        setId(q, 1L);
        dim.ajouterQuestion(q);

        User user = new User("a@b.c", "hash", "P", "N", "E");
        setId(user, 1L);
        Passation p = new Passation(user, ref);
        p.repondre(q, 5); // "Presque toujours" à une question inverse

        ResultatCalcule r = scoring.calculer(p);
        // 6 - 5 = 1 point ; (1 - 1) / (1*4) = 0 %
        assertEquals(0.0, r.dimensions().get(0).pourcentage(), 0.01);
    }

    /**
     * Mode COUPLE : échelle 1..4, le global est la SOMME des points.
     * Exemple du livre : 4+3+3+2+4+3+4+2+3 = 28 points.
     */
    @Test
    void couple_somme_des_points_sur_36() throws Exception {
        Referentiel ref = new Referentiel("couple", "Couple", Referentiel.Type.COUPLE, "v", 3);
        setId(ref, 1L);

        int[] valeurs = {4, 3, 3, 2, 4, 3, 4, 2, 3}; // 9 fruits
        User user = new User("a@b.c", "hash", "P", "N", "E");
        setId(user, 1L);
        Passation p = new Passation(user, ref);

        long qid = 1;
        for (int i = 0; i < valeurs.length; i++) {
            Dimension dim = new Dimension(i, "Fruit " + i, "F" + i);
            setId(dim, (long) (i + 1));
            ref.ajouterDimension(dim);
            Question q = new Question(0, "Affirmation " + i, Question.Polarite.DIRECTE);
            setId(q, qid++);
            dim.ajouterQuestion(q);
            p.repondre(q, valeurs[i]);
        }

        ResultatCalcule r = scoring.calculer(p);
        assertEquals(28, r.globalArrondi());   // total attendu du livre
        assertEquals(28, r.scoreBrutTotal());
    }

    /**
     * RG-09 : le top et le flop identifient bien les dimensions extrêmes.
     */
    @Test
    void top_flop_identifie_les_extremes() throws Exception {
        Referentiel ref = new Referentiel("test", "Test", Referentiel.Type.INDIVIDUEL, "v", 1);
        setId(ref, 1L);

        // 3 dimensions à 1 question directe, valeurs 5 (fort), 3 (moyen), 1 (faible)
        int[] valeurs = {5, 3, 1};
        User user = new User("a@b.c", "hash", "P", "N", "E");
        setId(user, 1L);
        Passation p = new Passation(user, ref);

        long qid = 1;
        for (int i = 0; i < valeurs.length; i++) {
            Dimension dim = new Dimension(i, "Dim " + i, "D" + i);
            setId(dim, (long) (i + 1));
            ref.ajouterDimension(dim);
            Question q = new Question(0, "Q", Question.Polarite.DIRECTE);
            setId(q, qid++);
            dim.ajouterQuestion(q);
            p.repondre(q, valeurs[i]);
        }

        ResultatCalcule r = scoring.calculer(p);
        assertEquals("D0", r.top().get(0).libelleCourt());   // valeur 5 → 100 %
        assertEquals("D2", r.flop().get(0).libelleCourt());  // valeur 1 → 0 %
    }
}
