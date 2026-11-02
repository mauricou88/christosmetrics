# Audit consolidé des polarités — référence POC / migration V2

## Résultat
**361 divergences confirmées sur 759 questions comparables (47.56 %).**

Les six fruits individuels de V2 contiennent **959 questions**, et non 968. Le total de 968 inclut les **9 affirmations Couple**, hors du périmètre de cet audit.

Les **200 questions V2 de Patience ne sont pas comparables** au .xlsx fourni, qui contient 400 autres items, avec des en-têtes tronqués. Leur taux reste **non déterminé**, pas zéro. On ne peut donc pas affirmer « X questions fausses sur 968 » ni donner le taux final des six fruits. Il y a au moins 361 divergences documentées dans les 959 questions individuelles ; le taux sur les seuls items comparables est 47,56 %.

## Synthèse par fruit
| Fruit | Questions V2 | Items Excel | Comparables | Divergences | % sur V2 du fruit | Signaux forts >50 votes | Signaux faibles | Feuille de points |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | --- |
| Joie | 100 | 100 | 100 | 45 | 45.00 % | 13 | 32 | Score |
| Patience | 200 | 400 | 0 | n.d. | n.d. | n.d. | n.d. | Feuil2 |
| Bonte | 100 | 100 | 100 | 46 | 46.00 % | 35 | 11 | scoring |
| Fidelite | 120 | 120 | 120 | 56 | 46.67 % | 56 | 0 | Transform |
| Paix | 159 | 159 | 159 | 87 | 54.72 % | 62 | 25 | Scoring |
| Amour | 280 | 280 | 280 | 127 | 45.36 % | 0 | 127 | Feuil1 |

## Pattern détecté
- **339 DIRECTE → INVERSE** : majoritaires, comme Joie.
- **22 INVERSE → DIRECTE** : 4 dans Bonté, 9 dans Paix et 9 dans Amour.
- Toutes les divergences exploitables ont **100 % de votes informatifs concordants**, après exclusion des neutres et données invalides.
- Le défaut de conformité à la référence POC n'est donc **pas unidirectionnel**. Un script qui ne ferait que passer des questions en INVERSE manquerait les 22 corrections vers DIRECTE.
- Ce constat documente un défaut systémique probable de reprise des polarités dans V2 ; il ne démontre pas que le POC lui-même est psychométriquement validé ni que la DB déployée est identique à V2.

## Méthode adaptée, principe inchangé
Lecture openpyxl read_only=True et data_only=True ; aucun classeur enregistré ni recalculé. L'analyse des formules et en-têtes sert à identifier les feuilles de points, pas à exécuter des macros.

- Réponses Jamais/Rarement/Parfois/Souvent/Presque toujours : 1/2/3/4/5.
- DIRECTE si score=réponse ; INVERSE si score=6−réponse ; Parfois→3 ignoré.
- Confidence=majorité/(votes DIRECTE+INVERSE), seuil strict >80 %.
- Les paires invalides sont tracées séparément. Pour les nouveaux fruits, une borne conservatrice majorité/(votes informatifs + invalides) doit aussi rester >80 % pour accepter l'item.
- **166 signaux FORTS** : plus de 50 votes concordants, prioritaires pour la correction proposée après validation.
- **195 signaux FAIBLES** : au plus 50 votes concordants ; relecture manuelle requise. Ils ne sont pas déclarés faux ou conformes sur la seule sémantique.
- Les questions sont rapprochées par texte normalisé **dans leur dimension**, avec contrôle du numéro local. Cette précaution évite de confondre les énoncés identiques répétés dans Amour.
- Les répondants sont appariés par identifiants uniques en mémoire ; en présence de doublons, seules les paires forcées dans tous les alignements ordonnés sont conservées. Aucun score ne sert à choisir un répondant. Aucune identité ou réponse individuelle n'est archivée.

## Alignement des répondants
| Fruit | Réponses identifiées | Lignes de points identifiées | Paires certaines |
| --- | ---: | ---: | ---: |
| joie | 73 | 71 | 70 |
| patience | 60 | 60 | 60 |
| bonte | 71 | 71 | 71 |
| fidelite | 107 | 107 | 107 |
| paix | 77 | 76 | 75 |
| amour | 14 | 14 | 14 |

Joie : une ligne de points ambiguë exclue. Paix : une ligne de points ambiguë exclue. Les lignes de formulaire sans correspondance exploitable ne votent pas.

## Particularités des sources
### Patience
La règle d'attribution des points est bien dans **Feuil2**. Les 400 colonnes de questions sont appariées à celles du formulaire par en-têtes identiques et rang dans la dimension ; 60 répondants certains. La polarité majoritaire est déterminable pour les 400 items (200 DIRECTE, 200 INVERSE) ; 384 passent aussi la borne conservatrice. Il existe 196 paires de cellules incompatibles, tracées. Deux questions sur la longueur du test, dimension 11, sont exclues.

Cependant, le POC comprend 10×40 items différents de V2 (10×20). Les 400 en-têtes sont tronqués ou incomplets ; aucun énoncé n'est apparié exactement à V2. Les copies .xlsx retrouvées ont le même contenu. Les .xlsm voisins nommés Patience contiennent en réalité les questions de Paix. Le JSON patience_verite.json décrit le POC 400 items, id_db=null ; patience_db.json décrit les 200 items V2. Aucun UPDATE Patience n'est proposé. Il faut le classeur exact de la version 200 items ou une correspondance validée pour conclure.

