
DROP DATABASE ABC_Banking;
CREATE DATABASE ABC_Banking;
USE abc_banking;



-- ---------------------------------------------------------
-- CUSTOMERS TABLE
CREATE TABLE customer (
  custICNo int NOT NULL,
  custName varchar(255) NOT NULL,
  custAddr varchar(255) NOT NULL,
  custTown varchar(50) DEFAULT NULL,
  custState varchar(50) DEFAULT NULL,
  custPostCode int DEFAULT NULL,
  hpNo char(10) NOT NULL,
  custEmail varchar(255) NOT NULL,
  custStatus varchar(6) DEFAULT 'New',
  PRIMARY KEY (custICNo),
  CONSTRAINT customer CHECK ((custStatus ='New' OR custStatus = 'Active'))
) ;

INSERT INTO customer (custICNo, custName, custAddr, custTown, custState, custPostCode, hpNo, custEmail) VALUES
(12001, 'Omar Alomory', 'Terengganu,UMT B2 201 5 1', 'Kuala Nerus', 'Terengganu', 21300, 0182850579, 'Komar112011@gmail.com'),
(12002, 'Ahmed Mohemmed', 'Jalan Melor, Bandar Bukit Beruntung', 'Selangor', 'Kuala Lampur', 48300, 0164957822, 'Ahmed98@gmail.com'),
(12003, 'Gary Lim', 'Jalan Jelatek, Kementah', 'Kuala Lumpur', 'Kuala Lampur', 54200, 0124876245, 'GLim_ary@gmail.com'),
('12004', 'Hazim Hafizuldin', 'Taman Desa Skudai', 'Johor Bahru', 'Johor', '81300', '0144785685', 'HafizHaz2000@gmail.com');
INSERT INTO customer (custICNo, custName, custAddr, custTown, custState, custPostCode, hpNo, custEmail, custStatus) VALUES
 (12001, 'Omar Alomory', 'testing', 'testing ', 'test', 1215, 15454, 'random@eamil.com',DEFAULT);
-- -------------------------------------
-- BRANCHE TABLE 
CREATE TABLE branch (
  brID int NOT NULL,
  brName varchar(50) NOT NULL,
  brCity varchar(50) NOT NULL,
  brManager varchar(255) DEFAULT NULL,
  PRIMARY KEY (brID)
);
INSERT INTO branch (brID, brName, brCity, brManager) VALUES 
(1001, 'Terengganu branch', 'Terengganu', 'Ali Omar'),
(1002, 'Kuala Lampur branch', 'Kuala Lampur', 'MD Akash Ali'),
(1003, 'Kelantan branch', 'Kelantan', 'MD Shahdad');

-- -----------------------------------------------------------

-- -------------------------------------------------------------
-- ACCOUNT TABLE
CREATE TABLE cust_account (
  accNo INT NOT NULL,
  custICNo INT NOT NULL ,
  brID int NOT NULL,
  balance DECIMAL(11,2) NOT NULL CHECK(balance > 200),
  registerDate DATE DEFAULT (now()),
  PRIMARY KEY (accNo,custICNo),
  CONSTRAINT fk_brID  FOREIGN KEY (brID) REFERENCES branch (brID),
  CONSTRAINT fk_custICNo FOREIGN KEY (custICNo) REFERENCES customer (custICNo)
);
INSERT INTO cust_account (accNo, custICNo, brID, balance) VALUES 
(123001, 12001, 1001, 15000),
(123002, 12004, 1003, 10000);
-- ----------------------------------------------------------
-- TRANSACTIONS TABLE 

