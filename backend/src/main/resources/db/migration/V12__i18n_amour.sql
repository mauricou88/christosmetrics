-- amour : traductions EN / ES / PT. UTF-8.
-- Aucun texte francais, polarite, seuil ou identifiant modifie.
-- UPDATE deterministes limites au referentiel amour.

UPDATE referentiels
SET nom_en = 'Love',
    verset_en = '1 Corinthians 13:4–7 and 1 John 4:18',
    nom_es = 'Amor',
    verset_es = '1 Corintios 13:4–7 y 1 Juan 4:18',
    nom_pt = 'Amor',
    verset_pt = '1 Coríntios 13:4–7 e 1 João 4:18'
WHERE code = 'amour' AND id = 5;

UPDATE dimensions
SET libelle_en = 'Love is patient',
    libelle_court_en = 'Patient',
    libelle_es = 'El amor es paciente',
    libelle_court_es = 'Paciente',
    libelle_pt = 'O amor é paciente',
    libelle_court_pt = 'Paciente'
WHERE id = 22 AND position = 0 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = dimensions.referentiel_id AND r.code = 'amour');

UPDATE dimensions
SET libelle_en = 'Love is full of kindness',
    libelle_court_en = 'Full of kindness',
    libelle_es = 'El amor está lleno de bondad',
    libelle_court_es = 'Lleno de bondad',
    libelle_pt = 'O amor é cheio de bondade',
    libelle_court_pt = 'Cheio de bondade'
WHERE id = 23 AND position = 1 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = dimensions.referentiel_id AND r.code = 'amour');

UPDATE dimensions
SET libelle_en = 'Love does not envy',
    libelle_court_en = 'Not envious',
    libelle_es = 'El amor no es envidioso',
    libelle_court_es = 'Sin envidia',
    libelle_pt = 'O amor não tem inveja',
    libelle_court_pt = 'Sem inveja'
WHERE id = 24 AND position = 2 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = dimensions.referentiel_id AND r.code = 'amour');

UPDATE dimensions
SET libelle_en = 'Love does not boast',
    libelle_court_en = 'Not boastful',
    libelle_es = 'El amor no presume',
    libelle_court_es = 'Sin presunción',
    libelle_pt = 'O amor não se gaba',
    libelle_court_pt = 'Sem vanglória'
WHERE id = 25 AND position = 3 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = dimensions.referentiel_id AND r.code = 'amour');

UPDATE dimensions
SET libelle_en = 'Love is not puffed up with pride',
    libelle_court_en = 'Not proud',
    libelle_es = 'El amor no se llena de orgullo',
    libelle_court_es = 'Sin orgullo',
    libelle_pt = 'O amor não se enche de orgulho',
    libelle_court_pt = 'Sem orgulho'
WHERE id = 26 AND position = 4 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = dimensions.referentiel_id AND r.code = 'amour');

UPDATE dimensions
SET libelle_en = 'Love does nothing dishonourable',
    libelle_court_en = 'Not dishonourable',
    libelle_es = 'El amor no hace nada deshonroso',
    libelle_court_es = 'Sin deshonra',
    libelle_pt = 'O amor não faz nada desonroso',
    libelle_court_pt = 'Sem desonra'
WHERE id = 27 AND position = 5 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = dimensions.referentiel_id AND r.code = 'amour');

UPDATE dimensions
SET libelle_en = 'Love does not seek its own interests',
    libelle_court_en = 'Not self-seeking',
    libelle_es = 'El amor no busca su propio interés',
    libelle_court_es = 'Sin interés propio',
    libelle_pt = 'O amor não procura o seu próprio interesse',
    libelle_court_pt = 'Sem interesse próprio'
WHERE id = 28 AND position = 6 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = dimensions.referentiel_id AND r.code = 'amour');

UPDATE dimensions
SET libelle_en = 'Love does not become irritated',
    libelle_court_en = 'Not irritable',
    libelle_es = 'El amor no se irrita',
    libelle_court_es = 'Sin irritación',
    libelle_pt = 'O amor não se irrita',
    libelle_court_pt = 'Sem irritação'
WHERE id = 29 AND position = 7 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = dimensions.referentiel_id AND r.code = 'amour');

UPDATE dimensions
SET libelle_en = 'Love does not assume evil intentions',
    libelle_court_en = 'Not suspicious of evil',
    libelle_es = 'El amor no sospecha malas intenciones',
    libelle_court_es = 'Sin sospechas del mal',
    libelle_pt = 'O amor não suspeita de más intenções',
    libelle_court_pt = 'Sem suspeitas do mal'
WHERE id = 30 AND position = 8 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = dimensions.referentiel_id AND r.code = 'amour');

UPDATE dimensions
SET libelle_en = 'Love does not rejoice in injustice',
    libelle_court_en = 'Not rejoicing in injustice',
    libelle_es = 'El amor no se alegra de la injusticia',
    libelle_court_es = 'Sin alegría por la injusticia',
    libelle_pt = 'O amor não se alegra com a injustiça',
    libelle_court_pt = 'Sem alegria na injustiça'
WHERE id = 31 AND position = 9 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = dimensions.referentiel_id AND r.code = 'amour');

UPDATE dimensions
SET libelle_en = 'Love rejoices in the truth',
    libelle_court_en = 'Rejoicing in the truth',
    libelle_es = 'El amor se alegra de la verdad',
    libelle_court_es = 'Alegría en la verdad',
    libelle_pt = 'O amor alegra-se com a verdade',
    libelle_court_pt = 'Alegria na verdade'
WHERE id = 32 AND position = 10 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = dimensions.referentiel_id AND r.code = 'amour');

UPDATE dimensions
SET libelle_en = 'Love is always forgiving',
    libelle_court_en = 'Always forgiving',
    libelle_es = 'El amor todo lo disculpa',
    libelle_court_es = 'Todo lo disculpa',
    libelle_pt = 'O amor tudo desculpa',
    libelle_court_pt = 'Tudo desculpa'
WHERE id = 33 AND position = 11 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = dimensions.referentiel_id AND r.code = 'amour');

UPDATE dimensions
SET libelle_en = 'Love believes, hopes and endures all things',
    libelle_court_en = 'Believing, hoping, enduring',
    libelle_es = 'El amor todo lo cree, todo lo espera y todo lo soporta',
    libelle_court_es = 'Creer, esperar y soportar',
    libelle_pt = 'O amor tudo crê, tudo espera e tudo suporta',
    libelle_court_pt = 'Crer, esperar e suportar'
WHERE id = 34 AND position = 12 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = dimensions.referentiel_id AND r.code = 'amour');

UPDATE dimensions
SET libelle_en = 'Perfect love drives out fear',
    libelle_court_en = 'Driving out fear',
    libelle_es = 'El amor perfecto expulsa el temor',
    libelle_court_es = 'Expulsa el temor',
    libelle_pt = 'O amor perfeito afasta o medo',
    libelle_court_pt = 'Afasta o medo'
WHERE id = 35 AND position = 13 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = dimensions.referentiel_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I remain calm when things take time.',
    texte_es = 'Mantengo la calma cuando las cosas requieren tiempo.',
    texte_pt = 'Mantenho a calma quando as coisas levam tempo.'
WHERE id = 480 AND dimension_id = 22 AND position = 0 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I tolerate delays without getting angry.',
    texte_es = 'Soporto los retrasos sin enfadarme.',
    texte_pt = 'Suporto os atrasos sem me irritar.'
WHERE id = 481 AND dimension_id = 22 AND position = 1 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I give others time to make progress.',
    texte_es = 'Doy a los demás tiempo para avanzar.',
    texte_pt = 'Dou aos outros tempo para progredirem.'
WHERE id = 482 AND dimension_id = 22 AND position = 2 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I show tolerance towards mistakes.',
    texte_es = 'Muestro tolerancia ante los errores.',
    texte_pt = 'Mostro tolerância perante os erros.'
WHERE id = 483 AND dimension_id = 22 AND position = 3 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I remain calm when frustrated.',
    texte_es = 'Mantengo la calma ante las frustraciones.',
    texte_pt = 'Mantenho a calma perante as frustrações.'
WHERE id = 484 AND dimension_id = 22 AND position = 4 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I can wait without complaining.',
    texte_es = 'Soy capaz de esperar sin quejarme.',
    texte_pt = 'Sou capaz de esperar sem me queixar.'
WHERE id = 485 AND dimension_id = 22 AND position = 5 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I persevere despite slow progress.',
    texte_es = 'Persevero a pesar de la lentitud.',
    texte_pt = 'Persevero apesar da lentidão.'
WHERE id = 486 AND dimension_id = 22 AND position = 6 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I put up with other people''s imperfections.',
    texte_es = 'Soporto las imperfecciones de los demás.',
    texte_pt = 'Suporto as imperfeições dos outros.'
WHERE id = 487 AND dimension_id = 22 AND position = 7 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I take a step back before reacting.',
    texte_es = 'Tomo distancia antes de reaccionar.',
    texte_pt = 'Distancio-me um pouco antes de reagir.'
