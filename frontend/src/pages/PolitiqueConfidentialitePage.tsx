import { Link } from 'react-router-dom';

/** Information publique sur les données personnelles ; mentions à valider avant publication. */
export function PolitiqueConfidentialitePage() {
  return (
    <div className="wrap">
      <Link className="lien-retour" to="/">← Présentation de l’application</Link>
      <div className="eyebrow">CHRISTOSMETRICS · Informations légales</div>
      <h1>Politique de confidentialité</h1>
      <p className="lede">Comprendre l’utilisation de vos données et exercer vos droits.</p>
      <p className="hint">Version du <time dateTime="2026-10-27">27 octobre 2026</time> · Projet à valider avant publication.</p>

      <div className="card" role="note" aria-label="Informations à compléter avant publication">
        <p>
          <strong>À compléter avant publication :</strong> adresse postale et adresse e-mail de contact,
          identité juridique complète de l’éditeur, durées de conservation des journaux et sauvegardes,
          liste des prestataires et garanties applicables aux éventuels transferts hors Espace économique
          européen. Le recueil préalable du consentement explicite aux données religieuses doit également
          être mis en place et vérifié. Cette page décrit un cadre à valider ; elle ne suffit pas à établir
          la conformité du service.
        </p>
      </div>

      <article aria-label="Politique de confidentialité de CHRISTOSMETRICS">
        <section aria-labelledby="confidentialite-responsable">
          <h2 id="confidentialite-responsable">1. Responsable du traitement et contact</h2>
          <p>
            Le service numérique Christos est édité par <strong>CMSWeShare</strong>, représentée par
            Maurice MBA (« Momo »). CMSWeShare est responsable des traitements de données personnelles
            décrits dans la présente politique : collecte, hébergement, sécurité, support utilisateur.
            Adresse postale : à préciser avant publication. Adresse e-mail pour les questions
            et l’exercice des droits : à renseigner avant publication.
          </p>
          <p>
            La méthode CHRISTOS sur laquelle repose le service — questionnaires, grilles d’interprétation
            et principes d’analyse — a été conçue par <strong>Luka Ankou (SISA)</strong>. Luka Ankou
            conserve la paternité et les droits moraux attachés à cette méthode. Les questions concernant
            la méthode elle-même peuvent être adressées à l’éditeur ci-dessus, qui les relaiera.
          </p>
        </section>

        <section aria-labelledby="confidentialite-donnees">
          <h2 id="confidentialite-donnees">2. Données collectées</h2>
          <ul>
            <li>Compte : adresse e-mail, prénom, nom, église renseignée et empreinte sécurisée du mot de passe.</li>
            <li>Parcours : réponses aux questionnaires, progression, dates de passation, scores et résultats.</li>
            <li>Restitutions : rapports PDF générés et enregistrés sur le serveur ou téléchargés sur votre appareil.</li>
            <li>Fonctionnement technique : jeton de session, informations de connexion et journaux nécessaires à la sécurité, pouvant inclure l’adresse IP.</li>
          </ul>
          <p>
            Les champs signalés comme obligatoires à l’inscription sont nécessaires à la création du compte.
            Les réponses sont nécessaires au calcul des résultats du questionnaire choisi. Vous pouvez
            consulter les pages publiques sans créer de compte et choisir de ne pas commencer un test.
          </p>
          <p>
            Les réponses, les résultats et l’église renseignée peuvent révéler vos convictions religieuses.
            Ces informations constituent des données sensibles au sens de l’article 9 du RGPD.
          </p>
        </section>

        <section aria-labelledby="confidentialite-finalites">
          <h2 id="confidentialite-finalites">3. Finalités et bases légales</h2>
          <ul>
            <li>Créer le compte, authentifier l’utilisateur et fournir les fonctions demandées : exécution du contrat de service (article 6, paragraphe 1, b du RGPD).</li>
            <li>Traiter les informations révélant des convictions religieuses pour les parcours spirituels, les scores et les PDF : consentement explicite préalable (articles 6, paragraphe 1, a et 9, paragraphe 2, a du RGPD).</li>
            <li>Prévenir les accès abusifs et assurer la sécurité : intérêt légitime de l’éditeur à protéger le service et ses utilisateurs (article 6, paragraphe 1, f du RGPD).</li>
            <li>Répondre aux demandes relatives aux droits et respecter les obligations légales applicables : obligation légale (article 6, paragraphe 1, c du RGPD).</li>
          </ul>
          <p>
            Le consentement aux données sensibles doit être libre, spécifique, éclairé et distinct de
            l’acceptation des CGU. La création d’un compte ou la simple utilisation du service ne vaut
            pas consentement explicite. Vous pouvez le retirer à tout moment ; le retrait n’affecte pas
            la licéité des traitements antérieurs et met fin aux traitements concernés, sous réserve
            des exceptions prévues par la loi. Les fonctions qui nécessitent ces données ne peuvent
            alors plus être fournies.
          </p>
          <p>
            Les scores sont calculés automatiquement à partir de vos réponses pour votre réflexion
            personnelle. Ils ne doivent pas servir à prendre une décision produisant des effets
            juridiques ou vous affectant de manière significative.
            Vous n’êtes soumis à aucune décision fondée exclusivement sur un traitement automatisé
            produisant des effets juridiques ou vous affectant de manière significative au sens
            de l’article 22 du RGPD.
          </p>
        </section>

        <section aria-labelledby="confidentialite-hebergement">
          <h2 id="confidentialite-hebergement">4. Destinataires, hébergement et transferts</h2>
          <p>
            L’accès aux données est réservé aux personnes habilitées de l’éditeur et aux prestataires
            techniques, dans la limite de leurs missions. Le partage d’un PDF que vous téléchargez
            relève de votre choix ; vérifiez son contenu et ses destinataires avant de le transmettre.
          </p>
          <p>
            La configuration du projet prévoit un hébergement Render en Union européenne, à Francfort
            (Allemagne), pour le backend et la base de données. La région effectivement déployée et
            l’emplacement des sauvegardes doivent être confirmés avant publication.
          </p>
          <p>Les prestataires suivants contribuent au fonctionnement du service :</p>
          <ul>
            <li>Render Services, Inc. — hébergement du backend et de la base de données, région configurée en Union européenne.</li>
            <li>GitHub Inc. — hébergement du code source ; aucune donnée personnelle des utilisateurs n’y est stockée.</li>
            <li>Prestataire d’envoi d’e-mails transactionnels — à préciser avant publication.</li>
          </ul>
          <p>
            Une région européenne ne garantit pas à elle seule l’absence de transfert hors Espace
            économique européen, notamment lors d’opérations de support ou du recours à des
            sous-traitants. Les pays, destinataires et garanties effectives restent à documenter.
            Tout transfert concerné doit respecter le chapitre V du RGPD, par exemple au moyen d’une
            décision d’adéquation ou de clauses contractuelles types accompagnées des mesures nécessaires.
            Vous pouvez demander les informations et une copie des garanties applicables au contact indiqué ci-dessus.
          </p>
        </section>

        <section aria-labelledby="confidentialite-conservation">
          <h2 id="confidentialite-conservation">5. Durée de conservation et suppression</h2>
          <p>
            Les données du compte, réponses, résultats et PDF enregistrés sont conservés pour vous
            permettre de retrouver vos parcours tant que votre compte est maintenu. La règle applicable
            aux comptes inactifs doit être définie avant publication ; aucune suppression automatique
            pour inactivité n’est annoncée à ce stade.
          </p>
          <p>
            Vous pouvez demander l’effacement ou utiliser « Supprimer mon compte » dans votre espace
            personnel. Après confirmation de votre mot de passe, cette fonction supprime votre compte
            et les réponses, résultats et PDF associés dans la base active. Les copies déjà téléchargées
            sur vos appareils ou transmises à des tiers ne sont pas supprimées à distance.
          </p>
          <p>
            Les durées exactes des journaux techniques, des sauvegardes et des éventuelles archives
            imposées par une obligation légale doivent être renseignées avant publication. Toute
            conservation résiduelle doit être limitée à sa finalité, avec un accès restreint ; aucune
            disparition immédiate de toutes les sauvegardes n’est garantie par la suppression du compte.
          </p>
        </section>

        <section aria-labelledby="confidentialite-droits">
          <h2 id="confidentialite-droits">6. Vos droits</h2>
          <p>Dans les conditions prévues par le RGPD, vous disposez des droits suivants :</p>
          <ul>
            <li>Accès à vos données et aux informations relatives à leur traitement.</li>
            <li>Rectification des données inexactes et complément des informations incomplètes.</li>
            <li>Effacement de vos données dans les conditions prévues par l’article 17 du RGPD.</li>
            <li>Limitation du traitement de vos données dans les cas prévus par l’article 18 du RGPD.</li>
            <li>Portabilité des données fournies, traitées automatiquement sur la base du consentement ou du contrat, dans un format structuré, couramment utilisé et lisible par machine.</li>
            <li>Opposition, pour des raisons tenant à votre situation particulière, aux traitements fondés sur l’intérêt légitime, sous réserve des exceptions légales.</li>
            <li>Retrait du consentement à tout moment lorsque le traitement repose sur celui-ci.</li>
          </ul>
          <p>
            Pour exercer vos droits, écrivez au contact indiqué à la section 1 en précisant votre demande
            et l’adresse e-mail du compte. Une preuve d’identité proportionnée peut être demandée en cas
            de doute raisonnable. Une réponse doit être apportée sous un mois ; ce délai peut être prolongé
            de deux mois en raison de la complexité ou du nombre de demandes, avec information motivée
            dans le premier mois.
          </p>
          <p>
            Vous pouvez également adresser une réclamation à la{' '}
            <a href="https://www.cnil.fr/fr/plaintes">Commission nationale de l’informatique et des libertés (CNIL)</a>.
          </p>
        </section>

        <section aria-labelledby="confidentialite-cookies">
          <h2 id="confidentialite-cookies">7. Cookies, stockage local et services tiers</h2>
          <p>
            L’application utilise le stockage local du navigateur pour le profil et la session
            (clés « christos_user » et « christos_token »). Sur mobile, le jeton est conservé dans
            le stockage natif de l’application. La déconnexion efface ces informations de session.
            Ces mécanismes servent à maintenir votre authentification ; ils ne sont pas des cookies publicitaires.
          </p>
          <p>
            Aucun outil publicitaire ou de mesure d’audience n’a été identifié dans le code consulté.
            Tout ajout de traceurs non strictement nécessaires doit être précédé d’une information
            adaptée et, lorsque requis, de votre consentement.
          </p>
          <p>
            Les styles actuels chargent des polices depuis Google Fonts, ce qui entraîne des requêtes
            vers ce prestataire et la transmission de données techniques, notamment l’adresse IP.
            Ce flux, ses destinataires et ses éventuels transferts doivent être vérifiés avant publication,
            ou les polices hébergées localement.
          </p>
        </section>

        <section aria-labelledby="confidentialite-evolution">
          <h2 id="confidentialite-evolution">8. Évolution de cette politique</h2>
          <p>
            Cette politique doit être mise à jour lorsque les traitements évoluent. La version en
            vigueur porte une date de mise à jour. Toute nouvelle finalité nécessitant votre consentement
            doit faire l’objet d’un recueil préalable distinct.
          </p>
        </section>

        <section aria-labelledby="confidentialite-mineurs">
          <h2 id="confidentialite-mineurs">9. Protection des mineurs</h2>
          <p>
            CHRISTOSMETRICS n’est pas destiné aux utilisateurs de moins de quinze ans. Pour les
            utilisateurs âgés de quinze ans à moins de dix-huit ans, l’autorisation d’un titulaire
            de l’autorité parentale est requise au titre des conditions d’accès propres au service.
            Cette règle du service est distincte du seuil légal français : dans le cadre de l’offre
            directe de services de la société de l’information, un mineur peut consentir seul au
            traitement de ses données fondé sur le consentement dès quinze ans, conformément à
            l’article 8 du RGPD et à l’article 45 de la loi Informatique et Libertés.
          </p>
          <p>
            Si vous êtes titulaire de l’autorité parentale sur un mineur ayant créé un compte sans
            votre accord, écrivez-nous au contact indiqué à la section 1 pour en demander la suppression.
          </p>
        </section>
      </article>
    </div>
  );
}