### Bonté & Bienveillance
La feuille est **scoring**. Un en-tête a été altéré : « Je me réjouis parfois des échecs des autres » devient « Je me réjouis 3 des échecs des autres ». L'appariement est documenté sur dimension 1 / item 47, avec texte et position concordants.

**22 paires de cellules** contiennent « Colonne 6 » au lieu d'une réponse et d'un score, sur 17 questions. Elles sont exclues. Les 100 questions restent exploitables ; la borne conservatrice minimale est **96 %**. L'ancienne exclusion de tout item contenant une cellule invalide aurait sous-estimé la couverture.

### Fidélité, Paix, Amour
Les feuilles de points sont respectivement **Transform**, **Scoring**, **Feuil1**. Les rangées de titres de dimension et les colonnes de totaux sont exclues du matching. Les formules de totaux normalisés ne sont pas confondues avec les points des questions. Amour compte seulement **14 répondants** : ses 127 divergences restent toutes à signal faible selon le seuil d'effectif demandé, malgré l'unanimité des votes informatifs.

### Précaution psychométrique
Certains items positifs sont inversés dans le POC, par exemple Joie Q51. L'audit suit la référence Excel indiquée par Momo et ne remplace pas sa logique par une interprétation linguistique. Les corrections proposées rétabliraient la conformité au POC, pas une validation scientifique indépendante.

## Projet V17, non appliqué
Fichier : **scratch/audit-polarites/V17__fix_polarites_proposee.sql**, en dehors de Flyway.

- **361 lignes candidates** et **13 instructions UPDATE groupées** par fruit, signal et sens de correction.
- 339 lignes vers INVERSE, 22 vers DIRECTE ; aucune ligne Patience ni Couple.
- Les 166 signaux forts et les 195 faibles sont séparés et commentés. Les blocs FAIBLES sont des propositions qui requièrent une revue avant toute application.
- Chaque question est tracée par id, numéro, source Excel, feuille, colonnes, nombre de votes concordants, neutres et invalides.
- Idempotence logique : filtre sur la polarité initiale et contrôle du référentiel. Après une correction, un second passage ne réapplique pas le même changement.
- **Aucune instruction SQL exécutée**, y compris en base de test. Le script ne recalcule ni résultats historiques ni PDFs.

## Impact applicatif
**Non déterminé** : aucun snapshot ou accès aux passations de la DB applicative n'a été fourni. Les répondants Excel ne sont pas les passations de l'app. Tous les champs impact_passations_db restent null. Une réponse 3 est inchangée sous inversion ; les valeurs 1,2,4,5 sont potentiellement concernées. Un décompte autorisé puis un recalcul comparatif seraient nécessaires pour établir l'impact réel.

## Sources et empreintes
- **joie** : C:\Users\mauri\Downloads\CHRISTOS\JOIE\CHRISTOSMETRICS - Fruit de l'Esprit - La Joie (réponses).xlsm ; SHA-256 `1802e7e796c9e24b5b1baaa876d22cd342040590a0b5fcccd71c84ec830db006`.
- **patience** : C:\Users\mauri\Downloads\CHRISTOS\Patience\CHRISTOSMETRICS - Fruit de l'Esprit - La Patience (réponses).xlsx ; SHA-256 `c14f12a6badbc0e7e599438d6632fa99f318149c52932cb1936b22549a0d9fb8`.
- **bonte** : C:\Users\mauri\Downloads\CHRISTOS\Bonté et Bienveillance\CHRISTOSMETRICS - Fruit de l'Esprit - Bonté et Bienveillance (réponses).xlsx ; SHA-256 `c8f554cc96626f65f696109187697f3b089ed31d47a37657314612d90e7fdd2a`.
- **fidelite** : C:\Users\mauri\Downloads\CHRISTOS\Fidèlité\CHRISTOSMETRICS - Fruit de l'Esprit - La Fidélité (réponses).xlsm ; SHA-256 `93479190a2fd4b0bd6d67ec09398f326bbcfbbafd9c4e8cc3ee4e169cda7daf1`.
- **paix** : C:\Users\mauri\Downloads\CHRISTOS\Paix\CHRISTOSMETRICS - Fruit de l'Esprit - La Paix (réponses).xlsm ; SHA-256 `d8ac59c3e8c90a658d5e99bf608c6118352688223f35e4097fe28f2c6a1fd584`.
- **amour** : C:\Users\mauri\Downloads\CHRISTOS\AMOUR\Amour de Dieu\CHRISTOSMETRICS - Fruit de l'Esprit - L'amour Caen1.xlsx ; SHA-256 `3eb7afa399bf0a2d5fcea80d2d5cd2b0fabbd5eb25bb8b8d0444fefec86849ab`.

V2 SHA-256 : `b97a2f1e785f3508d8b04b17bd1886a303d6e91bf6e79befb98f08bd7038f9ef`. Toutes les empreintes ont été revérifiées après lecture.

## Livrables
- Six fichiers *_db.json, six *_verite.json et six *_divergences.md.
- Cas Patience : vérité Excel 400 items et DB 200 items non comparables, explicitement signalé ; aucun taux inventé.
- Rapport consolidé, preuves méthodologiques et projet V17 dans scratch.
- patience_controle_structure.json conserve la trace du contrôle initial puis sa résolution : points dans Feuil2, divergence de version du questionnaire persistante.

Aucun fichier source Excel, aucune migration existante, aucun code applicatif, aucune DB de production modifié. Aucun commit ni push. Les scripts d'analyse et openpyxl sont isolés sous backend/target, ignoré par Git. Aucun build applicatif nécessaire : seuls des livrables d'audit ont été produits.
