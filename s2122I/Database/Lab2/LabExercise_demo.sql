
DROP DATABASE ABC_Banking;
CREATE DATABASE ABC_Banking;
USE abc_banking;



-- ---------------------------------------------------------
-- CUSTOMERS TABLE
CREATE TABLE customer (
  custICNo int NOT NULL,
  custName varchar(255) NOT NULL,
  custAddr varchar(255) DEFAULT NULL,
  custTown varchar(50) DEFAULT NULL,
  custSate varchar(50) DEFAULT NULL,
  custPostCode int DEFAULT NULL,
  hpNo char(10) DEFAULT NULL,
  custEmail varchar(255) DEFAULT NULL,
  custStatus varchar(6) DEFAULT 'New',
  PRIMARY KEY (custICNo),
  CONSTRAINT customer CHECK ((custStatus ='New' OR custStatus = 'Active'))
) ;

-- -------------------------------------
-- BRANCHE TABLE 
CREATE TABLE branch (
  brID int NOT NULL,
  brName varchar(50) DEFAULT NULL,
  brCity varchar(50) DEFAULT NULL,
  brManager varchar(255) DEFAULT NULL,
  PRIMARY KEY (brID)
);
-- -----------------------------------------------------------

-- -------------------------------------------------------------
-- ACCOUNT TABLE
CREATE TABLE custaccount (
  accNo int NOT NULL,
  custICNo int NOT NULL ,
  brID int NOT NULL,
  balance decimal(11,2) DEFAULT NULL,
  registerDate date DEFAULT NULL,
  PRIMARY KEY (accNo,custICNo),
  CONSTRAINT fk_brID  FOREIGN KEY (brID) REFERENCES branch (brID),
  CONSTRAINT fk_custICNo FOREIGN KEY (custICNo) REFERENCES customer (custICNo)
);
drop table custaccount;
TRUNCATE TABLE custaccount;
-- ----------------------------------------------------------
-- TRANSACTIONS TABLE 

CREATE TABLE custtransaction (
  tranID int AUTO_INCREMENT,
  accNo int NOT NULL,
  custICNo int  NOT NULL  ,
  tranDate date DEFAULT NULL,
  tranTime time DEFAULT NULL,
  tranType varchar(10) NOT NULL,
  tranAmount decimal(11,2) NOT NULL,
  PRIMARY KEY (tranID),
  CONSTRAINT fk_tran_accNo FOREIGN KEY (accNo,custICNo) REFERENCES custaccount (accNo,custICNo), 
 --  CONSTRAINT fk_tran_custICNo FOREIGN KEY (custICNo) REFERENCES custaccount (custICNo),
  CONSTRAINT ck_tran_Type CHECK ((tranType in ('Deposit','Withdrawal')))
--   CONSTRAINT CHECK (accNo = custaccount.accNo AND custICNo = custaccount.custICNo)
);
desc custtransaction;
TRUNCATE TABLE custtransaction;
DROP TABLE custtransaction;
-- ----------------------------------------------------------------------------------------
-- LOANS TABLE 

CREATE TABLE loan (
  loanID int NOT NULL,
  custICNo int NOT NULL,
  loanType varchar(255) DEFAULT NULL,
  brID int NOT NULL,
  loanAmount decimal(9,2) DEFAULT NULL,
  loanStatus varchar(10) DEFAULT 'Apply',
  PRIMARY KEY (loanID),
 --  KEY brID (brID),
--   KEY custICNo (custICNo),
  CONSTRAINT fk_loan_brID  FOREIGN KEY (brID) REFERENCES branch (brID),
  CONSTRAINT fk_loan_custICNo  FOREIGN KEY (custICNo) REFERENCES customer (custICNo)
);
DROP TABLE loan;



-- -----------------------------------------------
-- TRIGGERS TABLE 

delimiter $$
CREATE TRIGGER tran_trigger AFTER INSERT
 ON ABC_Banking.custtransaction 
for each row
 BEGIN
	IF (new.tranType = 'Deposit') THEN
		UPDATE custAccount SET balance = balance + new.tranAmount WHERE ABC_Banking.custaccount.accNo = new.accNo;
	ELSE IF (new.tranType = 'Withdrawal') THEN
		UPDATE custAccount SET balance = balance - new.tranAmount WHERE abc_banking.custaccount.accNo = new.accNo;
	ELSE
		UPDATE custTransaction SET new.tranAmount = 0;
	END IF;
    END IF;
 END $$
 delimiter ;
 desc tran_trigger;
 
 drop trigger tran_trigger;
 
 
 -- ----------------------------------------
 
 -- NOTES AREA ---------- 
 
--  CONSTRAINT `bad`
--     FOREIGN KEY (`bad`)
--     REFERENCES `abc_banking`.`branch` (`brName`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION);

-- -------------------------