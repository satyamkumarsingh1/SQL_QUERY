-- Retrieve all data from customers and orders in two different results

SELECT *
FROM customers;

SELECT * 
FROM orders ;

/* Get all customers along with their orders ,but only for 
customers who have placed an order */
--INNER JOIN 

SELECT 
c.id,
c.first_name,
o.order_id,
o.sales,
o.order_date
FROM customers AS c 
INNER JOIN orders AS o
ON c.id = o.customer_id

/* GET all customers along with their orders,
including those without orders 
LEFT JOIN */

SELECT 
c.id,
c.first_name,
o.order_id,
o.sales,
o.order_date
FROM customers AS c
LEFT JOIN orders AS o
ON id = customer_id 

/* Get all customers along with their orders,
including orders without matching customers. */
-- RIGHT JOIN 
SELECT 
c.id,
c.first_name,
o.order_id,
o.sales,
o.order_date
FROM customers AS c
RIGHT JOIN orders AS o 
ON id = customer_id

-- Get all customers and all orders,even if there's no match. 
-- FULL JOIN 

SELECT 
c.id,
c.first_name,
o.order_id,
o.sales,
o.order_date
FROM customers AS c
FULL JOIN orders AS o
ON id = customer_id

-- Get all the customers who haven't placed and order 
-- LEFT ANTI JOIN 

SELECT *
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id
WHERE o.customer_id IS NULL 

-- Get all orders without matching customers 
-- RIGHT ANTI JOIN 

SELECT *
FROM customers AS c
RIGHT JOIN orders AS o
ON c.id = o.customer_id
WHERE c.id IS NULL 

-- FULL ANTI JOIN 
-- Find customers without orders and orders without customers 

SELECT * 
FROM customers AS c  
FULL JOIN orders AS o 
ON c.id = o.customer_id
WHERE c.id IS NULL 
OR 
	O.customer_id IS NULL 
	
	
	/* Get all the customers along with their orders,
but only for customers who have placed an order 
without using INNER JOIN */

SELECT * 
FROM customers AS c
LEFT JOIN orders AS o 
ON c.id = o.customer_id
WHERE o.customer_id IS NOT NULL 


-- Generate all possible combination of customers and order 

SELECT *
FROM customers AS c 
CROSS JOIN orders AS o 

/* TASK : Using SalesDB, Retreive a list of all orders,
along with the related customr,product, and employee details. 
For each order display :
order Id, customer'name,Product name, Sales, Price, Sales person'name */
 use SalesDB 

 SELECT
 o.OrderID,
 o.Sales,
 c.FirstName AS CustomerFirstName,
 c.LastName As CustomerLastName,
 p.Product AS Product_name,
 p.Price,
 e.FirstName AS EmployeeFirstName,
 e.LastName AS EmployeeLastName
 FROM Sales.Orders AS o 
 LEFT JOIN Sales.Customers AS c
 ON o.CustomerID = c.CustomerID
 LEFT JOIN Sales.Products AS p 
 On o.ProductID = p.ProductID
 LEFT JOIN Sales.Employees AS e 
 ON o.SalesPersonID = e.EmployeeID


