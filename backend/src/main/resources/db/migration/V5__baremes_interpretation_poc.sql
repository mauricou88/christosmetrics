-- Barèmes validés dans CHRISTOSMETRICS_V3_1_Couple.html.
CREATE TABLE tranches_interpretation (
    id              BIGSERIAL PRIMARY KEY,
    referentiel_id  BIGINT NOT NULL REFERENCES referentiels(id) ON DELETE CASCADE,
    position        INT NOT NULL,
    min_score       INT NOT NULL,
    max_score       INT NOT NULL,
    texte           TEXT NOT NULL,
    type_icone      VARCHAR(24) NOT NULL,
    nombre_icones   INT NOT NULL DEFAULT 1,
    CONSTRAINT uq_tranche_position UNIQUE (referentiel_id, position),
    CONSTRAINT ck_tranche_seuils CHECK (min_score <= max_score)
);

-- JOIE
INSERT INTO tranches_interpretation (referentiel_id, position, min_score, max_score, texte, type_icone, nombre_icones) VALUES
((SELECT id FROM referentiels WHERE code='joie'),0,0,19,'La Joie apparait très peu dans l’ensemble des attitudes mesurées. Alerte, il est nécessaire d’y remédier sans plus tarder.','TRISTE',1),
((SELECT id FROM referentiels WHERE code='joie'),1,20,39,'Plusieurs signes légers de Joie existent. Ils sont à augmenter significativement.','NEUTRE',1),
((SELECT id FROM referentiels WHERE code='joie'),2,40,59,'Le profil montre une empreinte réelle de Joie au quotidien même si son expression reste inconstante. A travailler.','CONTENT',1),
((SELECT id FROM referentiels WHERE code='joie'),3,60,79,'La Joie semble se manifester de façon évidente dans plusieurs domaines de la vie. A renforcer !','CONTENT',2),
((SELECT id FROM referentiels WHERE code='joie'),4,80,100,'Le profil révèle une manifestation très importante de la joie du Seigneur. Gardez le cap !','CONTENT',3);

-- PAIX
INSERT INTO tranches_interpretation (referentiel_id, position, min_score, max_score, texte, type_icone, nombre_icones) VALUES
((SELECT id FROM referentiels WHERE code='paix'),0,0,19,'La paix apparait très peu dans l’ensemble des attitudes mesurées. Alerte, il est nécessaire d’y remédier sans plus tarder.','TRISTE',1),
((SELECT id FROM referentiels WHERE code='paix'),1,20,39,'Plusieurs signes légers de Paix existent. Ils sont à augmenter significativement.','NEUTRE',1),
((SELECT id FROM referentiels WHERE code='paix'),2,40,59,'Le profil montre une empreinte réelle de Paix au quotidien même si son expression reste inconstante. A travailler.','CONTENT',1),
((SELECT id FROM referentiels WHERE code='paix'),3,60,79,'La Paix semble se manifester de façon évidente dans plusieurs domaines de la vie. A renforcer !','CONTENT',2),
((SELECT id FROM referentiels WHERE code='paix'),4,80,100,'Le profil révèle une manifestation très importante de la paix du Seigneur. Gardez le cap !','CONTENT',3);

-- FIDÉLITÉ
INSERT INTO tranches_interpretation (referentiel_id, position, min_score, max_score, texte, type_icone, nombre_icones) VALUES
((SELECT id FROM referentiels WHERE code='fidelite'),0,0,19,'La Fidélité apparait très peu dans l’ensemble des attitudes mesurées. Alerte, il est nécessaire d’y remédier sans plus tarder.','TRISTE',1),
((SELECT id FROM referentiels WHERE code='fidelite'),1,20,39,'Plusieurs signes légers de Fidélité existent. Ils sont à augmenter significativement.','NEUTRE',1),
((SELECT id FROM referentiels WHERE code='fidelite'),2,40,59,'Le profil montre une empreinte réelle de Fidélité au quotidien même si son expression reste inconstante. A travailler.','CONTENT',1),
((SELECT id FROM referentiels WHERE code='fidelite'),3,60,79,'La Fidélité semble se manifester de façon évidente dans plusieurs domaines de la vie. A renforcer !','CONTENT',2),
((SELECT id FROM referentiels WHERE code='fidelite'),4,80,100,'Le profil révèle une manifestation très importante de la Fidélité du Seigneur. Gardez le cap !','CONTENT',3);

