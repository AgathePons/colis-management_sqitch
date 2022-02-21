-- Deploy ocolis:FK_in_package_and_move_data to pg

BEGIN;

ALTER TABLE package 
  ADD COLUMN shipping_id int REFERENCES shipping(id);

INSERT INTO shipping (starting_time)
SELECT expedition_time
FROM package
WHERE expedition_time IS NOT NULL;

COMMIT;
