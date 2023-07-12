-- 1. Display driver no, name and joined date for driver that comes from Kuala Terengganu’s 
-- branch.
SELECT d.drvNo, d.drvName, d.drvJoinDate , b.brnName FROM driver as d 
INNER JOIN branch as b ON b.brnNo = d.brnNo WHERE b.brnName = "Kuala Terengganu";
-- NOTE : No need for branch name, i just add it for validation.
-- ----------------------------------------------------------------------------------------------
-- 2. Retrieve the details of job description and charged amount inccured for fleet reference 
-- number 9000003. You should produce two set of SQL scripts to display the result using normal 
-- approach and using inner join operator.
SELECT jobDesc,chrgAmount FROM job, fleetdetails WHERE fleetdetails.jobID = job.jobID AND fleetdetails.fleNo = 9000003;
SELECT j.jobDesc, f.chrgAmount FROM job AS j INNER JOIN fleetdetails AS f ON f.jobID = j.jobID WHERE f.fleNo =9000003;
-- ----------------------------------------------------------------------------------------------
-- 3. Display the driver number, name, fleet reference number, fleet status and plat number for 
-- buses that going for fleet maintenance on 15 January 2016.
SELECT d.drvNo, d.drvName , f.fleNo, f.fleStatus, v.vehPlat FROM driver AS d 
INNER JOIN fleet AS f ON d.drvNo = f.drvNo
INNER JOIN vehicle AS v ON f.vehNo = v.vehNo
WHERE f.fleDate = '2016-01-15';
-- ----------------------------------------------------------------------------------------------
-- 4. Retrieve fleet reference number, driver name and jobid for fleet maintenance that being sent 
-- to the workshop as a warranty fleet and the person who responsible to handle this vehicle is 
-- from Besut’s branch.
SELECT f.fleNo, d.drvName, ft.jobID ,B.brnName , f.fleType FROM fleetdetails AS ft
INNER JOIN fleet AS f ON ft.fleNo = f.fleNo
INNER JOIN driver AS d ON f.drvNo = f.drvNo
INNER JOIN branch AS b ON d.brnNo = b.brnNo 
WHERE f.fleType = 2 AND b.brnName = 'Besut';