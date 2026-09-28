-- Retrieve all Customer Data 
SELECT * 
FROM customers 

-- Retreive all orders data 
SELECT * 
FROM orders 

-- Retrieve using coloumn name 
SELECT 
	first_name,
	country,
	score
From customers 

-- WHERE CLAUSE-- 

SELECT * 
FROM customers 
WHERE country = 'Germany '

-- Retreive using order by clause 
SELECT * 
From customers 
ORDER BY country ASC , score DESC 

-- Agregesion using Group by 
SELECT 
	country ,
	SUM(score) AS Total_Score,
	COUNT(id) As Total_customers	
FROM customers 
GROUP BY country 

 -- Having Clause 
 
/*find avg score for each country considering only customers 
with score not equal to 0 
and return only those country with average score greater than 450 
*/

	SELECT 
	  country, 
	  AVG (score) AS avg_score
  From customers 
  WHERE score != 0
 GROUP BY country 
 HAVING AVG(score) > 450
 
 -- Distinct Clause
-- Remove Duplicate value from data 
 -- Return unique list for country 

 SELECT DISTINCT country

FROM customers

-- Top Clause (Limit no of Row )
-- Retrieve only 3 Customers ]

 SELECT TOP 3 
 *
 FROM customers
-- Retrieve top 3 customers with Highest Scores
 
 SELECT TOP 3 * 

 FROM customers 
 ORDER BY score DESC 


 -- Retrieve the lowest 2 Customers based on score

SELECT TOP 2 * 

FROM customers
ORDER BY Score ASC 
 
 -- Get the two most recent order
 
 SELECT TOP 2 * 

 FROM orders 
 ORDER BY order_date DESC 

 -- SQL Technique For Multi Queries 

 SELECT * 
 FROM customers;

 SELECT * 
 FROM orders ;

   -- Static SQL Queries 

  SELECT 
  id,
  first_name, 
   'New Customer' AS Customer_type 

  FROM customers
 
 /* Create a new table called persons with columns : 
id, person_name , birth_date, and phone */

CREATE TABLE persons ( 
id INT NOT NULL,
person_name VARCHAR(50) NOT NULL,
birth_date DATE ,
phone VARCHAR(15) NOT NULL,
CONSTRAINT pk_persons PRIMARY KEY (id) 
)

-- ADD a new column called email to the persons table 
 ALTER TABLE persons 
 ADD email VARCHAR(50) NOT NULL 

-- Remove the column phone from persons table 

ALTER TABLE persons
DROP COLUMN phone  

-- DELETE the table persons from the database 

DROP TABLE persons 

-- Insert values into the table 

INSERT INTO customers (id, first_name, country, score)
VALUES 
(6, 'Satyam','INDIA',NULL),
(7, 'Anna', NULL, 100 )

SELECT * FROM customers

-- Insert data from 'Customers' into 'Persons'
INSERT INTO persons (id, person_name, birth_date, phone)
SELECT 
id,
first_name,
NULL,
'Unknown'
FROM customers 

SELECT * FROM persons

-- Change the score of customers 6 to 0 
UPDATE customers
SET  score = 0 
WHERE id = 6 

SELECT * FROM customers 

/* Change the score of customer 10 to 0 
and update the country to uk */
UPDATE customers
SET score = 0,
    country = 'UK'
WHERE id = 10 

SELECT * FROM customers

/* Update all customers with a Null score by
setting their score to 0 */

UPDATE customers 
SET score = 0 
WHERE score IS NULL 

SELECT * FROM customers
WHERE score IS NULL 

-- DELETE all the customers with an ID Greater than 5 

DELETE FROM customers
WHERE ID > 5 

SELECT * FROM customers 

-- DELETE all the data from table persons 

TRUNCATE TABLE persons 

-- Retrieve all the customers from Germany 

SELECT * FROM customers 
WHERE country = 'Germany'

-- Retrieve all the customers who are not from Germany 

SELECT * FROM customers 
WHERE country !=  'Germany'

-- Retrieve all the customers with a score greater than 500.

SELECT * FROM customers 
WHERE score > 500

-- Retrieve all the customers with a score of 500 or more 

SELECT * FROM customers
WHERE score >= 500

-- Retrieve all the customers with a score less than 500 or equaL too 500 .

SELECT * FROM customers 
WHERE score <= 500 

/* Retrieve all the customers who are from USA and having score greater than 500 */

SELECT * FROM customers 
WHERE country = 'USA' AND score > 500

/* Retrieve all the customers who are either from USA OR having score greater than 500
*/ 
SELECT * FROM customers
WHERE country = 'USA' OR score > 500 

-- Retrieve all the customers with score NOT less than 500 using NOT Operator

SELECT * FROM customers 
WHERE NOT score < 500 

-- Retrieve all customers whose score falls in range between 100 and 500 

 SELECT * FROM customers 
WHERE score BETWEEN 100 AND 500 







