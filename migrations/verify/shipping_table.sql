-- Verify ocolis:shipping_table on pg

BEGIN;

SELECT * FROM shipping WHERE false;

ROLLBACK;
