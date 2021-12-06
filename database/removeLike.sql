CREATE OR REPLACE FUNCTION removeLikes(elementID integer) RETURNS varchar AS
$$
DECLARE
	finalMessage varchar;
BEGIN
	IF (select type from "textElement" WHERE textElementID = elementID) = 3
		THEN
			finalMessage ='cannot remove like from note';
			RETURN finalMessage;
	ELSE 
		IF	(SELECT likeCount FROM "textElement" WHERE textElementID = elementID) = 0
			THEN finalMessage ='ERROR - like count cannot get lower than 0!';
			RETURN finalMessage;
		ELSE
		update "textElement" set likeCount = likeCount - 1 where textElementID = elementID;
		finalMessage ='like removed';
		RETURN finalMessage;
		END IF;
	END IF;
END
$$
  LANGUAGE 'plpgsql';