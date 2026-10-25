package com.christosmetrics.web.controller;

import com.christosmetrics.application.dto.AuthDtos.*;
import com.christosmetrics.application.service.AuthService;
import com.christosmetrics.infrastructure.security.RateLimiter;
import com.christosmetrics.infrastructure.security.TrafficExcessif;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

/**
 * Endpoints d'authentification (publics) + rate limiting anti brute-force.
 */
@RestController
@RequestMapping("/api/auth")
public class AuthController {

    private final AuthService authService;
    private final RateLimiter rateLimiter;

    public AuthController(AuthService authService, RateLimiter rateLimiter) {
        this.authService = authService;
        this.rateLimiter = rateLimiter;
    }

    @PostMapping("/register")
    public ResponseEntity<AuthResponse> register(@Valid @RequestBody RegisterRequest req,
                                                 HttpServletRequest http) {
        // 10 inscriptions max / heure / IP (anti création massive de comptes)
        exigerSousQuota("register:" + ipDe(http), 10, 3600);
        return ResponseEntity.ok(authService.register(req));
    }

    @PostMapping("/login")
    public ResponseEntity<AuthResponse> login(@Valid @RequestBody LoginRequest req,
                                              HttpServletRequest http) {
        // 5 tentatives max / minute / IP + / email (double garde-fou)
        exigerSousQuota("login-ip:" + ipDe(http), rateLimiter.loginMaxParMinute(), 60);
        exigerSousQuota("login-mail:" + req.email().toLowerCase(), rateLimiter.loginMaxParMinute(), 60);
        return ResponseEntity.ok(authService.login(req));
    }

    private void exigerSousQuota(String cle, int max, long fenetreSec) {
        if (!rateLimiter.autoriser(cle, max, fenetreSec)) {
            throw new TrafficExcessif("Trop de tentatives, veuillez patienter.");
        }
    }

    /** Récupère l'IP du client en tenant compte des reverse proxies (Railway/Render). */
    private String ipDe(HttpServletRequest req) {
        String xff = req.getHeader("X-Forwarded-For");
        if (xff != null && !xff.isBlank()) return xff.split(",")[0].trim();
        return req.getRemoteAddr();
    }
}
