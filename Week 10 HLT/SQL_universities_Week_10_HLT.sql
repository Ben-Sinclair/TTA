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

EXPLAIN universities;