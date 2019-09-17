USE mt815; 

CREATE TABLE Alumni (
	idAlumni INT NOT NULL AUTO_INCREMENT,
	firstName VARCHAR(30) NOT NULL,
	lastName VARCHAR(30) NOT NULL,
	email VARCHAR(255) NOT NULL,
	address VARCHAR(255) NULL, 
	birthDate DATE NOT NULL,
	career VARCHAR(50) NULL,
	degree VARCHAR(20) NOT NULL,
	otherDegree VARCHAR(20) NULL,
	graduationYear YEAR NOT NULL,
	internshipOpp CHAR(1) NOT NULL DEFAULT 'N',
	accomplishments TEXT NULL,
	idEmployer INT NULL, 
	PRIMARY KEY (idAlumni)
);

CREATE TABLE Employer (
	idEmployer INT NOT NULL AUTO_INCREMENT,
	companyName VARCHAR(50) NOT NULL,
	address VARCHAR(255) NOT NULL,
	phoneNumber CHAR(10) NOT NULL,
	email VARCHAR(255) NOT NULL,
	website VARCHAR(255) NULL,
	otherNames TEXT NULL,
	PRIMARY KEY (idEmployer)
);

ALTER TABLE Alumni
ADD FOREIGN KEY (idEmployer) REFERENCES Employer(idEmployer); 

CREATE TABLE Address (
	idAddress INT NOT NULL AUTO_INCREMENT,
	address1 VARCHAR(50) NULL,
	address2 VARCHAR(50) NULL,
	stateCode CHAR(2) NULL,
	county VARCHAR(50) NULL,
	country VARCHAR(50) NULL,
	zipCode VARCHAR(9) NULL,
	poBox VARCHAR(10) NULL,
	PRIMARY KEY (idAddress)
);

ALTER TABLE Alumni
	MODIFY COLUMN address INT NULL,
	ADD UNIQUE (address);

ALTER TABLE Alumni
	MODIFY COLUMN accomplishments VARCHAR(500) NULL;

ALTER TABLE Address
	ADD addressType CHAR(1) NULL;

ALTER TABLE Employer
	MODIFY COLUMN otherNames VARCHAR(500) NULL;

ALTER TABLE Alumni
	ADD linkedinURL VARCHAR(255) NULL;

-- ALTER TABLE Alumni --MariaDB 10.2 - THESE WOULD WORK ON MARIADB 10.2 VERSION; HOWEVER, THE LATEST VERSION IS NOT AVALIABLE
-- ADD CHECK (internshipOpp = 'Y' OR internshipOpp = 'N')
-- ALTER TABLE Address --MariaDB 10.2-
-- ADD CHECK (addressType = 'E' OR addressType = 'A')

ALTER TABLE Employer
	MODIFY COLUMN address INT NULL,
	ADD UNIQUE (address);

ALTER TABLE Alumni
	ADD phoneNumber CHAR(10) NOT NULL;
	
-- Added after testing with inserting records--
ALTER TABLE Alumni
	MODIFY COLUMN birthDate DATE NULL;

ALTER TABLE Alumni	
	MODIFY COLUMN phoneNumber CHAR(10) NULL;
	
ALTER TABLE Alumni
	MODIFY COLUMN email VARCHAR(255) NULL;