import { useEffect, useState } from 'react';

export function StatusReseau() {
  const [enLigne, setEnLigne] = useState(navigator.onLine);

  useEffect(() => {
    const actualiser = () => setEnLigne(navigator.onLine);
    window.addEventListener('online', actualiser);
    window.addEventListener('offline', actualiser);
    actualiser();
    return () => {
      window.removeEventListener('online', actualiser);
      window.removeEventListener('offline', actualiser);
    };
  }, []);

  if (enLigne) return null;

  return (
    <div role="status" style={{
      position: 'sticky', top: 0, zIndex: 1000,
      backgroundColor: '#d45219', color: '#fff',
      padding: '12px 16px', textAlign: 'center',
    }}>
      ⚠️ Vous êtes hors ligne. Une connexion Internet est nécessaire pour enregistrer vos réponses.
    </div>
  );
}
