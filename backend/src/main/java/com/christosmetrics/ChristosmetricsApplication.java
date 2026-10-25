package com.christosmetrics;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableAsync;

/**
 * Point d'entrée de l'application Spring Boot CHRISTOSMETRICS.
 * Lance le serveur, initialise le contexte (beans, sécurité, JPA, Flyway).
 */
@SpringBootApplication
@EnableAsync
public class ChristosmetricsApplication {
    public static void main(String[] args) {
        SpringApplication.run(ChristosmetricsApplication.class, args);
    }
}
