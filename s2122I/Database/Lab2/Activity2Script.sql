CREATE DATABASE myPractical;

select date_format(str_to_date(slsShipDate, '%m/%d/%Y')) from sales_table;
Select date_format(str_to_date(  slsShipDate, '%Y/%m/%d'),'%d/%m/%Y' )as s
from sales_table;

-- Date changing so we can use the features of the date
ALTER TABLE sales_table Modify column slsShipDate DATE; 
ALTER TABLE sales_table Modify column slsOrdDate DATE; 
Update sales_table set slsShipDate = date_format(slsShipDate,"%d/%m/%Y");
Update sales_table set slsOrdDate = date_format(str_to_date(  slsShipDate, '%d/%m/%Y'),'%d/%m/%Y' );


-- insertion to customer table
insert into customer_table(custName,custJob, custAddr1, custAddr2, custState, custPostCode,custContact)
values ('Ahimd Roslan', 'Insurance Exec','no.15, jln Air Kolam','Kuala Terengganu','Terengganu' , 21060,'0112563030'),
('Chan Liew','Bank Officer','No. 1220, Prima Appartment','Mutiara Damansara','Kuala Lumpur',51200,'0123321919'),
		('Mohed Sazali','Technician','No. 5, Lrg Melati 5/12','Tmn Sri Gombak', 'Selangor',48500,'0194451517');

-- run the table 
SELECT * FROM customer_table;
        
-- insertion to product table
insert into   product_table(prdID,prdName,prdCategory,prdUnit,prdCostPrice,prdSalesPrice)
values ('PW1001-01','Mach 20/50 Cylinder Oil','Lubricant','Litre',45.00,76.90),
		('PW2001-01','Vios Oil Filter',	'Filter',	'box',	15.35,28.95),
		('PW1001-45','Gear Oil 10/30','Lubricant','Litre',28.89,44.9);
        
-- run the table 
SELECT * FROM product_table;

-- insertion to sales table
insert into sales_table (slsID, custID, slsType, slsOrdDate, slsShipDate)
values (21001,10002,'Credit','12/8/2016','8/16/2016'),
		(21002,10001,'Credit','13/08/2016',	'8/22/2016'),
		(31001,10003,'Cash','16/08/2016','8/23/2016');
        
-- run the table 
SELECT * FROM sales_table;


-- 1. Define data dictionary for Table 1, 2 and 3 respectively. You should properly defined the
-- identifier and data type that representing the attributes for each entity.
DESCRIBE customer_table;
DESCRIBE product_table;
DESCRIBE sales_table;

-- 2. By using SQL DDL command, create the structure of these tables (ignore any constraints).
-- Creating Product Table 
CREATE TABLE product_table (
  prdID VARCHAR(200) NOT NULL,
  prdName VARCHAR(45) NULL DEFAULT NULL,
  prdCategory VARCHAR(45) NULL DEFAULT NULL,
  prdUnit VARCHAR(45) NULL DEFAULT NULL,
  prdCostPrice DOUBLE NULL DEFAULT NULL,
  prdSalesPrice DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (prdID));

-- Creating Customer Table 
CREATE TABLE customer_table (
  custID int NOT NULL AUTO_INCREMENT COMMENT 'Customer ID',
  custName varchar(50) DEFAULT NULL COMMENT 'Customer Name',
  custJob varchar(50) DEFAULT NULL COMMENT 'Customer Jop',
  custAddr1 varchar(50) DEFAULT NULL COMMENT 'Customer Address 1',
  custAddr2 varchar(50) DEFAULT NULL COMMENT 'Customer Address 2',
  custState varchar(20) DEFAULT NULL COMMENT 'Customer State',
  custPostCode int DEFAULT NULL COMMENT 'Post Code',
  custContact varchar(12) DEFAULT NULL COMMENT 'Customer Contact',
  PRIMARY KEY (custID));

-- Creating Sales Table
CREATE TABLE sales_table (
  slsID int NOT NULL,
  custID int DEFAULT NULL,
  slsType varchar(45) DEFAULT NULL,
  slsOrdDate date DEFAULT NULL,
  slsShipDate date DEFAULT NULL,
  PRIMARY KEY (slsID),
  KEY custID_idx (custID),
  CONSTRAINT custID FOREIGN KEY (custID) REFERENCES customer_table (custID));

-- 3. Finally, display the structure of table you created using SQL DDL commands.


INSERT INTO product_table (prdID, prdName, prdCategory, prdUnit, prdCostPrice, prdSalesPrice)
 VALUES ('PW1001-01', 'Mach 20/50 Cylinder Oil', 'Lubricant', 'Litre', '45.00', '76.90'),
('PW2001-01', 'Vios Oil Filter', 'Filter', 'box', '15.35', '28.95'),
('PW1001-45', 'Gear Oil 10/30', 'Lubricant', 'Litre', '28.89', '44.90');

INSERT INTO `mypractical`.`sales_table` (`slsID`, `custID`, `slsType`, `slsOrdDate`, `slsShipDate`) 
VALUES 
('21001', '10002', 'Credit', '12/08/2016', '16/08/2016'),
('21002', '10001', 'Credit', '13/08/2016', '22/08/2016'),
('31001', '10003', 'Cash', '16/082016', '23/08/2016');