USE university;




CREATE TABLE course (
CourseID CHARACTER(10) NOT NULL,
CourseName CHARACTER (50) DEFAULT NULL);


INSERT INTO course (CourseID , CourseName)
VALUES ('CS1001','Programming'),
		('CS2001','Advanced Programming'),
        ('CS3001','Neural Network');
        
SELECT * FROM course;


DESC course;
DELETE course FROM university;

DROP TABLE IF EXISTS course;
DESC course;