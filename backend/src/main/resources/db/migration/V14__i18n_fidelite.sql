-- fidelite : traductions EN / ES / PT. UTF-8.
-- Aucun texte francais, polarite, seuil ou identifiant modifie.
-- UPDATE deterministes limites au referentiel fidelite.

UPDATE referentiels
SET nom_en = 'Faithfulness',
    verset_en = 'Galatians 5:22',
    nom_es = 'Fidelidad',
    verset_es = 'Gálatas 5:22',
    nom_pt = 'Fidelidade',
    verset_pt = 'Gálatas 5:22'
WHERE code = 'fidelite' AND id = 3;

UPDATE dimensions
SET libelle_en = 'Faithfulness and love',
    libelle_court_en = 'Love',
    libelle_es = 'Fidelidad y amor',
    libelle_court_es = 'Amor',
    libelle_pt = 'Fidelidade e amor',
    libelle_court_pt = 'Amor'
WHERE id = 14 AND position = 0 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = dimensions.referentiel_id AND r.code = 'fidelite');

UPDATE dimensions
SET libelle_en = 'Faithfulness in trials and suffering',
    libelle_court_en = 'Trials/Suffering',
    libelle_es = 'Fidelidad en las pruebas y el sufrimiento',
    libelle_court_es = 'Pruebas/Sufrimiento',
    libelle_pt = 'Fidelidade nas provações e no sofrimento',
    libelle_court_pt = 'Provações/Sofrimento'
WHERE id = 15 AND position = 1 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = dimensions.referentiel_id AND r.code = 'fidelite');

UPDATE dimensions
SET libelle_en = 'Faithfulness to vows and promises',
    libelle_court_en = 'Vows/Promises',
    libelle_es = 'Fidelidad a los votos y las promesas',
    libelle_court_es = 'Votos/Promesas',
    libelle_pt = 'Fidelidade aos votos e às promessas',
    libelle_court_pt = 'Votos/Promessas'
WHERE id = 16 AND position = 2 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = dimensions.referentiel_id AND r.code = 'fidelite');

UPDATE dimensions
SET libelle_en = 'Faithfulness and loyalty',
    libelle_court_en = 'Loyalty',
    libelle_es = 'Fidelidad y lealtad',
    libelle_court_es = 'Lealtad',
    libelle_pt = 'Fidelidade e lealdade',
    libelle_court_pt = 'Lealdade'
WHERE id = 17 AND position = 3 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = dimensions.referentiel_id AND r.code = 'fidelite');

UPDATE dimensions
SET libelle_en = 'Faithfulness and integrity/consistency',
    libelle_court_en = 'Integrity/Consistency',
    libelle_es = 'Fidelidad e integridad/coherencia',
    libelle_court_es = 'Integridad/Coherencia',
    libelle_pt = 'Fidelidade e integridade/coerência',
    libelle_court_pt = 'Integridade/Coerência'
WHERE id = 18 AND position = 4 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = dimensions.referentiel_id AND r.code = 'fidelite');

UPDATE dimensions
SET libelle_en = 'Faithfulness and stewardship',
    libelle_court_en = 'Stewardship',
    libelle_es = 'Fidelidad y administración responsable',
    libelle_court_es = 'Administración responsable',
    libelle_pt = 'Fidelidade e gestão responsável',
    libelle_court_pt = 'Gestão responsável'
WHERE id = 19 AND position = 5 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = dimensions.referentiel_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I remain committed to my relationships even when my emotions change.',
    texte_es = 'Mantengo mi compromiso en las relaciones incluso cuando cambian mis emociones.',
    texte_pt = 'Mantenho o compromisso nas minhas relações mesmo quando as emoções mudam.'
WHERE id = 260 AND dimension_id = 14 AND position = 0 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I am consistent in the love I give, whatever I receive.',
    texte_es = 'Soy constante en el amor que doy, independientemente de lo que reciba.',
    texte_pt = 'Sou constante no amor que dou, seja o que for que receba.'
WHERE id = 261 AND dimension_id = 14 AND position = 1 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I remain present through difficult periods in a relationship.',
    texte_es = 'Sigo presente en los momentos difíciles de una relación.',
    texte_pt = 'Mantenho-me presente nos períodos difíceis de uma relação.'
WHERE id = 262 AND dimension_id = 14 AND position = 2 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I keep my relationship commitments over time.',
    texte_es = 'Mantengo mis compromisos en las relaciones a lo largo del tiempo.',
    texte_pt = 'Cumpro os meus compromissos relacionais ao longo do tempo.'
