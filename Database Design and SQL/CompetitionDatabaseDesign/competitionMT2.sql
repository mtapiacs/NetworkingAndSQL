-- NOTE: This second query statement was a refactor I was working on. It makes things more concise and gets rid of extra queries used to add foreign key constraints.
-- It should do the same as the first query for the most part.

-- ***	Competitions Database Refactor	*** --
-- ***	Created by: Miguel Tapia			*** --
-- *** 	Using: MS SQL Server V.17 			*** --
-- Creating database for different competitions
CREATE DATABASE CompetitionsMT2;

USE CompetitionsMT2;

-- Creating table `PlayerInformation` to store all information on different players. This includes a unique primary key for easier access. Things will change
CREATE TABLE PlayerInformation
(
	teamId int NOT NULL IDENTITY(1,1) -- Team Id as primary key in order to identify a player with his team
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
	highestScore int NOT NULL-- General highest score in order to account for multiple game types
	,
	favoriteSport varchar(50) NOT NULL-- Favorite sport could be different from current sport
	,
	currentSport varchar(50) NOT NULL
	,
	playerNumber int PRIMARY KEY NOT NULL
	,
	playerBirth date NOT NULL
);


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
	bestPerformer int NOT NULL
	,
	FOREIGN KEY (winnerId) REFERENCES PlayerInformation (playerNumber)
	,
	CONSTRAINT FK_bestPerformance FOREIGN KEY (bestPerformer)
    REFERENCES PlayerInformation(playerNumber)
	-- The foreign key points to PlayerInformation. I believe this command was an error again, but SQL server let me run it. The foreign keys are all fixed at the bottom queries.
);

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
	eventParticipating int NOT NULL
	,
	CONSTRAINT FK_teamId FOREIGN KEY (teamId)
	REFERENCES PlayerInformation(playerNumber),
	CONSTRAINT FK_eventId FOREIGN KEY
	(eventParticipating)
    REFERENCES EventMaster
	(eventId)
	-- Reference to PlayerInformation's primary key (teamid)
);



ALTER TABLE EventMaster
ADD CONSTRAINT FK_winnerId FOREIGN KEY (winnerId)
	REFERENCES TeamInformation (teamId)

ALTER TABLE PlayerInformation 
ADD CONSTRAINT FK_teamId FOREIGN KEY (teamId)
	REFERENCES TeamInformation (teamId)