WHERE id = 488 AND dimension_id = 22 AND position = 8 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'Others see me as patient.',
    texte_es = 'Los demás me ven como alguien paciente.',
    texte_pt = 'Os outros veem-me como uma pessoa paciente.'
WHERE id = 489 AND dimension_id = 22 AND position = 9 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I quickly get irritated when things do not move forward.',
    texte_es = 'Me irrito rápidamente cuando las cosas no avanzan.',
    texte_pt = 'Irrito-me depressa quando as coisas não avançam.'
WHERE id = 490 AND dimension_id = 22 AND position = 10 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I lose patience with repeated mistakes.',
    texte_es = 'Pierdo la paciencia ante los errores repetidos.',
    texte_pt = 'Perco a paciência perante erros repetidos.'
WHERE id = 491 AND dimension_id = 22 AND position = 11 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I want everything to happen quickly.',
    texte_es = 'Quiero que todo se haga rápido.',
    texte_pt = 'Quero que tudo se faça depressa.'
WHERE id = 492 AND dimension_id = 22 AND position = 12 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I easily get irritated with others.',
    texte_es = 'Me irrito fácilmente con los demás.',
    texte_pt = 'Irrito-me facilmente com os outros.'
WHERE id = 493 AND dimension_id = 22 AND position = 13 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I find delays hard to tolerate.',
    texte_es = 'Me cuesta tolerar las demoras.',
    texte_pt = 'Custa-me tolerar as demoras.'
WHERE id = 494 AND dimension_id = 22 AND position = 14 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I become impatient while waiting.',
    texte_es = 'Me impaciento al esperar.',
    texte_pt = 'Fico impaciente quando espero.'
WHERE id = 495 AND dimension_id = 22 AND position = 15 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I get angry when someone is slow.',
    texte_es = 'Me enfado cuando alguien va despacio.',
    texte_pt = 'Irrito-me quando alguém é lento.'
WHERE id = 496 AND dimension_id = 22 AND position = 16 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I quickly grow weary.',
    texte_es = 'Me canso rápidamente.',
    texte_pt = 'Canso-me depressa.'
WHERE id = 497 AND dimension_id = 22 AND position = 17 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I show my impatience.',
    texte_es = 'Muestro mi impaciencia.',
    texte_pt = 'Mostro a minha impaciência.'
WHERE id = 498 AND dimension_id = 22 AND position = 18 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I find imperfections hard to tolerate.',
    texte_es = 'Me cuesta tolerar las imperfecciones.',
    texte_pt = 'Custa-me tolerar as imperfeições.'
WHERE id = 499 AND dimension_id = 22 AND position = 19 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I seek to do good around me.',
    texte_es = 'Busco hacer el bien a mi alrededor.',
    texte_pt = 'Procuro fazer o bem à minha volta.'
WHERE id = 500 AND dimension_id = 23 AND position = 0 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I readily offer to help.',
    texte_es = 'Ayudo de forma espontánea.',
    texte_pt = 'Ajudo espontaneamente.'
WHERE id = 501 AND dimension_id = 23 AND position = 1 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I am attentive to others'' needs.',
    texte_es = 'Presto atención a las necesidades de los demás.',
    texte_pt = 'Estou atento às necessidades dos outros.'
WHERE id = 502 AND dimension_id = 23 AND position = 2 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I show generosity.',
    texte_es = 'Muestro generosidad.',
    texte_pt = 'Mostro generosidade.'
WHERE id = 503 AND dimension_id = 23 AND position = 3 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I rejoice in helping.',
    texte_es = 'Me alegra ayudar.',
    texte_pt = 'Alegro-me por ajudar.'
WHERE id = 504 AND dimension_id = 23 AND position = 4 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I care for others.',
    texte_es = 'Cuido de los demás.',
    texte_pt = 'Cuido dos outros.'
WHERE id = 505 AND dimension_id = 23 AND position = 5 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I show compassion.',
    texte_es = 'Muestro compasión.',
    texte_pt = 'Mostro compaixão.'
WHERE id = 506 AND dimension_id = 23 AND position = 6 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I seek to encourage others.',
    texte_es = 'Busco animar a los demás.',
    texte_pt = 'Procuro encorajar os outros.'
WHERE id = 507 AND dimension_id = 23 AND position = 7 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I am welcoming.',
    texte_es = 'Soy acogedor.',
    texte_pt = 'Sou acolhedor.'
WHERE id = 508 AND dimension_id = 23 AND position = 8 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'Others sense my goodwill towards them.',
    texte_es = 'Los demás perciben mi benevolencia.',
    texte_pt = 'Os outros sentem a minha benevolência.'
WHERE id = 509 AND dimension_id = 23 AND position = 9 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I am indifferent to others'' needs.',
    texte_es = 'Soy indiferente a las necesidades de los demás.',
    texte_pt = 'Sou indiferente às necessidades dos outros.'
WHERE id = 510 AND dimension_id = 23 AND position = 10 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I help only when it suits me.',
    texte_es = 'Solo ayudo si me conviene.',
    texte_pt = 'Só ajudo se me convier.'
WHERE id = 511 AND dimension_id = 23 AND position = 11 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I think of myself first.',
    texte_es = 'Pienso primero en mí.',
    texte_pt = 'Penso primeiro em mim.'
WHERE id = 512 AND dimension_id = 23 AND position = 12 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I am not very sensitive to others.',
    texte_es = 'Soy poco sensible a los demás.',
    texte_pt = 'Sou pouco sensível aos outros.'
WHERE id = 513 AND dimension_id = 23 AND position = 13 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I refuse to help when it inconveniences me.',
    texte_es = 'Me niego a ayudar cuando me incomoda.',
    texte_pt = 'Recuso-me a ajudar quando isso me incomoda.'
WHERE id = 514 AND dimension_id = 23 AND position = 14 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I lack generosity.',
    texte_es = 'Me falta generosidad.',
    texte_pt = 'Falta-me generosidade.'
WHERE id = 515 AND dimension_id = 23 AND position = 15 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I close myself off from others.',
    texte_es = 'Me cierro a los demás.',
    texte_pt = 'Fecho-me aos outros.'
WHERE id = 516 AND dimension_id = 23 AND position = 16 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I act distant.',
    texte_es = 'Me muestro distante.',
    texte_pt = 'Mostro-me distante.'
WHERE id = 517 AND dimension_id = 23 AND position = 17 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I neglect others.',
    texte_es = 'Desatiendo a los demás.',
    texte_pt = 'Negligencio os outros.'
WHERE id = 518 AND dimension_id = 23 AND position = 18 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I am not very helpful.',
    texte_es = 'Soy poco servicial.',
    texte_pt = 'Sou pouco prestável.'
WHERE id = 519 AND dimension_id = 23 AND position = 19 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I rejoice in others'' success.',
    texte_es = 'Me alegro del éxito de los demás.',
    texte_pt = 'Alegro-me com o sucesso dos outros.'
WHERE id = 520 AND dimension_id = 24 AND position = 0 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I celebrate others'' achievements.',
    texte_es = 'Celebro los logros de los demás.',
    texte_pt = 'Celebro as conquistas dos outros.'
WHERE id = 521 AND dimension_id = 24 AND position = 1 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I am at peace with what I have.',
    texte_es = 'Estoy en paz con lo que tengo.',
    texte_pt = 'Estou em paz com o que tenho.'
WHERE id = 522 AND dimension_id = 24 AND position = 2 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I do not compare myself with others excessively.',
    texte_es = 'No me comparo en exceso con los demás.',
    texte_pt = 'Não me comparo excessivamente com os outros.'
WHERE id = 523 AND dimension_id = 24 AND position = 3 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I am grateful for my life.',
    texte_es = 'Estoy agradecido por mi vida.',
    texte_pt = 'Sou grato pela minha vida.'
WHERE id = 524 AND dimension_id = 24 AND position = 4 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I sincerely rejoice for others.',
    texte_es = 'Me alegro sinceramente por los demás.',
    texte_pt = 'Alegro-me sinceramente pelos outros.'
WHERE id = 525 AND dimension_id = 24 AND position = 5 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I am satisfied with my journey so far.',
    texte_es = 'Estoy satisfecho con mi recorrido.',
    texte_pt = 'Estou satisfeito com o meu percurso.'
WHERE id = 526 AND dimension_id = 24 AND position = 6 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I value others.',
    texte_es = 'Valoro a los demás.',
    texte_pt = 'Valorizo os outros.'
WHERE id = 527 AND dimension_id = 24 AND position = 7 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I feel no rivalry.',
    texte_es = 'No siento rivalidad.',
    texte_pt = 'Não sinto rivalidade.'
WHERE id = 528 AND dimension_id = 24 AND position = 8 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I rejoice in the good that others experience.',
    texte_es = 'Me alegro del bien de los demás.',
    texte_pt = 'Alegro-me com o bem dos outros.'
