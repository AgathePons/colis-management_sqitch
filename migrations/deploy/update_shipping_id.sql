-- Deploy ocolis:update_shipping_id to pg

UPDATE package
  SET shipping_id = shipping.id
  FROM shipping
  WHERE shipping.starting_time = expedition_time;

-- ALTER TABLE package
  -- DROP COLUMN expedition_time;