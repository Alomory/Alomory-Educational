-- Q1
SELECT a.order_Date, a.item_code,i.item_desc, a.quantity
FROM lab7replenishmentOrder a, lab7itemmaster i, lab7productionorder p
WHERE a.item_code=i.item_code AND i.item_code=p.item_code
GROUP BY a.rep_order_no
Having (a.quantity)> (SELECT AVG(p.quantity)
					FROM lab7replenishmentOrder a,lab7itemmaster b, lab7productionorder p
					WHERE a.item_code=b.item_code AND b.item_code=p.item_code
					AND p.item_code='EC-100PV')
ORDER BY a.order_date desc;

-- alt
-- SELECT  order_date, item_code, itemdesc, quantity
-- FROM lab7replenishmentOrder
-- JOIN lab7itemMaster USING(item_code)
-- WHERE item_code = 'EC-100PV' AND quantity > (SELECT AVG(quantity) FROM lab7replenishmentOrder WHERE item_code = 'EC-100PV')
-- ORDER BY order_date DESC;


-- Q2
SELECT trx_no, trx_date, trx_ref_no
FROM lab7inventoryTransaction c
WHERE NOT EXISTS (SELECT * FROM lab7supplier s, lab7replenishmentOrder r
					WHERE s.supplier_no = r.supplier_no AND r.rep_order_no = c.rep_order_no
                    AND s.supplier_no IN (1003));

-- Q3
SELECT p.prod_order_no, p.item_code, i.item_desc, p.factory_id, p.order_status, p.quantity
FROM lab7productionOrder p
JOIN lab7itemMaster i ON p.item_code = i.item_code
WHERE p.order_date = (SELECT order_date FROM lab7replenishmentOrder ORDER BY quantity DESC LIMIT 1);

-- alt
-- SELECT DISTINCT p.prod_order_no, p.item_code, i.item_desc, p.factory_id, p.order_status, p.quantity
-- FROM lab7productionOrder p ,lab7itemMaster i, lab7replenishmentOrder r
-- WHERE p.item_code = i.item_code AND i.item_code = r.item_code 
-- AND p.order_date = ANY(SELECT r.order_date FROM lab7replenishmentOrder r)
-- GROUP BY p.quantity
-- HAVING (p.quantity) = (SELECT MAX(p.quantity) FROM lab7productionOrder);

-- Q4
SELECT r.rep_order_no, r.order_date,r.item_code,i.item_desc,r.quantity
FROM lab7replenishmentorder r,lab7itemmaster i,lab7inventoryTransaction t WHERE r.item_code=i.item_code AND r.rep_order_no-t.rep_order_no
AND t.trx_type IN('TRX1')
GROUP BY r.rep_order_no
HAVING (r.quantity) > ANY(SELECT AVG(t.quantity)
						FROM lab7inventoryTransaction t
						WHERE t.item_code='EZ-02145');
-- alt
/*
SELECT r.rep_order_no, r.order_date, r.item_code, it.item_desc, r.quantity 
FROM lab7replenishmentOrder AS r
JOIN lab7inventoryTransaction AS i ON r.rep_order_no = i.trx_ref_no 
JOIN lab7itemMaster AS it ON r.item_code = it.item_code
WHERE r.item_code = 'EZ-02145' AND r.quantity > (SELECT AVG(quantity) 
													FROM lab7replenishmentOrder 
                                                    WHERE item_code = 'EZ-02145') 
AND i.trx_type = 'TRX1';
*/


-- Q5
SELECT trx_no, trx_date, item_code, quantity
FROM lab7inventoryTransaction
WHERE item_code NOT IN (SELECT item_code FROM lab7replenishmentOrder);

-- alt
SELECT trx_no, trx_date, item_code, quantity FROM lab7inventoryTransaction a
WHERE NOT EXISTS(SELECT item_code
				FROM lab7replenishmentOrder b 
				WHERE a.item_code = b.item_code);