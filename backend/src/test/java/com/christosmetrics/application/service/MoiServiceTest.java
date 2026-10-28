package com.christosmetrics.application.service;

import com.christosmetrics.application.dto.MoiDto;
import com.christosmetrics.domain.model.Passation;
import com.christosmetrics.domain.model.Referentiel;
import com.christosmetrics.domain.model.User;
import com.christosmetrics.domain.repository.PassationRepository;
import com.christosmetrics.domain.repository.UserRepository;
import com.christosmetrics.domain.service.ScoringService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.test.util.ReflectionTestUtils;

import java.time.Clock;
import java.time.Instant;
import java.time.ZoneOffset;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

class MoiServiceTest {
    private final UserRepository users = mock(UserRepository.class);
    private final PassationRepository passations = mock(PassationRepository.class);
    private final ScoringService scoring = mock(ScoringService.class);
    private final StreakService streak = new StreakService(users,
            Clock.fixed(Instant.parse("2026-10-28T12:00:00Z"), ZoneOffset.UTC));
    private final MoiService service = new MoiService(users, passations, scoring, streak);
    private final User user = new User("test@example.invalid", "hash", "Test", "User", null);

    @BeforeEach
    void preparer() {
        ReflectionTestUtils.setField(user, "id", 1L);
        when(users.findById(1L)).thenReturn(Optional.of(user));
    }

    @Test
    void aucun_test_ne_debloque_ni_score_ni_synthese() {
        when(passations.findByUserOrderByDebuteeLeDesc(user)).thenReturn(List.of());
        MoiDto moi = service.moi(user);
        assertEquals("test@example.invalid", moi.email());
        assertEquals(0, moi.fruitsCompletes());
        assertEquals(6, moi.fruitsTotal());
        assertFalse(moi.christosGlobalDisponible());
        assertNull(moi.scoreGlobal());
        verifyNoInteractions(scoring);
        verify(users, never()).save(any());
    }

    @Test
    void six_passations_du_meme_fruit_ne_valent_qu_un_fruit() {
        List<Passation> liste = new ArrayList<>();
        for (int i = 0; i < 6; i++) liste.add(passation("amour", Referentiel.Type.INDIVIDUEL, true));
        when(passations.findByUserOrderByDebuteeLeDesc(user)).thenReturn(liste);
        MoiDto moi = service.moi(user);
        assertEquals(1, moi.fruitsCompletes());
        assertFalse(moi.christosGlobalDisponible());
        assertNull(moi.scoreGlobal());
    }

    @Test
    void exclut_couple_futurs_fruits_et_tests_en_cours() {
        when(passations.findByUserOrderByDebuteeLeDesc(user)).thenReturn(List.of(
                passation("amour", Referentiel.Type.COUPLE, true),
                passation("couple", Referentiel.Type.COUPLE, true),
                passation("douceur", Referentiel.Type.INDIVIDUEL, true),
                passation("maitrise", Referentiel.Type.INDIVIDUEL, true),
                passation("joie", Referentiel.Type.INDIVIDUEL, false)));
        assertEquals(0, service.moi(user).fruitsCompletes());
        verifyNoInteractions(scoring);
    }

    @Test
    void cinq_fruits_uniques_restent_incomplets() {
        when(passations.findByUserOrderByDebuteeLeDesc(user)).thenReturn(List.of(
                passation("amour", Referentiel.Type.INDIVIDUEL, true),
                passation("joie", Referentiel.Type.INDIVIDUEL, true),
                passation("paix", Referentiel.Type.INDIVIDUEL, true),
                passation("patience", Referentiel.Type.INDIVIDUEL, true),
                passation("bonte", Referentiel.Type.INDIVIDUEL, true)));
        MoiDto moi = service.moi(user);
        assertEquals(5, moi.fruitsCompletes());
        assertNull(moi.scoreGlobal());
        assertFalse(moi.christosGlobalDisponible());
    }

    @Test
    void six_fruits_prennent_la_derniere_terminee_de_chacun_et_moyennent_les_pourcentages() {
        List<Passation> liste = new ArrayList<>();
        // Le tri du repository est décroissant : la reprise récente ne masque pas un test terminé.
        liste.add(passation("amour", Referentiel.Type.INDIVIDUEL, false));
        int score = 10;
        for (String code : List.of("amour", "joie", "paix", "patience", "bonte", "fidelite")) {
            Passation p = passation(code, Referentiel.Type.INDIVIDUEL, true);
            liste.add(p);
            when(scoring.calculer(p)).thenReturn(new ScoringService.ResultatCalcule(
                    List.of(), score, 0, List.of(), List.of(), Referentiel.Type.INDIVIDUEL));
            score += 10;
        }
        Passation ancienne = passation("amour", Referentiel.Type.INDIVIDUEL, true);
        liste.add(ancienne);
        liste.add(passation("couple", Referentiel.Type.COUPLE, true));
        when(passations.findByUserOrderByDebuteeLeDesc(user)).thenReturn(liste);
        MoiDto moi = service.moi(user);
        assertEquals(6, moi.fruitsCompletes());
        assertTrue(moi.christosGlobalDisponible());
        assertEquals(35.0, moi.scoreGlobal(), 0.0001);
        verify(scoring, never()).calculer(ancienne);
        verify(users, never()).findByIdPourActivite(any());
    }

    /** Crée un test du bon type sans dépendance à une base de données. */
    private Passation passation(String code, Referentiel.Type type, boolean terminee) {
        Passation p = new Passation(user, new Referentiel(code, code, type, "", 0));
        if (terminee) p.terminer();
        return p;
    }
}
