/*
1. Retrieve ic number, rental name, property number and rental year (from attribute startdate) 
for any property that has property type as 10.
*/
select r.icno,r.rentname, p.propertyno, t.startdate ,p.propertytype
from termreference t,lab8property p,renter r 
where p.propertyno-t.propertyno and t.icno = r.icno and  p.propertytype = '10';

/*
2. Display billing number, billing date, rental name and payment month for property number
30001 and 30005. You should format billing date as ‘dd-mm-yyyy’.
*/
select billingno, date_format(billingdate, '%d-%m-%Y') as 'billing Date', rentname,b.pymtmonth
from lab8billing b, renter r,lab8property p,termreference t 
where r.icno = b.icno and b.icno = t.icno and t.propertyno = p.propertyno 
and (p.propertyno = 30005 or p.propertyno = 30001);


/*
3. Retrieve rental name, term reference number, hp number and monthly rental amount for 
property located at 'Shah Alam'. Example value for hp number is 012-5545050. You should 
display hp number as 0125545050 in your query.
*/

select r.rentname, t.termrefno, replace(r.hpno,'-','') as 'hp number' , t.mthlamount 
from termreference t,renter r,lab8property p
where r.icno=t.icno and t.propertyno-p.propertyno and p.city= 'Shah Alam';


/*
4. Retrieve property description, property address, rental amount and bill inclusive for all 
property. If bill inclusive = 'N', display as 'Electricity & Water bill not inclusive'. For bill inclusive
= 'Y', display as 'Electricity & Water bill is inclusive'
*/
select t.propertydesc,p.addr,o.mthlamount,
if(o.binclusive='N', 'Electricity & Water bill not inclusive', 'Electricity & Water bill inclusive') as binclusive
from lab8property p,lab8typeproperty t,termreference o
where t.propertytype=p.propertytype and p.propertyno = o.propertyno;

/*
5. Retrieve payment year, average payment amount for property where the signed date of term 
reference signed starting from year 2012 until 2014. You should display the average payment 
amount up to two (2) decimal places
*/

select pymtyear, truncate (avg(paidamount), 2) as paidamount 
from lab8billing b, renter r, termreference t 
where b.icno = r.icno and r.icno = t.icno and 
date_format(t.startdate, '%Y') between 2012 and 2014 group by b.pymtyear;
