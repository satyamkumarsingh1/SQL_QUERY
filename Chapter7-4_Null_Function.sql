-- ISNULL Or COALESCE Functions
-- FIND the AVG scores of customers	
SELECT 
CustomerId,
Score,
COALESCE(Score,0) AS SCORE2,
AVG(Score) OVER() AS AVG_SCORE,
AVG(COALESCE(Score,0)) OVER() As AVG_SCORE2
FROM Sales.Customers 

/* Display the full name of customers in singe field by
merging their first name and last names,
AND 10 BONUS points to each customers 's score
*/

SELECT 
CustomerID,
FirstName,
LastName,
COALESCE(LastName,'') AS NULLREMOVED,
FirstName + ' ' + COALESCE(LastName,'') AS FullName,
Score,
COALESCE(Score, '0') AS ScorewithoutNull,
COALESCE(Score, 0) + 10 AS ScoreWithBonus
FROM sales.Customers

-- ISNUll Uses Cases in JOINING Tables

SELECT 
c.CustomerID,
c.FirstName,
o.OrderID,
o.ProductID
FROM Sales.Customers AS c
INNER JOIN sales.Orders AS o
ON ISNULL(c.CustomerID,'') =ISNULL( o.CustomerID,'') 
Order By CustomerID ASC 

-- Sort the customers from lowest to highest scores,
-- with NUlLs appearing last
SELECT 
CustomerId,
Score ,
CASE WHEN SCORE IS NULL THEN 1 ELSE 0 END AS FLAG 
FROM Sales.Customers 
ORDER BY CASE WHEN SCORE IS NULL THEN 1 ELSE 0 END , Score ASC

-- NULLIF FUNCTION 
-- Preventing the error of (Dividing by zero)
-- FInD the sales price of each order by dividing sales by quantity

SELECT 
OrderId,
Sales,
Quantity,
Sales/NULLIF (Quantity,0) AS Price
FROM sales.Orders

-- USES OF IS Null Funtion is ANTI JOIN
-- list all details for customers who have not place any orders 
-- Left Anti Join
SELECT 
* 
FROM Sales.Customers AS C
LEFT JOIN Sales.Orders AS o
ON c.CustomerID = o.CustomerID
WHERE o.CustomerID IS NULL 
