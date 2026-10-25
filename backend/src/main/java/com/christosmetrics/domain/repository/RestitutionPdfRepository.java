package com.christosmetrics.domain.repository;

import com.christosmetrics.domain.model.Passation;
import com.christosmetrics.domain.model.RestitutionPdf;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

public interface RestitutionPdfRepository extends JpaRepository<RestitutionPdf, Long> {
    Optional<RestitutionPdf> findByPassation(Passation passation);
}
