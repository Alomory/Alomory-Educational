CREATE DATABASE XYZ_Professional_Training_Centre;
USE XYZ_Professional_Training_Centre;

CREATE TABLE Examination (
examid INT(5) PRIMARY KEY AUTO_INCREMENT,
examdesc VARCHAR(50) NOT NULL ,
certififiedby VARCHAR (40) DEFAULT NULL,
duration INT DEFAULT NULL
);
ALTER TABLE Examination AUTO_INCREMENT=10000;

-- inserting data to Examination table
INSERT INTO Examination (examid, examdesc, certififiedby, duration) VALUES 
(default,'Data Structure and Algorithm', 'MYSQL Organazations', 3),
(default,'Data Manipulation Language', 'Oracle Corporation', 5),
(default,'Web Based Design', 'W3C Corporation', 2),
(default,'MYSQL Fundamentals', 'MYSQL Organazations', 4),
(default,'Database Management', 'Oracle Corporation', 3);
-- =========================================================================================================

-- ------------------------------------------------------
CREATE TABLE Customer(
icno VARCHAR (15) PRIMARY KEY ,
name VARCHAR (50) NOT NULL ,
address VARCHAR (70) DEFAULT NULL,
city VARCHAR (30) DEFAULT NULL,
postcode INT(5) DEFAULT NULL,
State VARCHAR (30) DEFAULT NULL
);
-- inserting data to Customer table
INSERT INTO Customer (icno, name, address, city, postcode, State) VALUE
('890315-10-3278','Ruhaimie Osman','No. 1254 Taman Teluk','Paka',21300,'Terengganu'),
('845152-05-5412','Omar Alomroy','No. 2546 Taman Prajurit','Jeli',52300,'Putrajaya'),
('784958-12-7485','MD Akash Ali','No. 7845 Jalan Sepakat Indah 2 ','Bachok',32400,'Kelantan'),
('548524-13-2254','Shahdad Ahsan','University Malaysia Terengganu','Kuala Terengganu',21030,'Terengganu'),
('778458-02-7291','Moad Mohammed','No. 127 Jalan Kelawai Belle Vue','George Town',10350,'Pulau Pinang');
-- =========================================================================================================
-- -------------------------------------------------
CREATE TABLE AttendExam(
icno VARCHAR (15) NOT NULL,  -- FOREIGN KEY ON UPDATE CASCADE 
examid INT(5) NOT NULL , -- FOREIGN KEY ON UPDATE CASCADE 
examdate DATE NOT NULL , 
examtime TIME NOT NULL ,
result INT DEFAULT NULL,
certified CHAR(1) , -- CONSTRAINT CHECK ('Y','N')
CONSTRAINT fk_Attand_Exam_icno FOREIGN KEY (icno) REFERENCES Customer (icno) ON UPDATE CASCADE, -- 
CONSTRAINT fk_Attand_Exam_examid FOREIGN KEY (examid) REFERENCES Examination (examid) ON UPDATE CASCADE,
CONSTRAINT chk_Attand_Exam_certified CHECK(certified IN ('Y','N'))
);

