-- bonte : traductions EN / ES / PT. UTF-8.
-- Aucun texte francais, polarite, seuil ou identifiant modifie.
-- UPDATE deterministes limites au referentiel bonte.

UPDATE referentiels
SET nom_en = 'Kindness & Goodness',
    verset_en = 'Galatians 5:22',
    nom_es = 'Bondad y Benevolencia',
    verset_es = 'Gálatas 5:22',
    nom_pt = 'Bondade e Benevolência',
    verset_pt = 'Gálatas 5:22'
WHERE code = 'bonte' AND id = 4;

UPDATE dimensions
SET libelle_en = 'Kindness (Chrestotes)',
    libelle_court_en = 'Kindness (intention)',
    libelle_es = 'Bondad (Chrestotes)',
    libelle_court_es = 'Bondad (intención)',
    libelle_pt = 'Bondade (Chrestotes)',
    libelle_court_pt = 'Bondade (intenção)'
WHERE id = 20 AND position = 0 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = dimensions.referentiel_id AND r.code = 'bonte');

UPDATE dimensions
SET libelle_en = 'Goodness (Agathousune)',
    libelle_court_en = 'Goodness (action)',
    libelle_es = 'Benevolencia (Agathousune)',
    libelle_court_es = 'Benevolencia (acción)',
    libelle_pt = 'Benevolência (Agathousune)',
    libelle_court_pt = 'Benevolência (ação)'
WHERE id = 21 AND position = 1 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = dimensions.referentiel_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I naturally feel compassion for others.',
    texte_es = 'Siento compasión por los demás de forma natural.',
    texte_pt = 'Sinto naturalmente compaixão pelos outros.'
WHERE id = 380 AND dimension_id = 20 AND position = 0 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'Other people''s suffering touches me.',
    texte_es = 'Me conmueve el sufrimiento de los demás.',
    texte_pt = 'O sofrimento dos outros toca-me.'
WHERE id = 381 AND dimension_id = 20 AND position = 1 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'Deep down, I seek to do good.',
    texte_es = 'En mi interior busco hacer el bien.',
    texte_pt = 'No meu íntimo, procuro fazer o bem.'
WHERE id = 382 AND dimension_id = 20 AND position = 2 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I feel gentleness in my intentions.',
    texte_es = 'Siento delicadeza en mis intenciones.',
    texte_pt = 'Sinto delicadeza nas minhas intenções.'
WHERE id = 383 AND dimension_id = 20 AND position = 3 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I spontaneously think of others'' wellbeing.',
    texte_es = 'Pienso espontáneamente en el bien de los demás.',
    texte_pt = 'Penso espontaneamente no bem dos outros.'
WHERE id = 384 AND dimension_id = 20 AND position = 4 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'My thoughts are kind, even towards people I dislike.',
    texte_es = 'Mis pensamientos son benevolentes, incluso hacia quienes no me agradan.',
    texte_pt = 'Tenho pensamentos benevolentes, mesmo em relação a pessoas de quem não gosto.'
WHERE id = 385 AND dimension_id = 20 AND position = 5 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I do not harbour bad intentions.',
    texte_es = 'No albergo malas intenciones.',
    texte_pt = 'Não alimento más intenções.'
WHERE id = 386 AND dimension_id = 20 AND position = 6 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I feel empathy in the face of difficulties.',
    texte_es = 'Siento empatía ante las dificultades.',
    texte_pt = 'Sinto empatia perante as dificuldades.'
WHERE id = 387 AND dimension_id = 20 AND position = 7 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I am naturally inclined to kindness.',
    texte_es = 'Tengo una inclinación natural a la amabilidad.',
    texte_pt = 'Sou naturalmente inclinado à amabilidade.'
WHERE id = 388 AND dimension_id = 20 AND position = 8 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I seek to understand before judging.',
    texte_es = 'Busco comprender antes de juzgar.',
    texte_pt = 'Procuro compreender antes de julgar.'
WHERE id = 389 AND dimension_id = 20 AND position = 9 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I feel compassion even for someone who has hurt me.',
    texte_es = 'Siento compasión incluso por alguien que me ha herido.',
    texte_pt = 'Sinto compaixão mesmo por alguém que me magoou.'