CREATE TABLE cust_transaction (
  tranID INT AUTO_INCREMENT,
  accNo INT NOT NULL,
  custICNo INT  NOT NULL  ,
  tranDate DATE DEFAULT (NOW()),
  tranTime TIME DEFAULT (NOW()),
  tranType VARCHAR(10) NOT NULL,
  tranAmount DECIMAL(11,2) NOT NULL,
  PRIMARY KEY (tranID),
  CONSTRAINT fk_tran_accNo FOREIGN KEY (accNo,custICNo) REFERENCES cust_account (accNo,custICNo), 
  CONSTRAINT ck_tran_Type CHECK ((tranType in ('Deposit','Withdrawal')))
);

INSERT INTO cust_transaction (accNo, custICNo, tranType, tranAmount) VALUES
 (123002, 12004, 'Withdrawal', 2500);
INSERT INTO cust_transaction (accNo, custICNo, tranType, tranAmount) VALUES
 (123001, 12001, 'Deposit', 2500);
-- ----------------------------------------------------------------------------------------
-- LOANS TABLE 

CREATE TABLE loan (
  loanID int NOT NULL,
  custICNo int NOT NULL,
  loanType varchar(255) DEFAULT NULL,
  brID int NOT NULL,
  loanAmount decimal(9,2) DEFAULT NULL,
  loanStatus varchar(10) DEFAULT Null,
  PRIMARY KEY (loanID),
  CONSTRAINT fk_loan_brID  FOREIGN KEY (brID) REFERENCES branch (brID),
  CONSTRAINT fk_loan_custICNo  FOREIGN KEY (custICNo) REFERENCES customer (custICNo)
);
INSERT INTO loan (loanID, custICNo, loanType, brID, loanAmount) VALUES
 (12341, 12001, 'Personal loan', 1001, 150000);
 INSERT INTO loan (loanID, custICNo, loanType, brID, loanAmount) VALUES
 (12342, 12003, 'Housing loan', 1001, 10000);
-- -----------------------------------------------
-- TRIGGERS TABLE customer_table

 -- The amount of balance with automatically updated upon customer perform transactions
 -- ( Withdrawal, Deposit )
delimiter $$
CREATE TRIGGER tran_trigger AFTER INSERT
 ON ABC_Banking.cust_transaction 
for each row
 BEGIN
	IF (new.tranType = 'Deposit') THEN
		UPDATE cust_Account SET balance = balance + new.tranAmount WHERE ABC_Banking.cust_account.accNo = new.accNo;
	ELSE IF (new.tranType = 'Withdrawal') THEN
		UPDATE cust_Account SET balance = balance - new.tranAmount WHERE abc_banking.cust_account.accNo = new.accNo;
	ELSE
		UPDATE cust_Transaction SET new.tranAmount = 0;
	END IF;
    END IF;
 END $$
 delimiter ;
 desc tran_trigger;
 drop trigger tran_trigger;
 -- ---------------------------------------------------------------
 -- customer status as ‘New’ when upon completing the registration process.
 -- this trigger will change it to active
 delimiter $$
CREATE TRIGGER customer_status_trigger AFTER INSERT
 ON ABC_Banking.cust_account 
for each row
 BEGIN
	UPDATE  customer set custStatus = 'Active' WHERE ABC_Banking.customer.custICNo = NEW.custICNo;
 END $$
 delimiter ;
 DROP TRIGGER customer_status_trigger;
 -- ----------------------------------------
 
 -- CHECK CUSTOMER STATUS TO APPLY for A LOAN: if customer already have bank account their loan 
-- status will be default apply otherwise default invalid which indicates that they did not open 
-- bank account yet
  delimiter $$
CREATE TRIGGER customer_Apply_trigger BEFORE INSERT
 ON ABC_Banking.loan 
for each row
 BEGIN
	IF (NEW.custICNo = (SELECT custICNo FROM abc_banking.customer WHERE custStatus = 'Active' LIMIT 1)) THEN 
		set NEW.loanStatus = 'Apply' ;
    ELSE 
		 set NEW.loanStatus = 'Invalid'  ;
END IF;
 END $$
 delimiter ;
 DROP TRIGGER customer_Apply_trigger;
 