-- Task 1
USE abc_vehicle_services;
DESC srvService;
ALTER TABLE srvService MODIFY COLUMN custCode VARCHAR(15) DEFAULT NULL;
ALTER TABLE srvService MODIFY COLUMN vecNo VARCHAR(10) DEFAULT NULL;
ALTER TABLE srvService MODIFY COLUMN srvType VARCHAR(25) Not NULL
CHECK (srvType IN ('Normal','Major','Warranty'));

-- ====================================================================
 
-- Task 2
-- creating new database for student table we will call it University
CREATE DATABASE University;
USE university;

CREATE TABLE student(
StudentID VARCHAR(6) NOT NULL,
StuName VARCHAR (50) DEFAULT NULL,
Gender CHAR(1) CHECK(Gender IN ('M','F')) DEFAULT NULL,
Program VARCHAR (70) DEFAULT NULL,
Intake INT(4) DEFAULT NULL, 
PRIMARY KEY (StudentID));

DESCRIBE student;
DESC student;

--------------------------------------------
-- adding the values from the figure given 
INSERT INTO student (StudentID, StuName, Gender, Program, Intake)
VALUES ('S10023', 'Amran Hamzah', 'M', 'BSc.Comp.Science (SE)', '2014'),
('S20106', 'Goh Seng Huat', 'M', 'BSc.Comp.Science with IM', '2015'),
('S30078', 'Nur Hafizah Rahman', 'F', 'BSc.Comp.Science (Networking)', '2016');

SELECT * FROM student;

-- -----------------------------------------
-- applying the modification on student name attribute 

ALTER TABLE student MODIFY StuName VARCHAR (20) DEFAULT NULL;

-- =============================================================
