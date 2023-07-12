CREATE DATABASE abc_automart;
USE abc_automart;


-- SECOND TO EXCUTE 
CREATE TABLE Salesman(
slsid INT(5) PRIMARY KEY AUTO_INCREMENT,
slsname VARCHAR(50) NOT NULL,
slsdob DATE DEFAULT (now()),
slsbranch INT(3) NOT NULL, -- FOREIGN KEY REFER TO BRANCH TABLE ON UPDATE CASCADE
CONSTRAINT fk_Salesman_slsbranch FOREIGN KEY (slsbranch) REFERENCES Branch (brncode)
);
ALTER TABLE Salesman  AUTO_INCREMENT =2001;
INSERT INTO Salesman ( slsname, slsdob, slsbranch) VALUES 
( 'Omar Alomory', '1998-01-01' , 110),
( 'Hazim Mohammed', '1990-02-14',129),
( 'MD Akash Ali', '1985-03-21',112),
( 'Mohd Shafiq', '1999-02-22',113),
( 'Gary Lim', '2000-03-03',113),
( 'Danial Montaser', '1997-04-18',116),
( 'Shahdad Ali', '1987-05-25',116),
( 'Ali Amar', '1988-06-05',121),
( 'Najmuldin Saleh', '1988-07-20',125),
( 'Ajmal Mahdi', '1996-08-01',122),
( 'Nancy Thompson', '1998-08-01',126),
( 'Syafiah Adnan', '1989-08-01',127),
( 'Shafiq VapeShop', '1993-08-01',128);

-- MUST INCLUDE SALESMAN NAME START WITH 'Mohd'
-- MUST INCLUDE SALESMAN NAME  'Fairuz Nasaruddin'
-- slsid FORMAT IS '2007'


-- THIRD TO EXCUTE
CREATE TABLE Sales (
sreference INT(8) PRIMARY KEY NOT NULL AUTO_INCREMENT,-- STARTS FROM 900000
sdate DATE NOT NULL,
sAmount DECIMAL(9,2),
slsid INT(5) NOT NULL,
CONSTRAINT fk_Sales_slsid FOREIGN KEY(slsid) REFERENCES Salesman (slsid)
);
ALTER TABLE Sales AUTO_INCREMENT = 900001;

INSERT INTO Sales ( sdate, sAmount,slsid) VALUES 
( '2018-01-01', 100000, 2001),
( '2017-02-15', 90000, 2009),
( '2016-03-31', 80000, 2010),
( '2015-11-28', 70000, 2012),
( '2019-05-31', 60000, 2013),
( '2018-06-30', 50000, 2001),
( '2017-07-31', 110000, 2002),
( '2016-08-31', 120000, 2003),
( '2015-09-30', 100000, 2004),
( '2019-10-31', 90000, 2005),
( '2018-11-30', 80000, 2006),
( '2017-12-31', 70000, 2007),
( '2016-01-31', 60000, 2008),
( '2015-11-28', 110000, 2009),
( '2019-03-31', 120000, 2009),
( '2018-04-30', 100000, 2010),
( '2017-05-31', 90000, 2011),
( '2016-06-30', 80000, 2012),
( '2015-07-31', 70000, 2013);
-- MUST HAVE SELLING PRICE GREATER THAN 75K
-- MUST HAVE SELLING PRICE AS '900006'
-- MUST INCLUDE DATE HAVE december and 28 November 2015


-- FIRST TO EXCUTE 
CREATE TABLE Branch (
brncode INT (3) PRIMARY KEY ,
brnname VARCHAR(50) NOT NULL,
brncity VARCHAR(30),
brnstate VARCHAR(30)
);
insert into Branch (brncode, brnname, brncity, brnstate) VALUES
(110, 'Kuala Lumpur Main Branch', 'Kuala Lumpur', 'Kuala Lumpur'),
(111, 'Kuala Lumpur East Branch', 'Kuala Lumpur', 'Kuala Lumpur'),
(112, 'Kuala Lumpur West Branch', 'Kuala Lumpur', 'Kuala Lumpur'),
(113, 'Johor Bahru Central Branch', 'Johor Bahru', 'Johor'),
(116, 'Penang Island Branch', 'Penang', 'Penang'),
(121, 'Kuching South Branch', 'Kuching', 'Sarawak'),
(122, 'Ipoh Mian Branch', 'Ipoh', 'Perak'),
(125, 'Kota Kinabalu Central Branch', 'Kota Kinabalu', 'Sabah'),
(126, 'Kota Kinabalu North Branch', 'Kota Kinabalu', 'Sabah'),
(127, 'Kota Kinabalu South Branch', 'Kota Kinabalu', 'Sabah'),
(128, 'Shah Alam Central Branch', 'Shah Alam', 'Selangor'),
(129, 'Shah Alam North Branch', 'Shah Alam', 'Selangor');
-- MUST INCLUDE KL STATE
-- MUST INCLUDE NAME START WITH LETTER 'K'
-- brncode FORMAT '112'


