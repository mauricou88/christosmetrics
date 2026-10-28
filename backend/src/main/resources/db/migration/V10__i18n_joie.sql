-- Joie : traductions EN / ES / PT validees selon le glossaire du pilote.
-- UTF-8. Les ids, textes francais, polarites et seuils restent inchanges.
-- UPDATE deterministes, limites au referentiel joie et a ses dependances.

UPDATE referentiels
SET nom_en = 'Joy',
    nom_es = 'Alegría',
    nom_pt = 'Alegria',
    verset_en = 'Galatians 5:22',
    verset_es = 'Gálatas 5:22',
    verset_pt = 'Gálatas 5:22'
WHERE code = 'joie' AND id = 1;

UPDATE dimensions AS d
SET libelle_en = 'Joy and circumstances',
    libelle_es = 'La alegría y las circunstancias',
    libelle_pt = 'A alegria e as circunstâncias',
    libelle_court_en = 'Circumstances',
    libelle_court_es = 'Circunstancias',
    libelle_court_pt = 'Circunstâncias'
WHERE d.id = 1 AND d.position = 0
  AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = d.referentiel_id AND r.code = 'joie');

UPDATE dimensions AS d
SET libelle_en = 'Joy and trials',
    libelle_es = 'La alegría y las pruebas',
    libelle_pt = 'A alegria e as provações',
    libelle_court_en = 'Trials',
    libelle_court_es = 'Pruebas',
    libelle_court_pt = 'Provações'
WHERE d.id = 2 AND d.position = 1
  AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = d.referentiel_id AND r.code = 'joie');

UPDATE dimensions AS d
SET libelle_en = 'Joy and relationships',
    libelle_es = 'La alegría y las relaciones',
    libelle_pt = 'A alegria e as relações',
    libelle_court_en = 'Relationships',
    libelle_court_es = 'Relaciones',
    libelle_court_pt = 'Relações'
WHERE d.id = 3 AND d.position = 2
  AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = d.referentiel_id AND r.code = 'joie');

UPDATE dimensions AS d
SET libelle_en = 'Intrapersonal joy',
    libelle_es = 'La alegría intrapersonal',
    libelle_pt = 'A alegria intrapessoal',
    libelle_court_en = 'Intrapersonal',
    libelle_court_es = 'Intrapersonal',
    libelle_court_pt = 'Intrapessoal'
WHERE d.id = 4 AND d.position = 3
  AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = d.referentiel_id AND r.code = 'joie');

UPDATE dimensions AS d
SET libelle_en = 'Joy and God',
    libelle_es = 'La alegría y Dios',
    libelle_pt = 'A alegria e Deus',
    libelle_court_en = 'God',
    libelle_court_es = 'Dios',
    libelle_court_pt = 'Deus'
WHERE d.id = 5 AND d.position = 4
  AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = d.referentiel_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I keep a positive attitude even when things go wrong.',
    texte_es = 'Mantengo una actitud positiva incluso cuando las cosas van mal.',
    texte_pt = 'Mantenho uma atitude positiva mesmo quando as coisas correm mal.'
WHERE q.id = 1 AND q.dimension_id = 1 AND q.position = 0
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'My joy does not depend solely on what happens to me.',
    texte_es = 'Mi alegría no depende únicamente de lo que me ocurre.',
    texte_pt = 'A minha alegria não depende apenas do que me acontece.'
WHERE q.id = 2 AND q.dimension_id = 1 AND q.position = 1
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I remain emotionally stable through changes.',
    texte_es = 'Mantengo la estabilidad emocional ante los cambios.',
    texte_pt = 'Mantenho a estabilidade emocional perante as mudanças.'
WHERE q.id = 3 AND q.dimension_id = 1 AND q.position = 2
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I find reasons to be grateful even in difficult situations.',
    texte_es = 'Encuentro motivos para estar agradecido incluso en situaciones difíciles.',
    texte_pt = 'Encontro motivos para estar grato mesmo em situações difíceis.'
WHERE q.id = 4 AND q.dimension_id = 1 AND q.position = 3
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I remain at peace within myself despite unexpected events.',
    texte_es = 'Mantengo la paz interior a pesar de los imprevistos.',
    texte_pt = 'Mantenho a paz interior apesar dos imprevistos.'
