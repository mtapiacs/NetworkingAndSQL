INSERT INTO Alumni (`firstName`, `lastName`, `email`, `career`, `degree`, `otherDegree`, `graduationYear`, `accomplishments`, `linkedinURL`, `phoneNumber`)
VALUES ('Michael', 'Sabal', 'example@example.edu', 'Professor and IT Director', 'Business and Computer Science Minor', 'Master in Education', '2007', 'Became IT Director at company. Works privately as consulatant'https://www.linkedin.com/in/michael-sabal-0aa7474/', '2670000000')

INSERT INTO Alumni (`firstName`, `lastName`, `email`, `career`, `degree`, `otherDegree`, `graduationYear`, `accomplishments`, `linkedinURL`)
VALUES ('Todd', 'Williams', 'president@cairn.edu', 'University President', 'Bible / Biblical Studies', 'Doctorate Psycology', '1990', 'University President for 10 years', 'https://www.linkedin.com/in/todd-williams-858a9399/')

INSERT INTO Alumni (`firstName`, `lastName`, `career`, `degree`, `otherDegree`, `graduationYear`, `linkedinURL`)
VALUES ('Jamie', 'Gleason', 'Product Manager', 'Biblical Studies / Camping Ministry', 'M.L.S Org. Leadership', '2000', 'https://www.linkedin.com/in/jamie-gleason-mls-38251215/')

INSERT INTO Employer (`companyName`, `phoneNumber`, `email`, `website`, `otherNames`)
VALUES ('Cairn University', '2157024314', 'human.resources@cairn.edu', 'http://www.cairn.edu/', 'PBU, Philadelphia College of Bible')

INSERT INTO Address (`address1`, `stateCode`, `country`, `county`,`zipCode`, `addressType`)
VALUES ('200 Manor Avenue', 'PA', 'United States', 'Langhorne','19047', 'E')

UPDATE Employer
SET address = '1'
WHERE idEmployer = 3; 

UPDATE Alumni
SET idEmployer = 3
WHERE idAlumni = 1;

UPDATE Alumni
SET idEmployer = 3
WHERE idAlumni = 2;