WHERE id = 390 AND dimension_id = 20 AND position = 10 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'My inner reactions are gentle.',
    texte_es = 'Mis reacciones interiores son delicadas.',
    texte_pt = 'As minhas reações interiores são delicadas.'
WHERE id = 391 AND dimension_id = 20 AND position = 11 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I do not wish harm on others, even when angry.',
    texte_es = 'No deseo el mal a los demás, ni siquiera cuando estoy enfadado.',
    texte_pt = 'Não desejo mal aos outros, mesmo quando estou zangado.'
WHERE id = 392 AND dimension_id = 20 AND position = 12 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I am sensitive to others'' emotions.',
    texte_es = 'Soy sensible a las emociones de los demás.',
    texte_pt = 'Sou sensível às emoções dos outros.'
WHERE id = 393 AND dimension_id = 20 AND position = 13 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I feel a sincere desire within me to help.',
    texte_es = 'Siento un deseo interior sincero de ayudar.',
    texte_pt = 'Sinto um desejo interior sincero de ajudar.'
WHERE id = 394 AND dimension_id = 20 AND position = 14 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I am forgiving in my thoughts.',
    texte_es = 'Soy indulgente en mis pensamientos.',
    texte_pt = 'Sou indulgente nos meus pensamentos.'
WHERE id = 395 AND dimension_id = 20 AND position = 15 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I maintain an inner attitude of goodwill towards others.',
    texte_es = 'Mantengo una buena disposición interior hacia los demás.',
    texte_pt = 'Mantenho uma boa disposição interior para com os outros.'
WHERE id = 396 AND dimension_id = 20 AND position = 16 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'My first instinct is to think positively of others.',
    texte_es = 'Mi primera inclinación es pensar bien de los demás.',
    texte_pt = 'A minha primeira inclinação é pensar bem dos outros.'
WHERE id = 397 AND dimension_id = 20 AND position = 17 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I tend not to harbour bitterness inside.',
    texte_es = 'Tiendo a no alimentar amargura en mi interior.',
    texte_pt = 'Tendo a não alimentar amargura interior.'
WHERE id = 398 AND dimension_id = 20 AND position = 18 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I retain a good opinion of others even in conflict.',
    texte_es = 'Conservo una buena opinión de los demás incluso en los conflictos.',
    texte_pt = 'Mantenho uma boa consideração pelos outros mesmo em conflito.'
WHERE id = 399 AND dimension_id = 20 AND position = 19 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'When difficulties persist, I quickly become discouraged.',
    texte_es = 'Cuando las dificultades se prolongan, me desanimo rápidamente.',
    texte_pt = 'Quando as dificuldades se prolongam, desanimo depressa.'
WHERE id = 400 AND dimension_id = 20 AND position = 20 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I sincerely wish others well.',
    texte_es = 'Deseo sinceramente el bien de los demás.',
    texte_pt = 'Desejo sinceramente o bem dos outros.'
WHERE id = 401 AND dimension_id = 20 AND position = 21 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I am slow to judge others.',
    texte_es = 'No me apresuro a juzgar a los demás.',
    texte_pt = 'Não me apresso a julgar os outros.'
WHERE id = 402 AND dimension_id = 20 AND position = 22 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I am touched by the injustices others suffer.',
    texte_es = 'Me conmueven las injusticias que sufren los demás.',
    texte_pt = 'Tocam-me as injustiças sofridas pelos outros.'
WHERE id = 403 AND dimension_id = 20 AND position = 23 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I maintain kind thoughts over time.',
    texte_es = 'Mantengo pensamientos benevolentes a lo largo del tiempo.',
    texte_pt = 'Mantenho pensamentos benevolentes ao longo do tempo.'
WHERE id = 404 AND dimension_id = 20 AND position = 24 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I easily harbour negative thoughts about others.',
    texte_es = 'Alimento fácilmente pensamientos negativos hacia los demás.',
    texte_pt = 'Alimento facilmente pensamentos negativos em relação aos outros.'
WHERE id = 405 AND dimension_id = 20 AND position = 25 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I lack compassion in the face of suffering.',
    texte_es = 'Me falta compasión ante el sufrimiento.',
    texte_pt = 'Falta-me compaixão perante o sofrimento.'
