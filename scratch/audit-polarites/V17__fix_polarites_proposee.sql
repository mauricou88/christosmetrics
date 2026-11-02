-- V17__fix_polarites_proposee.sql — PROJET NON APPLIQUE, NON DEPLOYE.
-- Source : Excel POC compares a V2. Validation de Momo requise avant tout transfert vers Flyway.
-- 361 lignes candidates : 166 signaux FORTS et 195 FAIBLES a revoir manuellement.
-- Deux sens necessaires : 339 DIRECTE -> INVERSE et 22 INVERSE -> DIRECTE.
-- Patience exclu : 400 items POC ne correspondent pas aux 200 enonces V2.
-- Les reponses neutres (3) ne votent pas. Aucun identifiant de repondant archive.
-- Les UPDATE sont gardes par polarite initiale et referentiel : ils sont idempotents.
-- Ce script ne recalcule ni resultats existants, ni PDFs, ni historique.

-- =====================================================================
-- FRUIT : joie
-- Excel : C:\Users\mauri\Downloads\CHRISTOS\JOIE\CHRISTOSMETRICS - Fruit de l'Esprit - La Joie (réponses).xlsm
-- SHA-256 : 1802e7e796c9e24b5b1baaa876d22cd342040590a0b5fcccd71c84ec830db006
-- Feuille de points : Score
-- FORT : DIRECTE -> INVERSE, 13 questions.
-- Q31 / id=31 : 51/51 votes concordants (100.00%), neutres=19, invalides=0; colonnes AH -> AI.
-- Q34 / id=34 : 54/54 votes concordants (100.00%), neutres=16, invalides=0; colonnes AK -> AL.
-- Q51 / id=51 : 58/58 votes concordants (100.00%), neutres=12, invalides=0; colonnes BB -> BE.
-- Q54 / id=54 : 58/58 votes concordants (100.00%), neutres=12, invalides=0; colonnes BE -> BH.
-- Q71 / id=71 : 52/52 votes concordants (100.00%), neutres=18, invalides=0; colonnes BV -> CA.
-- Q76 / id=76 : 56/56 votes concordants (100.00%), neutres=14, invalides=0; colonnes CA -> CF.
-- Q77 / id=77 : 52/52 votes concordants (100.00%), neutres=18, invalides=0; colonnes CB -> CG.
-- Q79 / id=79 : 54/54 votes concordants (100.00%), neutres=16, invalides=0; colonnes CD -> CI.
-- Q92 / id=92 : 61/61 votes concordants (100.00%), neutres=9, invalides=0; colonnes CQ -> CX.
-- Q93 / id=93 : 57/57 votes concordants (100.00%), neutres=13, invalides=0; colonnes CR -> CY.
-- Q95 / id=95 : 62/62 votes concordants (100.00%), neutres=8, invalides=0; colonnes CT -> DA.
-- Q96 / id=96 : 58/58 votes concordants (100.00%), neutres=12, invalides=0; colonnes CU -> DB.
-- Q100 / id=100 : 60/60 votes concordants (100.00%), neutres=10, invalides=0; colonnes CY -> DF.
UPDATE questions SET polarite = 'INVERSE'
WHERE id IN (31, 34, 51, 54, 71, 76, 77, 79, 92, 93, 95, 96, 100)
  AND polarite = 'DIRECTE'
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'joie');

-- FAIBLE : DIRECTE -> INVERSE, 32 questions.
-- REVUE MANUELLE REQUISE : effectif concordant <=50. Ce bloc reste une proposition.
-- Q11 / id=11 : 49/49 votes concordants (100.00%), neutres=21, invalides=0; colonnes N -> M.
-- Q12 / id=12 : 40/40 votes concordants (100.00%), neutres=30, invalides=0; colonnes O -> N.
-- Q13 / id=13 : 37/37 votes concordants (100.00%), neutres=33, invalides=0; colonnes P -> O.
-- Q14 / id=14 : 48/48 votes concordants (100.00%), neutres=22, invalides=0; colonnes Q -> P.
-- Q15 / id=15 : 46/46 votes concordants (100.00%), neutres=24, invalides=0; colonnes R -> Q.
-- Q16 / id=16 : 43/43 votes concordants (100.00%), neutres=27, invalides=0; colonnes S -> R.
-- Q17 / id=17 : 45/45 votes concordants (100.00%), neutres=25, invalides=0; colonnes T -> S.
-- Q18 / id=18 : 48/48 votes concordants (100.00%), neutres=22, invalides=0; colonnes U -> T.
-- Q19 / id=19 : 47/47 votes concordants (100.00%), neutres=23, invalides=0; colonnes V -> U.
-- Q20 / id=20 : 42/42 votes concordants (100.00%), neutres=28, invalides=0; colonnes W -> V.
-- Q32 / id=32 : 43/43 votes concordants (100.00%), neutres=27, invalides=0; colonnes AI -> AJ.
-- Q33 / id=33 : 48/48 votes concordants (100.00%), neutres=22, invalides=0; colonnes AJ -> AK.
-- Q35 / id=35 : 49/49 votes concordants (100.00%), neutres=21, invalides=0; colonnes AL -> AM.
-- Q37 / id=37 : 48/48 votes concordants (100.00%), neutres=22, invalides=0; colonnes AN -> AO.
-- Q38 / id=38 : 47/47 votes concordants (100.00%), neutres=23, invalides=0; colonnes AO -> AP.
-- Q39 / id=39 : 46/46 votes concordants (100.00%), neutres=24, invalides=0; colonnes AP -> AQ.
-- Q40 / id=40 : 44/44 votes concordants (100.00%), neutres=26, invalides=0; colonnes AQ -> AR.
-- Q52 / id=52 : 49/49 votes concordants (100.00%), neutres=21, invalides=0; colonnes BC -> BF.
-- Q53 / id=53 : 44/44 votes concordants (100.00%), neutres=26, invalides=0; colonnes BD -> BG.
-- Q55 / id=55 : 49/49 votes concordants (100.00%), neutres=21, invalides=0; colonnes BF -> BI.
-- Q56 / id=56 : 37/37 votes concordants (100.00%), neutres=33, invalides=0; colonnes BG -> BJ.
-- Q57 / id=57 : 42/42 votes concordants (100.00%), neutres=28, invalides=0; colonnes BH -> BK.
-- Q58 / id=58 : 50/50 votes concordants (100.00%), neutres=20, invalides=0; colonnes BI -> BL.
-- Q59 / id=59 : 43/43 votes concordants (100.00%), neutres=27, invalides=0; colonnes BJ -> BM.
-- Q60 / id=60 : 44/44 votes concordants (100.00%), neutres=26, invalides=0; colonnes BK -> BN.
-- Q72 / id=72 : 50/50 votes concordants (100.00%), neutres=20, invalides=0; colonnes BW -> CB.
-- Q74 / id=74 : 49/49 votes concordants (100.00%), neutres=21, invalides=0; colonnes BY -> CD.
-- Q75 / id=75 : 47/47 votes concordants (100.00%), neutres=23, invalides=0; colonnes BZ -> CE.
-- Q78 / id=78 : 50/50 votes concordants (100.00%), neutres=20, invalides=0; colonnes CC -> CH.
-- Q80 / id=80 : 49/49 votes concordants (100.00%), neutres=21, invalides=0; colonnes CE -> CJ.
-- Q97 / id=97 : 46/46 votes concordants (100.00%), neutres=24, invalides=0; colonnes CV -> DC.
-- Q99 / id=99 : 39/39 votes concordants (100.00%), neutres=31, invalides=0; colonnes CX -> DE.
UPDATE questions SET polarite = 'INVERSE'
WHERE id IN (11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 32, 33, 35, 37, 38, 39, 40, 52, 53, 55, 56, 57, 58, 59, 60, 72, 74, 75, 78, 80, 97, 99)
  AND polarite = 'DIRECTE'
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'joie');

