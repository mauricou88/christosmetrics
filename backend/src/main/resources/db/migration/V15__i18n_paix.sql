-- paix : traductions EN / ES / PT. UTF-8.
-- Aucun texte francais, polarite, seuil ou identifiant modifie.
-- UPDATE deterministes limites au referentiel paix.

UPDATE referentiels
SET nom_en = 'Peace',
    verset_en = 'Galatians 5:22',
    nom_es = 'Paz',
    verset_es = 'Gálatas 5:22',
    nom_pt = 'Paz',
    verset_pt = 'Gálatas 5:22'
WHERE code = 'paix' AND id = 2;

UPDATE dimensions
SET libelle_en = 'Worry / Anxiety',
    libelle_court_en = 'Worry/Anxiety',
    libelle_es = 'Preocupación / Ansiedad',
    libelle_court_es = 'Preocupación/Ansiedad',
    libelle_pt = 'Preocupação / Ansiedade',
    libelle_court_pt = 'Preocupação/Ansiedade'
WHERE id = 6 AND position = 0 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = dimensions.referentiel_id AND r.code = 'paix');

UPDATE dimensions
SET libelle_en = 'The need for control',
    libelle_court_en = 'Need for control',
    libelle_es = 'La necesidad de control',
    libelle_court_es = 'Necesidad de control',
    libelle_pt = 'A necessidade de controlo',
    libelle_court_pt = 'Necessidade de controlo'
WHERE id = 7 AND position = 1 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = dimensions.referentiel_id AND r.code = 'paix');

UPDATE dimensions
SET libelle_en = 'Dependence on material things',
    libelle_court_en = 'Material dependence',
    libelle_es = 'Dependencia de las cosas materiales',
    libelle_court_es = 'Dependencia material',
    libelle_pt = 'Dependência das coisas materiais',
    libelle_court_pt = 'Dependência material'
WHERE id = 8 AND position = 2 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = dimensions.referentiel_id AND r.code = 'paix');

UPDATE dimensions
SET libelle_en = 'Relationship tensions',
    libelle_court_en = 'Relationship tensions',
    libelle_es = 'Tensiones en las relaciones',
    libelle_court_es = 'Tensiones en las relaciones',
    libelle_pt = 'Tensões relacionais',
    libelle_court_pt = 'Tensões relacionais'
WHERE id = 9 AND position = 3 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = dimensions.referentiel_id AND r.code = 'paix');

UPDATE dimensions
SET libelle_en = 'Guilt and unaddressed sin',
    libelle_court_en = 'Guilt',
    libelle_es = 'Culpa y pecado no abordado',
    libelle_court_es = 'Culpa',
    libelle_pt = 'Culpa e pecado não tratado',
    libelle_court_pt = 'Culpa'
WHERE id = 10 AND position = 4 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = dimensions.referentiel_id AND r.code = 'paix');

UPDATE dimensions
SET libelle_en = 'Negative thoughts',
    libelle_court_en = 'Negative thoughts',
    libelle_es = 'Pensamientos negativos',
    libelle_court_es = 'Pensamientos negativos',
    libelle_pt = 'Pensamentos negativos',
    libelle_court_pt = 'Pensamentos negativos'
WHERE id = 11 AND position = 5 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = dimensions.referentiel_id AND r.code = 'paix');

UPDATE dimensions
SET libelle_en = 'How others see me',
    libelle_court_en = 'Others'' opinions',
    libelle_es = 'La mirada de los demás',
    libelle_court_es = 'La mirada de los demás',
    libelle_pt = 'O olhar dos outros',
    libelle_court_pt = 'O olhar dos outros'
WHERE id = 12 AND position = 6 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = dimensions.referentiel_id AND r.code = 'paix');

UPDATE dimensions
SET libelle_en = 'Trials',
    libelle_court_en = 'Trials',
    libelle_es = 'Pruebas',
    libelle_court_es = 'Pruebas',
    libelle_pt = 'Provações',
    libelle_court_pt = 'Provações'
WHERE id = 13 AND position = 7 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = dimensions.referentiel_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I often worry about the future.',
    texte_es = 'Me preocupo a menudo por el futuro.',
    texte_pt = 'Preocupo-me frequentemente com o futuro.'
WHERE id = 101 AND dimension_id = 6 AND position = 0 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I regularly feel anxiety.',
    texte_es = 'Siento ansiedad con regularidad.',
    texte_pt = 'Sinto ansiedade com regularidade.'
WHERE id = 102 AND dimension_id = 6 AND position = 1 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I often think about what could go wrong.',
    texte_es = 'Pienso a menudo en lo que podría salir mal.',
    texte_pt = 'Penso frequentemente no que pode correr mal.'
WHERE id = 103 AND dimension_id = 6 AND position = 2 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I worry even without a clear reason.',
    texte_es = 'Me preocupo incluso sin una razón clara.',
    texte_pt = 'Preocupo-me mesmo sem uma razão clara.'
WHERE id = 104 AND dimension_id = 6 AND position = 3 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I dwell a great deal on my concerns.',
    texte_es = 'Doy muchas vueltas a mis preocupaciones.',
    texte_pt = 'Fico a remoer muito as minhas preocupações.'
WHERE id = 105 AND dimension_id = 6 AND position = 4 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I struggle to stop thinking about my problems.',
    texte_es = 'Me cuesta dejar de pensar en mis problemas.',
    texte_pt = 'Custa-me parar de pensar nos meus problemas.'
