CREATE OR REPLACE FUNCTION addTextElement(userID int, type INTEGER,title VARCHAR(128), text TEXT, twitterName VARCHAR(40))
RETURNS VARCHAR
AS $$
DECLARE finalMessage varchar;
BEGIN
	IF type = 3
		THEN insert into "textElement" (userID, type, title, text, likeCount, commentNumber ) 
			VALUES ( userID, 3, title, text, NULL, NULL ); finalMessage = 'successfully added'; 
			return finalMessage;
	END IF;
	
	IF type = 2
		THEN insert into "textElement" (userID, type, title, text)
			VALUES ( userID, 2, title, text); finalMessage = 'successfully added';
			return finalMessage;
	END IF;
	
	IF type = 1 
		THEN IF length(text) > 280
				THEN finalMessage = 'ERROR - tweet text is too long';
				return finalMessage;
			ELSE
				insert into "textElement" (userID, type, twitterName ,title, text)
				VALUES ( userID, 1,twitterName, title, text); finalMessage = 'successfully added';
				return finalMessage;
		END IF;
	END IF;
	
	IF (type > 3) OR (type < 0)
		THEN finalMessage = 'ERROR - type is wrong (should be in range 1-3)';
		return finalMessage;
	END IF;
END $$
LANGUAGE 'plpgsql';
