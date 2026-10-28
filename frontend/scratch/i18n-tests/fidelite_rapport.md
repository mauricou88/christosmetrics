# Fidélité — rapport LOT 3

## Count check
| Langue | Questions | Dimensions | Libellés courts | Barèmes | Champs |
| --- | ---: | ---: | ---: | ---: | ---: |
| FR | 120 | 6 | 6 | 5 | 139 |
| EN | 120 | 6 | 6 | 5 | 139 |
| ES | 120 | 6 | 6 | 5 | 139 |
| PT-PT | 120 | 6 | 6 | 5 | 139 |

Extraction intégrale ids 260–379 ; description absente à null ; structure et métadonnées originales conservées.

## Décisions délicates
1. Faithfulness / Fidelidad / Fidelidade pour le fruit, sans remplacement par Loyalty.
2. Loyauté est une dimension distincte : loyalty / lealtad / lealdade, conforme à son titre français.
3. L'amour donné dans les relations conserve love / amor / amor ; aucune restriction au seul couple n'est ajoutée.
4. Vœux signifie vows / votos / votos, engagement solennel ; promesses reste promises / promesas / promessas.
5. Q300 « cela me coûte » garde le coût personnel sans le limiter à l'argent.
6. Q328 « on rend témoignage de moi » désigne une fiabilité attestée, sans récit de conversion inventé.
7. Intendance devient stewardship / administración responsable / gestão responsável. La notion reste responsabilité des ressources et missions confiées, pas confort ni privilège.
8. Q369 conserve les petites tâches ingrates ou subalternes, sans modifier leur statut ni ajouter un commandement biblique absent.
9. « Intégrité/cohérence » reste le titre source même lorsque les items décrivent surtout la continuité des projets.
10. Les doubles points et coquilles françaises restent dans l'archive FR. Les traductions sont grammaticales et gardent les engagements absolus lorsqu'ils sont dans la source.

## Enrichissements
À partir de Fidélité : faithfulness distinct de loyalty, intendance/stewardship, vœux, témoignage de fiabilité et constance. Aucun fruit précédent révisé.

## Signaux hors scope à investiguer
Source : **116 DIRECTE / 4 INVERSE**. Formulations négatives marquées DIRECTE à examiner, sélection non exhaustive :
| ID | Énoncé source | Polarité conservée |
| --- | --- | --- |
| 270 | Je me détache facilement des autres. | DIRECTE |
| 271 | Mes sentiments changent rapidement. | DIRECTE |
| 273 | Je suis instable dans mes engagements affectifs. | DIRECTE |
| 274 | Je manque de constance dans l’amour. | DIRECTE |
| 279 | Je manque de persévérance relationnelle. | DIRECTE |
| 290 | Je me décourage rapidement dans les difficultés. | DIRECTE |
| 292 | Je perds espoir rapidement. | DIRECTE |
| 293 | Je manque d’endurance dans les épreuves. | DIRECTE |
| 310 | Je promets facilement sans tenir parole. | DIRECTE |
| 311 | J’oublie mes engagements. | DIRECTE |
| 313 | Je manque de fiabilité dans mes paroles ou engagements. | DIRECTE |
| 331 | Je peux trahir une confiance pour mon intérêt. | DIRECTE |
| 333 | Je manque de loyauté dans les relations. | DIRECTE |
| 339 | Je manque de fidélité relationnelle. | DIRECTE |
| 351 | Je me lasse rapidement. | DIRECTE |
| 359 | Je manque de constance dans mes projets. | DIRECTE |
| 370 | Je néglige facilement ce qu’on me confie. | DIRECTE |
| 379 | Je manque de fidélité dans les détails. | DIRECTE |

Aucune modification de polarité, calcul, texte français, seuil ou migration existante.

## Vérifications
- V14 : **132 UPDATE** = 1 + 6 + 120 + 5 ; **417 traductions**.
- PostgreSQL 17 isolé : V1–V13 chargées, V14 exécutée deux fois ; JSON exacts, idempotence et autres contenus intacts : OK.
- Backend Java 21 : compilation OK. Statut Git contrôlé après le fruit : fichiers du LOT 3 uniquement.
- Aucun code frontend ou dépendance modifié ; build frontend final du LOT 3 réussi.
