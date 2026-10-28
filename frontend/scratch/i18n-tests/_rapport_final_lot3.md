# LOT 3 — rapport final consolidé

## Résultat
Les cinq fruits individuels restants et le module Couple sont traduits en EN international, ES pan-hispanique et PT du Portugal.

Le seed réel contient **200 questions de Patience et 280 d'Amour**, plutôt que les 100 + 100 du dernier prompt. Les corpus complets ont été traités : **868 questions par langue**, soit **2 604 énoncés traduits**. Avec noms, références, dimensions longues/courtes et barèmes : **3 021 traductions**.

Les six migrations comptent **952 UPDATE multilingues**, et non un UPDATE par champ : chaque UPDATE renseigne les trois langues. Avec Joie, l'ensemble couvre 968 questions par langue et 3 372 champs traduits.

Aucun service de traduction automatique utilisé. Aucun code applicatif, dépendance, configuration ou migration existante modifié. Aucune polarité DIRECTE/INVERSE, aucun seuil, identifiant ou texte français modifié. Joie reste inchangé ; le glossaire vivant est enrichi sans révision rétroactive des fruits précédents.

## Tableau de livraison
| Référentiel | FR | EN | ES | PT | Dimensions | Barèmes | Migration | UPDATE | Champs traduits | Statut |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | --- | ---: | ---: | --- |
| patience | 200 | 200 | 200 | 200 | 10 | 5 | V11 | 216 | 681 | OK |
| amour | 280 | 280 | 280 | 280 | 14 | 5 | V12 | 300 | 945 | OK |
| bonte | 100 | 100 | 100 | 100 | 2 | 5 | V13 | 108 | 333 | OK |
| fidelite | 120 | 120 | 120 | 120 | 6 | 5 | V14 | 132 | 417 | OK |
| paix | 159 | 159 | 159 | 159 | 8 | 5 | V15 | 173 | 546 | OK |
| couple | 9 | 9 | 9 | 9 | 9 | 4 | V16 | 23 | 99 | OK |

Chaque référentiel possède quatre JSON de même structure. Les descriptions absentes restent à null. Les codes de dimension d'archive sont dérivés des ids et ne remplacent pas les clés SQL réelles.

## Builds et vérifications
| Référentiel | Maven compile Java 21 | PostgreSQL 17 | Deux exécutions identiques | JSON exacts en base | Source/autres fruits intacts | Git contrôlé |
| --- | --- | --- | --- | --- | --- | --- |
| patience | OK | OK | OK | OK | OK | OK |
| amour | OK | OK | OK | OK | OK | OK |
| bonte | OK | OK | OK | OK | OK | OK |
| fidelite | OK | OK | OK | OK | OK | OK |
| paix | OK | OK | OK | OK | OK | OK |
| couple | OK | OK | OK | OK | OK | OK |

- Une base temporaire séparée a été utilisée pour chaque migration, après chargement de toutes les versions précédentes.
- PostgreSQL a vérifié l'ensemble des valeurs traduites, les accents, apostrophes, titres et barèmes. Chaque migration a été exécutée deux fois et les quatre tables comparées intégralement.
- La base de test du dernier fruit charge la chaîne **V1–V16** ; toutes les migrations SQL sont donc exécutables sur PostgreSQL réel.
- La comparaison avant/après exclut uniquement les nouvelles colonnes de traduction du fruit courant. Tous les autres champs et référentiels doivent rester identiques.
- Contrôle JSON indépendant : même arbre, mêmes ids/positions/rattachements/polarités/seuils/icônes ; champs de contenu non vides ; pas de caractère de remplacement UTF-8 ; aucun você en PT.
- Les UPDATE sont limités au code du fruit, directement ou par EXISTS. Les ids, dimensions et positions ciblent les questions ; positions et bornes ciblent les barèmes.
- Build frontend final : **npm.cmd run build OK**, aucune erreur TypeScript. Service worker et manifest PWA régénérés.
- Assets principaux : **JS 633,79 kB, gzip 235,43 kB ; CSS 21,87 kB, gzip 5,33 kB**. Avertissement Vite non bloquant au-delà de 500 kB.
- Les archives scratch ne sont pas importées dans le bundle. Les migrations constituent le contenu destiné au backend.
- Aucun test de rendu sur appareil ni revue humaine native supplémentaire ne sont revendiqués.
- Instance PostgreSQL temporaire arrêtée. Les fichiers de contrôle restent sous backend/target, ignorés par Git. La base du projet et la production n'ont pas été utilisées.

## Signaux de scoring hors scope, agrégés
Ces signalements sont des **contrastes apparents entre sens linguistique et polarité technique**, à auditer avec l'auteur de la méthode. Ils ne constituent pas une correction ni une validation psychométrique. La sélection n'est pas exhaustive ; chaque JSON FR expose aussi les polarités de toutes les questions.

