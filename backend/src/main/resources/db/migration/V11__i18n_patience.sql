-- patience : traductions EN / ES / PT. UTF-8.
-- Aucun texte francais, polarite, seuil ou identifiant modifie.
-- UPDATE deterministes limites au referentiel patience.

UPDATE referentiels
SET nom_en = 'Patience',
    verset_en = 'Galatians 5:22',
    nom_es = 'Paciencia',
    verset_es = 'Gálatas 5:22',
    nom_pt = 'Paciência',
    verset_pt = 'Gálatas 5:22'
WHERE code = 'patience' AND id = 6;

UPDATE dimensions
SET libelle_en = 'Patience in trials and suffering',
    libelle_court_en = 'Trials/Suffering',
    libelle_es = 'Paciencia en las pruebas y el sufrimiento',
    libelle_court_es = 'Pruebas/Sufrimiento',
    libelle_pt = 'Paciência na provação e no sofrimento',
    libelle_court_pt = 'Provação/Sofrimento'
WHERE id = 36 AND position = 0 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = dimensions.referentiel_id AND r.code = 'patience');

UPDATE dimensions
SET libelle_en = 'Patience while waiting',
    libelle_court_en = 'Waiting',
    libelle_es = 'Paciencia en la espera',
    libelle_court_es = 'Espera',
    libelle_pt = 'Paciência na espera',
    libelle_court_pt = 'Espera'
WHERE id = 37 AND position = 1 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = dimensions.referentiel_id AND r.code = 'patience');

UPDATE dimensions
SET libelle_en = 'Patience with others',
    libelle_court_en = 'With others',
    libelle_es = 'Paciencia con los demás',
    libelle_court_es = 'Con los demás',
    libelle_pt = 'Paciência com os outros',
    libelle_court_pt = 'Com os outros'
WHERE id = 38 AND position = 2 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = dimensions.referentiel_id AND r.code = 'patience');

UPDATE dimensions
SET libelle_en = 'Patience with imperfections',
    libelle_court_en = 'Imperfections',
    libelle_es = 'Paciencia ante las imperfecciones',
    libelle_court_es = 'Imperfecciones',
    libelle_pt = 'Paciência perante as imperfeições',
    libelle_court_pt = 'Imperfeições'
WHERE id = 39 AND position = 3 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = dimensions.referentiel_id AND r.code = 'patience');

UPDATE dimensions
SET libelle_en = 'Patience with frustrations',
    libelle_court_en = 'Frustrations',
    libelle_es = 'Paciencia ante las frustraciones',
    libelle_court_es = 'Frustraciones',
    libelle_pt = 'Paciência nas frustrações',
    libelle_court_pt = 'Frustrações'
WHERE id = 40 AND position = 4 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = dimensions.referentiel_id AND r.code = 'patience');

UPDATE dimensions
SET libelle_en = 'Patience in personal growth',
    libelle_court_en = 'Personal growth',
    libelle_es = 'Paciencia en el crecimiento personal',
    libelle_court_es = 'Crecimiento personal',
    libelle_pt = 'Paciência no crescimento pessoal',
    libelle_court_pt = 'Crescimento pessoal'
WHERE id = 41 AND position = 5 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = dimensions.referentiel_id AND r.code = 'patience');

UPDATE dimensions
SET libelle_en = 'Patience in work and projects',
    libelle_court_en = 'Work and projects',
    libelle_es = 'Paciencia en el trabajo y los proyectos',
    libelle_court_es = 'Trabajo y proyectos',
    libelle_pt = 'Paciência no trabalho e nos projetos',
    libelle_court_pt = 'Trabalho e projetos'
WHERE id = 42 AND position = 6 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = dimensions.referentiel_id AND r.code = 'patience');

UPDATE dimensions
SET libelle_en = 'Patience in the face of injustice',
    libelle_court_en = 'Injustice',
    libelle_es = 'Paciencia ante la injusticia',
    libelle_court_es = 'Injusticia',
    libelle_pt = 'Paciência perante a injustiça',
    libelle_court_pt = 'Injustiça'
WHERE id = 43 AND position = 7 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = dimensions.referentiel_id AND r.code = 'patience');

UPDATE dimensions
SET libelle_en = 'Emotional patience (self-control)',
    libelle_court_en = 'Emotional',
    libelle_es = 'Paciencia emocional (dominio propio)',
    libelle_court_es = 'Emocional',
    libelle_pt = 'Paciência emocional (domínio próprio)',
    libelle_court_pt = 'Emocional'
WHERE id = 44 AND position = 8 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = dimensions.referentiel_id AND r.code = 'patience');

UPDATE dimensions
SET libelle_en = 'Spiritual patience (waiting for God)',
    libelle_court_en = 'Spiritual',
    libelle_es = 'Paciencia espiritual (espera en Dios)',
    libelle_court_es = 'Espiritual',
    libelle_pt = 'Paciência espiritual (espera em Deus)',
    libelle_court_pt = 'Espiritual'
WHERE id = 45 AND position = 9 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = dimensions.referentiel_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I stand firm over time despite the pain.',
    texte_es = 'Me mantengo firme a lo largo del tiempo a pesar del dolor.',
    texte_pt = 'Mantenho-me firme ao longo do tempo apesar da dor.'
WHERE id = 760 AND dimension_id = 36 AND position = 0 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I hold on to hope when a trial goes on.',
    texte_es = 'Conservo la esperanza cuando una prueba se prolonga.',
    texte_pt = 'Mantenho a esperança quando uma provação se prolonga.'
WHERE id = 761 AND dimension_id = 36 AND position = 1 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I remain stable when facing a real difficulty.',
    texte_es = 'Mantengo la estabilidad ante una dificultad real.',
    texte_pt = 'Mantenho a estabilidade perante uma dificuldade real.'
WHERE id = 762 AND dimension_id = 36 AND position = 2 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I bear suffering without rebelling.',
    texte_es = 'Soporto el sufrimiento sin rebelarme.',
    texte_pt = 'Suporto o sofrimento sem me revoltar.'
WHERE id = 763 AND dimension_id = 36 AND position = 3 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I persevere when everything seems to be against me.',
    texte_es = 'Persevero cuando todo parece estar en mi contra.',
    texte_pt = 'Persevero quando tudo parece estar contra mim.'
WHERE id = 764 AND dimension_id = 36 AND position = 4 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I accept that some trials take time.',
    texte_es = 'Acepto que algunas pruebas requieren tiempo.',
    texte_pt = 'Aceito que algumas provações levam tempo.'
WHERE id = 765 AND dimension_id = 36 AND position = 5 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I remain confident in difficult times.',
    texte_es = 'Mantengo la confianza en los momentos difíciles.',
    texte_pt = 'Mantenho a confiança nos momentos difíceis.'
WHERE id = 766 AND dimension_id = 36 AND position = 6 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I weather storms calmly.',
    texte_es = 'Afronto las tormentas con calma.',
    texte_pt = 'Atravesso as tempestades com calma.'
