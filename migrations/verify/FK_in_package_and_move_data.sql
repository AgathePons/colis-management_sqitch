-- Verify ocolis:FK_in_package_and_move_data on pg

BEGIN;

SELECT * FROM shipping WHERE false;
SELECT * FROM package WHERE false;

ROLLBACK;
