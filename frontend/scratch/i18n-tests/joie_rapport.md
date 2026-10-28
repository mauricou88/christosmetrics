# Joie — rapport de traduction EN / ES / PT

Statut : traductions du pilote terminées ; glossaire et arbitrages Q69/Q99 validés par Momo. Arrêt avant commit et avant tout autre fruit.

## Périmètre et fichiers

- Source française : `joie_fr.json`, extraite de V2 et V5, sans réécriture du français.
- Traductions : `joie_en.json`, `joie_es.json`, `joie_pt.json`.
- Glossaire : `glossaire-theologique.md`, validation de Momo intégrée.
- Migration : `backend/src/main/resources/db/migration/V10__i18n_joie.sql`.
- Chaque langue comprend 117 champs de contenu : nom, référence biblique, 5 titres de dimensions, 5 libellés courts, 100 énoncés et 5 interprétations.
- Aucun champ description n'existe dans la source : `description: null` est conservé.
- Les ids, positions, codes d'archive, polarités, seuils et paramètres d'icônes sont identiques dans les quatre JSON. Les codes d'archive ne servent pas de clés SQL.
- Aucun service de traduction automatique n'a été utilisé.

## Glossaire final validé

## Quinze entrées effectivement présentes

Les variantes d'une même famille sont réunies ; les groupes ne rendent pas leurs mots interchangeables. Les références Q renvoient aux ids conservés dans le JSON.

| Terme FR | EN | ES | PT-PT | Justification brève | Présence |
| --- | --- | --- | --- | --- | --- |
| joie ; se réjouir | joy ; rejoice | alegría ; alegrarse | alegria ; alegrar-se | Galates 5:22 fixe le nom du fruit ; conserver cette famille sans la confondre avec le bonheur. | Q2, Q6, Q82 |
| bonheur ; heureux | happiness ; happy | felicidad ; feliz | felicidade ; feliz | Préserver la distinction lexicale présente en français ; ces termes ne sont pas intrinsèquement hédonistes. | Q42, Q43, Q61 |
| paix ; paisible | peace ; at peace / peaceful | paz ; en paz / sereno | paz ; em paz / sereno | Conserver la paix intérieure explicitement exprimée sans ajouter une origine divine absente de la phrase. | Q5, Q55, Q62 |
| épreuve ; souffrance | trial ; suffering | prueba ; sufrimiento | provação ; sofrimento | Distinguer situation éprouvante et souffrance vécue ; éviter une lecture automatique comme tentation ou punition divine. | Q22, Q25, Q31 |
| espérance ; espoir | hope | esperanza | esperança | Hope couvre les deux noms français ; garder le contexte sans imposer une certitude eschatologique supplémentaire. | Q25, Q33 |
| reconnaissant ; rendre grâce | grateful ; give thanks | agradecido ; dar gracias | grato ; dar graças | Rendre grâce exprime l'action de remercier ; ne pas traduire cette expression par recevoir la grâce. | Q4, Q27, Q89 |
| foi | faith | fe | fé | Nommer la foi chrétienne lorsque le contexte désigne Dieu ; ne pas remplacer systématiquement par croyance. | Q85, Q87, Q92, Q95 |
| confiance ; confiant | confidence ; confident | confianza ; confiado | confiança ; confiante | Garder le sens personnel ou relationnel du contexte sans ajouter automatiquement une référence à Dieu. | Q24, Q37, Q68 |
| Dieu ; Jésus | God ; Jesus | Dios ; Jesús | Deus ; Jesus | Conserver les noms divins explicites et leurs majuscules, sans ajouter de titre christologique au texte source. | Q81, Q84, Q90 |
| Seigneur ; Éternel | Lord ; LORD dans l'allusion biblique | Señor ; Señor dans l'allusion biblique | Senhor ; SENHOR dans l'allusion biblique | Préserver le titre divin ; dans l'allusion au Psaume, suivre les conventions des éditions bibliques retenues. | Q98 ; barème 80–100 |
| prière | prayer | oración | oração | Désigner la pratique chrétienne de prière ; garder sa portée large sans la restreindre aux seules demandes. | Q83, Q93 |
| louer Dieu | praise God | alabar a Dios | louvar a Deus | Garder le sens de louange ; ne pas substituer automatiquement adoration, dont la portée peut être plus large. | Q88 |
| Parole de Dieu | Word of God | Palabra de Dios | Palavra de Deus | Conserver la majuscule de Parole ; ne pas introduire ici une identification explicite au Christ incarné. | Q86 |
| église ; maison de l'Éternel | church ; house of the LORD | iglesia ; casa del Señor | igreja ; casa do SENHOR | Conserver church pour église et la métaphore biblique pour maison ; ne pas fusionner leurs nuances. | Q98, Q100 |
| plénitude ; combler | fulfilment ; fulfil | plenitud ; llenar | plenitude ; preencher | Préserver le sentiment d'accomplissement intérieur sans ajouter une affirmation de perfection ou de salut acquis. | Q64, Q77 |

