-- Revert ocolis:init from pg

BEGIN;

DROP TABLE IF EXISTS place, package;

COMMIT;
