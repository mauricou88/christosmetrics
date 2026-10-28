package com.christosmetrics.application.service;

import com.christosmetrics.application.dto.MoiDto;
import com.christosmetrics.domain.model.Passation;
import com.christosmetrics.domain.model.Referentiel;
import com.christosmetrics.domain.model.User;
import com.christosmetrics.domain.repository.PassationRepository;
import com.christosmetrics.domain.repository.UserRepository;
import com.christosmetrics.domain.service.ScoringService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.Set;

/** Progression limitée aux six fruits disponibles ; Couple et futurs tests sont exclus. */
@Service
public class MoiService {
    private static final Set<String> FRUITS = Set.of("amour", "joie", "paix", "patience", "bonte", "fidelite");
    private final UserRepository userRepository;
    private final PassationRepository passationRepository;
    private final ScoringService scoringService;
    private final StreakService streakService;

    /** Réutilise le moteur de pourcentages employé par les restitutions existantes. */
    public MoiService(UserRepository userRepository, PassationRepository passationRepository,
                      ScoringService scoringService, StreakService streakService) {
        this.userRepository = userRepository;
        this.passationRepository = passationRepository;
        this.scoringService = scoringService;
        this.streakService = streakService;
    }

    /** Une seule passation terminée par fruit : la plus récente, comme dans l’historique. */
    @Transactional(readOnly = true)
    public MoiDto moi(User principal) {
        User user = userRepository.findById(principal.getId())
                .orElseThrow(() -> new NoSuchElementException("Compte introuvable"));
        Map<String, Passation> terminees = new LinkedHashMap<>();
        for (Passation passation : passationRepository.findByUserOrderByDebuteeLeDesc(user)) {
            Referentiel ref = passation.getReferentiel();
            if (passation.estTerminee() && ref.getType() == Referentiel.Type.INDIVIDUEL
                    && FRUITS.contains(ref.getCode())) {
                terminees.putIfAbsent(ref.getCode(), passation);
            }
        }
        boolean complet = terminees.size() == FRUITS.size();
        Double score = complet ? terminees.values().stream()
                .mapToDouble(p -> scoringService.calculer(p).global()).average().orElseThrow() : null;
        return new MoiDto(user.getPrenom(), user.getNom(), user.getEmail(),
                streakService.streakActuel(user), user.getStreakRecord(),
                terminees.size(), FRUITS.size(), complet, score);
    }
}
