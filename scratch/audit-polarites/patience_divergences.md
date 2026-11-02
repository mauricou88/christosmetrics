# Patience — règle de points identifiée, corpus non comparable à V2

Source : C:\Users\mauri\Downloads\CHRISTOS\Patience\CHRISTOSMETRICS - Fruit de l'Esprit - La Patience (réponses).xlsx

La feuille **Feuil2** contient les points. Les réponses et points ont été appariés sur **60 répondants uniques** et sur des en-têtes identiques entre les deux feuilles. Le nom Score n'est pas nécessaire au calcul.

## Différence de questionnaire
- POC : **400 items, 10 dimensions × 40**, plus deux questions de qualité hors scope.
- V2 : **200 items, 10 dimensions × 20**.
- Aucune correspondance exacte d'énoncé après normalisation ; nombreux en-têtes tronqués à 254/255 caractères.
- Première question V2 : « Je tiens bon dans la durée malgré la douleur. » ; premier en-tête POC finit par « [1. Lorsque je traverse ».

Le JSON vérité décrit les **400 items du POC**, avec en-tête original, texte disponible ou null, marqueur de troncature et id_db=null. Le JSON DB conserve les **200 items V2**. Il serait incorrect d'assimiler les colonnes par position ou d'appliquer les polarités d'un autre énoncé.

## Votes observés
- Questions POC à polarité déterminée : 400 / 400.
- Questions exploitables selon la borne conservatrice incluant les scores incompatibles : 384 / 400.
- Polarités majoritaires : {'DIRECTE': 200, 'INVERSE': 200}.
- Paires de cellules incompatibles exclues : 196.
- Neutres Parfois→3 exclus ; confidence = majorité / votes informatifs ; borne conservatrice >80 % pour exploitable.

## Divergences et correction
**Nombre de divergences V2 : non déterminé.** Aucun UPDATE Patience proposé. Il faut le POC correspondant aux 200 énoncés V2, ou une table de correspondance explicitement validée. Aucune conclusion de conformité ni de fausseté ne peut être déduite des 400 autres questions.

Les variantes .xlsx retrouvées sont du même format 400 items ; les .xlsm voisins portent les questions de Paix malgré leur nom. Aucune source n'a été substituée silencieusement.

Aucun fichier Excel, donnée applicative ou migration existante modifié.
