-- Activity 6 --------------------------------------------------------------------------------------
-- Complete the following request by applying SQL DML commands;

-- 1. Display the student id, name for posses character ‘Ro’.
SELECT stuid ,stuname FROM lab4student WHERE stuname LIKE 'Ro%';
-- ----------------------------------------------------------------------------------------------
-- 2. Retrieve course id, course name and credit hours for course that begin with word as 
-- ‘Introduction’.
SELECT crsid, crsname, crscredit FROM lab4course WHERE crsname LIKE 'Introduction%';
-- ----------------------------------------------------------------------------------------------
-- 3. Retrieve registration number, student id and registration date for the fifth characters 
-- for student id which begin with the character ‘2’.
SELECT regno, stuid, regdate FROM lab4registration WHERE stuid LIKE '____2%';