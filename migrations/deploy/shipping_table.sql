-- Deploy ocolis:shipping_table to pg

BEGIN;

CREATE TABLE shipping (
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    driver_name TEXT NOT NULL DEFAULT 'empty',
    vehicle_plate text NOT NULL DEFAULT 'empty',
    starting_time TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    ending_time TIMESTAMPTZ
);

COMMIT;
