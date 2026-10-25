package com.christosmetrics.web.controller;

import com.christosmetrics.application.dto.ReferentielDto.*;
import com.christosmetrics.application.mapper.DomainMapper;
import com.christosmetrics.domain.repository.ReferentielRepository;
import org.springframework.web.bind.annotation.*;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;
import java.util.NoSuchElementException;

/**
 * Catalogue des référentiels (fruits + couple), public.
 *  GET /api/referentiels          → liste des référentiels actifs (résumé)
 *  GET /api/referentiels/{code}   → détail (dimensions + questions) d'un test
 *
 * Les questions renvoyées ne contiennent PAS la polarité (secret de scoring).
 */
@RestController
@RequestMapping("/api/referentiels")
@Transactional(readOnly = true)
public class ReferentielController {

    private final ReferentielRepository referentielRepo;
    private final DomainMapper mapper;

    public ReferentielController(ReferentielRepository referentielRepo, DomainMapper mapper) {
        this.referentielRepo = referentielRepo;
        this.mapper = mapper;
    }

    @GetMapping
    public List<ReferentielResume> lister() {
        return referentielRepo.findByActifTrue().stream().map(mapper::toResume).toList();
    }

    @GetMapping("/{code}")
    public ReferentielComplet detail(@PathVariable String code) {
        return referentielRepo.findByCode(code)
                .map(mapper::toComplet)
                .orElseThrow(() -> new NoSuchElementException("Référentiel inconnu : " + code));
    }
}
