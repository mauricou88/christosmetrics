-- Dates sans fuseau stockées et interprétées exclusivement en UTC.
ALTER TABLE users ADD COLUMN derniere_activite_at TIMESTAMP;
ALTER TABLE users ADD COLUMN streak_actuel INTEGER NOT NULL DEFAULT 0;
ALTER TABLE users ADD COLUMN streak_record INTEGER NOT NULL DEFAULT 0;
