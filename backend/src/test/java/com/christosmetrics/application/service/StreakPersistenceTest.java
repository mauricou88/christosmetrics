package com.christosmetrics.application.service;

import com.christosmetrics.domain.model.User;
import com.christosmetrics.domain.repository.UserRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.context.TestConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Import;
import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.datasource.init.ScriptUtils;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.sql.DriverManager;
import java.time.Clock;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

import static org.junit.jupiter.api.Assertions.*;

@DataJpaTest(properties = {
        "spring.flyway.enabled=false",
        "spring.jpa.hibernate.ddl-auto=create-drop"
})
@Import(StreakPersistenceTest.ConfigurationTest.class)
class StreakPersistenceTest {
    @Autowired private UserRepository repository;
    @Autowired private StreakService service;

    @TestConfiguration
    static class ConfigurationTest {
        /** Même date UTC pour les deux transactions concurrentes. */
        @Bean
        StreakService streakService(UserRepository repository) {
            return new StreakService(repository, Clock.fixed(Instant.parse("2026-10-28T12:00:00Z"), ZoneOffset.UTC));
        }
    }

    @Test
    @Transactional(propagation = Propagation.NOT_SUPPORTED)
    void deux_activites_concurrentes_ne_doublent_pas_lincrementation() throws Exception {
        User user = new User("parallel@example.invalid", "hash", "Test", "User", null);
        user.setDerniereActiviteAt(LocalDateTime.parse("2026-10-27T12:00:00"));
        user.setStreakActuel(3);
        user.setStreakRecord(3);
        Long id = repository.saveAndFlush(user).getId();
        CountDownLatch prets = new CountDownLatch(2);
        CountDownLatch depart = new CountDownLatch(1);
        var executor = Executors.newFixedThreadPool(2);
        try {
            var activite = (java.util.concurrent.Callable<Void>) () -> {
                prets.countDown();
                assertTrue(depart.await(10, TimeUnit.SECONDS));
                service.enregistrerActivite(id);
                return null;
            };
            var premiere = executor.submit(activite);
            var seconde = executor.submit(activite);
            assertTrue(prets.await(10, TimeUnit.SECONDS));
            depart.countDown();
            premiere.get(20, TimeUnit.SECONDS);
            seconde.get(20, TimeUnit.SECONDS);
            User recharge = repository.findById(id).orElseThrow();
            assertEquals(4, recharge.getStreakActuel());
            assertEquals(4, recharge.getStreakRecord());
        } finally {
            depart.countDown();
            executor.shutdownNow();
            executor.awaitTermination(10, TimeUnit.SECONDS);
            repository.deleteById(id);
        }
    }

    @Test
    void migration_v8_preserve_les_comptes_et_initialise_les_compteurs() throws Exception {
        try (var connection = DriverManager.getConnection("jdbc:h2:mem:streak-migration;MODE=PostgreSQL", "sa", "")) {
            try (var statement = connection.createStatement()) {
                statement.execute("CREATE TABLE users (id BIGINT PRIMARY KEY, email VARCHAR(255))");
                statement.execute("INSERT INTO users (id, email) VALUES (1, 'existing@example.invalid')");
            }
            ScriptUtils.executeSqlScript(connection, new ClassPathResource("db/migration/V8__user_streak.sql"));
            try (var statement = connection.createStatement(); var result = statement.executeQuery("SELECT * FROM users WHERE id = 1")) {
                assertTrue(result.next());
                assertEquals("existing@example.invalid", result.getString("email"));
                assertEquals(0, result.getInt("streak_actuel"));
                assertEquals(0, result.getInt("streak_record"));
                assertNull(result.getTimestamp("derniere_activite_at"));
            }
        }
    }
}
