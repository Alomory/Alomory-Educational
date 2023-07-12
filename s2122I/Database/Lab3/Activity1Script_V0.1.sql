CREATE DATABASE xyz_freight_forwarding;
USE xyz_freight_forwarding;

-- ------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE customer (
cust_number CHAR(6) NOT NULL,
cust_name VARCHAR (255) NOT NULL,
addr VARCHAR (255),
city VARCHAR (20),
state VARCHAR (20),
postcode INT(5),
contact_no INT,
CONSTRAINT pk_customer PRIMARY KEY(cust_number)
);

-- inserting values to customer table 
INSERT INTO customer (cust_number, cust_name, addr, city, state, postcode, contact_no) VALUES 
('C10001', 'OMAR', 'UMT', 'Kuala Terengganu', 'Terengganu', 21030, 0182850579),
('C10002', 'AZIM', 'AH Building, 30st, Johor', 'Johor baru', 'Johor', 32541, 0124587998),
('C10003', 'GARY', 'YET Building, MOH st, ', 'Kuala Terengganu', 'Terengganu', 54245, 0125484787),
('C10004', 'AFIQ', 'UMT', 'Kuala Terengganu', 'Terengganu', 21030, 0177778451),
('C10005', 'HAZIM', 'UMT', 'Kuala Terengganu', 'Terengganu', 21030, 0178784541);
-- ------------------------------------------------------------------------------------------------------------------------------


CREATE TABLE product(
prod_code CHAR(7) NOT NULL,
prod_desc VARCHAR (255),
unit VARCHAR(50),
sales_price DECIMAL (11,2) DEFAULT 0.00,
CONSTRAINT pk_product PRIMARY KEY(prod_code) 
);

-- inserting vlaues , product table 
INSERT INTO product (prod_code, prod_desc, unit, sales_price) VALUES 
 ('HG-5451', 'Bosch 10KG Washing Machine', 'Box', 4000),
 ('SM-5289', 'Samsung Galaxy Note 20 Ultra', 'Box', 3500),
 ('HG-6254', 'Bosch 1.6 gallon Vacuum Bare Tool', 'Box', 1338.56),
 ('BS-7548', 'Beats Studio Buds', 'Box', 830.50) ,
 ('AW-1001', 'TV LCD 4 inch', 'Box', 4419.52);
-- ------------------------------------------------------------------------------------------------------------------------------


-- ------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE invoice(
inv_number INT NOT NULL,
inv_date DATE DEFAULT (now()),
cust_number CHAR(6) NOT NULL,
inv_amount DECIMAL (11,2) DEFAULT 0.00 ,
shipped_by VARCHAR(255),
ship_tracking_no VARCHAR(50) NOT NULL,
CONSTRAINT pk_invoice PRIMARY KEY(inv_number),
CONSTRAINT fk_invoice FOREIGN KEY(cust_number) REFERENCES customer(cust_number)
);

-- inserting values to invoice table 
INSERT INTO invoice (inv_number, inv_date, cust_number, inv_amount, shipped_by, ship_tracking_no) VALUES 
 (10001, '2016-04-28', 'C10004', 1500, 'JTExpress', 'MY021512155'),
 (10002, '2016-08-23', 'C10003', 2000, 'Pos Laju', 'TU154545484'),
 (10003, '2017-09-15', 'C10002', 5000, 'GDex', 'GD021545445'),
 (10004, '2017-12-20', 'C10005', 1000.25, 'JTExpress', 'MY056984515'),
 (10005, '2018-05-15', 'C10001', 1650.50, 'GDex', 'GD115262655');
-- -------------------------------------------------------------------------------------------------------------------------------- ------------------------------------------------------------------------------------------------------------------------------


CREATE TABLE invoice_line(
inv_number INT NOT NULL,
prod_code CHAR(7) NOT NULL,
quantity INT NOT NULL,
sales_price DECIMAL (11,2) DEFAULT 0.00,
total_sales DECIMAL (11,2) DEFAULT 0.00,
CONSTRAINT pk_invoice_line PRIMARY KEY(inv_number,prod_code),
CONSTRAINT fk_invoice_line_invNumber FOREIGN KEY(inv_number) REFERENCES invoice(inv_number),
CONSTRAINT fk_invoice_line_proCode FOREIGN KEY(prod_code) REFERENCES product(prod_code) ON UPDATE CASCADE
);

-- Inserting values to invoice_line table
INSERT INTO invoice_line (inv_number, prod_code, quantity, sales_price) VALUES 
(10001,'HG-5451',2,4000),
(10002,'BS-7548',3,830.50),
(10003, 'SM-5289',1,3500),
(10004,'AW-1001',2,4419.52),
(10005,'HG-6254',2,1338.56);
-- ------------------------------------------------------------------------------------------------------------------------------

-- ---------------------------------------------------------
-- TRIGGERS TABLES 
-- ---------------------------------------------------------
DELIMITER $$
CREATE TRIGGER total_price_an_trigger BEFORE INSERT 
ON invoice_line 
FOR EACH ROW
BEGIN 
 SET NEW.total_sales = (NEW.quantity*NEW.sales_price)  ;
END $$
DELIMITER ;
-- DROP TRIGGER total_price_an_trigger;
 SHOW TRIGGERS;


-- -----------------------------------------------------------------
-- TASK 3 
INSERT INTO customer (cust_number, cust_name, state) VALUES 
('C10006','Abdul Rauf Osman','Selangor');
-- DELETE FROM customer WHERE cust_number = 'C10006'; 