Les noms de fruits prennent la majuscule dans les titres ; dans les phrases, suivre l'usage naturel de chaque langue. `CHRISTOS` et `CHRISTOSMETRICS` restent inchangés.

## Conventions transversales imposées

Ces entrées sont réservées aux fruits suivants ; elles ne sont pas présentées comme présentes dans Joie.

| FR | EN | ES | PT-PT | Règle |
| --- | --- | --- | --- | --- |
| l'Esprit, au sens du Saint-Esprit | the Spirit | el Espíritu | o Espírito | Majuscule pour le référent divin ; jamais pour un simple état d'esprit humain. |
| Saint-Esprit / Esprit Saint | Holy Spirit | Espíritu Santo | Espírito Santo | Conserver la désignation trinitaire explicite. |
| fruit de l'Esprit | fruit of the Spirit | fruto del Espíritu | fruto do Espírito | Singulier collectif dans l'expression théologique ; distinguer le pluriel fonctionnel des tests ou catégories. |
| cheminement / parcours spirituel | spiritual journey | camino espiritual | caminho espiritual | Terme de référence ; walk with God seulement si le français évoque explicitement la marche avec Dieu. |
| point fort | strength | fortaleza | ponto forte | Formulation positive, sans jugement sur la valeur de la personne. |
| point à travailler | area to develop | aspecto por desarrollar | aspeto a desenvolver | Invitation au développement ; conserver l'intensité du conseil original. |
| domaine à grandir | area for growth | área de crecimiento | área de crescimento | Ne pas employer weakness ou ses équivalents pour cette formulation orientée croissance. |

À Q27, « un esprit reconnaissant » décrit une disposition humaine : **a grateful attitude / una actitud agradecida / uma atitude de gratidão**. Aucune majuscule trinitaire.

Allégresse, cœur, âme, cheminement, fidélité, communauté, assemblée, témoignage, repentance, conversion, miséricorde, bénédiction, méditation et contemplation ne figurent pas dans les textes extraits de Joie. « Rendre grâce » est présent, mais pas « la grâce » comme notion autonome. Ne pas leur inventer une occurrence.


### Arbitrages complémentaires validés

- Q69 : **inner harmony / armonía interior / harmonia interior**.
- Q99 : **I struggle to be content with what I have / Me cuesta contentarme con lo que tengo / Custa-me contentar-me com o que tenho**.
- Q98 : conserver naturellement **house of the LORD / casa del Señor / casa do SENHOR**, sans référence biblique ajoutée à l'énoncé.
- Les questions utilisent la première personne lorsque le français l'utilise. Les sujets « ma joie », « ma foi », etc., restent des sujets nominaux.
- ES : sujet personnel généralement implicite, vocabulaire pan-hispanique. PT : rédaction du Portugal, sujets souvent implicites, enclise et impératifs en tu. EN : anglais international, sans expression régionale marquée.

## Dix décisions délicates

