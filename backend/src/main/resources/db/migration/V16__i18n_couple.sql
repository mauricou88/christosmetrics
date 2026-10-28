-- couple : traductions EN / ES / PT. UTF-8.
-- Aucun texte francais, polarite, seuil ou identifiant modifie.
-- UPDATE deterministes limites au referentiel couple.

UPDATE referentiels
SET nom_en = 'Couple',
    verset_en = 'Galatians 5:22',
    nom_es = 'Pareja',
    verset_es = 'Gálatas 5:22',
    nom_pt = 'Casal',
    verset_pt = 'Gálatas 5:22'
WHERE code = 'couple' AND id = 7;

UPDATE dimensions
SET libelle_en = 'Love',
    libelle_court_en = 'love',
    libelle_es = 'Amor',
    libelle_court_es = 'amor',
    libelle_pt = 'Amor',
    libelle_court_pt = 'amor'
WHERE id = 46 AND position = 0 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = dimensions.referentiel_id AND r.code = 'couple');

UPDATE dimensions
SET libelle_en = 'Joy',
    libelle_court_en = 'joy',
    libelle_es = 'Alegría',
    libelle_court_es = 'alegría',
    libelle_pt = 'Alegria',
    libelle_court_pt = 'alegria'
WHERE id = 47 AND position = 1 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = dimensions.referentiel_id AND r.code = 'couple');

UPDATE dimensions
SET libelle_en = 'Peace',
    libelle_court_en = 'peace',
    libelle_es = 'Paz',
    libelle_court_es = 'paz',
    libelle_pt = 'Paz',
    libelle_court_pt = 'paz'
WHERE id = 48 AND position = 2 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = dimensions.referentiel_id AND r.code = 'couple');

UPDATE dimensions
SET libelle_en = 'Patience',
    libelle_court_en = 'patience',
    libelle_es = 'Paciencia',
    libelle_court_es = 'paciencia',
    libelle_pt = 'Paciência',
    libelle_court_pt = 'paciência'
WHERE id = 49 AND position = 3 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = dimensions.referentiel_id AND r.code = 'couple');

UPDATE dimensions
SET libelle_en = 'Kindness',
    libelle_court_en = 'kindness',
    libelle_es = 'Bondad',
    libelle_court_es = 'bondad',
    libelle_pt = 'Bondade',
    libelle_court_pt = 'bondade'
WHERE id = 50 AND position = 4 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = dimensions.referentiel_id AND r.code = 'couple');

UPDATE dimensions
SET libelle_en = 'Goodness',
    libelle_court_en = 'goodness',
    libelle_es = 'Benevolencia',
    libelle_court_es = 'benevolencia',
    libelle_pt = 'Benevolência',
    libelle_court_pt = 'benevolência'
WHERE id = 51 AND position = 5 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = dimensions.referentiel_id AND r.code = 'couple');

UPDATE dimensions
SET libelle_en = 'Faithfulness',
    libelle_court_en = 'faithfulness',
    libelle_es = 'Fidelidad',
    libelle_court_es = 'fidelidad',
    libelle_pt = 'Fidelidade',
    libelle_court_pt = 'fidelidade'
WHERE id = 52 AND position = 6 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = dimensions.referentiel_id AND r.code = 'couple');

UPDATE dimensions
SET libelle_en = 'Gentleness',
    libelle_court_en = 'gentleness',
    libelle_es = 'Mansedumbre',
    libelle_court_es = 'mansedumbre',
    libelle_pt = 'Mansidão',
    libelle_court_pt = 'mansidão'
WHERE id = 53 AND position = 7 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = dimensions.referentiel_id AND r.code = 'couple');

UPDATE dimensions
SET libelle_en = 'Self-control',
    libelle_court_en = 'self-control',
    libelle_es = 'Dominio propio',
    libelle_court_es = 'dominio propio',
    libelle_pt = 'Domínio próprio',
    libelle_court_pt = 'domínio próprio'
WHERE id = 54 AND position = 8 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = dimensions.referentiel_id AND r.code = 'couple');

UPDATE questions
SET texte_en = 'God''s love, the sacrificial love that gives, forgives and offers itself, is the foundation of the couple''s relationship.',
    texte_es = 'El amor de Dios, el amor sacrificial que da, perdona y se entrega, constituye el fundamento de la pareja.',
    texte_pt = 'O amor de Deus, o amor sacrificial que dá, perdoa e se entrega, constitui o fundamento do casal.'
WHERE id = 960 AND dimension_id = 46 AND position = 0 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'couple');

UPDATE questions
SET texte_en = 'The deep joy that comes from God characterises the atmosphere of the home, regardless of circumstances.',
    texte_es = 'La alegría profunda que viene de Dios caracteriza el ambiente del hogar, independientemente de las circunstancias.',
    texte_pt = 'A alegria profunda que vem de Deus caracteriza o ambiente do lar, independentemente das circunstâncias.'
WHERE id = 961 AND dimension_id = 47 AND position = 0 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'couple');

