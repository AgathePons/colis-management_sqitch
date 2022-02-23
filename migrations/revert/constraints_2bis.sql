-- Revert ocolis:constraints_2bis from pg

BEGIN;

-- on revert en type texte car on peut pas vraiment revert de text vers int
ALTER TABLE place
  ALTER COLUMN postal_code TYPE TEXT;

DROP DOMAIN code_postal;

ALTER TABLE expedition
  ALTER COLUMN vehicle_plate TYPE TEXT;

DROP DOMAIN plate;

COMMIT;