WHERE q.id = 5 AND q.dimension_id = 1 AND q.position = 4
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I can rejoice even when my plans fail.',
    texte_es = 'Puedo alegrarme incluso cuando mis planes fracasan.',
    texte_pt = 'Consigo alegrar-me mesmo quando os meus planos falham.'
WHERE q.id = 6 AND q.dimension_id = 1 AND q.position = 5
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I keep a constructive attitude in difficult times.',
    texte_es = 'Mantengo una actitud constructiva ante las dificultades.',
    texte_pt = 'Mantenho uma atitude construtiva perante as dificuldades.'
WHERE q.id = 7 AND q.dimension_id = 1 AND q.position = 6
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I can see the positive in negative situations.',
    texte_es = 'Soy capaz de ver lo positivo en situaciones negativas.',
    texte_pt = 'Sou capaz de ver o lado positivo em situações negativas.'
WHERE q.id = 8 AND q.dimension_id = 1 AND q.position = 7
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I do not let circumstances determine my emotions.',
    texte_es = 'No dejo que las circunstancias determinen mis emociones.',
    texte_pt = 'Não deixo que as circunstâncias determinem as minhas emoções.'
WHERE q.id = 9 AND q.dimension_id = 1 AND q.position = 8
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I maintain a sense of inner joy even in uncertainty.',
    texte_es = 'Mantengo la alegría interior incluso en la incertidumbre.',
    texte_pt = 'Mantenho a alegria interior mesmo na incerteza.'
WHERE q.id = 10 AND q.dimension_id = 1 AND q.position = 9
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'My mood depends heavily on what happens to me.',
    texte_es = 'Mi estado de ánimo depende mucho de lo que me ocurre.',
    texte_pt = 'O meu estado de espírito depende muito do que me acontece.'
WHERE q.id = 11 AND q.dimension_id = 1 AND q.position = 10
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I easily lose my joy when things go wrong.',
    texte_es = 'Pierdo fácilmente la alegría cuando las cosas salen mal.',
    texte_pt = 'Perco facilmente a alegria quando as coisas correm mal.'
WHERE q.id = 12 AND q.dimension_id = 1 AND q.position = 11
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'Unexpected events unsettle me.',
    texte_es = 'Los imprevistos me desestabilizan.',
    texte_pt = 'Os imprevistos desestabilizam-me.'
WHERE q.id = 13 AND q.dimension_id = 1 AND q.position = 12
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I quickly become discouraged.',
    texte_es = 'Me desanimo rápidamente.',
    texte_pt = 'Desanimo rapidamente.'
WHERE q.id = 14 AND q.dimension_id = 1 AND q.position = 13
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'Difficulties have a strong effect on my morale.',
    texte_es = 'Las dificultades afectan mucho a mi ánimo.',
    texte_pt = 'As dificuldades afetam muito o meu ânimo.'
WHERE q.id = 15 AND q.dimension_id = 1 AND q.position = 14
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I am joyful only when everything is going well.',
    texte_es = 'Solo siento alegría cuando todo va bien.',
    texte_pt = 'Só sinto alegria quando tudo corre bem.'
WHERE q.id = 16 AND q.dimension_id = 1 AND q.position = 15
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I let circumstances control how I feel inside.',
    texte_es = 'Dejo que las circunstancias controlen cómo me siento por dentro.',
    texte_pt = 'Deixo que as circunstâncias controlem como me sinto por dentro.'
WHERE q.id = 17 AND q.dimension_id = 1 AND q.position = 16
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I am often negative when facing difficulties.',
    texte_es = 'A menudo tengo una actitud negativa ante las dificultades.',
    texte_pt = 'Tenho frequentemente uma atitude negativa perante as dificuldades.'
WHERE q.id = 18 AND q.dimension_id = 1 AND q.position = 17
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I easily lose my enthusiasm.',
    texte_es = 'Pierdo fácilmente el entusiasmo.',
    texte_pt = 'Perco facilmente o entusiasmo.'
