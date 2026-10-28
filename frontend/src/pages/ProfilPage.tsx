import { useEffect, useState, type KeyboardEvent } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { Trans, useTranslation } from 'react-i18next';
import { useAuth } from '../context/AuthContext';
import { version } from '../../package.json';
import { useMoi } from '../hooks/useMoi';
import { JaugeChristos } from '../components/JaugeChristos';
import { BadgeStreak } from '../components/BadgeStreak';
import { Capacitor } from '@capacitor/core';
import { NotificationService, calculerOccurrences, lirePreferencesRappels, enregistrerPreferencesRappels, type PreferencesRappels, type FrequenceRappel, type StatutPermission } from '../services/NotificationService';

type ThemePref = 'light' | 'dark' | 'auto';
const langues = [
  { code: 'fr', label: '🇫🇷 Français' },
  { code: 'en', label: '🇬🇧 English' },
  { code: 'es', label: '🇪🇸 Español' },
  { code: 'pt', label: '🇵🇹 Português' },
] as const;
type Langue = typeof langues[number]['code'];

/** Présente les préférences et la progression personnelle sans bloquer le profil sur une erreur API. */
export function ProfilPage() {
  const { t, i18n } = useTranslation();
  const langueActive = (i18n.resolvedLanguage ?? i18n.language ?? 'fr').split('-')[0];
  const { user, deconnexion } = useAuth();
  const { moi, chargement, rafraichir } = useMoi();
  const navigate = useNavigate();
  const [rappels, setRappels] = useState(lirePreferencesRappels);
  const [statutPermission, setStatutPermission] = useState<StatutPermission>('inconnu');
  const [permissionEnCours, setPermissionEnCours] = useState(false);
  const [etatRappels, setEtatRappels] = useState<'repos' | 'attente' | 'ok' | 'erreur'>('repos');
  const [testRappel, setTestRappel] = useState<'repos' | 'ok' | 'erreur'>('repos');
  const [stockageRappelsIndisponible, setStockageRappelsIndisponible] = useState(false);
  const [revisionRappels, setRevisionRappels] = useState(0);
  const notificationsDisponibles = NotificationService.estDisponible();
  const [themePref, setThemePref] = useState<ThemePref>(() => {
    try {
      const preference = localStorage.getItem('theme-preference');
      return preference === 'light' || preference === 'dark' ? preference : 'auto';
    } catch {
      return 'auto';
    }
  });

  useEffect(() => {
    if (themePref === 'auto') {
      document.documentElement.removeAttribute('data-theme');
    } else {
      document.documentElement.setAttribute('data-theme', themePref);
    }
    try {
      localStorage.setItem('theme-preference', themePref);
    } catch {
      // Le choix reste actif pour cette session si le stockage est inaccessible.
    }
  }, [themePref]);

  useEffect(() => {
    let obsolete = false;
    /** Reprogramme à partir des nouveaux réglages, de la langue et du contexte disponible. */
    async function planifierProchainsRappels() {
      try {
        const permission = await NotificationService.verifierPermission();
        if (obsolete) return;
        setStatutPermission(permission);
        if (!notificationsDisponibles) return;
        if (!rappels.actifs || permission !== 'accordee') {
          await NotificationService.annulerTousLesRappels();
          if (!obsolete) setEtatRappels('repos');
          return;
        }
        setEtatRappels('attente');
        const preferences = { ...rappels, ancrage: rappels.ancrage ?? lirePreferencesRappels().ancrage };
        const dates = calculerOccurrences(preferences);
        const cleMessage = !moi ? 'msg_generique' : moi.streakActuel >= 7 ? 'msg_streak_fort'
          : moi.fruitsCompletes < 3 ? 'msg_debut' : moi.fruitsCompletes < 6 ? 'msg_progression' : 'msg_christos_debloque';
        const programme = await NotificationService.replanifier(dates.map((date, index) => ({
          id: 7100 + index, titre: t('rappels.test_titre'), corps: t(`rappels.${cleMessage}`), dateIso: date.toISOString(),
        })));
        const ok = dates.length === 8 && programme;
        if (obsolete) return;
        if (ok && !preferences.ancrage) {
          setStockageRappelsIndisponible(!enregistrerPreferencesRappels({ ...preferences, ancrage: dates[0].toISOString() }));
        }
        setEtatRappels(ok ? 'ok' : 'erreur');
      } catch {
        if (!obsolete) setEtatRappels('erreur');
      }
    }
    void planifierProchainsRappels();
    return () => { obsolete = true; };
  }, [rappels, notificationsDisponibles, moi?.streakActuel, moi?.fruitsCompletes, t, revisionRappels]);

  /** Persiste les nouveaux réglages ; l’effet lit ce nouvel état, jamais l’ancienne valeur React. */
  function modifierRappels(changements: Partial<PreferencesRappels>) {
    const suivants = { ...rappels, ...changements, ancrage: undefined };
    setStockageRappelsIndisponible(!enregistrerPreferencesRappels(suivants));
    setRappels(suivants);
    setTestRappel('repos');
  }

  /** Seul ce geste d’activation peut ouvrir une demande de permission système. */
  async function activerRappels(actifs: boolean) {
    if (!actifs) { modifierRappels({ actifs: false }); return; }
    setPermissionEnCours(true);
    const accordee = await NotificationService.demanderPermission();
    setPermissionEnCours(false);
    setStatutPermission(accordee ? 'accordee' : 'refusee');
    if (accordee) modifierRappels({ actifs: true, frequence: rappels.frequence === 'jamais' ? 'hebdo' : rappels.frequence });
  }

  /** Programme un test dans dix secondes, sans solliciter une nouvelle autorisation. */
  async function testerRappel() {
    const ok = await NotificationService.testerMaintenant(t('rappels.test_titre'), t('rappels.test_corps'));
    setTestRappel(ok ? 'ok' : 'erreur');
  }

  /** Applique la langue ; le stockage indisponible ne bloque pas le changement à l’écran. */
  async function changerLangue(code: Langue) {
    try {
      await i18n.changeLanguage(code);
      localStorage.setItem('langue-preference', code);
    } catch {
      // Le détecteur gère également la persistance lorsque le stockage est disponible.
    }
  }

  /** Permet de parcourir le groupe radio avec les flèches, Home et End. */
  function parcourirLangues(event: KeyboardEvent<HTMLButtonElement>, index: number) {
    let suivant: number;
    if (event.key === 'ArrowRight' || event.key === 'ArrowDown') suivant = (index + 1) % langues.length;
    else if (event.key === 'ArrowLeft' || event.key === 'ArrowUp') suivant = (index + langues.length - 1) % langues.length;
    else if (event.key === 'Home') suivant = 0;
    else if (event.key === 'End') suivant = langues.length - 1;
    else return;
    event.preventDefault();
    event.currentTarget.parentElement?.querySelectorAll<HTMLButtonElement>('[role="radio"]')[suivant]?.focus();
    void changerLangue(langues[suivant].code);
  }

  /** Ferme la session puis revient à l’accueil en conservant les préférences d’affichage. */
  function handleDeconnexion() {
    deconnexion();
    navigate('/', { replace: true });
  }

  /** Relance la présentation même pour un compte connecté ou un stockage indisponible. */
  function revoirIntroduction() {
    try { localStorage.removeItem('onboarding-done'); }
    catch { /* La route dédiée reste accessible sans stockage. */ }
    navigate('/onboarding');
  }

  return (
    <div className="wrap profil-page">
      <div>
        <div className="eyebrow">{t('profil.eyebrow')}</div>
        <h1>{t('profil.titre')}</h1>
        <p className="lede">{t('commun.bonjour', { prenom: user?.prenom ?? '' })}</p>
      </div>

      <section className="card" aria-labelledby="profil-langue">
        <h2 id="profil-langue">{t('profil.langue')}</h2>
        <div className="theme-choices" role="radiogroup" aria-labelledby="profil-langue">
          {langues.map((langue, index) => (
            <button
              key={langue.code}
              type="button"
              role="radio"
              lang={langue.code}
              aria-checked={langueActive === langue.code}
              tabIndex={langueActive === langue.code ? 0 : -1}
              className={langueActive === langue.code ? 'theme-choice theme-choice--active' : 'theme-choice'}
              onClick={() => { void changerLangue(langue.code); }}
              onKeyDown={event => parcourirLangues(event, index)}
            >
              {langue.label}
            </button>
          ))}
        </div>
      </section>

      <section className="card" aria-labelledby="profil-theme">
        <h2 id="profil-theme">{t('profil.theme')}</h2>
        <p className="hint" id="profil-theme-aide">{t('profil.theme_description')}</p>
        <fieldset className="theme-choices" aria-labelledby="profil-theme" aria-describedby="profil-theme-aide">
          {([
            { value: 'light', label: t('profil.theme_clair') },
            { value: 'dark', label: t('profil.theme_sombre') },
            { value: 'auto', label: t('profil.theme_auto') },
          ] as const).map(opt => (
            <label
              key={opt.value}
              className={themePref === opt.value ? 'theme-choice theme-choice--active' : 'theme-choice'}
            >
              <input
                type="radio"
                name="theme-preference"
                value={opt.value}
                checked={themePref === opt.value}
                onChange={() => setThemePref(opt.value)}
              />
              {opt.label}
            </label>
          ))}
        </fieldset>
      </section>

      <section className="card" aria-labelledby="profil-rappels">
        <h2 id="profil-rappels">{t('rappels.titre')}</h2>
        <p className="hint">{t('rappels.description')}</p>
        {NotificationService.necessiteInstallationIos()
          ? <p className="rappels-information">{t('rappels.installer_ios')}</p>
          : !notificationsDisponibles && <p className="rappels-information">{t('rappels.non_dispo')}</p>}
        {notificationsDisponibles && !Capacitor.isNativePlatform() && <p className="rappels-information">{t('rappels.limite_web')}</p>}
        {notificationsDisponibles && (
          <>
            <label className="switch-row">
              <input type="checkbox" checked={rappels.actifs} disabled={permissionEnCours} onChange={event => { void activerRappels(event.target.checked); }} />
              {t('rappels.activer')}
            </label>
            {rappels.actifs && <fieldset className="rappels-config" disabled={permissionEnCours}>
              <label htmlFor="rappels-frequence">{t('rappels.frequence')}</label>
              <select id="rappels-frequence" value={rappels.frequence} onChange={event => modifierRappels({ frequence: event.target.value as FrequenceRappel })}>
                <option value="hebdo">{t('rappels.hebdo')}</option>
                <option value="bihebdo">{t('rappels.bihebdo')}</option>
                <option value="mensuel">{t('rappels.mensuel')}</option>
              </select>
              <label htmlFor="rappels-jour">{t('rappels.jour')}</label>
              <select id="rappels-jour" value={rappels.jour} onChange={event => modifierRappels({ jour: Number(event.target.value) })}>
                {(['lundi', 'mardi', 'mercredi', 'jeudi', 'vendredi', 'samedi', 'dimanche'] as const).map((jour, index) => <option key={jour} value={(index + 1) % 7}>{t(`rappels.${jour}`)}</option>)}
              </select>
              {rappels.frequence === 'mensuel' && <p className="hint">{t('rappels.regle_mensuelle')}</p>}
              <label htmlFor="rappels-heure">{t('rappels.heure')}</label>
              <input type="time" id="rappels-heure" required value={rappels.heure} onChange={event => modifierRappels({ heure: event.target.value })} />
              <p className="hint">{t('rappels.heure_locale')}</p>
              <button type="button" className="btn ghost" disabled={statutPermission !== 'accordee' || etatRappels === 'attente'} onClick={() => { void testerRappel(); }}>{t('rappels.test')}</button>
            </fieldset>}
          </>
        )}
        {statutPermission === 'refusee' && <p className="rappels-information" role="status">{t('rappels.permission_refusee')}</p>}
        {etatRappels === 'ok' && rappels.actifs && <p className="hint" role="status">{t('rappels.planifies')}</p>}
        {etatRappels === 'erreur' && <p className="rappels-information" role="alert">{t('rappels.erreur')}{' '}<button type="button" className="btn ghost sm" onClick={() => setRevisionRappels(valeur => valeur + 1)}>{t('commun.reessayer')}</button></p>}
        {stockageRappelsIndisponible && <p className="hint" role="status">{t('rappels.stockage_indisponible')}</p>}
        {testRappel !== 'repos' && <p className="hint" role="status">{t(testRappel === 'ok' ? 'rappels.test_planifie' : 'rappels.erreur')}</p>}
      </section>

      <section className="card" aria-labelledby="profil-progression">
        <h2 id="profil-progression">{t('progression.titre')}</h2>
        {chargement ? <p className="hint progression-attente" role="status">{t('commun.chargement')}</p> : moi ? (
          <div className="profil-progression">
            <JaugeChristos {...moi} />
            <BadgeStreak streakActuel={moi.streakActuel} streakRecord={moi.streakRecord} />
            <p className="hint">{t('progression.streak_actuel', { count: moi.streakActuel })}{' · '}{t('progression.streak_record', { count: moi.streakRecord })}</p>
            {moi.fruitsCompletes < moi.fruitsTotal && <p className="hint info"><Trans t={t} i18nKey="progression.fruits_restants" count={Math.max(0, moi.fruitsTotal - moi.fruitsCompletes)} components={{ strong: <strong /> }} /></p>}
          </div>
        ) : <p className="hint">{t('progression.indisponible')}{' '}<button type="button" className="btn ghost sm" onClick={() => { void rafraichir(); }}>{t('commun.reessayer')}</button></p>}
      </section>

      <section className="card" aria-labelledby="profil-compte">
        <h2 id="profil-compte">{t('profil.compte')}</h2>
        <p className="profil-identite">
          <strong>{user?.prenom} {user?.nom}</strong><br />
          <span>{user?.email}</span>
        </p>
        <div className="controls">
          <button type="button" className="btn" onClick={handleDeconnexion}>{t('commun.deconnexion')}</button>
          <Link to="/supprimer-compte" className="btn ghost">{t('commun.supprimer_compte')}</Link>
        </div>
      </section>

      <section className="card" aria-labelledby="profil-apropos">
        <h2 id="profil-apropos">{t('profil.a_propos')}</h2>
        <p className="hint">{t('profil.version', { version })}</p>
        <div className="profil-liens">
          <Link to="/politique-confidentialite">{t('footer.politique')}</Link>
          <Link to="/conditions-utilisation">{t('footer.cgu')}</Link>
        </div>
      </section>
      <section className="card" aria-labelledby="profil-intro">
        <h2 id="profil-intro">{t('onboarding.introduction')}</h2>
        <button type="button" className="btn ghost" onClick={revoirIntroduction}>
          {t('onboarding.revoir_intro')}
        </button>
      </section>
    </div>
  );
}
