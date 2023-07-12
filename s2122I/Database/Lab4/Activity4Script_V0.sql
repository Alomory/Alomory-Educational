-- Activity 4 ------------------------------------------------------------------------------------

-- ABC College receive a new staf that will work at the ABC College Corporate Affairs department. 
-- He will responsible to analyse the student intake and make a planning for next College 
-- marketing program. As a DBA, you are requested to create a new database user as user01 and 
-- password as user123 for this new staff and permit the user to view the information from the 
-- system without doing any modification and creating any records. After completing these 
-- requests, verify that user01 is only applicable to view data only.

CREATE USER 'user01'@'localhost' IDENTIFIED BY 'user123';
GRANT SELECT ON abc_college_course_registration.* TO 'user01'@'localhost';

INSERT INTO lab4student VALUES 
('s52485','UMT','B2-201-5-1','Kuala Nerus','Terengganu','024-1241010',1);

UPDATE lab4student SET city = 'Terengganu' WHERE stuid='S23037';
DELETE FROM lab4student WHERE stuid='S23037';

SELECT * FROM lab4student;

SELECT user FROM mysql.user;
SHOW GRANTS FOR 'user01'@'localhost';