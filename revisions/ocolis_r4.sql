BEGIN;

ALTER TABLE package
  RENAME COLUMN volume TO height;

-- on set une valeur par défaut pour les anciennes entrées
ALTER TABLE package
  ADD COLUMN width int NOT NULL DEFAULT 1,
  ADD COLUMN depth int NOT NULL DEFAULT 1;

-- on retire le default une fois que les colonnes sont crées et remplies pour obliger le user à entrée une valeur
ALTER TABLE package
  ALTER COLUMN width DROP DEFAULT,
  ALTER COLUMN depth DROP DEFAULT;

COMMIT;