WHERE id = 767 AND dimension_id = 36 AND position = 7 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I draw on my faith in adversity.',
    texte_es = 'Me apoyo en mi fe en la adversidad.',
    texte_pt = 'Apoio-me na minha fé na adversidade.'
WHERE id = 768 AND dimension_id = 36 AND position = 8 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I remain patient even when I am suffering.',
    texte_es = 'Mantengo la paciencia incluso cuando sufro.',
    texte_pt = 'Mantenho a paciência mesmo quando sofro.'
WHERE id = 769 AND dimension_id = 36 AND position = 9 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I quickly fall apart when faced with suffering.',
    texte_es = 'Me derrumbo rápidamente ante el sufrimiento.',
    texte_pt = 'Vou-me abaixo rapidamente perante o sofrimento.'
WHERE id = 770 AND dimension_id = 36 AND position = 10 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I rebel as soon as a trial drags on.',
    texte_es = 'Me rebelo en cuanto una prueba se alarga.',
    texte_pt = 'Revolto-me assim que uma provação se prolonga.'
WHERE id = 771 AND dimension_id = 36 AND position = 11 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I quickly lose hope in difficulty.',
    texte_es = 'Pierdo rápidamente la esperanza ante las dificultades.',
    texte_pt = 'Perco rapidamente a esperança nas dificuldades.'
WHERE id = 772 AND dimension_id = 36 AND position = 12 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I become bitter when I suffer.',
    texte_es = 'Me lleno de amargura cuando sufro.',
    texte_pt = 'Fico amargurado quando sofro.'
WHERE id = 773 AND dimension_id = 36 AND position = 13 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I cannot bear prolonged trials.',
    texte_es = 'No soporto las pruebas prolongadas.',
    texte_pt = 'Não suporto provações prolongadas.'
WHERE id = 774 AND dimension_id = 36 AND position = 14 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I complain constantly in adversity.',
    texte_es = 'Me quejo constantemente en la adversidad.',
    texte_pt = 'Queixo-me constantemente na adversidade.'
WHERE id = 775 AND dimension_id = 36 AND position = 15 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I easily give in to discouragement.',
    texte_es = 'Me dejo vencer fácilmente por el desánimo.',
    texte_pt = 'Cedo facilmente ao desânimo.'
WHERE id = 776 AND dimension_id = 36 AND position = 16 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I want suffering to stop immediately.',
    texte_es = 'Quiero que el sufrimiento termine de inmediato.',
    texte_pt = 'Quero que o sofrimento acabe imediatamente.'
WHERE id = 777 AND dimension_id = 36 AND position = 17 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I panic when faced with difficulties.',
    texte_es = 'Entro en pánico ante las dificultades.',
    texte_pt = 'Entro em pânico perante as dificuldades.'
WHERE id = 778 AND dimension_id = 36 AND position = 18 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'Pain makes me impatient.',
    texte_es = 'El dolor me vuelve impaciente.',
    texte_pt = 'A dor torna-me impaciente.'
WHERE id = 779 AND dimension_id = 36 AND position = 19 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I can wait without getting restless.',
    texte_es = 'Sé esperar sin inquietarme.',
    texte_pt = 'Sei esperar sem me agitar.'
WHERE id = 780 AND dimension_id = 37 AND position = 0 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I wait calmly when necessary.',
    texte_es = 'Espero con serenidad cuando es necesario.',
    texte_pt = 'Espero com serenidade quando é necessário.'
WHERE id = 781 AND dimension_id = 37 AND position = 1 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I accept that things take time.',
    texte_es = 'Acepto que las cosas requieren tiempo.',
    texte_pt = 'Aceito que as coisas levam tempo.'
WHERE id = 782 AND dimension_id = 37 AND position = 2 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I remain calm while waiting in a queue.',
    texte_es = 'Mantengo la calma cuando hago fila.',
    texte_pt = 'Mantenho a calma numa fila de espera.'
WHERE id = 783 AND dimension_id = 37 AND position = 3 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I handle imposed waiting periods well.',
    texte_es = 'Llevo bien los tiempos de espera que me imponen.',
    texte_pt = 'Lido bem com os tempos de espera que me são impostos.'
WHERE id = 784 AND dimension_id = 37 AND position = 4 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I am at peace while I wait.',
    texte_es = 'Vivo la espera en paz.',
    texte_pt = 'Vivo a espera em paz.'
WHERE id = 785 AND dimension_id = 37 AND position = 5 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I do not rush unnecessarily.',
    texte_es = 'No me apresuro sin necesidad.',
    texte_pt = 'Não me precipito sem necessidade.'
WHERE id = 786 AND dimension_id = 37 AND position = 6 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I allow events to unfold at their own pace.',
    texte_es = 'Respeto el ritmo de los acontecimientos.',
    texte_pt = 'Respeito o ritmo dos acontecimentos.'
WHERE id = 787 AND dimension_id = 37 AND position = 7 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I wait for an answer without anxiety.',
    texte_es = 'Espero una respuesta sin ansiedad.',
    texte_pt = 'Espero uma resposta sem ansiedade.'
WHERE id = 788 AND dimension_id = 37 AND position = 8 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I calmly tolerate periods of inactivity.',
    texte_es = 'Sobrellevo con serenidad los momentos de inactividad.',
    texte_pt = 'Suporto com serenidade os períodos de inatividade.'
WHERE id = 789 AND dimension_id = 37 AND position = 9 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I hate waiting.',
    texte_es = 'Detesto esperar.',
    texte_pt = 'Detesto esperar.'
WHERE id = 790 AND dimension_id = 37 AND position = 10 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I become impatient as soon as there is a delay.',
    texte_es = 'Me impaciento en cuanto algo se demora.',
    texte_pt = 'Fico impaciente assim que algo demora.'
WHERE id = 791 AND dimension_id = 37 AND position = 11 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I get irritated while waiting in queues.',
    texte_es = 'Me irrito cuando hago fila.',
    texte_pt = 'Irrito-me nas filas de espera.'
WHERE id = 792 AND dimension_id = 37 AND position = 12 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I want everything right now.',
    texte_es = 'Lo quiero todo de inmediato.',
    texte_pt = 'Quero tudo imediatamente.'
WHERE id = 793 AND dimension_id = 37 AND position = 13 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'Delays make me nervous.',
    texte_es = 'Las demoras me ponen nervioso.',
    texte_pt = 'As demoras deixam-me nervoso.'
WHERE id = 794 AND dimension_id = 37 AND position = 14 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I keep checking whether it is ready.',
    texte_es = 'Compruebo sin cesar si ya está listo.',
    texte_pt = 'Verifico constantemente se já está pronto.'
WHERE id = 795 AND dimension_id = 37 AND position = 15 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'Waiting causes me enormous stress.',
    texte_es = 'Esperar me causa muchísimo estrés.',
    texte_pt = 'Esperar causa-me imenso stress.'