WHERE id = 263 AND dimension_id = 14 AND position = 3 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I am reliable in my relationships.',
    texte_es = 'Soy fiable en mis relaciones.',
    texte_pt = 'Sou fiável nas minhas relações.'
WHERE id = 264 AND dimension_id = 14 AND position = 4 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I do not easily shift my attachments.',
    texte_es = 'No cambio fácilmente mis vínculos afectivos.',
    texte_pt = 'Não mudo facilmente os meus vínculos afetivos.'
WHERE id = 265 AND dimension_id = 14 AND position = 5 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I remain invested even when a relationship is in crisis.',
    texte_es = 'Sigo implicado incluso cuando la relación atraviesa una crisis.',
    texte_pt = 'Mantenho-me empenhado mesmo quando a relação atravessa uma crise.'
WHERE id = 266 AND dimension_id = 14 AND position = 6 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I am emotionally stable in my commitments.',
    texte_es = 'Mantengo la estabilidad emocional en mis compromisos.',
    texte_pt = 'Sou emocionalmente estável nos meus compromissos.'
WHERE id = 267 AND dimension_id = 14 AND position = 7 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I show consistency in love.',
    texte_es = 'Muestro constancia en el amor.',
    texte_pt = 'Mostro constância no amor.'
WHERE id = 268 AND dimension_id = 14 AND position = 8 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I remain faithful despite relationship difficulties.',
    texte_es = 'Permanezco fiel a pesar de las dificultades en las relaciones.',
    texte_pt = 'Permaneço fiel apesar das dificuldades relacionais.'
WHERE id = 269 AND dimension_id = 14 AND position = 9 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I easily detach myself from others.',
    texte_es = 'Me desvinculo fácilmente de los demás.',
    texte_pt = 'Desligo-me facilmente dos outros.'
WHERE id = 270 AND dimension_id = 14 AND position = 10 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'My feelings change quickly.',
    texte_es = 'Mis sentimientos cambian rápidamente.',
    texte_pt = 'Os meus sentimentos mudam depressa.'
WHERE id = 271 AND dimension_id = 14 AND position = 11 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I easily abandon a difficult relationship.',
    texte_es = 'Abandono fácilmente una relación difícil.',
    texte_pt = 'Abandono facilmente uma relação difícil.'
WHERE id = 272 AND dimension_id = 14 AND position = 12 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I am unstable in my emotional commitments.',
    texte_es = 'Soy inestable en mis compromisos afectivos.',
    texte_pt = 'Sou instável nos meus compromissos afetivos.'
WHERE id = 273 AND dimension_id = 14 AND position = 13 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I lack consistency in love.',
    texte_es = 'Me falta constancia en el amor.',
    texte_pt = 'Falta-me constância no amor.'
WHERE id = 274 AND dimension_id = 14 AND position = 14 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I quickly grow weary in relationships.',
    texte_es = 'Me canso rápidamente en las relaciones.',
    texte_pt = 'Canso-me depressa nas relações.'
WHERE id = 275 AND dimension_id = 14 AND position = 15 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I easily distance myself emotionally.',
    texte_es = 'Me distancio emocionalmente con facilidad.',
    texte_pt = 'Distancio-me emocionalmente com facilidade.'
WHERE id = 276 AND dimension_id = 14 AND position = 16 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I am not emotionally dependable.',
    texte_es = 'Soy poco fiable en lo afectivo.',
    texte_pt = 'Sou pouco fiável afetivamente.'
WHERE id = 277 AND dimension_id = 14 AND position = 17 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'My attachments change quickly.',
    texte_es = 'Mis vínculos afectivos cambian rápidamente.',
    texte_pt = 'Os meus vínculos afetivos mudam depressa.'
WHERE id = 278 AND dimension_id = 14 AND position = 18 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I lack perseverance in relationships.',
    texte_es = 'Me falta perseverancia en las relaciones.',
    texte_pt = 'Falta-me perseverança nas relações.'
WHERE id = 279 AND dimension_id = 14 AND position = 19 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I remain stable in difficult periods.',
    texte_es = 'Mantengo la estabilidad en los períodos difíciles.',
    texte_pt = 'Mantenho a estabilidade nos períodos difíceis.'
WHERE id = 280 AND dimension_id = 15 AND position = 0 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I keep going despite prolonged trials.',
    texte_es = 'Sigo adelante a pesar de las pruebas prolongadas.',
    texte_pt = 'Continuo apesar das provações prolongadas.'
