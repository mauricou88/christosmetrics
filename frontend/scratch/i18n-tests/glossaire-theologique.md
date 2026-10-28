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

## Extension autorisée du glossaire

## Enrichissements LOT 3 — appliqués à partir de Patience

| FR | EN | ES | PT-PT | Choix |
| --- | --- | --- | --- | --- |
| patience | patience | paciencia | paciência | Persévérance active ; ne pas remplacer automatiquement par passivité, longanimity ou forbearance. |
| persévérer ; persévérance | persevere ; perseverance | perseverar ; perseverancia | perseverar ; perseverança | Conserver l'effort durable, sans promettre un résultat immédiat. |
| maîtrise de soi | self-control | dominio propio | domínio próprio | Terme stable pour la régulation des réactions ; ne pas confondre avec domination d'autrui. |
| attente en Dieu ; attendre Dieu | waiting for God | espera en Dios ; esperar a Dios | espera em Deus ; esperar por Deus | Attente confiante du croyant ; aucune référence à une prétendue absence de Dieu. |
| timing de Dieu | God's timing | los tiempos de Dios | o tempo de Deus | Formulation naturelle dans chaque langue, sans calque du mot anglais en ES/PT. |
| rechute, dans la croissance personnelle | setback in one's progress | retroceso | retrocesso | Éviter un diagnostic médical ou une référence au péché non présents dans l'item. |
| injustice ; inéquité | injustice ; unfairness | injusticia ; falta de equidad | injustiça ; falta de equidade | Conserver les deux expressions ; patienter n'est pas traduit par approuver l'injustice. |

Ces ajouts s'appliquent à Patience et aux fruits suivants. Les fichiers Joie ne sont pas révisés rétroactivement.

## Enrichissements LOT 3 — appliqués à partir d'Amour

| FR | EN | ES | PT-PT | Choix |
| --- | --- | --- | --- | --- |
| amour | love | amor | amor | Jamais charity en anglais contemporain ; ne pas ajouter « divin » à chaque item. |
| compassion | compassion | compasión | compaixão | Distinguer sensibilité à la souffrance et simple pitié distante. |
| grâce, disposition envers autrui | grace | gracia | graça | Contexte de pardon et faveur non méritée ; ne pas confondre avec élégance ou humour. |
| miséricorde | mercy | misericordia | misericórdia | Garder la nuance de compassion envers la faute ou la fragilité. |
| pardonner ; pardon | forgive ; forgiveness | perdonar ; perdón | perdoar ; perdão | Ne pas confondre pardon, oubli et absence de responsabilité. |
| orgueil ; humilité | pride ; humility | orgullo ; humildad | orgulho ; humildade | Pride désigne ici la supériorité, non la satisfaction légitime d'une réussite. |
| intégrité ; intègre | integrity ; acting with integrity | integridad ; íntegro | integridade ; íntegro | Cohérence éthique de la conduite, et non intégrité physique. |
| crainte, dans les items psychologiques | fear | temor / miedo | medo / receio | Ne pas introduire le sens de révérence devant Dieu absent de ces questions. |

Les titres du référentiel Amour restent des reformulations de la méthode, pas des citations certifiées NIV/NVI/ARA. Le titre « ne soupçonne pas le mal » reste centré sur la suspicion, conformément aux items. « Excuse tout » est rendu en EN par « Love is always forgiving » dans le contexte du pardon. Ces choix n'autorisent ni la dissimulation d'un tort ni sa justification.

## Enrichissements LOT 3 — appliqués à partir de Bonté & Bienveillance

| FR | EN | ES | PT-PT | Choix |
| --- | --- | --- | --- | --- |
| Bonté & Bienveillance, nom du référentiel | Kindness & Goodness | Bondad y Benevolencia | Bondade e Benevolência | Noms validés par Momo ; préserver les deux concepts. |
| Bonté (Chrestotes), dimension d'intention | Kindness (Chrestotes) | Bondad (Chrestotes) | Bondade (Chrestotes) | Conserver la translittération du seed comme repère de la méthode. |
| Bienveillance (Agathousune), dimension d'action | Goodness (Agathousune) | Benevolencia (Agathousune) | Benevolência (Agathousune) | Dimension d'action ; ne pas fusionner avec la disposition intérieure. |
| douceur, intention ou réaction | gentleness | delicadeza | delicadeza | Pour l'intention relationnelle ; ne pas transformer en faiblesse ou effacement. |
| reprendre quelqu'un pour son bien | correct someone for their good | corregir a alguien por su bien | corrigir alguém para seu bem | Reprendre signifie corriger ici, pas récupérer une personne ou lui reprendre un bien. |
| s'égarer | go astray | desviarse | desviar-se | Ne pas ajouter un diagnostic de péché ou une rupture religieuse absents du français. |

