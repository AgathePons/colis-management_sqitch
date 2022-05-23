-- Deploy ocolis:expedition to pg

BEGIN;

-- add new table
CREATE TABLE expedition (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    driver_name TEXT NOT NULL,
    vehicle_plate TEXT NOT NULL,
    starting_time TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    ending_time TIMESTAMPTZ
);

-- set relation with package table
ALTER TABLE package
    ADD COLUMN expedition_id INT REFERENCES expedition(id);

-- seed expedition table from existing package infos
-- to feed this seed, we use fictive datas for mandatory fields
-- we keep the only data we have in a unique way (expedition_time) to avoid multiple lines with no valuable info  and duplicated data
INSERT INTO expedition (driver_name, vehicle_plate, starting_time)
  SELECT DISTINCT 'inconnu', 'inconnu', expedition_time FROM package
  WHERE expedition_time IS NOT NULL;

-- use the expedition_time / starting_time to link package to expedition by seeding expedition_id column in package
UPDATE package SET expedition_id=(
  SELECT id FROM expedition WHERE starting_time=package.expedition_time
);

-- drop the duplicated data, now we do not need it anymore
ALTER TABLE package DROP COLUMN expedition_time;

COMMIT;