package com.christosmetrics.application.service;

import com.christosmetrics.application.dto.PassationDtos.*;
import com.christosmetrics.application.dto.ResultatDto;
import com.christosmetrics.application.mapper.DomainMapper;
import com.christosmetrics.application.i18n.ContenuLocalise;
import com.christosmetrics.domain.model.*;
import com.christosmetrics.domain.repository.*;
import com.christosmetrics.domain.service.ProgressionService;
import com.christosmetrics.domain.service.ScoringService;
import com.christosmetrics.domain.service.ScoringService.ResultatCalcule;
import com.christosmetrics.domain.service.ScoringService.ScoreDimension;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

/**
 * SERVICE APPLICATIF — cycle de vie complet d'une passation.
 *
 * Orchestre les cas d'usage en s'appuyant sur les services DU DOMAINE
 * (ProgressionService, ScoringService) et les repositories. C'est ici que se
 * fait la coordination (transactions, persistance), pas le calcul lui-même.
 *
 * Cas d'usage exposés :
 *  - demarrerOuReprendre : ouvre/retrouve la passation EN_COURS
 *  - repondre / repondreLot : enregistre les réponses (persistées aussitôt)
 *  - terminerEtCalculer : fige la passation, calcule et stocke le résultat
 *  - resultat : relit un résultat déjà calculé
 */
@Service
public class PassationApplicationService {

    private final PassationRepository passationRepo;
    private final ReferentielRepository referentielRepo;
    private final ResultatRepository resultatRepo;
    private final ProgressionService progressionService;
    private final ScoringService scoringService;
    private final DomainMapper mapper;
    private final ObjectMapper json = new ObjectMapper();

    public PassationApplicationService(
            PassationRepository passationRepo, ReferentielRepository referentielRepo,
            ResultatRepository resultatRepo, ProgressionService progressionService,
            ScoringService scoringService, DomainMapper mapper) {
        this.passationRepo = passationRepo;
        this.referentielRepo = referentielRepo;
        this.resultatRepo = resultatRepo;
        this.progressionService = progressionService;
        this.scoringService = scoringService;
        this.mapper = mapper;
    }

    /** Démarre ou reprend la passation de l'utilisateur pour un référentiel. */
    @Transactional
    public ProgressionDto demarrerOuReprendre(User user, String codeReferentiel) {
        Referentiel ref = referentielRepo.findByCode(codeReferentiel)
                .orElseThrow(() -> new NoSuchElementException("Référentiel inconnu : " + codeReferentiel));
        Passation p = progressionService.demarrerOuReprendre(user, ref);
        return mapper.toProgressionDto(progressionService.etatDeProgression(p));
    }

    /** Enregistre une réponse (persistée immédiatement pour la reprise). */
    @Transactional
    public ProgressionDto repondre(User user, Long passationId, RepondreRequest req) {
        Passation p = chargerPassationDeUser(user, passationId);
        Question q = trouverQuestion(p, req.questionId());
        p.repondre(q, req.valeur());
        passationRepo.save(p);
        return mapper.toProgressionDto(progressionService.etatDeProgression(p));
    }

    /** Enregistre un lot de réponses (mode couple, ou synchro d'une reprise). */
    @Transactional
    public ProgressionDto repondreLot(User user, Long passationId, RepondreLotRequest req) {
        Passation p = chargerPassationDeUser(user, passationId);
        for (RepondreRequest r : req.reponses()) {
            p.repondre(trouverQuestion(p, r.questionId()), r.valeur());
        }
        passationRepo.save(p);
        return mapper.toProgressionDto(progressionService.etatDeProgression(p));
    }

    /** Termine la passation, calcule le résultat, le stocke, le renvoie. */
    @Transactional
    public ResultatDto terminerEtCalculer(User user, Long passationId) {
        return terminerEtCalculer(user, passationId, "fr");
    }

