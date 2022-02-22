-- Revert ocolis:expedition from pg

BEGIN;

-- create back the expedition_time column in package
ALTER TABLE package
  ADD COLUMN expedition_time TIMESTAMPTZ;

-- fill back the expedition_time with starting_time values
UPDATE package SET expedition_time=(
  SELECT starting_time FROM expedition WHERE id=package.expedition_id
);

-- delete the expedition_id column in package
ALTER TABLE package
  DROP COLUMN expedition_id;

-- finally drop the expedition table
DROP TABLE expedition;

COMMIT;