-- =====================================================================
-- FRUIT : patience
-- Excel : C:\Users\mauri\Downloads\CHRISTOS\Patience\CHRISTOSMETRICS - Fruit de l'Esprit - La Patience (réponses).xlsx
-- SHA-256 : c14f12a6badbc0e7e599438d6632fa99f318149c52932cb1936b22549a0d9fb8
-- Feuille de points : Feuil2
-- AUCUN UPDATE : correspondance avec V2 non etablie.

-- =====================================================================
-- FRUIT : bonte
-- Excel : C:\Users\mauri\Downloads\CHRISTOS\Bonté et Bienveillance\CHRISTOSMETRICS - Fruit de l'Esprit - Bonté et Bienveillance (réponses).xlsx
-- SHA-256 : c8f554cc96626f65f696109187697f3b089ed31d47a37657314612d90e7fdd2a
-- Feuille de points : scoring
-- FORT : DIRECTE -> INVERSE, 34 questions.
-- Q26 / id=405 : 53/53 votes concordants (100.00%), neutres=18, invalides=0; colonnes AC -> AB.
-- Q27 / id=406 : 62/62 votes concordants (100.00%), neutres=9, invalides=0; colonnes AD -> AC.
-- Q31 / id=410 : 57/57 votes concordants (100.00%), neutres=14, invalides=0; colonnes AH -> AG.
-- Q33 / id=412 : 58/58 votes concordants (100.00%), neutres=13, invalides=0; colonnes AJ -> AI.
-- Q34 / id=413 : 51/51 votes concordants (100.00%), neutres=20, invalides=0; colonnes AK -> AJ.
-- Q36 / id=415 : 62/62 votes concordants (100.00%), neutres=9, invalides=0; colonnes AM -> AL.
-- Q37 / id=416 : 61/61 votes concordants (100.00%), neutres=10, invalides=0; colonnes AN -> AM.
-- Q38 / id=417 : 56/56 votes concordants (100.00%), neutres=15, invalides=0; colonnes AO -> AN.
-- Q41 / id=420 : 62/62 votes concordants (100.00%), neutres=9, invalides=0; colonnes AR -> AQ.
-- Q42 / id=421 : 54/54 votes concordants (100.00%), neutres=17, invalides=0; colonnes AS -> AR.
-- Q43 / id=422 : 55/55 votes concordants (100.00%), neutres=16, invalides=0; colonnes AT -> AS.
-- Q44 / id=423 : 60/60 votes concordants (100.00%), neutres=11, invalides=0; colonnes AU -> AT.
-- Q45 / id=424 : 52/52 votes concordants (100.00%), neutres=19, invalides=0; colonnes AV -> AU.
-- Q47 / id=426 : 67/67 votes concordants (100.00%), neutres=4, invalides=0; colonnes AX -> AW.
-- Q49 / id=428 : 56/56 votes concordants (100.00%), neutres=15, invalides=0; colonnes AZ -> AY.
-- Q50 / id=429 : 58/58 votes concordants (100.00%), neutres=13, invalides=0; colonnes BA -> AZ.
-- Q76 / id=455 : 51/51 votes concordants (100.00%), neutres=20, invalides=0; colonnes CA -> CB.
-- Q77 / id=456 : 61/61 votes concordants (100.00%), neutres=9, invalides=1; colonnes CB -> CC.
-- Q78 / id=457 : 52/52 votes concordants (100.00%), neutres=19, invalides=0; colonnes CC -> CD.
-- Q80 / id=459 : 57/57 votes concordants (100.00%), neutres=14, invalides=0; colonnes CE -> CF.
-- Q81 / id=460 : 59/59 votes concordants (100.00%), neutres=12, invalides=0; colonnes CF -> CG.
-- Q82 / id=461 : 60/60 votes concordants (100.00%), neutres=11, invalides=0; colonnes CG -> CH.
-- Q84 / id=463 : 57/57 votes concordants (100.00%), neutres=14, invalides=0; colonnes CI -> CJ.
-- Q85 / id=464 : 64/64 votes concordants (100.00%), neutres=7, invalides=0; colonnes CJ -> CK.
-- Q88 / id=467 : 53/53 votes concordants (100.00%), neutres=18, invalides=0; colonnes CM -> CN.
-- Q90 / id=469 : 61/61 votes concordants (100.00%), neutres=10, invalides=0; colonnes CO -> CP.
-- Q92 / id=471 : 53/53 votes concordants (100.00%), neutres=18, invalides=0; colonnes CQ -> CR.
-- Q93 / id=472 : 53/53 votes concordants (100.00%), neutres=18, invalides=0; colonnes CR -> CS.
-- Q94 / id=473 : 57/57 votes concordants (100.00%), neutres=14, invalides=0; colonnes CS -> CT.
-- Q96 / id=475 : 54/54 votes concordants (100.00%), neutres=17, invalides=0; colonnes CU -> CV.
-- Q97 / id=476 : 58/58 votes concordants (100.00%), neutres=13, invalides=0; colonnes CV -> CW.
-- Q98 / id=477 : 58/58 votes concordants (100.00%), neutres=13, invalides=0; colonnes CW -> CX.
-- Q99 / id=478 : 61/61 votes concordants (100.00%), neutres=10, invalides=0; colonnes CX -> CY.
-- Q100 / id=479 : 61/61 votes concordants (100.00%), neutres=10, invalides=0; colonnes CY -> CZ.
UPDATE questions SET polarite = 'INVERSE'
WHERE id IN (405, 406, 410, 412, 413, 415, 416, 417, 420, 421, 422, 423, 424, 426, 428, 429, 455, 456, 457, 459, 460, 461, 463, 464, 467, 469, 471, 472, 473, 475, 476, 477, 478, 479)
  AND polarite = 'DIRECTE'
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

-- FORT : INVERSE -> DIRECTE, 1 questions.
-- Q13 / id=392 : 54/54 votes concordants (100.00%), neutres=17, invalides=0; colonnes P -> O.
UPDATE questions SET polarite = 'DIRECTE'
WHERE id IN (392)
  AND polarite = 'INVERSE'
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

