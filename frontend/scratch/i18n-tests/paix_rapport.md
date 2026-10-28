# Paix — rapport LOT 3

## Count check
| Langue | Questions | Dimensions | Libellés courts | Barèmes | Champs |
| --- | ---: | ---: | ---: | ---: | ---: |
| FR | 159 | 8 | 8 | 5 | 182 |
| EN | 159 | 8 | 8 | 5 | 182 |
| ES | 159 | 8 | 8 | 5 | 182 |
| PT-PT | 159 | 8 | 8 | 5 | 182 |

Extraction intégrale ids 101–259. La dimension culpabilité compte **19 questions** ; aucun item manquant n'a été inventé. Description absente à null ; métadonnées conservées.

## Décisions délicates
1. Peace / paz / paz conserve une portée intérieure et relationnelle, sans réduire la paix à l'absence de conflit.
2. Worry et anxiety restent distincts ; aucun diagnostic clinique n'est ajouté aux ressentis exprimés.
3. « Esprit » aux Q109/Q208/Q218 désigne mind / mente / mente, non le Saint-Esprit. Les majuscules ne sont pas introduites.
4. Q112 « je fais confiance » reste sans destinataire, sans ajouter Dieu à un item qui ne le mentionne pas.
5. Lâcher prise devient let go / soltar / deixar ir, dans le contexte du besoin de contrôle ; aucune injonction à renoncer à une responsabilité.
6. Q118 « Je ne n'arrive pas à ne pas m'inquiéter » est une formulation fautive conservée dans FR. Le sens retenu est l'impossibilité de cesser de s'inquiéter : I cannot stop worrying / No consigo dejar de preocuparme / Não consigo deixar de me preocupar.
7. Le titre « péché non traité » reste théologique ; les items sur culpabilité, condamnation et pardon décrivent des ressentis. Aucune condamnation divine ni pratique sacramentelle n'est ajoutée.
8. Q194 « je me libère de mes erreurs » conserve le sujet personnel, sans transformer l'item en affirmation sur l'origine du salut.
9. Le regard des autres désigne perception et opinion sociales ; pas un regard physique littéral.
10. Q212 « Mes pensées sont agitées » conserve son sens négatif même dans une série environnante positive. Les titres, ordre et rattachements sont conservés.

## Enrichissements
À partir de Paix : paix, culpabilité, péché non traité, condamnation intérieure, lâcher prise, ruminer et regard des autres. Shalom n'apparaît pas ; aucune glose hébraïque ajoutée. Aucun fruit précédent révisé.

## Signaux hors scope à investiguer
Source : **149 DIRECTE / 10 INVERSE**. Sélection non exhaustive de contrastes à auditer :
| ID | Énoncé source | Polarité conservée |
| --- | --- | --- |
| 101 | Je m’inquiète souvent pour l’avenir. | DIRECTE |
| 103 | Je pense souvent à ce qui pourrait mal tourner. | DIRECTE |
| 104 | Je me fais du souci même sans raison claire. | DIRECTE |
| 109 | Mon esprit est souvent agité. | DIRECTE |
| 118 | Je ne n'arrive pas à ne pas m'inquiéter. | DIRECTE |
| 121 | J’ai tout le temps besoin que tout soit sous contrôle. | DIRECTE |
| 130 | Je me sens en sécurité uniquement quand je contrôle. | DIRECTE |
| 141 | Ma paix dépend de ma situation financière. | DIRECTE |
| 161 | Les conflits me troublent profondément. | DIRECTE |
| 181 | Je ressens constamment de la culpabilité par rapport à mes actes, paroles ou pensées.. | DIRECTE |
| 183 | Je me sens condamné intérieurement. | DIRECTE |
| 200 | Je pense souvent de manière négative. | DIRECTE |
| 212 | Mes pensées sont agitées. | DIRECTE |
| 234 | Je reste stable face aux critiques. | INVERSE |
| 240 | Je vois les épreuves comme injustes. | DIRECTE |
| 243 | Je me sens abandonné dans les moments difficiles. | DIRECTE |

Q234, formulation de stabilité face aux critiques, est INVERSE. Q118/Q212 méritent une relecture éditoriale de la source. Aucun correctif de scoring, de français ou de structure.

## Vérifications
- V15 : **173 UPDATE** = 1 + 8 + 159 + 5 ; **546 traductions**.
- PostgreSQL 17 isolé : V1–V14 chargées, V15 exécutée deux fois ; traductions conformes, idempotence, français et autres fruits intacts : OK.
- Backend Java 21 : compilation OK. Statut Git contrôlé : uniquement les fichiers du LOT 3.
- Aucun changement de code, dépendance ou configuration frontend ; build frontend final du LOT 3 réussi.
