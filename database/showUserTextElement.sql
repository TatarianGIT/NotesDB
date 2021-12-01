/* @@@ WYŚWIETLANIE WSZYSTKICH ELEMENTÓW UZYTKOWNIKA* @@@*/

drop function showUserTextElement;

CREATE OR REPLACE FUNCTION showUserTextElement(ID integer) 
RETURNS TABLE (
	username varchar,
	type integer,
	twitterName varchar,
	textElementID integer,
	title varchar,
	text text
)
AS
$$
BEGIN
	RETURN QUERY
	select u.username, t.type, t.twitterName, t.textElementID, t.title, t.text from "user" as u
	INNER JOIN "textElement" as t
	ON u.userID = t.userID
	WHERE u.userID = ID
	ORDER BY t.type ASC;
END
$$
  LANGUAGE 'plpgsql';