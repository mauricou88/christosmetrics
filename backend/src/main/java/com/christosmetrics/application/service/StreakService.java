package com.christosmetrics.application.service;

import com.christosmetrics.domain.model.User;
import com.christosmetrics.domain.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.Clock;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.NoSuchElementException;

/** Série quotidienne en UTC. TODO : affiner selon le fuseau de l’utilisateur. */
@Service
public class StreakService {
    private final UserRepository userRepository;
    private final Clock clock;

    /** Utilise l’horloge UTC du serveur en production. */
    @Autowired
    public StreakService(UserRepository userRepository) {
        this(userRepository, Clock.systemUTC());
    }

    /** Permet des tests déterministes, notamment au passage de minuit UTC. */
    StreakService(UserRepository userRepository, Clock clock) {
        this.userRepository = userRepository;
        this.clock = clock;
    }

    /** Recharge le compte sous verrou ; le principal JWT peut être détaché ou périmé. */
    @Transactional
    public void enregistrerActivite(User user) {
        enregistrerActivite(user.getId());
    }

    /** Même jour : inchangé ; hier : +1 ; première activité ou interruption : 1. */
    @Transactional
    public void enregistrerActivite(Long userId) {
        User user = userRepository.findByIdPourActivite(userId)
                .orElseThrow(() -> new NoSuchElementException("Compte introuvable"));
        LocalDateTime maintenant = LocalDateTime.ofInstant(clock.instant(), ZoneOffset.UTC);
        LocalDate aujourdHui = maintenant.toLocalDate();
        LocalDate derniereDate = user.getDerniereActiviteAt() == null
                ? null : user.getDerniereActiviteAt().toLocalDate();
        if (aujourdHui.equals(derniereDate)) return;

        int serie = aujourdHui.minusDays(1).equals(derniereDate) ? user.getStreakActuel() + 1 : 1;
        user.setStreakActuel(serie);
        user.setStreakRecord(Math.max(user.getStreakRecord(), serie));
        user.setDerniereActiviteAt(maintenant);
        userRepository.save(user);
    }

    /** Une série interrompue vaut zéro à la lecture, sans compter GET /api/moi comme activité. */
    public int streakActuel(User user) {
        if (user.getDerniereActiviteAt() == null) return 0;
        LocalDate aujourdHui = LocalDate.ofInstant(clock.instant(), ZoneOffset.UTC);
        LocalDate derniereDate = user.getDerniereActiviteAt().toLocalDate();
        return derniereDate.equals(aujourdHui) || derniereDate.equals(aujourdHui.minusDays(1))
                ? user.getStreakActuel() : 0;
    }
}
