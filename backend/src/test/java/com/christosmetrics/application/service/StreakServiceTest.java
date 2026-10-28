package com.christosmetrics.application.service;

import com.christosmetrics.domain.model.User;
import com.christosmetrics.domain.repository.UserRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.test.util.ReflectionTestUtils;

import java.time.Clock;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

class StreakServiceTest {
    private final UserRepository repository = mock(UserRepository.class);
    // Il est encore le 27 à Los Angeles : le calcul doit néanmoins utiliser le 28 UTC.
    private final Clock clock = Clock.fixed(Instant.parse("2026-10-28T00:05:00Z"), ZoneId.of("America/Los_Angeles"));
    private final StreakService service = new StreakService(repository, clock);
    private User user;

    @BeforeEach
    void preparer() {
        user = new User("test@example.invalid", "hash", "Test", "User", null);
        ReflectionTestUtils.setField(user, "id", 1L);
        when(repository.findByIdPourActivite(1L)).thenReturn(Optional.of(user));
    }

    @Test
    void premiere_activite_cree_serie_et_record_en_utc() {
        service.enregistrerActivite(1L);
        assertEquals(1, user.getStreakActuel());
        assertEquals(1, user.getStreakRecord());
        assertEquals(LocalDateTime.parse("2026-10-28T00:05:00"), user.getDerniereActiviteAt());
        verify(repository).save(user);
    }

    @Test
    void plusieurs_actions_le_meme_jour_ne_comptent_qu_une_fois() {
        service.enregistrerActivite(1L);
        service.enregistrerActivite(1L);
        assertEquals(1, user.getStreakActuel());
        verify(repository, times(1)).save(user);
    }

    @Test
    void passage_de_minuit_utc_incremente_la_serie_et_le_record() {
        user.setDerniereActiviteAt(LocalDateTime.parse("2026-10-27T23:59:00"));
        user.setStreakActuel(5);
        user.setStreakRecord(5);
        service.enregistrerActivite(1L);
        assertEquals(6, user.getStreakActuel());
        assertEquals(6, user.getStreakRecord());
    }

    @Test
    void interruption_repart_a_un_sans_effacer_le_record() {
        user.setDerniereActiviteAt(LocalDateTime.parse("2026-10-26T23:59:00"));
        user.setStreakActuel(5);
        user.setStreakRecord(12);
        service.enregistrerActivite(1L);
        assertEquals(1, user.getStreakActuel());
        assertEquals(12, user.getStreakRecord());
    }

    @Test
    void lecture_expire_la_serie_sans_creer_une_activite() {
        assertEquals(0, service.streakActuel(user));
        user.setStreakActuel(5);
        user.setStreakRecord(12);
        user.setDerniereActiviteAt(LocalDateTime.parse("2026-10-26T23:59:00"));
        assertEquals(0, service.streakActuel(user));
        user.setDerniereActiviteAt(LocalDateTime.parse("2026-10-27T00:00:00"));
        assertEquals(5, service.streakActuel(user));
        assertEquals(12, user.getStreakRecord());
        verifyNoInteractions(repository);
    }

    @Test
    void principal_detache_necrase_pas_les_champs_recents_du_compte() {
        User principal = new User("test@example.invalid", "ancien hash", "Ancien", "Nom", null);
        ReflectionTestUtils.setField(principal, "id", 1L);
        user.invaliderTousLesTokens();
        service.enregistrerActivite(principal);
        assertEquals(1, user.getTokenVersion());
        assertEquals("Test", user.getPrenom());
        verify(repository).save(user);
        verify(repository, never()).save(principal);
    }
}
