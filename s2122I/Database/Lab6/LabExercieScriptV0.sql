CREATE DATABASE Research_Corporation_System;
USE Research_Corporation_System;


--  Organiser – organiser id, name, address, postcode, state, contact person, contact number and 
-- email address.
CREATE TABLE Organiser (
  orgID VARCHAR(5) PRIMARY KEY,
  orgName VARCHAR(30) NOT NULL,
  orgAddress VARCHAR(100) NOT NULL,
  postcode VARCHAR(10) NOT NULL,
  state VARCHAR(20) NOT NULL,
  contact_person VARCHAR(30) NOT NULL,
  contact_number VARCHAR(10) NOT NULL,
  email VARCHAR(30) NOT NULL
);
-- insertion:
INSERT INTO Organiser VALUES
('100','Abu','19, Taman AAA','56466','Melaka', 'John','0174562775','John@gmail.com'),
('101', 'Kelvin','19, Taman BBB', '84666','Kuala Lumpur','Lim','0175487545','Lim@gmail.com'),
('102','Siti', '19, Taman CCC', '94555','Penang','Ali','0175488548','Ali@gmail.com');

-- Conference – conference id, name, conference date, year, conference theme, venue
-- Each conference consists of paralle session.
--  List the company, total fees paid for the conference take place in year 2008, 2010 and 2016.
CREATE TABLE Conference (
  conf_id VARCHAR(10) PRIMARY KEY,
  conf_name VARCHAR(30) NOT NULL,
  conf_date DATE NOT NULL,
  conf_year YEAR NOT NULL,
  conf_theme VARCHAR(10) NOT NULL,
  venue_id VARCHAR(5) NOT NULL,
  CONSTRAINT fk_Conference_venue_id FOREIGN KEY (venue_id) REFERENCES Venue(venue_id)
);
-- insertion
INSERT INTO Conference VALUES 
('DSC2010','Iris','2010-10-02','2010','Economic','v0001'),
('IOTC2016','Harry','2016-05-24','2016','Education','v0004'),
('DSC2008','Siti','2008-01-25','2008','Economic','v0003'),
('IOTC2003','Abu','2003-07-28','2003','Education','v0005'),
('DSC2015','John','2015-06-08','2015','Play','v0001');

--  Venue – venue id, venue name, address (street, city, state, post code)
-- Conference venue will rotate among these three companies for every two (2) years.
CREATE TABLE Venue (
  venue_id VARCHAR(5) PRIMARY KEY,
  venue_name VARCHAR(25) NOT NULL,
  address VARCHAR(50) NOT NULL,
  street VARCHAR(24) NOT NULL,
  city VARCHAR(45) NOT NULL,
  state VARCHAR(45) NOT NULL,
  postcode VARCHAR(7) NOT NULL
);
-- insertion
INSERT INTO Venue VALUES
('v0001','Dire','Taman ZZZ','Top Lane','Jasin','Melaka','56466'),
('v0002','Aurora','Taman YYY','Top Lane','Muar','Johor','84000'),
('v0003','Dire','Taman WWW','Old Town', 'Georgettown','Penang','94555'),
('v0004','Sentinel','Taman VVV','Mid Lane','Batu Rakit','Terengganu','24000'),
('v0005', 'Radiant','Taman SSS','Top Lane', 'Segamat','Johor','45000');

-- Participant – participant id, name, designation, company, fees
-- Participant id is automatically generated by the system with running number starting from 10001
-- Charges for professional is RM3000.00, educator is RM2500.00 and for postgraduate student is RM2000.00.
-- A total of 40 participants are allow to attend and present the papers in each conference based on the first come first serve basis
CREATE TABLE Participant (
  participant_id INT(20) PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(60) NOT NULL,
  designation VARCHAR(20) NOT NULL,
  company VARCHAR(20) NOT NULL
);
ALTER TABLE participant AUTO_INCREMENT =10001;

-- insertion:
INSERT INTO Participant VALUES 
(DEFAULT,'Kobe','Star','Galaxy'), 
(DEFAULT,'May','Moon','Moonlight'),
(DEFAULT,'Candy','Candy','CandyCrush'),
(DEFAULT,'James','Cloud','Wind'),
(DEFAULT,'Daniel','Sun','Sunny');

CREATE TABLE sessiondetails(
sessionid VARCHAR(10) PRIMARY KEY NOT NULL,
sessionName VARCHAR(60),
orgID VARCHAR(10) NOT NULL,
conf_id VARCHAR(10) NOT NULL,
CONSTRAINT fk_sessiondetails_orgID FOREIGN KEY(orgID) REFERENCES Organiser(orgID),
CONSTRAINT fk_sessiondetails_conf_id FOREIGN KEY(conf_id) REFERENCES Conference(conf_id)
);

-- insertion:
INSERT INTO sessiondetails VALUES 
('S0001','Morning','101','DSC2010'),
('S0002','Evening','100','DSC2015'),
('S0003','Night','102','IOTC2016'),
('S0004','Evening','100','IOTC2003'),
('S0005','Night','101','DSC2008');

