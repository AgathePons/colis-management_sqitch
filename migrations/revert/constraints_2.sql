-- Revert ocolis:constraints_2 from pg

BEGIN;

DROP DOMAIN numberplate;
DROP DOMAIN postalcode;

COMMIT;
