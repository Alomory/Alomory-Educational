-- CREATING VIEWS FOR END-USERS --
-- =============================
-- There is a two (2) requests from one of the end user to view the students who register the course 
-- and to view student information. Based on this request, the management of ABC College will only 
-- allow the end user to view information such a registration number, course id and course status 
-- from the system. For student information, the end user is applicable to view only student 
-- from Kuala Lumpur. As a Database Administrator (DBA) for ABC College, you are requested 
-- to complete the request. Subsequenly, verify these requests are created accordingly.

USE abc_college_course_registration;
CREATE VIEW end_user_request1 AS 
SELECT 
regno AS 'Registration No',
crsid AS 'Course ID',
crsstatus AS 'Course Status'
FROM lab4courseregister;

CREATE VIEW end_user_request2 AS 
SELECT * FROM lab4student WHERE state = 'Kuala Lumpur';

SELECT * FROM lab4student;
-- CREATE VIEW end_user_request2 AS 


SELECT s.stuid,s.stuname,s.stuaddr,s.city,s.state,s.hpno,s.stustatus , -- student table 
r.pymtstatus, -- registration table 
rc.regno, rc.crsid,c.crsname , rc.crsstatus  -- course register
FROM lab4student AS s INNER JOIN lab4registration AS r ON s.stuid = r.stuid
INNER JOIN lab4courseregister AS rc ON r.regno = rc.regno
INNER JOIN lab4course AS c ON rc.crsid = c.crsid; 