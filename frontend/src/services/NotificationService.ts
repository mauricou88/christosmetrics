import { Capacitor } from '@capacitor/core';
import { LocalNotifications } from '@capacitor/local-notifications';

export type Rappel = { id: number; titre: string; corps: string; dateIso: string };
export type FrequenceRappel = 'jamais' | 'hebdo' | 'bihebdo' | 'mensuel';
export type StatutPermission = 'inconnu' | 'accordee' | 'refusee' | 'non-dispo';
export type PreferencesRappels = { actifs: boolean; frequence: FrequenceRappel; jour: number; heure: string; ancrage?: string };
const PREMIER_ID = 7100;
const ID_TEST = 7199;
const minuteurs = new Map<number, ReturnType<typeof setTimeout>>();
let revision = 0;
let file: Promise<unknown> = Promise.resolve();

/** Sérialise annulation et programmation afin qu’une ancienne opération ne réactive pas les rappels. */
function enSerie<T>(operation: () => Promise<T>): Promise<T> {
  const resultat = file.then(operation, operation);
  file = resultat.then(() => undefined, () => undefined);
  return resultat;
}

/** Lit et valide les préférences ; aucun stockage accessible signifie aucun opt-in présumé. */
export function lirePreferencesRappels(): PreferencesRappels {
  const defaut: PreferencesRappels = { actifs: false, frequence: 'hebdo', jour: 2, heure: '20:00' };
  try {
    const frequence = localStorage.getItem('rappels-frequence');
    const jour = Number(localStorage.getItem('rappels-jour') ?? 2);
    const heure = localStorage.getItem('rappels-heure') ?? '20:00';
    return {
      actifs: localStorage.getItem('rappels-actifs') === 'true' && frequence !== 'jamais',
      frequence: frequence === 'hebdo' || frequence === 'bihebdo' || frequence === 'mensuel' || frequence === 'jamais' ? frequence : 'hebdo',
      jour: Number.isInteger(jour) && jour >= 0 && jour <= 6 ? jour : 2,
      heure: /^(?:[01]\d|2[0-3]):[0-5]\d$/.test(heure) ? heure : '20:00',
      ancrage: localStorage.getItem('rappels-ancrage') ?? undefined,
    };
  } catch { return defaut; }
}

/** Enregistre l’opt-in en dernier ; retourne false si les préférences ne peuvent pas être conservées. */
export function enregistrerPreferencesRappels(preferences: PreferencesRappels): boolean {
  try {
    if (!preferences.actifs) localStorage.setItem('rappels-actifs', 'false');
    localStorage.setItem('rappels-frequence', preferences.frequence);
    localStorage.setItem('rappels-jour', String(preferences.jour));
    localStorage.setItem('rappels-heure', preferences.heure);
    if (preferences.ancrage) localStorage.setItem('rappels-ancrage', preferences.ancrage);
    else localStorage.removeItem('rappels-ancrage');
    localStorage.setItem('rappels-actifs', String(preferences.actifs));
    return true;
  } catch { return false; }
}

/** Calcule huit dates en heure locale : chaque semaine, toutes les deux semaines, ou le premier jour choisi du mois. */
export function calculerOccurrences(preferences: PreferencesRappels, maintenant = new Date()): Date[] {
  if (!preferences.actifs || preferences.frequence === 'jamais' || !Number.isInteger(preferences.jour)
      || preferences.jour < 0 || preferences.jour > 6 || !/^(?:[01]\d|2[0-3]):[0-5]\d$/.test(preferences.heure)) return [];
  const [heures, minutes] = preferences.heure.split(':').map(Number);
  const resultat: Date[] = [];
  if (preferences.frequence === 'mensuel') {
    let mois = maintenant.getMonth();
    while (resultat.length < 8) {
      const date = new Date(maintenant.getFullYear(), mois++, 1, heures, minutes);
      date.setDate(1 + (preferences.jour - date.getDay() + 7) % 7);
      if (date > maintenant) resultat.push(date);
    }
    return resultat;
  }
  const intervalle = preferences.frequence === 'bihebdo' ? 14 : 7;
  let date = preferences.ancrage ? new Date(preferences.ancrage) : new Date(NaN);
  if (!Number.isFinite(date.getTime()) || date.getDay() !== preferences.jour) {
    date = new Date(maintenant.getFullYear(), maintenant.getMonth(), maintenant.getDate(), heures, minutes);
    date.setDate(date.getDate() + (preferences.jour - date.getDay() + 7) % 7);
  }
  date.setHours(heures, minutes, 0, 0);
  // Incréments calendaires : l’heure locale reste la même aux changements d’heure.
  while (date <= maintenant) {
    date.setDate(date.getDate() + intervalle);
    date.setHours(heures, minutes, 0, 0);
  }
  while (resultat.length < 8) {
    resultat.push(new Date(date));
    date.setDate(date.getDate() + intervalle);
    date.setHours(heures, minutes, 0, 0);
  }
  return resultat;
}

/** Détecte aussi les iPad qui présentent un user-agent de Mac. */
function estIos(): boolean {
  return typeof navigator !== 'undefined' && (/iPad|iPhone|iPod/.test(navigator.userAgent)
    || (navigator.platform === 'MacIntel' && navigator.maxTouchPoints > 1));
}

