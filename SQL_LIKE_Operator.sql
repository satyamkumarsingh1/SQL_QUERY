-- Retrieve all the customers either from Germany or USA 

SELECT *
FROM customers
WHERE country = 'GERMANY' OR country = 'USA' 

SELECT *
FROM customers
WHERE country IN ('GERMANY', 'USA' )

-- Retrieve all the customers NOT from Germany or USA 
-- USING NOT IN 
SELECT *
FROM customers
WHERE country NOT In ('GERMANY', 'USA')

-- LIKE Operator
-- Find all the customers whose first_name starts with 'M'

SELECT * 
FROM customers
WHERE first_name LIKE 'M%'

-- Find all customers whose name ends with 'n'

SELECT * 
FROM customers
WHERE first_name LIKE '%n'

-- FIND all customers whose first_name contains 'r'

SELECT *
FROM customers
WHERE first_name LIKE '%r%'






