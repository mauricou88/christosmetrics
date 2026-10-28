# Bonté & Bienveillance — rapport LOT 3

## Count check
| Langue | Questions | Dimensions | Libellés courts | Barèmes | Champs |
| --- | ---: | ---: | ---: | ---: | ---: |
| FR | 100 | 2 | 2 | 5 | 111 |
| EN | 100 | 2 | 2 | 5 | 111 |
| ES | 100 | 2 | 2 | 5 | 111 |
| PT-PT | 100 | 2 | 2 | 5 | 111 |

Ids 380–479, extraction intégrale ; description absente à null. Source et métadonnées conservées.

## Décisions délicates
1. Noms imposés : Kindness & Goodness / Bondad y Benevolencia / Bondade e Benevolência. Les deux concepts ne sont jamais fusionnés.
2. Chrestotes et Agathousune restent les translittérations du seed ; les titres distinguent intention et action.
3. Bienveillance dans les pensées peut devenir kind thoughts / pensamientos benevolentes / pensamentos benevolentes, plutôt qu'un calque anglais abstrait à chaque item.
4. Douceur des intentions : gentleness / delicadeza / delicadeza. Il ne s'agit pas d'absence de fermeté.
5. « Indulgent dans mes pensées » conserve la disposition à ne pas condamner, sans promettre l'oubli ou l'impunité.
6. Miséricorde reprend mercy / misericordia / misericórdia, défini à partir d'Amour.
7. Reprendre quelqu'un pour son bien devient correct someone for their good / corregir a alguien por su bien / corrigir alguém para seu bem.
8. « S'égarer » reste go astray / desviarse / desviar-se, sans ajout de péché ni de rupture confessionnelle.
9. Les items sur confrontation et correction conservent respect, sagesse et justice lorsqu'ils les mentionnent. Aucune coercition supplémentaire n'est introduite.
10. Q400 porte sur le découragement dans les difficultés ; ce contenu est atypique dans cette dimension mais reste traduit fidèlement et rattaché à son id original.

## Enrichissements
À partir de Bonté : distinction des deux noms et dimensions, douceur relationnelle, reprendre pour le bien, s'égarer. Les noms de méthode ne sont pas présentés comme citation canonique d'un verset. Aucun fruit précédent réécrit.

## Signaux hors scope à investiguer
Source : **88 DIRECTE / 12 INVERSE**. Sélection non exhaustive de contrastes entre formulation et polarité :
| ID | Énoncé source | Polarité conservée |
| --- | --- | --- |
| 389 | Je cherche à comprendre avant de juger. | INVERSE |
| 392 | Je ne souhaite pas de mal aux autres, même en colère. | INVERSE |
| 398 | Je suis porté à ne pas nourrir de l'amertume intérieurement. | INVERSE |
| 400 | Lorsque les difficultés durent, je me décourage rapidement. | DIRECTE |
| 402 | Je suis lent à juger les autres. | INVERSE |
| 405 | Je nourris facilement des pensées négatives envers les autres. | DIRECTE |
| 406 | Je manque de compassion face à la souffrance. | DIRECTE |
| 410 | Je manque d’empathie. | DIRECTE |
| 421 | Je manque de miséricorde. | DIRECTE |
| 425 | Je manque de patience intérieure envers les autres. | DIRECTE |
| 426 | Je me réjouis parfois des échecs des autres. | DIRECTE |
| 455 | Je vois les besoins mais je n’agis pas. | DIRECTE |
| 456 | Je reste passif face à la souffrance des autres. | DIRECTE |
| 465 | Je n’ose pas dire la vérité quand c’est nécessaire. | DIRECTE |
| 469 | Je suis passif face à l’injustice. | DIRECTE |

Audit éditorial complémentaire : vérifier le rattachement de Q400 à la dimension Bonté. Aucune correction réalisée.

## Vérifications
- V13 : **108 UPDATE** = 1 référentiel + 2 dimensions + 100 questions + 5 barèmes ; **333 traductions**.
- PostgreSQL 17 isolé : V1–V12 chargées, V13 exécutée deux fois ; valeurs identiques aux JSON ; français, paramètres techniques et autres fruits inchangés : OK.
- Backend Java 21 : compilation OK. Git : fichiers du LOT 3 uniquement.
- Aucun changement de dépendance, configuration ou code frontend ; build frontend final du LOT 3 réussi.