| Nº | Passage | Choix retenu | Motif |
| --- | --- | --- | --- |
| 1 | Joie / heureux / bonheur (Q42, Q43, Q61, Q84) | Joy / alegría / alegria pour joie ; happy / feliz / feliz pour heureux et happiness / felicidad / felicidade pour bonheur. | Conserver les distinctions du français, sans transformer chaque sentiment heureux en terme théologique. |
| 2 | Q27 — esprit reconnaissant | A grateful attitude / una actitud agradecida / uma atitude de gratidão. | « Esprit » désigne une disposition humaine, sans désigner ici le Saint-Esprit. |
| 3 | Q69 — aligné intérieurement | I feel a sense of inner harmony. / Siento armonía interior. / Sinto harmonia interior. | Arbitrage de Momo : harmonie intérieure, sans ajout énergétique ni confusion avec la paix de Q62. |
| 4 | Q99 — me contenter | I struggle to be content with what I have. / Me cuesta contentarme con lo que tengo. / Custa-me contentar-me com o que tenho. | Formulations validées par Momo ; préserver le contentement évoqué par l'allusion à Philippiens 4:11. |
| 5 | Q98 — doute et maison de l'Éternel | I am unsure whether I feel joy when I am invited to go to the house of the LORD. / No tengo claro si siento alegría cuando me invitan a ir a la casa del Señor. / Não sei ao certo se sinto alegria quando me convidam a ir à casa do SENHOR. | Garder le doute de la question et l'allusion au Psaume 122:1 ; ne pas reprendre l'affirmation positive du psaume. |
| 6 | Q84 — prix à payer pour suivre Jésus | Whatever the cost / sin importar el precio que tenga que pagar / seja qual for o preço a pagar. | Coût personnel du fait de suivre Jésus, sans restriction financière ni ajout de martyre. |
| 7 | Q86 — Parole de Dieu | Word of God / Palabra de Dios / Palavra de Deus. | Garder la désignation et la majuscule ; ne préciser ni « Jésus » ni une pratique de lecture absente du français. |
| 8 | Q64 et Q77 — plénitude / combler | Fulfilment / fulfil me ; plenitud / me llene ; plenitude / me preencha. | Préserver l'accomplissement intérieur sans ajouter de conclusion sur le salut ou la perfection spirituelle. |
| 9 | Q34 et Q70 — formulations françaises inhabituelles | Q34 conserve « uniquement injustes » ; Q70 garde une joie sans déclencheur extérieur. | Rendre la phrase naturelle tout en conservant la restriction, sans attribuer à Dieu une origine non énoncée. |
| 10 | Les cinq barèmes | Alerte explicite au premier niveau, présence réelle mais inconstante au milieu, joie du Seigneur au dernier niveau. | Conserver la gradation et l'intensité sans atténuer l'alerte, ajouter un diagnostic, ou généraliser le titre Seigneur. |

## Relecture humaine utile

Les arbitrages Q69/Q99 sont intégrés et ne restent pas en attente.

- **Q98** : la formulation est volontairement hésitante. Une relecture éditoriale peut confirmer que cette hésitation, déjà présente dans le français, exprime bien l'intention de la méthode.
- **Q86** : la portée de « Parole de Dieu » reste volontairement ouverte, comme dans la source ; aucune interprétation christologique nouvelle n'est ajoutée.
- **Barèmes 0–19 et 80–100** : les traductions conservent la force pastorale des textes français. Toute modification de cette force devrait d'abord être validée sur la source, hors de ce lot.
- **EN, dimension 4** : « Intrapersonal joy / Intrapersonal » conserve le registre technique du titre français ; les questions de cette dimension restent en langue courante.
- **Genre grammatical** : le corpus français utilise parfois le masculin. Certaines formes masculines naturelles sont conservées en ES/PT (agradecido, satisfecho, grato, amado e aceite), sans ajouter de genre aux métadonnées.

## Signaux hors scope à investiguer

