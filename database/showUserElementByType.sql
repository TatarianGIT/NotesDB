/* @@@ WYŚWIETLANIE DANEGO TYPU ELEMENTÓW * @@@*/
drop function showUserElementByType;


CREATE OR REPLACE FUNCTION showUserElementByType(ID integer, textType integer) 
RETURNS TABLE (
	username varchar,
	twitterName varchar,
	textElementID int,
	title varchar,
	text text
)
AS
$$
BEGIN
	RETURN QUERY
	select u.username, t.twitterName, t.textElementID, t.title, t.text from "user" as u
	INNER JOIN "textElement" as t
	ON u.userID = t.userID
	WHERE u.userID = ID and type = textType
	ORDER BY t.textElementID ASC;
END
$$
  LANGUAGE 'plpgsql';