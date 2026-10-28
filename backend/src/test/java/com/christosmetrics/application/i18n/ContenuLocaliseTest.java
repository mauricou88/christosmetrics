package com.christosmetrics.application.i18n;

import com.christosmetrics.application.mapper.DomainMapper;
import com.christosmetrics.domain.model.*;
import com.christosmetrics.domain.repository.ReferentielRepository;
import com.christosmetrics.web.controller.ReferentielController;
import org.junit.jupiter.api.Test;
import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.datasource.init.ScriptUtils;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import java.sql.DriverManager;
import java.util.List;
import java.util.Optional;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

class ContenuLocaliseTest {
    @Test
    void normalise_les_variantes_et_replie_les_langues_inconnues() {
        assertEquals("pt", ContenuLocalise.normaliserLangue(" PT-PT "));
        assertEquals("en", ContenuLocalise.normaliserLangue("en_GB"));
        assertEquals("fr", ContenuLocalise.normaliserLangue("de"));
        assertEquals("fr", ContenuLocalise.normaliserLangue(null));
        assertEquals("FR", ContenuLocalise.choisir("FR", null, "  ", "PT", "en"));
        assertEquals("FR", ContenuLocalise.choisir("FR", null, "  ", "PT", "es"));
        assertEquals("PT", ContenuLocalise.choisir("FR", null, "ES", "PT", "pt-PT"));
    }

    @Test
    void catalogue_et_questions_localisent_champ_par_champ_sans_polarite() throws Exception {
        Referentiel ref = new Referentiel("joie", "Joie", Referentiel.Type.INDIVIDUEL, "Galates 5.22", 2);
        ref.setNomEn("TEST_EN_NOM"); ref.setVersetEn("TEST_EN_REFERENCE");
        Dimension dim = new Dimension(0, "Titre FR", "Court FR");
        dim.setLibelleEn("TEST_EN_DIMENSION"); // libelle court non traduit : repli FR.
        Question question = new Question(0, "Question FR", Question.Polarite.INVERSE);
        question.setTexteEn("TEST_EN_QUESTION");
        dim.ajouterQuestion(question); ref.ajouterDimension(dim);
        ReferentielRepository repo = mock(ReferentielRepository.class);
        when(repo.findByActifTrue()).thenReturn(List.of(ref));
        when(repo.findByCode("joie")).thenReturn(Optional.of(ref));
        var mvc = MockMvcBuilders.standaloneSetup(new ReferentielController(repo, new DomainMapper())).build();
        mvc.perform(get("/api/referentiels")).andExpect(status().isOk())
                .andExpect(jsonPath("$[0].nom").value("Joie"));
        mvc.perform(get("/api/referentiels?lang=en-GB")).andExpect(status().isOk())
                .andExpect(jsonPath("$[0].nom").value("TEST_EN_NOM"))
                .andExpect(jsonPath("$[0].nbQuestions").value(1));
        mvc.perform(get("/api/referentiels/joie?lang=en")).andExpect(status().isOk())
                .andExpect(jsonPath("$.code").value("joie"))
                .andExpect(jsonPath("$.verset").value("TEST_EN_REFERENCE"))
                .andExpect(jsonPath("$.dimensions[0].libelle").value("TEST_EN_DIMENSION"))
                .andExpect(jsonPath("$.dimensions[0].libelleCourt").value("Court FR"))
                .andExpect(jsonPath("$.dimensions[0].questions[0].texte").value("TEST_EN_QUESTION"))
                .andExpect(jsonPath("$.dimensions[0].questions[0].polarite").doesNotExist());
        for (String langue : List.of("fr", "es", "pt", "de")) {
            mvc.perform(get("/api/referentiels/joie").param("lang", langue))
                    .andExpect(jsonPath("$.dimensions[0].questions[0].texte").value("Question FR"));
        }
        assertEquals("Joie", ref.getNom());
        assertEquals(Question.Polarite.INVERSE, question.getPolarite());
    }

    @Test
    void migration_v9_preserve_les_textes_et_initialise_les_18_champs_a_null() throws Exception {
        try (var connection = DriverManager.getConnection("jdbc:h2:mem:i18n-migration;MODE=PostgreSQL", "sa", "")) {
            ScriptUtils.executeSqlScript(connection, new ClassPathResource("db/migration/V1__schema.sql"));
            try (var statement = connection.createStatement()) {
                int id = 1;
                for (String code : List.of("joie", "paix", "fidelite", "bonte", "amour", "patience", "couple")) {
                    statement.execute("INSERT INTO referentiels (id,code,nom,type) VALUES (" + id++ + ", '" + code + "', 'FR', 'INDIVIDUEL')");
                }
                statement.execute("INSERT INTO dimensions (id,referentiel_id,position,libelle,libelle_court) VALUES (1,1,0,'FR','FR')");
                statement.execute("INSERT INTO questions (id,dimension_id,position,texte) VALUES (1,1,0,'FR')");
            }
            ScriptUtils.executeSqlScript(connection, new ClassPathResource("db/migration/V5__baremes_interpretation_poc.sql"));
            ScriptUtils.executeSqlScript(connection, new ClassPathResource("db/migration/V9__i18n_contenu.sql"));
            for (var entry : java.util.Map.of(
                    "referentiels", List.of("nom", "verset"), "dimensions", List.of("libelle", "libelle_court"),
                    "questions", List.of("texte"), "tranches_interpretation", List.of("texte")).entrySet()) {
                try (var statement = connection.createStatement(); var result = statement.executeQuery("SELECT * FROM " + entry.getKey())) {
                    assertTrue(result.next());
                    for (String champ : entry.getValue()) {
                        for (String langue : List.of("en", "es", "pt")) assertNull(result.getString(champ + "_" + langue));
                    }
                }
            }
            try (var statement = connection.createStatement(); var result = statement.executeQuery("SELECT texte, polarite FROM questions WHERE id=1")) {
                assertTrue(result.next()); assertEquals("FR", result.getString("texte"));
                assertEquals("DIRECTE", result.getString("polarite"));
            }
        }
    }
}
