-- Deploy ocolis:serial_text to pg

BEGIN;

ALTER TABLE package
    ALTER COLUMN serial_number TYPE TEXT;

COMMIT;
