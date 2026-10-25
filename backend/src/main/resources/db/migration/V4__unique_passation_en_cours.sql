-- Garantit l'invariant métier : une seule passation EN_COURS
-- par utilisateur et référentiel.
--
-- Si une ancienne base contient déjà des doublons, on conserve la passation
-- la plus récente et on clôt les autres avant de créer l'index.
WITH passations_classees AS (
    SELECT id,
           ROW_NUMBER() OVER (
               PARTITION BY user_id, referentiel_id
               ORDER BY debutee_le DESC, id DESC
           ) AS rang
    FROM passations
    WHERE etat = 'EN_COURS'
)
UPDATE passations p
SET etat = 'TERMINEE',
    terminee_le = COALESCE(p.terminee_le, CURRENT_TIMESTAMP)
FROM passations_classees pc
WHERE p.id = pc.id
  AND pc.rang > 1;

CREATE UNIQUE INDEX IF NOT EXISTS uq_passation_en_cours
    ON passations (user_id, referentiel_id)
    WHERE etat = 'EN_COURS';
