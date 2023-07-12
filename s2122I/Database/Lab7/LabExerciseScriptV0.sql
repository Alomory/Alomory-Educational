DROP DATABASE IF EXISTS inventory_transactions_system;
CREATE DATABASE inventory_transactions_system;

USE inventory_transactions_system;

CREATE TABLE lab7itemMaster (
item_code VARCHAR(35) PRIMARY KEY,
itemdesc VARCHAR(60) ,
unit VARCHAR(15),
stock_on_hand INT(11),
stock_on_order INT(11),
stock_block INT(11)
);

CREATE TABLE lab7supplier(
supplier_no INT(4) PRIMARY KEY AUTO_INCREMENT,
supplier_name VARCHAR(50)
);
ALTER TABLE lab7supplier AUTO_INCREMENT = 1000;

CREATE TABLE lab7transactionType(
trx_type VARCHAR(5) PRIMARY KEY,
trx_desc VARCHAR(50)
);


CREATE TABLE lab7productionOrder(
prod_order_no INT (6) PRIMARY KEY AUTO_INCREMENT,
order_date DATE,
factory_id VARCHAR(10),
production_line INT(11),
order_status VARCHAR(15) CHECK (order_status IN('NEW','WIP','DELIVERED')),
item_code VARCHAR(35) , -- FOREIGN KEY FOR ITEM TABLE 
quantity INT(11),
created_by VARCHAR(30),
FOREIGN KEY (item_code) REFERENCES lab7itemMaster (item_code)
);
ALTER TABLE lab7productionOrder AUTO_INCREMENT = 300000;


CREATE TABLE lab7replenishmentOrder(
rep_order_no INT(6) PRIMARY KEY AUTO_INCREMENT,
order_date DATE,
supplier_no INT(4), -- IT WOULD BE A FOREIGN KEY FOR SUPPLIER TABLE
delivery_date DATE,
item_code VARCHAR(35), -- FOREIGN KEY FOR ITEM_MASTER TABLE
quantity INT(11),
created_by VARCHAR(30),
FOREIGN KEY (supplier_no) REFERENCES lab7supplier(supplier_no),
FOREIGN KEY (item_code) REFERENCES lab7itemMaster(item_code)
);
ALTER TABLE lab7replenishmentOrder AUTO_INCREMENT = 400000;

CREATE TABLE lab7inventoryTransaction(
trx_no INT(6) PRIMARY KEY AUTO_INCREMENT,
trx_type VARCHAR(5), -- FOREIGN KEY
trx_ref_no INT(6) , -- FOREIGN KEY,
rep_order_no INT(6),
trx_date DATE,
item_code VARCHAR(35),-- FOREIGN KEY
quantity VARCHAR(35) ,
created_by VARCHAR(30),
FOREIGN KEY(rep_order_no) REFERENCES lab7replenishmentOrder(rep_order_no),
FOREIGN KEY(trx_type) REFERENCES lab7transactionType(trx_type),
FOREIGN KEY (trx_ref_no) REFERENCES lab7productionOrder(prod_order_no),
FOREIGN KEY (item_code) REFERENCES lab7itemMaster(item_code)
);

ALTER TABLE lab7inventoryTransaction AUTO_INCREMENT = 100000;