-- FAIBLE : DIRECTE -> INVERSE, 8 questions.
-- REVUE MANUELLE REQUISE : effectif concordant <=50. Ce bloc reste une proposition.
-- Q28 / id=407 : 50/50 votes concordants (100.00%), neutres=21, invalides=0; colonnes AE -> AD.
-- Q46 / id=425 : 49/49 votes concordants (100.00%), neutres=22, invalides=0; colonnes AW -> AV.
-- Q79 / id=458 : 46/46 votes concordants (100.00%), neutres=25, invalides=0; colonnes CD -> CE.
-- Q86 / id=465 : 50/50 votes concordants (100.00%), neutres=21, invalides=0; colonnes CK -> CL.
-- Q87 / id=466 : 45/45 votes concordants (100.00%), neutres=26, invalides=0; colonnes CL -> CM.
-- Q89 / id=468 : 50/50 votes concordants (100.00%), neutres=21, invalides=0; colonnes CN -> CO.
-- Q91 / id=470 : 48/48 votes concordants (100.00%), neutres=23, invalides=0; colonnes CP -> CQ.
-- Q95 / id=474 : 50/50 votes concordants (100.00%), neutres=21, invalides=0; colonnes CT -> CU.
UPDATE questions SET polarite = 'INVERSE'
WHERE id IN (407, 425, 458, 465, 466, 468, 470, 474)
  AND polarite = 'DIRECTE'
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

-- FAIBLE : INVERSE -> DIRECTE, 3 questions.
-- REVUE MANUELLE REQUISE : effectif concordant <=50. Ce bloc reste une proposition.
-- Q10 / id=389 : 46/46 votes concordants (100.00%), neutres=25, invalides=0; colonnes M -> L.
-- Q19 / id=398 : 42/42 votes concordants (100.00%), neutres=29, invalides=0; colonnes V -> U.
-- Q23 / id=402 : 42/42 votes concordants (100.00%), neutres=29, invalides=0; colonnes Z -> Y.
UPDATE questions SET polarite = 'DIRECTE'
WHERE id IN (389, 398, 402)
  AND polarite = 'INVERSE'
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

-- =====================================================================
-- FRUIT : fidelite
-- Excel : C:\Users\mauri\Downloads\CHRISTOS\Fidèlité\CHRISTOSMETRICS - Fruit de l'Esprit - La Fidélité (réponses).xlsm
-- SHA-256 : 93479190a2fd4b0bd6d67ec09398f326bbcfbbafd9c4e8cc3ee4e169cda7daf1
-- Feuille de points : Transform
-- FORT : DIRECTE -> INVERSE, 56 questions.
-- Q11 / id=270 : 71/71 votes concordants (100.00%), neutres=36, invalides=0; colonnes N -> M.
-- Q12 / id=271 : 79/79 votes concordants (100.00%), neutres=28, invalides=0; colonnes O -> N.
-- Q14 / id=273 : 82/82 votes concordants (100.00%), neutres=25, invalides=0; colonnes Q -> P.
-- Q15 / id=274 : 74/74 votes concordants (100.00%), neutres=33, invalides=0; colonnes R -> Q.
-- Q16 / id=275 : 88/88 votes concordants (100.00%), neutres=19, invalides=0; colonnes S -> R.
-- Q17 / id=276 : 79/79 votes concordants (100.00%), neutres=28, invalides=0; colonnes T -> S.
-- Q18 / id=277 : 85/85 votes concordants (100.00%), neutres=22, invalides=0; colonnes U -> T.
-- Q19 / id=278 : 88/88 votes concordants (100.00%), neutres=19, invalides=0; colonnes V -> U.
-- Q20 / id=279 : 82/82 votes concordants (100.00%), neutres=25, invalides=0; colonnes W -> V.
-- Q31 / id=290 : 73/73 votes concordants (100.00%), neutres=34, invalides=0; colonnes AH -> AI.
-- Q33 / id=292 : 76/76 votes concordants (100.00%), neutres=31, invalides=0; colonnes AJ -> AK.
-- Q34 / id=293 : 74/74 votes concordants (100.00%), neutres=33, invalides=0; colonnes AK -> AL.
-- Q35 / id=294 : 80/80 votes concordants (100.00%), neutres=27, invalides=0; colonnes AL -> AM.
-- Q36 / id=295 : 69/69 votes concordants (100.00%), neutres=38, invalides=0; colonnes AM -> AN.
-- Q37 / id=296 : 75/75 votes concordants (100.00%), neutres=32, invalides=0; colonnes AN -> AO.
-- Q38 / id=297 : 77/77 votes concordants (100.00%), neutres=30, invalides=0; colonnes AO -> AP.
-- Q39 / id=298 : 78/78 votes concordants (100.00%), neutres=29, invalides=0; colonnes AP -> AQ.
-- Q40 / id=299 : 76/76 votes concordants (100.00%), neutres=31, invalides=0; colonnes AQ -> AR.
-- Q51 / id=310 : 83/83 votes concordants (100.00%), neutres=24, invalides=0; colonnes BB -> BE.
-- Q52 / id=311 : 81/81 votes concordants (100.00%), neutres=26, invalides=0; colonnes BC -> BF.
-- Q53 / id=312 : 78/78 votes concordants (100.00%), neutres=29, invalides=0; colonnes BD -> BG.
-- Q54 / id=313 : 71/71 votes concordants (100.00%), neutres=36, invalides=0; colonnes BE -> BH.
-- Q55 / id=314 : 68/68 votes concordants (100.00%), neutres=39, invalides=0; colonnes BF -> BI.
-- Q56 / id=315 : 80/80 votes concordants (100.00%), neutres=27, invalides=0; colonnes BG -> BJ.
-- Q57 / id=316 : 65/65 votes concordants (100.00%), neutres=42, invalides=0; colonnes BH -> BK.
-- Q58 / id=317 : 88/88 votes concordants (100.00%), neutres=19, invalides=0; colonnes BI -> BL.
-- Q59 / id=318 : 71/71 votes concordants (100.00%), neutres=36, invalides=0; colonnes BJ -> BM.
-- Q60 / id=319 : 69/69 votes concordants (100.00%), neutres=38, invalides=0; colonnes BK -> BN.
-- Q71 / id=330 : 72/72 votes concordants (100.00%), neutres=35, invalides=0; colonnes BV -> CA.
-- Q72 / id=331 : 102/102 votes concordants (100.00%), neutres=5, invalides=0; colonnes BW -> CB.
-- Q73 / id=332 : 88/88 votes concordants (100.00%), neutres=19, invalides=0; colonnes BX -> CC.
-- Q74 / id=333 : 90/90 votes concordants (100.00%), neutres=17, invalides=0; colonnes BY -> CD.
-- Q75 / id=334 : 93/93 votes concordants (100.00%), neutres=14, invalides=0; colonnes BZ -> CE.
-- Q76 / id=335 : 89/89 votes concordants (100.00%), neutres=18, invalides=0; colonnes CA -> CF.
-- Q77 / id=336 : 79/79 votes concordants (100.00%), neutres=28, invalides=0; colonnes CB -> CG.
-- Q78 / id=337 : 93/93 votes concordants (100.00%), neutres=14, invalides=0; colonnes CC -> CH.
-- Q80 / id=339 : 89/89 votes concordants (100.00%), neutres=18, invalides=0; colonnes CE -> CJ.
-- Q92 / id=351 : 65/65 votes concordants (100.00%), neutres=42, invalides=0; colonnes CQ -> CX.
-- Q93 / id=352 : 75/75 votes concordants (100.00%), neutres=32, invalides=0; colonnes CR -> CY.
-- Q94 / id=353 : 59/59 votes concordants (100.00%), neutres=48, invalides=0; colonnes CS -> CZ.
-- Q95 / id=354 : 61/61 votes concordants (100.00%), neutres=46, invalides=0; colonnes CT -> DA.
-- Q96 / id=355 : 70/70 votes concordants (100.00%), neutres=37, invalides=0; colonnes CU -> DB.
-- Q97 / id=356 : 65/65 votes concordants (100.00%), neutres=42, invalides=0; colonnes CV -> DC.
-- Q98 / id=357 : 71/71 votes concordants (100.00%), neutres=36, invalides=0; colonnes CW -> DD.
-- Q99 / id=358 : 70/70 votes concordants (100.00%), neutres=37, invalides=0; colonnes CX -> DE.
-- Q100 / id=359 : 61/61 votes concordants (100.00%), neutres=46, invalides=0; colonnes CY -> DF.
-- Q111 / id=370 : 77/77 votes concordants (100.00%), neutres=30, invalides=0; colonnes DJ -> DS.
-- Q112 / id=371 : 80/80 votes concordants (100.00%), neutres=27, invalides=0; colonnes DK -> DT.
-- Q113 / id=372 : 68/68 votes concordants (100.00%), neutres=39, invalides=0; colonnes DL -> DU.
-- Q114 / id=373 : 70/70 votes concordants (100.00%), neutres=37, invalides=0; colonnes DM -> DV.
-- Q115 / id=374 : 69/69 votes concordants (100.00%), neutres=38, invalides=0; colonnes DN -> DW.
-- Q116 / id=375 : 68/68 votes concordants (100.00%), neutres=39, invalides=0; colonnes DO -> DX.
-- Q117 / id=376 : 71/71 votes concordants (100.00%), neutres=36, invalides=0; colonnes DP -> DY.
-- Q118 / id=377 : 67/67 votes concordants (100.00%), neutres=40, invalides=0; colonnes DQ -> DZ.
-- Q119 / id=378 : 83/83 votes concordants (100.00%), neutres=24, invalides=0; colonnes DR -> EA.
-- Q120 / id=379 : 71/71 votes concordants (100.00%), neutres=36, invalides=0; colonnes DS -> EB.
UPDATE questions SET polarite = 'INVERSE'
WHERE id IN (270, 271, 273, 274, 275, 276, 277, 278, 279, 290, 292, 293, 294, 295, 296, 297, 298, 299, 310, 311, 312, 313, 314, 315, 316, 317, 318, 319, 330, 331, 332, 333, 334, 335, 336, 337, 339, 351, 352, 353, 354, 355, 356, 357, 358, 359, 370, 371, 372, 373, 374, 375, 376, 377, 378, 379)
  AND polarite = 'DIRECTE'
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

