-- Activity 5 ----------------------------------------------------------------------------------
-- Use SQL DML commands to perform the following tasks;

-- 1. Retrieve student id, student name, address, city for student come from Kuala Lumpur add no 
-- longer active in the ABC College.
SELECT * from lab4student;
SELECT stuid, stuname, stuaddr FROM lab4student WHERE state = "Kuala Lumpur" AND stustatus = 2;
-- ----------------------------------------------------------------------------------------------
-- 2. Retrieve faculty information except for faculty code 300 and 500.
SELECT * FROM  lab4faculty;
SELECT * FROM  lab4faculty where facultyid NOT IN (300,500);
-- ----------------------------------------------------------------------------------------------
-- 3. Modify credit value for course that having 3 credit hours and the course is owned by Faculty 
-- of Information Technology. Retrieve the latest record.
SELECT c.* , f.facultyname FROM lab4course AS c INNER JOIN lab4faculty AS f ON f.facultyid = c.crsowner
WHERE c.crscredit = 3 AND f.facultyname = 'Faculty of Information Technology';

SELECT c.* , f.facultyname FROM lab4course AS c INNER JOIN lab4faculty AS f ON f.facultyid = c.crsowner
WHERE c.crscredit = 3 AND f.facultyname = 'Faculty of Information Technology'  LIMIT 1;
