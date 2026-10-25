# CHRISTOSMETRICS — version production

Application d'auto-diagnostic du fruit de l'Esprit (Galates 5.22).

- **Backend** : Spring Boot 3 (Java 21) + PostgreSQL + Flyway + JWT
- **Frontend web** : React 18 + TypeScript + Vite + Chart.js
- **Mobile** : à décider ensemble (React Native ou Flutter)

## Sommaire

- [Architecture](#architecture)
- [Ce qui est livré](#ce-qui-est-livré)
- [Lancer en local](#lancer-en-local)
- [Endpoints](#endpoints)
- [La logique de reprise de progression](#la-logique-de-reprise-de-progression)
- [Prochaines étapes](#prochaines-étapes)

## Architecture

Voir [`ARCHITECTURE.md`](./ARCHITECTURE.md) pour les détails. En résumé :

```
domain/       ← modèle métier + règles de scoring (cœur, sans techno)
application/  ← DTOs, mappers, services applicatifs (cas d'usage)
web/          ← controllers REST (couche présentation API)
infrastructure/ ← implémentations techniques
config/       ← sécurité, JWT, CORS
```

Le scoring vit **côté serveur** (moteur non falsifiable). Le front consomme
une API REST et ne fait que présenter les résultats.

## Ce qui est livré

### Backend (30 fichiers Java, 3 migrations SQL)

- 7 entités JPA : `User`, `Referentiel`, `Dimension`, `Question`,
  `Passation`, `Reponse`, `Resultat`.
- 4 repositories (interfaces Spring Data JPA).
- 2 services de domaine : `ScoringService` (RG-01..RG-09) et
  `ProgressionService` (reprise).
- 2 services applicatifs : `AuthService`, `PassationApplicationService`.
- 3 controllers : `AuthController`, `ReferentielController`, `PassationController`.
- Sécurité JWT + BCrypt (Spring Security stateless).
- Migrations Flyway : schéma + seed des 6 fruits (959 questions) + module Couple.
- Tests JUnit du scoring (validation des règles RG).

### Frontend (React + TypeScript)

- Contexte d'authentification avec restauration de session (localStorage).
- Hook `useQuestionnaire` — pilote le test **avec reprise automatique**.
- 4 pages : Login, Menu, Questionnaire, Résultats.
- Composants graphes (radar + entonnoir) réutilisant Chart.js.
- Routage protégé (React Router).

## Lancer en local

### Prérequis

- Docker + Docker Compose (méthode la plus simple), ou :
- Java 21, PostgreSQL 16, Node.js 20

### Démarrage rapide (Docker Compose)

```bash
docker compose up --build
```

- Backend : http://localhost:8081
- Frontend : http://localhost:5173
- PostgreSQL depuis Windows : localhost:5433

Créez un compte via l'écran d'inscription, puis lancez un test.

### Démarrage manuel (dev)

Base de données :
```bash
docker run -d --name christos-db -p 5433:5432 \
  -e POSTGRES_DB=christosmetrics -e POSTGRES_USER=christos -e POSTGRES_PASSWORD=christos \
  postgres:16-alpine
```

Backend :
```bash
cd backend
./mvnw spring-boot:run
```

Frontend :
```bash
cd frontend
npm install
npm run dev
```

## Endpoints

Authentification (public) :
- `POST /api/auth/register` — création de compte
- `POST /api/auth/login` — connexion → renvoie `{ token, user }`

Catalogue (public) :
- `GET  /api/referentiels` — liste des fruits + couple
- `GET  /api/referentiels/{code}` — détail (dimensions + questions)

Passations (JWT requis) :
- `POST /api/passations/demarrer?code=amour` — démarre OU reprend
- `POST /api/passations/{id}/repondre` — enregistre une réponse
- `POST /api/passations/{id}/repondre-lot` — enregistre un lot
- `POST /api/passations/{id}/terminer` — fige + calcule le résultat
- `GET  /api/passations/{id}/resultat` — relit un résultat avec son barème
  d’interprétation et sa tranche active

## La logique de reprise de progression

C'est **le mécanisme central** demandé.

Côté serveur :
- Modèle : `Passation` (état `EN_COURS` → `TERMINEE`).
- Règle : **au plus une passation `EN_COURS` par (user, référentiel)**.
- Chaque `Reponse` est persistée dès sa saisie (pas en fin de test).
- `ProgressionService.demarrerOuReprendre()` retrouve la passation en cours
  ou en crée une nouvelle.
- `etatDeProgression()` renvoie l'index de la première question sans réponse.

Côté client :
- Le token JWT est stocké dans `localStorage` → l'utilisateur reste connecté
  même après fermeture du navigateur (jusqu'à expiration).
- Le hook `useQuestionnaire` appelle `demarrer` au montage et se positionne
  automatiquement sur la prochaine question non répondue.
- L'utilisateur peut fermer l'onglet à tout moment, ses réponses sont
  déjà sauvegardées.

## Prochaines étapes

1. Génération PDF automatique côté serveur et envoi par e-mail.
2. Écran « historique des tests » + synthèse CHRISTOS globale.
3. Envoi de la restitution par e-mail.
4. Décision mobile (React Native recommandé pour partager la logique).


## 📱 App mobile (Capacitor)

Pour empaqueter l'app en version iOS/Android installable :

```bash
./setup-mobile.sh
```

Guide complet dans [MOBILE.md](./MOBILE.md).