WHERE id = 796 AND dimension_id = 37 AND position = 16 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I seethe inside when things drag on.',
    texte_es = 'Me lleno de rabia por dentro cuando las cosas se alargan.',
    texte_pt = 'Fervo por dentro quando as coisas se arrastam.'
WHERE id = 797 AND dimension_id = 37 AND position = 17 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I cannot stand slowness.',
    texte_es = 'No soporto la lentitud.',
    texte_pt = 'Não suporto a lentidão.'
WHERE id = 798 AND dimension_id = 37 AND position = 18 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I rush everything out of impatience.',
    texte_es = 'Apresuro todo por impaciencia.',
    texte_pt = 'Precipito tudo por impaciência.'
WHERE id = 799 AND dimension_id = 37 AND position = 19 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I remain patient with people who take their time.',
    texte_es = 'Tengo paciencia con las personas que van despacio.',
    texte_pt = 'Mantenho a paciência com as pessoas mais lentas.'
WHERE id = 800 AND dimension_id = 38 AND position = 0 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I give others time to understand.',
    texte_es = 'Doy a los demás tiempo para comprender.',
    texte_pt = 'Dou aos outros tempo para compreenderem.'
WHERE id = 801 AND dimension_id = 38 AND position = 1 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I put up with other people''s faults.',
    texte_es = 'Soporto los defectos de los demás.',
    texte_pt = 'Suporto os defeitos dos outros.'
WHERE id = 802 AND dimension_id = 38 AND position = 2 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I listen without interrupting.',
    texte_es = 'Escucho sin interrumpir.',
    texte_pt = 'Escuto sem interromper.'
WHERE id = 803 AND dimension_id = 38 AND position = 3 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I tolerate people moving at a different pace from mine.',
    texte_es = 'Tolero que los demás tengan un ritmo distinto al mío.',
    texte_pt = 'Aceito que os outros tenham ritmos diferentes do meu.'
WHERE id = 804 AND dimension_id = 38 AND position = 4 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I remain gentle when people make mistakes.',
    texte_es = 'Mantengo la delicadeza ante los errores de los demás.',
    texte_pt = 'Mantenho a delicadeza perante as falhas dos outros.'
WHERE id = 805 AND dimension_id = 38 AND position = 5 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I support others without rushing them.',
    texte_es = 'Acompaño a los demás sin apresurarlos.',
    texte_pt = 'Acompanho os outros sem os apressar.'
WHERE id = 806 AND dimension_id = 38 AND position = 6 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I forgive others for being slow.',
    texte_es = 'Perdono la lentitud de los demás.',
    texte_pt = 'Perdoo a lentidão dos outros.'
WHERE id = 807 AND dimension_id = 38 AND position = 7 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I remain calm with children.',
    texte_es = 'Mantengo la calma con los niños.',
    texte_pt = 'Mantenho a calma com as crianças.'
WHERE id = 808 AND dimension_id = 38 AND position = 8 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I show understanding towards others.',
    texte_es = 'Muestro comprensión hacia los demás.',
    texte_pt = 'Mostro compreensão pelos outros.'
WHERE id = 809 AND dimension_id = 38 AND position = 9 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I get angry with people who are slow.',
    texte_es = 'Me enfado con las personas que van despacio.',
    texte_pt = 'Irrito-me com as pessoas mais lentas.'
WHERE id = 810 AND dimension_id = 38 AND position = 10 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I interrupt out of impatience.',
    texte_es = 'Interrumpo por impaciencia.',
    texte_pt = 'Interrompo por impaciência.'
WHERE id = 811 AND dimension_id = 38 AND position = 11 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'Other people''s faults irritate me.',
    texte_es = 'Me irritan los defectos de los demás.',
    texte_pt = 'Os defeitos dos outros irritam-me.'
WHERE id = 812 AND dimension_id = 38 AND position = 12 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I constantly rush others.',
    texte_es = 'Apresuro constantemente a los demás.',
    texte_pt = 'Apresso constantemente os outros.'
WHERE id = 813 AND dimension_id = 38 AND position = 13 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I find it hard to tolerate other people''s mistakes.',
    texte_es = 'Me cuesta tolerar los errores de los demás.',
    texte_pt = 'Custa-me tolerar as falhas dos outros.'
WHERE id = 814 AND dimension_id = 38 AND position = 14 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I criticise others for being slow.',
    texte_es = 'Critico la lentitud de los demás.',
    texte_pt = 'Critico a lentidão dos outros.'
WHERE id = 815 AND dimension_id = 38 AND position = 15 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I lose patience with those close to me.',
    texte_es = 'Pierdo la paciencia con mis seres queridos.',
    texte_pt = 'Perco a paciência com as pessoas próximas de mim.'
WHERE id = 816 AND dimension_id = 38 AND position = 16 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I get irritated when people do not understand quickly.',
    texte_es = 'Me irrito cuando alguien no entiende enseguida.',
    texte_pt = 'Irrito-me quando alguém não compreende depressa.'
WHERE id = 817 AND dimension_id = 38 AND position = 17 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I sigh when others hesitate.',
    texte_es = 'Suspiro ante las dudas de los demás.',
    texte_pt = 'Suspiro perante as hesitações dos outros.'
WHERE id = 818 AND dimension_id = 38 AND position = 18 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'Others find me impatient.',
    texte_es = 'Los demás me consideran impaciente.',
    texte_pt = 'Os outros acham-me impaciente.'
WHERE id = 819 AND dimension_id = 38 AND position = 19 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I accept that nothing is perfect.',
    texte_es = 'Acepto que nada es perfecto.',
    texte_pt = 'Aceito que nada é perfeito.'
WHERE id = 820 AND dimension_id = 39 AND position = 0 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I tolerate my own imperfections.',
    texte_es = 'Tolero mis propias imperfecciones.',
    texte_pt = 'Tolero as minhas próprias imperfeições.'
WHERE id = 821 AND dimension_id = 39 AND position = 1 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I work around the flaws in a situation.',
    texte_es = 'Me adapto a los aspectos imperfectos de una situación.',
    texte_pt = 'Lido com as imperfeições de uma situação.'
WHERE id = 822 AND dimension_id = 39 AND position = 2 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I remain at ease when things are imperfect.',
    texte_es = 'Mantengo la serenidad ante lo imperfecto.',
    texte_pt = 'Mantenho a serenidade perante o que é imperfeito.'
WHERE id = 823 AND dimension_id = 39 AND position = 3 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I do not insist on controlling everything.',
    texte_es = 'No me empeño en controlarlo todo.',
    texte_pt = 'Não insisto em controlar tudo.'
WHERE id = 824 AND dimension_id = 39 AND position = 4 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I accept mistakes as normal.',
    texte_es = 'Acepto los errores como algo normal.',
    texte_pt = 'Aceito os erros como algo normal.'
WHERE id = 825 AND dimension_id = 39 AND position = 5 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I keep imperfections in perspective.',
    texte_es = 'Pongo en perspectiva lo que no es perfecto.',
    texte_pt = 'Relativizo o que não é perfeito.'
