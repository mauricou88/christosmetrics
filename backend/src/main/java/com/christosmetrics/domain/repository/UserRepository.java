package com.christosmetrics.domain.repository;

import com.christosmetrics.domain.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

/**
 * Contrat d'accès aux utilisateurs. L'implémentation est générée par Spring
 * Data JPA — le domaine ne dépend d'aucune techno de persistance concrète.
 */
public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByEmail(String email);
    boolean existsByEmail(String email);
}