-- =====================================================================
-- FRUIT : paix
-- Excel : C:\Users\mauri\Downloads\CHRISTOS\Paix\CHRISTOSMETRICS - Fruit de l'Esprit - La Paix (réponses).xlsm
-- SHA-256 : d8ac59c3e8c90a658d5e99bf608c6118352688223f35e4097fe28f2c6a1fd584
-- Feuille de points : Scoring
-- FORT : DIRECTE -> INVERSE, 56 questions.
-- Q11 / id=111 : 51/51 votes concordants (100.00%), neutres=24, invalides=0; colonnes N -> M.
-- Q14 / id=114 : 55/55 votes concordants (100.00%), neutres=20, invalides=0; colonnes Q -> P.
-- Q16 / id=116 : 59/59 votes concordants (100.00%), neutres=16, invalides=0; colonnes S -> R.
-- Q17 / id=117 : 53/53 votes concordants (100.00%), neutres=22, invalides=0; colonnes T -> S.
-- Q18 / id=118 : 52/52 votes concordants (100.00%), neutres=23, invalides=0; colonnes U -> T.
-- Q19 / id=119 : 52/52 votes concordants (100.00%), neutres=23, invalides=0; colonnes V -> U.
-- Q20 / id=120 : 54/54 votes concordants (100.00%), neutres=21, invalides=0; colonnes W -> V.
-- Q31 / id=131 : 55/55 votes concordants (100.00%), neutres=20, invalides=0; colonnes AH -> AI.
-- Q36 / id=136 : 58/58 votes concordants (100.00%), neutres=17, invalides=0; colonnes AM -> AN.
-- Q37 / id=137 : 56/56 votes concordants (100.00%), neutres=19, invalides=0; colonnes AN -> AO.
-- Q38 / id=138 : 53/53 votes concordants (100.00%), neutres=22, invalides=0; colonnes AO -> AP.
-- Q39 / id=139 : 55/55 votes concordants (100.00%), neutres=20, invalides=0; colonnes AP -> AQ.
-- Q51 / id=151 : 55/55 votes concordants (100.00%), neutres=20, invalides=0; colonnes BB -> BE.
-- Q52 / id=152 : 55/55 votes concordants (100.00%), neutres=20, invalides=0; colonnes BC -> BF.
-- Q53 / id=153 : 54/54 votes concordants (100.00%), neutres=21, invalides=0; colonnes BD -> BG.
-- Q55 / id=155 : 54/54 votes concordants (100.00%), neutres=21, invalides=0; colonnes BF -> BI.
-- Q57 / id=157 : 53/53 votes concordants (100.00%), neutres=22, invalides=0; colonnes BH -> BK.
-- Q58 / id=158 : 52/52 votes concordants (100.00%), neutres=23, invalides=0; colonnes BI -> BL.
-- Q60 / id=160 : 51/51 votes concordants (100.00%), neutres=24, invalides=0; colonnes BK -> BN.
-- Q71 / id=171 : 53/53 votes concordants (100.00%), neutres=22, invalides=0; colonnes BV -> CA.
-- Q74 / id=174 : 53/53 votes concordants (100.00%), neutres=22, invalides=0; colonnes BY -> CD.
-- Q75 / id=175 : 52/52 votes concordants (100.00%), neutres=23, invalides=0; colonnes BZ -> CE.
-- Q76 / id=176 : 55/55 votes concordants (100.00%), neutres=20, invalides=0; colonnes CA -> CF.
-- Q78 / id=178 : 52/52 votes concordants (100.00%), neutres=23, invalides=0; colonnes CC -> CH.
-- Q79 / id=179 : 58/58 votes concordants (100.00%), neutres=17, invalides=0; colonnes CD -> CI.
-- Q91 / id=191 : 54/54 votes concordants (100.00%), neutres=21, invalides=0; colonnes CP -> CW.
-- Q92 / id=192 : 57/57 votes concordants (100.00%), neutres=18, invalides=0; colonnes CQ -> CX.
-- Q93 / id=193 : 52/52 votes concordants (100.00%), neutres=23, invalides=0; colonnes CR -> CY.
-- Q94 / id=194 : 52/52 votes concordants (100.00%), neutres=23, invalides=0; colonnes CS -> CZ.
-- Q96 / id=196 : 52/52 votes concordants (100.00%), neutres=23, invalides=0; colonnes CU -> DB.
-- Q97 / id=197 : 58/58 votes concordants (100.00%), neutres=17, invalides=0; colonnes CV -> DC.
-- Q99 / id=199 : 56/56 votes concordants (100.00%), neutres=19, invalides=0; colonnes CX -> DE.
-- Q110 / id=210 : 56/56 votes concordants (100.00%), neutres=19, invalides=0; colonnes DI -> DR.
-- Q111 / id=211 : 54/54 votes concordants (100.00%), neutres=21, invalides=0; colonnes DJ -> DS.
-- Q113 / id=213 : 53/53 votes concordants (100.00%), neutres=22, invalides=0; colonnes DL -> DU.
-- Q114 / id=214 : 52/52 votes concordants (100.00%), neutres=23, invalides=0; colonnes DM -> DV.
-- Q115 / id=215 : 53/53 votes concordants (100.00%), neutres=22, invalides=0; colonnes DN -> DW.
-- Q116 / id=216 : 53/53 votes concordants (100.00%), neutres=22, invalides=0; colonnes DO -> DX.
-- Q117 / id=217 : 53/53 votes concordants (100.00%), neutres=22, invalides=0; colonnes DP -> DY.
-- Q118 / id=218 : 52/52 votes concordants (100.00%), neutres=23, invalides=0; colonnes DQ -> DZ.
-- Q130 / id=230 : 55/55 votes concordants (100.00%), neutres=20, invalides=0; colonnes EC -> EN.
-- Q131 / id=231 : 59/59 votes concordants (100.00%), neutres=16, invalides=0; colonnes ED -> EO.
-- Q132 / id=232 : 54/54 votes concordants (100.00%), neutres=21, invalides=0; colonnes EE -> EP.
-- Q133 / id=233 : 57/57 votes concordants (100.00%), neutres=18, invalides=0; colonnes EF -> EQ.
-- Q135 / id=235 : 55/55 votes concordants (100.00%), neutres=20, invalides=0; colonnes EH -> ES.
-- Q136 / id=236 : 53/53 votes concordants (100.00%), neutres=22, invalides=0; colonnes EI -> ET.
-- Q137 / id=237 : 55/55 votes concordants (100.00%), neutres=20, invalides=0; colonnes EJ -> EU.
-- Q138 / id=238 : 53/53 votes concordants (100.00%), neutres=22, invalides=0; colonnes EK -> EV.
-- Q139 / id=239 : 53/53 votes concordants (100.00%), neutres=22, invalides=0; colonnes EL -> EW.
-- Q150 / id=250 : 51/51 votes concordants (100.00%), neutres=24, invalides=0; colonnes EW -> FJ.
-- Q151 / id=251 : 51/51 votes concordants (100.00%), neutres=24, invalides=0; colonnes EX -> FK.
-- Q152 / id=252 : 52/52 votes concordants (100.00%), neutres=23, invalides=0; colonnes EY -> FL.
-- Q154 / id=254 : 56/56 votes concordants (100.00%), neutres=19, invalides=0; colonnes FA -> FN.
-- Q155 / id=255 : 53/53 votes concordants (100.00%), neutres=22, invalides=0; colonnes FB -> FO.
-- Q156 / id=256 : 54/54 votes concordants (100.00%), neutres=21, invalides=0; colonnes FC -> FP.
-- Q159 / id=259 : 51/51 votes concordants (100.00%), neutres=24, invalides=0; colonnes FF -> FS.
UPDATE questions SET polarite = 'INVERSE'
WHERE id IN (111, 114, 116, 117, 118, 119, 120, 131, 136, 137, 138, 139, 151, 152, 153, 155, 157, 158, 160, 171, 174, 175, 176, 178, 179, 191, 192, 193, 194, 196, 197, 199, 210, 211, 213, 214, 215, 216, 217, 218, 230, 231, 232, 233, 235, 236, 237, 238, 239, 250, 251, 252, 254, 255, 256, 259)
  AND polarite = 'DIRECTE'
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