WHERE id = 106 AND dimension_id = 6 AND position = 5 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I feel tense when facing uncertainty.',
    texte_es = 'Siento tensión ante la incertidumbre.',
    texte_pt = 'Sinto-me tenso perante a incerteza.'
WHERE id = 107 AND dimension_id = 6 AND position = 6 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I easily worry about others.',
    texte_es = 'Me preocupo fácilmente por los demás.',
    texte_pt = 'Preocupo-me facilmente com os outros.'
WHERE id = 108 AND dimension_id = 6 AND position = 7 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'My mind is often restless.',
    texte_es = 'Mi mente suele estar inquieta.',
    texte_pt = 'A minha mente está frequentemente agitada.'
WHERE id = 109 AND dimension_id = 6 AND position = 8 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I frequently feel inner worry.',
    texte_es = 'Siento preocupación interior con frecuencia.',
    texte_pt = 'Sinto frequentemente preocupação interior.'
WHERE id = 110 AND dimension_id = 6 AND position = 9 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I maintain a peaceful attitude towards the future.',
    texte_es = 'Mantengo una actitud de paz ante el futuro.',
    texte_pt = 'Mantenho uma atitude de paz perante o futuro.'
WHERE id = 111 AND dimension_id = 6 AND position = 10 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'Rather than worry, I choose to trust.',
    texte_es = 'En lugar de preocuparme, confío.',
    texte_pt = 'Em vez de me preocupar, confio.'
WHERE id = 112 AND dimension_id = 6 AND position = 11 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I remain calm in the face of uncertainty.',
    texte_es = 'Mantengo la calma ante la incertidumbre.',
    texte_pt = 'Mantenho a calma perante a incerteza.'
WHERE id = 113 AND dimension_id = 6 AND position = 12 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I do not let anxious thoughts overwhelm me.',
    texte_es = 'No dejo que los pensamientos de ansiedad me invadan.',
    texte_pt = 'Não me deixo dominar por pensamentos ansiosos.'
WHERE id = 114 AND dimension_id = 6 AND position = 13 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I am able to let go.',
    texte_es = 'Soy capaz de soltar.',
    texte_pt = 'Sou capaz de deixar ir.'
WHERE id = 115 AND dimension_id = 6 AND position = 14 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I sleep peacefully despite my concerns.',
    texte_es = 'Duermo en paz a pesar de las preocupaciones.',
    texte_pt = 'Durmo em paz apesar das preocupações.'
WHERE id = 116 AND dimension_id = 6 AND position = 15 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I remain mentally stable in adversity.',
    texte_es = 'Mantengo la estabilidad mental ante la adversidad.',
    texte_pt = 'Mantenho a estabilidade mental perante a adversidade.'
WHERE id = 117 AND dimension_id = 6 AND position = 16 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I cannot stop worrying.',
    texte_es = 'No consigo dejar de preocuparme.',
    texte_pt = 'Não consigo deixar de me preocupar.'
WHERE id = 118 AND dimension_id = 6 AND position = 17 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I live each day with serenity.',
    texte_es = 'Vivo el día a día con serenidad.',
    texte_pt = 'Vivo o dia a dia com serenidade.'
WHERE id = 119 AND dimension_id = 6 AND position = 18 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I remain confident about tomorrow.',
    texte_es = 'Mantengo la confianza ante el mañana.',
    texte_pt = 'Mantenho a confiança no amanhã.'
WHERE id = 120 AND dimension_id = 6 AND position = 19 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I constantly need everything to be under control.',
    texte_es = 'Necesito tenerlo todo bajo control en todo momento.',
    texte_pt = 'Preciso de ter tudo sob controlo a toda a hora.'
WHERE id = 121 AND dimension_id = 7 AND position = 0 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I feel stressed when I am not in control of a situation.',
    texte_es = 'Me estreso cuando no controlo una situación.',
    texte_pt = 'Fico stressado quando não controlo uma situação.'
WHERE id = 122 AND dimension_id = 7 AND position = 1 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I want to anticipate every possible scenario.',
    texte_es = 'Quiero prever todos los escenarios.',
    texte_pt = 'Quero antecipar todos os cenários.'
WHERE id = 123 AND dimension_id = 7 AND position = 2 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I feel uncomfortable when things slip beyond my control.',
    texte_es = 'Me siento mal cuando las cosas escapan a mi control.',
    texte_pt = 'Sinto-me mal quando as coisas escapam ao meu controlo.'
WHERE id = 124 AND dimension_id = 7 AND position = 3 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I find it hard to delegate.',
    texte_es = 'Me cuesta delegar.',
    texte_pt = 'Custa-me delegar.'
WHERE id = 125 AND dimension_id = 7 AND position = 4 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I want to organise everything in advance.',
    texte_es = 'Quiero organizarlo todo de antemano.',
    texte_pt = 'Quero organizar tudo com antecedência.'
WHERE id = 126 AND dimension_id = 7 AND position = 5 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I find unexpected events hard to tolerate.',
    texte_es = 'Me cuesta tolerar los imprevistos.',
    texte_pt = 'Custa-me tolerar os imprevistos.'
WHERE id = 127 AND dimension_id = 7 AND position = 6 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I feel tense when I am not in control.',
    texte_es = 'Siento tensión cuando no tengo el control.',
    texte_pt = 'Sinto tensão quando não tenho o controlo.'
WHERE id = 128 AND dimension_id = 7 AND position = 7 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I seek to control my surroundings.',
    texte_es = 'Busco controlar mi entorno.',
    texte_pt = 'Procuro controlar o que me rodeia.'
