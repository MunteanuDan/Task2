CREATE TABLE persons (
 ID VARCHAR(20) PRIMARY KEY,
 Status VARCHAR(10),
 First_Name VARCHAR(50),
 Last_Name VARCHAR(50),
 Email_Address VARCHAR(100),
 Locatie VARCHAR(50)
);

CREATE TABLE Votes (
 ID INT PRIMARY KEY,
 voting_date TIMESTAMP, 
 chosen_person VARCHAR2(20),
 voter INT,
 message VARCHAR2(100),
 valid NUMBER(1),
 quality VARCHAR2(20)
);


INSERT INTO persons (ID, Status, First_Name, Last_Name, Email_Address, Locatie)
VALUES ('00108901', 'Active', 'Person', 'One', 'person.one@gfk.com', 'Germany');
INSERT INTO persons (ID, Status, First_Name, Last_Name, Email_Address, Locatie)
VALUES ('00108941', 'Active', 'Person', 'Two', 'person.two@gfk.com', 'France');
INSERT INTO persons (ID, Status, First_Name, Last_Name, Email_Address, Locatie)
VALUES ('00199990', 'Inactive', 'Person', 'Three', 'person.three@gfk.com', 'Brazil');
INSERT INTO persons (ID, Status, First_Name, Last_Name, Email_Address, Locatie)
VALUES ('01100003', 'Active', 'Person', 'Four', 'person.four@gfk.com', 'Hong Kong');
INSERT INTO persons (ID, Status, First_Name, Last_Name, Email_Address, Locatie)
VALUES ('03400110', 'Active', 'Person', 'Five', 'person.five@gfk.com', 'Germany');
INSERT INTO persons (ID, Status, First_Name, Last_Name, Email_Address, Locatie)
VALUES ('03400360', 'Active', 'Person', 'Six', 'person.six@gfk.com', 'France');
INSERT INTO persons (ID, Status, First_Name, Last_Name, Email_Address, Locatie)
VALUES ('03402059', 'Inactive', 'Person', 'Seven', 'person.seven@gfk.com', 'Brazil');
INSERT INTO persons (ID, Status, First_Name, Last_Name, Email_Address, Locatie)
VALUES ('03400565', 'Active', 'Person', 'Eight', 'person.eight@gfk.com', 'Hong Kong');
INSERT INTO persons (ID, Status, First_Name, Last_Name, Email_Address, Locatie)
VALUES ('03400436', 'Active', 'Person', 'Nine', 'person.nine@gfk.com', 'Hong Kong');

INSERT INTO Votes (ID, Voting_date, chosen_person, voter, message, valid, quality)
VALUES (253, TO_TIMESTAMP('2022-10-29 11:54:15', 'YYYY-MM-DD HH24:MI:SS'), '03400110', 1, 'Vote 1', 1, 'entrepreneur');
INSERT INTO Votes (ID, Voting_date, chosen_person, voter, message, valid, quality)
VALUES (254, TO_TIMESTAMP('2022-10-29 11:55:22', 'YYYY-MM-DD HH24:MI:SS'), '03400360', 1, 'Vote 2', 0, 'entrepreneur');
INSERT INTO Votes (ID, Voting_date, chosen_person, voter, message, valid, quality)
VALUES (255, TO_TIMESTAMP('2022-10-29 11:56:53', 'YYYY-MM-DD HH24:MI:SS'), '03402059', 1, 'Vote 3', 1, 'partner');
INSERT INTO Votes (ID, Voting_date, chosen_person, voter, message, valid, quality)
VALUES (256, TO_TIMESTAMP('2022-10-29 11:58:23', 'YYYY-MM-DD HH24:MI:SS'), '03400565', 1, 'Vote 4', 1, 'developer');
INSERT INTO Votes (ID, Voting_date, chosen_person, voter, message, valid, quality)
VALUES (257, TO_TIMESTAMP('2022-10-29 12:13:00', 'YYYY-MM-DD HH24:MI:SS'), '03400436', 1, 'Vote 5', 1, 'developer');


SELECT p.Locatie, p.First_Name, p.Last_Name, COUNT(v.ID) AS Votes_Received, LISTAGG(v.quality, ', ') 
WITHIN GROUP (ORDER BY v.quality) AS Qualities
FROM Persons p
JOIN Votes v ON p.ID = v.chosen_person
GROUP BY p.Locatie, p.First_Name, p.Last_Name
ORDER BY p.Locatie, p.First_Name, p.Last_Name;

SELECT p.Locatie AS Country, COALESCE(COUNT(v.ID), 0) AS Votes
FROM Persons p
LEFT JOIN Votes v ON p.ID = v.chosen_person
GROUP BY p.Locatie
ORDER BY p.Locatie;