WHERE id = 281 AND dimension_id = 15 AND position = 1 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I persevere even when it is painful.',
    texte_es = 'Persevero incluso cuando duele.',
    texte_pt = 'Persevero mesmo quando é doloroso.'
WHERE id = 282 AND dimension_id = 15 AND position = 2 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I hold on to hope in suffering.',
    texte_es = 'Conservo la esperanza en el sufrimiento.',
    texte_pt = 'Conservo a esperança no sofrimento.'
WHERE id = 283 AND dimension_id = 15 AND position = 3 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I remain consistent in difficulties.',
    texte_es = 'Mantengo la constancia en las dificultades.',
    texte_pt = 'Mantenho a constância nas dificuldades.'
WHERE id = 284 AND dimension_id = 15 AND position = 4 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I do not give up easily.',
    texte_es = 'No me doy por vencido fácilmente.',
    texte_pt = 'Não desisto facilmente.'
WHERE id = 285 AND dimension_id = 15 AND position = 5 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I maintain a firm attitude in the face of trials.',
    texte_es = 'Mantengo una actitud firme ante las pruebas.',
    texte_pt = 'Mantenho uma atitude firme perante as provações.'
WHERE id = 286 AND dimension_id = 15 AND position = 6 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I keep going despite repeated obstacles.',
    texte_es = 'Sigo adelante a pesar de los obstáculos repetidos.',
    texte_pt = 'Continuo apesar dos obstáculos repetidos.'
WHERE id = 287 AND dimension_id = 15 AND position = 7 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I show inner endurance.',
    texte_es = 'Muestro resistencia interior.',
    texte_pt = 'Mostro resistência interior.'
WHERE id = 288 AND dimension_id = 15 AND position = 8 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I remain faithful to my values in times of trial.',
    texte_es = 'Permanezco fiel a mis valores en las pruebas.',
    texte_pt = 'Permaneço fiel aos meus valores na provação.'
WHERE id = 289 AND dimension_id = 15 AND position = 9 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I quickly become discouraged in difficulties.',
    texte_es = 'Me desanimo rápidamente ante las dificultades.',
    texte_pt = 'Desanimo depressa nas dificuldades.'
WHERE id = 290 AND dimension_id = 15 AND position = 10 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I easily give up when faced with suffering.',
    texte_es = 'Abandono fácilmente ante el sufrimiento.',
    texte_pt = 'Desisto facilmente perante o sofrimento.'
WHERE id = 291 AND dimension_id = 15 AND position = 11 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I quickly lose hope.',
    texte_es = 'Pierdo rápidamente la esperanza.',
    texte_pt = 'Perco rapidamente a esperança.'
WHERE id = 292 AND dimension_id = 15 AND position = 12 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I lack endurance in trials.',
    texte_es = 'Me falta resistencia en las pruebas.',
    texte_pt = 'Falta-me resistência nas provações.'
WHERE id = 293 AND dimension_id = 15 AND position = 13 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I am unstable in difficult periods.',
    texte_es = 'Soy inestable en los períodos difíciles.',
    texte_pt = 'Sou instável nos períodos difíceis.'
WHERE id = 294 AND dimension_id = 15 AND position = 14 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I give up when things get hard.',
    texte_es = 'Me doy por vencido cuando las cosas se ponen difíciles.',
    texte_pt = 'Desisto quando as coisas se tornam difíceis.'
WHERE id = 295 AND dimension_id = 15 AND position = 15 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I am fragile in crises.',
    texte_es = 'Soy frágil en las crisis.',
    texte_pt = 'Sou frágil nas crises.'
WHERE id = 296 AND dimension_id = 15 AND position = 16 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I generally lack perseverance.',
    texte_es = 'En general, me falta perseverancia.',
    texte_pt = 'De um modo geral, falta-me perseverança.'
WHERE id = 297 AND dimension_id = 15 AND position = 17 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I easily change direction in times of trial.',
    texte_es = 'Cambio fácilmente de rumbo en las pruebas.',
    texte_pt = 'Mudo facilmente de rumo na provação.'
WHERE id = 298 AND dimension_id = 15 AND position = 18 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I easily let things get me down.',
    texte_es = 'Me dejo abatir fácilmente.',
    texte_pt = 'Deixo-me abater facilmente.'
WHERE id = 299 AND dimension_id = 15 AND position = 19 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I keep my promises even when it costs me.',
    texte_es = 'Cumplo mis promesas aunque me cueste.',
    texte_pt = 'Cumpro as minhas promessas mesmo quando isso me custa.'