WHERE q.id = 19 AND q.dimension_id = 1 AND q.position = 18
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'How I feel depends on external events.',
    texte_es = 'Mi estado de ánimo depende de los acontecimientos externos.',
    texte_pt = 'O meu estado interior depende dos acontecimentos externos.'
WHERE q.id = 20 AND q.dimension_id = 1 AND q.position = 19
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I can hold on to joy even in difficult times.',
    texte_es = 'Puedo conservar la alegría incluso en los momentos difíciles.',
    texte_pt = 'Consigo manter a alegria mesmo nos momentos difíceis.'
WHERE q.id = 21 AND q.dimension_id = 2 AND q.position = 0
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I find meaning in trials.',
    texte_es = 'Encuentro sentido en las pruebas.',
    texte_pt = 'Encontro sentido nas provações.'
WHERE q.id = 22 AND q.dimension_id = 2 AND q.position = 1
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I believe that good can come out of difficulties.',
    texte_es = 'Creo que de las dificultades puede surgir algo bueno.',
    texte_pt = 'Acredito que das dificuldades pode surgir algo de bom.'
WHERE q.id = 23 AND q.dimension_id = 2 AND q.position = 2
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I remain confident despite trials.',
    texte_es = 'Mantengo la confianza a pesar de las pruebas.',
    texte_pt = 'Mantenho a confiança apesar das provações.'
WHERE q.id = 24 AND q.dimension_id = 2 AND q.position = 3
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I hold on to hope in suffering.',
    texte_es = 'Conservo la esperanza en el sufrimiento.',
    texte_pt = 'Conservo a esperança no sofrimento.'
WHERE q.id = 25 AND q.dimension_id = 2 AND q.position = 4
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I do not let difficulties crush me.',
    texte_es = 'No dejo que las dificultades me aplasten.',
    texte_pt = 'Não deixo que as dificuldades me esmaguem.'
WHERE q.id = 26 AND q.dimension_id = 2 AND q.position = 5
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I keep a grateful attitude even in pain.',
    texte_es = 'Mantengo una actitud agradecida incluso en el dolor.',
    texte_pt = 'Mantenho uma atitude de gratidão mesmo na dor.'
WHERE q.id = 27 AND q.dimension_id = 2 AND q.position = 6
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I see trials as opportunities for growth.',
    texte_es = 'Veo las pruebas como oportunidades de crecimiento.',
    texte_pt = 'Vejo as provações como oportunidades de crescimento.'
WHERE q.id = 28 AND q.dimension_id = 2 AND q.position = 7
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I remain strong within myself despite crises.',
    texte_es = 'Me mantengo firme por dentro a pesar de las crisis.',
    texte_pt = 'Mantenho-me firme interiormente apesar das crises.'
WHERE q.id = 29 AND q.dimension_id = 2 AND q.position = 8
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I keep a positive outlook in times of trial.',
    texte_es = 'Mantengo una perspectiva positiva en las pruebas.',
    texte_pt = 'Mantenho uma perspetiva positiva nas provações.'
WHERE q.id = 30 AND q.dimension_id = 2 AND q.position = 9
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'Trials make me lose all joy.',
    texte_es = 'Las pruebas me hacen perder toda alegría.',
    texte_pt = 'As provações fazem-me perder toda a alegria.'
WHERE q.id = 31 AND q.dimension_id = 2 AND q.position = 10
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I feel crushed by difficulties.',
    texte_es = 'Siento que las dificultades me aplastan.',
    texte_pt = 'Sinto-me esmagado pelas dificuldades.'
WHERE q.id = 32 AND q.dimension_id = 2 AND q.position = 11
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I lose hope in difficult times.',
    texte_es = 'Pierdo la esperanza en los momentos difíciles.',
    texte_pt = 'Perco a esperança nos momentos difíceis.'
WHERE q.id = 33 AND q.dimension_id = 2 AND q.position = 12
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I see trials only as unfair.',
    texte_es = 'Solo veo las pruebas como algo injusto.',
    texte_pt = 'Vejo as provações apenas como algo injusto.'
WHERE q.id = 34 AND q.dimension_id = 2 AND q.position = 13
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I easily become discouraged.',
    texte_es = 'Me desanimo fácilmente.',
    texte_pt = 'Desanimo facilmente.'
