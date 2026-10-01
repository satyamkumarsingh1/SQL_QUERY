-- YEAR(),MONTH(),DAY() FUNCTIONS

SELECT 
OrderId,
CreationTime,
YEAR(CreationTime) AS YEAR,
MONTH(CreationTime) AS MONTH,
DAY(CreationTime) AS DAY
FROM Sales.Orders

-- DATEPART() FUNCTION

SELECT 
OrderId,
CreationTime,
DATEPART(YEAR, CreationTime) AS Year_dp,
DATEPART(MONTH, CreationTime) AS Month_dp,
DATEPART(DAY, CreationTime) AS Day_dp,
DATEPART(HOUR, CreationTime) AS Hour_dp,
DATEPART(QUARTER, CreationTime) AS Quarter_dp,
DATEPART(WEEK, CreationTime) AS Week_dp
FROM sales.Orders

-- DATENAME FUNCTION 
-- Syntax - DATEPART(part,date)

SELECT 
OrderID,
CreationTime,
DATENAME(MONTH,CreationTime) AS Month_name,
DATENAME(WEEKDAY,CreationTime) AS weekday_name
FROM sales.Orders

-- DATETRUNC FUNCTION

SELECT 
OrderId,
CreationTime,
DATETRUNC(MINUTE, CreationTime) AS Minute_dt,
DATETRUNC(HOUR, CreationTime) AS Hour_Dt,
DATETRUNC(DAY, CreationTime) AS Dat_dt,
DATETRUNC(MONTH, CreationTime) AS Month_dt,
DATETRUNC(YEAR, CreationTime) AS Year_dt
FROM sales.Orders

-- Uses of DATETRUNC Function in DATA Analatic

SELECT 
DATETRUNC(MONTH,CreationTime) AS Creation,
COUNT(*)
FROM sales.Orders
GROUP By DATETRUNC(MONTH,CreationTime) 

-- EOMONTH FUNCTION (END OF THE MONTH)

SELECT 
OrderId,
CreationTime,
EOMONTH(CreationTime) AS EndOfMonth,
CAST(DATETRUNC(MONTH,CreationTime) AS DATE) AS StartOfMonth -- Cast is used to remove the timestamp
FROM sales.Orders

-- Calculate how many orders placed each year

SELECT
 YEAR(OrderDate),
  COUNT(*) AS NrOfOrders
 FROM sales.Orders
 GROUP BY YEAR(OrderDate) 

 -- Calculate how many orders placed each Month

SELECT
 DATENAME(MONTH, OrderDate) AS Order_Month,
  COUNT(*) AS NrOfOrders
 FROM sales.Orders
GROUP BY  DATENAME(MONTH, OrderDate) 

-- DATA FILTERING 
-- Show all orders that were placed in the month of february 

SELECT 
* 
FROM sales.Orders 
WHERE MONTH(OrderDate) = 2

-- FORMAT FUNCTION

SELECT
OrderId,
CreationTime, 
FORMAT(CreationTime, 'MM-dd-yyyy') AS USA_FORMAT,
FORMAT(CreationTime, 'dd-MM-yyyy') As EURO_FORMAT,
FORMAT(CreationTime,'dd') AS dd,
FORMAT(CreationTime,'ddd') AS ddd,
FORMAT(CreationTime,'dddd') AS dddd,
FORMAT(CreationTime,'MM') AS MM,
FORMAT(CreationTime,'MMM') AS MMM,
FORMAT(CreationTime,'MMMM') AS MMMM
FROM sales.Orders

-- Show CreationTime using the following format:
-- Day Wed Jan Q1 2025 12:34:56 PM

SELECT
OrderId,
CreationTime,
'Day '+ Format(CreationTime, 'ddd MMM') + 
' Q'+ DATENAME(QUARTER, CreationTime) + ' ' +
 FORMAT(CreationTime, 'yyyy hh:mm:ss tt') AS Custom_Format
FROM sales.Orders

-- USES of FORMAT FUNCTION IN DA 

SELECT
FORMAT(OrderDate, 'MMM yy') AS OrderDate,
COUNT(*)
FROM sales.Orders
GROUP BY FORMAT(OrderDate, 'MMM yy') 

-- Convert Function 

SELECT 
CONVERT(INT, '123')  AS [STRING TO INT],
CONVERT(DATE, '12-06-2024') AS [STRING TO DATE],
CreationTime,
CONVERT(DATE, CreationTime) AS [DATETIME to DATE Convert],
CONVERT(varchar, CreationTime, 32) AS [USA std. Style:32],
CONVERT(varchar, CreationTime, 34) AS [Euro Std. Style:34]
FROM sales.orders

-- CAST FUNCTION 

SELECT 
CAST('123' AS INT) AS [STRING TO INT],
CAST(123 AS VARCHAR) AS [INT TO STRING],
CAST('2025-08-12' AS DATE) AS [STRING TO DATE],
CAST('2025-08-12' AS DATETIME) AS [STRING TO DATETIME],
CreationTime,
CAST(CreationTime AS DATE) AS [DATETIME TO DATE]
FROM sales.Orders

-- Calculating Function
-- DATEADD(part,interval, Date) Function

SELECT
OrderId,
OrderDate,
DATEADD(Year,3,OrderDate) AS THREEYearLater,
DATEADD(Month,4,OrderDate) AS FourMonthLater,
DATEADD(Day,10,OrderDate) AS TenDayLater,
DATEADD(Day,-10,OrderDate) AS TenDayBefore
FROM sales.Orders

-- Calculating Function
-- DATEDIFF(part,Start_date,End_date) Function
-- Calculate the AGE of Employee

SELECT 
EmployeeID,
BirthDate,
DATEDIFF(Year,BirthDate,GETDATE()) AS AgeOfEmployee
FROM sales.Employees

-- Find the average Shipping duration in days for each month 

SELECT 

DATENAME(Month,OrderDate) AS OrderDate,
AVG(DATEDIFF(Day,OrderDate,ShipDate)) AS AVGShip
FROM Sales.Orders
Group By DATENAME(Month,OrderDate)

-- Time Gap Analysis
-- Find the number of days between each order and previous order

SELECT
OrderId,
OrderDate,
LAG(OrderDate) OVER (ORDER BY OrderDate) AS PreviousOrderDate,
DATEDIFF(Day,LAG(OrderDate) OVER (ORDER BY OrderDate),OrderDate) NrOfDays
FROM sales.Orders

-- Validation Function 
-- IsDATE(value) Function

SELECT
ISDATE('123') DateCheck1,
ISDATE('2026-10-26') DateCheck2,
ISDATE('17-12-2026') DateCheck2,
ISDATE('2025') DateCheck3,
ISDATE('12') DateCheck4