WHERE id = 300 AND dimension_id = 16 AND position = 0 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I honour my commitments whatever happens.',
    texte_es = 'Cumplo mis compromisos pase lo que pase.',
    texte_pt = 'Cumpro os compromissos que assumi, aconteça o que acontecer.'
WHERE id = 301 AND dimension_id = 16 AND position = 1 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I do what I said I would do.',
    texte_es = 'Hago lo que dije que haría.',
    texte_pt = 'Faço o que disse que faria.'
WHERE id = 302 AND dimension_id = 16 AND position = 2 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'Others can count on my word.',
    texte_es = 'Los demás pueden confiar en mi palabra.',
    texte_pt = 'Os outros podem contar com a minha palavra.'
WHERE id = 303 AND dimension_id = 16 AND position = 3 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I am reliable in what I say.',
    texte_es = 'Soy fiable en lo que digo.',
    texte_pt = 'Sou fiável nas minhas palavras.'
WHERE id = 304 AND dimension_id = 16 AND position = 4 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I follow through on what I say I will do.',
    texte_es = 'Llevo hasta el final lo que digo que haré.',
    texte_pt = 'Levo até ao fim aquilo que digo que vou fazer.'
WHERE id = 305 AND dimension_id = 16 AND position = 5 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I take my promises seriously.',
    texte_es = 'Me tomo mis promesas en serio.',
    texte_pt = 'Levo as minhas promessas a sério.'
WHERE id = 306 AND dimension_id = 16 AND position = 6 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I fulfil my responsibilities.',
    texte_es = 'Cumplo mis responsabilidades.',
    texte_pt = 'Cumpro as minhas responsabilidades.'
WHERE id = 307 AND dimension_id = 16 AND position = 7 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'My words and actions are consistent.',
    texte_es = 'Soy coherente entre lo que digo y lo que hago.',
    texte_pt = 'Sou coerente entre as minhas palavras e os meus atos.'
WHERE id = 308 AND dimension_id = 16 AND position = 8 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I remain faithful to my commitments over time.',
    texte_es = 'Permanezco fiel a mis compromisos a lo largo del tiempo.',
    texte_pt = 'Permaneço fiel aos meus compromissos ao longo do tempo.'
WHERE id = 309 AND dimension_id = 16 AND position = 9 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I readily make promises without keeping my word.',
    texte_es = 'Prometo fácilmente sin cumplir mi palabra.',
    texte_pt = 'Prometo facilmente sem cumprir a palavra.'
WHERE id = 310 AND dimension_id = 16 AND position = 10 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I forget my commitments.',
    texte_es = 'Olvido mis compromisos.',
    texte_pt = 'Esqueço-me dos meus compromissos.'
WHERE id = 311 AND dimension_id = 16 AND position = 11 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I easily change my mind.',
    texte_es = 'Cambio de opinión con facilidad.',
    texte_pt = 'Mudo de opinião com facilidade.'
WHERE id = 312 AND dimension_id = 16 AND position = 12 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I lack reliability in my words or commitments.',
    texte_es = 'Me falta fiabilidad en mis palabras o compromisos.',
    texte_pt = 'Falta-me fiabilidade nas minhas palavras ou compromissos.'
WHERE id = 313 AND dimension_id = 16 AND position = 13 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I do not always follow through on my commitments.',
    texte_es = 'No siempre llevo mis compromisos hasta el final.',
    texte_pt = 'Nem sempre levo os meus compromissos até ao fim.'
WHERE id = 314 AND dimension_id = 16 AND position = 14 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I easily withdraw from commitments.',
    texte_es = 'Me desvinculo fácilmente de mis compromisos.',
    texte_pt = 'Desligo-me facilmente dos meus compromissos.'
WHERE id = 315 AND dimension_id = 16 AND position = 15 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I lack consistency in my responsibilities.',
    texte_es = 'Me falta constancia en mis responsabilidades.',
    texte_pt = 'Falta-me constância nas minhas responsabilidades.'
WHERE id = 316 AND dimension_id = 16 AND position = 16 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'Others find it hard to count on me.',
    texte_es = 'A los demás les cuesta contar conmigo.',
    texte_pt = 'Os outros têm dificuldade em contar comigo.'
WHERE id = 317 AND dimension_id = 16 AND position = 17 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I say things without doing them.',
    texte_es = 'Digo cosas que luego no hago.',
    texte_pt = 'Digo coisas sem as fazer.'
