/*
Create a record for each table based on the query from Activity 2.
*/
INSERT INTO customer VALUES 
('CS21578', 'Hakim Adlin', 'No. 12, Lorong Kenari 1AU/5, Seksyen 7',41200, 'Shah Alam', 'Selangor', '0133873030', 'hakim@gmail.com'), 
('CS31301', 'Ali Ahmad', 'A-1, Apartment Suria',48000, 'Bangi', 'Selangor', '0194512901', 'ali.ahmad@gmail.com'),
('CS30120', 'Unit Sukan UMT', 'Universiti Malaysia Terengganu', 21030, 'Kuala Terengganu', 'Terengganu', '0129987071', 'sport.umt@umt.edu.my'),
('CS30287', 'Persatuan Sukan ABC', 'Jln Bersatu, ABC Kolej Universiti',51200, 'Petaling Jaya', 'Selangor', '0115512020', 'abc_ramli@abc.edu.my');

INSERT INTO salesman VALUES 
('SLS100', 'Mohd Azman'),
('SLS200', 'Abdullah Razali'),
('SLS300', 'Yusman Amir');


INSERT INTO item VALUES 
('BL-2010', 'Lining B2010 Racket', 'piece', 200.00),
('YN-20', 'Yonex-Carbonex 20 racket', 'piece', 220.00),
('STC-Y74', 'Yonex Shuttle 74', 'bottle', 110.00),
('STC-Y72', 'Yonex Shuttle 72', 'bottle', 95.00),
('EPL-01', 'EPL Ball Size 5 Grade A', 'unit', 550.00),
('Nike-101', 'Dwi Layer Running Shoes', 'pair', 490.00),
('ASC-720', 'Asics Kimano Double Gel', 'pair', 680.00),
('YN-S103', 'Yonex Line Shoes', 'pair', 160.00),
('ANK-100', 'Kappa Angkle Guard', 'unit', 50.00);

INSERT INTO orders VALUES 
(1000021, 'Company Order', '2016-10-10', '2016-10-17', 'CS21578', 'SLS200'), 
(1000023, 'Individual Order', '2016-10-12', '2016-10-19', 'CS31301', 'SLS100'), 
(1000024, 'Company Order', '2016-10-14', '2016-10-19', 'CS30120', 'SLS300'),
(1000026, 'Company Order', '2016-10-16', '2016-10-23', 'CS30287', 'SLS200');


INSERT INTO order_item VALUES 
(1000021, 'BL-2010', 10, 2000.00),
(1000021, 'YN-20', 10, 2200.00),
(1000023, 'BL-2010', 1, 200.00),
(1000024, 'STC-Y74', 10, 1100.00),
(1000024, 'EPL-01', 8, 4400.00),
(1000024, 'Nike-101', 2, 980.00),
(1000024, 'BL-2010', 5, 1000.00),
(1000026, 'Nike-101', 10, 4900.00),
(1000026, 'ASC-720', 3, 2040.00),
(1000026, 'ANK-100', 10, 500.00);

