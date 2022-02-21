-- Revert ocolis:transition from pg

BEGIN;

DROP TABLE package, place;

COMMIT;