    /** Persiste le resultat canonique francais et localise seulement la reponse HTTP. */
    @Transactional
    public ResultatDto terminerEtCalculer(User user, Long passationId, String langue) {
        Passation p = chargerPassationDeUser(user, passationId);
        ProgressionService.Progression progression = progressionService.etatDeProgression(p);
        if (!progression.complete()) {
            throw new IllegalStateException(
                    "Questionnaire incomplet : " + progression.questionsRepondues()
                            + " réponse(s) sur " + progression.totalQuestions());
        }
        if (!p.estTerminee()) {
            p.terminer();
        }
        ResultatCalcule calc = scoringService.calculer(p);

        // Sérialise le détail en JSON et persiste le résultat (un par passation).
        ResultatDto dto = toResultatDto(p, calc, "fr");
        Resultat resultat = resultatRepo.findByPassation(p).orElse(null);
        String detail = serialiser(dto);
        if (resultat == null) {
            resultat = new Resultat(p, calc.global(), detail);
        }
        resultatRepo.save(resultat);
        passationRepo.save(p);
        return toResultatDto(p, calc, langue);
    }

    /** Relit un résultat déjà calculé (pour réafficher / régénérer le PDF). */
    @Transactional(readOnly = true)
    public ResultatDto resultat(User user, Long passationId) {
        return resultat(user, passationId, "fr");
    }

    /** Relit les scores existants avec les textes de la langue demandee. */
    @Transactional(readOnly = true)
    public ResultatDto resultat(User user, Long passationId, String langue) {
        Passation p = chargerPassationDeUser(user, passationId);
        if (!p.estTerminee()) {
            throw new IllegalStateException("Cette passation n'est pas encore terminée");
        }
        return toResultatDto(p, scoringService.calculer(p), langue);
    }

    // ---- Helpers ----

    private Passation chargerPassationDeUser(User user, Long passationId) {
        Passation p = passationRepo.findById(passationId)
                .orElseThrow(() -> new NoSuchElementException("Passation introuvable"));
        if (!p.getUser().getId().equals(user.getId())) {
            throw new SecurityException("Cette passation n'appartient pas à l'utilisateur");
        }
        return p;
    }

    private Question trouverQuestion(Passation p, Long questionId) {
        for (Dimension d : p.getReferentiel().getDimensions()) {
            for (Question q : d.getQuestions()) {
                if (q.getId().equals(questionId)) return q;
            }
        }
        throw new NoSuchElementException("Question hors référentiel : " + questionId);
    }

    /** Construit le DTO de résultat + détecte la tranche du barème. */
    private ResultatDto toResultatDto(Passation p, ResultatCalcule calc, String langue) {
        Referentiel ref = p.getReferentiel();
        List<ResultatDto.ScoreDimensionDto> dims = calc.dimensions().stream()
                .map(s -> toDimDto(s, ref, langue)).toList();
        List<ResultatDto.ScoreDimensionDto> top = calc.top().stream().map(s -> toDimDto(s, ref, langue)).toList();
        List<ResultatDto.ScoreDimensionDto> flop = calc.flop().stream().map(s -> toDimDto(s, ref, langue)).toList();

        int scoreInterprete = calc.globalArrondi();
        List<ResultatDto.TrancheDto> bareme = ref.getTranchesInterpretation().stream()
                .map(t -> new ResultatDto.TrancheDto(
                        t.getMinScore(),
                        t.getMaxScore(),
                        ContenuLocalise.getContenuLocalise(t, langue),
                        t.getTypeIcone(),
                        t.getNombreIcones(),
                        t.contient(scoreInterprete)))
                .toList();
        ResultatDto.TrancheDto tranche = bareme.stream()
                .filter(ResultatDto.TrancheDto::active)
                .findFirst()
                .orElse(null);
        String unite = ref.getType() == Referentiel.Type.COUPLE
                ? "POINTS_SUR_36"
                : "POURCENTAGE";

        return new ResultatDto(
                p.getId(), ref.getCode(), ContenuLocalise.nom(ref, langue), ref.getType().name(),
                calc.global(), calc.globalArrondi(), unite, tranche, bareme,
                dims, top, flop);
    }

    /** Retrouve la dimension par son identifiant, jamais par son texte traduit. */
    private ResultatDto.ScoreDimensionDto toDimDto(ScoreDimension s, Referentiel ref, String langue) {
        Dimension d = ref.getDimensions().stream()
                .filter(dimension -> Objects.equals(dimension.getId(), s.dimensionId()))
                .findFirst().orElseThrow();
        return new ResultatDto.ScoreDimensionDto(
                ContenuLocalise.libelle(d, langue), ContenuLocalise.libelleCourt(d, langue), s.pourcentage());
    }

    private String serialiser(Object o) {
        try { return json.writeValueAsString(o); }
        catch (Exception e) { throw new RuntimeException("Sérialisation du résultat impossible", e); }
    }
}
