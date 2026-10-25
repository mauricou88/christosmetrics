-- =========================================================================
-- V6 — PDFs de restitution stockés côté serveur
-- =========================================================================
CREATE TABLE restitutions_pdf (
    id                   BIGSERIAL PRIMARY KEY,
    passation_id         BIGINT NOT NULL UNIQUE REFERENCES passations(id) ON DELETE CASCADE,
    nom_fichier          VARCHAR(255) NOT NULL,
    contenu              BYTEA NOT NULL,
    taille_octets        BIGINT NOT NULL,
    hash_sha256          CHAR(64) NOT NULL,
    genere_le            TIMESTAMP NOT NULL DEFAULT now(),
    envoye_par_mail_le   TIMESTAMP
);
CREATE INDEX idx_restitutions_hash ON restitutions_pdf(hash_sha256);