| Référentiel | DIRECTE | INVERSE | IDs signalés pour audit |
| --- | ---: | ---: | --- |
| patience | 100 | 100 | 763, 786, 806, 807, 824, 832, 833, 834, 836, 864, 878, 884, 897, 901, 905, 909, 912, 919, 951 |
| amour | 249 | 31 | 490, 511, 561, 567, 593, 630, 650, 690, 711, 741, 752, 754, 759 |
| bonte | 88 | 12 | 389, 392, 398, 400, 402, 405, 406, 410, 421, 425, 426, 455, 456, 465, 469 |
| fidelite | 116 | 4 | 270, 271, 273, 274, 279, 290, 292, 293, 310, 311, 313, 331, 333, 339, 351, 359, 370, 379 |
| paix | 149 | 10 | 101, 103, 104, 109, 118, 121, 130, 141, 161, 181, 183, 200, 212, 234, 240, 243 |
| couple | 9 | 0 | Aucun contraste manifeste relevé |

### patience

| ID | Énoncé français conservé | Polarité conservée |
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

### amour

| ID | Énoncé français conservé | Polarité conservée |
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

### bonte

| ID | Énoncé français conservé | Polarité conservée |
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

### fidelite

| ID | Énoncé français conservé | Polarité conservée |
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

### paix

| ID | Énoncé français conservé | Polarité conservée |
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

### Autres signaux éditoriaux
- Patience : formulations sur la souffrance et l'injustice maintenues, sans transformer l'évaluation en conseil donné à une personne en situation réelle.
- Amour Q702 : « couvre les erreurs des autres » reste une formulation à relire éditorialement ; aucune glosse légitimant un tort ou sa dissimulation n'est ajoutée.
- Bonté Q400 : item de découragement dans les difficultés, atypique dans cette dimension ; rattachement conservé.
- Paix Q118 : négations françaises fautives conservées dans FR, sens traduit comme l'impossibilité de cesser de s'inquiéter. Q212 reste négatif au milieu d'une série positive. Dimension culpabilité : 19 questions, sans ajout.
- Couple : le seed est à la troisième personne/passif, sans « nous ». Perspective du couple conservée, sans passage au « je » individuel.

## Glossaire consolidé final
Base Joie validée et ajouts par fruit. Les ajouts s'appliquent à partir du fruit indiqué, sans réécriture rétroactive.

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


## Fichiers attendus et statut Git final
**38 fichiers : 37 nouveaux et 1 modifié.** Six migrations, 24 JSON, six rapports individuels, un rapport final et le glossaire vivant.

```text
 M frontend/scratch/i18n-tests/glossaire-theologique.md
?? backend/src/main/resources/db/migration/V11__i18n_patience.sql
?? backend/src/main/resources/db/migration/V12__i18n_amour.sql
?? backend/src/main/resources/db/migration/V13__i18n_bonte.sql
?? backend/src/main/resources/db/migration/V14__i18n_fidelite.sql
?? backend/src/main/resources/db/migration/V15__i18n_paix.sql
?? backend/src/main/resources/db/migration/V16__i18n_couple.sql
?? frontend/scratch/i18n-tests/patience_fr.json
?? frontend/scratch/i18n-tests/patience_en.json
?? frontend/scratch/i18n-tests/patience_es.json
?? frontend/scratch/i18n-tests/patience_pt.json
?? frontend/scratch/i18n-tests/amour_fr.json
?? frontend/scratch/i18n-tests/amour_en.json
?? frontend/scratch/i18n-tests/amour_es.json
?? frontend/scratch/i18n-tests/amour_pt.json
?? frontend/scratch/i18n-tests/bonte_fr.json
?? frontend/scratch/i18n-tests/bonte_en.json
?? frontend/scratch/i18n-tests/bonte_es.json
?? frontend/scratch/i18n-tests/bonte_pt.json
?? frontend/scratch/i18n-tests/fidelite_fr.json
?? frontend/scratch/i18n-tests/fidelite_en.json
?? frontend/scratch/i18n-tests/fidelite_es.json
?? frontend/scratch/i18n-tests/fidelite_pt.json
?? frontend/scratch/i18n-tests/paix_fr.json
?? frontend/scratch/i18n-tests/paix_en.json
?? frontend/scratch/i18n-tests/paix_es.json
?? frontend/scratch/i18n-tests/paix_pt.json
?? frontend/scratch/i18n-tests/couple_fr.json
?? frontend/scratch/i18n-tests/couple_en.json
?? frontend/scratch/i18n-tests/couple_es.json
?? frontend/scratch/i18n-tests/couple_pt.json
?? frontend/scratch/i18n-tests/patience_rapport.md
?? frontend/scratch/i18n-tests/amour_rapport.md
?? frontend/scratch/i18n-tests/bonte_rapport.md
?? frontend/scratch/i18n-tests/fidelite_rapport.md
?? frontend/scratch/i18n-tests/paix_rapport.md
?? frontend/scratch/i18n-tests/couple_rapport.md
?? frontend/scratch/i18n-tests/_rapport_final_lot3.md
```

Aucun node_modules, dist, target ou .env dans le statut Git. Aucun fichier du LOT 1 ni du pilote Joie modifié, hormis le glossaire explicitement autorisé.

## Arrêt
Prêt pour la revue et le commit de Momo. Aucun commit, push ou déploiement effectué.
