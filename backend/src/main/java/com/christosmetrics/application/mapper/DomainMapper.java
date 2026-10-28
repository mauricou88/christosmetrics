package com.christosmetrics.application.mapper;

import com.christosmetrics.application.dto.*;
import com.christosmetrics.domain.model.*;
import com.christosmetrics.application.i18n.ContenuLocalise;
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
        return toResume(r, "fr");
    }

    /** Localise le catalogue en conservant les identifiants et compteurs. */
    public ReferentielDto.ReferentielResume toResume(Referentiel r, String langue) {
        int nbQuestions = r.getDimensions().stream()
                .mapToInt(d -> d.getQuestions().size()).sum();
        return new ReferentielDto.ReferentielResume(
                r.getId(), r.getCode(), ContenuLocalise.nom(r, langue), r.getType().name(),
                ContenuLocalise.verset(r, langue), r.getTopFlop(), r.getDimensions().size(), nbQuestions);
    }

    public ReferentielDto.ReferentielComplet toComplet(Referentiel r) {
        return toComplet(r, "fr");
    }

    /** Localise le questionnaire complet, avec repli francais champ par champ. */
    public ReferentielDto.ReferentielComplet toComplet(Referentiel r, String langue) {
        List<ReferentielDto.DimensionDto> dims = r.getDimensions().stream()
                .map(d -> toDimensionDto(d, langue))
                .toList();
        return new ReferentielDto.ReferentielComplet(
                r.getId(), r.getCode(), ContenuLocalise.nom(r, langue), r.getType().name(),
                ContenuLocalise.verset(r, langue), r.getTopFlop(), dims);
    }

    /** Adapte les titres et enonces a la langue de la requete. */
    private ReferentielDto.DimensionDto toDimensionDto(Dimension d, String langue) {
        List<ReferentielDto.QuestionDto> questions = d.getQuestions().stream()
                // NB : pas de polarité exposée ici, volontairement.
                .map(q -> new ReferentielDto.QuestionDto(q.getId(), q.getPosition(), ContenuLocalise.getContenuLocalise(q, langue)))
                .toList();
        return new ReferentielDto.DimensionDto(
                d.getId(), d.getPosition(), ContenuLocalise.libelle(d, langue), ContenuLocalise.libelleCourt(d, langue), questions);
    }

    // ---- Progression ----

    public PassationDtos.ProgressionDto toProgressionDto(
            com.christosmetrics.domain.service.ProgressionService.Progression p) {
        return new PassationDtos.ProgressionDto(
                p.passationId(), p.totalQuestions(), p.questionsRepondues(),
                p.indexProchaineQuestion(), p.complete(),p.reponses());
    }
}
