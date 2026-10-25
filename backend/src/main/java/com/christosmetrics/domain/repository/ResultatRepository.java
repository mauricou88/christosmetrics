package com.christosmetrics.domain.repository;

import com.christosmetrics.domain.model.Resultat;
import com.christosmetrics.domain.model.Passation;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

public interface ResultatRepository extends JpaRepository<Resultat, Long> {
    Optional<Resultat> findByPassation(Passation passation);
}