WHERE id = 406 AND dimension_id = 20 AND position = 26 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I am harsh in my thoughts.',
    texte_es = 'Soy duro en mis pensamientos.',
    texte_pt = 'Sou duro nos meus pensamentos.'
WHERE id = 407 AND dimension_id = 20 AND position = 27 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I judge quickly without trying to understand.',
    texte_es = 'Juzgo rápidamente sin intentar comprender.',
    texte_pt = 'Julgo depressa sem procurar compreender.'
WHERE id = 408 AND dimension_id = 20 AND position = 28 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I am indifferent to others'' difficulties.',
    texte_es = 'Soy indiferente a las dificultades de los demás.',
    texte_pt = 'Sou indiferente às dificuldades dos outros.'
WHERE id = 409 AND dimension_id = 20 AND position = 29 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I lack empathy.',
    texte_es = 'Me falta empatía.',
    texte_pt = 'Falta-me empatia.'
WHERE id = 410 AND dimension_id = 20 AND position = 30 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I hold on to critical or harsh thoughts.',
    texte_es = 'Mantengo pensamientos críticos o duros.',
    texte_pt = 'Mantenho pensamentos críticos ou duros.'
WHERE id = 411 AND dimension_id = 20 AND position = 31 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I am cold inside.',
    texte_es = 'Soy frío por dentro.',
    texte_pt = 'Sou frio por dentro.'
WHERE id = 412 AND dimension_id = 20 AND position = 32 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I lack gentleness in my intentions.',
    texte_es = 'Me falta delicadeza en mis intenciones.',
    texte_pt = 'Falta-me delicadeza nas minhas intenções.'
WHERE id = 413 AND dimension_id = 20 AND position = 33 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I am severe in my judgements.',
    texte_es = 'Soy severo en mis juicios.',
    texte_pt = 'Sou severo nos meus julgamentos.'
WHERE id = 414 AND dimension_id = 20 AND position = 34 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I feel little compassion for others.',
    texte_es = 'Siento poca compasión por los demás.',
    texte_pt = 'Sinto pouca compaixão pelos outros.'
WHERE id = 415 AND dimension_id = 20 AND position = 35 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I am harsh towards those who fail.',
    texte_es = 'Soy duro con quienes fracasan.',
    texte_pt = 'Sou duro com quem falha.'
WHERE id = 416 AND dimension_id = 20 AND position = 36 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I lack inner kindness.',
    texte_es = 'Me falta bondad interior.',
    texte_pt = 'Falta-me bondade interior.'
WHERE id = 417 AND dimension_id = 20 AND position = 37 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I easily criticise others in my thoughts.',
    texte_es = 'Critico fácilmente a los demás en mis pensamientos.',
    texte_pt = 'Critico facilmente os outros nos meus pensamentos.'
WHERE id = 418 AND dimension_id = 20 AND position = 38 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I hold grudges for a long time.',
    texte_es = 'Guardo rencor durante mucho tiempo.',
    texte_pt = 'Guardo rancor durante muito tempo.'
WHERE id = 419 AND dimension_id = 20 AND position = 39 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I am not very sensitive to others'' needs.',
    texte_es = 'Soy poco sensible a las necesidades de los demás.',
    texte_pt = 'Sou pouco sensível às necessidades dos outros.'
WHERE id = 420 AND dimension_id = 20 AND position = 40 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I lack mercy.',
    texte_es = 'Me falta misericordia.',
    texte_pt = 'Falta-me misericórdia.'
WHERE id = 421 AND dimension_id = 20 AND position = 41 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I am emotionally closed off.',
    texte_es = 'Estoy cerrado emocionalmente.',
    texte_pt = 'Estou fechado emocionalmente.'
WHERE id = 422 AND dimension_id = 20 AND position = 42 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I easily think ill of others.',
    texte_es = 'Pienso mal de los demás con facilidad.',
    texte_pt = 'Penso mal dos outros com facilidade.'
