BEGIN;

ALTER TABLE package
  ADD COLUMN request_time timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP, -- on peut aussi mettre NOW() c'est pareil
  ADD COLUMN expedition_time timestamptz,
  ADD COLUMN delivered_time timestamptz;

COMMIT;