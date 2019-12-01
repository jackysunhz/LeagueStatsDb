
drop database if exists lol;
create database lol;

drop database if exists Champs;
create table Champs(
id int,
name varchar(30),
PRIMARY KEY (id)

);



drop database if exists Matches;
create table Matches(
id int,
gameid varchar(255),
platformid varchar(6),
queueid int,
seasonid int,
duration int,
creation varchar(255),
version varchar(255),
PRIMARY KEY (id)
);



drop database if exists Participants;
create table Participants(
id int, -- player id
matchid int, 
player int, 
championid int,
ss1 int, 
ss2 int, 
role varchar(255),
position varchar(255),
PRIMARY KEY (id),
FOREIGN KEY (championid) REFERENCES Champs(id),
FOREIGN KEY (matchid) REFERENCES Matches(id)
);




drop database if exists stats;
create table stats(
id int, 
win int,
item1 int, 
item2 int, 
item3 int, 
item4 int,
item5 int, 
item6 int, 
trinket int, 
kills int, 
deaths int, 
assists int, 
largestkillingspree int, 
largestmultikill int,
killingsprees int, 
longesttimespentliving int, 
doublekills int, 
triplekills int, 
quadrakills int,
pentakills int,
legendarykills int,
totdmgdealt int,
magicdmgdealt int, 
physicaldmgdealt int, 
truedmgdealt int, 
largestcrit int, 
totdmgtochamp int, 
magicdmgtochamp int, 
physdmgtochamp int, 
truedmgtochamp int, 
totheal int, 
totunitshealed int, 
dmgselfmit int, 
dmgtoobj int, 
dmgtoturrets int, 
visionscore int, 
timecc int, 
totdmgtaken int, 
magicdmgtaken int, 
physdmgtaken int, 
truedmgtaken int, 
goldearned int,
goldspent int, 
turretkills int,
inhibkills int, 
totminionskilled int, 
neutralminionskilled int, 
ownjunglekills int, 
enemyjunglekills int,
totcctimedealt int,
champlvl int, 
pinksbought int, 
wardsbought int, 
wardsplaced int, 
wardskilled int, 
firstblood int,
PRIMARY KEY (id),
FOREIGN KEY (id) REFERENCES Participants(id)
);




drop database if exists teamMatch;
create table teamMatch(
matchid int, 
teamid int, -- red team or blue team
championid int,
banturn int,
PRIMARY KEY (matchid),
FOREIGN KEY (matchid) REFERENCES Matches(id),
FOREIGN KEY (championid) REFERENCES Champs(id)
);





drop database if exists teamStats;
create table teamStats(
matchid int, 
teamid int, 
firstblood int, 
firsttower int, 
firstinhib int, 
firstbaron int, 
firstdragon int, 
firstharry int, 
towerkills int, 
inhibkills int, 
baronkills int, 
dragonkills int, 
harrykills int,
PRIMARY KEY (matchid),
FOREIGN KEY (matchid) REFERENCES Matches(id)
);



LOAD DATA INFILE ''
INTO TABLE Champs
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA INFILE ''
INTO TABLE Matches
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA INFILE ''
INTO TABLE Participants
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA INFILE ''
INTO TABLE stats
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';


LOAD DATA INFILE ''
INTO TABLE stats
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA INFILE ''
INTO TABLE teamMatch
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA INFILE ''
INTO TABLE teamStats
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';