WHERE id = 129 AND dimension_id = 7 AND position = 8 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I feel safe only when I am in control.',
    texte_es = 'Solo me siento seguro cuando tengo el control.',
    texte_pt = 'Só me sinto seguro quando tenho o controlo.'
WHERE id = 130 AND dimension_id = 7 AND position = 9 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I accept what I cannot control.',
    texte_es = 'Acepto lo que no puedo controlar.',
    texte_pt = 'Aceito o que não posso controlar.'
WHERE id = 131 AND dimension_id = 7 AND position = 10 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I am comfortable with unexpected events.',
    texte_es = 'Me siento cómodo ante los imprevistos.',
    texte_pt = 'Sinto-me à vontade com os imprevistos.'
WHERE id = 132 AND dimension_id = 7 AND position = 11 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I let go easily.',
    texte_es = 'Suelto las cosas con facilidad.',
    texte_pt = 'Consigo deixar ir com facilidade.'
WHERE id = 133 AND dimension_id = 7 AND position = 12 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I trust the natural course of events.',
    texte_es = 'Confío en el curso natural de las cosas.',
    texte_pt = 'Confio no desenrolar natural das coisas.'
WHERE id = 134 AND dimension_id = 7 AND position = 13 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I remain calm even without being in control.',
    texte_es = 'Mantengo la calma incluso sin tener el control.',
    texte_pt = 'Mantenho a calma mesmo sem ter o controlo.'
WHERE id = 135 AND dimension_id = 7 AND position = 14 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I can delegate calmly.',
    texte_es = 'Sé delegar con serenidad.',
    texte_pt = 'Sei delegar com serenidade.'
WHERE id = 136 AND dimension_id = 7 AND position = 15 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I am flexible in the face of change.',
    texte_es = 'Soy flexible ante los cambios.',
    texte_pt = 'Sou flexível perante as mudanças.'
WHERE id = 137 AND dimension_id = 7 AND position = 16 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I do not feel the need to control everything.',
    texte_es = 'No siento la necesidad de controlarlo todo.',
    texte_pt = 'Não sinto necessidade de controlar tudo.'
WHERE id = 138 AND dimension_id = 7 AND position = 17 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I am adaptable.',
    texte_es = 'Soy adaptable.',
    texte_pt = 'Sou adaptável.'
WHERE id = 139 AND dimension_id = 7 AND position = 18 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I live with trust rather than a need for control.',
    texte_es = 'Vivo desde la confianza en lugar del control.',
    texte_pt = 'Vivo com confiança em vez de controlo.'
WHERE id = 140 AND dimension_id = 7 AND position = 19 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'My peace depends on my financial situation.',
    texte_es = 'Mi paz depende de mi situación económica.',
    texte_pt = 'A minha paz depende da minha situação financeira.'
WHERE id = 141 AND dimension_id = 8 AND position = 0 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I worry when my resources decrease.',
    texte_es = 'Me preocupo cuando disminuyen mis recursos.',
    texte_pt = 'Preocupo-me quando os meus recursos diminuem.'
WHERE id = 142 AND dimension_id = 8 AND position = 1 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'My possessions make me feel secure.',
    texte_es = 'Mis bienes me hacen sentir seguro.',
    texte_pt = 'Sinto-me seguro graças aos meus bens.'
WHERE id = 143 AND dimension_id = 8 AND position = 2 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I feel stressed by material loss.',
    texte_es = 'Me estreso ante una pérdida material.',
    texte_pt = 'Fico stressado perante uma perda material.'
WHERE id = 144 AND dimension_id = 8 AND position = 3 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I often think about money (that I do not have).',
    texte_es = 'Pienso a menudo en el dinero (que no tengo).',
    texte_pt = 'Penso frequentemente no dinheiro (que não tenho).'
WHERE id = 145 AND dimension_id = 8 AND position = 4 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I feel better when I have more resources.',
    texte_es = 'Me siento mejor cuando tengo más recursos.',
    texte_pt = 'Sinto-me melhor quando tenho mais recursos.'
WHERE id = 146 AND dimension_id = 8 AND position = 5 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'My comfort influences how I feel inside.',
    texte_es = 'Mi comodidad influye en cómo me siento por dentro.',
    texte_pt = 'O meu conforto influencia o meu estado interior.'
WHERE id = 147 AND dimension_id = 8 AND position = 6 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I worry about my financial stability.',
    texte_es = 'Me preocupa mi estabilidad económica.',
    texte_pt = 'Preocupo-me com a minha estabilidade financeira.'
WHERE id = 148 AND dimension_id = 8 AND position = 7 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I measure my security by my possessions.',
    texte_es = 'Mido mi seguridad por mis posesiones.',
    texte_pt = 'Meço a minha segurança pelos meus bens.'
WHERE id = 149 AND dimension_id = 8 AND position = 8 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I feel vulnerable without material security.',
    texte_es = 'Me siento vulnerable sin seguridad material.',
    texte_pt = 'Sinto-me frágil sem segurança material.'
WHERE id = 150 AND dimension_id = 8 AND position = 9 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'My peace does not depend on my possessions.',
    texte_es = 'Mi paz no depende de mis bienes.',
    texte_pt = 'A minha paz não depende dos meus bens.'
WHERE id = 151 AND dimension_id = 8 AND position = 10 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I remain serene even when I am in need.',
    texte_es = 'Mantengo la serenidad incluso en la escasez.',
    texte_pt = 'Mantenho a serenidade mesmo na escassez.'