UPDATE questions
SET texte_en = 'God''s peace reigns in the couple''s conversations, decisions and everyday interactions.',
    texte_es = 'La paz de Dios reina en las conversaciones, las decisiones y las interacciones cotidianas de la pareja.',
    texte_pt = 'A paz de Deus reina nas conversas, nas decisões e nas interações quotidianas do casal.'
WHERE id = 962 AND dimension_id = 48 AND position = 0 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'couple');

UPDATE questions
SET texte_en = 'The couple patiently bears with each other''s weaknesses and limitations, without losing their temper at the first setback.',
    texte_es = 'La pareja sobrelleva con paciencia las debilidades y los límites de cada uno, sin estallar ante la primera contrariedad.',
    texte_pt = 'O casal suporta com paciência as fraquezas e os limites de cada um, sem explodir à primeira contrariedade.'
WHERE id = 963 AND dimension_id = 49 AND position = 0 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'couple');

UPDATE questions
SET texte_en = 'Each partner does good to the other, even when it takes effort or sacrifice.',
    texte_es = 'Cada miembro de la pareja hace el bien al otro, incluso cuando requiere esfuerzo o sacrificio.',
    texte_pt = 'Cada um faz o bem ao outro, mesmo quando isso exige esforço ou sacrifício.'
WHERE id = 964 AND dimension_id = 50 AND position = 0 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'couple');

UPDATE questions
SET texte_en = 'Words and attitudes show gentleness, encouragement and respect.',
    texte_es = 'Las palabras y las actitudes expresan delicadeza, ánimo y respeto.',
    texte_pt = 'As palavras e as atitudes revelam delicadeza, encorajamento e respeito.'
WHERE id = 965 AND dimension_id = 51 AND position = 0 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'couple');

UPDATE questions
SET texte_en = 'Commitments made before God and to one''s spouse are consistently honoured.',
    texte_es = 'Los compromisos asumidos ante Dios y con el cónyuge se cumplen con constancia.',
    texte_pt = 'Os compromissos assumidos perante Deus e para com o cônjuge são honrados com constância.'
WHERE id = 966 AND dimension_id = 52 AND position = 0 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'couple');

UPDATE questions
SET texte_en = 'Disagreements are handled with self-control, humility and mutual respect.',
    texte_es = 'Los desacuerdos se gestionan con dominio propio, humildad y respeto mutuo.',
    texte_pt = 'Os desacordos são geridos com domínio próprio, humildade e respeito mútuo.'
WHERE id = 967 AND dimension_id = 53 AND position = 0 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'couple');

UPDATE questions
SET texte_en = 'Emotions, reactions and words are kept under control to preserve the couple''s unity.',
    texte_es = 'Las emociones, las reacciones y las palabras se controlan para preservar la unidad de la pareja.',
    texte_pt = 'As emoções, as reações e as palavras são controladas para preservar a unidade do casal.'
WHERE id = 968 AND dimension_id = 54 AND position = 0 AND EXISTS (SELECT 1 FROM dimensions d JOIN referentiels r ON r.id = d.referentiel_id WHERE d.id = questions.dimension_id AND r.code = 'couple');

UPDATE tranches_interpretation
SET texte_en = 'The fruit of the Spirit strongly characterises the couple''s relationship. Christ''s character is visible in their interactions.',
    texte_es = 'El fruto del Espíritu caracteriza de forma marcada la dinámica de la pareja. El carácter de Cristo es visible en sus interacciones.',
    texte_pt = 'O fruto do Espírito caracteriza fortemente a dinâmica do casal. O caráter de Cristo é visível nas suas interações.'
WHERE position = 0 AND min_score = 32 AND max_score = 36 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = tranches_interpretation.referentiel_id AND r.code = 'couple');

UPDATE tranches_interpretation
SET texte_en = 'The couple has good foundations, but some areas need strengthening.',
    texte_es = 'La pareja tiene buenos cimientos, pero algunas áreas necesitan fortalecerse.',
    texte_pt = 'O casal tem bons alicerces, mas algumas áreas precisam de ser fortalecidas.'
WHERE position = 1 AND min_score = 25 AND max_score = 31 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = tranches_interpretation.referentiel_id AND r.code = 'couple');

UPDATE tranches_interpretation
SET texte_en = 'Several vulnerabilities are evident. Some virtues are present, but are not yet sufficiently rooted in everyday life.',
    texte_es = 'Se observan varias fragilidades. Algunas virtudes están presentes, pero aún no están suficientemente arraigadas en la vida cotidiana.',
    texte_pt = 'São visíveis várias fragilidades. Algumas virtudes estão presentes, mas ainda não estão suficientemente enraizadas no dia a dia.'
WHERE position = 2 AND min_score = 18 AND max_score = 24 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = tranches_interpretation.referentiel_id AND r.code = 'couple');

UPDATE tranches_interpretation
SET texte_en = 'Several spiritual and relational foundations need deep restoration.',
    texte_es = 'Varios cimientos espirituales y relacionales necesitan una restauración profunda.',
    texte_pt = 'Vários alicerces espirituais e relacionais necessitam de uma restauração profunda.'
WHERE position = 3 AND min_score = 9 AND max_score = 17 AND EXISTS (SELECT 1 FROM referentiels r WHERE r.id = tranches_interpretation.referentiel_id AND r.code = 'couple');
