CREATE OR REPLACE FUNCTION addUser(username VARCHAR(30), password VARCHAR(36), email VARCHAR(30) ) RETURNS VOID AS
$$
BEGIN
    INSERT INTO "user" (username, password, email) VALUES (username, password, email);
END
$$
  LANGUAGE 'plpgsql';