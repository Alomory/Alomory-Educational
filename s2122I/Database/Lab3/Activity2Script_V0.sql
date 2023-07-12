SELECT cust_number, cust_name, state,contact_no FROM customer; -- A2_T1_1 --
SELECT * FROM customer WHERE state = 'Selangor'; -- A2_T1_2 --
SELECT inv_number AS 'Invoice Code'	-- A2_T1_3
,cust_number AS 'Customer Code'
,inv_date AS 'Date'
,inv_amount AS Amount FROM invoice WHERE shipped_by = 'GDex';
-- ---------
SELECT * FROM product; -- A2_T1_4

UPDATE product SET prod_desc = 'TV LCD 4 Plasma 4 inch' WHERE prod_code = 'AW-1001';
-- -----------------
SELECT inv_number AS 'Invoice Code'  -- A2_T1_5
,inv_date AS 'Date'
,cust_number AS 'Customer Code'
,inv_amount AS Amount FROM invoice WHERE inv_date <= '2016-08-25' AND inv_date >='2016-08-22';
-- -----------------
INSERT INTO product (prod_code, prod_desc, unit, sales_price) VALUES -- A2_T1_6
('AC-5510','Panasonic air-cond 1.5 Hose Power ECO','Box',2300.00);

INSERT INTO invoice (inv_number,inv_date, cust_number,inv_amount,shipped_by, ship_tracking_no) VALUES
(10006,'2016-8-28','C10001',2300.00,'DHL','DHL/2145-004');

INSERT INTO invoice_line (inv_number, prod_code, quantity, sales_price) VALUES
(10006,'AC-5510',1,2300);

-- update product code for product AC-5510 to AC-5587
UPDATE product SET prod_code = 'AC-5587' WHERE prod_code = 'AC-5510';
-- ----------------

-- Display the description of product and price for product that having sales price is less than RM2000.00.
SELECT prod_desc AS 'Product Description'  -- A2_T1_7
,sales_price AS 'Sales Price'
 FROM product WHERE sales_price < 2000;
 -- ------------
 
 -- Change the contact number for customer ‘C10003’ to 016-5585050.  -- A2_T1_8
 UPDATE customer SET contact_no = 0165585050 WHERE cust_number = 'C10003';
 -- ------------------
 
 -- Retrieve customer information and sort the record by state in ascending order. -- A2_T1_9
 SELECT * FROM customer ORDER BY state ASC;
 -- -----------------------------
 
 -- Retrieve invoice number, customer code, date of invoice, amount and shipped by 
 -- for invoice date after 22 August 2016 and sort the records by 
 -- invoice date in descending order.                                     -- A2_T1_10
 SELECT inv_number , cust_number, inv_date, inv_amount, shipped_by 
 FROM invoice WHERE inv_date > '2016-8-22' ORDER BY inv_date DESC;