-- inserting data to AttendExam table 
INSERT INTO AttendExam (icno, examid, examdate, examtime, result, certified) VALUES
('778458-02-7291',10001,'2022-10-20','09:30',85,'Y'), 
('845152-05-5412',10004,'2022-09-15','11:00',55,'N'),
('890315-10-3278',10002,'2022-08-31','08:30',90,'Y'), 
('784958-12-7485',10000,'2022-10-13','10:00',89,'Y'), 
('548524-13-2254',10003,'2022-10-16','09:30',52,'N'); 
-- =========================================================================================================
-- --------------------------------------------------------------
CREATE TABLE Invoice (
invoiceno INT (7) PRIMARY KEY AUTO_INCREMENT,
invoicedate DATE NOT NULL, 
icno  VARCHAR (15) NOT NULL , -- FOREIGN KEY ON UPDATE CASCADE CUSTOMER TABLE
pymttype INT(1) NOT NULL DEFAULT 1,  -- CHECK IF (1,2,3)  1 = CASH , 2 = CREDIT CARD  3 = MISC DEFULT IS 1
paidamount DECIMAL (9,2),
CONSTRAINT fk_Invoice_icno FOREIGN KEY (icno) REFERENCES Customer (icno) ON UPDATE CASCADE, 
CONSTRAINT chk_Invoice_pymttype CHECK (pymttype IN (1,2,3))
);
-- inserting data to Invoice table
INSERT INTO Invoice (invoiceno, invoicedate, icno, pymttype, paidamount) VALUES
(default,'2022-10-10' ,'778458-02-7291',2,3600), 
(default,'2022-08-21' ,'890315-10-3278',1,3000),
(default,'2022-10-06' ,'548524-13-2254',3,5000),
(default,'2022-10-03' ,'784958-12-7485',1,4050),
(default,'2022-09-05' ,'845152-05-5412',2,4100);
-- =========================================================================================================
-- inv 4 should have payment type 1
-- -------------------------------------
CREATE TABLE Training(
trainingid INT(5) PRIMARY KEY AUTO_INCREMENT,
trainingtype INT (1) NOT NULL, -- CHECK CONSTRAINT IF IN (1,2,3) 1 = Management  2 = Technical  3 = Support  DEFAULT 1 
trainingdesc VARCHAR (65) NOT NULL ,
duration INT (4) DEFAULT NULL,
trainingfees DECIMAL (9,2) DEFAULT NULL ,
provider VARCHAR (50) DEFAULT NULL,
examid INT (5) NOT NULL, -- FOREIGN KEY ON UPDATE CASCADE FROM Examination TABLE 
CONSTRAINT chk_Training_trainingtype CHECK (trainingtype IN(1,2,3)),
CONSTRAINT fk_Training_examid FOREIGN KEY(examid) REFERENCES Examination (examid) ON UPDATE CASCADE
);
-- inserting date to Training table
INSERT INTO Training (trainingid, trainingtype, trainingdesc, duration, trainingfees, provider,examid) VALUES
(default, 1, 'MySQL 8.0 for Database Administrators',3,2400, 'MYSQL',10000),
(default, 3, 'Data Manipulation, Organizing, Analyzing and Designing',7,3600, 'MYSQL',10003),
(default, 2, 'Creating Web Services Using Java(TM) Technology',3,3500, 'Oracle',10001),
(default, 3, 'Programming in HTML5 with JavaScript and CSS3',3,3800, 'HTML',10002),
(default, 2, 'Oracle Database : Performance Tuning',3,4500, 'Oracle',10004);
-- =========================================================================================================
-- ----------------------------------
CREATE TABLE InvoiceLine(
invoiceno INT(7) NOT NULL UNIQUE , -- FOREIGN KEY ON UPDATE CASCADE FROM INVOICE TABLE  BOTH ARE PRIMARY KEY
trainingid  INT (5) NOT NULL UNIQUE , -- FOREIGN KEY ON UPDATE CASCADE FROM TRAINING TABLE BOTH ARE PRIMARY KEY
quantity INT DEFAULT NULL,
totalamount DECIMAL (9,2) DEFAULT NULL,
CONSTRAINT pk_InvoiceLine_conbination PRIMARY KEY(invoiceno,trainingid) ,
CONSTRAINT fk_InvoiceLine_invoiceno FOREIGN KEY (invoiceno) REFERENCES Invoice (invoiceno) ON UPDATE CASCADE,
CONSTRAINT fk_InvoiceLine_trainingid FOREIGN KEY (trainingid) REFERENCES Training (trainingid) ON UPDATE CASCADE
);
-- inserting data to Invoiceline table
INSERT INTO Invoiceline (invoiceno, trainingid, quantity) VALUES
(1,1,3),
(2,3,2),
(3,5,5),
(4,2,3),
(5,4,3);

-- =========================================================================================================
-- This TRIGGER will calculate the total amount in InvoiceLine table the moment of insertion.
DELIMITER $$
CREATE TRIGGER bi_Invoiceline_trigger BEFORE INSERT 
ON Invoiceline 
FOR EACH ROW
BEGIN
 DECLARE fee_of_training double ;
 SET fee_of_training = (SELECT trainingfees FROM Training WHERE trainingid = NEW.trainingid);
	BEGIN 
		SET NEW.totalamount = (NEW.quantity * fee_of_training);
		END ;
END $$
DELIMITER ;
-- ===============================================================================================================