/** N’annule que les identifiants réservés à ces rappels, jamais ceux d’une autre fonctionnalité. */
async function annulerProgrammation(): Promise<void> {
  minuteurs.forEach(minuteur => clearTimeout(minuteur));
  minuteurs.clear();
  if (Capacitor.isNativePlatform()) {
    const { notifications } = await LocalNotifications.getPending();
    const rappels = notifications.filter(n => n.id >= PREMIER_ID && n.id <= ID_TEST);
    if (rappels.length) await LocalNotifications.cancel({ notifications: rappels });
  }
}

/** Affiche via le service worker sur mobile ; le constructeur est réservé au fallback desktop. */
async function afficherWeb(rappel: Rappel): Promise<void> {
  if (Notification.permission !== 'granted') return;
  const registration = 'serviceWorker' in navigator ? await navigator.serviceWorker.getRegistration() : undefined;
  if (registration?.active) {
    await registration.showNotification(rappel.titre, { body: rappel.corps, icon: '/pwa-192x192.png', tag: `rappel-${rappel.id}` });
  } else if (!estIos()) {
    new Notification(rappel.titre, { body: rappel.corps, icon: '/pwa-192x192.png', tag: `rappel-${rappel.id}` });
  }
}

/** Réarme les délais longs par tranches, sans dépasser la limite des minuteurs JavaScript. */
function armerMinuteur(rappel: Rappel): void {
  const delai = new Date(rappel.dateIso).getTime() - Date.now();
  const minuteur = setTimeout(() => {
    if (minuteurs.get(rappel.id) !== minuteur) return;
    minuteurs.delete(rappel.id);
    if (new Date(rappel.dateIso).getTime() > Date.now()) armerMinuteur(rappel);
    // Ne déverse pas des rappels périmés à la reprise d’un onglet longtemps suspendu.
    else if (Date.now() - new Date(rappel.dateIso).getTime() < 15 * 60_000) void afficherWeb(rappel).catch(() => undefined);
  }, Math.min(Math.max(0, delai), 2_147_000_000));
  minuteurs.set(rappel.id, minuteur);
}

export const NotificationService = {
  /** Le natif utilise le plugin ; le Web exige HTTPS et les API de notification. */
  estDisponible(): boolean {
    if (Capacitor.isNativePlatform()) return Capacitor.isPluginAvailable('LocalNotifications');
    return typeof window !== 'undefined' && window.isSecureContext && 'Notification' in window
      && (!estIos() || this.estPwaInstallee());
  },
  /** Détecte l’installation PWA, y compris Safari iOS. */
  estPwaInstallee(): boolean {
    return typeof window !== 'undefined' && (window.matchMedia?.('(display-mode: standalone)').matches
      || (navigator as Navigator & { standalone?: boolean }).standalone === true);
  },
  /** L’invitation iPhone est indépendante de la présence de l’API Notification. */
  necessiteInstallationIos(): boolean {
    return !Capacitor.isNativePlatform() && estIos() && !this.estPwaInstallee();
  },
  /** Consulter le statut n’affiche jamais de boîte de permission. */
  async verifierPermission(): Promise<StatutPermission> {
    if (!this.estDisponible()) return 'non-dispo';
    try {
      const statut = Capacitor.isNativePlatform() ? (await LocalNotifications.checkPermissions()).display : Notification.permission;
      return statut === 'granted' ? 'accordee' : statut === 'denied' ? 'refusee' : 'inconnu';
    } catch { return 'inconnu'; }
  },
  /** Appel exclusivement depuis le geste d’activation ; pas d’await préalable sur Safari. */
  async demanderPermission(): Promise<boolean> {
    if (!this.estDisponible()) return false;
    try {
      if (Capacitor.isNativePlatform()) return (await LocalNotifications.requestPermissions()).display === 'granted';
      if (Notification.permission === 'granted') return true;
      if (Notification.permission === 'denied') return false;
      return await Notification.requestPermission() === 'granted';
    } catch { return false; }
  },
  /** Programme sans demander de permission implicitement. */
  async planifierRappel(rappel: Rappel): Promise<boolean> {
    const date = new Date(rappel.dateIso);
    if (!Number.isInteger(rappel.id) || !Number.isFinite(date.getTime()) || date.getTime() <= Date.now()
        || await this.verifierPermission() !== 'accordee') return false;
    try {
      if (Capacitor.isNativePlatform()) {
        await LocalNotifications.schedule({ notifications: [{ id: rappel.id, title: rappel.titre, body: rappel.corps, schedule: { at: date } }] });
      } else {
        const ancien = minuteurs.get(rappel.id);
        if (ancien !== undefined) clearTimeout(ancien);
        armerMinuteur(rappel);
      }
      return true;
    } catch { return false; }
  },
  /** Remplace l’ensemble des huit prochains rappels ; la dernière demande gagne. */
  replanifier(rappels: Rappel[]): Promise<boolean> {
    const numero = ++revision;
    return enSerie(async () => {
      if (numero !== revision) return false;
      try {
        await annulerProgrammation();
        for (const rappel of rappels) {
          if (numero !== revision) return false;
          if (!await this.planifierRappel(rappel)) { await annulerProgrammation(); return false; }
        }
        return true;
      } catch { return false; }
    });
  },
  /** Annule aussi les minuteurs Web et le test à dix secondes. */
  annulerTousLesRappels(): Promise<void> {
    ++revision;
    return enSerie(annulerProgrammation);
  },
  /** Prépare un test explicite ; la permission doit déjà être accordée. */
  testerMaintenant(titre: string, corps: string): Promise<boolean> {
    return enSerie(() => this.planifierRappel({ id: ID_TEST, titre, corps, dateIso: new Date(Date.now() + 10_000).toISOString() }));
  },
};
