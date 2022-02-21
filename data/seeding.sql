BEGIN;

-- pour éviter lorsqu'on vide les tables d'avoir des ids qui ne commencent pas à 1, on peut faire un reset de la numérotation en indiquant après le truncate RESTART IDENTITY
TRUNCATE package, place RESTART IDENTITY;

INSERT INTO place (reference, name, address, additional, postal_code, city) VALUES
('123456', 'Toto', '102 avenue des Champs Elysées', '', '75008', 'Paris'),
('123457', 'Tati', '23 rue du chameau', '', '17494', 'Verdugon sur Gartance');

INSERT INTO package (serial_number, content_description, sender_id, recipient_id, weight, height, worth, width, depth) VALUES
('12345', 'table de torture', 1, 2, 15.325, 2000, 250, 1, 1),
('12346', 'costume en cuir', 1, 2, 1.357, 450, 77, 1, 1),
('12347', 'Lot fouet/martinet à clous en promo', 1, 2, 0.827, 150, 38, 1, 1);

COMMIT;