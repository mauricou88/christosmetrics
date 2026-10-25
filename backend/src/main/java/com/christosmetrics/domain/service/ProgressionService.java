package com.christosmetrics.domain.service;

import com.christosmetrics.domain.model.*;
import com.christosmetrics.domain.repository.PassationRepository;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * LOGIQUE DE REPRISE DE PROGRESSION.
 *
 * Répond au besoin : « l'utilisateur se déconnecte en plein test et retrouve
 * sa progression en se reconnectant ».
 *
 * Principe :
 *  - une seule {@link Passation} EN_COURS par (user, référentiel) ;
 *  - chaque réponse est persistée immédiatement (pas à la fin) ;
 *  - reprendre() renvoie la passation en cours + l'index de la première
 *    question sans réponse → le front reprend exactement là.
 *
 * Ce service ne calcule pas les scores (c'est le rôle de ScoringService) ;
 * il orchestre le cycle de vie d'une passation.
 */
@Service
public class ProgressionService {

    private final PassationRepository passationRepo;

    public ProgressionService(PassationRepository passationRepo) {
        this.passationRepo = passationRepo;
    }

    /**
     * Démarre une nouvelle passation OU récupère celle EN_COURS.
     * Garantit l'invariant « au plus une passation EN_COURS par (user, ref) ».
     */
    public Passation demarrerOuReprendre(User user, Referentiel referentiel) {
        return passationRepo
                .findByUserAndReferentielAndEtat(user, referentiel, Passation.Etat.EN_COURS)
                .orElseGet(() -> passationRepo.save(new Passation(user, referentiel)));
    }

    /**
     * Décrit l'état d'avancement d'une passation : combien de questions au
     * total, combien de répondues, et l'index de la prochaine sans réponse.
     * C'est ce que le front consomme pour se repositionner.
     */
    public Progression etatDeProgression(Passation passation) {
        // Ordre "à plat" des questions : dimension par dimension, dans l'ordre.
        List<Question> ordre = new ArrayList<>();
        for (Dimension d : passation.getReferentiel().getDimensions()) {
            ordre.addAll(d.getQuestions());
        }

        Set<Long> repondues = new HashSet<>();
        Map<Long, Integer> valeurs = new LinkedHashMap<>();
    
       for (Reponse r : passation.getReponses()) {
        Long questionId = r.getQuestion().getId();
            repondues.add(questionId);
            valeurs.put(questionId, r.getValeur());
        }

        int prochaineNonRepondue = -1;
        for (int i = 0; i < ordre.size(); i++) {
            if (!repondues.contains(ordre.get(i).getId())) {
                prochaineNonRepondue = i;
                break;
            }
        }
        boolean complete = prochaineNonRepondue == -1;

        return new Progression(
                passation.getId(),
                ordre.size(),
                repondues.size(),
                prochaineNonRepondue,
                complete,
                valeurs);
    }

    /** État d'avancement renvoyé au client pour reprendre là où il en était. */
    public record Progression(
            Long passationId,
            int totalQuestions,
            int questionsRepondues,
            int indexProchaineQuestion, // -1 si tout est répondu
            boolean complete,
            Map<Long, Integer> reponses) { }
}
