# Glossaire théologique — pilote Joie

Statut : validé par Momo, avec les arbitrages Q69 et Q99 intégrés ci-dessous.

## Corpus et traçabilité

- Source française : `backend/src/main/resources/db/migration/V2__seed_fruits.sql`, référentiel `joie`, id 1.
- Barèmes : `V5__baremes_interpretation_poc.sql`, table réelle `tranches_interpretation`.
- Extraction : `joie_fr.json` ; 5 dimensions, 5 libellés courts, 100 questions, 5 interprétations, 1 nom et 1 référence biblique : **117 champs textuels**.
- Aucun champ description en base : `fruit.description` vaut `null`, sans texte inventé.
- Les codes `joie-d1` à `joie-d5` sont des repères d'archive dérivés des ids. Ils ne sont pas des codes existants en base.
- Les ids, positions, seuils et textes français sont conservés, y compris ponctuation et coquilles.
- `polariteSource` conserve exactement `DIRECTE` / `INVERSE`. Le champ demandé `polarite` applique uniquement `DIRECTE` → `positive`, `INVERSE` → `negative` : il décrit le sens du scoring, pas la tonalité de la phrase.
- Le seed contient 96 questions DIRECTE et 4 INVERSE (Q36, Q73, Q94, Q98). Plusieurs formulations négatives restent DIRECTE, notamment Q12 et Q31. Ce constat ne déclenche aucune correction de scoring dans ce lot de traduction.

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

## Registre et conventions linguistiques

- EN international : première personne `I` lorsque le sujet français est « je » ; formulation sobre, sans idiome régional marqué. Choix éditorial `fulfilment`, compris internationalement.
- ES neutre : première personne, avec sujet `yo` implicite lorsque naturel ; pas de vocabulaire limité à une région.
- PT-PT : première personne `eu`, éventuellement implicite ; interpellations en `tu` ou impératifs de deuxième personne, jamais `você`. L'ARA est un repère pour les allusions bibliques, pas un modèle de toutes les tournures du questionnaire.
- Préserver aussi les sujets réels autres que « je » : « ma joie », « mon humeur », « les épreuves ». Ne pas réécrire artificiellement chaque question en « I feel ».
- Ne pas ajouter « spirituel », « en Dieu », « par l'Esprit » ou un diagnostic moral lorsque le français ne les contient pas.
- Conserver les négations, restrictions (`seulement`, `uniquement`, `peu`), intensités et fréquences. Une formulation négative reste négative, quelle que soit sa polarité technique.
- Les barèmes restent distincts des questions : conseils adressés au lecteur et registre professionnel. Ne pas adoucir une alerte du français ni l'aggraver en diagnostic spirituel.

## Décisions délicates proposées à Momo

1. **Joie / bonheur (Q42–43, Q61, Q84).** Réserver joy / alegría / alegria à joie ; garder happy / feliz / feliz pour heureux. La différence française reste perceptible, sans qualifier le bonheur d'hédoniste.
2. **Q27, « esprit reconnaissant ».** Employer le vocabulaire de l'attitude reconnaissante ; aucune référence au Saint-Esprit n'est ajoutée.
3. **Q98, « maison de l'Eternel ».** Allusion probable au Psaume 122:1, non citation exacte. Conserver la maison du Seigneur plutôt que remplacer par « aller à l'église ». Garder la réserve et le doute de la question, sans restituer une affirmation joyeuse du psaume.
4. **Q99, « ne pas pouvoir me contenter ».** Arbitrage validé : « I struggle to be content with what I have » / « Me cuesta contentarme con lo que tengo » / « Custa-me contentar-me com o que tenho ». Préserver le contentement et l'allusion à Philippiens 4:11 ; ne pas ajouter de référence au verset dans l'énoncé.
5. **Q69, « aligné intérieurement ».** Arbitrage validé : inner harmony / armonía interior / harmonia interior. Aucun vocabulaire énergétique ni assimilation automatique à la paix de Q62.
6. **Q84, « qu'importe le prix à payer ».** Conserver la disposition à suivre Jésus malgré le coût personnel ; ne pas réduire le prix à une somme d'argent et ne pas ajouter la notion de martyre.
7. **Q86, « Parole de Dieu ».** Conserver la désignation biblique. Ne pas préciser « Jésus » ou « lecture de la Bible » lorsque le questionnaire ne tranche pas lui-même.
8. **Q64 et Q77, plénitude / combler.** Comprendre l'accomplissement intérieur ; ne pas convertir ces items psychologiques en affirmation sur le salut ou la perfection spirituelle.
9. **Barèmes.** Garder les cinq niveaux et leur force respective, notamment l'alerte 0–19 et l'exhortation finale 80–100. Le barème parle de « joie du Seigneur » seulement au niveau supérieur : ne pas étendre cette précision aux autres niveaux.
10. **Source française.** Conserver dans l'archive « Joie intrapersonnel », les ponctuations manquantes et les tournures inhabituelles (Q34, Q98). Les traductions seront grammaticales et naturelles sans corriger le français ni changer les intentions de mesure.

## Références vérifiées

- [Galatians 5:22 — NIV](https://www.biblegateway.com/passage/?search=Galatians%205%3A22&version=NIV) : famille joy, Spirit et singulier fruit.
- [Gálatas 5:22 — NVI](https://www.biblegateway.com/passage/?search=G%C3%A1latas%205%3A22&version=NVI) : alegría et fruto del Espíritu.
- [Psalm 122:1 — NIV](https://www.biblegateway.com/passage/?search=Psalm%20122%3A1&version=NIV) : repère pour l'allusion à la maison du Seigneur.
- [Salmos 122:1 — NVI](https://www.biblegateway.com/verse/es/Salmos%20122%3A1) : casa del Señor.
- [Salmos 122:1 — ARA](https://www.bible.com/pt/bible/1608/PSA.122.1.ARA) : Casa do SENHOR.

Les questionnaires sont des textes originaux à localiser. Ces références servent au vocabulaire biblique et aux allusions, sans transformer les questions en citations canoniques.

## Point d'arrêt

Le glossaire et les arbitrages Q69/Q99 sont validés. Les étapes 5–7 et les builds sont autorisés ; arrêt avant commit et avant le fruit suivant.
