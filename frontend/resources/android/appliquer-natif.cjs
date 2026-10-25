const fs = require('node:fs');
const path = require('node:path');

// Capacitor exécute ce hook après sync. Le projet Android généré reste ignoré par Git.
if (process.env.CAPACITOR_PLATFORM_NAME && process.env.CAPACITOR_PLATFORM_NAME !== 'android') process.exit(0);
const android = path.resolve(__dirname, '../../android');
if (!fs.existsSync(android)) process.exit(0);
const destination = path.join(android, 'app/src/main/java/app/christosmetrics/mobile');
fs.mkdirSync(destination, { recursive: true });
for (const nom of ['MainActivity.java', 'EnregistrementPdfPlugin.java']) {
  fs.copyFileSync(path.join(__dirname, nom), path.join(destination, nom));
}
console.log('Sources Android CHRISTOSMETRICS restaurées (enregistrement et lecture PDF).');
