-- Revert ocolis:update_shipping_id from pg

-- ALTER TABLE package 
  -- ADD COLUMN expedition_time TIMESTAMPTZ;

  UPDATE package
  SET shipping_id = null;