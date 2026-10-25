-- =========================================================================
-- V7 — Révocation JWT : token_version sur users
-- =========================================================================
-- À chaque logout global ou changement de mot de passe, on incrémente ce
-- champ ; tous les JWT émis avec un version plus ancien deviennent invalides.
ALTER TABLE users ADD COLUMN token_version BIGINT NOT NULL DEFAULT 0;
