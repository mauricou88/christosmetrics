package com.christosmetrics.domain.repository;

import com.christosmetrics.domain.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Lock;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import jakarta.persistence.LockModeType;
import java.util.Optional;

/**
 * Contrat d'accès aux utilisateurs. L'implémentation est générée par Spring
 * Data JPA — le domaine ne dépend d'aucune techno de persistance concrète.
 */
public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByEmail(String email);
    boolean existsByEmail(String email);

    /** Sérialise les activités concurrentes sans réenregistrer un principal JWT détaché. */
    @Lock(LockModeType.PESSIMISTIC_WRITE)
    @Query("select u from User u where u.id = :id")
    Optional<User> findByIdPourActivite(@Param("id") Long id);
}