WHERE q.id = 35 AND q.dimension_id = 2 AND q.position = 14
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I become bitter when facing difficulties.',
    texte_es = 'Me lleno de amargura ante las dificultades.',
    texte_pt = 'Fico amargurado perante as dificuldades.'
WHERE q.id = 36 AND q.dimension_id = 2 AND q.position = 15
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I lose confidence in times of trial.',
    texte_es = 'Pierdo la confianza en las pruebas.',
    texte_pt = 'Perco a confiança nas provações.'
WHERE q.id = 37 AND q.dimension_id = 2 AND q.position = 16
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I feel emotionally overwhelmed.',
    texte_es = 'Las emociones me sobrepasan.',
    texte_pt = 'Sinto-me dominado pelas emoções.'
WHERE q.id = 38 AND q.dimension_id = 2 AND q.position = 17
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I see little meaning in difficulties.',
    texte_es = 'Encuentro poco sentido en las dificultades.',
    texte_pt = 'Encontro pouco sentido nas dificuldades.'
WHERE q.id = 39 AND q.dimension_id = 2 AND q.position = 18
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'Trials make me negative.',
    texte_es = 'Las pruebas me llevan a tener una actitud negativa.',
    texte_pt = 'As provações levam-me a ter uma atitude negativa.'
WHERE q.id = 40 AND q.dimension_id = 2 AND q.position = 19
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'My joy depends a great deal on the quality of my relationships.',
    texte_es = 'Mi alegría depende mucho de la calidad de mis relaciones.',
    texte_pt = 'A minha alegria depende muito da qualidade das minhas relações.'
WHERE q.id = 41 AND q.dimension_id = 3 AND q.position = 0
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I feel less happy when I am alone.',
    texte_es = 'Me siento menos feliz cuando estoy a solas.',
    texte_pt = 'Sinto-me menos feliz quando estou sozinho.'
WHERE q.id = 42 AND q.dimension_id = 3 AND q.position = 1
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'My happiness depends on how others see me.',
    texte_es = 'Mi felicidad depende de cómo me ven los demás.',
    texte_pt = 'A minha felicidade depende da forma como os outros me veem.'
WHERE q.id = 43 AND q.dimension_id = 3 AND q.position = 2
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I feel more joyful when I am with other people.',
    texte_es = 'Siento más alegría cuando estoy con otras personas.',
    texte_pt = 'Sinto mais alegria quando estou acompanhado.'
WHERE q.id = 44 AND q.dimension_id = 3 AND q.position = 3
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'How I feel inside depends on the atmosphere in the relationships around me.',
    texte_es = 'Cómo me siento por dentro depende del ambiente en mis relaciones con quienes me rodean.',
    texte_pt = 'O meu estado interior depende do ambiente nas relações à minha volta.'
WHERE q.id = 45 AND q.dimension_id = 3 AND q.position = 4
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I feel a lack of joy when my relationships are strained.',
    texte_es = 'Siento que me falta alegría cuando hay tensión en mis relaciones.',
    texte_pt = 'Sinto falta de alegria quando há tensão nas minhas relações.'
WHERE q.id = 46 AND q.dimension_id = 3 AND q.position = 5
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'Whether or not I am in a relationship has a strong influence on my joy.',
    texte_es = 'Tener o no tener pareja influye mucho en mi alegría.',
    texte_pt = 'Estar ou não numa relação amorosa influencia muito a minha alegria.'
WHERE q.id = 47 AND q.dimension_id = 3 AND q.position = 6
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I feel less happy when others do not understand me.',
    texte_es = 'Me siento menos feliz cuando los demás no me comprenden.',
    texte_pt = 'Sinto-me menos feliz quando os outros não me compreendem.'
WHERE q.id = 48 AND q.dimension_id = 3 AND q.position = 7
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'My relationships have a strong influence on my morale.',
    texte_es = 'Mis relaciones influyen mucho en mi ánimo.',
    texte_pt = 'As minhas relações influenciam muito o meu ânimo.'
WHERE q.id = 49 AND q.dimension_id = 3 AND q.position = 8
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I easily lose my joy when I am in conflict with someone.',
    texte_es = 'Pierdo fácilmente la alegría cuando estoy en conflicto con alguien.',
    texte_pt = 'Perco facilmente a alegria quando estou em conflito com alguém.'
