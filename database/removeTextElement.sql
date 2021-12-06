/* @@@ FUNKCJA USUWANIE ELEMENTU TEKSTOWEGO* @@@*/ 
drop function removeTextElement;

CREATE OR REPLACE FUNCTION removeTextElement(ID integer) RETURNS varchar AS
$$
DECLARE
	finalMessage varchar;
BEGIN
	update "textElement" 
		set isDeleted = true, text = NULL, likeCount = NULL,
			commentNumber = NULL, deletionDate = ((now() + interval'1 hour')) 
		where textelementid = ID;
	
	delete from "elementComment" where textelementid = ID;
	
	UPDATE "textElement" 
		SET commentNumber = (
			SELECT COUNT(commentID) 
			FROM "elementComment"
			INNER JOIN "textElement" ON "textElement".textElementID = "elementComment".textElementID
			WHERE "textElement".textElementID = elementID
		)
	WHERE textElementID = elementID;

	finalMessage = 'successfully removed';
	RETURN finalMessage;
END
$$
  LANGUAGE 'plpgsql';