WHERE id = 529 AND dimension_id = 24 AND position = 9 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I am jealous of others.',
    texte_es = 'Siento celos de los demás.',
    texte_pt = 'Tenho ciúmes dos outros.'
WHERE id = 530 AND dimension_id = 24 AND position = 10 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I constantly compare myself with others.',
    texte_es = 'Me comparo constantemente con los demás.',
    texte_pt = 'Comparo-me constantemente com os outros.'
WHERE id = 531 AND dimension_id = 24 AND position = 11 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I feel envy.',
    texte_es = 'Siento envidia.',
    texte_pt = 'Sinto inveja.'
WHERE id = 532 AND dimension_id = 24 AND position = 12 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'Others'' success frustrates me.',
    texte_es = 'Me frustra el éxito de los demás.',
    texte_pt = 'O sucesso dos outros frustra-me.'
WHERE id = 533 AND dimension_id = 24 AND position = 13 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I feel I am competing with others.',
    texte_es = 'Siento que compito con los demás.',
    texte_pt = 'Sinto-me em competição com os outros.'
WHERE id = 534 AND dimension_id = 24 AND position = 14 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I envy others in one area or another.',
    texte_es = 'Envidio a los demás en uno u otro aspecto.',
    texte_pt = 'Invejo os outros num ou noutro aspeto.'
WHERE id = 535 AND dimension_id = 24 AND position = 15 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I cannot be content with what I have.',
    texte_es = 'No consigo contentarme con lo que tengo.',
    texte_pt = 'Não consigo contentar-me com o que tenho.'
WHERE id = 536 AND dimension_id = 24 AND position = 16 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I feel that something is missing.',
    texte_es = 'Siento que me falta algo.',
    texte_pt = 'Sinto que me falta algo.'
WHERE id = 537 AND dimension_id = 24 AND position = 17 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I feel jealousy inside.',
    texte_es = 'Siento celos por dentro.',
    texte_pt = 'Sinto ciúmes por dentro.'
WHERE id = 538 AND dimension_id = 24 AND position = 18 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I covet what others have.',
    texte_es = 'Codicio lo que tienen los demás.',
    texte_pt = 'Cobiço o que os outros têm.'
WHERE id = 539 AND dimension_id = 24 AND position = 19 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I remain humble in my achievements.',
    texte_es = 'Mantengo la humildad ante mis logros.',
    texte_pt = 'Mantenho a humildade nos meus êxitos.'
WHERE id = 540 AND dimension_id = 25 AND position = 0 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I do not seek to impress.',
    texte_es = 'No busco impresionar.',
    texte_pt = 'Não procuro impressionar.'
WHERE id = 541 AND dimension_id = 25 AND position = 1 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I say little about my accomplishments.',
    texte_es = 'Hablo poco de mis hazañas.',
    texte_pt = 'Falo pouco dos meus feitos.'
WHERE id = 542 AND dimension_id = 25 AND position = 2 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I let others recognise my worth.',
    texte_es = 'Dejo que los demás reconozcan mi valor.',
    texte_pt = 'Deixo que os outros reconheçam o meu valor.'
WHERE id = 543 AND dimension_id = 25 AND position = 3 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I am discreet about my successes.',
    texte_es = 'Soy discreto con mis éxitos.',
    texte_pt = 'Sou discreto quanto aos meus sucessos.'
WHERE id = 544 AND dimension_id = 25 AND position = 4 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I do not seek to put myself forward.',
    texte_es = 'No busco destacar.',
    texte_pt = 'Não procuro dar nas vistas.'
WHERE id = 545 AND dimension_id = 25 AND position = 5 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I value others.',
    texte_es = 'Valoro a los demás.',
    texte_pt = 'Valorizo os outros.'
WHERE id = 546 AND dimension_id = 25 AND position = 6 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I remain unassuming.',
    texte_es = 'Mantengo la sencillez.',
    texte_pt = 'Mantenho a simplicidade.'
WHERE id = 547 AND dimension_id = 25 AND position = 7 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I avoid glorifying my accomplishments or successes in front of others.',
    texte_es = 'Evito vanagloriarme ante los demás de mis logros o éxitos.',
    texte_pt = 'Evito vangloriar-me perante os outros dos meus feitos ou sucessos.'
WHERE id = 548 AND dimension_id = 25 AND position = 8 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I maintain a modest attitude.',
    texte_es = 'Mantengo una actitud modesta.',
    texte_pt = 'Mantenho uma atitude modesta.'
WHERE id = 549 AND dimension_id = 25 AND position = 9 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I often talk about my successes.',
    texte_es = 'Hablo a menudo de mis éxitos.',
    texte_pt = 'Falo frequentemente dos meus sucessos.'
WHERE id = 550 AND dimension_id = 25 AND position = 10 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I like to put myself forward.',
    texte_es = 'Me gusta destacar.',
    texte_pt = 'Gosto de dar nas vistas.'
WHERE id = 551 AND dimension_id = 25 AND position = 11 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I seek to impress.',
    texte_es = 'Busco impresionar.',
    texte_pt = 'Procuro impressionar.'
WHERE id = 552 AND dimension_id = 25 AND position = 12 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I easily boast.',
    texte_es = 'Presumo con facilidad.',
    texte_pt = 'Gabo-me facilmente.'
WHERE id = 553 AND dimension_id = 25 AND position = 13 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I seek recognition.',
    texte_es = 'Busco reconocimiento.',
    texte_pt = 'Procuro reconhecimento.'
WHERE id = 554 AND dimension_id = 25 AND position = 14 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I want to be admired.',
    texte_es = 'Quiero que me admiren.',
    texte_pt = 'Quero ser admirado.'
WHERE id = 555 AND dimension_id = 25 AND position = 15 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I make myself the centre of attention.',
    texte_es = 'Me pongo en el centro de atención.',
    texte_pt = 'Ponho-me no centro das atenções.'
WHERE id = 556 AND dimension_id = 25 AND position = 16 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I often talk myself up.',
    texte_es = 'Suelo resaltar mi propio valor.',
    texte_pt = 'Realço frequentemente o meu próprio valor.'
WHERE id = 557 AND dimension_id = 25 AND position = 17 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I seek attention.',
    texte_es = 'Busco atención.',
    texte_pt = 'Procuro atenção.'
WHERE id = 558 AND dimension_id = 25 AND position = 18 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I highlight my qualities.',
    texte_es = 'Destaco mis cualidades.',
    texte_pt = 'Destaco as minhas qualidades.'
WHERE id = 559 AND dimension_id = 25 AND position = 19 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I recognise my limits.',
    texte_es = 'Reconozco mis límites.',
    texte_pt = 'Reconheço os meus limites.'
WHERE id = 560 AND dimension_id = 26 AND position = 0 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I am open to criticism.',
    texte_es = 'Estoy abierto a las críticas.',
    texte_pt = 'Estou aberto às críticas.'
WHERE id = 561 AND dimension_id = 26 AND position = 1 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I remain humble.',
    texte_es = 'Mantengo la humildad.',
    texte_pt = 'Mantenho a humildade.'
WHERE id = 562 AND dimension_id = 26 AND position = 2 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I acknowledge my mistakes.',
    texte_es = 'Reconozco mis errores.',
    texte_pt = 'Reconheço os meus erros.'
WHERE id = 563 AND dimension_id = 26 AND position = 3 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I value others.',
    texte_es = 'Valoro a los demás.',
    texte_pt = 'Valorizo os outros.'
WHERE id = 564 AND dimension_id = 26 AND position = 4 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I remain approachable.',
    texte_es = 'Sigo siendo accesible.',
    texte_pt = 'Mantenho-me acessível.'
WHERE id = 565 AND dimension_id = 26 AND position = 5 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I am willing to listen.',
    texte_es = 'Estoy dispuesto a escuchar.',
    texte_pt = 'Estou disponível para escutar.'
WHERE id = 566 AND dimension_id = 26 AND position = 6 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I do not consider myself superior.',
    texte_es = 'No me considero superior.',
    texte_pt = 'Não me considero superior.'
WHERE id = 567 AND dimension_id = 26 AND position = 7 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I remain willing to learn.',
    texte_es = 'Mantengo la disposición a aprender.',
    texte_pt = 'Mantenho-me disposto a aprender.'
WHERE id = 568 AND dimension_id = 26 AND position = 8 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I show humility.',
    texte_es = 'Muestro humildad.',
    texte_pt = 'Mostro humildade.'
WHERE id = 569 AND dimension_id = 26 AND position = 9 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I feel superior to others.',
    texte_es = 'Me siento superior a los demás.',
    texte_pt = 'Sinto-me superior aos outros.'
WHERE id = 570 AND dimension_id = 26 AND position = 10 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I struggle to admit my mistakes.',
    texte_es = 'Me cuesta reconocer mis errores.',
    texte_pt = 'Custa-me reconhecer os meus erros.'
