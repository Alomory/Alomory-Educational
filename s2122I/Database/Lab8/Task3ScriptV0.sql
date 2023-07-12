DROP DATABASE IF EXISTS project_management_system;
CREATE DATABASE project_management_system;
USE project_management_system;

CREATE TABLE job(
jobID VARCHAR(3) PRIMARY KEY,
jobDescription VARCHAR(50),
rateHour DECIMAL(9.2)
);

CREATE TABLE project(
projectNo INT(5) PRIMARY KEY,
projectName VARCHAR(30)
);

CREATE TABLE projectDetails(
workNo VARCHAR(5) PRIMARY KEY,
projectNo INT(5) NOT NULL,
assignDate DATE,
CONSTRAINT fk_projectDetails_projectNo FOREIGN KEY(projectNo) REFERENCES project(projectNo)
);


CREATE TABLE employee(
empNo INT(3) PRIMARY KEY,
empName VARCHAR(45),
joinDate DATE ,
jobID VARCHAR(3),
CONSTRAINT fk_employee_jobID FOREIGN KEY(jobID) REFERENCES job(jobID)
);

CREATE TABLE salary(
workNo VARCHAR(5) NOT NULL,
empNo INT(3) NOT NULL,
workHour DECIMAL(9,2),
chargeAmount DECIMAL(9,2),
CONSTRAINT pk_salary_both PRIMARY KEY(workNo, empNo),
CONSTRAINT fk_salary_workNo FOREIGN KEY(workNo) REFERENCES  projectDetails(workNo),
CONSTRAINT fk_salary_empNo FOREIGN KEY(empNo) REFERENCES  employee(empNo)
);
