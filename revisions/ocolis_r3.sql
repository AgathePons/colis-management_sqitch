BEGIN;

-- première méthode, mais pas terrible pour retrouver plus tard la modif
-- ALTER TABLE package
--  ADD UNIQUE (serial_number);

-- deuxième méthode, on nomme la modif, plus facile à retrouver plus tard
ALTER TABLE package
  ADD CONSTRAINT serial_number_unique
  UNIQUE (serial_number);

COMMIT;