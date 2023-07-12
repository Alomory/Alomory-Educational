INSERT INTO lab7itemMaster (item_code, item_desc, unit, stock_on_hand, stock_on_order, stock_block) VALUES 
('EC-100PV', 'Electric Cooker', 'Box', 10, 5, 2),
('EZ-02145', 'Fridge', 'Box', 5, 3, 2),
('EC-200PV', 'Microwave', 'Box', 6, 4, 3),
('EC-300PV', 'Air Conditioner', 'Box', 7, 5, 3),
('EC-650PV', 'Washing Machine', 'Box', 9, 5, 3);

INSERT INTO lab7supplier (supplier_no, supplier_name) VALUES 
(DEFAULT, 'Ali'),
(DEFAULT, 'Abu'),
(DEFAULT, 'Henry'),
(DEFAULT, 'John'),
(DEFAULT, 'Steve');

INSERT INTO lab7transactionType (trx_type, trx_desc) VALUES 
('TRX1', 'Replenishment Order'),
('TRX2', 'Sales Order'),
('TRX3', 'Receiving'),
('TRX4', 'Shipping'),
('TRX5', 'Stock Transfer');


INSERT INTO lab7productionOrder 
(prod_order_no, order_date, factory_id, production_line, order_status, item_code, quantity, created_by) 
VALUES 
(DEFAULT, '2022-10-10', 'F2', 2, 'WIP', 'EC-200PV', 5, 'James'),
(DEFAULT, '2022-11-18', 'F3', 3, 'DELIVERED', 'EC-100PV', 6, 'Ahmed'),
(DEFAULT, '2022-06-30', 'F4', 4, 'NEW', 'EC-300PV', 9, 'Alomory'),  -- order status didnt change it.
(DEFAULT, '2022-09-28', 'F5', 5, 'WIP', 'EC-650PV', 8, 'Mr.Omar'),
(DEFAULT, '2022-07-25', 'F6', 6, 'DELIVERED', 'EZ-02145', 7, 'Siti');


INSERT INTO lab7replenishmentOrder
(rep_order_no, order_date, supplier_no, delivery_date, item_code, quantity, created_by) 
VALUES 
(DEFAULT, '2022-10-10', 1000, '2022-10-17', 'EC-200PV', 5, 'James'),
(DEFAULT, '2022-11-18', 1001, '2022-11-20', 'EC-100PV', 6, 'Ahmed'),
(DEFAULT, '2022-06-30', 1002, '2022-07-08', 'EC-300PV', 9, 'Alomory'),
(DEFAULT, '2022-09-28', 1003, '2022-10-05', 'EC-650PV', 8, 'Mr.Omar'),
(DEFAULT, '2022-07-25', 1004, '2022-08-01', 'EZ-02145', 7, 'Siti');


INSERT INTO lab7inventoryTransaction 
(trx_no, trx_type, trx_ref_no, rep_order_no, trx_date, item_code, quantity, created_by) 
VALUES 
(DEFAULT, 'TRX5', 300000, 400000 , '2022-10-17', 'EC-200PV', 5, 'James'),
(DEFAULT, 'TRX2', 300001, 400001 , '2022-11-20', 'EC-100PV', 6, 'Ahemd'),
(DEFAULT, 'TRX1', 300002, 400002 , '2022-07-08', 'EC-300PV', 9, 'Alomory'),
(DEFAULT, 'TRX4', 300003, 400003 , '2022-10-05', 'EC-650PV', 8, 'Mr.Omar'),
(DEFAULT, 'TRX1', 300004, 400004 , '2022-08-01', 'EZ-02145', 7, 'Siti');