WHERE id = 826 AND dimension_id = 39 AND position = 6 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I work within the limits of reality.',
    texte_es = 'Me adapto a los límites de la realidad.',
    texte_pt = 'Lido com os limites da realidade.'
WHERE id = 827 AND dimension_id = 39 AND position = 7 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I forgive imperfections.',
    texte_es = 'Perdono las imperfecciones.',
    texte_pt = 'Perdoo as imperfeições.'
WHERE id = 828 AND dimension_id = 39 AND position = 8 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I remain at peace despite flaws.',
    texte_es = 'Mantengo la paz a pesar de los defectos.',
    texte_pt = 'Mantenho a paz apesar dos defeitos.'
WHERE id = 829 AND dimension_id = 39 AND position = 9 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I find imperfection hard to tolerate.',
    texte_es = 'Me cuesta tolerar la imperfección.',
    texte_pt = 'Custa-me tolerar a imperfeição.'
WHERE id = 830 AND dimension_id = 39 AND position = 10 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I get irritated as soon as something is wrong.',
    texte_es = 'Me irrito en cuanto algo no está bien.',
    texte_pt = 'Irrito-me assim que alguma coisa não está bem.'
WHERE id = 831 AND dimension_id = 39 AND position = 11 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I want everything to be perfect.',
    texte_es = 'Quiero que todo sea perfecto.',
    texte_pt = 'Quero que tudo seja perfeito.'
WHERE id = 832 AND dimension_id = 39 AND position = 12 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'Flaws upset me a great deal.',
    texte_es = 'Los defectos me molestan mucho.',
    texte_pt = 'Os defeitos contrariam-me muito.'
WHERE id = 833 AND dimension_id = 39 AND position = 13 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I tolerate no mistakes.',
    texte_es = 'No tolero ningún error.',
    texte_pt = 'Não tolero nenhum erro.'
WHERE id = 834 AND dimension_id = 39 AND position = 14 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I relentlessly try to correct everything.',
    texte_es = 'Me empeño sin descanso en corregirlo todo.',
    texte_pt = 'Empenho-me obstinadamente em corrigir tudo.'
WHERE id = 835 AND dimension_id = 39 AND position = 15 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'Imperfection makes me uncomfortable.',
    texte_es = 'Lo imperfecto me incomoda.',
    texte_pt = 'O que é imperfeito deixa-me desconfortável.'
WHERE id = 836 AND dimension_id = 39 AND position = 16 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I criticise the slightest flaw.',
    texte_es = 'Critico el menor defecto.',
    texte_pt = 'Critico o mais pequeno defeito.'
WHERE id = 837 AND dimension_id = 39 AND position = 17 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I lose patience with imperfections.',
    texte_es = 'Pierdo la paciencia ante las imperfecciones.',
    texte_pt = 'Perco a paciência perante as imperfeições.'
WHERE id = 838 AND dimension_id = 39 AND position = 18 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I stubbornly resist what is wrong.',
    texte_es = 'Me obstino ante lo que no está bien.',
    texte_pt = 'Obstino-me perante o que não está bem.'
WHERE id = 839 AND dimension_id = 39 AND position = 19 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I manage my frustrations well.',
    texte_es = 'Gestiono bien mis frustraciones.',
    texte_pt = 'Lido bem com as minhas frustrações.'
WHERE id = 840 AND dimension_id = 40 AND position = 0 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I remain calm when my plans fail.',
    texte_es = 'Mantengo la calma cuando mis planes fracasan.',
    texte_pt = 'Mantenho a calma quando os meus planos falham.'
WHERE id = 841 AND dimension_id = 40 AND position = 1 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I accept setbacks calmly.',
    texte_es = 'Acepto los contratiempos con serenidad.',
    texte_pt = 'Aceito os contratempos com serenidade.'
WHERE id = 842 AND dimension_id = 40 AND position = 2 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I recover after a disappointment.',
    texte_es = 'Me recupero después de una decepción.',
    texte_pt = 'Recupero depois de uma deceção.'
WHERE id = 843 AND dimension_id = 40 AND position = 3 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I keep my composure when facing obstacles.',
    texte_es = 'Mantengo la compostura ante los obstáculos.',
    texte_pt = 'Mantenho o sangue-frio perante os obstáculos.'
WHERE id = 844 AND dimension_id = 40 AND position = 4 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I turn frustration into patience.',
    texte_es = 'Transformo la frustración en paciencia.',
    texte_pt = 'Transformo a frustração em paciência.'
WHERE id = 845 AND dimension_id = 40 AND position = 5 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I do not let failure defeat me.',
    texte_es = 'No dejo que un fracaso me hunda.',
    texte_pt = 'Não me deixo abater por um fracasso.'
WHERE id = 846 AND dimension_id = 40 AND position = 6 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I respond flexibly to unexpected events.',
    texte_es = 'Afronto los imprevistos con flexibilidad.',
    texte_pt = 'Acolho os imprevistos com flexibilidade.'
WHERE id = 847 AND dimension_id = 40 AND position = 7 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I take a breath before reacting to an annoyance.',
    texte_es = 'Respiro antes de reaccionar a una contrariedad.',
    texte_pt = 'Respiro antes de reagir a uma contrariedade.'
WHERE id = 848 AND dimension_id = 40 AND position = 8 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I remain composed when nothing goes as planned.',
    texte_es = 'Mantengo la serenidad cuando nada sale como estaba previsto.',
    texte_pt = 'Mantenho a serenidade quando nada corre como previsto.'
WHERE id = 849 AND dimension_id = 40 AND position = 9 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'The slightest frustration makes me explode.',
    texte_es = 'La menor frustración me hace estallar.',
    texte_pt = 'A mais pequena frustração faz-me explodir.'
WHERE id = 850 AND dimension_id = 40 AND position = 10 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I fall apart when my plans fail.',
    texte_es = 'Me derrumbo cuando mis planes fracasan.',
    texte_pt = 'Vou-me abaixo quando os meus planos falham.'
WHERE id = 851 AND dimension_id = 40 AND position = 11 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'Setbacks infuriate me.',
    texte_es = 'Los contratiempos me sacan de quicio.',
    texte_pt = 'Os contratempos tiram-me do sério.'
WHERE id = 852 AND dimension_id = 40 AND position = 12 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I react violently when things go against me.',
    texte_es = 'Reacciono con violencia ante las contrariedades.',
    texte_pt = 'Reajo com violência à contrariedade.'
WHERE id = 853 AND dimension_id = 40 AND position = 13 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I dwell on my frustrations for a long time.',
    texte_es = 'Doy vueltas a mis frustraciones durante mucho tiempo.',
    texte_pt = 'Fico a remoer as minhas frustrações durante muito tempo.'
WHERE id = 854 AND dimension_id = 40 AND position = 14 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'An obstacle immediately discourages me.',
    texte_es = 'Un obstáculo me desanima de inmediato.',
    texte_pt = 'Um obstáculo desanima-me logo.'
