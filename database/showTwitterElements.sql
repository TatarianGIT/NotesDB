/* @@@ WYŚWIETLENIE WSZYSTKICH TWEETÓW* @@@*/
drop function showTwitterElements;

CREATE OR REPLACE FUNCTION showTwitterElements()
RETURNS TABLE (
	username varchar,
	twitterName varchar,
	title varchar,
	text text,
	likeCount int,
	commentNumber int,
	creationDate timestamp
)
AS
$$
BEGIN
	RETURN QUERY
	select u.username, t.twitterName, t.title, t.text, t.likeCount, t.commentNumber, t.creationDate from "user" as u
	INNER JOIN "textElement" as t
	ON u.userID = t.userID
	WHERE t.type = 1 AND t.isDeleted = false 
	ORDER BY t.creationDate DESC;
END
$$
  LANGUAGE 'plpgsql';