package com.christosmetrics.web.controller;

import com.christosmetrics.application.dto.MoiDto;
import com.christosmetrics.application.service.MoiService;
import com.christosmetrics.domain.model.User;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/** Endpoint personnel protégé par la règle JWT globale de SecurityConfig. */
@RestController
@RequestMapping("/api/moi")
public class MoiController {
    private final MoiService service;

    /** Injecte la lecture de progression, sans effet de bord sur le streak. */
    public MoiController(MoiService service) { this.service = service; }

    /** Renvoie exclusivement le profil et la progression du compte authentifié. */
    @GetMapping
    public MoiDto moi(@AuthenticationPrincipal User user) { return service.moi(user); }
}
