CREATE TABLE IF NOT EXISTS courses
(
  id serial PRIMARY KEY,
  symbol VARCHAR (255) NOT NULL,
  price REAL NOT NULL,
  time_stamp BIGINT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT current_timestamp
);

CREATE TABLE public.symbol (
  id INTEGER PRIMARY KEY NOT NULL DEFAULT nextval('symbol_id_seq'::regclass),
  name CHARACTER VARYING(100),
  scode CHARACTER VARYING(50),
  updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  price NUMERIC(9,6)
);

CREATE FUNCTION check_symbol_update() RETURNS trigger AS '
BEGIN
  UPDATE symbol SET updated_at = CURRENT_TIMESTAMP WHERE id=OLD.id;
  RETURN OLD;
END;
' LANGUAGE plpgsql;

CREATE TRIGGER check_update
AFTER UPDATE ON symbol
FOR EACH ROW
WHEN (OLD.price IS DISTINCT FROM NEW.price)
EXECUTE PROCEDURE check_symbol_update();