WHERE id = 152 AND dimension_id = 8 AND position = 11 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I do not rely on my possessions.',
    texte_es = 'No me apoyo en mis posesiones.',
    texte_pt = 'Não me apoio nos meus bens.'
WHERE id = 153 AND dimension_id = 8 AND position = 12 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I am at peace regardless of my resources.',
    texte_es = 'Estoy en paz independientemente de mis recursos.',
    texte_pt = 'Estou em paz independentemente dos meus recursos.'
WHERE id = 154 AND dimension_id = 8 AND position = 13 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I am detached from material things.',
    texte_es = 'Estoy desprendido de lo material.',
    texte_pt = 'Sou desprendido das coisas materiais.'
WHERE id = 155 AND dimension_id = 8 AND position = 14 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I remain stable even in loss.',
    texte_es = 'Mantengo la estabilidad incluso en la pérdida.',
    texte_pt = 'Mantenho a estabilidade mesmo na perda.'
WHERE id = 156 AND dimension_id = 8 AND position = 15 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'My sense of security comes from within.',
    texte_es = 'Mi seguridad es interior.',
    texte_pt = 'A minha segurança é interior.'
WHERE id = 157 AND dimension_id = 8 AND position = 16 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I live without depending on comfort.',
    texte_es = 'Vivo sin depender de la comodidad.',
    texte_pt = 'Vivo sem depender do conforto.'
WHERE id = 158 AND dimension_id = 8 AND position = 17 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I remain serene without material guarantees.',
    texte_es = 'Mantengo la serenidad sin garantías materiales.',
    texte_pt = 'Mantenho a serenidade sem garantias materiais.'
WHERE id = 159 AND dimension_id = 8 AND position = 18 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'How I feel does not depend on money.',
    texte_es = 'Mi estado de ánimo no depende del dinero.',
    texte_pt = 'O meu estado não depende do dinheiro.'
WHERE id = 160 AND dimension_id = 8 AND position = 19 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'Conflicts trouble me deeply.',
    texte_es = 'Los conflictos me perturban profundamente.',
    texte_pt = 'Os conflitos perturbam-me profundamente.'
WHERE id = 161 AND dimension_id = 9 AND position = 0 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I lose my peace during arguments.',
    texte_es = 'Pierdo la paz en las discusiones.',
    texte_pt = 'Perco a paz nas discussões.'
WHERE id = 162 AND dimension_id = 9 AND position = 1 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'Tensions cause me a great deal of stress.',
    texte_es = 'Las tensiones me causan mucho estrés.',
    texte_pt = 'As tensões causam-me muito stress.'
WHERE id = 163 AND dimension_id = 9 AND position = 2 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I dwell on conflicts for a long time.',
    texte_es = 'Doy vueltas a los conflictos durante mucho tiempo.',
    texte_pt = 'Fico a remoer os conflitos durante muito tempo.'
WHERE id = 164 AND dimension_id = 9 AND position = 3 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'Disagreements affect me.',
    texte_es = 'Los desacuerdos me afectan.',
    texte_pt = 'Os desacordos afetam-me.'
WHERE id = 165 AND dimension_id = 9 AND position = 4 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I feel anger in tense situations.',
    texte_es = 'Siento ira en situaciones de tensión.',
    texte_pt = 'Sinto raiva nas situações de tensão.'
WHERE id = 166 AND dimension_id = 9 AND position = 5 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I feel bad for a long time after a conflict.',
    texte_es = 'Me siento mal durante mucho tiempo después de un conflicto.',
    texte_pt = 'Sinto-me mal durante muito tempo depois de um conflito.'
WHERE id = 167 AND dimension_id = 9 AND position = 6 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'Relationships strongly influence how I feel.',
    texte_es = 'Las relaciones influyen mucho en mi estado de ánimo.',
    texte_pt = 'As relações influenciam muito o meu estado.'
WHERE id = 168 AND dimension_id = 9 AND position = 7 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'Disagreements unsettle me.',
    texte_es = 'Los desacuerdos me alteran.',
    texte_pt = 'Os desacordos perturbam-me.'
WHERE id = 169 AND dimension_id = 9 AND position = 8 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I lose my serenity in tense situations.',
    texte_es = 'Pierdo la serenidad en situaciones de tensión.',
    texte_pt = 'Perco a serenidade nas situações de tensão.'
WHERE id = 170 AND dimension_id = 9 AND position = 9 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I remain calm during conflicts.',
    texte_es = 'Mantengo la calma en los conflictos.',
    texte_pt = 'Mantenho a calma nos conflitos.'
WHERE id = 171 AND dimension_id = 9 AND position = 10 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I maintain peace despite tensions.',
    texte_es = 'Mantengo la paz a pesar de las tensiones.',
    texte_pt = 'Mantenho a paz apesar das tensões.'
WHERE id = 172 AND dimension_id = 9 AND position = 11 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I take a step back from conflicts.',
    texte_es = 'Tomo distancia ante los conflictos.',
    texte_pt = 'Distancio-me um pouco dos conflitos.'
WHERE id = 173 AND dimension_id = 9 AND position = 12 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I detach myself emotionally from arguments.',
    texte_es = 'Me distancio emocionalmente de las discusiones.',
    texte_pt = 'Distancio-me emocionalmente das discussões.'
WHERE id = 174 AND dimension_id = 9 AND position = 13 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I remain stable in difficult relationships.',
    texte_es = 'Mantengo la estabilidad en las relaciones difíciles.',
    texte_pt = 'Mantenho a estabilidade nas relações difíceis.'
