/*
Create a table based on output from 3NF normalisation and apply all business rules stated in
the requirements, and referential integrity for related entities.
*/

CREATE DATABASE order_management_system;
USE order_management_system;
-- --------------------------------------------------------------------------------------------
-- CUSTOMER TABLE
CREATE TABLE customer(
custcode VARCHAR(15),
custname VARCHAR(45),
custaddr VARCHAR(80),
postcode INT (5),
city VARCHAR(35),
state VARCHAR(35),
hpno VARCHAR(35),
email VARCHAR(35),
CONSTRAINT pk_customer_custcode PRIMARY KEY(custcode)
);
-- --------------------------------------------------------------------------------------------
-- SALESMAN TABLE
CREATE TABLE salesman(
salesmanid VARCHAR(15),
salesmanname VARCHAR(45),
CONSTRAINT pk_salesman_salesmanid PRIMARY KEY(salesmanid)
);
-- --------------------------------------------------------------------------------------------
-- ITEM TABLE
CREATE TABLE item (
itemcode VARCHAR(35),
itemdesc VARCHAR(60),
itemunit VARCHAR(20),
sellingprice DECIMAL(9,2),
CONSTRAINT pk_item_itemcode PRIMARY KEY(itemcode)
);
-- --------------------------------------------------------------------------------------------
-- ORDER TABLE
CREATE TABLE orders (
orderno INT (10),
ordertype VARCHAR(30),
orderdate DATE,
deliverydate DATE ,
custcode VARCHAR(15),
salesmanid VARCHAR(15),
CONSTRAINT pk_order_orderno PRIMARY KEY(orderno),
CONSTRAINT fk_order_custcode FOREIGN KEY(custcode) REFERENCES customer (custcode) ON UPDATE CASCADE,
CONSTRAINT fk_order_salesmanid FOREIGN KEY (salesmanid) REFERENCES salesman(salesmanid) ON UPDATE CASCADE,
CONSTRAINT ck_order_ordertype CHECK (ordertype IN ('Company Order', 'Individual Order'))
);
-- --------------------------------------------------------------------------------------------
-- ORDER_ITEM TABLE 
CREATE TABLE order_item(
orderno INT(10),
itemcode VARCHAR(35),
orderqty INT,
amount DECIMAL(9,2),
CONSTRAINT pk_order_item_both PRIMARY KEY(orderno, itemcode),
CONSTRAINT fk_order_item_orderno FOREIGN KEY (orderno) REFERENCES orders(orderno) ON UPDATE CASCADE,
CONSTRAINT fk_order_item_itemcode FOREIGN KEY(itemcode) REFERENCES item(itemcode) ON UPDATE CASCADE
);
-- --------------------------------------------------------------------------------------------