-- BONTÉ & BIENVEILLANCE
INSERT INTO tranches_interpretation (referentiel_id, position, min_score, max_score, texte, type_icone, nombre_icones) VALUES
((SELECT id FROM referentiels WHERE code='bonte'),0,0,19,'La bonté et la bienveillance apparaissent très peu dans l’ensemble des attitudes mesurées. Alerte, il est nécessaire d’y remédier sans plus tarder.','TRISTE',1),
((SELECT id FROM referentiels WHERE code='bonte'),1,20,39,'Plusieurs signes légers de bonté et bienveillance existent. Ils sont à augmenter significativement.','NEUTRE',1),
((SELECT id FROM referentiels WHERE code='bonte'),2,40,59,'Le profil montre une empreinte réelle de bonté et bienveillance au quotidien même si son expression reste inconstante. A travailler.','CONTENT',1),
((SELECT id FROM referentiels WHERE code='bonte'),3,60,79,'La bonté et la bienveillance semblent se manifester de façon évidente dans plusieurs domaines de la vie. A renforcer !','CONTENT',2),
((SELECT id FROM referentiels WHERE code='bonte'),4,80,100,'Le profil révèle une manifestation très importante de la bonté et bienveillance du Seigneur. Gardez le cap !','CONTENT',3);

-- AMOUR
INSERT INTO tranches_interpretation (referentiel_id, position, min_score, max_score, texte, type_icone, nombre_icones) VALUES
((SELECT id FROM referentiels WHERE code='amour'),0,0,19,'L''amour apparait très peu dans l’ensemble des attitudes mesurées. Alerte, il est nécessaire d’y remédier sans plus tarder.','TRISTE',1),
((SELECT id FROM referentiels WHERE code='amour'),1,20,39,'Plusieurs signes légers d''amour existent. Ils sont à augmenter significativement.','NEUTRE',1),
((SELECT id FROM referentiels WHERE code='amour'),2,40,59,'Le profil montre une empreinte réelle de l''amour au quotidien même si son expression reste inconstante. A travailler.','CONTENT',1),
((SELECT id FROM referentiels WHERE code='amour'),3,60,79,'L''amour semble se manifester de façon évidente dans plusieurs domaines de la vie. A renforcer !','CONTENT',2),
((SELECT id FROM referentiels WHERE code='amour'),4,80,100,'Le profil révèle une manifestation très importante de l''amour du Seigneur. Gardez le cap !','CONTENT',3);

-- PATIENCE
INSERT INTO tranches_interpretation (referentiel_id, position, min_score, max_score, texte, type_icone, nombre_icones) VALUES
((SELECT id FROM referentiels WHERE code='patience'),0,0,19,'Le fruit de l’Esprit apparaît encore très peu dans l’ensemble des attitudes mesurées.','TRISTE',1),
((SELECT id FROM referentiels WHERE code='patience'),1,20,39,'Plusieurs dispositions positives existent, mais leur expression reste faible ou inconstante.','NEUTRE',1),
((SELECT id FROM referentiels WHERE code='patience'),2,40,59,'Le profil montre une empreinte réelle, avec une présence modérée du fruit de l’Esprit.','CONTENT',1),
((SELECT id FROM referentiels WHERE code='patience'),3,60,79,'Le fruit de l’Esprit semble se manifester de façon encourageante dans plusieurs domaines de la vie.','CONTENT',2),
((SELECT id FROM referentiels WHERE code='patience'),4,80,100,'Le profil révèle une manifestation forte et cohérente des qualités évaluées, tout en laissant place à une croissance continue.','CONTENT',3);

-- COUPLE : ordre et unité /36 identiques au POC.
INSERT INTO tranches_interpretation (referentiel_id, position, min_score, max_score, texte, type_icone, nombre_icones) VALUES
((SELECT id FROM referentiels WHERE code='couple'),0,32,36,'Le fruit de l''Esprit caractérise fortement la dynamique du couple. Le caractère de Christ est visible dans les interactions.','CONTENT',3),
((SELECT id FROM referentiels WHERE code='couple'),1,25,31,'Le couple possède de bonnes fondations, mais certains domaines ont besoin d''être renforcés.','CONTENT',2),
((SELECT id FROM referentiels WHERE code='couple'),2,18,24,'Plusieurs fragilités apparaissent. Certaines vertus sont présentes, mais pas encore suffisamment enracinées dans le quotidien.','NEUTRE',1),
((SELECT id FROM referentiels WHERE code='couple'),3,9,17,'Plusieurs fondations spirituelles et relationnelles nécessitent une restauration profonde.','TRISTE',1);
