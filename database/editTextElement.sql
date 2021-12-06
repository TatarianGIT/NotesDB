/* @@@ FUNKCJA EDYTOWANIE ELEMENTU TEKSTOWEGO* @@@*/
DROP FUNCTION editTextElement;

CREATE OR REPLACE FUNCTION editTextElement(ID integer, editedText text) RETURNS varchar AS
$$
DECLARE
	finalMessage varchar;
BEGIN
IF ((SELECT type FROM "textElement" WHERE textElementID = ID) = 1) AND (length(editedText) > 280)
	THEN finalMessage = 'ERROR - tweet cannot be longer that 280 characters!';
	return finalMessage;
ELSE
    update "textElement" SET text = editedText WHERE textElementID = ID;
	finalMessage = 'successfully edited';
    RETURN finalMessage;
END IF;
END
$$
  LANGUAGE 'plpgsql';