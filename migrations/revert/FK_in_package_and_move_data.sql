-- Revert ocolis:FK_in_package_and_move_data from pg

BEGIN;

INSERT INTO package (expedition_time)
SELECT starting_time
FROM shipping;

ALTER TABLE package
  DROP COLUMN shipping_id;

TRUNCATE shipping RESTART IDENTITY;

COMMIT;
