CREATE DATABASE ABC_Vehicle_Services;


USE ABC_Vehicle_Services;


-- CREATING srvCustomer table ------------------------
CREATE TABLE srvCustomer(
custCode VARCHAR(15) NOT NULL, 
custName VARCHAR(60) NOT NULL ,
custICNo VARCHAR(15) NOT NULL,
custType VARCHAR(15) NOT NULL,
custAddr VARCHAR(60) DEFAULT NULL,
custTown VARCHAR(30) DEFAULT NULL,
custPostCode INT(5) DEFAULT NULL,
custRegister DATE DEFAULT NULL,
PRIMARY KEY (custCode));


DROP TABLE srvCustomer;
-- ---------------------------------------------------------

-- creating srvVehicle table
CREATE TABLE srvVehicle (
vecNo VARCHAR(10) NOT NULL,
vecOwner VARCHAR(15) NOT NULL,
vecChassisNo VARCHAR(30) DEFAULT NULL,
vecModel VARCHAR(60) NOT NULL,
vehManufactured VARCHAR(60) DEFAULT NULL,
vehYearProduced INT(4) DEFAULT NULL,
vehLastOdometer BIGINT(20) DEFAULT NULL,
PRIMARY KEY (vecNo),
FOREIGN KEY (vecOwner) REFERENCES srvcustomer(custCode));

DROP TABLE srvVehicle;
-- ================================================================

-- creating  srvParts table-------------------------------------------

CREATE TABLE srvParts(
partNo VARCHAR(45) NOT NULL,
partDescription VARCHAR (60) NOT NULL,
partCategory VARCHAR(45) DEFAULT NULL,
partUnit VARCHAR (35) DEFAULT NULL,
partCostPrice DECIMAL(9,2) DEFAULT NULL,
partSalesPrice DECIMAL(9,2) DEFAULT NULL,
partQtyOnHand INT (11) DEFAULT NULL,
PRIMARY KEY (partNo));

DROP TABLE srvParts;

-- ============================================================

-- creating srvTechnician table
CREATE TABLE srvTechnician(
tchNo INT(12) NOT NULL,
tchName VARCHAR (60) NOT NULL,
tchHireDate DATE DEFAULT NULL,
PRIMARY KEY (tchNo));

DROP TABLE srvTechnician;

-- ================================================================

-- creating srvService table 
CREATE TABLE srvService (
srvNo INT(12) NOT NULL,
custCode VARCHAR(15) NOT NULL,
vecNo VARCHAR (10) NOT NULL,
srvType VARCHAR (25)  CHECK (srvType IN ('Normal','Major','Warranty')),
srvDate DATE DEFAULT NULL,
tchNo INT (5) NOT NULL,
PRIMARY KEY(srvNo),
FOREIGN KEY (custCode) REFERENCES srvCustomer (custCode),
FOREIGN KEY (vecNo) REFERENCES srvVehicle(vecNo),
FOREIGN KEY (tchNo) REFERENCES srvTechnician(tchNo));

DESC  srvService;
DROP TABLE srvService;

-- ==================================================================

-- creating srvServiceDetails table
CREATE TABLE srvServiceDetails(
srvNo INT (12) NOT NULL,
partNo VARCHAR(45) NOT NULL,
orderQty INT(11) NOT NULL,
slsPrice DECIMAL (9,2) DEFAULT NULL,
FOREIGN KEY (srvNo) REFERENCES srvService(srvNo),
FOREIGN KEY (partNo) REFERENCES srvParts(partNo));

DROP TABLE srvServiceDetails;

-- ========================================================================
  ALTER TABLE srvService MODIFY COLUMN custCode VARCHAR(15) NOT NULL;
ALTER TABLE srvService MODIFY COLUMN vecNo VARCHAR(10) NOT NULL;


INSERT INTO srvcustomer (custCode, custName, custICNo, custType) VALUES ('1', 'OMAR', '2154', 'vip');
INSERT INTO srvvehicle (vecNo, vecOwner, vecModel) VALUES ('1', '1', '2000');
INSERT INTO srvtechnician (tchNo, tchName) VALUES (1, 'ali');

INSERT INTO srvservice (srvNo, custCode, vecNo, srvType, tchNo) VALUES ('1', '1', '1', 'Warranty', 1);
