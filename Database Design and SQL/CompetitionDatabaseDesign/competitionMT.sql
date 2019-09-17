-- ***	Competitions Database		*** --
-- ***	Created by: Miguel Tapia	*** --
-- *** 	Using: MS SQL Server V.17 	*** --
-- Creating database for different competitions
CREATE DATABASE CompetitionsMT;

-- Creating table `TeamInformation` to store all information on different teams. This includes a unique primary key as teamId to access the information from Player Table and its foreign key.
CREATE TABLE TeamInformation
(
	teamId int PRIMARY KEY NOT NULL IDENTITY(1,1) -- Identity for auto increment
	,
	teamName varchar(50) NOT NULL
	,
	sport varchar(50) NOT NULL
	,
	signUpDay date -- Date team was established
	,
	playerCount int NOT NULL
	,
	notes varchar(1024) --Added for a simple notes section for any additionally information
	,
	FOREIGN KEY (teamId) REFERENCES PlayerInformation (teamId)
	-- Reference to PlayerInformation's primary key (teamid)
);

-- Creating table `PlayerInformation` to store all information on different players. This includes a unique primary key for easier access. Things will change
CREATE TABLE PlayerInformation
(
	teamId int PRIMARY KEY NOT NULL IDENTITY(1,1) -- Team Id as primary key in order to identify a player with his team
	,
	firstName varchar(50) NOT NULL
	,
	lastName varchar(50) NOT NULL
	,
	email varchar(255) NOT NULL
	,
	phoneNumber varchar(10) NOT NULL
	,
	homeAddress varchar(255) NOT NULL
	,
	highestScore int -- General highest score in order to account for multiple game types
	,
	favoriteSport varchar(50) -- Favorite sport could be different from current sport
	,
	currentSport varchar(50) 
	,
	FOREIGN KEY (teamId) REFERENCES TeamInformation (teamId)
	-- teamId acts also as foreign key to connect with TeamInformation primary key (teamid)
);

-- *	NOTE: ALl ALTERATIONS AHEAD	* --
ALTER TABLE TeamInformation -- Actual addition of foreign key. I believe Microsoft SQL Server allowed me to run the command at first without the primary key or table for Player information being created
ADD FOREIGN KEY (teamId) REFERENCES PlayerInformation (teamId)

ALTER TABLE PlayerInformation -- Changed to not null. I want to have this information, but I accidentality had them allowing nulls
ALTER COLUMN currentSport varchar(50) not null

ALTER TABLE PlayerInformation -- Changed to not null. I want to have this information, but I accidentality had them allowing nulls
ALTER COLUMN highestScore int not null

ALTER TABLE PlayerInformation -- Changed to not null. I want to have this information, but I accidentality had them allowing nulls
ALTER COLUMN favoriteSport int not null

ALTER TABLE TeamInformation -- Removed foreign key in order to place it correctly. I believed it was wrong.
DROP CONSTRAINT FK__TeamInfor__teamI__267ABA7A;

ALTER TABLE PlayerInformation -- Removed foreign key in order to place it correctly. I believed it was wrong.
DROP CONSTRAINT PK__PlayerIn__5ED7536A75D85FA3;

ALTER TABLE PlayerInformation -- Added player number in order to have it as the primary key instead of team id. It makes it easier to access each individual player even those that possibly have no team.
ADD playerNumber int PRIMARY KEY NOT NULL;

-- ALTER TABLE TeamInformation -- SIMPLE TESTS. COULD NOT GET FORIGN KEYS TO WORK; EVENTUALLY, I FIGURED IT OUT. * SEE BOTTOM QUERIES
-- ADD CONSTRAINT FOREIGN KEY
-- (teamId) REFERENCES PlayerInformation
-- (teamId)

ALTER TABLE PlayerInformation -- Thought it would be good to include the players date of birth
ADD playerBirth DATE NOT NULL;


-- *	Creating Table `EventMaster` to simulate information about different type of events	* --
CREATE TABLE EventMaster
(
	eventId int PRIMARY KEY NOT NULL IDENTITY(1,1) -- Unique primary key id with auto increment to be able to access each individual event
	,
	typeEvent varchar(50) NOT NULL
	,
	winnerId int -- Winnerid is allowed null, since there might not be a winner immediately
	,
	dateEvent DATE NOT NULL
	,
	FOREIGN KEY (winnerId) REFERENCES PlayerInformation (FK_teamId)
	-- The foreign key points to PlayerInformation. I believe this command was an error again, but SQL server let me run it. The foreign keys are all fixed at the bottom queries.
);


-- CREATE TABLE EventMaster
-- (
-- 	eventId int PRIMARY KEY NOT NULL IDENTITY(1,1)
-- 	,
-- 	typeEvent varchar(50) NOT NULL
-- 	,
-- 	winnerId int 
-- 	,
-- 	dateEvent DATE NOT NULL
-- );

-- *	FINAL ALTER STATEMENTS WHICH ADDRESSES FOREIGN KEY PROBLEMS	* --
ALTER TABLE EventMaster
ADD CONSTRAINT FK_winnerId FOREIGN KEY (winnerId) -- The winnerId could be the teamid in the TeamInformation table in order to know more about the winner.
    REFERENCES TeamInformation(teamId);

ALTER TABLE TeamInformation	-- EventPaticipating column added in order to account for current events for each registered team. 
ADD eventParticipating int NOT NULL;

ALTER TABLE TeamInformation -- eventPaticipating also allows access to eventmaster in order to access that information
ADD CONSTRAINT FK_eventId FOREIGN KEY (eventParticipating)
    REFERENCES EventMaster(eventId);

ALTER TABLE EventMaster -- Best performer added to each event.
ADD bestPerformer int NOT NULL;

ALTER TABLE EventMaster -- Bestperformer links to PlayerInformation's primary key (playerNumber) in order to access all information pertinent to the best performer
ADD CONSTRAINT FK_bestPerformance FOREIGN KEY (bestPerformer)
    REFERENCES PlayerInformation(playerNumber);