WHERE id = 423 AND dimension_id = 20 AND position = 43 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'My thoughts are harsh when mistakes occur.',
    texte_es = 'Mis pensamientos son duros ante los errores.',
    texte_pt = 'Os meus pensamentos são duros perante os erros.'
WHERE id = 424 AND dimension_id = 20 AND position = 44 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I lack inner patience towards others.',
    texte_es = 'Me falta paciencia interior con los demás.',
    texte_pt = 'Falta-me paciência interior para com os outros.'
WHERE id = 425 AND dimension_id = 20 AND position = 45 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I sometimes rejoice in others'' failures.',
    texte_es = 'A veces me alegro de los fracasos de los demás.',
    texte_pt = 'Por vezes alegro-me com os fracassos dos outros.'
WHERE id = 426 AND dimension_id = 20 AND position = 46 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I am indifferent to injustices others suffer.',
    texte_es = 'Soy indiferente a las injusticias que sufren los demás.',
    texte_pt = 'Sou indiferente às injustiças sofridas pelos outros.'
WHERE id = 427 AND dimension_id = 20 AND position = 47 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I hold on to persistent negative thoughts.',
    texte_es = 'Mantengo pensamientos negativos persistentes.',
    texte_pt = 'Mantenho pensamentos negativos persistentes.'
WHERE id = 428 AND dimension_id = 20 AND position = 48 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I lack an inner sense of friendliness.',
    texte_es = 'Me falta amabilidad interior.',
    texte_pt = 'Falta-me amabilidade interior.'
WHERE id = 429 AND dimension_id = 20 AND position = 49 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I help people in difficulty as best I can.',
    texte_es = 'Ayudo lo mejor que puedo a las personas en dificultades.',
    texte_pt = 'Ajudo o melhor que posso as pessoas em dificuldade.'
WHERE id = 430 AND dimension_id = 21 AND position = 0 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I take practical steps to do good.',
    texte_es = 'Tomo iniciativas concretas para hacer el bien.',
    texte_pt = 'Tomo iniciativas concretas para fazer o bem.'
WHERE id = 431 AND dimension_id = 21 AND position = 1 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I am willing to act to help someone.',
    texte_es = 'Estoy dispuesto a actuar para ayudar a alguien.',
    texte_pt = 'Estou disposto a agir para ajudar alguém.'
WHERE id = 432 AND dimension_id = 21 AND position = 2 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I actively do good around me.',
    texte_es = 'Hago el bien de forma activa a mi alrededor.',
    texte_pt = 'Faço ativamente o bem à minha volta.'
WHERE id = 433 AND dimension_id = 21 AND position = 3 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I commit to actions that benefit others.',
    texte_es = 'Me comprometo con acciones útiles para los demás.',
    texte_pt = 'Envolvo-me em ações úteis aos outros.'
WHERE id = 434 AND dimension_id = 21 AND position = 4 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I support others in their needs.',
    texte_es = 'Apoyo a los demás en sus necesidades.',
    texte_pt = 'Apoio os outros nas suas necessidades.'
WHERE id = 435 AND dimension_id = 21 AND position = 5 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I take action when I see a need.',
    texte_es = 'Actúo cuando veo una necesidad.',
    texte_pt = 'Passo à ação quando vejo uma necessidade.'
WHERE id = 436 AND dimension_id = 21 AND position = 6 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I give my time to others.',
    texte_es = 'Dedico mi tiempo a los demás.',
    texte_pt = 'Dou o meu tempo aos outros.'
WHERE id = 437 AND dimension_id = 21 AND position = 7 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I am committed to others'' wellbeing.',
    texte_es = 'Me implico en el bien de los demás.',
    texte_pt = 'Envolvo-me no bem dos outros.'
WHERE id = 438 AND dimension_id = 21 AND position = 8 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I show generosity through concrete actions.',
    texte_es = 'Muestro generosidad con acciones concretas.',
    texte_pt = 'Mostro generosidade através de ações concretas.'
WHERE id = 439 AND dimension_id = 21 AND position = 9 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I can speak the truth with kindness.',
    texte_es = 'Sé decir la verdad con benevolencia.',
    texte_pt = 'Sei dizer a verdade com benevolência.'