WHERE q.id = 50 AND q.dimension_id = 3 AND q.position = 9
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I can remain joyful even when I am alone.',
    texte_es = 'Soy capaz de conservar la alegría incluso cuando estoy a solas.',
    texte_pt = 'Sou capaz de manter a alegria mesmo quando estou sozinho.'
WHERE q.id = 51 AND q.dimension_id = 3 AND q.position = 10
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'My joy does not depend on how others see me.',
    texte_es = 'Mi alegría no depende de cómo me ven los demás.',
    texte_pt = 'A minha alegria não depende da forma como os outros me veem.'
WHERE q.id = 52 AND q.dimension_id = 3 AND q.position = 11
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I remain stable within myself even when my relationships are difficult.',
    texte_es = 'Mantengo la estabilidad interior incluso cuando mis relaciones son difíciles.',
    texte_pt = 'Mantenho a estabilidade interior mesmo quando as minhas relações são difíceis.'
WHERE q.id = 53 AND q.dimension_id = 3 AND q.position = 12
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'How I feel inside does not depend on my relationship status (single, married, etc.).',
    texte_es = 'Cómo me siento por dentro no depende de mi situación sentimental (soltería, matrimonio, etc.).',
    texte_pt = 'O meu estado interior não depende da minha situação conjugal (solteiro, casado, etc.).'
WHERE q.id = 54 AND q.dimension_id = 3 AND q.position = 13
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I can be at peace even without approval from others.',
    texte_es = 'Puedo estar en paz incluso sin la aprobación de los demás.',
    texte_pt = 'Consigo estar em paz mesmo sem a aprovação dos outros.'
WHERE q.id = 55 AND q.dimension_id = 3 AND q.position = 14
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I remain stable even when I do not feel understood.',
    texte_es = 'Mantengo la estabilidad incluso cuando siento que no me comprenden.',
    texte_pt = 'Mantenho a estabilidade mesmo quando não me sinto compreendido.'
WHERE q.id = 56 AND q.dimension_id = 3 AND q.position = 15
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I hold on to joy even in conflicts with others.',
    texte_es = 'Conservo la alegría incluso en los conflictos con otras personas.',
    texte_pt = 'Mantenho a alegria mesmo nos conflitos com outras pessoas.'
WHERE q.id = 57 AND q.dimension_id = 3 AND q.position = 16
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'My joy does not depend on whether other people are present or absent.',
    texte_es = 'Mi alegría no depende de la presencia o la ausencia de los demás.',
    texte_pt = 'A minha alegria não depende da presença ou da ausência dos outros.'
WHERE q.id = 58 AND q.dimension_id = 3 AND q.position = 17
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I find joy regardless of my family situation.',
    texte_es = 'Encuentro alegría independientemente de mi situación familiar.',
    texte_pt = 'Encontro alegria independentemente da minha situação familiar.'
WHERE q.id = 59 AND q.dimension_id = 3 AND q.position = 18
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I remain stable within myself even when my relationships change.',
    texte_es = 'Mantengo la estabilidad interior incluso cuando mis relaciones cambian.',
    texte_pt = 'Mantenho a estabilidade interior mesmo quando as minhas relações mudam.'
WHERE q.id = 60 AND q.dimension_id = 3 AND q.position = 19
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I feel deeply happy within myself.',
    texte_es = 'Me siento profundamente feliz por dentro.',
    texte_pt = 'Sinto-me profundamente feliz por dentro.'
WHERE q.id = 61 AND q.dimension_id = 4 AND q.position = 0
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I am at peace with who I am.',
    texte_es = 'Estoy en paz con quien soy.',
    texte_pt = 'Estou em paz com quem sou.'
WHERE q.id = 62 AND q.dimension_id = 4 AND q.position = 1
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I feel loved and accepted.',
    texte_es = 'Siento que me aman y me aceptan.',
    texte_pt = 'Sinto-me amado e aceite.'
WHERE q.id = 63 AND q.dimension_id = 4 AND q.position = 2
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I live with a sense of fulfilment.',
    texte_es = 'Vivo con una sensación de plenitud.',
    texte_pt = 'Vivo com um sentimento de plenitude.'
