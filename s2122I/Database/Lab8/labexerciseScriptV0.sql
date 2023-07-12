

CREATE TABLE lab8typeproperty( 
propertytype INT (2) PRIMARY KEY,
propertydesc varchar(70) );


CREATE TABLE lab8property(
propertyno INT(5) PRIMARY KEY,
addr varchar(70),
city varchar(35),
postcode int(5),
propertytype int(2),
foreign key (propertytype) references lab8typeproperty (propertytype) on update cascade
);


CREATE TABLE lab8billing (
billingno int(6) PRIMARY KEY AUTO_INCREMENT,
billingdate date, 
icno varchar(30) NOT NULL, 
pymtmonth date,
pymtyear year (4),
paidamount decimal(9,2),
foreign key (icno) references renter (icno)
); alter table lab8billing auto_increment =100001;


create table renter(
icno varchar(30) PRIMARY KEY, 
rentname varchar(50), 
hpno varchar(16), 
email varchar(60) );

CREATE TABLE termreference ( 
termrefno varchar(30) PRIMARY KEY, 
icno varchar(30) NOT NULL,
propertyno int(5) NOT NULL, 
startdate date, endate date, 
binclusive char (1) NOT NULL, 
mthlamount decimal(9,2),
FOREIGN KEY (propertyno) REFERENCES labsproperty (propertyno), 
foreign key (icno) references renter (icno)
);


insert into lab8typeproperty values('10', 'Apartment'),
('08', 'Long house'),
('04', 'Double terraced house'),
('02', 'semi-D house'),
('01', 'condominium');


insert into lab8property values
('30002', '112, Taman B', 'Muar', '84333', '08'),
('30001','111', 'Taman Jaya', 'Batu Rakit', '51200', '10'),
 ('30003', '113 Taman C', 'Shah Alam', '40150', '04'),
 (30004, '114 Taman D', 'Batu Pahat', '85003', '02'),
 (30005, '115 Taman E', 'Kuantan', '43010', '01');
 
 
 INSERT INTO lab8billing 
 (billingdate, icno, pymtmonth, pymtyear, paidamount) values
 ('2016-03-21', '870514-01-5472', '2016-03-20', '2016', '560.00'), 
 ('2016-05-29', '580613-06-1057', '2016-05-29', '2016', '760.00'), 
 ('2016-07-18', '760514-02-5482', '2016-07-19', '2016', '600.00'), 
 ('2016-09-15', '650412-01-2055', '2016-09-16', '2016', '560.00'), 
 ('2016-11-11', '680124-01-5472', '2016-11-12', '2016', '650.00');
 
 INSERT INTO renter values
('870514-01-5472', 'Abu', '012-1235486', 'abu@gmail.com'),
('580613-06-1057', 'Ali', '017-8462130', 'ali@gmail.com'),
('760514-02-5482', 'Koushhalya', '014-12584631', 'koushhalya@gmail.com'), 
('650412-01-2055', 'Chirstina', '019-6543975', 'chirstina@gmail.com'), 
('680124-01-5472', 'Kah Chun', '010-5366882', 'kk@gmail.com');

INSERT INTO termreference
values
('01', '870514-01-5472', '30001', '2016-03-21', '2017-01-21', 'Y', '56000.00'),
 ('02', '580613-06-1057', '30002', '2016-05-29', '2017-03-29', 'N', '76000.00'), 
 ('03', '760514-02-5482', '30003', '2016-07-18', '2017-05-18', 'Y', '60000.00'),
 ('05', '680124-01-5472', '30005', '2014-11-11', '2017-09-11', 'Y', '65000.00');