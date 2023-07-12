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

INSERT INTO lab7itemMaster (item_code, itemdesc, unit, stock_on_hand, stock_on_order, stock_block) VALUES 
('EC200PV', 'Electric Cooker 200PV', 'each', 30, 10, 2),
('FR300PV', 'Fridge 300PV', 'each', 40, 15, 3),
('MW400PV', 'Microwave 400PV', 'each', 35, 12, 5),
('AC500PV', 'Air Conditioner 500PV', 'each', 25, 8, 1),
('WT600PV', 'Washing Machine 600PV', 'each', 20, 5, 0);


CREATE TABLE lab7supplier(
supplier_no INT(4) PRIMARY KEY AUTO_INCREMENT,
supplier_name VARCHAR(50)
);
ALTER TABLE lab7supplier AUTO_INCREMENT = 1000;

INSERT INTO lab7supplier (supplier_no, supplier_name) VALUES 
(DEFAULT, 'XYZ Suppliers'),
(DEFAULT, 'LMN Suppliers'),
(DEFAULT, 'DEF Suppliers'),
(DEFAULT, 'GHI Suppliers'),
(DEFAULT, 'JKL Suppliers');


CREATE TABLE lab7transactionType(
trx_type VARCHAR(5) PRIMARY KEY,
trx_desc VARCHAR(50)
);

INSERT INTO lab7transactionType (trx_type, trx_desc) VALUES 
('TRX2', 'Production Order'),
('TRX3', 'Inventory Adjustment'),
('TRX4', 'Receiving'),
('TRX5', 'Shipping'),
('TRX6', 'Stock Transfer');


CREATE TABLE lab7productionOrder(
prod_order_no INT (6) PRIMARY KEY AUTO_INCREMENT,
order_date DATE,
factory_id VARCHAR(10),
production_line INT(11),
order_status VARCHAR(15) CHECK (order_status IN('NEW','WIP','DELIVERED')),
item_code VARCHAR(35) ,
quantity INT(11),
created_by VARCHAR(30),
FOREIGN KEY (item_code) REFERENCES lab7itemMaster (item_code) ON UPDATE CASCADE
);
ALTER TABLE lab7productionOrder AUTO_INCREMENT = 300000;

INSERT INTO lab7productionOrder 
(prod_order_no, order_date, factory_id, production_line, order_status, item_code, quantity, created_by) 
VALUES 
(300002, '2022-02-01', 'F2', 2, 'WIP', 'EC200PV', 80, 'John Doe'),
(300003, '2022-03-01', 'F3', 3, 'DELIVERED', 'FR300PV', 50, 'Jane Smith'),
(300004, '2022-04-01', 'F4', 4, 'NEW', 'MW400PV', 40, 'John Doe'),
(300005, '2022-05-01', 'F5', 5, 'WIP', 'AC500PV', 30, 'Jane Smith'),
(300006, '2022-06-01', 'F6', 6, 'DELIVERED', 'WT600PV', 20, 'John Doe');



CREATE TABLE lab7replenishmentOrder(
rep_order_no INT(6) PRIMARY KEY AUTO_INCREMENT,
order_date DATE,
supplier_no INT(4), 
delivery_date DATE,
item_code VARCHAR(35), 
quantity INT(11),
created_by VARCHAR(30),
FOREIGN KEY (supplier_no) REFERENCES lab7supplier(supplier_no) ON UPDATE CASCADE,
FOREIGN KEY (item_code) REFERENCES lab7itemMaster(item_code) ON UPDATE CASCADE
);
ALTER TABLE lab7replenishmentOrder AUTO_INCREMENT = 400000;

INSERT INTO lab7replenishmentOrder
(rep_order_no, order_date, supplier_no, delivery_date, item_code, quantity, created_by) 
VALUES 
(400002, '2022-01-01', 1004, '2022-01-15', 'EC200PV', 200, 'John Doe'),
(400003, '2022-02-01', 1005, '2022-02-15', 'FR300PV', 150, 'Jane Smith'),
(400004, '2022-03-01', 1006, '2022-03-15', 'MW400PV', 120, 'John Doe'),
(400005, '2022-04-01', 1007, '2022-04-15', 'AC500PV', 100, 'Jane Smith'),
(400006, '2022-05-01', 1008, '2022-05-15', 'WT600PV', 80, 'John Doe');

-- ----------------------------------------------
CREATE TABLE lab7inventoryTransaction(
trx_no INT(6) PRIMARY KEY AUTO_INCREMENT,
trx_type VARCHAR(5), 
trx_ref_no INT(6) ,
trx_date DATE,
item_code VARCHAR(35),
quantity VARCHAR(35) ,
created_by VARCHAR(30),
FOREIGN KEY(trx_type) REFERENCES lab7transactionType(trx_type) ON UPDATE CASCADE,
FOREIGN KEY (trx_ref_no) REFERENCES lab7productionOrder(prod_order_no) ON UPDATE CASCADE,
FOREIGN KEY (trx_ref_no) REFERENCES lab7replenishmentOrder(rep_order_no) ON UPDATE CASCADE,
FOREIGN KEY (item_code) REFERENCES lab7itemMaster(item_code) ON UPDATE CASCADE
);
ALTER TABLE lab7inventoryTransaction AUTO_INCREMENT = 100000;

INSERT INTO lab7inventoryTransaction 
(trx_no, trx_type, trx_ref_no, trx_date, item_code, quantity, created_by) 
VALUES 
(100002, 'TRX1', 400002, '2022-01-01', 'EC200PV', 20, 'Jane Smith'),
(100003, 'TRX2', 300001, '2022-01-01', 'EC100PV', 10, 'John Doe'),
(100004, 'TRX3', NULL, '2022-02-01', 'MW400PV', 5, 'Jane Smith'),
(100005, 'TRX4', 400003, '2022-03-01', 'FR300PV', 2, 'John Doe'),
(100006, 'TRX5', 300004, '2022-04-01', 'AC500PV', 1, 'Jane Smith');