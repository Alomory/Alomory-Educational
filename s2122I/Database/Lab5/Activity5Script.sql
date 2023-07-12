USE XYZ_EXPRESS_SERVICING;

CREATE TABLE lab5student(
matricNo VARCHAR(10) PRIMARY KEY NOT NULL,
stuName VARCHAR(50) ,
hpNo VARCHAR(25),
cgpa DECIMAL(5,2)
);

CREATE TABLE lab5course(
courseID VARCHAR (15) PRIMARY KEY NOT NULL,
cname VARCHAR(50),
faculty VARCHAR(25),
credit INT(11)
);

CREATE TABLE lab5enrollment(
matricNo VARCHAR(10) NOT NULL,-- FOREIGN KEY
courseID VARCHAR(15) NOT NULL, -- FOREIGN KEY
semester VARCHAR(20),
result INT(11),
grade VARCHAR(5),
CONSTRAINT fk_lab5enrollment_matricNo FOREIGN KEY(matricNo) REFERENCES lab5student(matricNo),
CONSTRAINT fk_lab5enrollment_courseID FOREIGN KEY(courseID ) REFERENCES lab5course(courseID) 
);
-- -----------------------------------------------------------------------------------------------------
INSERT INTO lab5student (matricNo, stuName, hpNo, cgpa)
VALUES 
('S12457', 'Faturalrhman', '0123456789', 3.5),
('S12458', 'Gary Lim', '9876543210', 3.7),
('S12459', 'Omar Alomory', '0111222333', 3.9),
('S12460', 'MD Akash Ali', '4445556666', 3.4),
('S12461', 'Moaz Mohammed', '7778889999', 3.8);

INSERT INTO lab5course (courseID, cname, faculty, credit)
VALUES 
('CSF3402', 'Database Systems', 'FTKKI', 4),
('CSF3403', 'Software Engineering', 'FTKKI', 3),
('CSF3404', 'Computer Networks', 'FTKKI', 3),
('CSF3405', 'Artificial Intelligence', 'FTKKI', 4),
('CSF3406', 'Human-Computer Interaction', 'FTKKI', 3);
INSERT INTO lab5enrollment (matricNo, courseID, semester, result, grade)
VALUES 
('S12457', 'CSF3402', '2021-2022', 70, 'B'),
('S12458', 'CSF3403', '2021-2022', 90, 'A'),
('S12459', 'CSF3404', '2021-2022', 50, 'D'),
('S12460', 'CSF3405', '2020-2021', 65, 'C'),
('S12461', 'CSF3406', '-2020-2021', 73, 'B');
-- -----------------------------------------------------------------------------------------------------

-- 3. Display student student id, name, course id, course name for student who registered 
-- course id CSF3402. Is there any difference if you are adopting USING keyword in join 
-- condition instead of using ON keyword for join condition? Justify your answer.

SELECT s.matricNo, s.stuName,c.courseID ,c.cname FROM lab5student AS s 
INNER JOIN lab5enrollment AS e ON s.matricNo = e.matricNo
INNER JOIN lab5course AS c ON e.courseID = c.courseID
WHERE e.courseID = 'CSF3402';

SELECT matricNo, stuName,courseID ,cname FROM lab5student
JOIN lab5enrollment USING( matricNo)
JOIN lab5course USING(courseID)
WHERE courseID = 'CSF3402';
-- -----------------------------------------------------------------------------------------------------