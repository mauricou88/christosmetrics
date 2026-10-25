package com.christosmetrics.infrastructure.security;

import io.github.bucket4j.Bandwidth;
import io.github.bucket4j.Bucket;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.time.Duration;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Rate limiter en mémoire, par (type, clé).
 *
 * Usage :
 *   if (!limiter.autoriser("login:" + ip, loginMaxParMinute, 60)) throw ...;
 *
 * Implémentation Bucket4j : token bucket, rafraîchi au fil de l'eau. En
 * déploiement multi-instance, remplacer par Redis (bucket4j-redis).
 */
@Component
public class RateLimiter {

    private final ConcurrentHashMap<String, Bucket> buckets = new ConcurrentHashMap<>();
    private final int loginMaxParMinute;
    private final int pdfMaxParHeure;

    public RateLimiter(@Value("${app.rate-limit.login-max-par-minute:5}") int loginMax,
                       @Value("${app.rate-limit.pdf-upload-max-par-heure:30}") int pdfMax) {
        this.loginMaxParMinute = loginMax;
        this.pdfMaxParHeure = pdfMax;
    }

    public int loginMaxParMinute() { return loginMaxParMinute; }
    public int pdfMaxParHeure() { return pdfMaxParHeure; }

    /** Essaie de consommer 1 jeton ; renvoie false si quota dépassé. */
    public boolean autoriser(String cle, int capacite, long fenetreSecondes) {
        Bucket b = buckets.computeIfAbsent(cle, k ->
                Bucket.builder()
                        .addLimit(Bandwidth.builder()
                                .capacity(capacite)
                                .refillGreedy(capacite, Duration.ofSeconds(fenetreSecondes))
                                .build())
                        .build());
        return b.tryConsume(1);
    }
}