WHERE id = 855 AND dimension_id = 40 AND position = 15 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I lose my temper over unexpected events.',
    texte_es = 'Pierdo los estribos ante los imprevistos.',
    texte_pt = 'Exalto-me perante os imprevistos.'
WHERE id = 856 AND dimension_id = 40 AND position = 16 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I find it hard when people interfere with my plans.',
    texte_es = 'Me cuesta aceptar que alguien interfiera en mis planes.',
    texte_pt = 'Custa-me aceitar que contrariem os meus planos.'
WHERE id = 857 AND dimension_id = 40 AND position = 17 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'Frustration makes me aggressive.',
    texte_es = 'La frustración me vuelve agresivo.',
    texte_pt = 'A frustração torna-me agressivo.'
WHERE id = 858 AND dimension_id = 40 AND position = 18 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I quickly lose my calm when things get stuck.',
    texte_es = 'Pierdo rápidamente la calma cuando algo se atasca.',
    texte_pt = 'Perco depressa a calma quando algo fica bloqueado.'
WHERE id = 859 AND dimension_id = 40 AND position = 19 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I accept that growth takes time.',
    texte_es = 'Acepto que crecer requiere tiempo.',
    texte_pt = 'Aceito que crescer leva tempo.'
WHERE id = 860 AND dimension_id = 41 AND position = 0 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I progress at my own pace without judging myself.',
    texte_es = 'Avanzo a mi propio ritmo sin juzgarme.',
    texte_pt = 'Progrido ao meu ritmo sem me julgar.'
WHERE id = 861 AND dimension_id = 41 AND position = 1 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I persevere in my personal development.',
    texte_es = 'Persevero en mi desarrollo personal.',
    texte_pt = 'Persevero no meu desenvolvimento pessoal.'
WHERE id = 862 AND dimension_id = 41 AND position = 2 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I celebrate small steps forward.',
    texte_es = 'Celebro los pequeños avances.',
    texte_pt = 'Celebro os pequenos progressos.'
WHERE id = 863 AND dimension_id = 41 AND position = 3 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I accept setbacks in my progress as normal.',
    texte_es = 'Acepto mis retrocesos como algo normal.',
    texte_pt = 'Aceito os meus retrocessos como algo normal.'
WHERE id = 864 AND dimension_id = 41 AND position = 4 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I remain patient with myself.',
    texte_es = 'Tengo paciencia conmigo mismo.',
    texte_pt = 'Mantenho a paciência comigo mesmo.'
WHERE id = 865 AND dimension_id = 41 AND position = 5 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I see how far I have come, not just how far I still have to go.',
    texte_es = 'Veo lo que he avanzado, no solo lo que me falta.',
    texte_pt = 'Vejo o caminho que já percorri, não apenas o que falta.'
WHERE id = 866 AND dimension_id = 41 AND position = 6 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I cultivate consistency in my efforts.',
    texte_es = 'Cultivo la constancia en mis esfuerzos.',
    texte_pt = 'Cultivo a constância nos meus esforços.'
WHERE id = 867 AND dimension_id = 41 AND position = 7 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I trust the process of growth.',
    texte_es = 'Confío en el proceso de crecimiento.',
    texte_pt = 'Confio no processo de crescimento.'
WHERE id = 868 AND dimension_id = 41 AND position = 8 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I remain motivated over the long term.',
    texte_es = 'Mantengo la motivación a largo plazo.',
    texte_pt = 'Mantenho a motivação a longo prazo.'
WHERE id = 869 AND dimension_id = 41 AND position = 9 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I want to make progress immediately.',
    texte_es = 'Quiero avanzar de inmediato.',
    texte_pt = 'Quero progredir imediatamente.'
WHERE id = 870 AND dimension_id = 41 AND position = 10 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I become discouraged if I do not progress quickly.',
    texte_es = 'Me desanimo si no avanzo rápido.',
    texte_pt = 'Desanimo se não progredir depressa.'
WHERE id = 871 AND dimension_id = 41 AND position = 11 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I am hard on myself.',
    texte_es = 'Soy duro conmigo mismo.',
    texte_pt = 'Sou duro comigo mesmo.'
WHERE id = 872 AND dimension_id = 41 AND position = 12 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I compare myself with others and become impatient.',
    texte_es = 'Me comparo con los demás y me impaciento.',
    texte_pt = 'Comparo-me com os outros e fico impaciente.'
WHERE id = 873 AND dimension_id = 41 AND position = 13 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I give up my efforts too soon.',
    texte_es = 'Abandono mis esfuerzos demasiado pronto.',
    texte_pt = 'Desisto dos meus esforços demasiado cedo.'
WHERE id = 874 AND dimension_id = 41 AND position = 14 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I cannot bear setbacks in my progress.',
    texte_es = 'No soporto mis retrocesos.',
    texte_pt = 'Não suporto os meus retrocessos.'
WHERE id = 875 AND dimension_id = 41 AND position = 15 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I want instant results.',
    texte_es = 'Quiero resultados instantáneos.',
    texte_pt = 'Quero resultados instantâneos.'
WHERE id = 876 AND dimension_id = 41 AND position = 16 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'My own slow progress irritates me.',
    texte_es = 'Me irrita mi propia lentitud.',
    texte_pt = 'A minha própria lentidão irrita-me.'
WHERE id = 877 AND dimension_id = 41 AND position = 17 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I overlook how far I have come.',
    texte_es = 'No tengo en cuenta lo que ya he avanzado.',
    texte_pt = 'Desvalorizo o caminho que já percorri.'
WHERE id = 878 AND dimension_id = 41 AND position = 18 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'My impatience holds back my growth.',
    texte_es = 'Mi impaciencia frena mi crecimiento.',
    texte_pt = 'A minha impaciência trava o meu crescimento.'
WHERE id = 879 AND dimension_id = 41 AND position = 19 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I pursue my projects consistently.',
    texte_es = 'Llevo adelante mis proyectos con constancia.',
    texte_pt = 'Levo os meus projetos por diante com constância.'
WHERE id = 880 AND dimension_id = 42 AND position = 0 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I persevere until the work is complete.',
    texte_es = 'Persevero hasta llegar al final.',
    texte_pt = 'Persevero até à conclusão.'
WHERE id = 881 AND dimension_id = 42 AND position = 1 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I handle work deadlines calmly.',
    texte_es = 'Gestiono con serenidad los plazos laborales.',
    texte_pt = 'Lido com serenidade com os prazos profissionais.'
WHERE id = 882 AND dimension_id = 42 AND position = 2 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I remain patient with lengthy tasks.',
    texte_es = 'Mantengo la paciencia ante las tareas largas.',
    texte_pt = 'Mantenho a paciência perante tarefas demoradas.'