WHERE id = 571 AND dimension_id = 26 AND position = 11 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I am proud.',
    texte_es = 'Soy orgulloso.',
    texte_pt = 'Sou orgulhoso.'
WHERE id = 572 AND dimension_id = 26 AND position = 12 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I reject criticism.',
    texte_es = 'Rechazo las críticas.',
    texte_pt = 'Rejeito as críticas.'
WHERE id = 573 AND dimension_id = 26 AND position = 13 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I think I am better than others.',
    texte_es = 'Me creo mejor que los demás.',
    texte_pt = 'Acho-me melhor do que os outros.'
WHERE id = 574 AND dimension_id = 26 AND position = 14 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I close myself off to feedback.',
    texte_es = 'Me cierro a las observaciones.',
    texte_pt = 'Fecho-me às observações.'
WHERE id = 575 AND dimension_id = 26 AND position = 15 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I lack humility.',
    texte_es = 'Me falta humildad.',
    texte_pt = 'Falta-me humildade.'
WHERE id = 576 AND dimension_id = 26 AND position = 16 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I look down on some people.',
    texte_es = 'Desprecio a algunas personas.',
    texte_pt = 'Desprezo algumas pessoas.'
WHERE id = 577 AND dimension_id = 26 AND position = 17 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I refuse to learn.',
    texte_es = 'Me niego a aprender.',
    texte_pt = 'Recuso-me a aprender.'
WHERE id = 578 AND dimension_id = 26 AND position = 18 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I am self-centred.',
    texte_es = 'Estoy centrado en mí mismo.',
    texte_pt = 'Estou centrado em mim mesmo.'
WHERE id = 579 AND dimension_id = 26 AND position = 19 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I behave respectfully in every situation.',
    texte_es = 'Me comporto con respeto en todas las situaciones.',
    texte_pt = 'Comporto-me com respeito em todas as situações.'
WHERE id = 580 AND dimension_id = 27 AND position = 0 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I take care to act with integrity.',
    texte_es = 'Procuro actuar con integridad.',
    texte_pt = 'Procuro agir com integridade.'
WHERE id = 581 AND dimension_id = 27 AND position = 1 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I respect others in my words and attitudes.',
    texte_es = 'Respeto a los demás con mis palabras y actitudes.',
    texte_pt = 'Respeito os outros nas minhas palavras e atitudes.'
WHERE id = 582 AND dimension_id = 27 AND position = 2 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I reject inappropriate behaviour.',
    texte_es = 'Rechazo los comportamientos inapropiados.',
    texte_pt = 'Rejeito comportamentos inadequados.'
WHERE id = 583 AND dimension_id = 27 AND position = 3 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I maintain honourable conduct even in private.',
    texte_es = 'Mantengo una conducta honorable incluso en privado.',
    texte_pt = 'Mantenho uma conduta honrada mesmo em privado.'
WHERE id = 584 AND dimension_id = 27 AND position = 4 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I respect boundaries in my relationships.',
    texte_es = 'Respeto los límites en mis relaciones.',
    texte_pt = 'Respeito os limites nas minhas relações.'
WHERE id = 585 AND dimension_id = 27 AND position = 5 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I behave with dignity in every setting.',
    texte_es = 'Me comporto con dignidad en todos los contextos.',
    texte_pt = 'Comporto-me com dignidade em todos os contextos.'
WHERE id = 586 AND dimension_id = 27 AND position = 6 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I take care not to offend or hurt others through my behaviour.',
    texte_es = 'Procuro no ofender ni herir con mi comportamiento.',
    texte_pt = 'Tenho cuidado para não chocar nem magoar com o meu comportamento.'
WHERE id = 587 AND dimension_id = 27 AND position = 7 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I take care to stay true to my values.',
    texte_es = 'Procuro ser coherente con mis valores.',
    texte_pt = 'Procuro manter a coerência com os meus valores.'
WHERE id = 588 AND dimension_id = 27 AND position = 8 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I am attentive to the impact of my actions on others.',
    texte_es = 'Presto atención al impacto de mis acciones en los demás.',
    texte_pt = 'Estou atento ao impacto das minhas ações nos outros.'
WHERE id = 589 AND dimension_id = 27 AND position = 9 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I sometimes allow myself to behave inappropriately.',
    texte_es = 'A veces me permito comportamientos inapropiados.',
    texte_pt = 'Por vezes permito-me comportamentos inadequados.'
WHERE id = 590 AND dimension_id = 27 AND position = 10 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I cross certain boundaries without regard for others.',
    texte_es = 'Traspaso ciertos límites sin preocuparme por los demás.',
    texte_pt = 'Ultrapasso certos limites sem me preocupar com os outros.'
WHERE id = 591 AND dimension_id = 27 AND position = 11 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I behave differently in private and in public.',
    texte_es = 'Me comporto de forma distinta en privado y en público.',
    texte_pt = 'Comporto-me de maneira diferente em privado e em público.'
WHERE id = 592 AND dimension_id = 27 AND position = 12 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I am sometimes disrespectful in my attitudes.',
    texte_es = 'A veces mis actitudes muestran falta de respeto.',
    texte_pt = 'Por vezes mostro falta de respeito nas minhas atitudes.'
WHERE id = 593 AND dimension_id = 27 AND position = 13 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I treat some inappropriate behaviour as normal.',
    texte_es = 'Considero normales algunos comportamientos inapropiados.',
    texte_pt = 'Trato certos comportamentos inadequados como normais.'
WHERE id = 594 AND dimension_id = 27 AND position = 14 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I give in to inappropriate attitudes.',
    texte_es = 'Me dejo llevar por actitudes inapropiadas.',
    texte_pt = 'Deixo-me levar por atitudes inadequadas.'
WHERE id = 595 AND dimension_id = 27 AND position = 15 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I disregard the impact of my actions.',
    texte_es = 'Descuido el impacto de mis actos.',
    texte_pt = 'Descuido o impacto dos meus atos.'
WHERE id = 596 AND dimension_id = 27 AND position = 16 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I easily overstep boundaries in relationships.',
    texte_es = 'Traspaso con facilidad los límites en las relaciones.',
    texte_pt = 'Ultrapasso facilmente os limites nas relações.'
WHERE id = 597 AND dimension_id = 27 AND position = 17 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I justify myself when I do something wrong.',
    texte_es = 'Me justifico cuando hago algo malo.',
    texte_pt = 'Justifico-me quando faço algo de errado.'
WHERE id = 598 AND dimension_id = 27 AND position = 18 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I do not always see what is wrong with certain behaviours.',
    texte_es = 'No siempre veo el problema en ciertos comportamientos.',
    texte_pt = 'Nem sempre vejo o problema em certos comportamentos.'
WHERE id = 599 AND dimension_id = 27 AND position = 19 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I take others'' needs into account.',
    texte_es = 'Tengo en cuenta las necesidades de los demás.',
    texte_pt = 'Tenho em conta as necessidades dos outros.'
WHERE id = 600 AND dimension_id = 28 AND position = 0 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I put others before myself in some situations.',
    texte_es = 'Pongo a los demás antes que a mí en algunas situaciones.',
    texte_pt = 'Ponho os outros antes de mim em certas situações.'
WHERE id = 601 AND dimension_id = 28 AND position = 1 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I am willing to make sacrifices.',
    texte_es = 'Estoy dispuesto a hacer sacrificios.',
    texte_pt = 'Estou disposto a fazer sacrifícios.'
WHERE id = 602 AND dimension_id = 28 AND position = 2 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I seek the common good.',
    texte_es = 'Busco el bien común.',
    texte_pt = 'Procuro o bem comum.'
WHERE id = 603 AND dimension_id = 28 AND position = 3 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I give without expecting anything in return.',
    texte_es = 'Doy sin esperar nada a cambio.',
    texte_pt = 'Dou sem esperar nada em troca.'
WHERE id = 604 AND dimension_id = 28 AND position = 4 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I am attentive to others'' expectations.',
    texte_es = 'Presto atención a las expectativas de los demás.',
    texte_pt = 'Estou atento às expectativas dos outros.'
WHERE id = 605 AND dimension_id = 28 AND position = 5 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I make choices that also benefit others.',
    texte_es = 'Tomo decisiones que también benefician a los demás.',
    texte_pt = 'Faço escolhas que também beneficiam os outros.'
WHERE id = 606 AND dimension_id = 28 AND position = 6 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I can set aside my preferences.',
    texte_es = 'Soy capaz de renunciar a mis preferencias.',
    texte_pt = 'Sou capaz de renunciar às minhas preferências.'
WHERE id = 607 AND dimension_id = 28 AND position = 7 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I seek to serve rather than to be served.',
    texte_es = 'Busco servir en lugar de que me sirvan.',
    texte_pt = 'Procuro servir em vez de ser servido.'
WHERE id = 608 AND dimension_id = 28 AND position = 8 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I think of others when making decisions.',
    texte_es = 'Pienso en los demás al tomar decisiones.',
    texte_pt = 'Penso nos outros nas minhas decisões.'
