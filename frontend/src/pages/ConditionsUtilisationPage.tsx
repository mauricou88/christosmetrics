import { Link } from 'react-router-dom';

/** Conditions publiques du service ; identité et coordonnées à compléter avant publication. */
export function ConditionsUtilisationPage() {
  return (
    <div className="wrap">
      <Link className="lien-retour" to="/">← Présentation de l’application</Link>
      <div className="eyebrow">CHRISTOSMETRICS · Informations légales</div>
      <h1>Conditions générales d’utilisation</h1>
      <p className="lede">Les règles d’accès et d’utilisation de CHRISTOSMETRICS.</p>
      <p className="hint">Version du <time dateTime="2026-10-27">27 octobre 2026</time> · Projet à valider avant publication.</p>

      <div className="card" role="note" aria-label="Informations à compléter avant publication">
        <p>
          <strong>À compléter avant publication :</strong> identité juridique complète de l’éditeur,
          adresse postale et adresse e-mail de contact. Les modalités de présentation et d’acceptation
          des présentes conditions doivent être validées avant leur mise en application.
        </p>
      </div>

      <article aria-label="Conditions générales d’utilisation de CHRISTOSMETRICS">
        <section aria-labelledby="cgu-editeur">
          <h2 id="cgu-editeur">1. Éditeur, auteur et contact</h2>
          <p>
            Le service numérique Christos (ci-après « le Service ») est édité par{' '}
            <strong>CMSWeShare</strong>, représentée par Maurice MBA (« Momo »), ci-après « l’Éditeur ».
            Adresse postale : à préciser. Adresse e-mail de contact : à renseigner avant publication.
            L’Éditeur assure le développement, l’hébergement, la maintenance et le support du Service.
          </p>
          <p>
            La méthode CHRISTOS exploitée par le Service — questionnaires, grilles d’interprétation
            et principes d’analyse — est l’œuvre de <strong>Luka Ankou (SISA)</strong>, ci-après « l’Auteur »,
            qui en conserve la paternité et les droits moraux. L’exploitation de la méthode au sein du
            Service est encadrée par un accord entre l’Éditeur et l’Auteur.
          </p>
        </section>

        <section aria-labelledby="cgu-objet">
          <h2 id="cgu-objet">2. Objet du service</h2>
          <p>
            CHRISTOSMETRICS propose des questionnaires de réflexion sur le cheminement chrétien,
            des parcours individuels ou de couple, la sauvegarde des réponses, des restitutions de
            résultats et des rapports PDF. Les fonctionnalités disponibles sont celles présentées
            dans l’application.
          </p>
          <p>
            Les résultats sont calculés à partir des réponses déclarées par l’utilisateur et servent
            de support à sa réflexion personnelle. Ils ne constituent ni un diagnostic médical ou
            psychologique, ni une certification de la foi, ni une garantie de progression spirituelle.
            Ils ne doivent pas servir à discriminer une personne ou à décider de ses droits.
          </p>
        </section>

        <section aria-labelledby="cgu-compte">
          <h2 id="cgu-compte">3. Inscription et sécurité du compte</h2>
          <p>
            Les pages de présentation et d’information juridique sont publiques. L’accès aux parcours
            personnels nécessite un compte. L’utilisateur fournit des informations exactes, utilise
            une adresse e-mail à laquelle il a accès et maintient ses informations à jour.
          </p>
          <p>
            L’utilisateur conserve ses identifiants confidentiels, évite de partager sa session et
            se déconnecte sur les appareils partagés. En cas d’accès suspect, il avertit l’éditeur
            dès que possible. L’éditeur demeure responsable des obligations de sécurité qui lui incombent.
          </p>
          <p>
            L’utilisateur doit avoir la capacité juridique nécessaire ou disposer des autorisations
            requises. Pour un mineur, les règles de représentation et de consentement applicables
            doivent être respectées avant toute collecte de données sensibles.
          </p>
        </section>

        <section aria-labelledby="cgu-utilisation">
          <h2 id="cgu-utilisation">4. Utilisation acceptable</h2>
          <p>L’utilisateur s’engage à utiliser le service de bonne foi et à respecter les droits des tiers. Il lui est interdit de :</p>
          <ul>
            <li>Usurper une identité, accéder au compte d’autrui ou communiquer des données personnelles de tiers sans autorisation appropriée.</li>
            <li>Contourner les protections, tenter d’extraire des données sans autorisation ou perturber le fonctionnement du service.</li>
            <li>Utiliser les questionnaires, résultats ou PDF à des fins illicites, de harcèlement ou de discrimination.</li>
            <li>Reproduire ou exploiter commercialement les contenus protégés sans autorisation, hors exceptions légales.</li>
          </ul>
          <p>
            Pour les parcours de couple, chaque personne doit conserver la maîtrise de ses informations.
            Le partage d’un résultat ou d’un PDF doit respecter la vie privée des personnes concernées.
          </p>
        </section>

        <section aria-labelledby="cgu-propriete">
          <h2 id="cgu-propriete">5. Propriété intellectuelle</h2>
          <p>
            La méthode CHRISTOS — questionnaires, grilles d’interprétation, principes d’analyse et textes associés
            — demeure la propriété intellectuelle de son Auteur, Luka Ankou (SISA). Les éléments spécifiques
            au Service numérique — code source, interfaces graphiques, signes distinctifs de l’application
            « Christos », documentation technique — demeurent la propriété de l’Éditeur, CMSWeShare. Chaque
            partie conserve l’ensemble des droits attachés à ses propres contributions.
          </p>
          <p>
            Sous réserve des droits de tiers et des licences applicables, les éléments du service,
            notamment les logiciels, textes, questionnaires, visuels et signes distinctifs, sont
            protégés par le droit de la propriété intellectuelle. Leur mise à disposition n’emporte
            aucun transfert de propriété.
          </p>
          <p>
            L’utilisateur bénéficie d’un droit personnel, non exclusif et non transférable d’utiliser
            le service et ses restitutions pour ses besoins personnels. Il conserve ses droits sur
            les contenus qu’il fournit ; l’éditeur ne peut les utiliser que dans la mesure nécessaire
            à la fourniture du service et conformément aux règles de protection des données.
          </p>
        </section>

        <section aria-labelledby="cgu-prix">
          <h2 id="cgu-prix">6. Conditions financières</h2>
          <p>
            L’accès au service est actuellement gratuit. L’éditeur se réserve la possibilité
            d’introduire à l’avenir des fonctionnalités payantes ou optionnelles ; dans ce cas,
            les conditions tarifaires, les modalités de paiement et le droit de rétractation
            applicables seront portés à la connaissance des utilisateurs avant toute souscription,
            conformément aux dispositions légales applicables.
          </p>
        </section>

        <section aria-labelledby="cgu-responsabilite">
          <h2 id="cgu-responsabilite">7. Disponibilité et responsabilité</h2>
          <p>
            L’éditeur met en œuvre des moyens raisonnables pour assurer le fonctionnement et la
            sécurité du service. Des interruptions peuvent survenir, notamment pour maintenance,
            incident technique ou indisponibilité du réseau. L’utilisateur est invité à conserver
            une copie des rapports qu’il souhaite garder.
          </p>
          <p>
            La pertinence des restitutions dépend notamment des réponses fournies. L’utilisateur
            apprécie leur portée et reste libre des suites qu’il leur donne. L’éditeur répond des
            dommages qui lui sont imputables dans les conditions du droit applicable ; aucun résultat
            personnel ou spirituel déterminé n’est garanti.
          </p>
          <p>
            Aucune disposition des présentes conditions n’exclut les garanties légales, la responsabilité
            qui ne peut légalement être limitée, ni les droits impératifs dont bénéficie un consommateur.
          </p>
        </section>

        <section aria-labelledby="cgu-donnees">
          <h2 id="cgu-donnees">8. Données personnelles</h2>
          <p>
            La politique de confidentialité décrit les données traitées, leurs finalités, leurs
            destinataires, leur conservation et les modalités d’exercice des droits. Les données
            pouvant révéler des convictions religieuses nécessitent un consentement explicite préalable,
            distinct de l’acceptation des présentes conditions. L’acceptation des CGU ne remplace pas ce consentement.
          </p>
        </section>

        <section aria-labelledby="cgu-resiliation">
          <h2 id="cgu-resiliation">9. Suspension et résiliation</h2>
          <p>
            L’utilisateur peut cesser d’utiliser le service à tout moment et supprimer son compte
            depuis la fonction « Supprimer mon compte » de son espace personnel, après confirmation
            de son mot de passe. Cette suppression concerne également les réponses, résultats et PDF
            associés dans la base active. Les copies téléchargées ou partagées restent sous le contrôle
            de leurs détenteurs ; le sort des sauvegardes est précisé dans la politique de confidentialité.
          </p>
          <p>
            En cas de manquement aux présentes conditions ou de risque avéré pour la sécurité,
            l’éditeur peut prendre une mesure proportionnée de restriction, suspension ou fermeture
            du compte. Sauf urgence de sécurité ou obligation légale contraire, l’utilisateur est
            informé des motifs et dispose d’une possibilité de présenter ses observations ou de
            remédier au manquement. Il peut contester la mesure auprès du contact indiqué à la section 1.
          </p>
          <p>La fermeture d’un compte ne supprime pas les droits de l’utilisateur sur ses données personnelles.</p>
        </section>

        <section aria-labelledby="cgu-modifications">
          <h2 id="cgu-modifications">10. Évolution du service et des conditions</h2>
          <p>
            L’éditeur peut faire évoluer le service dans le respect des engagements et dispositions
            légales applicables. Les modifications importantes des conditions doivent être portées
            à la connaissance des utilisateurs avant leur entrée en vigueur, avec un délai adapté.
            Une nouvelle acceptation est recueillie lorsque nécessaire. Les modifications ne privent
            pas rétroactivement l’utilisateur de droits acquis.
          </p>
        </section>

        <section aria-labelledby="cgu-loi">
          <h2 id="cgu-loi">11. Droit applicable et règlement des différends</h2>
          <p>
            Les présentes conditions sont soumises au droit français, sous réserve des dispositions
            impératives protectrices du consommateur qui seraient applicables dans son pays de résidence.
            En cas de difficulté, l’utilisateur peut contacter l’éditeur pour rechercher une solution amiable,
            sans que cette démarche conditionne l’exercice de ses recours légaux.
          </p>
          <p>
            Les juridictions compétentes sont déterminées par les règles légales applicables.
            Aucune compétence exclusive dérogeant aux droits impératifs du consommateur n’est imposée.
            Si le dispositif de médiation de la consommation est applicable à l’activité de l’éditeur,
            les coordonnées du médiateur compétent et les modalités de saisine devront être ajoutées avant publication.
          </p>
        </section>
      </article>
    </div>
  );
}
