BEGIN;

ALTER TABLE package
  ADD COLUMN request_time timestamptz GENERATED ALWAYS DEFAULT CURRENT_TIMESTAMP,
  ADD COLUMN expedition_time timestamptz,
  ADD COLUMN delivered_time timestamptz;

COMMIT;