WHERE id = 609 AND dimension_id = 28 AND position = 9 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I think of myself first.',
    texte_es = 'Pienso primero en mí.',
    texte_pt = 'Penso primeiro em mim.'
WHERE id = 610 AND dimension_id = 28 AND position = 10 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I prioritise my own interests.',
    texte_es = 'Doy prioridad a mis propios intereses.',
    texte_pt = 'Dou prioridade ao meu interesse pessoal.'
WHERE id = 611 AND dimension_id = 28 AND position = 11 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I seek to take advantage of situations.',
    texte_es = 'Busco sacar provecho de las situaciones.',
    texte_pt = 'Procuro tirar proveito das situações.'
WHERE id = 612 AND dimension_id = 28 AND position = 12 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I want things to go my way.',
    texte_es = 'Quiero que las cosas salgan como yo quiero.',
    texte_pt = 'Quero que as coisas corram à minha maneira.'
WHERE id = 613 AND dimension_id = 28 AND position = 13 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I am focused on my own needs.',
    texte_es = 'Estoy centrado en mis necesidades.',
    texte_pt = 'Estou centrado nas minhas necessidades.'
WHERE id = 614 AND dimension_id = 28 AND position = 14 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I find it hard not to come first.',
    texte_es = 'Me cuesta no tener prioridad.',
    texte_pt = 'Custa-me não ser a prioridade.'
WHERE id = 615 AND dimension_id = 28 AND position = 15 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I rarely take others into account.',
    texte_es = 'Rara vez tengo en cuenta a los demás.',
    texte_pt = 'Raramente tenho os outros em conta.'
WHERE id = 616 AND dimension_id = 28 AND position = 16 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I want to control decisions.',
    texte_es = 'Quiero controlar las decisiones.',
    texte_pt = 'Quero controlar as decisões.'
WHERE id = 617 AND dimension_id = 28 AND position = 17 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I seek my own comfort above all.',
    texte_es = 'Busco ante todo mi comodidad.',
    texte_pt = 'Procuro o meu conforto acima de tudo.'
WHERE id = 618 AND dimension_id = 28 AND position = 18 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I feel frustrated when I have to give way.',
    texte_es = 'Me frustro cuando tengo que ceder.',
    texte_pt = 'Fico frustrado quando tenho de ceder.'
WHERE id = 619 AND dimension_id = 28 AND position = 19 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I remain calm in tense situations.',
    texte_es = 'Mantengo la calma ante las tensiones.',
    texte_pt = 'Mantenho a calma perante as tensões.'
WHERE id = 620 AND dimension_id = 29 AND position = 0 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I control my emotional reactions.',
    texte_es = 'Controlo mis reacciones emocionales.',
    texte_pt = 'Controlo as minhas reações emocionais.'
WHERE id = 621 AND dimension_id = 29 AND position = 1 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I remain composed even when upset.',
    texte_es = 'Mantengo la serenidad incluso ante las contrariedades.',
    texte_pt = 'Mantenho a serenidade mesmo quando sou contrariado.'
WHERE id = 622 AND dimension_id = 29 AND position = 2 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I take a step back before reacting.',
    texte_es = 'Tomo distancia antes de reaccionar.',
    texte_pt = 'Distancio-me um pouco antes de reagir.'
WHERE id = 623 AND dimension_id = 29 AND position = 3 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I manage my emotions with maturity.',
    texte_es = 'Gestiono mis emociones con madurez.',
    texte_pt = 'Giro as minhas emoções com maturidade.'
WHERE id = 624 AND dimension_id = 29 AND position = 4 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I remain calm during conflicts.',
    texte_es = 'Mantengo la calma en los conflictos.',
    texte_pt = 'Mantenho a calma nos conflitos.'
WHERE id = 625 AND dimension_id = 29 AND position = 5 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I do not react impulsively.',
    texte_es = 'No reacciono de forma impulsiva.',
    texte_pt = 'Não reajo de forma impulsiva.'
WHERE id = 626 AND dimension_id = 29 AND position = 6 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I control my irritation.',
    texte_es = 'Controlo mi irritación.',
    texte_pt = 'Controlo a minha irritação.'
WHERE id = 627 AND dimension_id = 29 AND position = 7 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I show emotional patience.',
    texte_es = 'Muestro paciencia emocional.',
    texte_pt = 'Mostro paciência emocional.'
WHERE id = 628 AND dimension_id = 29 AND position = 8 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I remain at peace under pressure.',
    texte_es = 'Mantengo la paz bajo presión.',
    texte_pt = 'Mantenho a paz sob pressão.'
WHERE id = 629 AND dimension_id = 29 AND position = 9 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I easily get angry.',
    texte_es = 'Me enfado fácilmente.',
    texte_pt = 'Irrito-me facilmente.'
WHERE id = 630 AND dimension_id = 29 AND position = 10 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I react impulsively.',
    texte_es = 'Reacciono de forma impulsiva.',
    texte_pt = 'Reajo de forma impulsiva.'
WHERE id = 631 AND dimension_id = 29 AND position = 11 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I quickly lose my calm.',
    texte_es = 'Pierdo rápidamente la calma.',
    texte_pt = 'Perco depressa a calma.'
WHERE id = 632 AND dimension_id = 29 AND position = 12 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I let anger take over.',
    texte_es = 'Dejo que la ira me invada.',
    texte_pt = 'Deixo-me dominar pela raiva.'
WHERE id = 633 AND dimension_id = 29 AND position = 13 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I get irritated over small details.',
    texte_es = 'Me irrito por pequeños detalles.',
    texte_pt = 'Irrito-me por pormenores.'
WHERE id = 634 AND dimension_id = 29 AND position = 14 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I react strongly to frustrations.',
    texte_es = 'Reacciono intensamente ante las frustraciones.',
    texte_pt = 'Reajo intensamente às frustrações.'
WHERE id = 635 AND dimension_id = 29 AND position = 15 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I easily lose my temper.',
    texte_es = 'Pierdo los estribos fácilmente.',
    texte_pt = 'Exalto-me facilmente.'
WHERE id = 636 AND dimension_id = 29 AND position = 16 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I lack emotional self-control.',
    texte_es = 'Me falta control emocional.',
    texte_pt = 'Falta-me controlo emocional.'
WHERE id = 637 AND dimension_id = 29 AND position = 17 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I react too quickly.',
    texte_es = 'Reacciono demasiado rápido.',
    texte_pt = 'Reajo demasiado depressa.'
WHERE id = 638 AND dimension_id = 29 AND position = 18 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I let my emotions take over.',
    texte_es = 'Dejo que mis emociones tomen el control.',
    texte_pt = 'Deixo que as minhas emoções se sobreponham.'
WHERE id = 639 AND dimension_id = 29 AND position = 19 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I choose to trust others.',
    texte_es = 'Elijo confiar en los demás.',
    texte_pt = 'Escolho confiar nos outros.'
WHERE id = 640 AND dimension_id = 30 AND position = 0 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I do not attribute bad intentions without evidence.',
    texte_es = 'No atribuyo malas intenciones sin pruebas.',
    texte_pt = 'Não atribuo más intenções sem provas.'
WHERE id = 641 AND dimension_id = 30 AND position = 1 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I seek to understand before judging.',
    texte_es = 'Busco comprender antes de juzgar.',
    texte_pt = 'Procuro compreender antes de julgar.'
WHERE id = 642 AND dimension_id = 30 AND position = 2 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I give others the benefit of the doubt.',
    texte_es = 'Doy el beneficio de la duda.',
    texte_pt = 'Dou o benefício da dúvida.'
WHERE id = 643 AND dimension_id = 30 AND position = 3 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I avoid jumping to conclusions.',
    texte_es = 'Evito sacar conclusiones precipitadas.',
    texte_pt = 'Evito tirar conclusões precipitadas.'
WHERE id = 644 AND dimension_id = 30 AND position = 4 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I believe in people''s good side.',
    texte_es = 'Creo en el lado bueno de las personas.',
    texte_pt = 'Acredito no lado bom das pessoas.'
WHERE id = 645 AND dimension_id = 30 AND position = 5 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I interpret situations positively.',
    texte_es = 'Interpreto las situaciones de forma positiva.',
    texte_pt = 'Interpreto as situações de forma positiva.'
WHERE id = 646 AND dimension_id = 30 AND position = 6 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I give a second chance.',
    texte_es = 'Doy una segunda oportunidad.',
    texte_pt = 'Dou uma segunda oportunidade.'
WHERE id = 647 AND dimension_id = 30 AND position = 7 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I refuse to nurture suspicion.',
    texte_es = 'Me niego a alimentar las sospechas.',
    texte_pt = 'Recuso-me a alimentar a suspeita.'
WHERE id = 648 AND dimension_id = 30 AND position = 8 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I seek the truth before judging.',
    texte_es = 'Busco la verdad antes de juzgar.',
    texte_pt = 'Procuro a verdade antes de julgar.'
