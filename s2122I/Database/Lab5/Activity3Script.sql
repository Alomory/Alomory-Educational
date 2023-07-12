-- Requirement 1 – Display job id, job description and respective fleet reference number regardless 
-- either job id is created or not, it must be reference to the job master data.
SELECT j.jobID, j.jobDesc, ft.fleNo FROM job AS j
LEFT OUTER JOIN fleetdetails AS ft ON j.jobID = ft.jobID;
-- ----------------------------------------------------------------------------------------------
-- Requirement 2 – List all vehicle number, plat number, and any fleet reference number that being 
-- sent to the workshop as a fleet warranty.
SELECT v.vehNo, v.vehPlat ,f.fleNo ,f.fletype FROM vehicle AS v
RIGHT OUTER JOIN  fleet AS f ON v.vehNo = f.vehNo
 WHERE f.fleType = 2 ;