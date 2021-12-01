/* @@@ DODAWANIE KOMENTARZA* @@@*/
CREATE OR REPLACE FUNCTION addComments(elementID integer, userID integer, commentText VARCHAR(280)) RETURNS varchar AS
$$
DECLARE
	finalMessage varchar;
BEGIN
	IF (select type from "textElement" WHERE textElementID = elementID) = 'note'
		THEN
			finalMessage = 'cannot add comment to note!';
			RETURN finalMessage;
	ELSE 
		insert into "elementComment" (textElementID, userID, text) VALUES (elementID, userID, commentText);
		update "textElement" set commentNumber = commentNumber + 1 where textElementID = elementID;
		finalMessage = 'successfully added';
    	RETURN finalMessage;
	END IF;
END
$$
  LANGUAGE 'plpgsql';