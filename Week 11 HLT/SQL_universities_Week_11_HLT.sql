CREATE DATABASE uk_university_info;

USE uk_university_info;

CREATE TABLE universities(
University_ID VARCHAR(6) PRIMARY KEY,
University_Name VARCHAR(100) UNIQUE,
Country VARCHAR(50),
Global_Rank INT UNIQUE,
First_Class_Attainment_Percentage DECIMAL(3,1),
Capacity INT
);

CREATE TABLE degree(
Degree_ID VARCHAR(15) PRIMARY KEY,
Degree_Subject VARCHAR(50),
University_Name VARCHAR(100),
Type_Of_Degree VARCHAR(60),
Entry_Requirements VARCHAR(20)
);

EXPLAIN universities;
EXPLAIN degree; -- Viewing both table structures

INSERT INTO universities (University_ID,University_Name,Country,Global_Rank,First_Class_Attainment_Percentage,Capacity)
VALUES
("DUR001","Durham University","England",82,42.5,19520),
("NOT001","University of Nottingham","England",103,34.1,42170),
("CAM001","University of Cambridge","England",2,49.1,24450),
("EDI001","The University of Edinburgh","Scotland",16,31.2,33610),
("NOT002","Nottingham Trent University","England",829,14.8,26850),
("CAR001","Cardiff University","Wales",159,29.9,30180)
;

SELECT *
FROM universities; -- Viewing universities table entries

INSERT INTO degree (Degree_ID,Degree_Subject,University_Name,Type_Of_Degree,Entry_Requirements)
VALUES
("DUR001MATH1","Mathematics","Durham University","Bachelors","A*AA"),
("DUR001MATH2","Mathematics","Durham University","Integrated Masters","A*A*A"),
("DUR001COMP1","Computer Science","Durham University","Bachelors","A*AA"),
("YOR001MATH1","Mathematics","University of York","Bachelors with Placement Year","AAB"),
("YOR001PHYS1","Physics","University of York","Bachelors","ABB"),
("NOT001GEO1","Geography","University of Nottingham","Bachelors","AAA"),
("NOT001MATH1","Mathematics","University of Nottingham","Bachelors","A*AA"),
("NOT002COMP1","Computer Science","Nottingham Trent University","Bachelors","BCC"),
("NOT002COMP2","Computer Science","Nottingham Trent University","Bachelors with Placement Year","BBC"),
("EDI001PHYS1","Physics","The University of Edinburgh","Bachelors","AAA"),
("EDI001PHYS2","Physics","The University of Edinburgh","Integrated Masters","A*AA")
;

SELECT *
FROM degree; -- Viewing degree table entries

UPDATE universities
SET Global_Rank = 114
WHERE University_ID = "NOT001";

DELETE FROM degree
WHERE Degree_ID = "NOT001GEO1";

SELECT *
FROM degree d INNER JOIN universities u ON d.University_Name = u.University_Name; -- Joining the two tables on their shared attribute

SELECT University_Name, Type_Of_Degree, Entry_Requirements
FROM degree
WHERE Degree_Subject = "Mathematics"; -- A simple query used to find universities where you can study Mathematics, their type and entry requirements

-- A complex query for someone who wants to study Mathematics or Computer Science at a university that has a global rank of 200 or less

SELECT d.Degree_Subject, d.University_Name, d.Type_Of_Degree, d.Entry_Requirements, u.Global_Rank
FROM degree d INNER JOIN universities u ON d.University_Name = u.University_Name
WHERE (d.Degree_Subject = "Mathematics" OR d.Degree_Subject = "Computer Science") AND u.Global_Rank <= 200;

-- Brackets matter! Below is a similar query but this query would be used to find all universities that offer Mathematics with a global rank
-- of less than 200 and all universities that offer Computer Science

SELECT d.Degree_Subject, d.University_Name, d.Type_Of_Degree, d.Entry_Requirements, u.Global_Rank
FROM degree d INNER JOIN universities u ON d.University_Name = u.University_Name
WHERE (d.Degree_Subject = "Mathematics" AND u.Global_Rank <= 200) OR d.Degree_Subject = "Computer Science";

--  Retrieving all data from one table sorted in an ascending order

SELECT *
FROM universities
ORDER BY Global_Rank;

-- A query on one table using comparison operators

SELECT University_Name, First_Class_Attainment_Percentage
FROM universities
WHERE First_Class_Attainment_Percentage BETWEEN 25.0 AND 45.0;