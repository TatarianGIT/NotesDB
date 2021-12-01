/* @@@ FUNKCJA USUWANIE ELEMENTU TEKSTOWEGO* @@@*/ 
drop function removeTextElement;

CREATE OR REPLACE FUNCTION removeTextElement(ID integer) RETURNS varchar AS
$$
DECLARE
	finalMessage varchar;
BEGIN
	update "textElement" 
	set isDeleted = true, text = NULL, likeCount = NULL, commentNumber = NULL, deletionDate = ((now() + interval'1 hour')) 
	where textelementid = ID;
	
	delete from "elementComment" where textelementid = ID;
	
	finalMessage = 'successfully removed';
	RETURN finalMessage;
END
$$
  LANGUAGE 'plpgsql';