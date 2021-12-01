/* @@@ DODAWANIE I ODEJMOWANIE LIKE* @@@*/
CREATE OR REPLACE FUNCTION addLike(elementID integer) RETURNS varchar AS
$$
DECLARE
	finalMessage varchar;
BEGIN
	IF (select type from "textElement" WHERE textElementID = elementID) = 'note'
		THEN
			finalMessage ='cannot add like to note';
			RETURN finalMessage;
	ELSE 
		update "textElement" set likeCount = likeCount + 1 where textElementID = elementID;
		finalMessage ='like added';
		RETURN finalMessage;
	END IF;
END
$$
  LANGUAGE 'plpgsql';