WHERE id = 883 AND dimension_id = 42 AND position = 3 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I move forward step by step without rushing.',
    texte_es = 'Avanzo paso a paso sin apresurarme.',
    texte_pt = 'Avanço passo a passo sem me apressar.'
WHERE id = 884 AND dimension_id = 42 AND position = 4 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I remain calm under pressure.',
    texte_es = 'Mantengo la calma bajo presión.',
    texte_pt = 'Mantenho a calma sob pressão.'
WHERE id = 885 AND dimension_id = 42 AND position = 5 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I tolerate projects that drag on.',
    texte_es = 'Soporto los proyectos que se alargan.',
    texte_pt = 'Suporto os projetos que se arrastam.'
WHERE id = 886 AND dimension_id = 42 AND position = 6 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I remain focused on the long term.',
    texte_es = 'Mantengo la concentración a largo plazo.',
    texte_pt = 'Mantenho o foco a longo prazo.'
WHERE id = 887 AND dimension_id = 42 AND position = 7 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I accept revisions and reworking.',
    texte_es = 'Acepto las revisiones y tener que rehacer el trabajo.',
    texte_pt = 'Aceito as revisões e a necessidade de refazer o trabalho.'
WHERE id = 888 AND dimension_id = 42 AND position = 8 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I finish what I start.',
    texte_es = 'Termino lo que empiezo.',
    texte_pt = 'Termino o que começo.'
WHERE id = 889 AND dimension_id = 42 AND position = 9 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I abandon projects that take too long.',
    texte_es = 'Abandono los proyectos que duran demasiado.',
    texte_pt = 'Abandono os projetos demasiado demorados.'
WHERE id = 890 AND dimension_id = 42 AND position = 10 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I become discouraged when things do not move forward.',
    texte_es = 'Me desanimo cuando las cosas no avanzan.',
    texte_pt = 'Desanimo quando as coisas não avançam.'
WHERE id = 891 AND dimension_id = 42 AND position = 11 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'Work pressure makes me break down.',
    texte_es = 'La presión laboral me hace perder el control.',
    texte_pt = 'A pressão profissional faz-me ir abaixo.'
WHERE id = 892 AND dimension_id = 42 AND position = 12 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I do a rushed job to finish sooner.',
    texte_es = 'Hago el trabajo de cualquier manera para terminar antes.',
    texte_pt = 'Faço o trabalho à pressa e sem cuidado para acabar mais cedo.'
WHERE id = 893 AND dimension_id = 42 AND position = 13 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I become impatient with lengthy tasks.',
    texte_es = 'Me impaciento ante las tareas largas.',
    texte_pt = 'Fico impaciente perante tarefas demoradas.'
WHERE id = 894 AND dimension_id = 42 AND position = 14 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I switch projects as soon as things get stuck.',
    texte_es = 'Cambio de proyecto en cuanto algo se atasca.',
    texte_pt = 'Mudo de projeto assim que algo fica bloqueado.'
WHERE id = 895 AND dimension_id = 42 AND position = 15 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'Revisions irritate me.',
    texte_es = 'Las revisiones me irritan.',
    texte_pt = 'As revisões irritam-me.'
WHERE id = 896 AND dimension_id = 42 AND position = 16 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I want immediate results at work.',
    texte_es = 'Quiero resultados inmediatos en el trabajo.',
    texte_pt = 'Quero resultados imediatos no trabalho.'
WHERE id = 897 AND dimension_id = 42 AND position = 17 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I lose patience with work that takes a long time.',
    texte_es = 'Pierdo la paciencia con los asuntos que llevan mucho tiempo.',
    texte_pt = 'Perco a paciência com os processos demorados.'
WHERE id = 898 AND dimension_id = 42 AND position = 18 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'My impatience harms my projects.',
    texte_es = 'Mi impaciencia perjudica mis proyectos.',
    texte_pt = 'A minha impaciência prejudica os meus projetos.'
WHERE id = 899 AND dimension_id = 42 AND position = 19 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I remain calm in the face of injustice.',
    texte_es = 'Mantengo la calma ante la injusticia.',
    texte_pt = 'Mantenho a calma perante a injustiça.'
WHERE id = 900 AND dimension_id = 43 AND position = 0 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I respond to injustice without violence.',
    texte_es = 'Respondo a la injusticia sin violencia.',
    texte_pt = 'Respondo à injustiça sem violência.'
WHERE id = 901 AND dimension_id = 43 AND position = 1 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I remain patient while seeking a fair solution.',
    texte_es = 'Mantengo la paciencia mientras busco una solución justa.',
    texte_pt = 'Mantenho a paciência enquanto procuro uma solução justa.'
WHERE id = 902 AND dimension_id = 43 AND position = 2 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I control my anger in the face of unfairness.',
    texte_es = 'Controlo mi ira ante la falta de equidad.',
    texte_pt = 'Controlo a minha raiva perante a falta de equidade.'
WHERE id = 903 AND dimension_id = 43 AND position = 3 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I maintain my dignity when treated unfairly.',
    texte_es = 'Mantengo la dignidad cuando me tratan injustamente.',
    texte_pt = 'Mantenho a dignidade perante um tratamento injusto.'
WHERE id = 904 AND dimension_id = 43 AND position = 4 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I do not rush to take revenge.',
    texte_es = 'No me apresuro a vengarme.',
    texte_pt = 'Não me precipito a vingar-me.'
WHERE id = 905 AND dimension_id = 43 AND position = 5 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I leave injustices to time and to God.',
    texte_es = 'Dejo las injusticias en manos del tiempo y de Dios.',
    texte_pt = 'Entrego as injustiças ao tempo e a Deus.'
WHERE id = 906 AND dimension_id = 43 AND position = 6 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I respond to unfairness with restraint.',
    texte_es = 'Reacciono con mesura ante la falta de equidad.',
    texte_pt = 'Reajo com ponderação à falta de equidade.'
WHERE id = 907 AND dimension_id = 43 AND position = 7 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I hold on to hope that justice will be done.',
    texte_es = 'Conservo la esperanza de que se haga justicia.',
    texte_pt = 'Mantenho a esperança de que se faça justiça.'
WHERE id = 908 AND dimension_id = 43 AND position = 8 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I endure injustice without becoming bitter.',
    texte_es = 'Soporto la injusticia sin llenarme de amargura.',
    texte_pt = 'Suporto a injustiça sem me amargurar.'
WHERE id = 909 AND dimension_id = 43 AND position = 9 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'Injustice makes me explode.',
    texte_es = 'La injusticia me hace estallar.',
    texte_pt = 'A injustiça faz-me explodir.'
WHERE id = 910 AND dimension_id = 43 AND position = 10 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I want to take revenge immediately.',
    texte_es = 'Quiero vengarme de inmediato.',
    texte_pt = 'Quero vingar-me imediatamente.'
WHERE id = 911 AND dimension_id = 43 AND position = 11 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I lose all composure in the face of unfairness.',
    texte_es = 'Pierdo toda la calma ante la falta de equidad.',
    texte_pt = 'Perco toda a calma perante a falta de equidade.'
