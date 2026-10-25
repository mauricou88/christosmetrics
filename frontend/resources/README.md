# Icônes et splash screens

Pour générer automatiquement toutes les tailles iOS/Android :

1. Place `icon.png` ici (1024×1024, PNG, carré, sans transparence sur les bords)
2. Place `splash.png` ici (2732×2732, PNG, logo centré sur fond uni)
3. Lance : `npx @capacitor/assets generate`

Ça génère et place automatiquement toutes les variantes dans :
- `ios/App/App/Assets.xcassets/`
- `android/app/src/main/res/`

L'image du logo CHRISTOSMETRICS peut servir de base pour `icon.png`.

## Sources Android personnalisées

Le dossier généré `frontend/android/` est exclu de Git. Les sources natives
de l'enregistrement et de la lecture PDF sont conservées dans `resources/android/`.
Modifier ces copies sources pour faire évoluer le plugin : le hook
`capacitor:sync:after` les recopie dans le projet Android à chaque `npx cap sync android`.

Après un clonage : installer les dépendances, configurer `.env.production`,
exécuter `npm run build`, `npx cap add android`, puis `npx cap sync android`.
Configurer ensuite le SDK dans `android/local.properties` (non versionné).
