/*
1. Find customer name, order number and order amount if order amount is greater than average 
sales amount of the customers and sort the record by customer name [Hint: use WHERE 
clause].
*/
SELECT A.custname, B.orderno, C. amount AS OrderAmount
FROM customer AS A, orders AS B, order_item AS C
WHERE A.custcode = B.custcode AND B.orderno = C.orderno
AND C.amount > (SELECT AVG(amount) FROM order_item)
ORDER BY A.custname;

/*
2. By using subquery, display orderno, item code, description and the amount for customer
CS30120.
*/
SELECT A.orderno, B.itemcode, C.itemdesc, B. amount
FROM orders AS A, order_item AS B, item AS C
WHERE A.orderno = B.orderno
AND B.itemcode = C.itemcode
AND A.orderno IN (SELECT orderno
					FROM orders
					WHERE custcode = 'CS30120');

/*
3. Display customer code and name that does not make an order for item code ‘Nike-101’ that
representing ‘Dwi Layer Running Shoes’. Sort your result by customer code.
*/
SELECT custcode, custname
FROM customer
WHERE custcode NOT IN (SELECT DISTINCT custcode
						FROM orders AS A, order_item AS B
						WHERE A.orderno = B.orderno
						AND B.itemcode = 'Nike-101')
ORDER BY custcode;

/*
4. Retrieve order no, order date, customer code and total sales amount for order type ‘Company 
Order’ and the total sales amount exceeded each sales amount for customer code ‘CS21578’
[Hint: Use ALL].
*/
SELECT A.orderno, A.orderdate, A.custcode, A.ordertype, SUM(B.amount) AS TotalSlsAmt
FROM orders AS A
INNER JOIN order_item AS B
ON A.orderno = B.orderno
WHERE A.ordertype = 'Company Order'
HAVING TotalSlsAmt > ALL (SELECT Y. amount
							FROM orders AS X, order_item AS Y
							WHERE X.orderno = Y.orderno
							AND X.custcode = 'CS21578');
                            

/*
5. Find the salemancode and name that received the order from customer which the delivery 
date for the items is before the delivery date for order placed by customer ‘CS30287’. [Hint: 
Use ANY]
*/
SELECT A.salesmanid, A.salesmanname
FROM salesman AS A
INNER JOIN orders AS B
ON A.salesmanid = B.salesmanid
WHERE B.deliverydate < ANY (SELECT deliverydate
								FROM orders
								WHERE custcode = 'CS30287');

/*
6. Retrieve a list of item code and decription that do not purchased by customer code ‘CS21578’
and ‘CS30120’.
*/
SELECT itemcode, itemdesc
FROM item AS X
WHERE NOT EXISTS ( SELECT DISTINCT B.itemcode
					FROM orders AS A, order_item AS B
					WHERE A.orderno = B.orderno
					AND B.itemcode = X.itemcode
					AND A.custcode IN ('CS21578', 'CS30120'));



-- SQL MODES
-- SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
-- SET sql_mode = (SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY','NO_AUTO_CREATE_USER,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION'));