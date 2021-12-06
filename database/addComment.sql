/* @@@ DODAWANIE KOMENTARZA* @@@*/
CREATE OR REPLACE FUNCTION addComment(elementID integer, userID integer, commentText VARCHAR(280)) RETURNS varchar AS
$$
DECLARE
	finalMessage varchar;
BEGIN
	IF (select type from "textElement" WHERE textElementID = elementID) = 3
		THEN
			finalMessage = 'cannot add comment to note!';
			RETURN finalMessage;
	ELSE 
		insert into "elementComment" (textElementID, userID, text) VALUES (elementID, userID, commentText);
		
		UPDATE "textElement" 
		SET commentNumber = (
			SELECT COUNT(commentID) 
			FROM "elementComment"
			INNER JOIN "textElement" ON "textElement".textElementID = "elementComment".textElementID
			WHERE "textElement".textElementID = elementID
		)
		WHERE textElementID = elementID;
		
		finalMessage = 'successfully added';
    	RETURN finalMessage;
	END IF;
END
$$
  LANGUAGE 'plpgsql';