Les noms de référentiel validés ne prétendent pas être les mots d'une citation canonique de Galates 5:22. Si un verset complet est cité ultérieurement, suivre l'édition biblique correspondante. Aucun verset complet n'est ajouté dans ce lot.

## Enrichissements LOT 3 — appliqués à partir de Fidélité

| FR | EN | ES | PT-PT | Choix |
| --- | --- | --- | --- | --- |
| fidélité, fruit | faithfulness | fidelidad | fidelidade | Ne pas réduire le nom du fruit à loyalty ; foi reste faith / fe / fé. |
| loyauté, dimension relationnelle | loyalty | lealtad | lealdade | Conserver le terme propre à la dimension sans le substituer au nom du fruit. |
| intendance | stewardship | administración responsable | gestão responsável | Responsabilité des ressources confiées ; éviter une lecture hôtelière ou le sens de privilèges de mordomia. |
| vœux ; promesses | vows ; promises | votos ; promesas | votos ; promessas | Vœu signifie engagement solennel, pas souhait ou vote électoral. |
| rendre témoignage, fiabilité attestée | say someone is trustworthy | dar testimonio de que alguien es digno de confianza | dar testemunho de que alguém é digno de confiança | Q328 parle de la réputation de fiabilité, sans ajouter un récit de conversion. |
| constance | consistency | constancia | constância | Stabilité dans le temps, sans réduire la fidélité aux seuls sentiments. |

## Enrichissements LOT 3 — appliqués à partir de Paix

| FR | EN | ES | PT-PT | Choix |
| --- | --- | --- | --- | --- |
| paix | peace | paz | paz | État intérieur et relationnel ; ne pas réduire le concept à l'absence de dispute. |
| culpabilité | guilt | culpa | culpa | Ressenti décrit ; ne pas transformer en constat de culpabilité divine. |
| péché non traité | unaddressed sin | pecado no abordado | pecado não tratado | Conserver le titre théologique sans inventer de pratique sacramentelle ou de procédure de guérison. |
| condamnation intérieure | inner condemnation | condena interior | condenação interior | Ne pas ajouter « par Dieu » ni confondre avec une décision judiciaire. |
| lâcher prise | let go | soltar | deixar ir | Dans ce corpus, desserrer le contrôle ; ne pas substituer passivité ou abandon de toute responsabilité. |
| ruminer | dwell on | dar vueltas a | remoer | Pensées répétitives, sans diagnostic médical ajouté. |
| regard des autres | how others see me / others' opinions | la mirada de los demás | o olhar dos outros | Perception sociale ; non regard visuel au sens littéral. |

Shalom n'apparaît pas dans le seed Paix : aucun mot hébreu ni développement doctrinal n'est inséré dans les questions.

## Enrichissements LOT 3 — appliqués à partir de CHRISTOS Couple

| FR | EN | ES | PT-PT | Choix |
| --- | --- | --- | --- | --- |
| couple | couple | pareja | casal | Unité relationnelle, sans transformer l'affirmation en question individuelle. |
| conjoint | spouse | cónyuge | cônjuge | Conserver le vocabulaire conjugal neutre, sans imposer de sexe au partenaire. |
| amour sacrificiel ; se livrer | sacrificial love ; offer oneself | amor sacrificial ; entregarse | amor sacrificial ; entregar-se | Don de soi ; ne pas ajouter une idée de coercition ou supprimer le sacrifice. |
| douceur, nom du fruit | gentleness | mansedumbre | mansidão | Nom du fruit dans la méthode ; distinct de la délicatesse d'une attitude locale. |
| caractère de Christ | Christ's character | carácter de Cristo | caráter de Cristo | Traits manifestés dans les interactions, non apparence physique. |
| restauration profonde | deep restoration | restauración profunda | restauração profunda | Conserver l'intensité pastorale sans ajouter de diagnostic ou de promesse de guérison. |

Les neuf affirmations françaises sont rédigées à la troisième personne ou à la forme passive, sans pronom « nous ». Cette perspective collective est conservée ; aucun « je » individuel ni « nous » absent de la source n'est inventé. Communion conjugale n'apparaît pas dans le seed Couple et n'est pas ajoutée.

Le glossaire et les arbitrages Q69/Q99 ont été validés pour Joie. Le LOT 3 autorise l'enrichissement progressif et l'enchaînement des six référentiels sans validation intermédiaire. Arrêt avant commit ; aucune application rétroactive des enrichissements aux fruits précédents.
