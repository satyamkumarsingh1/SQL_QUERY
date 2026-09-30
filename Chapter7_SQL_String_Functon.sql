-- Concatenate first name and country into one coloumn 
--Show a list of customers'first name together with their country in one column

SELECT 
first_name,
country,
CONCAT(first_name, ' - ' , country) AS name_country,
FROM customers 

-- Convert Customers first name in lower case 

SELECT 
first_name,
country,
LOWER (first_name) AS lower_case
FROM customers

--Convert customers first_name to UPPER Case
SELECT 
first_name,
country,
UPPER (first_name) AS Upper_case
FROM customers 

--Find the customers whose first name contain leading spaces or trailing spaces
--Trim Function

SELECT 
first_name,
LEN(first_name) as len_name,
LEN(TRIM(first_name)) AS len_Trim_name,
LEN(first_name) -LEN(TRIM(first_name)) AS flag
FROM customers 
WHERE LEN(first_name) != LEN(TRIM(first_name))
-- WHERE first_name != TRIM(first_name) 

-- Remove dashes(-) from phone number 

SELECT
'123-456-789' AS Phone,
REPLACE('123-456-789', '-' , '')

-- Replace File Extension From txt to csv

SELECT 
'Report.txt' AS old_filename,
REPlACE('Report.txt' , '.txt' , '.csv') AS new_filename


-- Retrieve the first two character of each first name

SELECT 
first_name,
LEFT(TRIM(first_name),2) AS first_2_char
FROM customers

-- Retrieve the LAST two character of each first name

SELECT 
first_name,
RIGHT(TRIM(first_name),2) AS last_2_char
FROM customers

-- Retieve a list of customers'first names after removing the first character.
-- SUBSTRING FUNCTION
SELECT 
first_name,
SUBSTRING(TRIM(first_name), 2 , LEN(first_name))
FROM customers