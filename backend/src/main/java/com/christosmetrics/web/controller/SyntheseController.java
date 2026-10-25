package com.christosmetrics.web.controller;

import com.christosmetrics.application.dto.HistoriqueDtos.SyntheseGlobale;
import com.christosmetrics.application.service.SyntheseService;
import com.christosmetrics.domain.model.User;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

/** GET /api/mon-parcours — historique + synthèse CHRISTOS globale. */
@RestController
@RequestMapping("/api/mon-parcours")
public class SyntheseController {

    private final SyntheseService service;

    public SyntheseController(SyntheseService service) { this.service = service; }

    @GetMapping
    public SyntheseGlobale monParcours(@AuthenticationPrincipal User user) {
        return service.synthese(user);
    }
}