WHERE id = 175 AND dimension_id = 9 AND position = 14 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I do not let conflicts overwhelm me.',
    texte_es = 'No dejo que los conflictos me invadan.',
    texte_pt = 'Não me deixo dominar pelos conflitos.'
WHERE id = 176 AND dimension_id = 9 AND position = 15 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I handle tensions calmly.',
    texte_es = 'Gestiono las tensiones con calma.',
    texte_pt = 'Giro as tensões com calma.'
WHERE id = 177 AND dimension_id = 9 AND position = 16 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I remain composed in disagreements.',
    texte_es = 'Mantengo la serenidad ante los desacuerdos.',
    texte_pt = 'Mantenho a serenidade perante os desacordos.'
WHERE id = 178 AND dimension_id = 9 AND position = 17 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I maintain inner peace during conflicts.',
    texte_es = 'Mantengo la paz interior en los conflictos.',
    texte_pt = 'Mantenho a paz interior nos conflitos.'
WHERE id = 179 AND dimension_id = 9 AND position = 18 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I remain stable despite tensions.',
    texte_es = 'Mantengo la estabilidad a pesar de las tensiones.',
    texte_pt = 'Mantenho a estabilidade apesar das tensões.'
WHERE id = 180 AND dimension_id = 9 AND position = 19 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I constantly feel guilty about my actions, words or thoughts.',
    texte_es = 'Siento culpa constantemente por mis actos, palabras o pensamientos.',
    texte_pt = 'Sinto constantemente culpa pelos meus atos, palavras ou pensamentos.'
WHERE id = 181 AND dimension_id = 10 AND position = 0 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I think back to my past mistakes.',
    texte_es = 'Vuelvo a pensar en mis errores del pasado.',
    texte_pt = 'Volto a pensar nos meus erros passados.'
WHERE id = 182 AND dimension_id = 10 AND position = 1 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I feel condemned within myself.',
    texte_es = 'Me siento condenado por dentro.',
    texte_pt = 'Sinto-me condenado por dentro.'
WHERE id = 183 AND dimension_id = 10 AND position = 2 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I blame myself for certain things.',
    texte_es = 'Me reprocho ciertas cosas.',
    texte_pt = 'Recrimino-me por certas coisas.'
WHERE id = 184 AND dimension_id = 10 AND position = 3 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I carry persistent regrets.',
    texte_es = 'Arrastro arrepentimientos persistentes.',
    texte_pt = 'Carrego arrependimentos persistentes.'
WHERE id = 185 AND dimension_id = 10 AND position = 4 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I feel bad because of my wrongs.',
    texte_es = 'Me siento mal por mis faltas.',
    texte_pt = 'Sinto-me mal por causa das minhas faltas.'
WHERE id = 186 AND dimension_id = 10 AND position = 5 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'My past troubles me inside.',
    texte_es = 'Mi pasado me perturba interiormente.',
    texte_pt = 'O meu passado perturba-me interiormente.'
WHERE id = 187 AND dimension_id = 10 AND position = 6 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I feel a weight inside.',
    texte_es = 'Siento un peso interior.',
    texte_pt = 'Sinto um peso interior.'
WHERE id = 188 AND dimension_id = 10 AND position = 7 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I judge myself harshly.',
    texte_es = 'Me juzgo con severidad.',
    texte_pt = 'Julgo-me com severidade.'
WHERE id = 189 AND dimension_id = 10 AND position = 8 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'My mistakes affect me.',
    texte_es = 'Mis errores me afectan.',
    texte_pt = 'Os meus erros afetam-me.'
WHERE id = 190 AND dimension_id = 10 AND position = 9 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I am at peace with my past.',
    texte_es = 'Estoy en paz con mi pasado.',
    texte_pt = 'Estou em paz com o meu passado.'
WHERE id = 191 AND dimension_id = 10 AND position = 10 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I feel deeply forgiven.',
    texte_es = 'Me siento profundamente perdonado.',
    texte_pt = 'Sinto-me profundamente perdoado.'
WHERE id = 192 AND dimension_id = 10 AND position = 11 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I do not feel weighed down inside.',
    texte_es = 'No me siento abrumado por dentro.',
    texte_pt = 'Não me sinto oprimido por dentro.'
WHERE id = 193 AND dimension_id = 10 AND position = 12 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I free myself from my mistakes.',
    texte_es = 'Me libero de mis errores.',
    texte_pt = 'Liberto-me dos meus erros.'
WHERE id = 194 AND dimension_id = 10 AND position = 13 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I live without inner condemnation.',
    texte_es = 'Vivo sin condena interior.',
    texte_pt = 'Vivo sem condenação interior.'
WHERE id = 195 AND dimension_id = 10 AND position = 14 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I let go of my past wrongs.',
    texte_es = 'Dejo atrás mis faltas pasadas.',
    texte_pt = 'Deixo para trás as minhas faltas passadas.'
WHERE id = 196 AND dimension_id = 10 AND position = 15 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I get back up without remaining stuck on what happened.',
    texte_es = 'Me levanto sin quedarme atrapado en lo que pasó.',
    texte_pt = 'Volto a levantar-me sem ficar preso ao que aconteceu.'
WHERE id = 197 AND dimension_id = 10 AND position = 16 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I live with inner freedom.',
    texte_es = 'Vivo con libertad interior.',
    texte_pt = 'Vivo com liberdade interior.'