WHERE id = 440 AND dimension_id = 21 AND position = 10 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I correct fairly when necessary.',
    texte_es = 'Corrijo con justicia cuando es necesario.',
    texte_pt = 'Corrijo com justiça quando é necessário.'
WHERE id = 441 AND dimension_id = 21 AND position = 11 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I confront others respectfully when needed.',
    texte_es = 'Confronto con respeto cuando hace falta.',
    texte_pt = 'Confronto com respeito quando é preciso.'
WHERE id = 442 AND dimension_id = 21 AND position = 12 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I seek others'' true good, even when it is uncomfortable.',
    texte_es = 'Busco el verdadero bien de los demás, aunque resulte incómodo.',
    texte_pt = 'Procuro o verdadeiro bem dos outros, mesmo quando é desconfortável.'
WHERE id = 443 AND dimension_id = 21 AND position = 13 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I make fair decisions, even difficult ones.',
    texte_es = 'Tomo decisiones justas, aunque sean difíciles.',
    texte_pt = 'Tomo decisões justas, mesmo difíceis.'
WHERE id = 444 AND dimension_id = 21 AND position = 14 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I am willing to correct someone for their good.',
    texte_es = 'Estoy dispuesto a corregir a alguien por su bien.',
    texte_pt = 'Estou disposto a corrigir alguém para seu bem.'
WHERE id = 445 AND dimension_id = 21 AND position = 15 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I do not let someone harm themselves without intervening.',
    texte_es = 'No dejo que alguien se haga daño sin intervenir.',
    texte_pt = 'Não deixo que alguém se prejudique sem intervir.'
WHERE id = 446 AND dimension_id = 21 AND position = 16 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I actively do good.',
    texte_es = 'Hago el bien de forma activa.',
    texte_pt = 'Sou ativo na prática do bem.'
WHERE id = 447 AND dimension_id = 21 AND position = 17 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I take part in acts of compassion.',
    texte_es = 'Participo en actos de compasión.',
    texte_pt = 'Participo em atos de compaixão.'
WHERE id = 448 AND dimension_id = 21 AND position = 18 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I readily offer to help.',
    texte_es = 'Ayudo de forma espontánea.',
    texte_pt = 'Ajudo espontaneamente.'
WHERE id = 449 AND dimension_id = 21 AND position = 19 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I care for people in difficulty.',
    texte_es = 'Cuido de las personas en dificultades.',
    texte_pt = 'Cuido das pessoas em dificuldade.'
WHERE id = 450 AND dimension_id = 21 AND position = 20 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I correct someone when it is necessary for their good.',
    texte_es = 'Corrijo a alguien cuando es necesario por su bien.',
    texte_pt = 'Corrijo alguém quando é necessário para seu bem.'
WHERE id = 451 AND dimension_id = 21 AND position = 21 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I confront others wisely when needed.',
    texte_es = 'Confronto con sabiduría cuando hace falta.',
    texte_pt = 'Confronto com sabedoria quando é preciso.'
WHERE id = 452 AND dimension_id = 21 AND position = 22 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I do not let someone go astray without intervening.',
    texte_es = 'No dejo que alguien se desvíe sin intervenir.',
    texte_pt = 'Não deixo que alguém se desvie sem intervir.'
WHERE id = 453 AND dimension_id = 21 AND position = 23 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I take a stand for good.',
    texte_es = 'Tomo posición a favor del bien.',
    texte_pt = 'Tomo posição pelo bem.'
WHERE id = 454 AND dimension_id = 21 AND position = 24 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I see needs but do not act.',
    texte_es = 'Veo las necesidades, pero no actúo.',
    texte_pt = 'Vejo as necessidades, mas não ajo.'
WHERE id = 455 AND dimension_id = 21 AND position = 25 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I remain passive in the face of others'' suffering.',
    texte_es = 'Permanezco pasivo ante el sufrimiento de los demás.',
    texte_pt = 'Permaneço passivo perante o sofrimento dos outros.'
WHERE id = 456 AND dimension_id = 21 AND position = 26 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I lack initiative in helping.',
    texte_es = 'Me falta iniciativa para ayudar.',
    texte_pt = 'Falta-me iniciativa para ajudar.'