WHERE id = 912 AND dimension_id = 43 AND position = 12 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I react violently to injustice.',
    texte_es = 'Reacciono con violencia ante la injusticia.',
    texte_pt = 'Reajo com violência à injustiça.'
WHERE id = 913 AND dimension_id = 43 AND position = 13 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I dwell for a long time on injustices I have suffered.',
    texte_es = 'Doy vueltas durante mucho tiempo a las injusticias que he sufrido.',
    texte_pt = 'Fico a remoer durante muito tempo as injustiças que sofri.'
WHERE id = 914 AND dimension_id = 43 AND position = 14 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'Unfairness makes me bitter.',
    texte_es = 'La falta de equidad me llena de amargura.',
    texte_pt = 'A falta de equidade deixa-me amargurado.'
WHERE id = 915 AND dimension_id = 43 AND position = 15 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I cannot tolerate any injustice.',
    texte_es = 'No soporto ninguna injusticia.',
    texte_pt = 'Não suporto nenhuma injustiça.'
WHERE id = 916 AND dimension_id = 43 AND position = 16 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I lose my temper as soon as something is unfair.',
    texte_es = 'Pierdo los estribos en cuanto algo es injusto.',
    texte_pt = 'Exalto-me assim que algo é injusto.'
WHERE id = 917 AND dimension_id = 43 AND position = 17 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I become aggressive in the face of injustice.',
    texte_es = 'Me vuelvo agresivo ante la injusticia.',
    texte_pt = 'Torno-me agressivo perante a injustiça.'
WHERE id = 918 AND dimension_id = 43 AND position = 18 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'Injustice destroys my patience.',
    texte_es = 'La injusticia destruye mi paciencia.',
    texte_pt = 'A injustiça destrói a minha paciência.'
WHERE id = 919 AND dimension_id = 43 AND position = 19 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I control my emotions under strain.',
    texte_es = 'Controlo mis emociones en situaciones de tensión.',
    texte_pt = 'Controlo as minhas emoções sob tensão.'
WHERE id = 920 AND dimension_id = 44 AND position = 0 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I take a breath before reacting.',
    texte_es = 'Respiro antes de reaccionar.',
    texte_pt = 'Respiro antes de reagir.'
WHERE id = 921 AND dimension_id = 44 AND position = 1 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I keep calm when I am angry.',
    texte_es = 'Mantengo la calma cuando estoy enfadado.',
    texte_pt = 'Mantenho a calma quando estou irritado.'
WHERE id = 922 AND dimension_id = 44 AND position = 2 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I channel my anger calmly.',
    texte_es = 'Canalizo mi ira con serenidad.',
    texte_pt = 'Canalizo a minha raiva com serenidade.'
WHERE id = 923 AND dimension_id = 44 AND position = 3 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I remain composed in intense moments.',
    texte_es = 'Mantengo la serenidad en los momentos intensos.',
    texte_pt = 'Mantenho a serenidade nos momentos intensos.'
WHERE id = 924 AND dimension_id = 44 AND position = 4 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I take a step back before answering.',
    texte_es = 'Tomo distancia antes de responder.',
    texte_pt = 'Distancio-me um pouco antes de responder.'
WHERE id = 925 AND dimension_id = 44 AND position = 5 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I manage my stress with patience.',
    texte_es = 'Gestiono mi estrés con paciencia.',
    texte_pt = 'Giro o meu stress com paciência.'
WHERE id = 926 AND dimension_id = 44 AND position = 6 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I defuse my own outbursts.',
    texte_es = 'Freno mis arrebatos.',
    texte_pt = 'Travo os meus acessos de exaltação.'
WHERE id = 927 AND dimension_id = 44 AND position = 7 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I stay in control of my reactions.',
    texte_es = 'Mantengo el control de mis reacciones.',
    texte_pt = 'Mantenho o controlo das minhas reações.'
WHERE id = 928 AND dimension_id = 44 AND position = 8 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I turn irritation into calm.',
    texte_es = 'Transformo la irritación en calma.',
    texte_pt = 'Transformo a irritação em calma.'
WHERE id = 929 AND dimension_id = 44 AND position = 9 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I easily lose my temper.',
    texte_es = 'Pierdo los estribos fácilmente.',
    texte_pt = 'Exalto-me facilmente.'
WHERE id = 930 AND dimension_id = 44 AND position = 10 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I react in the heat of the moment without thinking.',
    texte_es = 'Reacciono en caliente sin pensar.',
    texte_pt = 'Reajo a quente sem pensar.'
WHERE id = 931 AND dimension_id = 44 AND position = 11 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'My emotions quickly overwhelm me.',
    texte_es = 'Mis emociones me desbordan rápidamente.',
    texte_pt = 'As minhas emoções dominam-me depressa.'
WHERE id = 932 AND dimension_id = 44 AND position = 12 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I shout when I am upset.',
    texte_es = 'Grito cuando algo me contraría.',
    texte_pt = 'Grito quando sou contrariado.'
WHERE id = 933 AND dimension_id = 44 AND position = 13 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I lose control under strain.',
    texte_es = 'Pierdo el control en situaciones de tensión.',
    texte_pt = 'Perco o controlo sob tensão.'
WHERE id = 934 AND dimension_id = 44 AND position = 14 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I get angry over the slightest thing.',
    texte_es = 'Me enfado por cualquier cosa.',
    texte_pt = 'Irrito-me por tudo e por nada.'
WHERE id = 935 AND dimension_id = 44 AND position = 15 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I react impulsively.',
    texte_es = 'Reacciono de forma impulsiva.',
    texte_pt = 'Reajo de forma impulsiva.'
WHERE id = 936 AND dimension_id = 44 AND position = 16 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'My anger quickly erupts.',
    texte_es = 'Mi ira estalla rápidamente.',
    texte_pt = 'A minha raiva explode depressa.'
WHERE id = 937 AND dimension_id = 44 AND position = 17 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I often regret my reactions.',
    texte_es = 'A menudo me arrepiento de mis reacciones.',
    texte_pt = 'Arrependo-me frequentemente das minhas reações.'
WHERE id = 938 AND dimension_id = 44 AND position = 18 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I struggle to control my impatience.',
    texte_es = 'Me cuesta controlar mi impaciencia.',
    texte_pt = 'Custa-me controlar a minha impaciência.'
WHERE id = 939 AND dimension_id = 44 AND position = 19 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I wait for God''s answers with confidence.',
    texte_es = 'Espero las respuestas de Dios con confianza.',
    texte_pt = 'Espero as respostas de Deus com confiança.'
WHERE id = 940 AND dimension_id = 45 AND position = 0 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I wait patiently in prayer without growing weary.',
    texte_es = 'Espero con paciencia en la oración, sin cansarme.',
    texte_pt = 'Espero com paciência na oração, sem me cansar.'
WHERE id = 941 AND dimension_id = 45 AND position = 1 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I trust God''s timing.',
    texte_es = 'Confío en los tiempos de Dios.',
    texte_pt = 'Confio no tempo de Deus.'