-- FORT : INVERSE -> DIRECTE, 6 questions.
-- Q5 / id=105 : 52/52 votes concordants (100.00%), neutres=23, invalides=0; colonnes H -> G.
-- Q66 / id=166 : 57/57 votes concordants (100.00%), neutres=18, invalides=0; colonnes BQ -> BV.
-- Q89 / id=189 : 57/57 votes concordants (100.00%), neutres=18, invalides=0; colonnes CN -> CU.
-- Q106 / id=206 : 58/58 votes concordants (100.00%), neutres=17, invalides=0; colonnes DE -> DN.
-- Q127 / id=227 : 62/62 votes concordants (100.00%), neutres=13, invalides=0; colonnes DZ -> EK.
-- Q145 / id=245 : 62/62 votes concordants (100.00%), neutres=13, invalides=0; colonnes ER -> FE.
UPDATE questions SET polarite = 'DIRECTE'
WHERE id IN (105, 166, 189, 206, 227, 245)
  AND polarite = 'INVERSE'
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

-- FAIBLE : DIRECTE -> INVERSE, 22 questions.
-- REVUE MANUELLE REQUISE : effectif concordant <=50. Ce bloc reste une proposition.
-- Q12 / id=112 : 49/49 votes concordants (100.00%), neutres=26, invalides=0; colonnes O -> N.
-- Q13 / id=113 : 49/49 votes concordants (100.00%), neutres=26, invalides=0; colonnes P -> O.
-- Q15 / id=115 : 47/47 votes concordants (100.00%), neutres=28, invalides=0; colonnes R -> Q.
-- Q32 / id=132 : 50/50 votes concordants (100.00%), neutres=25, invalides=0; colonnes AI -> AJ.
-- Q33 / id=133 : 50/50 votes concordants (100.00%), neutres=25, invalides=0; colonnes AJ -> AK.
-- Q34 / id=134 : 49/49 votes concordants (100.00%), neutres=26, invalides=0; colonnes AK -> AL.
-- Q35 / id=135 : 50/50 votes concordants (100.00%), neutres=25, invalides=0; colonnes AL -> AM.
-- Q40 / id=140 : 43/43 votes concordants (100.00%), neutres=32, invalides=0; colonnes AQ -> AR.
-- Q54 / id=154 : 50/50 votes concordants (100.00%), neutres=25, invalides=0; colonnes BE -> BH.
-- Q56 / id=156 : 48/48 votes concordants (100.00%), neutres=27, invalides=0; colonnes BG -> BJ.
-- Q59 / id=159 : 47/47 votes concordants (100.00%), neutres=28, invalides=0; colonnes BJ -> BM.
-- Q72 / id=172 : 47/47 votes concordants (100.00%), neutres=28, invalides=0; colonnes BW -> CB.
-- Q73 / id=173 : 50/50 votes concordants (100.00%), neutres=25, invalides=0; colonnes BX -> CC.
-- Q77 / id=177 : 49/49 votes concordants (100.00%), neutres=26, invalides=0; colonnes CB -> CG.
-- Q80 / id=180 : 46/46 votes concordants (100.00%), neutres=29, invalides=0; colonnes CE -> CJ.
-- Q95 / id=195 : 50/50 votes concordants (100.00%), neutres=25, invalides=0; colonnes CT -> DA.
-- Q98 / id=198 : 50/50 votes concordants (100.00%), neutres=25, invalides=0; colonnes CW -> DD.
-- Q112 / id=212 : 50/50 votes concordants (100.00%), neutres=25, invalides=0; colonnes DK -> DT.
-- Q119 / id=219 : 49/49 votes concordants (100.00%), neutres=26, invalides=0; colonnes DR -> EA.
-- Q153 / id=253 : 49/49 votes concordants (100.00%), neutres=26, invalides=0; colonnes EZ -> FM.
-- Q157 / id=257 : 47/47 votes concordants (100.00%), neutres=28, invalides=0; colonnes FD -> FQ.
-- Q158 / id=258 : 44/44 votes concordants (100.00%), neutres=31, invalides=0; colonnes FE -> FR.
UPDATE questions SET polarite = 'INVERSE'
WHERE id IN (112, 113, 115, 132, 133, 134, 135, 140, 154, 156, 159, 172, 173, 177, 180, 195, 198, 212, 219, 253, 257, 258)
  AND polarite = 'DIRECTE'
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