WHERE id = 198 AND dimension_id = 10 AND position = 17 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I am at peace with myself.',
    texte_es = 'Estoy en paz conmigo mismo.',
    texte_pt = 'Estou em paz comigo mesmo.'
WHERE id = 199 AND dimension_id = 10 AND position = 18 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I often think negatively.',
    texte_es = 'Pienso a menudo de forma negativa.',
    texte_pt = 'Penso frequentemente de forma negativa.'
WHERE id = 200 AND dimension_id = 11 AND position = 0 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I easily imagine the worst.',
    texte_es = 'Imagino lo peor con facilidad.',
    texte_pt = 'Imagino facilmente o pior.'
WHERE id = 201 AND dimension_id = 11 AND position = 1 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I imagine negative scenarios.',
    texte_es = 'Imagino escenarios negativos.',
    texte_pt = 'Imagino cenários negativos.'
WHERE id = 202 AND dimension_id = 11 AND position = 2 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I often doubt.',
    texte_es = 'Dudo a menudo.',
    texte_pt = 'Duvido frequentemente.'
WHERE id = 203 AND dimension_id = 11 AND position = 3 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'Negative thoughts overwhelm me.',
    texte_es = 'Los pensamientos negativos me invaden.',
    texte_pt = 'Os pensamentos negativos dominam-me.'
WHERE id = 204 AND dimension_id = 11 AND position = 4 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I focus on the negative first.',
    texte_es = 'Me fijo primero en lo negativo.',
    texte_pt = 'Concentro-me primeiro no que é negativo.'
WHERE id = 205 AND dimension_id = 11 AND position = 5 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I criticise myself in my thoughts.',
    texte_es = 'Me critico interiormente.',
    texte_pt = 'Critico-me interiormente.'
WHERE id = 206 AND dimension_id = 11 AND position = 6 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I feel pessimistic.',
    texte_es = 'Siento pesimismo.',
    texte_pt = 'Sinto pessimismo.'
WHERE id = 207 AND dimension_id = 11 AND position = 7 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'My mind is often negative.',
    texte_es = 'Mi mente suele ser negativa.',
    texte_pt = 'A minha mente é frequentemente negativa.'
WHERE id = 208 AND dimension_id = 11 AND position = 8 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I see the dark side of things.',
    texte_es = 'Veo el lado oscuro de las cosas.',
    texte_pt = 'Vejo o lado sombrio das coisas.'
WHERE id = 209 AND dimension_id = 11 AND position = 9 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I think positively.',
    texte_es = 'Pienso de forma positiva.',
    texte_pt = 'Penso de forma positiva.'
WHERE id = 210 AND dimension_id = 11 AND position = 10 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I maintain constructive thoughts.',
    texte_es = 'Mantengo pensamientos constructivos.',
    texte_pt = 'Mantenho pensamentos construtivos.'
WHERE id = 211 AND dimension_id = 11 AND position = 11 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'My thoughts are restless.',
    texte_es = 'Mis pensamientos están agitados.',
    texte_pt = 'Os meus pensamentos estão agitados.'
WHERE id = 212 AND dimension_id = 11 AND position = 12 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I choose positive thoughts.',
    texte_es = 'Elijo pensamientos positivos.',
    texte_pt = 'Escolho pensamentos positivos.'
WHERE id = 213 AND dimension_id = 11 AND position = 13 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I maintain a healthy perspective.',
    texte_es = 'Mantengo una perspectiva sana.',
    texte_pt = 'Mantenho uma perspetiva saudável.'
WHERE id = 214 AND dimension_id = 11 AND position = 14 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I do not let myself become mentally overwhelmed.',
    texte_es = 'No dejo que mi mente se vea desbordada.',
    texte_pt = 'Não me deixo dominar mentalmente.'
WHERE id = 215 AND dimension_id = 11 AND position = 15 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I cultivate peaceful thoughts.',
    texte_es = 'Cultivo pensamientos de paz.',
    texte_pt = 'Cultivo pensamentos de paz.'
WHERE id = 216 AND dimension_id = 11 AND position = 16 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I remain optimistic whatever happens.',
    texte_es = 'Mantengo el optimismo pase lo que pase.',
    texte_pt = 'Mantenho o otimismo aconteça o que acontecer.'
WHERE id = 217 AND dimension_id = 11 AND position = 17 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I maintain a stable mind.',
    texte_es = 'Mantengo una mente estable.',
    texte_pt = 'Mantenho uma mente estável.'
WHERE id = 218 AND dimension_id = 11 AND position = 18 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I control my mind.',
    texte_es = 'Controlo mi mente.',
    texte_pt = 'Controlo a minha mente.'
WHERE id = 219 AND dimension_id = 11 AND position = 19 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'How others see me influences how I feel.',
    texte_es = 'La forma en que me ven los demás influye en mi estado de ánimo.',
    texte_pt = 'A forma como os outros me veem influencia o meu estado.'
WHERE id = 220 AND dimension_id = 12 AND position = 0 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I need validation.',
    texte_es = 'Necesito validación.',
    texte_pt = 'Preciso de validação.'
WHERE id = 221 AND dimension_id = 12 AND position = 1 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I feel bad if I am not recognised.',
    texte_es = 'Me siento mal si no me reconocen.',
    texte_pt = 'Sinto-me mal se não sou reconhecido.'
WHERE id = 222 AND dimension_id = 12 AND position = 2 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I seek others'' approval.',
    texte_es = 'Busco la aprobación de los demás.',
    texte_pt = 'Procuro a aprovação dos outros.'
