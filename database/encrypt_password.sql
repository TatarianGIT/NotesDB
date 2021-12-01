/* @@@ funkcja hash* @@@*/ 

CREATE OR REPLACE FUNCTION encrypt_password() RETURNS trigger AS $$
BEGIN
IF tg_op = 'INSERT' OR tg_op = 'UPDATE' THEN
NEW.password = PGP_SYM_ENCRYPT(NEW.password, 'klucz_kajzerka');
RETURN NEW;
END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER encrypt_password_trigger
BEFORE INSERT OR UPDATE ON "user"
FOR EACH ROW EXECUTE PROCEDURE encrypt_password();