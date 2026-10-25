# CHRISTOSMETRICS — Sécurité

## Correctifs appliqués dans la V3

| # | Priorité | Correctif | Fichier(s) |
|---|---|---|---|
| 1 | 🔴 | Secrets JWT fail-fast (plus de fallback dev dans application.yml) | `application.yml`, `JwtService.java` |
| 2 | 🔴 | Mots de passe DB via `.env` jamais committé | `docker-compose.yml`, `.env.example` |
| 3 | 🔴 | CORS paramétrable via `APP_CORS_ORIGINS` (plus de wildcard) | `SecurityConfig.java` |
| 5 | 🟠 | Rate limiting login : 5/min/IP + 5/min/email | `AuthController`, `RateLimiter` |
| 6 | 🟠 | Validation stricte des DTOs (`@Email`, `@Size`, `@Pattern`) | `AuthDtos`, `CompteController` |
| 7 | 🟠 | Upload PDF sécurisé : magic bytes, Content-Type, taille max 2 Mo, sanitisation nom | `RestitutionPdfController` |
| 8 | 🟠 | Rate limiting upload PDF : 30/h/user | idem |
| 9 | 🟡 | Politique mot de passe : 8-100 car, majuscule+minuscule+chiffre | `AuthDtos` + `ChangementMdp` |
| 10 | 🟡 | Masquage des e-mails dans les logs (RGPD) | `MailService.masquerEmail()` |
| 11 | 🟡 | HSTS + `forward-headers-strategy: native` (HTTPS forcé derrière proxy) | `application.yml`, `SecurityConfig` |
| 12 | 🟡 | Content Security Policy stricte + X-Frame-Options DENY + Referrer-Policy | `SecurityConfig` |
| 13 | 🟡 | Mail HTML : échappement anti-XSS des variables utilisateur | `MailService.corpsHtml()` |
| 14 | 🟡 | Révocation JWT via `tokenVersion` (logout global, changement mot de passe) | `User`, `JwtService`, `JwtAuthFilter`, `CompteService` |

## Variables d'environnement obligatoires en production

| Variable | Rôle | Exemple |
|---|---|---|
| `APP_JWT_SECRET` | Secret JWT (min 32 octets) | `$(openssl rand -base64 64)` |
| `DB_URL` | JDBC URL PostgreSQL | `jdbc:postgresql://host:5432/db` |
| `DB_USER` / `DB_PASSWORD` | Credentials DB | — |
| `APP_CORS_ORIGINS` | Origines frontend autorisées | `https://christosmetrics.app` |
| `SPRING_PROFILES_ACTIVE` | `prod` (jamais `dev`) | `prod` |

## Variables recommandées pour l'envoi mail

| Variable | Valeur type |
|---|---|
| `APP_MAIL_ACTIF` | `true` |
| `SMTP_HOST` | `in-v3.mailjet.com` |
| `SMTP_PORT` | `587` |
| `SMTP_USER` / `SMTP_PASSWORD` | credentials Mailjet |
| `SMTP_AUTH` / `SMTP_STARTTLS` | `true` / `true` |

## Durcissement additionnel recommandé plus tard

- **4** JWT en cookie `HttpOnly + Secure + SameSite=Strict` pour le web (Capacitor conserve localStorage, c'est OK).
- **15** 2FA (TOTP) pour les comptes admin.
- **20** Snapshots quotidiens PostgreSQL + export mensuel chiffré sur S3.

## Audit

Les contrôles d'accès par utilisateur sont validés par :
- `PassationApplicationService.chargerPassationDeUser()` → `SecurityException` si l'ID appartient à un autre user
- `RestitutionPdfService.charger()` → même check
- `SyntheseService.synthese(user)` → ne lit QUE les passations de l'user authentifié

## V3-mobile (Capacitor)

Correctifs supplémentaires pour l'app native iOS/Android :

| # | Correctif | Fichier |
|---|---|---|
| M1 | Token stocké dans storage natif (Preferences) sur mobile, plus sûr que localStorage web | `client.ts` |
| M2 | Routing HashRouter sur plateformes natives (évite le besoin d'un serveur HTTP qui gère les routes) | `App.tsx` |
| M3 | CORS étendu à `capacitor://localhost` (iOS) et `http://localhost` (Android) | `.env.example` |
| M4 | Téléchargement/partage PDF via API native (Filesystem + Share) | `telechargementPdf.ts` |
| M5 | `androidScheme: 'https'` pour que le WebView envoie des Origin corrects | `capacitor.config.ts` |
