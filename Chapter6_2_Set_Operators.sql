-- Combine the data from employee and customers into one table
-- UNION 

SELECT
FirstName,
LastName 
FROM sales.Customers
UNION 
SELECT
FirstName,
LastName 
FROM sales.Employees

-- Combine the data from employee and customers into one table INCLUDING Duplicates 
-- UNION ALL 

 SELECT 
 FirstName,
 LastName
 FROM sales.Customers
 UNION ALL
 SELECT 
 FirstName,
 LastName
 FROM sales.Employees

 -- Find the employee who are not customers at the same time 
-- Except Set operator

SELECT 
Firstname,
Lastname
FROM sales.Employees
EXCEPT
SELECT 
Firstname,
Lastname
FROM sales.Customers

-- Find the employee , who are customers.
-- INTERSECT SET OPERATOR
SELECT 
Firstname,
Lastname
FROM sales.Employees
INTERSECT 
SELECT 
Firstname,
Lastname
FROM sales.Customers

-- Orders all stored in the separate tables(Orders and OrdersArchive).
--Combine all orders  into one report without duplicates 
 
 SELECT 
 'Orders' AS SourceTable
      , [OrderID]
      ,[ProductID]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[OrderDate]
      ,[ShipDate]
      ,[OrderStatus]
      ,[ShipAddress]
      ,[BillAddress]
      ,[Quantity]
      ,[Sales]
      ,[CreationTime]
 FROM sales.Orders
UNION 
SELECT 
  'OrdersArchive' AS SourceTable
      , [OrderID]
      ,[ProductID]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[OrderDate]
      ,[ShipDate]
      ,[OrderStatus]
      ,[ShipAddress]
      ,[BillAddress]
      ,[Quantity]
      ,[Sales]
      ,[CreationTime]
 FROM sales.OrdersArchive
 Order By OrderID ASC