WHERE id = 318 AND dimension_id = 16 AND position = 18 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I am inconsistent in my commitments.',
    texte_es = 'Soy irregular en mis compromisos.',
    texte_pt = 'Sou irregular nos meus compromissos.'
WHERE id = 319 AND dimension_id = 16 AND position = 19 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I remain loyal to the important people in my life.',
    texte_es = 'Permanezco leal a las personas importantes de mi vida.',
    texte_pt = 'Permaneço leal às pessoas importantes da minha vida.'
WHERE id = 320 AND dimension_id = 17 AND position = 0 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I defend absent people when they are attacked.',
    texte_es = 'Defiendo a las personas ausentes cuando las atacan.',
    texte_pt = 'Defendo as pessoas ausentes quando são atacadas.'
WHERE id = 321 AND dimension_id = 17 AND position = 1 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I do not easily betray others'' trust.',
    texte_es = 'No traiciono fácilmente la confianza de los demás.',
    texte_pt = 'Não traio facilmente a confiança dos outros.'
WHERE id = 322 AND dimension_id = 17 AND position = 2 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I remain faithful to my values even under pressure.',
    texte_es = 'Permanezco fiel a mis valores incluso bajo presión.',
    texte_pt = 'Permaneço fiel aos meus valores mesmo sob pressão.'
WHERE id = 323 AND dimension_id = 17 AND position = 3 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I am consistent in my friendships.',
    texte_es = 'Soy constante en mis amistades.',
    texte_pt = 'Sou constante nas minhas amizades.'
WHERE id = 324 AND dimension_id = 17 AND position = 4 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I keep what others tell me in confidence.',
    texte_es = 'Guardo las confidencias que me cuentan.',
    texte_pt = 'Guardo as confidências que me fazem.'
WHERE id = 325 AND dimension_id = 17 AND position = 5 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I support others in difficult times.',
    texte_es = 'Apoyo a los demás en los momentos difíciles.',
    texte_pt = 'Apoio os outros nos momentos difíceis.'
WHERE id = 326 AND dimension_id = 17 AND position = 6 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I remain present even when it does not benefit me.',
    texte_es = 'Sigo presente incluso cuando no me beneficia.',
    texte_pt = 'Mantenho-me presente mesmo quando isso não me beneficia.'
WHERE id = 327 AND dimension_id = 17 AND position = 7 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'Others say I am trustworthy.',
    texte_es = 'Los demás dan testimonio de que soy digno de confianza.',
    texte_pt = 'Os outros dão testemunho de que sou digno de confiança.'
WHERE id = 328 AND dimension_id = 17 AND position = 8 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I remain loyal despite tensions.',
    texte_es = 'Permanezco leal a pesar de las tensiones.',
    texte_pt = 'Permaneço leal apesar das tensões.'
WHERE id = 329 AND dimension_id = 17 AND position = 9 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I easily distance myself when things get complicated.',
    texte_es = 'Me distancio fácilmente cuando las cosas se complican.',
    texte_pt = 'Distancio-me facilmente quando as coisas se complicam.'
WHERE id = 330 AND dimension_id = 17 AND position = 10 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I can betray someone''s trust for my own benefit.',
    texte_es = 'Puedo traicionar la confianza de alguien por mi propio interés.',
    texte_pt = 'Posso trair uma confiança por interesse próprio.'
WHERE id = 331 AND dimension_id = 17 AND position = 11 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I readily talk about others behind their backs.',
    texte_es = 'Hablo fácilmente de los demás a sus espaldas.',
    texte_pt = 'Falo facilmente dos outros pelas costas.'
WHERE id = 332 AND dimension_id = 17 AND position = 12 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I lack loyalty in relationships.',
    texte_es = 'Me falta lealtad en las relaciones.',
    texte_pt = 'Falta-me lealdade nas relações.'
WHERE id = 333 AND dimension_id = 17 AND position = 13 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I change my position according to my own interests.',
    texte_es = 'Cambio de postura según mi interés personal.',
    texte_pt = 'Mudo de posição conforme o meu interesse pessoal.'
WHERE id = 334 AND dimension_id = 17 AND position = 14 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I am opportunistic in some relationships.',
    texte_es = 'Soy oportunista en algunas relaciones.',
    texte_pt = 'Sou oportunista em certas relações.'
WHERE id = 335 AND dimension_id = 17 AND position = 15 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I am inconsistent in my support.',
    texte_es = 'Me falta constancia al apoyar a los demás.',
    texte_pt = 'Falta-me constância no apoio que dou.'
