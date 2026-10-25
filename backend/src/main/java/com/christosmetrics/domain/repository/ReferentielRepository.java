package com.christosmetrics.domain.repository;

import com.christosmetrics.domain.model.Referentiel;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;
import java.util.Optional;

public interface ReferentielRepository extends JpaRepository<Referentiel, Long> {
    Optional<Referentiel> findByCode(String code);
    List<Referentiel> findByActifTrue();
}