WHERE id = 223 AND dimension_id = 12 AND position = 3 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I am sensitive to criticism.',
    texte_es = 'Soy sensible a las críticas.',
    texte_pt = 'Sou sensível às críticas.'
WHERE id = 224 AND dimension_id = 12 AND position = 4 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I want to be accepted.',
    texte_es = 'Quiero que me acepten.',
    texte_pt = 'Quero ser aceite.'
WHERE id = 225 AND dimension_id = 12 AND position = 5 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'How I feel depends on others'' opinions.',
    texte_es = 'Mi estado de ánimo depende de la opinión de los demás.',
    texte_pt = 'O meu estado depende da opinião dos outros.'
WHERE id = 226 AND dimension_id = 12 AND position = 6 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I fear judgement.',
    texte_es = 'Temo que me juzguen.',
    texte_pt = 'Receio o julgamento.'
WHERE id = 227 AND dimension_id = 12 AND position = 7 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I seek to please.',
    texte_es = 'Busco agradar.',
    texte_pt = 'Procuro agradar.'
WHERE id = 228 AND dimension_id = 12 AND position = 8 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'What others think affects me.',
    texte_es = 'Me afecta lo que piensan los demás.',
    texte_pt = 'Afeta-me o que os outros pensam.'
WHERE id = 229 AND dimension_id = 12 AND position = 9 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I remain stable regardless of others.',
    texte_es = 'Mantengo la estabilidad independientemente de los demás.',
    texte_pt = 'Mantenho a estabilidade independentemente dos outros.'
WHERE id = 230 AND dimension_id = 12 AND position = 10 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I do not seek external validation.',
    texte_es = 'No busco validación externa.',
    texte_pt = 'Não procuro validação externa.'
WHERE id = 231 AND dimension_id = 12 AND position = 11 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I am free from the hold of others'' opinions.',
    texte_es = 'Soy libre de la mirada de los demás.',
    texte_pt = 'Sou livre do olhar dos outros.'
WHERE id = 232 AND dimension_id = 12 AND position = 12 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I am confident in my identity.',
    texte_es = 'Tengo confianza en mi identidad.',
    texte_pt = 'Tenho confiança na minha identidade.'
WHERE id = 233 AND dimension_id = 12 AND position = 13 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I remain stable in the face of criticism.',
    texte_es = 'Mantengo la estabilidad ante las críticas.',
    texte_pt = 'Mantenho a estabilidade perante as críticas.'
WHERE id = 234 AND dimension_id = 12 AND position = 14 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I do not need approval.',
    texte_es = 'No necesito aprobación.',
    texte_pt = 'Não preciso de aprovação.'
WHERE id = 235 AND dimension_id = 12 AND position = 15 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I am inwardly free from others'' opinions.',
    texte_es = 'Soy libre por dentro de la opinión de los demás.',
    texte_pt = 'Sou interiormente livre da opinião dos outros.'
WHERE id = 236 AND dimension_id = 12 AND position = 16 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I do not depend on how others see me.',
    texte_es = 'No dependo de cómo me ven los demás.',
    texte_pt = 'Não dependo da forma como os outros me veem.'
WHERE id = 237 AND dimension_id = 12 AND position = 17 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I am grounded in myself.',
    texte_es = 'Estoy afianzado en mí mismo.',
    texte_pt = 'Estou ancorado em mim mesmo.'
WHERE id = 238 AND dimension_id = 12 AND position = 18 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I live without social pressure.',
    texte_es = 'Vivo sin presión social.',
    texte_pt = 'Vivo sem pressão social.'
WHERE id = 239 AND dimension_id = 12 AND position = 19 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I see trials as unfair.',
    texte_es = 'Veo las pruebas como algo injusto.',
    texte_pt = 'Vejo as provações como injustas.'
WHERE id = 240 AND dimension_id = 13 AND position = 0 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I become discouraged in difficulties.',
    texte_es = 'Me desanimo ante las dificultades.',
    texte_pt = 'Desanimo nas dificuldades.'
WHERE id = 241 AND dimension_id = 13 AND position = 1 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I lose confidence in times of trial.',
    texte_es = 'Pierdo la confianza en las pruebas.',
    texte_pt = 'Perco a confiança nas provações.'
WHERE id = 242 AND dimension_id = 13 AND position = 2 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I feel abandoned in difficult times.',
    texte_es = 'Me siento abandonado en los momentos difíciles.',
    texte_pt = 'Sinto-me abandonado nos momentos difíceis.'
WHERE id = 243 AND dimension_id = 13 AND position = 3 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I feel a sense of injustice.',
    texte_es = 'Siento que hay injusticia.',
    texte_pt = 'Sinto injustiça.'
WHERE id = 244 AND dimension_id = 13 AND position = 4 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I become bitter in times of trial.',
    texte_es = 'Me lleno de amargura en las pruebas.',
    texte_pt = 'Fico amargurado nas provações.'
WHERE id = 245 AND dimension_id = 13 AND position = 5 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I easily lose hope.',
    texte_es = 'Pierdo la esperanza fácilmente.',
    texte_pt = 'Perco facilmente a esperança.'
WHERE id = 246 AND dimension_id = 13 AND position = 6 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I complain in difficult times.',
    texte_es = 'Me quejo en las dificultades.',
    texte_pt = 'Queixo-me nas dificuldades.'
WHERE id = 247 AND dimension_id = 13 AND position = 7 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I see trials negatively.',
    texte_es = 'Veo las pruebas de forma negativa.',
    texte_pt = 'Vejo as provações de forma negativa.'
