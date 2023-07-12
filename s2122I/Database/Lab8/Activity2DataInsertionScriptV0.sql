-- DATA INSETION  
USE project_management_system;

INSERT INTO project VALUES
(10002, 'Oracle data migration'),
(10006, 'eProduction Development');

INSERT INTO projectDetails VALUES
('W2002',10002,'2016-10-12'),
('W3044',10006,'2016-10-18');

INSERT INTO job VALUES
('J05', 'Project Manager', 200.00),
('J08', 'Database Admin', 100.00),
('J12', 'System Analyst', 120.00),
('J25', 'Senior System Developer', 80.00),
('J31', 'System Developer', 50.00);


INSERT INTO employee VALUES
(101, 'Abdul Fahmi Razak', '2009-02-03', 'J05'),
(107, 'Meor Hashim Meor Ngah', '2010-05-20', 'J08'),
(112, 'Mohamad Azami Daud', '2010-05-28', 'J12'),
(118, 'Ramli Azman', '2011-06-22', 'J31'),
(120, 'Anita Jusoh', '2011-12-02', 'J31'),
(102, 'Fridaus Othman', '2009-03-17', 'J05'),
(114, 'Asma Che Amin', '2010-06-15', 'J12'),
(123, 'Fahmi Abdullah', '2012-03-01', 'J25'),
(124, 'Nuridzuan Ahmad', '2012-03-15', 'J31');


INSERT INTO salary VALUES
('W2002', 101, 24, 4800.00),
('W2002', 107, 32, 3200.00),
('W2002', 112, 32, 3840.00),
('W2002', 118, 160, 8000.00),
('W2002', 120, 160, 8000.00),
('W3044', 102, 80, 16000.00),
('W3044', 107, 15, 1500.00),
('W3044', 114, 120, 12000.00),
('W3044', 123, 160 ,12800.00),
('W3044', 124, 160, 8000.00);

