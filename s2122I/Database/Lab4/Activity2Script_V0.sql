-- INDEXING --
-- ------------
-- 1. Create an index for student id’s attribute in registration table and define the name of index as reg_studid_ind.
CREATE INDEX reg_studid_ind ON lab4registration(stuid);
SHOW INDEXES FROM lab4registration;
-- -------------------------------------------------------------------------------------------------------------------
-- 2. Create an index for attribute that representing the unique combination of student name and state in student 
--   table and define the index name as student_ind.
CREATE UNIQUE INDEX student_ind ON lab4student(stuname,state);
SHOW INDEXES FROM lab4student;
-- -------------------------------------------------------------------------------------------------------------------
-- 3. Create an index for course name’s attribute in course table and define the index name as crs_crsname_ind.
CREATE INDEX crs_crsname_ind ON lab4course(crsname);
SHOW INDEXES FROM lab4course;
-- -------------------------------------------------------------------------------------------------------------------
-- 4. Based on the latest analysis, DBA found that index crs_crsname_ind do not required since its would not affect 
--    the performance problem for the system. You are required to delete crs_crsname_ind from the system.
ALTER TABLE lab4course DROP INDEX crs_crsname_ind;
SHOW INDEXES FROM lab4course;