-- FAIBLE : INVERSE -> DIRECTE, 3 questions.
-- REVUE MANUELLE REQUISE : effectif concordant <=50. Ce bloc reste une proposition.
-- Q2 / id=102 : 50/50 votes concordants (100.00%), neutres=25, invalides=0; colonnes E -> D.
-- Q103 / id=203 : 39/39 votes concordants (100.00%), neutres=36, invalides=0; colonnes DB -> DK.
-- Q124 / id=224 : 46/46 votes concordants (100.00%), neutres=29, invalides=0; colonnes DW -> EH.
UPDATE questions SET polarite = 'DIRECTE'
WHERE id IN (102, 203, 224)
  AND polarite = 'INVERSE'
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

-- =====================================================================
-- FRUIT : amour
-- Excel : C:\Users\mauri\Downloads\CHRISTOS\AMOUR\Amour de Dieu\CHRISTOSMETRICS - Fruit de l'Esprit - L'amour Caen1.xlsx
-- SHA-256 : 3eb7afa399bf0a2d5fcea80d2d5cd2b0fabbd5eb25bb8b8d0444fefec86849ab
-- Feuille de points : Feuil1
-- FAIBLE : DIRECTE -> INVERSE, 118 questions.
-- REVUE MANUELLE REQUISE : effectif concordant <=50. Ce bloc reste une proposition.
-- Q11 / id=490 : 6/6 votes concordants (100.00%), neutres=8, invalides=0; colonnes N -> M.
-- Q13 / id=492 : 9/9 votes concordants (100.00%), neutres=5, invalides=0; colonnes P -> O.
-- Q14 / id=493 : 9/9 votes concordants (100.00%), neutres=5, invalides=0; colonnes Q -> P.
-- Q15 / id=494 : 8/8 votes concordants (100.00%), neutres=6, invalides=0; colonnes R -> Q.
-- Q17 / id=496 : 7/7 votes concordants (100.00%), neutres=7, invalides=0; colonnes T -> S.
-- Q18 / id=497 : 10/10 votes concordants (100.00%), neutres=4, invalides=0; colonnes U -> T.
-- Q32 / id=511 : 9/9 votes concordants (100.00%), neutres=5, invalides=0; colonnes AI -> AJ.
-- Q33 / id=512 : 5/5 votes concordants (100.00%), neutres=9, invalides=0; colonnes AJ -> AK.
-- Q34 / id=513 : 9/9 votes concordants (100.00%), neutres=5, invalides=0; colonnes AK -> AL.
-- Q35 / id=514 : 8/8 votes concordants (100.00%), neutres=6, invalides=0; colonnes AL -> AM.
-- Q36 / id=515 : 9/9 votes concordants (100.00%), neutres=5, invalides=0; colonnes AM -> AN.
-- Q37 / id=516 : 11/11 votes concordants (100.00%), neutres=3, invalides=0; colonnes AN -> AO.
-- Q39 / id=518 : 12/12 votes concordants (100.00%), neutres=2, invalides=0; colonnes AP -> AQ.
-- Q40 / id=519 : 12/12 votes concordants (100.00%), neutres=2, invalides=0; colonnes AQ -> AR.
-- Q51 / id=530 : 11/11 votes concordants (100.00%), neutres=3, invalides=0; colonnes BB -> BE.
-- Q52 / id=531 : 11/11 votes concordants (100.00%), neutres=3, invalides=0; colonnes BC -> BF.
-- Q54 / id=533 : 11/11 votes concordants (100.00%), neutres=3, invalides=0; colonnes BE -> BH.
-- Q55 / id=534 : 9/9 votes concordants (100.00%), neutres=5, invalides=0; colonnes BF -> BI.
-- Q57 / id=536 : 10/10 votes concordants (100.00%), neutres=4, invalides=0; colonnes BH -> BK.
-- Q58 / id=537 : 8/8 votes concordants (100.00%), neutres=6, invalides=0; colonnes BI -> BL.
-- Q59 / id=538 : 10/10 votes concordants (100.00%), neutres=4, invalides=0; colonnes BJ -> BM.
-- Q60 / id=539 : 8/8 votes concordants (100.00%), neutres=6, invalides=0; colonnes BK -> BN.
-- Q71 / id=550 : 12/12 votes concordants (100.00%), neutres=2, invalides=0; colonnes BV -> CA.
-- Q72 / id=551 : 10/10 votes concordants (100.00%), neutres=4, invalides=0; colonnes BW -> CB.
-- Q73 / id=552 : 11/11 votes concordants (100.00%), neutres=3, invalides=0; colonnes BX -> CC.
-- Q75 / id=554 : 8/8 votes concordants (100.00%), neutres=6, invalides=0; colonnes BZ -> CE.
-- Q76 / id=555 : 8/8 votes concordants (100.00%), neutres=6, invalides=0; colonnes CA -> CF.
-- Q77 / id=556 : 10/10 votes concordants (100.00%), neutres=4, invalides=0; colonnes CB -> CG.
-- Q78 / id=557 : 10/10 votes concordants (100.00%), neutres=4, invalides=0; colonnes CC -> CH.
-- Q79 / id=558 : 7/7 votes concordants (100.00%), neutres=7, invalides=0; colonnes CD -> CI.
-- Q80 / id=559 : 8/8 votes concordants (100.00%), neutres=6, invalides=0; colonnes CE -> CJ.
-- Q92 / id=571 : 10/10 votes concordants (100.00%), neutres=4, invalides=0; colonnes CQ -> CX.
-- Q95 / id=574 : 9/9 votes concordants (100.00%), neutres=5, invalides=0; colonnes CT -> DA.
-- Q96 / id=575 : 8/8 votes concordants (100.00%), neutres=6, invalides=0; colonnes CU -> DB.
-- Q97 / id=576 : 7/7 votes concordants (100.00%), neutres=7, invalides=0; colonnes CV -> DC.
-- Q99 / id=578 : 11/11 votes concordants (100.00%), neutres=3, invalides=0; colonnes CX -> DE.
-- Q100 / id=579 : 9/9 votes concordants (100.00%), neutres=5, invalides=0; colonnes CY -> DF.
-- Q111 / id=590 : 10/10 votes concordants (100.00%), neutres=4, invalides=0; colonnes DJ -> DS.
-- Q112 / id=591 : 9/9 votes concordants (100.00%), neutres=5, invalides=0; colonnes DK -> DT.
-- Q113 / id=592 : 12/12 votes concordants (100.00%), neutres=2, invalides=0; colonnes DL -> DU.
-- Q114 / id=593 : 9/9 votes concordants (100.00%), neutres=5, invalides=0; colonnes DM -> DV.
-- Q115 / id=594 : 9/9 votes concordants (100.00%), neutres=5, invalides=0; colonnes DN -> DW.
-- Q116 / id=595 : 13/13 votes concordants (100.00%), neutres=1, invalides=0; colonnes DO -> DX.
-- Q117 / id=596 : 11/11 votes concordants (100.00%), neutres=3, invalides=0; colonnes DP -> DY.
-- Q118 / id=597 : 12/12 votes concordants (100.00%), neutres=2, invalides=0; colonnes DQ -> DZ.
-- Q119 / id=598 : 10/10 votes concordants (100.00%), neutres=4, invalides=0; colonnes DR -> EA.
-- Q120 / id=599 : 10/10 votes concordants (100.00%), neutres=4, invalides=0; colonnes DS -> EB.
-- Q131 / id=610 : 11/11 votes concordants (100.00%), neutres=3, invalides=0; colonnes ED -> EO.
-- Q132 / id=611 : 9/9 votes concordants (100.00%), neutres=5, invalides=0; colonnes EE -> EP.
-- Q133 / id=612 : 9/9 votes concordants (100.00%), neutres=5, invalides=0; colonnes EF -> EQ.
-- Q134 / id=613 : 10/10 votes concordants (100.00%), neutres=4, invalides=0; colonnes EG -> ER.
-- Q135 / id=614 : 9/9 votes concordants (100.00%), neutres=5, invalides=0; colonnes EH -> ES.
-- Q136 / id=615 : 11/11 votes concordants (100.00%), neutres=3, invalides=0; colonnes EI -> ET.
-- Q137 / id=616 : 10/10 votes concordants (100.00%), neutres=4, invalides=0; colonnes EJ -> EU.
-- Q138 / id=617 : 9/9 votes concordants (100.00%), neutres=5, invalides=0; colonnes EK -> EV.
-- Q139 / id=618 : 10/10 votes concordants (100.00%), neutres=4, invalides=0; colonnes EL -> EW.
-- Q140 / id=619 : 13/13 votes concordants (100.00%), neutres=1, invalides=0; colonnes EM -> EX.
-- Q151 / id=630 : 9/9 votes concordants (100.00%), neutres=5, invalides=0; colonnes EX -> FK.
-- Q152 / id=631 : 10/10 votes concordants (100.00%), neutres=4, invalides=0; colonnes EY -> FL.
-- Q153 / id=632 : 9/9 votes concordants (100.00%), neutres=5, invalides=0; colonnes EZ -> FM.
-- Q154 / id=633 : 11/11 votes concordants (100.00%), neutres=3, invalides=0; colonnes FA -> FN.
-- Q155 / id=634 : 10/10 votes concordants (100.00%), neutres=4, invalides=0; colonnes FB -> FO.
-- Q156 / id=635 : 5/5 votes concordants (100.00%), neutres=9, invalides=0; colonnes FC -> FP.
-- Q157 / id=636 : 12/12 votes concordants (100.00%), neutres=2, invalides=0; colonnes FD -> FQ.
-- Q158 / id=637 : 8/8 votes concordants (100.00%), neutres=6, invalides=0; colonnes FE -> FR.
-- Q159 / id=638 : 5/5 votes concordants (100.00%), neutres=9, invalides=0; colonnes FF -> FS.
-- Q160 / id=639 : 9/9 votes concordants (100.00%), neutres=5, invalides=0; colonnes FG -> FT.
-- Q171 / id=650 : 9/9 votes concordants (100.00%), neutres=5, invalides=0; colonnes FR -> GG.
-- Q172 / id=651 : 7/7 votes concordants (100.00%), neutres=7, invalides=0; colonnes FS -> GH.
-- Q173 / id=652 : 7/7 votes concordants (100.00%), neutres=7, invalides=0; colonnes FT -> GI.
-- Q174 / id=653 : 8/8 votes concordants (100.00%), neutres=6, invalides=0; colonnes FU -> GJ.
-- Q176 / id=655 : 6/6 votes concordants (100.00%), neutres=8, invalides=0; colonnes FW -> GL.
-- Q177 / id=656 : 9/9 votes concordants (100.00%), neutres=5, invalides=0; colonnes FX -> GM.
-- Q178 / id=657 : 11/11 votes concordants (100.00%), neutres=3, invalides=0; colonnes FY -> GN.
-- Q179 / id=658 : 10/10 votes concordants (100.00%), neutres=4, invalides=0; colonnes FZ -> GO.
-- Q180 / id=659 : 12/12 votes concordants (100.00%), neutres=2, invalides=0; colonnes GA -> GP.
-- Q191 / id=670 : 13/13 votes concordants (100.00%), neutres=1, invalides=0; colonnes GL -> HC.
-- Q192 / id=671 : 12/12 votes concordants (100.00%), neutres=2, invalides=0; colonnes GM -> HD.
-- Q193 / id=672 : 9/9 votes concordants (100.00%), neutres=5, invalides=0; colonnes GN -> HE.
-- Q194 / id=673 : 10/10 votes concordants (100.00%), neutres=4, invalides=0; colonnes GO -> HF.
-- Q195 / id=674 : 12/12 votes concordants (100.00%), neutres=2, invalides=0; colonnes GP -> HG.
-- Q197 / id=676 : 12/12 votes concordants (100.00%), neutres=2, invalides=0; colonnes GR -> HI.
-- Q198 / id=677 : 11/11 votes concordants (100.00%), neutres=3, invalides=0; colonnes GS -> HJ.
-- Q199 / id=678 : 13/13 votes concordants (100.00%), neutres=1, invalides=0; colonnes GT -> HK.
-- Q200 / id=679 : 11/11 votes concordants (100.00%), neutres=3, invalides=0; colonnes GU -> HL.
-- Q211 / id=690 : 7/7 votes concordants (100.00%), neutres=7, invalides=0; colonnes HF -> HY.
-- Q212 / id=691 : 7/7 votes concordants (100.00%), neutres=7, invalides=0; colonnes HG -> HZ.
-- Q213 / id=692 : 7/7 votes concordants (100.00%), neutres=7, invalides=0; colonnes HH -> IA.
-- Q214 / id=693 : 8/8 votes concordants (100.00%), neutres=6, invalides=0; colonnes HI -> IB.
-- Q215 / id=694 : 9/9 votes concordants (100.00%), neutres=5, invalides=0; colonnes HJ -> IC.
-- Q216 / id=695 : 7/7 votes concordants (100.00%), neutres=7, invalides=0; colonnes HK -> ID.
-- Q217 / id=696 : 7/7 votes concordants (100.00%), neutres=7, invalides=0; colonnes HL -> IE.
-- Q218 / id=697 : 8/8 votes concordants (100.00%), neutres=6, invalides=0; colonnes HM -> IF.
-- Q219 / id=698 : 8/8 votes concordants (100.00%), neutres=6, invalides=0; colonnes HN -> IG.
-- Q220 / id=699 : 10/10 votes concordants (100.00%), neutres=4, invalides=0; colonnes HO -> IH.
-- Q231 / id=710 : 9/9 votes concordants (100.00%), neutres=5, invalides=0; colonnes HZ -> IU.
-- Q232 / id=711 : 9/9 votes concordants (100.00%), neutres=5, invalides=0; colonnes IA -> IV.
-- Q235 / id=714 : 7/7 votes concordants (100.00%), neutres=7, invalides=0; colonnes ID -> IY.
-- Q236 / id=715 : 12/12 votes concordants (100.00%), neutres=2, invalides=0; colonnes IE -> IZ.
-- Q237 / id=716 : 7/7 votes concordants (100.00%), neutres=7, invalides=0; colonnes IF -> JA.
-- Q238 / id=717 : 6/6 votes concordants (100.00%), neutres=8, invalides=0; colonnes IG -> JB.
-- Q239 / id=718 : 9/9 votes concordants (100.00%), neutres=5, invalides=0; colonnes IH -> JC.
-- Q240 / id=719 : 9/9 votes concordants (100.00%), neutres=5, invalides=0; colonnes II -> JD.
-- Q251 / id=730 : 10/10 votes concordants (100.00%), neutres=4, invalides=0; colonnes IT -> JQ.
-- Q252 / id=731 : 9/9 votes concordants (100.00%), neutres=5, invalides=0; colonnes IU -> JR.
-- Q253 / id=732 : 9/9 votes concordants (100.00%), neutres=5, invalides=0; colonnes IV -> JS.
-- Q254 / id=733 : 9/9 votes concordants (100.00%), neutres=5, invalides=0; colonnes IW -> JT.
-- Q256 / id=735 : 8/8 votes concordants (100.00%), neutres=6, invalides=0; colonnes IY -> JV.
-- Q257 / id=736 : 9/9 votes concordants (100.00%), neutres=5, invalides=0; colonnes IZ -> JW.
-- Q258 / id=737 : 8/8 votes concordants (100.00%), neutres=6, invalides=0; colonnes JA -> JX.
-- Q259 / id=738 : 8/8 votes concordants (100.00%), neutres=6, invalides=0; colonnes JB -> JY.
-- Q271 / id=750 : 8/8 votes concordants (100.00%), neutres=6, invalides=0; colonnes JN -> KM.
-- Q272 / id=751 : 11/11 votes concordants (100.00%), neutres=3, invalides=0; colonnes JO -> KN.
-- Q274 / id=753 : 11/11 votes concordants (100.00%), neutres=3, invalides=0; colonnes JQ -> KP.
-- Q276 / id=755 : 9/9 votes concordants (100.00%), neutres=5, invalides=0; colonnes JS -> KR.
-- Q277 / id=756 : 8/8 votes concordants (100.00%), neutres=6, invalides=0; colonnes JT -> KS.
-- Q278 / id=757 : 6/6 votes concordants (100.00%), neutres=8, invalides=0; colonnes JU -> KT.
-- Q279 / id=758 : 9/9 votes concordants (100.00%), neutres=5, invalides=0; colonnes JV -> KU.
UPDATE questions SET polarite = 'INVERSE'
WHERE id IN (490, 492, 493, 494, 496, 497, 511, 512, 513, 514, 515, 516, 518, 519, 530, 531, 533, 534, 536, 537, 538, 539, 550, 551, 552, 554, 555, 556, 557, 558, 559, 571, 574, 575, 576, 578, 579, 590, 591, 592, 593, 594, 595, 596, 597, 598, 599, 610, 611, 612, 613, 614, 615, 616, 617, 618, 619, 630, 631, 632, 633, 634, 635, 636, 637, 638, 639, 650, 651, 652, 653, 655, 656, 657, 658, 659, 670, 671, 672, 673, 674, 676, 677, 678, 679, 690, 691, 692, 693, 694, 695, 696, 697, 698, 699, 710, 711, 714, 715, 716, 717, 718, 719, 730, 731, 732, 733, 735, 736, 737, 738, 750, 751, 753, 755, 756, 757, 758)
  AND polarite = 'DIRECTE'
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

