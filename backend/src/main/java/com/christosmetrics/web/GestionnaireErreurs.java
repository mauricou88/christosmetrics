package com.christosmetrics.web;

import com.christosmetrics.infrastructure.security.TrafficExcessif;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.Map;
import java.util.NoSuchElementException;
import java.util.stream.Collectors;

/**
 * Traduit les exceptions métier en réponses HTTP claires et cohérentes.
 * Pas de stack trace dans la réponse. Codes HTTP standards.
 */
@RestControllerAdvice
public class GestionnaireErreurs {

    /** Erreurs métier / règles → 400 Bad Request. */
    @ExceptionHandler({IllegalArgumentException.class, IllegalStateException.class})
    public ResponseEntity<Map<String, String>> mauvaiseRequete(RuntimeException e) {
        return ResponseEntity.badRequest().body(Map.of("erreur", e.getMessage()));
    }

    /** Validation @Valid → 400 avec détail par champ. */
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<Map<String, Object>> validation(MethodArgumentNotValidException e) {
        Map<String, String> champs = e.getBindingResult().getFieldErrors().stream()
                .collect(Collectors.toMap(
                        FieldError::getField,
                        err -> err.getDefaultMessage() == null ? "invalide" : err.getDefaultMessage(),
                        (a, b) -> a));
        return ResponseEntity.badRequest()
                .body(Map.of("erreur", "Entrée invalide", "champs", champs));
    }

    /** Ressource absente → 404 Not Found. */
    @ExceptionHandler(NoSuchElementException.class)
    public ResponseEntity<Map<String, String>> introuvable(NoSuchElementException e) {
        return ResponseEntity.status(HttpStatus.NOT_FOUND)
                .body(Map.of("erreur", e.getMessage()));
    }

    /** Accès à une ressource d'autrui → 403 Forbidden. */
    @ExceptionHandler(SecurityException.class)
    public ResponseEntity<Map<String, String>> interdit(SecurityException e) {
        return ResponseEntity.status(HttpStatus.FORBIDDEN)
                .body(Map.of("erreur", e.getMessage()));
    }

    /** Rate limit dépassé → 429 Too Many Requests. */
    @ExceptionHandler(TrafficExcessif.class)
    public ResponseEntity<Map<String, String>> trafficExcessif(TrafficExcessif e) {
        return ResponseEntity.status(HttpStatus.TOO_MANY_REQUESTS)
                .body(Map.of("erreur", e.getMessage()));
    }
}