WHERE id = 457 AND dimension_id = 21 AND position = 27 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I prefer to avoid getting involved.',
    texte_es = 'Prefiero evitar implicarme.',
    texte_pt = 'Prefiro evitar envolver-me.'
WHERE id = 458 AND dimension_id = 21 AND position = 28 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I leave others to fend for themselves.',
    texte_es = 'Dejo que los demás se las arreglen solos.',
    texte_pt = 'Deixo que os outros se desenrasquem sozinhos.'
WHERE id = 459 AND dimension_id = 21 AND position = 29 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I am not very involved in helping activities.',
    texte_es = 'Me implico poco en las acciones de ayuda.',
    texte_pt = 'Envolvo-me pouco em ações de ajuda.'
WHERE id = 460 AND dimension_id = 21 AND position = 30 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I do not act even when I could help.',
    texte_es = 'No actúo ni siquiera cuando podría ayudar.',
    texte_pt = 'Não ajo mesmo quando poderia ajudar.'
WHERE id = 461 AND dimension_id = 21 AND position = 31 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I am indifferent to needs I can see.',
    texte_es = 'Soy indiferente a las necesidades visibles.',
    texte_pt = 'Sou indiferente às necessidades visíveis.'
WHERE id = 462 AND dimension_id = 21 AND position = 32 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I lack generosity in my actions.',
    texte_es = 'Me falta generosidad en mis actos.',
    texte_pt = 'Falta-me generosidade nos meus atos.'
WHERE id = 463 AND dimension_id = 21 AND position = 33 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I do not take the time to help.',
    texte_es = 'No dedico tiempo a ayudar.',
    texte_pt = 'Não dedico tempo a ajudar.'
WHERE id = 464 AND dimension_id = 21 AND position = 34 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I do not dare to speak the truth when necessary.',
    texte_es = 'No me atrevo a decir la verdad cuando es necesario.',
    texte_pt = 'Não me atrevo a dizer a verdade quando é necessário.'
WHERE id = 465 AND dimension_id = 21 AND position = 35 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I avoid helpful confrontations.',
    texte_es = 'Evito las confrontaciones útiles.',
    texte_pt = 'Evito confrontos úteis.'
WHERE id = 466 AND dimension_id = 21 AND position = 36 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I let situations deteriorate.',
    texte_es = 'Dejo que las situaciones se deterioren.',
    texte_pt = 'Deixo que as situações se deteriorem.'
WHERE id = 467 AND dimension_id = 21 AND position = 37 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I lack the courage to act.',
    texte_es = 'Me falta valor para actuar.',
    texte_pt = 'Falta-me coragem para agir.'
WHERE id = 468 AND dimension_id = 21 AND position = 38 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I am passive in the face of injustice.',
    texte_es = 'Soy pasivo ante la injusticia.',
    texte_pt = 'Sou passivo perante a injustiça.'
WHERE id = 469 AND dimension_id = 21 AND position = 39 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I do not correct when necessary.',
    texte_es = 'No corrijo cuando es necesario.',
    texte_pt = 'Não corrijo quando é necessário.'
WHERE id = 470 AND dimension_id = 21 AND position = 40 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I let mistakes go without intervening.',
    texte_es = 'Dejo pasar los errores sin intervenir.',
    texte_pt = 'Deixo passar os erros sem intervir.'
WHERE id = 471 AND dimension_id = 21 AND position = 41 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I lack practical involvement.',
    texte_es = 'Me falta implicación concreta.',
    texte_pt = 'Falta-me envolvimento concreto.'
WHERE id = 472 AND dimension_id = 21 AND position = 42 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I do little to put goodness into action.',
    texte_es = 'Soy poco activo en hacer el bien.',
    texte_pt = 'Sou pouco ativo na prática do bem.'
WHERE id = 473 AND dimension_id = 21 AND position = 43 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I often put off helping when I could.',
    texte_es = 'A menudo pospongo la ayuda que podría prestar.',
    texte_pt = 'Adio frequentemente a ajuda que poderia dar.'
WHERE id = 474 AND dimension_id = 21 AND position = 44 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I am self-centred in my actions.',
    texte_es = 'Mis acciones están centradas en mí mismo.',
    texte_pt = 'Estou centrado em mim mesmo nas minhas ações.'