WHERE id = 649 AND dimension_id = 30 AND position = 9 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I easily distrust others.',
    texte_es = 'Desconfío fácilmente de los demás.',
    texte_pt = 'Desconfio facilmente dos outros.'
WHERE id = 650 AND dimension_id = 30 AND position = 10 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I often assume the worst.',
    texte_es = 'Suelo suponer lo peor.',
    texte_pt = 'Presumo frequentemente o pior.'
WHERE id = 651 AND dimension_id = 30 AND position = 11 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I doubt others'' intentions.',
    texte_es = 'Dudo de las intenciones de los demás.',
    texte_pt = 'Duvido das intenções dos outros.'
WHERE id = 652 AND dimension_id = 30 AND position = 12 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I quickly draw negative conclusions.',
    texte_es = 'Saco conclusiones negativas rápidamente.',
    texte_pt = 'Tiro conclusões negativas depressa.'
WHERE id = 653 AND dimension_id = 30 AND position = 13 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I easily become suspicious.',
    texte_es = 'Sospecho con facilidad.',
    texte_pt = 'Suspeito facilmente.'
WHERE id = 654 AND dimension_id = 30 AND position = 14 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I misinterpret others'' actions.',
    texte_es = 'Interpreto mal las acciones de los demás.',
    texte_pt = 'Interpreto mal as ações dos outros.'
WHERE id = 655 AND dimension_id = 30 AND position = 15 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I distrust others for no clear reason.',
    texte_es = 'Desconfío sin una razón clara.',
    texte_pt = 'Desconfio sem uma razão clara.'
WHERE id = 656 AND dimension_id = 30 AND position = 16 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I think others have bad intentions.',
    texte_es = 'Creo que los demás tienen malas intenciones.',
    texte_pt = 'Penso que os outros têm más intenções.'
WHERE id = 657 AND dimension_id = 30 AND position = 17 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I hold on to suspicions.',
    texte_es = 'Mantengo mis sospechas.',
    texte_pt = 'Mantenho suspeitas.'
WHERE id = 658 AND dimension_id = 30 AND position = 18 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I am excessively distrustful.',
    texte_es = 'Desconfío en exceso.',
    texte_pt = 'Desconfio excessivamente.'
WHERE id = 659 AND dimension_id = 30 AND position = 19 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'Injustice saddens me.',
    texte_es = 'Me entristece la injusticia.',
    texte_pt = 'A injustiça entristece-me.'
WHERE id = 660 AND dimension_id = 31 AND position = 0 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I refuse to rejoice in evil.',
    texte_es = 'Me niego a alegrarme del mal.',
    texte_pt = 'Recuso-me a alegrar-me com o mal.'
WHERE id = 661 AND dimension_id = 31 AND position = 1 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I take a stand against injustice.',
    texte_es = 'Me posiciono contra la injusticia.',
    texte_pt = 'Tomo posição contra a injustiça.'
WHERE id = 662 AND dimension_id = 31 AND position = 2 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I feel compassion for victims.',
    texte_es = 'Siento compasión por las víctimas.',
    texte_pt = 'Sinto compaixão pelas vítimas.'
WHERE id = 663 AND dimension_id = 31 AND position = 3 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I seek justice in my actions.',
    texte_es = 'Busco la justicia en mis acciones.',
    texte_pt = 'Procuro a justiça nas minhas ações.'
WHERE id = 664 AND dimension_id = 31 AND position = 4 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I reject unjust behaviour.',
    texte_es = 'Rechazo los comportamientos injustos.',
    texte_pt = 'Rejeito comportamentos injustos.'
WHERE id = 665 AND dimension_id = 31 AND position = 5 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I defend what is right.',
    texte_es = 'Defiendo lo que es justo.',
    texte_pt = 'Defendo o que é justo.'
WHERE id = 666 AND dimension_id = 31 AND position = 6 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I am sensitive to fairness.',
    texte_es = 'Soy sensible a la equidad.',
    texte_pt = 'Sou sensível à equidade.'
WHERE id = 667 AND dimension_id = 31 AND position = 7 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I refuse to benefit from injustice.',
    texte_es = 'Me niego a beneficiarme de la injusticia.',
    texte_pt = 'Recuso-me a beneficiar da injustiça.'
WHERE id = 668 AND dimension_id = 31 AND position = 8 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I align myself with what is right.',
    texte_es = 'Actúo en consonancia con lo que es justo.',
    texte_pt = 'Alinho-me com o que é justo.'
WHERE id = 669 AND dimension_id = 31 AND position = 9 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I sometimes rejoice in others'' misfortune.',
    texte_es = 'A veces me alegro del mal ajeno.',
    texte_pt = 'Por vezes alegro-me com o mal dos outros.'
WHERE id = 670 AND dimension_id = 31 AND position = 10 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I benefit from unjust situations.',
    texte_es = 'Me beneficio de situaciones injustas.',
    texte_pt = 'Beneficio de situações injustas.'
WHERE id = 671 AND dimension_id = 31 AND position = 11 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I turn a blind eye to injustice.',
    texte_es = 'Cierro los ojos ante la injusticia.',
    texte_pt = 'Fecho os olhos à injustiça.'
WHERE id = 672 AND dimension_id = 31 AND position = 12 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I downplay injustices.',
    texte_es = 'Resto importancia a las injusticias.',
    texte_pt = 'Minimizo as injustiças.'
WHERE id = 673 AND dimension_id = 31 AND position = 13 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I see some injustices as normal.',
    texte_es = 'Considero normales algunas injusticias.',
    texte_pt = 'Considero normais certas injustiças.'
WHERE id = 674 AND dimension_id = 31 AND position = 14 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I am indifferent to injustice.',
    texte_es = 'Soy indiferente a la injusticia.',
    texte_pt = 'Sou indiferente à injustiça.'
WHERE id = 675 AND dimension_id = 31 AND position = 15 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I take advantage of unjust situations.',
    texte_es = 'Saco provecho de situaciones injustas.',
    texte_pt = 'Tiro proveito de situações injustas.'
WHERE id = 676 AND dimension_id = 31 AND position = 16 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I treat evil as something ordinary.',
    texte_es = 'Le resto importancia al mal.',
    texte_pt = 'Trato o mal como algo banal.'
WHERE id = 677 AND dimension_id = 31 AND position = 17 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I rejoice in certain injustices.',
    texte_es = 'Me alegro de ciertas injusticias.',
    texte_pt = 'Alegro-me com certas injustiças.'
WHERE id = 678 AND dimension_id = 31 AND position = 18 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I do not take a stand against injustice.',
    texte_es = 'No tomo posición ante la injusticia.',
    texte_pt = 'Não tomo posição perante a injustiça.'
WHERE id = 679 AND dimension_id = 31 AND position = 19 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I rejoice in what is true.',
    texte_es = 'Me alegro de lo que es verdadero.',
    texte_pt = 'Alegro-me com o que é verdadeiro.'
WHERE id = 680 AND dimension_id = 32 AND position = 0 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I value the truth.',
    texte_es = 'Valoro la verdad.',
    texte_pt = 'Valorizo a verdade.'
WHERE id = 681 AND dimension_id = 32 AND position = 1 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I seek transparency.',
    texte_es = 'Busco la transparencia.',
    texte_pt = 'Procuro a transparência.'
WHERE id = 682 AND dimension_id = 32 AND position = 2 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I am honest in my relationships.',
    texte_es = 'Soy honesto en mis relaciones.',
    texte_pt = 'Sou honesto nas minhas relações.'
WHERE id = 683 AND dimension_id = 32 AND position = 3 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I defend the truth.',
    texte_es = 'Defiendo la verdad.',
    texte_pt = 'Defendo a verdade.'
WHERE id = 684 AND dimension_id = 32 AND position = 4 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I prefer truth to comfort.',
    texte_es = 'Prefiero la verdad a la comodidad.',
    texte_pt = 'Prefiro a verdade ao conforto.'
WHERE id = 685 AND dimension_id = 32 AND position = 5 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I act with integrity.',
    texte_es = 'Actúo con integridad.',
    texte_pt = 'Ajo com integridade.'
WHERE id = 686 AND dimension_id = 32 AND position = 6 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I rejoice when the truth comes to light.',
    texte_es = 'Me alegro cuando la verdad sale a la luz.',
    texte_pt = 'Alegro-me quando a verdade vem ao de cima.'
WHERE id = 687 AND dimension_id = 32 AND position = 7 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I live truthfully.',
    texte_es = 'Vivo en la verdad.',
    texte_pt = 'Vivo na verdade.'
WHERE id = 688 AND dimension_id = 32 AND position = 8 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I seek authenticity.',
    texte_es = 'Busco la autenticidad.',
    texte_pt = 'Procuro a autenticidade.'
WHERE id = 689 AND dimension_id = 32 AND position = 9 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I prefer to avoid the truth.',
    texte_es = 'Prefiero evitar la verdad.',
    texte_pt = 'Prefiro evitar a verdade.'
