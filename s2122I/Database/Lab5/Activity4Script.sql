-- 1. Use SQL DDL command to create prodvendor table.
CREATE TABLE prodvendor (
prCode VARCHAR (20) NOT NULL,
prVendor VARCHAR(4) NOT NULL,
prPricing DECIMAL(9,2) NOT NULL
);
-- -----------------------------------------------------------------------------------------
-- 2. Insert the records based on Table 2.
INSERT INTO prodvendor (prCode, prVendor, prPricing)
VALUES
  ('PW-1001', 'P10', 500.00),
  ('PQ-4570', 'P88', 35.00),
  ('MM-120E', 'P67', 245.00),
  ('MM-F12WR', 'P10', 1210.00),
  ('PW-QZR-09', 'P10', 79.00),
  ('PQ-4570', 'P10', 32.50),
  ('MM-120E', 'P88', 242.00),
  ('PW-1001', 'P45', 550.00),
  ('MM-F12WR', 'P73', 1200.00),
  ('PQ-4570', 'P67', 33.00),
  ('MM-F12WR', 'P35', 1189.00),
  ('PW-1001', 'P23', 510.00),
  ('PQ-4570', 'P35', 36.00),
  ('MM-120E', 'P23', 250.00);
  -- -----------------------------------------------------------------------------------------
-- 3. Perform a query to retrieve product code, the pricing and vendor code for product that 
-- supplied by more than one vendors and your record must be sorted by product code.
SELECT prCode, prPricing, prVendor
FROM prodVendor
WHERE prVendor IN (SELECT prVendor FROM prodVendor GROUP BY prVendor HAVING COUNT(*) > 1)
ORDER BY prCode ASC;
-- -----------------------------------------------------------------------------------------

SELECT pv1.prCode, pv1.prPricing, pv1.prVendor
FROM prodVendor pv1
JOIN prodVendor pv2 ON pv1.prCode = pv2.prCode AND pv1.prVendor <> pv2.prVendor
GROUP BY pv1.prCode
HAVING COUNT(pv2.prCode) > 1
ORDER BY pv1.prCode ASC;



-- -----------------------------------