-- ------------------------------------------------------------------------------------------------------------
-- Retrieve a list of sales reference, selling date and selling price for any sales created in the 
-- system on 28 November 2015 and the selling price is greater than RM75K. 

SELECT sreference, sdate , sAmount FROM Sales WHERE sdate = "2015-11-28" AND sAmount >75000;

-- ------------------------------------------------------------------------------------------------------------
--  Create a new table KLBranch and include all branch information except state for all Kuala 
-- Lumpur’s branch. Verify the table created contains Kuala Lumpur’s branch records.
CREATE TABLE  KLBranch AS
SELECT * FROM Branch WHERE brnState = "Kuala Lumpur";
SELECT * FROM KLBranch;
-- ------------------------------------------------------------------------------------------------------------
-- Create a new index known as salesman_slsname_ind to improve the performance when 
-- retrieving specific salesman.
CREATE INDEX salesman_slsname_ind ON Salesman(slsname, slsdob);
SHOW INDEXES FROM Salesman;

-- ------------------------------------------------------------------------------------------------------------
-- 4.  ABC AutoMart Sdn Bhd top management wants to provide sales information to all salesman 
	-- across Malaysia without exposing the sales reference number and sales amount for each 
	-- sale. As a Database Administrator (DBA), you are requested to complete this task.
CREATE VIEW Sales_Information AS SELECT sdate, slsid FROM Sales;
SELECT * from Sales_information;

-- i thought the task require more 😊😊😊😊
-- CREATE VIEW SELECT sm.slsname AS "Name", sm.slsdob AS "Birth Of Date",s.sdate AS "Selling Date", s.sAmount AS "Sold Amount"
-- FROM Salesman AS sm INNER JOIN Sales AS s ON s.slsid = sm.slsid;
-- ------------------------------------------------------------------------------------------------------------
-- Display salesman id, name and their branch for the name contain ‘Mohd’
SELECT slsid, slsname, slsbranch FROM Salesman WHERE slsname LIKE '%Mohd%';
-- ------------------------------------------------------------------------------------------------------------
-- Display branch code, name and city for city which the first character for city begin with 
-- alphabet ‘K’.
SELECT brncode, brnname, brncity FROM Branch WHERE brncity LIKE "K%";
-- ------------------------------------------------------------------------------------------------------------
-- Modify the saleman name to ‘Fairuz Nasaruddin’ for salesman id = 2007 and from branch 
-- 112. It was Shahdad something 
SELECT * FROM Salesman;
UPDATE  Salesman SET slsname ="Fairuz Nasaruddin" WHERE slsid = 2007;
-- ------------------------------------------------------------------------------------------------------------
--  Create a user user04 with password ‘u04@ser’. Grant the SELECT role to this user to view 
-- sales table.
CREATE USER 'user04'@'localhost' IDENTIFIED BY 'U04@ser';
GRANT SELECT ON abc_automart.sales TO 'user04'@'localhost';
-- ------------------------------------------------------------------------------------------------------------
-- Using user id user04, retrieve sales information. Try to update selling price for sales on 
-- 900006 to RM55K. What is the output when you try to do this transaction? Justify your 
-- answer.
UPDATE Sales SET sAmount = 55000 WHERE sAmount =90000;

-- ------------------------------------------------------------------------------------------------------------
-- 10. Retrieve sales reference number, selling date and selling price for selling that occur on 
-- December. [Hint: use like operator]
SELECT sreference, sdate, sAmount
FROM sales
WHERE MONTH(sdate) = 12

 