WHERE id = 475 AND dimension_id = 21 AND position = 45 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I act only when it suits me.',
    texte_es = 'Solo actúo si me conviene.',
    texte_pt = 'Só ajo se me convier.'
WHERE id = 476 AND dimension_id = 21 AND position = 46 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I lack commitment to others.',
    texte_es = 'Me falta compromiso con los demás.',
    texte_pt = 'Falta-me compromisso para com os outros.'
WHERE id = 477 AND dimension_id = 21 AND position = 47 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I neglect opportunities to help.',
    texte_es = 'Desaprovecho las oportunidades de ayudar.',
    texte_pt = 'Descuido as oportunidades de ajudar.'
WHERE id = 478 AND dimension_id = 21 AND position = 48 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE questions
SET texte_en = 'I am passive in the face of others'' needs.',
    texte_es = 'Soy pasivo ante las necesidades de los demás.',
    texte_pt = 'Sou passivo perante as necessidades dos outros.'
WHERE id = 479 AND dimension_id = 21 AND position = 49 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'bonte');

UPDATE tranches_interpretation
SET texte_en = 'Kindness and goodness are scarcely evident across the attitudes assessed. This is a warning sign: action is needed without delay.',
    texte_es = 'La bondad y la benevolencia se manifiestan muy poco en el conjunto de las actitudes evaluadas. Es una señal de alerta: es necesario actuar sin demora.',
    texte_pt = 'A bondade e a benevolência manifestam-se muito pouco no conjunto das atitudes avaliadas. É um sinal de alerta: é necessário agir sem demora.'
WHERE position = 0 AND min_score = 0 AND max_score = 19 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = tranches_interpretation.referentiel_id AND r.code = 'bonte');

UPDATE tranches_interpretation
SET texte_en = 'There are several slight signs of kindness and goodness. These need to be strengthened significantly.',
    texte_es = 'Hay varios indicios leves de bondad y benevolencia. Es necesario fortalecerlos de manera significativa.',
    texte_pt = 'Existem vários sinais ténues de bondade e benevolência. É necessário reforçá-los significativamente.'
WHERE position = 1 AND min_score = 20 AND max_score = 39 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = tranches_interpretation.referentiel_id AND r.code = 'bonte');

UPDATE tranches_interpretation
SET texte_en = 'The profile shows a real presence of kindness and goodness in daily life, even if their expression remains inconsistent. This needs further work.',
    texte_es = 'El perfil muestra una presencia real de bondad y benevolencia en la vida cotidiana, aunque su expresión sigue siendo inconstante. Hay que seguir trabajando en ello.',
    texte_pt = 'O perfil mostra uma presença real de bondade e benevolência no dia a dia, embora a sua expressão continue a ser inconstante. É preciso continuar a trabalhar este aspeto.'
WHERE position = 2 AND min_score = 40 AND max_score = 59 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = tranches_interpretation.referentiel_id AND r.code = 'bonte');

UPDATE tranches_interpretation
SET texte_en = 'Kindness and goodness appear to be clearly evident in several areas of life. Keep strengthening them!',
    texte_es = 'La bondad y la benevolencia parecen manifestarse de forma evidente en varias áreas de la vida. ¡Sigue fortaleciéndolas!',
    texte_pt = 'A bondade e a benevolência parecem manifestar-se de forma evidente em várias áreas da vida. Continua a fortalecê-las!'
WHERE position = 3 AND min_score = 60 AND max_score = 79 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = tranches_interpretation.referentiel_id AND r.code = 'bonte');

UPDATE tranches_interpretation
SET texte_en = 'The profile reveals a very strong expression of the kindness and goodness of the Lord. Stay on course!',
    texte_es = 'El perfil revela una manifestación muy intensa de la bondad y la benevolencia del Señor. ¡Mantén el rumbo!',
    texte_pt = 'O perfil revela uma manifestação muito forte da bondade e da benevolência do Senhor. Mantém o rumo!'
WHERE position = 4 AND min_score = 80 AND max_score = 100 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = tranches_interpretation.referentiel_id AND r.code = 'bonte');
