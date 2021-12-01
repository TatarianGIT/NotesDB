/* @@@ FUNKCJA DODAWANIE ELEMENTU TEKSTOWEGO* @@@*/ 
CREATE OR REPLACE FUNCTION addTextElements(userID int, type VARCHAR(7),title VARCHAR(128), text TEXT, twitterName VARCHAR(40)) 
RETURNS VARCHAR  AS
$$
DECLARE
	finalMessage varchar;
BEGIN
IF type = 'note'
	THEN insert into "textElement" (userID, type, title, text, likeCount, commentNumber ) VALUES ( userID, 'note', title, text, NULL, NULL );
	finalMessage = 'successfully added';
	return finalMessage;
END IF;
IF type = 'article'
	THEN insert into "textElement" (userID, type, title, text) VALUES ( userID, 'article', title, text);
	finalMessage = 'successfully added';
	return finalMessage;
END IF;
IF type = 'twitter'
	THEN 	IF length(text) > 280
				THEN finalMessage = 'tweet is too long';
					return finalMessage;
			ELSE insert into "textElement" (userID, type, twitterName ,title, text) VALUES ( userID, 'twitter',twitterName, title, text);
				finalMessage = 'successfully added';
				return finalMessage;
			END IF;
END IF;
END
$$
  LANGUAGE 'plpgsql';