WHERE q.id = 64 AND q.dimension_id = 4 AND q.position = 3
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I am emotionally stable.',
    texte_es = 'Soy emocionalmente estable.',
    texte_pt = 'Sou emocionalmente estável.'
WHERE q.id = 65 AND q.dimension_id = 4 AND q.position = 4
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I am satisfied with my life.',
    texte_es = 'Estoy satisfecho con mi vida.',
    texte_pt = 'Estou satisfeito com a minha vida.'
WHERE q.id = 66 AND q.dimension_id = 4 AND q.position = 5
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I regularly experience inner joy.',
    texte_es = 'Siento alegría interior con regularidad.',
    texte_pt = 'Sinto alegria interior com regularidade.'
WHERE q.id = 67 AND q.dimension_id = 4 AND q.position = 6
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I am confident in my identity.',
    texte_es = 'Tengo confianza en mi identidad.',
    texte_pt = 'Tenho confiança na minha identidade.'
WHERE q.id = 68 AND q.dimension_id = 4 AND q.position = 7
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I feel a sense of inner harmony.',
    texte_es = 'Siento armonía interior.',
    texte_pt = 'Sinto harmonia interior.'
WHERE q.id = 69 AND q.dimension_id = 4 AND q.position = 8
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I experience deep joy without anything external bringing it about.',
    texte_es = 'Experimento una alegría profunda sin que nada externo la provoque.',
    texte_pt = 'Vivo uma alegria profunda sem que nada exterior a provoque.'
WHERE q.id = 70 AND q.dimension_id = 4 AND q.position = 9
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I feel empty inside.',
    texte_es = 'Siento un vacío interior.',
    texte_pt = 'Sinto-me vazio por dentro.'
WHERE q.id = 71 AND q.dimension_id = 4 AND q.position = 10
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I am dissatisfied with my life.',
    texte_es = 'Estoy insatisfecho con mi vida.',
    texte_pt = 'Estou insatisfeito com a minha vida.'
WHERE q.id = 72 AND q.dimension_id = 4 AND q.position = 11
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I doubt my worth.',
    texte_es = 'Dudo de mi propio valor.',
    texte_pt = 'Duvido do meu valor.'
WHERE q.id = 73 AND q.dimension_id = 4 AND q.position = 12
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I feel that something is missing inside.',
    texte_es = 'Siento que me falta algo por dentro.',
    texte_pt = 'Sinto que me falta algo por dentro.'
WHERE q.id = 74 AND q.dimension_id = 4 AND q.position = 13
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I am emotionally unstable.',
    texte_es = 'Soy emocionalmente inestable.',
    texte_pt = 'Sou emocionalmente instável.'
WHERE q.id = 75 AND q.dimension_id = 4 AND q.position = 14
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I often feel uncomfortable with who I am.',
    texte_es = 'A menudo siento malestar conmigo mismo.',
    texte_pt = 'Sinto-me frequentemente mal comigo mesmo.'
WHERE q.id = 76 AND q.dimension_id = 4 AND q.position = 15
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I am constantly looking for something to fulfil me.',
    texte_es = 'Busco constantemente algo que me llene.',
    texte_pt = 'Procuro constantemente algo que me preencha.'
WHERE q.id = 77 AND q.dimension_id = 4 AND q.position = 16
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I experience little inner joy.',
    texte_es = 'Siento poca alegría interior.',
    texte_pt = 'Sinto pouca alegria interior.'
WHERE q.id = 78 AND q.dimension_id = 4 AND q.position = 17
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I am often sad for no clear reason.',
    texte_es = 'A menudo siento tristeza sin una razón clara.',
    texte_pt = 'Sinto-me frequentemente triste sem uma razão clara.'
WHERE q.id = 79 AND q.dimension_id = 4 AND q.position = 18
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I lack inner joy.',
    texte_es = 'Me falta alegría interior.',
    texte_pt = 'Falta-me alegria interior.'
WHERE q.id = 80 AND q.dimension_id = 4 AND q.position = 19
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'My relationship with God brings me joy.',
    texte_es = 'Mi relación con Dios me da alegría.',
    texte_pt = 'A minha relação com Deus dá-me alegria.'
