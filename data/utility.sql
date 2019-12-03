-- create the stored procedure to find KDA of specified champion
DROP PROCEDURE IF EXISTS check_KDA;
DELIMITER //
CREATE PROCEDURE check_KDA(IN name CHAR(20))
BEGIN
  SELECT champs.name, FORMAT(AVG((kills + assists)/deaths),2) AS Avg_KDA
FROM (champs INNER JOIN participants ON champs.id = participants.championid)
	INNER JOIN stats ON participants.id = stats.id
WHERE champs.name = name;
END //
DELIMITER ;

-- create stored procedure to find win rate
DROP PROCEDURE IF EXISTS check_winrate;
DELIMITER //
CREATE PROCEDURE check_winrate(IN name CHAR(20))
BEGIN
  SELECT champs.name, FORMAT(SUM(stats.win) / COUNT(*) * 100,2) AS rate
FROM (champs INNER JOIN participants ON champs.id = participants.championid)
	INNER JOIN stats ON participants.id = stats.id
WHERE champs.name = name;
END //
DELIMITER ;

-- create a view to query the most popular champions among players
DROP VIEW IF EXISTS view_popular;
CREATE VIEW view_popular AS
SELECT champs.name, FORMAT(COUNT(*)/(SELECT COUNT(*) FROM stats) * 100,2) as userate, 
	FORMAT(SUM(stats.win) / COUNT(*) * 100,2) AS winrate
FROM (champs INNER JOIN participants ON champs.id = participants.championid)
	INNER JOIN stats ON participants.id = stats.id
GROUP BY championid
ORDER BY COUNT(*) DESC
LIMIT 10;

-- create a view to query the champions with highest winrates
DROP VIEW IF EXISTS view_meta;
CREATE VIEW view_meta AS
SELECT champs.name, FORMAT(SUM(stats.win) / COUNT(*) * 100, 2) AS rate
FROM (champs INNER JOIN participants ON champs.id = participants.championid)
	INNER JOIN stats ON participants.id = stats.id
GROUP BY championid
ORDER BY rate DESC
LIMIT 10;
