-- =========================================================================
-- V1 — Schéma initial CHRISTOSMETRICS (PostgreSQL)
-- =========================================================================
-- Tables : users, referentiels, dimensions, questions, passations, reponses,
-- resultats. Les clés étrangères et contraintes d'unicité encodent les règles
-- métier (ex. une seule réponse par (passation, question)).

CREATE TABLE users (
    id                BIGSERIAL PRIMARY KEY,
    email             VARCHAR(255) NOT NULL UNIQUE,
    mot_de_passe_hash VARCHAR(255) NOT NULL,
    prenom            VARCHAR(255),
    nom               VARCHAR(255),
    eglise            VARCHAR(255),
    cree_le           TIMESTAMP NOT NULL DEFAULT now()
);

CREATE TABLE referentiels (
    id       BIGSERIAL PRIMARY KEY,
    code     VARCHAR(64)  NOT NULL UNIQUE,
    nom      VARCHAR(255) NOT NULL,
    type     VARCHAR(32)  NOT NULL,          -- INDIVIDUEL | COUPLE
    verset   VARCHAR(255),
    actif    BOOLEAN      NOT NULL DEFAULT TRUE,
    top_flop INT          NOT NULL DEFAULT 3
);

CREATE TABLE dimensions (
    id             BIGSERIAL PRIMARY KEY,
    referentiel_id BIGINT NOT NULL REFERENCES referentiels(id) ON DELETE CASCADE,
    position       INT NOT NULL,
    libelle        VARCHAR(255) NOT NULL,
    libelle_court  VARCHAR(255)
);
CREATE INDEX idx_dimensions_referentiel ON dimensions(referentiel_id);

CREATE TABLE questions (
    id           BIGSERIAL PRIMARY KEY,
    dimension_id BIGINT NOT NULL REFERENCES dimensions(id) ON DELETE CASCADE,
    position     INT NOT NULL,
    texte        VARCHAR(1000) NOT NULL,
    polarite     VARCHAR(16) NOT NULL DEFAULT 'DIRECTE'  -- DIRECTE | INVERSE
);
CREATE INDEX idx_questions_dimension ON questions(dimension_id);

CREATE TABLE passations (
    id             BIGSERIAL PRIMARY KEY,
    user_id        BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    referentiel_id BIGINT NOT NULL REFERENCES referentiels(id),
    etat           VARCHAR(16) NOT NULL DEFAULT 'EN_COURS',  -- EN_COURS | TERMINEE
    debutee_le     TIMESTAMP NOT NULL DEFAULT now(),
    terminee_le    TIMESTAMP
);
CREATE INDEX idx_passations_user ON passations(user_id);
-- Optimise la recherche de la passation EN_COURS (reprise de progression).
CREATE INDEX idx_passations_reprise ON passations(user_id, referentiel_id, etat);

CREATE TABLE reponses (
    id           BIGSERIAL PRIMARY KEY,
    passation_id BIGINT NOT NULL REFERENCES passations(id) ON DELETE CASCADE,
    question_id  BIGINT NOT NULL REFERENCES questions(id),
    valeur       INT NOT NULL,               -- 1..5 (individuel) ou 1..4 (couple)
    repondue_le  TIMESTAMP NOT NULL DEFAULT now(),
    CONSTRAINT uq_reponse UNIQUE (passation_id, question_id)  -- une réponse/question
);
CREATE INDEX idx_reponses_passation ON reponses(passation_id);

CREATE TABLE resultats (
    id           BIGSERIAL PRIMARY KEY,
    passation_id BIGINT NOT NULL UNIQUE REFERENCES passations(id) ON DELETE CASCADE,
    score_global DOUBLE PRECISION NOT NULL,
    detail_json  TEXT NOT NULL,
    calcule_le   TIMESTAMP NOT NULL DEFAULT now()
);