WHERE id = 248 AND dimension_id = 13 AND position = 8 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I feel downhearted in difficulties.',
    texte_es = 'Me siento abatido ante las dificultades.',
    texte_pt = 'Sinto-me abatido nas dificuldades.'
WHERE id = 249 AND dimension_id = 13 AND position = 9 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I see meaning in trials.',
    texte_es = 'Veo un sentido en las pruebas.',
    texte_pt = 'Vejo sentido nas provações.'
WHERE id = 250 AND dimension_id = 13 AND position = 10 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I remain confident in difficulties.',
    texte_es = 'Mantengo la confianza en las dificultades.',
    texte_pt = 'Mantenho a confiança nas dificuldades.'
WHERE id = 251 AND dimension_id = 13 AND position = 11 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I remain positive in times of trial.',
    texte_es = 'Mantengo una actitud positiva en las pruebas.',
    texte_pt = 'Mantenho uma atitude positiva nas provações.'
WHERE id = 252 AND dimension_id = 13 AND position = 12 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I see trials as opportunities to learn.',
    texte_es = 'Veo las pruebas como experiencias de aprendizaje.',
    texte_pt = 'Vejo as provações como experiências de aprendizagem.'
WHERE id = 253 AND dimension_id = 13 AND position = 13 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I hold on to hope despite difficulties.',
    texte_es = 'Conservo la esperanza a pesar de las dificultades.',
    texte_pt = 'Mantenho a esperança apesar das dificuldades.'
WHERE id = 254 AND dimension_id = 13 AND position = 14 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I remain stable in times of trial.',
    texte_es = 'Mantengo la estabilidad en las pruebas.',
    texte_pt = 'Mantenho a estabilidade nas provações.'
WHERE id = 255 AND dimension_id = 13 AND position = 15 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I grow through difficulties.',
    texte_es = 'Crezco a través de las dificultades.',
    texte_pt = 'Cresço através das dificuldades.'
WHERE id = 256 AND dimension_id = 13 AND position = 16 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I maintain a good attitude.',
    texte_es = 'Mantengo una buena actitud.',
    texte_pt = 'Mantenho uma boa atitude.'
WHERE id = 257 AND dimension_id = 13 AND position = 17 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I remain confident through storms.',
    texte_es = 'Mantengo la confianza en las tormentas.',
    texte_pt = 'Mantenho a confiança nas tempestades.'
WHERE id = 258 AND dimension_id = 13 AND position = 18 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE questions
SET texte_en = 'I maintain a constructive outlook.',
    texte_es = 'Mantengo una perspectiva constructiva.',
    texte_pt = 'Mantenho uma perspetiva construtiva.'
WHERE id = 259 AND dimension_id = 13 AND position = 19 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'paix');

UPDATE tranches_interpretation
SET texte_en = 'Peace is scarcely evident across the attitudes assessed. This is a warning sign: action is needed without delay.',
    texte_es = 'La paz se manifiesta muy poco en el conjunto de las actitudes evaluadas. Es una señal de alerta: es necesario actuar sin demora.',
    texte_pt = 'A paz manifesta-se muito pouco no conjunto das atitudes avaliadas. É um sinal de alerta: é necessário agir sem demora.'
WHERE position = 0 AND min_score = 0 AND max_score = 19 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = tranches_interpretation.referentiel_id AND r.code = 'paix');

UPDATE tranches_interpretation
SET texte_en = 'There are several slight signs of peace. These need to be strengthened significantly.',
    texte_es = 'Hay varios indicios leves de paz. Es necesario fortalecerlos de manera significativa.',
    texte_pt = 'Existem vários sinais ténues de paz. É necessário reforçá-los significativamente.'
WHERE position = 1 AND min_score = 20 AND max_score = 39 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = tranches_interpretation.referentiel_id AND r.code = 'paix');

UPDATE tranches_interpretation
SET texte_en = 'The profile shows a real presence of peace in daily life, even if its expression remains inconsistent. This needs further work.',
    texte_es = 'El perfil muestra una presencia real de paz en la vida cotidiana, aunque su expresión sigue siendo inconstante. Hay que seguir trabajando en ello.',
    texte_pt = 'O perfil mostra uma presença real de paz no dia a dia, embora a sua expressão continue a ser inconstante. É preciso continuar a trabalhar este aspeto.'
WHERE position = 2 AND min_score = 40 AND max_score = 59 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = tranches_interpretation.referentiel_id AND r.code = 'paix');

UPDATE tranches_interpretation
SET texte_en = 'Peace appears to be clearly evident in several areas of life. Keep strengthening it!',
    texte_es = 'La paz parece manifestarse de forma evidente en varias áreas de la vida. ¡Sigue fortaleciéndola!',
    texte_pt = 'A paz parece manifestar-se de forma evidente em várias áreas da vida. Continua a fortalecê-la!'
WHERE position = 3 AND min_score = 60 AND max_score = 79 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = tranches_interpretation.referentiel_id AND r.code = 'paix');

UPDATE tranches_interpretation
SET texte_en = 'The profile reveals a very strong expression of the peace of the Lord. Stay on course!',
    texte_es = 'El perfil revela una manifestación muy intensa de la paz del Señor. ¡Mantén el rumbo!',
    texte_pt = 'O perfil revela uma manifestação muito forte da paz do Senhor. Mantém o rumo!'
WHERE position = 4 AND min_score = 80 AND max_score = 100 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = tranches_interpretation.referentiel_id AND r.code = 'paix');
