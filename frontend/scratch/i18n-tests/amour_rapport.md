# Amour — rapport LOT 3

## Count check
| Langue | Questions | Dimensions | Libellés courts | Barèmes | Champs |
| --- | ---: | ---: | ---: | ---: | ---: |
| FR | 280 | 14 | 14 | 5 | 315 |
| EN | 280 | 14 | 14 | 5 | 315 |
| ES | 280 | 14 | 14 | 5 | 315 |
| PT-PT | 280 | 14 | 14 | 5 | 315 |

Corpus intégral : ids 480–759, **280 questions**, et non 100 dans le dernier prompt. Description absente à null ; codes d'archive et paramètres techniques conservés.

## Décisions délicates
1. Love / amor / amor pour amour, sans charity. La référence biblique comprend 1 Corinthiens 13:4–7 et 1 Jean 4:18.
2. « Plein de bonté » reste full of kindness / lleno de bondad / cheio de bondade, distinct de l'amour romantique seul.
3. « Parcours » Q526 reste journey / recorrido / percurso, sans ajouter spiritual au contexte qui ne le précise pas.
4. Q536 reprend le vocabulaire du contentement validé sur Joie : be content with what I have / contentarme con lo que tengo / contentar-me com o que tenho.
5. « Ne fait rien de malhonnête » reste dishonourable / deshonroso / desonroso : les questions concernent respect et limites, pas uniquement fraude financière.
6. « Ne soupçonne pas le mal » conserve le sens de suspicion développé par les items Q640–659. Ce titre n'est pas remplacé par la formulation d'une édition biblique sur la mémoire des torts.
7. « Excuse tout » devient Love is always forgiving / El amor todo lo disculpa / O amor tudo desculpa. Le contexte des questions est le pardon ; le titre n'est pas présenté comme citation canonique.
8. Q702 « couvre les erreurs » conserve la couverture des erreurs, sans ajouter des termes tels que crime, abus ou dissimulation. Cette formule source reste à relire éditorialement pour lever toute ambiguïté ; elle n'est pas transformée en conseil.
9. Grâce, miséricorde et pardon restent distincts : grace/gracia/graça ; mercy/misericordia/misericórdia ; forgiveness/perdón/perdão.
10. « Crainte » dans la dernière dimension désigne fear / temor / medo, non révérence religieuse. Les formulations positives et négatives, ainsi que leurs polarités techniques, sont conservées séparément.

## Références de vocabulaire
Les passages ont été consultés pour le vocabulaire, sans remplacer les questions originales ni reproduire un verset complet :
- [1 Corinthiens 13:4–7 — NIV](https://www.biblegateway.com/passage/?search=1%20Corinthians%2013%3A4-7&version=NIV)
- [1 Corintios 13:4–7 — NVI](https://www.biblegateway.com/passage/?search=1%20Corintios%2013%3A4-7&version=NVI)
- [1Coríntios 13:4–7 — ARA](https://www.bible.com/pt/bible/1608/1CO.13.4-7.ARA)

## Enrichissements du glossaire
À partir d'Amour : amour, compassion, grâce envers autrui, miséricorde, pardon, orgueil/humilité, intégrité et crainte psychologique. Joie et Patience ne sont pas révisés rétroactivement.

## Signaux hors scope à investiguer
Source : **249 DIRECTE / 31 INVERSE**. Sélection de contrastes apparents, non audit exhaustif :
| ID | Énoncé source | Polarité conservée |
| --- | --- | --- |
| 490 | Je m’agace rapidement lorsque les choses n’avancent pas. | DIRECTE |
| 511 | Je n’aide que si cela m’arrange. | DIRECTE |
| 561 | Je suis ouvert aux critiques. | INVERSE |
| 567 | Je ne me considère pas supérieur. | INVERSE |
| 593 | Je manque parfois de respect dans mes attitudes. | DIRECTE |
| 630 | Je m’énerve facilement. | DIRECTE |
| 650 | Je me méfie facilement des autres. | DIRECTE |
| 690 | Je préfère éviter la vérité. | DIRECTE |
| 711 | Je rappelle souvent les erreurs des autres. | DIRECTE |
| 741 | Je crains d’être rejeté par les autres. | INVERSE |
| 752 | Je prends des décisions sans être paralysé par la peur. | INVERSE |
| 754 | Je ne crains pas le jugement des autres. | INVERSE |
| 759 | Je vis avec assurance plutôt qu’avec peur. | INVERSE |

Aucune polarité ni migration existante modifiée. Les constats sont destinés à un audit ultérieur de la méthode.

## Vérifications
- V12 : **300 UPDATE**, soit 1 référentiel + 14 dimensions + 280 questions + 5 barèmes ; **945 traductions**.
- PostgreSQL 17 isolé : V1–V11 chargées ; V12 exécutée deux fois ; 945 valeurs identiques aux JSON ; source et autres fruits inchangés : OK.
- Compilation backend Java 21 : OK. Statut Git contrôlé : fichiers du LOT 3 uniquement.
- Aucun code ou dépendance frontend modifié ; build frontend final du LOT 3 réussi, sans erreur TypeScript.