WHERE id = 336 AND dimension_id = 17 AND position = 16 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I am not dependable in relationships.',
    texte_es = 'Soy poco fiable en las relaciones.',
    texte_pt = 'Sou pouco fiável nas relações.'
WHERE id = 337 AND dimension_id = 17 AND position = 17 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I can abandon someone in difficulty.',
    texte_es = 'Puedo abandonar a alguien en dificultades.',
    texte_pt = 'Posso abandonar alguém em dificuldade.'
WHERE id = 338 AND dimension_id = 17 AND position = 18 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I lack faithfulness in relationships.',
    texte_es = 'Me falta fidelidad en las relaciones.',
    texte_pt = 'Falta-me fidelidade nas relações.'
WHERE id = 339 AND dimension_id = 17 AND position = 19 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I finish what I start.',
    texte_es = 'Termino lo que empiezo.',
    texte_pt = 'Termino o que começo.'
WHERE id = 340 AND dimension_id = 18 AND position = 0 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I see my projects through.',
    texte_es = 'Llevo mis proyectos hasta el final.',
    texte_pt = 'Levo os meus projetos até ao fim.'
WHERE id = 341 AND dimension_id = 18 AND position = 1 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I remain motivated over time.',
    texte_es = 'Mantengo la motivación a lo largo del tiempo.',
    texte_pt = 'Mantenho a motivação ao longo do tempo.'
WHERE id = 342 AND dimension_id = 18 AND position = 2 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I persevere in pursuing my goals.',
    texte_es = 'Persevero en mis objetivos.',
    texte_pt = 'Persevero nos meus objetivos.'
WHERE id = 343 AND dimension_id = 18 AND position = 3 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I stay on course despite difficulties.',
    texte_es = 'Mantengo el rumbo a pesar de las dificultades.',
    texte_pt = 'Mantenho o rumo apesar das dificuldades.'
WHERE id = 344 AND dimension_id = 18 AND position = 4 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I remain committed until the end.',
    texte_es = 'Mantengo mi compromiso hasta el final.',
    texte_pt = 'Mantenho o compromisso até ao fim.'
WHERE id = 345 AND dimension_id = 18 AND position = 5 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I pursue my projects despite obstacles.',
    texte_es = 'Sigo adelante con mis proyectos a pesar de los obstáculos.',
    texte_pt = 'Prossigo os meus projetos apesar dos obstáculos.'
WHERE id = 346 AND dimension_id = 18 AND position = 6 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I am disciplined in my commitments.',
    texte_es = 'Soy disciplinado en mis compromisos.',
    texte_pt = 'Sou disciplinado nos meus compromissos.'
WHERE id = 347 AND dimension_id = 18 AND position = 7 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I do not quickly grow weary.',
    texte_es = 'No me canso rápidamente.',
    texte_pt = 'Não me canso depressa.'
WHERE id = 348 AND dimension_id = 18 AND position = 8 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I show consistency in my projects.',
    texte_es = 'Muestro constancia en mis proyectos.',
    texte_pt = 'Mostro constância nos meus projetos.'
WHERE id = 349 AND dimension_id = 18 AND position = 9 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I often abandon what I start.',
    texte_es = 'Suelo abandonar lo que empiezo.',
    texte_pt = 'Abandono frequentemente o que começo.'
WHERE id = 350 AND dimension_id = 18 AND position = 10 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I quickly grow weary.',
    texte_es = 'Me canso rápidamente.',
    texte_pt = 'Canso-me depressa.'
WHERE id = 351 AND dimension_id = 18 AND position = 11 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I regularly switch projects.',
    texte_es = 'Cambio de proyecto con frecuencia.',
    texte_pt = 'Mudo regularmente de projeto.'
WHERE id = 352 AND dimension_id = 18 AND position = 12 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I lack perseverance in pursuing my goals.',
    texte_es = 'Me falta perseverancia en mis objetivos.',
    texte_pt = 'Falta-me perseverança nos meus objetivos.'
WHERE id = 353 AND dimension_id = 18 AND position = 13 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I leave many things unfinished.',
    texte_es = 'Dejo muchas cosas sin terminar.',
    texte_pt = 'Deixo muitas coisas por acabar.'
WHERE id = 354 AND dimension_id = 18 AND position = 14 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I easily lose motivation.',
    texte_es = 'Pierdo la motivación fácilmente.',
    texte_pt = 'Desmotivo-me facilmente.'
