package com.christosmetrics.application.i18n;

import com.christosmetrics.application.mapper.DomainMapper;
import com.christosmetrics.application.service.PassationApplicationService;
import com.christosmetrics.application.service.SyntheseService;
import com.christosmetrics.domain.model.*;
import com.christosmetrics.domain.repository.*;
import com.christosmetrics.domain.service.ProgressionService;
import com.christosmetrics.domain.service.ScoringService;
import org.junit.jupiter.api.Test;
import org.springframework.test.util.ReflectionTestUtils;
import java.util.List;
import java.util.Optional;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

class ResultatLocaliseTest {
    @Test
    void langue_change_les_textes_du_resultat_et_de_lhistorique_pas_les_scores_ni_le_stockage() {
        User user = new User("i18n@example.invalid", "hash", "Test", "User", null);
        ReflectionTestUtils.setField(user, "id", 1L);
        Referentiel ref = new Referentiel("joie", "Joie", Referentiel.Type.INDIVIDUEL, "Galates 5.22", 1);
        ReflectionTestUtils.setField(ref, "id", 1L);
        ref.setNomEn("TEST_EN_NOM");
        Dimension dim = new Dimension(0, "Dimension FR", "Court FR");
        ReflectionTestUtils.setField(dim, "id", 2L);
        dim.setLibelleEn("TEST_EN_DIM"); dim.setLibelleCourtEn("TEST_EN_COURT");
        Question question = new Question(0, "Question FR", Question.Polarite.DIRECTE);
        ReflectionTestUtils.setField(question, "id", 3L);
        dim.ajouterQuestion(question); ref.ajouterDimension(dim);
        TrancheInterpretation tranche = mock(TrancheInterpretation.class);
        when(tranche.getMinScore()).thenReturn(0); when(tranche.getMaxScore()).thenReturn(100);
        when(tranche.getTexte()).thenReturn("Interpretation FR");
        when(tranche.getTexteEn()).thenReturn("TEST_EN_INTERPRETATION");
        when(tranche.contient(anyInt())).thenReturn(true);
        ref.getTranchesInterpretation().add(tranche);
        Passation p = new Passation(user, ref);
        ReflectionTestUtils.setField(p, "id", 4L);
        p.repondre(question, 4);

        PassationRepository passations = mock(PassationRepository.class);
        ReferentielRepository referentiels = mock(ReferentielRepository.class);
        ResultatRepository resultats = mock(ResultatRepository.class);
        RestitutionPdfRepository pdf = mock(RestitutionPdfRepository.class);
        when(passations.findById(4L)).thenReturn(Optional.of(p));
        when(resultats.findByPassation(p)).thenReturn(Optional.empty());
        ScoringService scoring = new ScoringService();
        var service = new PassationApplicationService(passations, referentiels, resultats,
                new ProgressionService(passations), scoring, new DomainMapper());
        var en = service.terminerEtCalculer(user, 4L, "en");
        var fr = service.resultat(user, 4L);
        assertEquals("TEST_EN_NOM", en.referentielNom());
        assertEquals("TEST_EN_DIM", en.dimensions().getFirst().libelle());
        assertEquals("TEST_EN_COURT", en.top().getFirst().libelleCourt());
        assertEquals("TEST_EN_INTERPRETATION", en.tranche().texte());
        assertEquals("Interpretation FR", fr.tranche().texte());
        assertEquals(fr.scoreGlobal(), en.scoreGlobal());
        assertEquals(fr.dimensions().getFirst().pourcentage(), en.dimensions().getFirst().pourcentage());
        assertEquals(fr.bareme().getFirst().min(), en.bareme().getFirst().min());
        var capture = org.mockito.ArgumentCaptor.forClass(Resultat.class);
        verify(resultats).save(capture.capture());
        assertTrue(capture.getValue().getDetailJson().contains("Interpretation FR"));
        assertFalse(capture.getValue().getDetailJson().contains("TEST_EN"));
        assertEquals("Joie", ref.getNom());

        when(passations.findByUserOrderByDebuteeLeDesc(user)).thenReturn(List.of(p));
        when(referentiels.findByActifTrue()).thenReturn(List.of(ref));
        when(pdf.findByPassation(p)).thenReturn(Optional.empty());
        var synthese = new SyntheseService(passations, referentiels, pdf, scoring);
        assertEquals("TEST_EN_NOM", synthese.synthese(user, "en").passations().getFirst().referentielNom());
        assertEquals("Joie", synthese.synthese(user).passations().getFirst().referentielNom());
    }
}
