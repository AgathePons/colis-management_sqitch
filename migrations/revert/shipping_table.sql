-- Revert ocolis:shipping_table from pg

BEGIN;

DROP TABLE shipping;

COMMIT;
