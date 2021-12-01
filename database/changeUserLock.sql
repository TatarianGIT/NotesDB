/* @@@ ZMIANA STATUSU BLOKADY UŻYTKOWNIKA* @@@*/

CREATE OR REPLACE FUNCTION changeUserLock(ID integer) RETURNS varchar AS
$$
DECLARE
	finalMessage varchar;
BEGIN
	IF (select isLocked from "user" where userID = ID ) = true
		THEN update "user" set isLocked = false where userID = ID;
		finalMessage = 'user status is no longer locked';
		RETURN finalMessage;
	ELSE 
		update "user" set isLocked = true where userID = ID;
		finalMessage = 'user status set to locked';
		RETURN finalMessage;
	END IF;
END
$$
  LANGUAGE 'plpgsql';