CREATE DATABASE XYZ_Express_Servicing;
USE XYZ_Express_Servicing;

-- ---------------------------------------------------------------------------------------------- FOURTH
CREATE TABLE Driver(
drvNo INT(5) NOT NULL PRIMARY KEY AUTO_INCREMENT,
drvName VARCHAR (100) NOT NULL,
drvJoinDate DATE,
brnNo INT(3) NOT NULL,
CONSTRAINT fk_Driver_brnNo FOREIGN KEY(brnNo) REFERENCES Branch (brnNo)
);
ALTER TABLE Driver AUTO_INCREMENT = 1001;
-- Insertion of Driver table:
INSERT INTO driver (drvNo, drvName, drvJoinDate, brnNo)
VALUES (default, 'Mohd Hashim Ali', "2015-09-12", 10),
       (default, 'Hamzah Razali', "2015-10-14", 11),
       (default, 'Arif Fadillah', "2015-10-15", 12),
       (default, 'Wan Haizan Wan Omar', "2015-11-02", 10),
       (default, 'Badrulhisham Mokhtar', "2016-01-15", 11);
-- ----------------------------------------------------------------------------------------------

-- ---------------------------------------------------------------------------------------------- FIRST ONE
CREATE TABLE Branch(
brnNo INT(3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
brnName VARCHAR(100) NOT NULL,
brnOfficNo VARCHAR(10) NOT NULL,
brnContactPerson VARCHAR(100)
);
ALTER TABLE Branch AUTO_INCREMENT = 10;

-- Insertion to Branch table:
INSERT INTO Branch (brnNo, brnName, brnOfficNo, brnContactPerson)
VALUES (default, 'Kuala Terengganu', '09-6671020', 'Amri Aziz'),
       (default, 'Kemaman', '09-6951234', 'Sharifah Syed Ali'),
       (default, 'Besut', '09-6973490', 'Rohaiza Rahmad');
-- ----------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------- SECOND
CREATE TABLE Vehicle(
vehNo INT (7) NOT NULL PRIMARY KEY AUTO_INCREMENT,
vehPlat VARCHAR(20) UNIQUE NOT NULL,
vehModel VARCHAR (20) NOT NULL,
vehYear INT(4) NOT NULL,
fleLMaintenance DATE NOT NULL
);
ALTER TABLE Vehicle AUTO_INCREMENT =200001;
-- Insertion to Vehicle table:
INSERT INTO Vehicle (vehNo, vehPlat, vehModel, vehYear, fleLMaintenance)
VALUES (DEFAULT, 'TBS1234', 'MAN SE', '2015', '2016-01-17'),
       (DEFAULT, 'TBS2021', 'MAN SE', '2015', '2016-01-04'),
       (DEFAULT, 'TBU5912', 'Hino Motors', '2015', '2016-01-15'),
       (DEFAULT, 'TBU9890', 'Isuzu Motors', '2016', '2016-01-15'),
       (DEFAULT, 'TBV2000', 'Hino Motors', '2016', '2016-02-26'),
       (DEFAULT, 'TBW7878', 'Hino Motors', '2016', '2015-12-02');
-- ----------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------- FIFTH
CREATE TABLE Fleet (
fleNo INT(7) PRIMARY KEY NOT NULL AUTO_INCREMENT,
drvNo INT (5) NOT NULL, -- FOREIGN KEY
vehNo INT (7) NOT NULL, -- FOREIGN KEY
fleDate DATE NOT NULL,
fleType CHAR(2) NOT NULL, -- CHECK (),
fleStatus VARCHAR(10),
CONSTRAINT fk_Fleet_drvNo FOREIGN KEY(drvNo) REFERENCES Driver(drvNo),
CONSTRAINT fk_Fleet_vehNo FOREIGN KEY(vehNo) REFERENCES Vehicle(vehNo),
CONSTRAINT ck_fleType CHECK (fletype IN ('01','02'))
);
ALTER TABLE Fleet AUTO_INCREMENT = 9000001;
-- insertion to Fleet table:
INSERT INTO Fleet (fleNo, drvNo, vehNo, fleDate, fleType, fleStatus)
VALUES 
(DEFAULT, 1001, 200001, '2015-10-10', '01', 'Closed'),
 (DEFAULT, 1002, 200002, '2015-11-05', '01', 'Closed'),
 (DEFAULT, 1004, 200003, '2015-11-17', '01', 'Closed'),
 (DEFAULT, 1001, 200001, '2015-11-21', '02', 'WIP'),
 (DEFAULT, 1003, 200004, '2015-11-25', '01', 'Closed'),
 (DEFAULT, 1005, 200005, '2015-12-14', '01', 'Closed'),
 (DEFAULT, 1001, 200006, '2015-12-16', '01', 'Closed'),
 (DEFAULT, 1004, 200002, '2016-01-04', '01', 'Closed'),
 (DEFAULT, 1005, 200003, '2016-01-15', '01', 'WIP'),
 (DEFAULT, 1003, 200004, '2016-01-15', '02', 'WIP'),
 (DEFAULT, 1001, 200001, '2016-01-17', '01', 'Open'),
 (DEFAULT, 1002, 200005, '2016-02-26', '01', 'Open');
-- ----------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------- SIXTH
CREATE TABLE FleetDetails(
fleNo INT (7) NOT NULL,
jobID VARCHAR(10) NOT NULL,
quantity INT(1) ,
chrgAmount DECIMAL(9,2) DEFAULT 0.00,
CONSTRAINT pk_FleetDetails PRIMARY KEY(fleNo, jobID),
CONSTRAINT fk_FleetDetails_fleNo FOREIGN KEY (fleNo) REFERENCES Fleet(fleNo),
CONSTRAINT fk_FleetDetails_jobID FOREIGN KEY (jobID) REFERENCES Job(jobID)
);

INSERT INTO FleetDetails (fleNo, jobID, quantity, chrgAmount)
VALUES (9000001, 'Lub-01', 1, 600.00),
       (9000001, 'Part-01', 1, 900.00),
       (9000002, 'Lub-01', 1, 600.00),
       (9000002, 'Part-01', 1, 900.00),
       (9000002, 'AirC-01', 1, 1000.00),
       (9000003, 'Lub-02', 1, 1000.00),
       (9000003, 'Part-02', 2, 3400.00),
       (9000003, 'BA-01', 1, 400.00),
       (9000004, 'AirC-03', 1, 0.00),
       (9000005, 'Lub-03', 1, 1700.00),
       (9000006, 'Lub-01', 1, 600.00),
       (9000006, 'Part-01', 1, 900.00),
       (9000007, 'Lub-02', 1, 1000.00),
       (9000007, 'Part-02', 1, 3400.00),
       (9000007, 'Tyre-02', 2, 2120.00),
       (9000008, 'Lub-01', 1, 600.00),
       (9000008, 'Part-01', 1, 900.00),
       (9000009, 'Lub-03', 1, 1700.00),
       (9000009, 'Part-02', 1, 3400.00),
       (9000009, 'AirC-01', 1, 1000.00),
       (9000009, 'Tyre-01', 1, 150.00),
       (9000010, 'AirC-03', 1, 0.00),
       (9000010, 'Part-02', 1, 0.00),
       (9000011, 'Lub-01', 1, 600.00),
       (9000011, 'Part-01', 1, 900.00),
       (9000011, 'AirC-01', 1, 1000.00),
       (9000012, 'Lub-03', 1, 1700.00),
       (9000012, 'Part-02', 1, 3400.00),
       (9000012, 'BA-01', 1, 400.00);
-- ----------------------------------------------------------------------------------------------


-- ---------------------------------------------------------------------------------------------- THIRD
CREATE TABLE Job (
jobID VARCHAR(10) PRIMARY KEY NOT NULL,
jobDesc VARCHAR(200) NOT NULL,
srvsCharge DECIMAL(9,2) DEFAULT 0.00,
partCharge DECIMAL(9,2) DEFAULT 0.00,
unit VARCHAR(10) DEFAULT 'N.A'
);

INSERT INTO Job(jobID, jobDesc, srvsCharge, partCharge, unit)
VALUES ('Lub-01', 'Lubricant Minor Svs', 100.00, 500.00, '1 unit'),
       ('Lub-02', 'Lubricant Major Svs', 200.00, 800.00, '1 unit'),
       ('Lub-03', 'Lubricant Major Svs + Break Lubricant', 500.00, 1200.00, '1 unit'),
       ('Part-01', 'Spare Part Service Minor', 300.00, 600.00, '1 unit'),
       ('Part-02', 'Spare Part Service Major', 300.00, 1400.00, '1 unit'),
       ('Part-03', 'Spare Part Service Overhaul', 1200.00, 8000.00, '1 unit'),
       ('AirC-01', 'Air-Cond Minor Maintenance', 400.00, 600.00, '1 unit'),
       ('AirC-02', 'Air-Cond Major Maintenance', 700.00, 1500.00, '1 unit'),
       ('AirC-03', 'Air-Cond Replacement', 600.00, 6000.00, '1 unit'),
       ('BA-01', 'Balancing & Alignment', 300.00, 100.00, '1 unit'),
       ('Tyre-01', 'Rotation', 150.00, 0.00, 'N.A'),
       ('Tyre-02', 'Tyres Replacement', 60.00, 1000.00, '1 unit'),
       ('WTY-01', 'Warranty Minor', 0.00, 0.00, '1 unit'),
       ('WTY-02', 'Warranty Major', 0.00, 0.00, '1 unit');
-- ----------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------- LAST
CREATE TABLE Billing(
billNo INT(8) PRIMARY KEY NOT NULL AUTO_INCREMENT,
fleNo INT(7) NOT NULL, -- FOREIGN KEY
pymtType VARCHAR (10) NOT NULL,
pymtDate DATE NOT NULL,
pymtAmount DECIMAL(9,2) DEFAULT 0.00,
CONSTRAINT fk_Billing_fleNo FOREIGN KEY (fleNo) REFERENCES Fleet(fleNo)
);
ALTER TABLE Billing AUTO_INCREMENT = 88000001;

INSERT INTO Billing (billNo, fleNo, pymtType, pymtDate, pymtAmount)
VALUES (DEFAULT, 9000001, 'Credit', '2015-10-10', 1500.00),
       (DEFAULT, 9000002, 'Credit', '2015-11-05', 2500.00),
       (DEFAULT, 9000003, 'Credit', '2015-11-17', 4800.00),
       (DEFAULT, 9000004, 'Wty Credit', '2015-11-21', 0.00),
       (DEFAULT, 9000005, 'Credit', '2015-11-25', 1700.00),
       (DEFAULT, 9000006, 'Credit', '2015-12-14', 1500.00),
       (DEFAULT, 9000007, 'Cash', '2015-12-02', 6520.00),
       (DEFAULT, 9000008, 'Credit', '2016-01-04', 1500.00),
       (DEFAULT, 9000009, 'Credit', '2016-01-15', 6250.00),
       (DEFAULT, 9000010, 'Wty Credit', '2016-01-15', 0.00),
       (DEFAULT, 9000011, 'Credit', '2016-01-17', 2500.00),
       (DEFAULT, 9000012, 'Credit', '2016-02-26', 5500.00);
-- ----------------------------------------------------------------------------------------------