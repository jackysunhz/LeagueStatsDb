drop table if exists megatable;
create table megatable(
Id varchar(255),
groupId	varchar(255),
matchId	varchar(255),
assists	varchar(255),
boosts	varchar(255),
damageDealt	varchar(255),
DBNOs	varchar(255),
headshotKills	varchar(255),
heals	varchar(255),
killPlace	varchar(255),
killPoints	varchar(255),
kills	varchar(255),
killStreaks	varchar(255),
longestKill	varchar(255),
matchDuration	varchar(255),
matchType	varchar(255),
maxPlace	varchar(255),
numGroups	varchar(255),
rankPoints	varchar(255),
revives	varchar(255),
rideDistance	varchar(255),
roadKills	varchar(255),
swimDistance	varchar(255),
teamKills	varchar(255),
vehicleDestroys	varchar(255),
walkDistance	varchar(255),
weaponsAcquired	varchar(255),
winPoints varchar(255)
);

LOAD DATA INFILE 'C:/Users/jacky/OneDrive/Desktop/test_V2.csv'
INTO TABLE megatable
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';