Le seed Joie contient **96 DIRECTE et 4 INVERSE**, ces dernières aux ids **36, 73, 94, 98**.

Plusieurs items formulés négativement restent pourtant DIRECTE, par exemple :

- Q12 : « Je perds facilement ma joie quand les choses tournent mal. »
- Q31 : « Les épreuves me font perdre toute joie. »
- Q71 : « Je me sens vide intérieurement. »
- Q92 : « Je ne ressens pas de joie dans ma foi. »

Ces contrastes constituent un **signal à faire examiner par l'auteur de la méthode**, sans conclure ici à une erreur de scoring. Les positions et la formulation peuvent dépendre du référentiel validé.

**Aucune polarité DIRECTE/INVERSE n'est modifiée. V2, V5, V9 et les autres migrations existantes restent intactes.** V10 écrit exclusivement dans les colonnes de traduction. Le champ d'archive `polarite` positive/negative reflète le mapping technique du seed ; il ne requalifie pas la tonalité linguistique des questions.

Autre point éditorial : « Joie intrapersonnel » et les ponctuations manquantes restent inchangés dans l'archive française. Les traductions sont grammaticales, sans correction de la source.

## Count check

| Langue | Questions | Dimensions | Libellés courts | Barèmes | Nom + référence | Total de champs |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| FR | 100 | 5 | 5 | 5 | 2 | 117 |
| EN | 100 | 5 | 5 | 5 | 2 | 117 |
| ES | 100 | 5 | 5 | 5 | 2 | 117 |
| PT | 100 | 5 | 5 | 5 | 2 | 117 |

Total : **351 traductions** ajoutées pour EN/ES/PT. Même structure JSON, mêmes ids et mêmes paramètres techniques dans les quatre langues.

## Migration et vérifications

- V10 comporte **111 UPDATE** : 1 référentiel, 5 dimensions, 100 questions et 5 tranches d'interprétation.
- Colonnes réelles : `nom_en/es/pt`, `verset_en/es/pt`, `libelle_en/es/pt`, `libelle_court_en/es/pt`, `texte_en/es/pt` dans questions et tranches_interpretation.
- Chaque UPDATE est limité à `code = 'joie'`, directement ou par EXISTS avec rattachement au référentiel. Les questions sont aussi ciblées par id, dimension et position ; les barèmes par position et bornes.
- Littéraux SQL UTF-8 ; apostrophes simples échappées par doublement. Les accents sont conservés.
- Validation sur une instance **PostgreSQL 17 réelle, temporaire et isolée**, sans connexion à la base du projet.
- V1 à V9 exécutées, puis V10 exécutée deux fois : **résultat identique**.
- Les **351 valeurs en base correspondent exactement aux JSON**.
- Comparaison avant/après : contenu français, polarités, paramètres techniques et tous les autres référentiels inchangés.
- Les traductions sont des textes originaux localisés ; aucune citation de verset complet n'est ajoutée aux questions.
- Backend : `mvn.cmd -B compile` avec Java 21 — **BUILD SUCCESS**.
- Frontend : `npm.cmd run build` — **OK**, aucune erreur TypeScript ; service worker et manifest régénérés.
- Assets principaux : JS 633,79 kB (gzip 235,43 kB) ; CSS 21,87 kB (gzip 5,33 kB). Avertissement Vite non bloquant sur le bundle supérieur à 500 kB.
- Contrôles JSON : structures et métadonnées identiques, FR=EN=ES=PT=100 questions, Q69/Q98/Q99 conformes aux arbitrages, aucun caractère de remplacement UTF-8.
- Statut Git final : les sept fichiers de livraison uniquement ; aucun changement des migrations existantes, du code applicatif ou des dépendances. Le JSON français et le glossaire, déjà non suivis avant cette étape, restent inclus dans cette livraison.
- Instance PostgreSQL temporaire arrêtée après vérification ; fichiers de contrôle dans `backend/target`, ignorés par Git. Aucune modification de la base du projet.
- Aucun commit ni push. Arrêt avant le fruit suivant.
