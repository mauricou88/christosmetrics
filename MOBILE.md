# CHRISTOSMETRICS Mobile — Guide pas à pas

Objectif : empaqueter ton frontend React en app native **iOS** + **Android**,
installable sur téléphone et publiable sur stores.

Préalable critique : **le backend doit être accessible depuis internet**
(pas localhost — l'app mobile ne verra pas ton PC). Déploie-le d'abord sur
Railway/Render puis renseigne son URL dans `frontend/.env.production`.

---

## 1. Préparer ton PC (une seule fois)

| OS | Pour Android | Pour iOS |
|---|---|---|
| Windows | Android Studio | ❌ pas possible (iOS = Mac obligatoire) |
| Linux | Android Studio | ❌ pas possible |
| macOS | Android Studio | Xcode (gratuit sur App Store) |

Dans tous les cas : **Node.js ≥ 20** et **npm**.

Vérifications :
```bash
node --version   # doit être ≥ v20
npm --version
```

### Android Studio
- Télécharger : https://developer.android.com/studio
- Au premier lancement, laisser installer le SDK + un émulateur (AVD)
- Vérifier que la variable `ANDROID_HOME` pointe vers le SDK (le script d'install d'Android Studio le fait)

### Xcode (Mac seulement)
- App Store → chercher "Xcode" → installer
- Ouvrir une fois pour accepter la licence
- `sudo xcode-select --install` pour les outils de ligne de commande

---

## 2. Installer tout en une commande

Dans le dossier racine du projet :

```bash
chmod +x setup-mobile.sh
./setup-mobile.sh
```

Ce script :
1. Installe les dépendances npm (dont Capacitor)
2. Compile le frontend React (`npm run build` → `frontend/dist/`)
3. Initialise Capacitor si besoin
4. Ajoute les plateformes `android/` et (si Mac) `ios/`
5. Synchronise le build dans les projets natifs

---

## 3. Générer les icônes et le splash

Place deux images dans `frontend/resources/` :
- `icon.png` — 1024×1024 (carré, sans transparence)
- `splash.png` — 2732×2732 (logo centré sur fond uni)

Puis :
```bash
cd frontend
npx @capacitor/assets generate
```

---

## 4. Lancer sur un téléphone/émulateur

### 🤖 Android (depuis n'importe quel OS)
```bash
cd frontend
npm run cap:android
```
Android Studio s'ouvre avec le projet. Clique sur ▶️ pour lancer sur un
émulateur ou un téléphone branché en USB (mode développeur activé).

### 🍎 iOS (Mac uniquement)
```bash
cd frontend
npm run cap:ios
```
Xcode s'ouvre. Sélectionne un simulateur ou ton iPhone branché, puis ▶️.

### Après chaque modification du code React
```bash
cd frontend
npm run cap:sync    # rebuild + sync
```
Puis relance depuis Android Studio / Xcode.

---

## 5. Build de distribution (APK, AAB, IPA)

### Android — APK pour tests sur un téléphone
Dans Android Studio : `Build → Build Bundle(s) / APK(s) → Build APK(s)`.
Le fichier `app-debug.apk` est dans `frontend/android/app/build/outputs/apk/debug/`.

### Android — AAB pour Play Store
Dans Android Studio : `Build → Generate Signed Bundle / APK...`
Génère une **keystore** (à conserver absolument — c'est l'identité de ton app).

### iOS — IPA pour TestFlight / App Store
Dans Xcode : `Product → Archive`
Puis `Distribute App → App Store Connect` (nécessite un compte Apple Developer à 99 €/an).

---

## 6. Comptes développeurs (si publication stores)

| Store | Coût | Validation |
|---|---|---|
| Google Play | 25 € une fois | 1-3 jours |
| App Store (Apple) | 99 €/an | 1-7 jours |

Pour tester sans compte développeur :
- Android : installer l'APK directement (option "Sources inconnues" activée)
- iOS : TestFlight (gratuit, lien à partager) ou sideloading via Xcode

---

## 7. En cas de pépin

| Problème | Solution |
|---|---|
| "command not found: npx" | Node.js pas installé ou PATH cassé |
| "Capacitor plugin not implemented on web" | Normal : certains plugins (Share, Filesystem) sont no-op en web, actifs sur mobile |
| Appels API bloqués par CORS | Vérifier que l'URL dans `.env.production` est HTTPS et que le backend a `capacitor://localhost` dans `APP_CORS_ORIGINS` |
| Écran blanc au lancement | Vérifier `webDir=dist` dans `capacitor.config.ts` + avoir fait `npm run build` avant `cap sync` |
| Android : clear cache | `cd android && ./gradlew clean` puis relancer |
| iOS : clear cache | Dans Xcode : `Product → Clean Build Folder` |

---

## 8. Mettre à jour l'app après une correction

```bash
cd frontend
# modifier le code React…
npm run cap:sync          # rebuild + sync dans les projets natifs
# puis relancer depuis Android Studio / Xcode
```

Pas besoin de relancer `setup-mobile.sh` — il n'est utile qu'au premier setup.

---

## Checklist "prêt à publier"

- [ ] Backend déployé en HTTPS (URL publique)
- [ ] `frontend/.env.production` pointe sur cette URL
- [ ] `APP_CORS_ORIGINS` du backend inclut `capacitor://localhost` et `http://localhost`
- [ ] Icônes générées (`npx @capacitor/assets generate`)
- [ ] Testé sur un vrai téléphone (pas juste émulateur)
- [ ] Nom de l'app défini dans `capacitor.config.ts` (`appName`)
- [ ] Permissions nécessaires déclarées dans Info.plist (iOS) et AndroidManifest.xml (Android) — par défaut : aucune pour CHRISTOSMETRICS
- [ ] Compte développeur Apple / Google créé si publication store