CREATE TABLE conferenceDetails(
conf_id VARCHAR(10) NOT NULL,
participant_id INT(20) NOT NULL,
  fees DECIMAL(9,2) NOT NULL,
CONSTRAINT ck_Participant_fees CHECK (fees IN (3000,2500,2000)),
CONSTRAINT fk_conferenceDetails_conf_id FOREIGN KEY(conf_id) REFERENCES Conference(conf_id),
CONSTRAINT fk_conferenceDetails_participant_id FOREIGN KEY(participant_id) REFERENCES Participant(participant_id)
);

-- insertion:
INSERT INTO conferenceDetails VALUES
('DSC2010','10001',3000),
('DSC2015','10002',2000),
('IOTC2016','10003',2500),
('IOTC2003','10004',2500),
('DSC2008','10005',2000);




-- QUESTIONS
-- 1. Summarise organiser name, conferenceid and the number of participant attend for each 
-- conference. You output must be sorted by organiser name as ascending order.

SELECT orgName, conf_id, COUNT(participant_id ) FROM organiser INNER JOIN sessiondetails USING(orgID) INNER JOIN conference USING (conf_id)
INNER JOIN conferenceDetails USING(conf_id) 
GROUP BY orgName ORDER BY orgName;


-- 2. List the company, total fees paid for the conference take place in year 2008, 2010 and 2016.
SELECT company, sum(fees) AS 'Total Fee Paid'  FROM participant
INNER JOIN conferenceDetails USING(participant_id) INNER JOIN conference USING(conf_id)
WHERE conf_year IN (2008,2010,2016)
GROUP BY company;


-- 3. Find venue name where more than one conference held at this. You should display venue 
-- name, no_of_conference and total fees paid.
SELECT venue_name, COUNT(conf_id) AS 'no_of_conference', SUM(fees) AS 'total fees paid'  FROM Venue INNER JOIN conference USING(venue_id)
INNER JOIN conferenceDetails USING(conf_id) INNER JOIN participant USING(participant_id)
GROUP BY venue_name HAVING COUNT(conf_id) > 1;  

-- 4. Display conferenceid, conference name, conference year and no of session held for all 
-- conferences organised by organiser with id 100 for conference year 2003 and 2015. Your ouput 
-- must group by conference id, conference name and conference year.
SELECT conf_id, conf_name,conf_year, COUNT(sessionid) AS 'No of Session' FROM conference
INNER JOIN sessiondetails USING (conf_id) INNER JOIN Organiser USING(orgID)
WHERE orgID = 100 AND conf_year IN (2003,2015)
GROUP BY conf_id, conf_name, conf_year;


--  5. Find the conference id, conference name and maximum fees paid by participants who attend 
-- the conference for conference code DSC2010 and IOTC2016. You should use INNER JOIN clause 
-- and USING clause for producing the output for this query.
SELECT conf_id, conf_name , max(fees) AS MaxFeesPaid
FROM conference INNER JOIN conferencedetails USING (conf_id)
WHERE conf_id = 'DSC2010' or conf_id = 'IOTC2016'
ORDER BY conf_id;


-- 6. Display participant id, participant name, no of frequent he/she attending the conference that 
-- organised at Kuala Lumpur, Langkawi and Penang. Sort you result by no of frequent as 
-- descending order.
SELECT participant_id, name, count(conf_id) AS noOfRequest
FROM participant INNER JOIN conferenceDetails USING (participant_id)
INNER JOIN conference USING (conf_id) INNER JOIN venue USING (venue_id)
WHERE state in('Kuala Lumpur','Penang','Langkawi') 
GROUP BY state,city
ORDER BY noOfRequest;






SET sql_mode = @@sql_mode ='ONLY_FULL_GROUP_BY , STRICT_TRANS_TABLES , NO_ZERO_IN_DATE , NO_ZERO_DATE , ERROR_FOR_DIVISION_BY_ZERO , and NO_ENGINE_SUBSTITUTION';
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

-- References:
-- -----------
-- DSC2008	Siti	2008-01-25	2008
-- DSC2010	Iris	2010-10-02	2010
-- DSC2015	John	2015-06-08	2015  / 
-- IOTC2003	Abu	2003-07-28	2003  / 
-- IOTC2016	Harry	2016-05-24	2016
-- ----------------
-- 'S0001', 'Morning', '101', 'DSC2010'
-- 'S0002', 'Evening', '100', 'DSC2015'
-- 'S0003', 'Night', '102', 'IOTC2016'
-- 'S0004', 'Evening', '100', 'IOTC2003'
-- 'S0005', 'Night', '101', 'DSC2008'
-- ---------------
-- '100', 'Abu', '19, Taman AAA', '56466', 'Melaka', 'John', '0174562775', 'John@gmail.com'
-- '101', 'Kelvin', '19, Taman BBB', '84666', 'Kuala Lumpur', 'Lim', '0175487545', 'Lim@gmail.com'
-- '102', 'Siti', '19, Taman CCC', '94555', 'Penang', 'Ali', '0175488548', 'Ali@gmail.com'