WHERE id = 355 AND dimension_id = 18 AND position = 15 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I am inconsistent in my efforts.',
    texte_es = 'Soy irregular en mis esfuerzos.',
    texte_pt = 'Sou irregular nos meus esforços.'
WHERE id = 356 AND dimension_id = 18 AND position = 16 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I quickly lose interest.',
    texte_es = 'Pierdo el interés rápidamente.',
    texte_pt = 'Perco depressa o interesse.'
WHERE id = 357 AND dimension_id = 18 AND position = 17 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I give up when things become difficult.',
    texte_es = 'Renuncio cuando las cosas se ponen difíciles.',
    texte_pt = 'Desisto quando as coisas se tornam difíceis.'
WHERE id = 358 AND dimension_id = 18 AND position = 18 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I lack consistency in my projects.',
    texte_es = 'Me falta constancia en mis proyectos.',
    texte_pt = 'Falta-me constância nos meus projetos.'
WHERE id = 359 AND dimension_id = 18 AND position = 19 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I take good care of what is entrusted to me.',
    texte_es = 'Cuido bien de lo que me confían.',
    texte_pt = 'Cuido bem do que me é confiado.'
WHERE id = 360 AND dimension_id = 19 AND position = 0 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I take my responsibilities seriously.',
    texte_es = 'Asumo mis responsabilidades con seriedad.',
    texte_pt = 'Giro as minhas responsabilidades com seriedade.'
WHERE id = 361 AND dimension_id = 19 AND position = 1 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I am reliable in the tasks entrusted to me.',
    texte_es = 'Soy fiable en las tareas que me confían.',
    texte_pt = 'Sou fiável nas tarefas que me são confiadas.'
WHERE id = 362 AND dimension_id = 19 AND position = 2 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I honour the responsibilities I am given.',
    texte_es = 'Cumplo las responsabilidades que me asignan.',
    texte_pt = 'Cumpro as responsabilidades que me dão.'
WHERE id = 363 AND dimension_id = 19 AND position = 3 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I show integrity in my management.',
    texte_es = 'Muestro integridad en mi gestión.',
    texte_pt = 'Mostro integridade na minha gestão.'
WHERE id = 364 AND dimension_id = 19 AND position = 4 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I care for the resources entrusted to me.',
    texte_es = 'Cuido los recursos que me confían.',
    texte_pt = 'Cuido dos recursos que me são confiados.'
WHERE id = 365 AND dimension_id = 19 AND position = 5 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I act responsibly in my assignments.',
    texte_es = 'Soy responsable en las tareas que se me asignan.',
    texte_pt = 'Sou responsável nas minhas funções.'
WHERE id = 366 AND dimension_id = 19 AND position = 6 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I deliver thorough, complete and careful work.',
    texte_es = 'Entrego un trabajo serio, completo y cuidado.',
    texte_pt = 'Entrego um trabalho sério, concluído e cuidado.'
WHERE id = 367 AND dimension_id = 19 AND position = 7 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I am trustworthy in my management.',
    texte_es = 'Soy digno de confianza en la gestión.',
    texte_pt = 'Sou digno de confiança na gestão.'
WHERE id = 368 AND dimension_id = 19 AND position = 8 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I show faithfulness in small things (thankless or subordinate tasks).',
    texte_es = 'Muestro fidelidad en las pequeñas cosas (tareas ingratas o subalternas).',
    texte_pt = 'Mostro fidelidade nas pequenas coisas (tarefas ingratas ou subalternas).'
WHERE id = 369 AND dimension_id = 19 AND position = 9 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I easily neglect what is entrusted to me.',
    texte_es = 'Descuido fácilmente lo que me confían.',
    texte_pt = 'Negligencio facilmente o que me é confiado.'
WHERE id = 370 AND dimension_id = 19 AND position = 10 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I do not take my responsibilities seriously enough.',
    texte_es = 'Me falta seriedad en mis responsabilidades.',
    texte_pt = 'Falta-me seriedade nas minhas responsabilidades.'
WHERE id = 371 AND dimension_id = 19 AND position = 11 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I lack diligence in my management.',
    texte_es = 'Me falta diligencia en mi gestión.',
    texte_pt = 'Falta-me diligência na minha gestão.'
WHERE id = 372 AND dimension_id = 19 AND position = 12 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I put off the tasks entrusted to me.',
    texte_es = 'Pospongo las tareas que me confían.',
    texte_pt = 'Adio as tarefas que me são confiadas.'
