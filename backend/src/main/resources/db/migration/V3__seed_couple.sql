-- =========================================================================
-- V3 — Seed du référentiel COUPLE (9 fruits, 1 affirmation chacun)
-- =========================================================================
-- Échelle spécifique 1..4 (gérée par le type COUPLE côté ScoringService).
-- Chaque fruit = une dimension avec UNE seule question (l'affirmation).

INSERT INTO referentiels (id, code, nom, type, verset, actif, top_flop) VALUES (7, 'couple', 'Couple', 'COUPLE', 'Galates 5.22', TRUE, 3);

INSERT INTO dimensions (id, referentiel_id, position, libelle, libelle_court) VALUES (46, 7, 0, 'L''amour', 'amour');
INSERT INTO questions (id, dimension_id, position, texte, polarite) VALUES (960, 46, 0, 'L''amour de Dieu, l''amour sacrificiel qui donne, pardonne et se livre, constitue le fondement du couple.', 'DIRECTE');
INSERT INTO dimensions (id, referentiel_id, position, libelle, libelle_court) VALUES (47, 7, 1, 'La joie', 'joie');
INSERT INTO questions (id, dimension_id, position, texte, polarite) VALUES (961, 47, 0, 'La joie profonde qui vient de Dieu caractérise l''atmosphère de la maison, indépendamment des circonstances.', 'DIRECTE');
INSERT INTO dimensions (id, referentiel_id, position, libelle, libelle_court) VALUES (48, 7, 2, 'La paix', 'paix');
INSERT INTO questions (id, dimension_id, position, texte, polarite) VALUES (962, 48, 0, 'La paix de Dieu règne dans les conversations, les décisions et les interactions quotidiennes du couple.', 'DIRECTE');
INSERT INTO dimensions (id, referentiel_id, position, libelle, libelle_court) VALUES (49, 7, 3, 'La patience', 'patience');
INSERT INTO questions (id, dimension_id, position, texte, polarite) VALUES (963, 49, 0, 'Le couple supporte les faiblesses et les limites de chacun avec patience, sans exploser à la première contrariété.', 'DIRECTE');
INSERT INTO dimensions (id, referentiel_id, position, libelle, libelle_court) VALUES (50, 7, 4, 'La bonté', 'bonté');
INSERT INTO questions (id, dimension_id, position, texte, polarite) VALUES (964, 50, 0, 'Le bien est fait l''un envers l''autre, même lorsque cela demande un effort ou un sacrifice.', 'DIRECTE');
INSERT INTO dimensions (id, referentiel_id, position, libelle, libelle_court) VALUES (51, 7, 5, 'La bienveillance', 'bienveillance');
INSERT INTO questions (id, dimension_id, position, texte, polarite) VALUES (965, 51, 0, 'Les paroles et les attitudes sont empreintes de douceur, d''encouragement et de respect.', 'DIRECTE');
INSERT INTO dimensions (id, referentiel_id, position, libelle, libelle_court) VALUES (52, 7, 6, 'La fidélité', 'fidélité');
INSERT INTO questions (id, dimension_id, position, texte, polarite) VALUES (966, 52, 0, 'Les engagements pris devant Dieu et envers son conjoint sont honorés avec constance.', 'DIRECTE');
INSERT INTO dimensions (id, referentiel_id, position, libelle, libelle_court) VALUES (53, 7, 7, 'La douceur', 'douceur');
INSERT INTO questions (id, dimension_id, position, texte, polarite) VALUES (967, 53, 0, 'Les désaccords sont gérés avec maîtrise, humilité et respect mutuel.', 'DIRECTE');
INSERT INTO dimensions (id, referentiel_id, position, libelle, libelle_court) VALUES (54, 7, 8, 'La maîtrise de soi', 'maîtrise de soi');
INSERT INTO questions (id, dimension_id, position, texte, polarite) VALUES (968, 54, 0, 'Les émotions, réactions et paroles sont contrôlées afin de préserver l''unité du couple.', 'DIRECTE');

-- Réaligner les séquences
SELECT setval('referentiels_id_seq', 7);
SELECT setval('dimensions_id_seq', 54);
SELECT setval('questions_id_seq', 968);