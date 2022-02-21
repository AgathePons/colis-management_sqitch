-- Revert ocolis:serial_text from pg

BEGIN;

ALTER TABLE package
  ALTER COLUMN serial_number TYPE INT
  USING serial_number::integer;

COMMIT;