WHERE q.id = 81 AND q.dimension_id = 5 AND q.position = 0
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I rejoice in God''s presence.',
    texte_es = 'Me alegro en la presencia de Dios.',
    texte_pt = 'Alegro-me na presença de Deus.'
WHERE q.id = 82 AND q.dimension_id = 5 AND q.position = 1
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I find joy in prayer.',
    texte_es = 'Encuentro alegría en la oración.',
    texte_pt = 'Encontro alegria na oração.'
WHERE q.id = 83 AND q.dimension_id = 5 AND q.position = 2
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I am happy to follow Jesus, whatever the cost.',
    texte_es = 'Me hace feliz seguir a Jesús, sin importar el precio que tenga que pagar.',
    texte_pt = 'Sou feliz por seguir Jesus, seja qual for o preço a pagar.'
WHERE q.id = 84 AND q.dimension_id = 5 AND q.position = 3
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I experience joy in my faith.',
    texte_es = 'Siento alegría en mi fe.',
    texte_pt = 'Sinto alegria na minha fé.'
WHERE q.id = 85 AND q.dimension_id = 5 AND q.position = 4
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I rejoice in the Word of God.',
    texte_es = 'Me alegro en la Palabra de Dios.',
    texte_pt = 'Alegro-me na Palavra de Deus.'
WHERE q.id = 86 AND q.dimension_id = 5 AND q.position = 5
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'My faith nourishes my joy.',
    texte_es = 'Mi fe alimenta mi alegría.',
    texte_pt = 'A minha fé alimenta a minha alegria.'
WHERE q.id = 87 AND q.dimension_id = 5 AND q.position = 6
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I can praise God even when there is no apparent reason to do so.',
    texte_es = 'Sé alabar a Dios incluso cuando no hay un motivo aparente para hacerlo.',
    texte_pt = 'Sei louvar a Deus mesmo sem um motivo aparente.'
WHERE q.id = 88 AND q.dimension_id = 5 AND q.position = 7
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I make a conscious effort to give thanks in all things.',
    texte_es = 'Me esfuerzo por dar gracias en todo.',
    texte_pt = 'Esforço-me por dar graças em todas as coisas.'
WHERE q.id = 89 AND q.dimension_id = 5 AND q.position = 8
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'God is a constant source of joy for me.',
    texte_es = 'Dios es una fuente constante de alegría para mí.',
    texte_pt = 'Deus é uma fonte constante de alegria para mim.'
WHERE q.id = 90 AND q.dimension_id = 5 AND q.position = 9
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'My spiritual life depends on my mood.',
    texte_es = 'Mi vida espiritual depende de mi estado de ánimo.',
    texte_pt = 'A minha vida espiritual depende do meu estado de espírito.'
WHERE q.id = 91 AND q.dimension_id = 5 AND q.position = 10
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I do not experience joy in my faith.',
    texte_es = 'No siento alegría en mi fe.',
    texte_pt = 'Não sinto alegria na minha fé.'
WHERE q.id = 92 AND q.dimension_id = 5 AND q.position = 11
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I find little pleasure in prayer.',
    texte_es = 'Encuentro poco placer en la oración.',
    texte_pt = 'Encontro pouco prazer na oração.'
WHERE q.id = 93 AND q.dimension_id = 5 AND q.position = 12
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I feel distant from God when I am not doing well.',
    texte_es = 'Siento distancia de Dios cuando no estoy bien.',
    texte_pt = 'Sinto-me distante de Deus quando não estou bem.'
WHERE q.id = 94 AND q.dimension_id = 5 AND q.position = 13
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'My faith does not really bring me joy.',
    texte_es = 'Mi fe no me da realmente alegría.',
    texte_pt = 'A minha fé não me dá realmente alegria.'
WHERE q.id = 95 AND q.dimension_id = 5 AND q.position = 14
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I experience my faith as an obligation.',
    texte_es = 'Vivo mi fe como una obligación.',
    texte_pt = 'Vivo a minha fé como uma obrigação.'
