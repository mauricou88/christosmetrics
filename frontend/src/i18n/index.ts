import i18n from 'i18next';
import LanguageDetector from 'i18next-browser-languagedetector';
import { initReactI18next } from 'react-i18next';
import fr from './locales/fr.json';
import en from './locales/en.json';
import es from './locales/es.json';
import pt from './locales/pt.json';

void i18n
  .use(LanguageDetector)
  .use(initReactI18next)
  .init({
    supportedLngs: ['fr', 'en', 'es', 'pt'],
    fallbackLng: 'fr',
    load: 'languageOnly',
    ns: ['translation'],
    defaultNS: 'translation',
    resources: {
      fr: { translation: fr },
      en: { translation: en },
      es: { translation: es },
      pt: { translation: pt },
    },
    detection: {
      order: ['localStorage', 'navigator'],
      lookupLocalStorage: 'langue-preference',
      caches: ['localStorage'],
    },
    interpolation: { escapeValue: false },
    debug: false,
    react: { useSuspense: false },
  });

export default i18n;
