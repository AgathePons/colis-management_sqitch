-- Verify ocolis:init on pg

BEGIN;

-- on utilise WHERE false pour éviter de rapatrier des enregistrements
-- on se contente de vérifier la structure, et non le contenu
SELECT * FROM place WHERE false;
SELECT * FROM package WHERE false;

ROLLBACK;
