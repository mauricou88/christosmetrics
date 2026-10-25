#!/usr/bin/env bash
# =========================================================================
# CHRISTOSMETRICS — installation Capacitor en une commande
# =========================================================================
# Prérequis sur ton PC :
#   - Node.js 20+     (vérifier : node --version)
#   - npm             (vérifier : npm --version)
#   - Pour Android    : Android Studio (installe JDK + SDK + AVD)
#   - Pour iOS        : Mac + Xcode (uniquement sous macOS)
#
# Usage : ./setup-mobile.sh
# =========================================================================
set -e

cd "$(dirname "$0")/frontend"

echo "📦 Installation des dépendances npm (incluant Capacitor)..."
npm install

echo ""
echo "🏗️  Build du frontend (vers dist/)..."
npm run build

# Capacitor init : ne fait rien si déjà initialisé
if [ ! -f capacitor.config.ts ] && [ ! -f capacitor.config.json ]; then
  echo "⚙️  Initialisation Capacitor..."
  npx cap init CHRISTOSMETRICS app.christosmetrics.mobile --web-dir=dist
else
  echo "✓ Capacitor déjà initialisé"
fi

# Ajouter les plateformes si absentes
if [ ! -d android ]; then
  echo "🤖 Ajout de la plateforme Android..."
  npx cap add android
else
  echo "✓ Plateforme Android déjà ajoutée"
fi

# iOS seulement sur Mac
if [[ "$OSTYPE" == "darwin"* ]]; then
  if [ ! -d ios ]; then
    echo "🍎 Ajout de la plateforme iOS..."
    npx cap add ios
  else
    echo "✓ Plateforme iOS déjà ajoutée"
  fi
else
  echo "ℹ️  iOS nécessite macOS — étape ignorée"
fi

echo ""
echo "🔄 Synchronisation du build dans les plateformes natives..."
npx cap sync

echo ""
echo "✅ Setup Capacitor terminé !"
echo ""
echo "Prochaines étapes :"
echo "  🤖 Android : ouvrir Android Studio avec   npx cap open android"
echo "  🍎 iOS     : ouvrir Xcode avec            npx cap open ios"
echo ""
echo "Pour un rebuild rapide : npm run cap:sync"
