# CHRISTOSMETRICS — Architecture de production

## Vue d'ensemble

Application d'auto-diagnostic du fruit de l'Esprit, en deux parcours :
- **Individuel** : 8 composantes, questionnaires détaillés (20 questions/dimension)
- **Couple** : 9 fruits, 1 affirmation chacun, score /36

Objectif de cette version : **production web** (puis mobile), avec
persistance de la progression, authentification, et logique métier isolée
côté serveur.

```
┌──────────────────────────────────────────────────────────────┐
│                     CLIENTS                                     │
│   React (web)          │   React Native (mobile, à venir)      │
└───────────┬────────────┴───────────────┬───────────────────────┘
            │         HTTPS / REST / JWT  │
┌───────────▼─────────────────────────────▼───────────────────────┐
│                  API SPRING BOOT (backend)                       │
│                                                                  │
│  web/          → Controllers REST (couche présentation API)      │
│  application/  → DTOs + Mappers + Services applicatifs (cas       │
│                  d'usage : orchestration)                        │
│  domain/       → Modèle métier + règles (scoring) + interfaces   │
│                  de repositories (cœur, sans dépendance techno)  │
│  infrastructure→ Implémentations techniques (moteur de scoring,  │
│                  générateurs, adaptateurs)                       │
│  config/       → Sécurité, CORS, beans                           │
└───────────┬──────────────────────────────────────────────────────┘
            │ JPA / Hibernate
┌───────────▼──────────────────────────────────────────────────────┐
│                     PostgreSQL                                    │
│   users · referentiels · passations · reponses · resultats       │
└──────────────────────────────────────────────────────────────────┘
```

## Pourquoi Spring Boot + React (avis d'architecte)

1. **Logique métier non falsifiable** : le scoring (RG-01..RG-09) vit côté
   serveur. Un client ne peut pas tricher sur les résultats.
2. **Une seule API pour web ET mobile** : le jour où l'on fait React Native,
   le backend ne bouge pas. On réécrit uniquement la présentation.
3. **Persistance & reprise** : sessions JWT + progression stockée en base →
   l'utilisateur se déconnecte/reconnecte et retrouve exactement où il en
   était (voir la logique métier « reprise de passation » ci-dessous).
4. **Écosystème** : Spring Security, Flyway (migrations), JPA, tests JUnit ;
   React + Recharts + hooks.

## Les 4 couches (dépendances dirigées vers le domaine)

### 1. `domain` — le cœur (aucune dépendance technique)
- `model/` : entités métier (User, Referentiel, Dimension, Passation,
  Reponse, Resultat) — POJOs annotés JPA mais sans logique technique.
- `service/` : **règles métier pures**. `ScoringService` applique les
  règles RG-01..RG-09. `ProgressionService` gère la reprise.
- `repository/` : **interfaces** (contrats) que l'infrastructure implémente.

### 2. `application` — les cas d'usage (orchestration)
- `dto/` : objets d'échange avec l'extérieur (jamais les entités directement).
- `mapper/` : conversion entité ⇄ DTO.
- Services applicatifs : orchestrent domaine + repositories pour réaliser un
  cas d'usage complet (« démarrer une passation », « enregistrer une
  réponse », « terminer et calculer »).

### 3. `web` — la présentation API
- `controller/` : endpoints REST. Ne contiennent AUCUNE logique métier :
  ils valident l'entrée, délèguent à l'application, renvoient un DTO.

### 4. `infrastructure` — les détails techniques
- `scoring/` : implémentation concrète du moteur (si on veut l'externaliser).
- Implémentations JPA des repositories (générées par Spring Data).

## Logique métier clé : la reprise de progression

**Besoin** : l'utilisateur se déconnecte en plein questionnaire et doit
retrouver sa progression en se reconnectant.

**Modèle** :
- Une `Passation` = une instance de test (un user + un référentiel + un état).
- État : `EN_COURS` → `TERMINEE`. Tant qu'elle est `EN_COURS`, chaque
  `Reponse` enregistrée est persistée immédiatement.
- À la reconnexion, `ProgressionService.reprendre(user, referentiel)`
  retrouve la passation `EN_COURS` (s'il y en a une) et renvoie l'index de
  la première question sans réponse → le front reprend exactement là.

**Règle** : une seule passation `EN_COURS` par (user, referentiel) à la fois.
Terminer une passation la fige (`TERMINEE`) et calcule le `Resultat`.

## Modèle de données (PostgreSQL)

```
users(id, email UNIQUE, mot_de_passe_hash, prenom, nom, eglise, cree_le)
referentiels(id, code UNIQUE, nom, type[INDIVIDUEL|COUPLE], verset, actif)
dimensions(id, referentiel_id FK, position, libelle, libelle_court)
questions(id, dimension_id FK, position, texte, polarite[DIRECTE|INVERSE])
passations(id, user_id FK, referentiel_id FK, etat, debutee_le, terminee_le)
reponses(id, passation_id FK, question_id FK, valeur[1..5], repondue_le,
         UNIQUE(passation_id, question_id))
resultats(id, passation_id FK UNIQUE, score_global, detail_json, calcule_le)
```

## Règles de scoring (rappel, RG-01..RG-09)

```
RG-01  points = valeur_echelle            (1..5, ou 1..4 pour le couple)
RG-02  si question INVERSE : score = (max+1) − points
RG-04  score_dimension_brut = Σ scores des questions de la dimension
RG-05  score_dimension_% = (brut − n·min) / (n·max − n·min) × 100
RG-06  score_global = moyenne non pondérée des dimensions (individuel)
       score_global = Σ points (couple, /36)
RG-07  tranche = barème contenant le score global arrondi
RG-09  top/flop = dimensions extrêmes
```

## Prochaines étapes

1. Backend : entités + repositories + ScoringService + endpoints (ce squelette).
2. Frontend React : appels API, écrans, reprise de progression.
3. Tests d'intégration du parcours complet.
4. **Mobile** : décision React Native vs Flutter (à trancher ensemble).
