package com.christosmetrics.domain.repository;

import com.christosmetrics.domain.model.Passation;
import com.christosmetrics.domain.model.Referentiel;
import com.christosmetrics.domain.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;
import java.util.Optional;

public interface PassationRepository extends JpaRepository<Passation, Long> {

    /** La passation EN_COURS d'un user pour un référentiel (reprise). */
    Optional<Passation> findByUserAndReferentielAndEtat(
            User user, Referentiel referentiel, Passation.Etat etat);

    /** Toutes les passations d'un utilisateur (pour l'historique/synthèse). */
    List<Passation> findByUserOrderByDebuteeLeDesc(User user);

    /** Les passations terminées d'un utilisateur (pour la synthèse globale). */
    List<Passation> findByUserAndEtat(User user, Passation.Etat etat);
}
