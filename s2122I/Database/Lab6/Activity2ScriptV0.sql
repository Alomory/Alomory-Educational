-- 1. Find the number of airport that originated from Malaysia. Rename the output as 
-- TotalMalaysiaAirport.
SELECT COUNT(country) AS TotalMalaysiaAirport  FROM airport 
WHERE country ='Malaysia'; 
-- ---------------------------------------------------------------------------------------------
-- 2.Find the number of AirAsia flight departure from 05 June 2016 to 15 August 2016 and booking 
-- status is confirmed.
SELECT COUNT(*) AS 'AirAsia-D-f05_6-t15_8' FROM airplane 
INNER JOIN flight USING (airplanecode) INNER JOIN booking USING(flightNo)
WHERE airlineName ='AirAsia' AND departuredate BETWEEN '2016-06-05' AND '2016-08-15';
-- ---------------------------------------------------------------------------------------------
-- 3. Display the maximum and minimum price ticket for all airline for booking date from 01 April to 
-- 15 Sept 2016 for Malaysia Airlines.
SELECT MAX(ticketPrice), MIN(ticketPrice) FROM booking
INNER JOIN flight USING (flightNo) INNER JOIN flightdetails USING (flightNo)
WHERE bookingdate BETWEEN '2016-04-01' AND '2016-09-15' 
AND flight.airplanecode IN (SELECT airplanecode FROM airplane WHERE airlineName ='Malaysia Airlines');
-- SELECT * FROM airplane INNER JOIN flight USING (airplanecode) INNER JOIN booking USING (flightNo)
-- INNER JOIN flightdetails USING(flightNo) where airlineName = "Malaysia Airlines"; to confirm 👌
-- ---------------------------------------------------------------------------------------------
-- 4. Retrieve airport code, airport name, number of flight and average flight duration for all airport
-- order by airport name in ascending order.
SELECT airportcode, airportname, COUNT(airportcode),AVG(duration) FROM airport 
INNER JOIN flight USING(airportcode) INNER JOIN flightdetails USING (flightNo)
GROUP BY airportcode
ORDER BY airportname ASC;
-- ---------------------------------------------------------------------------------------------
-- 5. Display profile id, profile name, his state and the frequent passenger flies for passenger who 
-- make more than one booking.
SELECT prfid, prfname, prfstate ,COUNT(prfid) AS 'Frequent Passengers' FROM profile
INNER JOIN booking USING(prfid)
GROUP BY prfid
HAVING COUNT(prfid) >1;
-- ---------------------------------------------------------------------------------------------
-- 6. Display passenger id, name, total amount ticket price booked by every passenger where the 
-- total amount of ticket price is exceeded the average ticket price offered by Air Asia airlines.
SELECT prfid AS 'ID', prfname AS 'Name', SUM(ticketPrice) AS 'Total Amount Ticket Booked' ,
MAX(ticketPrice),MIN(ticketPrice), AVG(ticketPrice),COUNT(ticketPrice)AS 'Booked Ticket'
FROM profile INNER JOIN booking USING(prfid) INNER JOIN flightdetails USING(flightNo)
WHERE  bookingstatus ='Confirmed'
GROUP BY prfid
HAVING SUM(ticketPrice) > (SELECT AVG(ticketPrice) FROM flightdetails 
INNER JOIN flight USING (flightNo) INNER JOIN airplane USING (airplanecode) 
WHERE airlineName = 'AirAsia' );
-- ---------------------------------------------------------------------------------------------