# Patience — rapport LOT 3

## Count check
| Langue | Questions | Dimensions | Libellés courts | Barèmes | Champs |
| --- | ---: | ---: | ---: | ---: | ---: |
| FR | 200 | 10 | 10 | 5 | 227 |
| EN | 200 | 10 | 10 | 5 | 227 |
| ES | 200 | 10 | 10 | 5 | 227 |
| PT-PT | 200 | 10 | 10 | 5 | 227 |

Corpus réel : **200 questions**, ids 760–959, contre 100 dans le dernier prompt. Extraction intégrale ; description absente à null ; structure et métadonnées identiques au pilote.

## Décisions délicates
1. Patience / paciencia / paciência conserve la persévérance active, sans substitution automatique par forbearance ou longanimity.
2. Q763 « sans me révolter » conserve sa force, sans transformer l'item en conseil à suivre face à une situation réelle.
3. Q800/Q810 conservent la lenteur perçue, sans ajouter d'étiquette médicale.
4. Q805/Q814 « maladresses » devient mistakes / errores / falhas, dans le contexte relationnel.
5. Q864/Q875 « rechutes » devient setbacks in progress / retrocesos / retrocessos ; aucun diagnostic d'addiction n'est ajouté.
6. Q866 garde le chemin parcouru sans ajouter « spirituel » à la croissance personnelle.
7. Q906 conserve « temps et Dieu ». La patience face à l'injustice ne devient pas une approbation de l'injustice.
8. Q942 : God's timing / los tiempos de Dios / o tempo de Deus. Q944 conserve « semble » : silence perçu, sans affirmer un abandon.
9. Q946 : faithful / fiel / fiel, dans le contexte spirituel.
10. Barèmes : fruit of the Spirit / fruto del Espíritu / fruto do Espírito au singulier collectif. Le niveau supérieur conserve une croissance possible.

## Enrichissements du glossaire
Appliqués à partir de Patience : patience, persévérance, maîtrise de soi, attente en Dieu, timing de Dieu, rechute dans la croissance personnelle, injustice/équité. Aucun changement rétroactif de Joie.

## Signaux hors scope à investiguer
Source : **100 DIRECTE / 100 INVERSE**. Écarts apparents entre tonalité et polarité, à soumettre à l'auteur, sans conclure ici à une erreur :
| ID | Énoncé source | Polarité conservée |
| --- | --- | --- |
| 763 | Je supporte la souffrance sans me révolter. | INVERSE |
| 786 | Je ne me précipite pas inutilement. | INVERSE |
| 806 | J'accompagne sans presser les autres. | INVERSE |
| 807 | Je pardonne les lenteurs des autres. | INVERSE |
| 824 | Je ne m'obstine pas à tout contrôler. | INVERSE |
| 832 | Je veux que tout soit parfait. | DIRECTE |
| 833 | Les défauts me contrarient beaucoup. | DIRECTE |
| 834 | Je ne tolère aucune erreur. | DIRECTE |
| 836 | L'imparfait me met mal à l'aise. | DIRECTE |
| 864 | J'accepte mes rechutes comme normales. | INVERSE |
| 878 | Je néglige le chemin parcouru. | DIRECTE |
| 884 | J'avance étape par étape sans me presser. | INVERSE |
| 897 | Je veux des résultats immédiats au travail. | DIRECTE |
| 901 | Je réponds à l'injustice sans violence. | INVERSE |
| 905 | Je ne me venge pas dans la précipitation. | INVERSE |
| 909 | Je supporte l'injustice sans m'aigrir. | INVERSE |
| 912 | Je perds tout calme face à l'inéquité. | DIRECTE |
| 919 | L'injustice détruit ma patience. | DIRECTE |
| 951 | Je veux des réponses divines immédiates. | DIRECTE |

Aucune polarité, aucun texte français, seuil ou code technique modifié.

## Vérifications
- V11 : **216 UPDATE**, soit 1 + 10 + 200 + 5 ; **681 champs traduits**.
- PostgreSQL 17 isolé : V1–V10 chargées, V11 exécutée deux fois, traductions identiques aux JSON, source et autres fruits inchangés : OK.
- Backend Java 21 : compilation Maven OK.
- Statut Git vérifié : uniquement les fichiers du LOT 3. Aucune dépendance ni configuration modifiée.
- Aucun code frontend modifié ; build frontend final du LOT 3 réussi, sans erreur TypeScript.