-- 1. Retrieve a list of training code, training description, training duration and fees.
		SELECT trainingid, trainingdesc, duration, trainingfees FROM Training;
-- ---------------------------------------------------------------------
-- 2. Retrieve customer ic number, name and city they live for customer from ‘Terengganu’ or ‘Kelantan’.
		SELECT icno, name, city FROM Customer WHERE State IN ('Terengganu','Kelantan');
-- =====================================================================================================
-- 3. Display the candidate ic number and the certification status who taking the examination.
		SELECT icno, certified  FROM AttendExam;
        SELECT icno, certified, examdesc FROM AttendExam INNER JOIN Examination ON Examination.examid = AttendExam.examid
        WHERE certified = 'Y';
        -- ===============================================================================================================
-- 4. Retrieve examination code, description and duration for examination which the certification is comes from ‘Oracle Corporation’.
		SELECT examid, examdesc, duration FROM Examination WHERE certififiedby = 'Oracle Corporation';
-- ============================================================================================================================
-- 5. Display invoice information where the customer pay the invoice amount greater than RM4000.00.
	  SELECT 
      invoiceno AS 'Invoice No',
      invoicedate AS 'Date',
      icno AS 'IC No',
      CASE pymttype WHEN 1 THEN 'Cash' WHEN 2 THEN 'Credit Card' ELSE 'Misc' END AS 'Payment Type',
      paidamount AS 'Paid Amount' 
      FROM Invoice WHERE paidamount > 4000;
	-- ==================================================================================================================
-- 6. Modify the duration for examination code 10004 from 3 hours to 4 hours.
SELECT * FROM Examination; -- CHECKING BEFORE MODIFICATION AND AFTER --
UPDATE Examination SET  duration = 4 WHERE examid = 10004;
-- ========================================================================================================================
-- 7. Display a record for ic number, examination code, date of examination and time of examination. 
--    Your output must be sort out based on the latest date of examination.
	  SELECT icno,examid, examdate , examtime FROM attendExam ORDER BY examdate DESC;
-- =========================================================================================================================
-- 8. The ic number for Ruhaimie Osman is wrongly key-in as 890315-10-3278. Perform the query to retreive 
--    ic number and name from customer. Subsequently, and retrieve ic number from invoice table. 
--    Verify the ic number for both tables. Write a SQL statement to change the ic number to 890315-10-3288. 
--    Verify whether change occurs in invoice table. Justify your answer.      -- need to justify the answer ------------????
	SELECT customer.name, 
    customer.icno AS 'Customer ICNo',
    invoice.icno AS 'Invoice ICNo'
    FROM customer INNER JOIN invoice ON customer.icno = invoice.icno;
    UPDATE customer  SET customer.icno = '890315-10-3288' WHERE name = 'Ruhaimie Osman';
    
-- =========================================================================================================================
-- 9. Perform the query to verify the payment type for inoive 4 is 1 (Cash). Then, make a changes for type of payment for 
--    this invoice from Cash = 1 to Misc = 3. Your answer should include original record, SQL statement to modify payment type and, 
--    finally display invoice information in order to ascertain that the modification has been done accordingly.
	
    SELECT * FROM invoice WHERE invoiceno = 4; -- orginal before modification
	SELECT * FROM invoice;  -- orginal records
    UPDATE invoice SET pymttype = 3 WHERE invoiceno = 4;
    SELECT * FROM invoice WHERE invoiceno = 4; -- after modification
	SELECT * FROM invoice;  --  records after modification
-- =========================================================================================================================
-- 10. Retrieve details about the examination information where the records sorted by certification 
--     provider as an ascending order, followed by duration as descending order.
		SELECT * FROM examination ORDER BY certififiedby ASC  , duration DESC;
		-- TOMORROW -- 😴

-- =========================================================================================================================

-- ADDITIONAL NOTES : Your answer should include SQL query syntax and the print screen of the output. -- 


-- =================================================================
-- Playing around in the database 😁 - --------------------------------
SELECT 
Customer.name,
Invoice.paidamount, 
InvoiceLine.quantity, 
InvoiceLine.totalamount ,
(totalamount - paidamount ) as remaining
FROM Invoice 
INNER JOIN Customer ON Customer.icno = Invoice.icno
INNER JOIN InvoiceLine ON InvoiceLine.invoiceno = Invoice.invoiceno;