-- FAIBLE : INVERSE -> DIRECTE, 9 questions.
-- REVUE MANUELLE REQUISE : effectif concordant <=50. Ce bloc reste une proposition.
-- Q82 / id=561 : 8/8 votes concordants (100.00%), neutres=6, invalides=0; colonnes CG -> CN.
-- Q88 / id=567 : 11/11 votes concordants (100.00%), neutres=3, invalides=0; colonnes CM -> CT.
-- Q262 / id=741 : 9/9 votes concordants (100.00%), neutres=5, invalides=0; colonnes JE -> KD.
-- Q263 / id=742 : 9/9 votes concordants (100.00%), neutres=5, invalides=0; colonnes JF -> KE.
-- Q264 / id=743 : 12/12 votes concordants (100.00%), neutres=2, invalides=0; colonnes JG -> KF.
-- Q266 / id=745 : 8/8 votes concordants (100.00%), neutres=6, invalides=0; colonnes JI -> KH.
-- Q267 / id=746 : 6/6 votes concordants (100.00%), neutres=8, invalides=0; colonnes JJ -> KI.
-- Q268 / id=747 : 9/9 votes concordants (100.00%), neutres=5, invalides=0; colonnes JK -> KJ.
-- Q270 / id=749 : 11/11 votes concordants (100.00%), neutres=3, invalides=0; colonnes JM -> KL.
UPDATE questions SET polarite = 'DIRECTE'
WHERE id IN (561, 567, 741, 742, 743, 745, 746, 747, 749)
  AND polarite = 'INVERSE'
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