WHERE id = 373 AND dimension_id = 19 AND position = 13 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I lack rigour.',
    texte_es = 'Me falta rigor.',
    texte_pt = 'Falta-me rigor.'
WHERE id = 374 AND dimension_id = 19 AND position = 14 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I manage my responsibilities poorly.',
    texte_es = 'Gestiono mal mis responsabilidades.',
    texte_pt = 'Giro mal as minhas responsabilidades.'
WHERE id = 375 AND dimension_id = 19 AND position = 15 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I am careless with the resources entrusted to me.',
    texte_es = 'Soy descuidado con los recursos que me confían.',
    texte_pt = 'Sou negligente com os recursos que me são confiados.'
WHERE id = 376 AND dimension_id = 19 AND position = 16 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I am inconsistent in my responsibilities and commitments.',
    texte_es = 'Soy irregular en mis responsabilidades e inconstante en mis compromisos.',
    texte_pt = 'Sou irregular nas minhas responsabilidades e inconstante nos meus compromissos.'
WHERE id = 377 AND dimension_id = 19 AND position = 17 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'Others find it hard to trust me.',
    texte_es = 'A los demás les cuesta confiar en mí.',
    texte_pt = 'Os outros têm dificuldade em confiar em mim.'
WHERE id = 378 AND dimension_id = 19 AND position = 18 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE questions
SET texte_en = 'I lack faithfulness in the details.',
    texte_es = 'Me falta fidelidad en los detalles.',
    texte_pt = 'Falta-me fidelidade nos pormenores.'
WHERE id = 379 AND dimension_id = 19 AND position = 19 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'fidelite');

UPDATE tranches_interpretation
SET texte_en = 'Faithfulness is scarcely evident across the attitudes assessed. This is a warning sign: action is needed without delay.',
    texte_es = 'La fidelidad se manifiesta muy poco en el conjunto de las actitudes evaluadas. Es una señal de alerta: es necesario actuar sin demora.',
    texte_pt = 'A fidelidade manifesta-se muito pouco no conjunto das atitudes avaliadas. É um sinal de alerta: é necessário agir sem demora.'
WHERE position = 0 AND min_score = 0 AND max_score = 19 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = tranches_interpretation.referentiel_id AND r.code = 'fidelite');

UPDATE tranches_interpretation
SET texte_en = 'There are several slight signs of faithfulness. These need to be strengthened significantly.',
    texte_es = 'Hay varios indicios leves de fidelidad. Es necesario fortalecerlos de manera significativa.',
    texte_pt = 'Existem vários sinais ténues de fidelidade. É necessário reforçá-los significativamente.'
WHERE position = 1 AND min_score = 20 AND max_score = 39 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = tranches_interpretation.referentiel_id AND r.code = 'fidelite');

UPDATE tranches_interpretation
SET texte_en = 'The profile shows a real presence of faithfulness in daily life, even if its expression remains inconsistent. This needs further work.',
    texte_es = 'El perfil muestra una presencia real de fidelidad en la vida cotidiana, aunque su expresión sigue siendo inconstante. Hay que seguir trabajando en ello.',
    texte_pt = 'O perfil mostra uma presença real de fidelidade no dia a dia, embora a sua expressão continue a ser inconstante. É preciso continuar a trabalhar este aspeto.'
WHERE position = 2 AND min_score = 40 AND max_score = 59 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = tranches_interpretation.referentiel_id AND r.code = 'fidelite');

UPDATE tranches_interpretation
SET texte_en = 'Faithfulness appears to be clearly evident in several areas of life. Keep strengthening it!',
    texte_es = 'La fidelidad parece manifestarse de forma evidente en varias áreas de la vida. ¡Sigue fortaleciéndola!',
    texte_pt = 'A fidelidade parece manifestar-se de forma evidente em várias áreas da vida. Continua a fortalecê-la!'
WHERE position = 3 AND min_score = 60 AND max_score = 79 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = tranches_interpretation.referentiel_id AND r.code = 'fidelite');

UPDATE tranches_interpretation
SET texte_en = 'The profile reveals a very strong expression of the faithfulness of the Lord. Stay on course!',
    texte_es = 'El perfil revela una manifestación muy intensa de la fidelidad del Señor. ¡Mantén el rumbo!',
    texte_pt = 'O perfil revela uma manifestação muito forte da fidelidade do Senhor. Mantém o rumo!'
WHERE position = 4 AND min_score = 80 AND max_score = 100 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = tranches_interpretation.referentiel_id AND r.code = 'fidelite');
