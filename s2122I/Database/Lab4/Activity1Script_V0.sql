CREATE DATABASE ABC_College_Course_Registration;
USE ABC_College_Course_Registration;

-- creating table for student =================================================================================================
Create TABLE lab4student(
stuid VARCHAR(10) PRIMARY KEY,
stuname VARCHAR(50),
stuaddr VARCHAR(70),
city VARCHAR(25),
state VARCHAR(25),
hpno VARCHAR(25),
stustatus INT(11) not null
);

-- inserting values to student table 
INSERT INTO lab4student (stuid, stuname, stuaddr, city, state, hpno, stustatus) VALUES
 ('S12001',	'Ahmad Roslan',	'No.45, Presint 7',	'Putrajaya','Kuala Lumpur',	'013-3841010',2),
 ('S23008','Chan Wee Liew','DS-301, Desa Apartment','Kepong','Kuala Lumpur','019-3884747',1),
 ('S23002','Rosnah Rahman','Lot. 34, Kg. Seberang','Marang','Terengganu','011-9957458',1),
 ('S23037','Sri Shanti Devi','No. 7, Tmn Perwira','Kuantan','Pahang','016-6685650',1),
 ('S23025','Mohamad Ramli','No. 212, Jln Matang','Kuching','Sarawak','012-8825698',1);
-- ----------------------------------------------------------------------------------------------
-- creating table for registration =================================================================================================
CREATE TABLE lab4registration(
regno VARCHAR(15) PRIMARY KEY,
stuid VARCHAR(10) not null,
regdate DATE not null,
pymtstatus CHAR(1) not null,
CONSTRAINT fk_lab4registration_stuid FOREIGN KEY(stuid) REFERENCES lab4student(stuid)
);
-- inserting values to reggistration table 
INSERT INTO lab4registration(regno, stuid, regdate, pymtstatus) VALUES
 ('R10011','S12001','2015-09-22','Y'),
 ('R10122','S23002','2016-02-12','N'),
 ('R10025','S23037','2016-02-12','N'),
 ('R10035','S23008','2016-02-16','Y'),
 ('R10049','S23025','2016-02-26','N');
-- ----------------------------------------------------------------------------------------------
-- creating table for faculty table =================================================================================================
CREATE TABLE lab4faculty(
facultyid INT(3) PRIMARY KEY,
facultyname VARCHAR(50) NOT NULL,
office_no VARCHAR(15),
contactperson VARCHAR(50)
);
INSERT INTO lab4faculty(facultyid, facultyname,offic_no,contactperson) VALUES
(100,'Faculty of Information Technology','09-7751212','Mr. Sabri'),
(200,'Faculty of Science','09-7751010','Ms. Ramlah'),
(300,'Faculty of Engineering','09-7755678','Mr. Abd Ghani'),
(400,'Faculty of Arts','09-7751312','Mr. Eric'),
(500,'Faculty of Medicine','09-7758720','Ms. Hamidah');
-- ----------------------------------------------------------------------------------------------
-- creating table for course =================================================================================================
CREATE TABLE lab4course(
crsid VARCHAR(15) PRIMARY KEY,
crsname VARCHAR(50),
crscredit INT(11) NOT NULL,
crslevel VARCHAR(15),
crsowner INT(3),
CONSTRAINT fk_lab4course_crsowner FOREIGN KEY(crsowner) REFERENCES lab4faculty(facultyid)
);
-- inserting values to course
INSERT INTO lab4course(crsid, crsname, crscredit, crslevel, crsowner) VALUES
('CS100','Introduction to Computer',3,'Degree',100),
('CS201','Basic Programming',3,'Degree',100),
('CS345','Introduction to Internet of Things',4,'Degree',100),
('EG522','Engineering Science',4,'Master',300),
('BG401','Bioinformatics',3,'Degree',200);
-- ----------------------------------------------------------------------------------------------
-- creating table for courseRegister =================================================================================================
CREATE TABLE lab4courseregister(
regno VARCHAR(15) not null,
crsid VARCHAR(15) not null,
crsstatus VARCHAR(12),
price DECIMAL(7,2),
CONSTRAINT fk_lab4courseregister_regno FOREIGN KEY (regno) REFERENCES lab4registration(regno),
CONSTRAINT fk_lab4courseregister_crsid FOREIGN KEY (crsid) REFERENCES lab4course(crsid)
);
-- inserting values to courseRegister
INSERT INTO lab4courseregister(regno, crsid, crsstatus, price) VALUES
('R10011','CS100','Active',450.00),
('R10011','CS201','Active',450.00),
('R10011','CS345','Active',450.00),
('R10122','CS100','Active',450.00),
('R10122','CS201','Active',450.00),
('R10025','CS201','Active',450.00),
('R10025','BG401','Active',450.00),
('R10035','CS201','Active',450.00),
('R10035','CS345','Active',450.00),
('R10035','BG401','Active',450.00),
('R10049','EG522','Active',600.00);
-- ----------------------------------------------------------------------------------------------

-- Task 3
-- You are requested to retrieve registration information such registeration number,
-- student id and register date who still do not pay the fees and tranform this records 
-- into a new table known as pending_payment. Finally, retrieve all information from pending_payment table.

CREATE TABLE pending_payment
As SELECT regno,stuid,regdate
FROM lab4registration
WHERE pymtstatus="N";

-- for validation
SELECT * FROM lab4registration WHERE pymtstatus= 'N';