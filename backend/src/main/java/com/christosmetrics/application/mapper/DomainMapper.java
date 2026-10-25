package com.christosmetrics.application.mapper;

import com.christosmetrics.application.dto.*;
import com.christosmetrics.domain.model.*;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * MAPPERS entité → DTO.
 *
 * Convertit les entités du domaine en objets d'échange exposés au client.
 * Règle importante : on n'expose JAMAIS la polarité des questions (elle sert
 * au scoring serveur et donnerait des indices sur les "bonnes" réponses), ni
 * le hash du mot de passe.
 */
@Component
public class DomainMapper {

    // ---- User ----

    public UserDto toUserDto(User u) {
        return new UserDto(u.getId(), u.getEmail(), u.getPrenom(), u.getNom(), u.getEglise());
    }

    // ---- Referentiel ----

    public ReferentielDto.ReferentielResume toResume(Referentiel r) {
        int nbQuestions = r.getDimensions().stream()
                .mapToInt(d -> d.getQuestions().size()).sum();
        return new ReferentielDto.ReferentielResume(
                r.getId(), r.getCode(), r.getNom(), r.getType().name(),
                r.getVerset(), r.getTopFlop(), r.getDimensions().size(), nbQuestions);
    }

    public ReferentielDto.ReferentielComplet toComplet(Referentiel r) {
        List<ReferentielDto.DimensionDto> dims = r.getDimensions().stream()
                .map(this::toDimensionDto)
                .toList();
        return new ReferentielDto.ReferentielComplet(
                r.getId(), r.getCode(), r.getNom(), r.getType().name(),
                r.getVerset(), r.getTopFlop(), dims);
    }

    private ReferentielDto.DimensionDto toDimensionDto(Dimension d) {
        List<ReferentielDto.QuestionDto> questions = d.getQuestions().stream()
                // NB : pas de polarité exposée ici, volontairement.
                .map(q -> new ReferentielDto.QuestionDto(q.getId(), q.getPosition(), q.getTexte()))
                .toList();
        return new ReferentielDto.DimensionDto(
                d.getId(), d.getPosition(), d.getLibelle(), d.getLibelleCourt(), questions);
    }

    // ---- Progression ----

    public PassationDtos.ProgressionDto toProgressionDto(
            com.christosmetrics.domain.service.ProgressionService.Progression p) {
        return new PassationDtos.ProgressionDto(
                p.passationId(), p.totalQuestions(), p.questionsRepondues(),
                p.indexProchaineQuestion(), p.complete(),p.reponses());
    }
}