WHERE id = 942 AND dimension_id = 45 AND position = 2 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I persevere spiritually while I wait.',
    texte_es = 'Persevero espiritualmente mientras espero.',
    texte_pt = 'Persevero espiritualmente enquanto espero.'
WHERE id = 943 AND dimension_id = 45 AND position = 3 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I keep my faith when God seems silent.',
    texte_es = 'Mantengo la fe cuando Dios parece guardar silencio.',
    texte_pt = 'Mantenho a fé quando Deus parece estar em silêncio.'
WHERE id = 944 AND dimension_id = 45 AND position = 4 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I accept that God acts in His own time.',
    texte_es = 'Acepto que Dios actúa a su tiempo.',
    texte_pt = 'Aceito que Deus age no seu tempo.'
WHERE id = 945 AND dimension_id = 45 AND position = 5 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I remain faithful even without an immediate answer.',
    texte_es = 'Permanezco fiel incluso sin una respuesta inmediata.',
    texte_pt = 'Permaneço fiel mesmo sem uma resposta imediata.'
WHERE id = 946 AND dimension_id = 45 AND position = 6 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I cultivate patience in my spiritual life.',
    texte_es = 'Cultivo la paciencia en mi vida espiritual.',
    texte_pt = 'Cultivo a paciência na minha vida espiritual.'
WHERE id = 947 AND dimension_id = 45 AND position = 7 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I entrust myself to God without rushing.',
    texte_es = 'Me pongo en manos de Dios sin apresurarme.',
    texte_pt = 'Entrego-me a Deus sem me precipitar.'
WHERE id = 948 AND dimension_id = 45 AND position = 8 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I grow as I wait in confidence.',
    texte_es = 'Crezco mientras espero con confianza.',
    texte_pt = 'Cresço enquanto espero com confiança.'
WHERE id = 949 AND dimension_id = 45 AND position = 9 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I become impatient with God''s silence.',
    texte_es = 'Me impaciento ante el silencio de Dios.',
    texte_pt = 'Fico impaciente perante o silêncio de Deus.'
WHERE id = 950 AND dimension_id = 45 AND position = 10 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I want immediate answers from God.',
    texte_es = 'Quiero respuestas inmediatas de Dios.',
    texte_pt = 'Quero respostas imediatas de Deus.'
WHERE id = 951 AND dimension_id = 45 AND position = 11 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I doubt when God takes His time.',
    texte_es = 'Dudo cuando Dios tarda.',
    texte_pt = 'Duvido quando Deus demora.'
WHERE id = 952 AND dimension_id = 45 AND position = 12 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I become discouraged in prayer.',
    texte_es = 'Me desanimo en la oración.',
    texte_pt = 'Desanimo na oração.'
WHERE id = 953 AND dimension_id = 45 AND position = 13 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I give up my faith if nothing comes quickly.',
    texte_es = 'Abandono la fe si nada llega pronto.',
    texte_pt = 'Abandono a fé se nada vier depressa.'
WHERE id = 954 AND dimension_id = 45 AND position = 14 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I force things instead of waiting for God.',
    texte_es = 'Fuerzo las cosas en lugar de esperar a Dios.',
    texte_pt = 'Forço as coisas em vez de esperar por Deus.'
WHERE id = 955 AND dimension_id = 45 AND position = 15 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'God''s silence frustrates me.',
    texte_es = 'El silencio de Dios me frustra.',
    texte_pt = 'O silêncio de Deus frustra-me.'
WHERE id = 956 AND dimension_id = 45 AND position = 16 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I lose patience in my spiritual life.',
    texte_es = 'Pierdo la paciencia en mi vida espiritual.',
    texte_pt = 'Perco a paciência na minha vida espiritual.'
WHERE id = 957 AND dimension_id = 45 AND position = 17 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'I cannot bear waiting for God.',
    texte_es = 'No soporto esperar a Dios.',
    texte_pt = 'Não suporto esperar por Deus.'
WHERE id = 958 AND dimension_id = 45 AND position = 18 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE questions
SET texte_en = 'My impatience affects my faith.',
    texte_es = 'Mi impaciencia afecta a mi fe.',
    texte_pt = 'A minha impaciência afeta a minha fé.'
WHERE id = 959 AND dimension_id = 45 AND position = 19 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'patience');

UPDATE tranches_interpretation
SET texte_en = 'The fruit of the Spirit is still scarcely evident across the attitudes assessed.',
    texte_es = 'El fruto del Espíritu todavía se manifiesta muy poco en el conjunto de las actitudes evaluadas.',
    texte_pt = 'O fruto do Espírito ainda se manifesta muito pouco no conjunto das atitudes avaliadas.'
WHERE position = 0 AND min_score = 0 AND max_score = 19 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = tranches_interpretation.referentiel_id AND r.code = 'patience');

UPDATE tranches_interpretation
SET texte_en = 'Several positive dispositions are present, but their expression remains weak or inconsistent.',
    texte_es = 'Existen varias disposiciones positivas, pero su expresión sigue siendo débil o inconstante.',
    texte_pt = 'Existem várias disposições positivas, mas a sua expressão continua a ser fraca ou inconstante.'
WHERE position = 1 AND min_score = 20 AND max_score = 39 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = tranches_interpretation.referentiel_id AND r.code = 'patience');

UPDATE tranches_interpretation
SET texte_en = 'The profile shows a real imprint, with a moderate presence of the fruit of the Spirit.',
    texte_es = 'El perfil muestra una huella real, con una presencia moderada del fruto del Espíritu.',
    texte_pt = 'O perfil mostra uma marca real, com uma presença moderada do fruto do Espírito.'
WHERE position = 2 AND min_score = 40 AND max_score = 59 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = tranches_interpretation.referentiel_id AND r.code = 'patience');

UPDATE tranches_interpretation
SET texte_en = 'The fruit of the Spirit appears to be expressed in encouraging ways in several areas of life.',
    texte_es = 'El fruto del Espíritu parece manifestarse de forma alentadora en varias áreas de la vida.',
    texte_pt = 'O fruto do Espírito parece manifestar-se de forma encorajadora em várias áreas da vida.'
WHERE position = 3 AND min_score = 60 AND max_score = 79 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = tranches_interpretation.referentiel_id AND r.code = 'patience');

UPDATE tranches_interpretation
SET texte_en = 'The profile reveals a strong and consistent expression of the qualities assessed, while leaving room for continued growth.',
    texte_es = 'El perfil revela una expresión fuerte y coherente de las cualidades evaluadas, sin dejar de dar lugar a un crecimiento continuo.',
    texte_pt = 'O perfil revela uma expressão forte e coerente das qualidades avaliadas, deixando espaço para um crescimento contínuo.'
WHERE position = 4 AND min_score = 80 AND max_score = 100 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = tranches_interpretation.referentiel_id AND r.code = 'patience');
