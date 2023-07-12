-- Activity 2 

/*
1. Retrieve employee number, employee name and charge amount for employee who involve 
in project 10002. In your output, concatenate employee number and employee with 
separator ‘ - ‘ and rename it as Employee_Details.
*/
SELECT concat_ws (' - ',e.empNo, e.empName) AS Employee_Details , s.chargeAmount 
FROM employee e, salary s, projectDetails p 
WHERE p.workno = s.workNo AND s.empNo = e.empNo AND p.projectNo = 10002;

/*
2. Retrieve employee name and the first twelve (12) characters job description for employee 
number range from 101 and 114. Rename job description as Roles.
*/
SELECT e.empName, substring(j.jobDescription,1,12) AS Roles
FROM employee e , job j
WHERE e.jobID = j.jobID
AND e. empNo BETWEEN 101 AND 114;

/*
3. Display the employee number, employee first name and work hour for those working hour is 
more than 50 hours and working with project 10006. [Hints: Use LOCATE and SUBSTRING]
*/
SELECT e.empNo, substring(e.empName,1, locate(" ",e.empName)) AS 'First Name', s.workHour 
FROM employee e, salary s, projectDetails p 
WHERE e.empNo = s.empNo AND s.workNo = p.workNo AND p.projectNo = 10006 AND s.workHour > 50;


/*
4. Retrieve employee name and total charge amount for employee who working as ‘System
Developer’. Rename total charge amount as Amount_Accumulate and remove any decimal 
places
*/
SELECT e.empName,  TRUNCATE(sum(s.chargeAmount),0) AS Amount_Accumulate
FROM employee e, salary s
WHERE e.empNo = s.empNo AND e.jobid= (SELECT jobID FROM job WHERE jobDescription = 'System Developer' )
GROUP BY e.empName;

/*
5. Find employee name, job description and number of service for the employee
*/
SELECT e.empName, j.jobDescription, count(s.empNo) AS 'Number of Service'
FROM employee e, job j, salary s
WHERE e.jobID =  j.jobID  AND s.empNo = e.empNo
GROUP BY e.empName;


/*
6. Retrieve project number, project name, employee name and assign date who involve in 
project 10006. You should format the assign date as ‘dd-mm-yyyy’.
*/
SELECT p.projectNo, o.projectName, e.empName, date_format(p.assignDate, '%d-%m-%Y') AS 'Date Formated'
FROM salary s, projectDetails p, employee e, project o 
WHERE p.projectNo = o.projectNo AND p.workNo = s.workNo AND s.empNo = e.empNo AND o.projectNo=10006;