WHERE q.id = 96 AND q.dimension_id = 5 AND q.position = 15
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I feel little spiritual connection in difficult times.',
    texte_es = 'Siento poca conexión espiritual en los momentos difíciles.',
    texte_pt = 'Sinto pouca ligação espiritual nos momentos difíceis.'
WHERE q.id = 97 AND q.dimension_id = 5 AND q.position = 16
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I am unsure whether I feel joy when I am invited to go to the house of the LORD.',
    texte_es = 'No tengo claro si siento alegría cuando me invitan a ir a la casa del Señor.',
    texte_pt = 'Não sei ao certo se sinto alegria quando me convidam a ir à casa do SENHOR.'
WHERE q.id = 98 AND q.dimension_id = 5 AND q.position = 17
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I struggle to be content with what I have.',
    texte_es = 'Me cuesta contentarme con lo que tengo.',
    texte_pt = 'Custa-me contentar-me com o que tenho.'
WHERE q.id = 99 AND q.dimension_id = 5 AND q.position = 18
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE questions AS q
SET texte_en = 'I do not experience true joy at church.',
    texte_es = 'No siento verdadera alegría en la iglesia.',
    texte_pt = 'Não sinto verdadeira alegria na igreja.'
WHERE q.id = 100 AND q.dimension_id = 5 AND q.position = 19
  AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id
              WHERE d.id = q.dimension_id AND r.code = 'joie');

UPDATE tranches_interpretation AS t
SET texte_en = 'Joy is scarcely evident across the attitudes assessed. This is a warning sign: action is needed without delay.',
    texte_es = 'La alegría se manifiesta muy poco en el conjunto de las actitudes evaluadas. Es una señal de alerta: es necesario actuar sin demora.',
    texte_pt = 'A alegria manifesta-se muito pouco no conjunto das atitudes avaliadas. É um sinal de alerta: é necessário agir sem demora.'
WHERE t.position = 0 AND t.min_score = 0 AND t.max_score = 19
  AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = t.referentiel_id AND r.code = 'joie');

UPDATE tranches_interpretation AS t
SET texte_en = 'There are several slight signs of joy. These need to be strengthened significantly.',
    texte_es = 'Hay varios indicios leves de alegría. Es necesario fortalecerlos de manera significativa.',
    texte_pt = 'Existem vários sinais ténues de alegria. É necessário reforçá-los significativamente.'
WHERE t.position = 1 AND t.min_score = 20 AND t.max_score = 39
  AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = t.referentiel_id AND r.code = 'joie');

UPDATE tranches_interpretation AS t
SET texte_en = 'The profile shows a real presence of joy in daily life, even if its expression remains inconsistent. This needs further work.',
    texte_es = 'El perfil muestra una presencia real de alegría en la vida cotidiana, aunque su expresión sigue siendo inconstante. Hay que seguir trabajando en ello.',
    texte_pt = 'O perfil mostra uma presença real de alegria no dia a dia, embora a sua expressão continue a ser inconstante. É preciso continuar a trabalhar este aspeto.'
WHERE t.position = 2 AND t.min_score = 40 AND t.max_score = 59
  AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = t.referentiel_id AND r.code = 'joie');

UPDATE tranches_interpretation AS t
SET texte_en = 'Joy appears to be clearly evident in several areas of life. Keep strengthening it!',
    texte_es = 'La alegría parece manifestarse de forma evidente en varias áreas de la vida. ¡Sigue fortaleciéndola!',
    texte_pt = 'A alegria parece manifestar-se de forma evidente em várias áreas da vida. Continua a fortalecê-la!'
WHERE t.position = 3 AND t.min_score = 60 AND t.max_score = 79
  AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = t.referentiel_id AND r.code = 'joie');

UPDATE tranches_interpretation AS t
SET texte_en = 'The profile reveals a very strong expression of the joy of the Lord. Stay on course!',
    texte_es = 'El perfil revela una manifestación muy intensa de la alegría del Señor. ¡Mantén el rumbo!',
    texte_pt = 'O perfil revela uma manifestação muito forte da alegria do Senhor. Mantém o rumo!'
WHERE t.position = 4 AND t.min_score = 80 AND t.max_score = 100
  AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = t.referentiel_id AND r.code = 'joie');