WHERE id = 690 AND dimension_id = 32 AND position = 10 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I tolerate lying.',
    texte_es = 'Tolero la mentira.',
    texte_pt = 'Tolero a mentira.'
WHERE id = 691 AND dimension_id = 32 AND position = 11 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I hide the truth.',
    texte_es = 'Oculto la verdad.',
    texte_pt = 'Escondo a verdade.'
WHERE id = 692 AND dimension_id = 32 AND position = 12 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I distort reality.',
    texte_es = 'Distorsiono la realidad.',
    texte_pt = 'Distorço a realidade.'
WHERE id = 693 AND dimension_id = 32 AND position = 13 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I run away from the truth.',
    texte_es = 'Huyo de la verdad.',
    texte_pt = 'Fujo da verdade.'
WHERE id = 694 AND dimension_id = 32 AND position = 14 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I lack transparency.',
    texte_es = 'Me falta transparencia.',
    texte_pt = 'Falta-me transparência.'
WHERE id = 695 AND dimension_id = 32 AND position = 15 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I sometimes lie.',
    texte_es = 'A veces miento.',
    texte_pt = 'Por vezes minto.'
WHERE id = 696 AND dimension_id = 32 AND position = 16 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I avoid being honest.',
    texte_es = 'Evito ser honesto.',
    texte_pt = 'Evito ser honesto.'
WHERE id = 697 AND dimension_id = 32 AND position = 17 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I prefer comfort to truth.',
    texte_es = 'Prefiero la comodidad a la verdad.',
    texte_pt = 'Prefiro o conforto à verdade.'
WHERE id = 698 AND dimension_id = 32 AND position = 18 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I downplay the truth.',
    texte_es = 'Resto importancia a la verdad.',
    texte_pt = 'Minimizo a verdade.'
WHERE id = 699 AND dimension_id = 32 AND position = 19 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I forgive easily.',
    texte_es = 'Perdono con facilidad.',
    texte_pt = 'Perdoo facilmente.'
WHERE id = 700 AND dimension_id = 33 AND position = 0 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I give a second chance.',
    texte_es = 'Doy una segunda oportunidad.',
    texte_pt = 'Dou uma segunda oportunidade.'
WHERE id = 701 AND dimension_id = 33 AND position = 1 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I cover for other people''s mistakes.',
    texte_es = 'Cubro los errores de los demás.',
    texte_pt = 'Cubro os erros dos outros.'
WHERE id = 702 AND dimension_id = 33 AND position = 2 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I show grace.',
    texte_es = 'Muestro gracia.',
    texte_pt = 'Mostro graça.'
WHERE id = 703 AND dimension_id = 33 AND position = 3 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I do not constantly bring up past wrongs.',
    texte_es = 'No recuerdo constantemente las faltas.',
    texte_pt = 'Não relembro constantemente as faltas.'
WHERE id = 704 AND dimension_id = 33 AND position = 4 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I show mercy.',
    texte_es = 'Muestro misericordia.',
    texte_pt = 'Mostro misericórdia.'
WHERE id = 705 AND dimension_id = 33 AND position = 5 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I forgive sincerely.',
    texte_es = 'Perdono sinceramente.',
    texte_pt = 'Perdoo sinceramente.'
WHERE id = 706 AND dimension_id = 33 AND position = 6 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I do not hold on to offences.',
    texte_es = 'No guardo las ofensas.',
    texte_pt = 'Não guardo as ofensas.'
WHERE id = 707 AND dimension_id = 33 AND position = 7 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I let some mistakes pass.',
    texte_es = 'Dejo pasar ciertos errores.',
    texte_pt = 'Deixo passar certos erros.'
WHERE id = 708 AND dimension_id = 33 AND position = 8 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I show understanding.',
    texte_es = 'Muestro comprensión.',
    texte_pt = 'Mostro compreensão.'
WHERE id = 709 AND dimension_id = 33 AND position = 9 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I keep offences in mind.',
    texte_es = 'Guardo las ofensas en la memoria.',
    texte_pt = 'Guardo as ofensas na memória.'
WHERE id = 710 AND dimension_id = 33 AND position = 10 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I often bring up others'' mistakes.',
    texte_es = 'Recuerdo a menudo los errores de los demás.',
    texte_pt = 'Relembro frequentemente os erros dos outros.'
WHERE id = 711 AND dimension_id = 33 AND position = 11 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I find it hard to forgive.',
    texte_es = 'Me cuesta perdonar.',
    texte_pt = 'Custa-me perdoar.'
WHERE id = 712 AND dimension_id = 33 AND position = 12 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I hold grudges.',
    texte_es = 'Guardo rencor.',
    texte_pt = 'Guardo rancor.'
WHERE id = 713 AND dimension_id = 33 AND position = 13 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I dwell on past hurts.',
    texte_es = 'Doy vueltas a las heridas del pasado.',
    texte_pt = 'Fico a remoer as mágoas.'
WHERE id = 714 AND dimension_id = 33 AND position = 14 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I refuse to forgive.',
    texte_es = 'Me niego a perdonar.',
    texte_pt = 'Recuso-me a perdoar.'
WHERE id = 715 AND dimension_id = 33 AND position = 15 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I am quick to condemn.',
    texte_es = 'Condeno con facilidad.',
    texte_pt = 'Condeno facilmente.'
WHERE id = 716 AND dimension_id = 33 AND position = 16 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I am harsh about mistakes.',
    texte_es = 'Soy duro con los errores.',
    texte_pt = 'Sou duro perante os erros.'
WHERE id = 717 AND dimension_id = 33 AND position = 17 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I do not forget past wrongs.',
    texte_es = 'No olvido las faltas.',
    texte_pt = 'Não esqueço as faltas.'
WHERE id = 718 AND dimension_id = 33 AND position = 18 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I judge harshly.',
    texte_es = 'Juzgo con severidad.',
    texte_pt = 'Julgo com severidade.'
WHERE id = 719 AND dimension_id = 33 AND position = 19 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I remain confident even in difficulties.',
    texte_es = 'Mantengo la confianza incluso en las dificultades.',
    texte_pt = 'Mantenho a confiança mesmo nas dificuldades.'
WHERE id = 720 AND dimension_id = 34 AND position = 0 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I believe others can change.',
    texte_es = 'Creo en la posibilidad de que los demás cambien.',
    texte_pt = 'Acredito na possibilidade de os outros mudarem.'
WHERE id = 721 AND dimension_id = 34 AND position = 1 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I remain full of hope.',
    texte_es = 'Sigo lleno de esperanza.',
    texte_pt = 'Mantenho-me cheio de esperança.'
WHERE id = 722 AND dimension_id = 34 AND position = 2 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I persevere in difficult relationships.',
    texte_es = 'Persevero en las relaciones difíciles.',
    texte_pt = 'Persevero nas relações difíceis.'
WHERE id = 723 AND dimension_id = 34 AND position = 3 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I support others despite trials.',
    texte_es = 'Apoyo a los demás a pesar de las pruebas.',
    texte_pt = 'Apoio os outros apesar das provações.'
WHERE id = 724 AND dimension_id = 34 AND position = 4 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I do not give up on others easily.',
    texte_es = 'No renuncio fácilmente a los demás.',
    texte_pt = 'Não desisto facilmente dos outros.'
WHERE id = 725 AND dimension_id = 34 AND position = 5 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I hold on to hope.',
    texte_es = 'Conservo la esperanza.',
    texte_pt = 'Mantenho a esperança.'
WHERE id = 726 AND dimension_id = 34 AND position = 6 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I continue to believe in good.',
    texte_es = 'Sigo creyendo en el bien.',
    texte_pt = 'Continuo a acreditar no bem.'
WHERE id = 727 AND dimension_id = 34 AND position = 7 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I endure difficult situations.',
    texte_es = 'Soporto las situaciones difíciles.',
    texte_pt = 'Suporto as situações difíceis.'
WHERE id = 728 AND dimension_id = 34 AND position = 8 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I persevere in love.',
    texte_es = 'Persevero en el amor.',
    texte_pt = 'Persevero no amor.'
WHERE id = 729 AND dimension_id = 34 AND position = 9 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I quickly lose hope.',
    texte_es = 'Pierdo rápidamente la esperanza.',
    texte_pt = 'Perco rapidamente a esperança.'
WHERE id = 730 AND dimension_id = 34 AND position = 10 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I easily give up on others.',
    texte_es = 'Renuncio fácilmente a los demás.',
    texte_pt = 'Desisto facilmente dos outros.'
WHERE id = 731 AND dimension_id = 34 AND position = 11 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I stop believing in someone.',
    texte_es = 'Dejo de creer en alguien.',
    texte_pt = 'Deixo de acreditar em alguém.'
WHERE id = 732 AND dimension_id = 34 AND position = 12 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I quickly become discouraged.',
    texte_es = 'Me desanimo rápidamente.',
    texte_pt = 'Desanimo depressa.'
WHERE id = 733 AND dimension_id = 34 AND position = 13 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I abandon difficult relationships.',
    texte_es = 'Abandono las relaciones difíciles.',
    texte_pt = 'Abandono as relações difíceis.'
WHERE id = 734 AND dimension_id = 34 AND position = 14 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I lack perseverance.',
    texte_es = 'Me falta perseverancia.',
    texte_pt = 'Falta-me perseverança.'
WHERE id = 735 AND dimension_id = 34 AND position = 15 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I no longer believe in change.',
    texte_es = 'Ya no creo en el cambio.',
    texte_pt = 'Já não acredito na mudança.'
WHERE id = 736 AND dimension_id = 34 AND position = 16 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I quickly grow weary.',
    texte_es = 'Me canso rápidamente.',
    texte_pt = 'Canso-me depressa.'
WHERE id = 737 AND dimension_id = 34 AND position = 17 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I lose confidence.',
    texte_es = 'Pierdo la confianza.',
    texte_pt = 'Perco a confiança.'
WHERE id = 738 AND dimension_id = 34 AND position = 18 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I give up when faced with difficulties.',
    texte_es = 'Abandono ante las dificultades.',
    texte_pt = 'Desisto perante as dificuldades.'
WHERE id = 739 AND dimension_id = 34 AND position = 19 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I often feel worried about the future.',
    texte_es = 'A menudo me preocupa el futuro.',
    texte_pt = 'Sinto frequentemente preocupação com o futuro.'
WHERE id = 740 AND dimension_id = 35 AND position = 0 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I fear being rejected by others.',
    texte_es = 'Temo que los demás me rechacen.',
    texte_pt = 'Receio ser rejeitado pelos outros.'
WHERE id = 741 AND dimension_id = 35 AND position = 1 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I fear not being good enough.',
    texte_es = 'Temo no estar a la altura.',
    texte_pt = 'Receio não estar à altura.'
WHERE id = 742 AND dimension_id = 35 AND position = 2 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I dread how others see or judge me.',
    texte_es = 'Temo cómo me ven o me juzgan los demás.',
    texte_pt = 'Receio o olhar ou o julgamento dos outros.'
WHERE id = 743 AND dimension_id = 35 AND position = 3 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I often feel insecure inside.',
    texte_es = 'A menudo siento inseguridad interior.',
    texte_pt = 'Sinto-me frequentemente inseguro por dentro.'
WHERE id = 744 AND dimension_id = 35 AND position = 4 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I am afraid of losing what matters to me.',
    texte_es = 'Tengo miedo de perder lo que es importante para mí.',
    texte_pt = 'Tenho medo de perder o que é importante para mim.'
WHERE id = 745 AND dimension_id = 35 AND position = 5 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'Fear holds me back in some decisions.',
    texte_es = 'El miedo me frena en algunas decisiones.',
    texte_pt = 'O medo trava-me em certas decisões.'
WHERE id = 746 AND dimension_id = 35 AND position = 6 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I dread unfamiliar situations.',
    texte_es = 'Temo las situaciones desconocidas.',
    texte_pt = 'Receio situações desconhecidas.'
WHERE id = 747 AND dimension_id = 35 AND position = 7 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I feel anxiety in my relationships.',
    texte_es = 'Siento ansiedad en mis relaciones.',
    texte_pt = 'Sinto ansiedade nas minhas relações.'
WHERE id = 748 AND dimension_id = 35 AND position = 8 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I fear the consequences of my mistakes.',
    texte_es = 'Temo las consecuencias de mis errores.',
    texte_pt = 'Receio as consequências dos meus erros.'
WHERE id = 749 AND dimension_id = 35 AND position = 9 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I feel secure within myself, even in uncertainty.',
    texte_es = 'Siento seguridad interior, incluso en la incertidumbre.',
    texte_pt = 'Sinto segurança interior, mesmo na incerteza.'
WHERE id = 750 AND dimension_id = 35 AND position = 10 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I trust God with my future.',
    texte_es = 'Confío en Dios para mi futuro.',
    texte_pt = 'Confio em Deus para o meu futuro.'
WHERE id = 751 AND dimension_id = 35 AND position = 11 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I make decisions without being paralysed by fear.',
    texte_es = 'Tomo decisiones sin que el miedo me paralice.',
    texte_pt = 'Tomo decisões sem ficar paralisado pelo medo.'
WHERE id = 752 AND dimension_id = 35 AND position = 12 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I feel free to be myself with others.',
    texte_es = 'Me siento libre de ser yo mismo con los demás.',
    texte_pt = 'Sinto-me livre para ser eu mesmo com os outros.'
WHERE id = 753 AND dimension_id = 35 AND position = 13 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I do not fear others'' judgement.',
    texte_es = 'No temo el juicio de los demás.',
    texte_pt = 'Não receio o julgamento dos outros.'
WHERE id = 754 AND dimension_id = 35 AND position = 14 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I remain at peace even in uncertain situations.',
    texte_es = 'Mantengo la paz incluso en situaciones inciertas.',
    texte_pt = 'Mantenho a paz mesmo em situações incertas.'
WHERE id = 755 AND dimension_id = 35 AND position = 15 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I face difficulties with confidence.',
    texte_es = 'Afronto las dificultades con confianza.',
    texte_pt = 'Enfrento as dificuldades com confiança.'
WHERE id = 756 AND dimension_id = 35 AND position = 16 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I remain emotionally stable when faced with unexpected events.',
    texte_es = 'Mantengo la estabilidad emocional ante los imprevistos.',
    texte_pt = 'Mantenho a estabilidade emocional perante os imprevistos.'
WHERE id = 757 AND dimension_id = 35 AND position = 17 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I believe I am accepted and loved.',
    texte_es = 'Creo que soy aceptado y amado.',
    texte_pt = 'Acredito que sou aceite e amado.'
WHERE id = 758 AND dimension_id = 35 AND position = 18 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE questions
SET texte_en = 'I live with confidence rather than fear.',
    texte_es = 'Vivo con confianza en lugar de miedo.',
    texte_pt = 'Vivo com confiança em vez de medo.'
WHERE id = 759 AND dimension_id = 35 AND position = 19 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'amour');

UPDATE tranches_interpretation
SET texte_en = 'Love is scarcely evident across the attitudes assessed. This is a warning sign: action is needed without delay.',
    texte_es = 'El amor se manifiesta muy poco en el conjunto de las actitudes evaluadas. Es una señal de alerta: es necesario actuar sin demora.',
    texte_pt = 'O amor manifesta-se muito pouco no conjunto das atitudes avaliadas. É um sinal de alerta: é necessário agir sem demora.'
WHERE position = 0 AND min_score = 0 AND max_score = 19 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = tranches_interpretation.referentiel_id AND r.code = 'amour');

UPDATE tranches_interpretation
SET texte_en = 'There are several slight signs of love. These need to be strengthened significantly.',
    texte_es = 'Hay varios indicios leves de amor. Es necesario fortalecerlos de manera significativa.',
    texte_pt = 'Existem vários sinais ténues de amor. É necessário reforçá-los significativamente.'
WHERE position = 1 AND min_score = 20 AND max_score = 39 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = tranches_interpretation.referentiel_id AND r.code = 'amour');

UPDATE tranches_interpretation
SET texte_en = 'The profile shows a real presence of love in daily life, even if its expression remains inconsistent. This needs further work.',
    texte_es = 'El perfil muestra una presencia real de amor en la vida cotidiana, aunque su expresión sigue siendo inconstante. Hay que seguir trabajando en ello.',
    texte_pt = 'O perfil mostra uma presença real de amor no dia a dia, embora a sua expressão continue a ser inconstante. É preciso continuar a trabalhar este aspeto.'
WHERE position = 2 AND min_score = 40 AND max_score = 59 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = tranches_interpretation.referentiel_id AND r.code = 'amour');

UPDATE tranches_interpretation
SET texte_en = 'Love appears to be clearly evident in several areas of life. Keep strengthening it!',
    texte_es = 'El amor parece manifestarse de forma evidente en varias áreas de la vida. ¡Sigue fortaleciéndolo!',
    texte_pt = 'O amor parece manifestar-se de forma evidente em várias áreas da vida. Continua a fortalecê-lo!'
WHERE position = 3 AND min_score = 60 AND max_score = 79 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = tranches_interpretation.referentiel_id AND r.code = 'amour');

UPDATE tranches_interpretation
SET texte_en = 'The profile reveals a very strong expression of the love of the Lord. Stay on course!',
    texte_es = 'El perfil revela una manifestación muy intensa del amor del Señor. ¡Mantén el rumbo!',
    texte_pt = 'O perfil revela uma manifestação muito forte do amor do Senhor. Mantém o rumo!'
WHERE position = 4 AND min_score = 80 AND max_score = 100 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = tranches_interpretation.referentiel_id AND r.code = 'amour');
