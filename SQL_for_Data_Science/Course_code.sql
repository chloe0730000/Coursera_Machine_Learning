/* sql syntax sequence
SELECT
FROM 
WHERE
GROUP BY
HAVING 
ORDER BY
*/


-- [Part1: Simple syntax of SQL]

-- create temp tables
CREATE TEMPORARY TABLE temp_table as
(
SELECT *
FROM shoes
WHERE shoe_type = 'sandals'
)


-- select NULL

SELECT *
FROM tables
where names is not NULL


-- in operator
SELECT *
FROM tables
WHERE id in (9, 10, 11)


-- OR & AND
SELECT *
FROM products
WHERE (ID = 9 or ID = 11)
AND price > 15

-- where not
SELECT *
FROM employees
WHERE NOT City = "London"
AND NOT City = "Seattle"


-- order by (always be the last)
SELECT *
FROM employees
ORDER BY price DESC

-- count all rows include NULL
SELECT count(*)
FROM customers

-- ignore NULL
SELECT count(ID)
FROM customers

-- count distinct
SELECT count(distinct ID)
FROM customers

-- group by (will also show NULL group)
SELECT ID, count(*)
FROM orders
WHERE CITY = "London"
GROUP BY ID
HAVING count(*) >=2


-- find text with certain pattern: whitecard

/*
%wildcards -> cannot use to match NULL value
%Pizza -> anything ending with the word pizza
Pizza% -> anything after the word pizza
%Pizza% -> grab anything before and after pizza
_pizza -> match spizza, mpizza, etc
*/



-- [Part2: Subquery, Join]


-- subqueries: only can retrieve single column
SELECT CustomerID, CompanyName, Region
FROM customers
WHERE CustomerID in (SELECT CustomerID FROM Orders WHERE Freight > 100)


-- subquery in subquery
SELECT Customer_name, Customer_contact
FROM customers
WHERE cust_id in 
	SELECT customer_id 
	FROM Orders 
	WHERE order_number in (SELECT order_number 
		FROM OrderItems))

-- inner join
SELECT suppliers.CompanyName, ProductName, UnitePrice
FROM Suppliers
INNER JOIN Products ON Suppliers.supplierid = Products.supplierid

-- Unions (same number of columns, same column order, dtypes)
SELECT City, Country
FROM customers
WHERE Country = 'Germany'
UNION
SELECT City, Country
FROM Suppliers
WHERE Country = 'Germany'
ORDER BY City




-- [Part3: concate, trim, substring, upper&lower, date, case]

SELECT CompanyName, 
		ContactName, 
		CompanyName || ' (' || ContactName||')'
FROM customers

SELECT TRIM("  You the best.   ") as TrimmedString

SELECT first_name, SUBSTR(first_name, 2, 3)
FROM employees

SELECT UPPER(column_name),
		LOWER(column_name)
FROM table_name


SELECT Birthdate,
		STRFTIME('%Y', Birthdate) AS Year,
		STRFTIME('%m', Birthdate) AS Month,
		STRFTIME('%d', Birthdate) AS Day
FROM employees

-- get current date
SELECT STRFTIME('%Y-%m-%d', 'now')

-- case statements
SELECT employeeid, firstname, lastname,
		city,
		(CASE WHEN City='Calgary' THEN 'Calgary' ELSE 'Other' END) as category
FROM employees
ORDER BY lastname, firstname

SELECT trackid, name, bypes,
		(CASE WHEN bytes < 300000 THEN 'small'
		WHEN bytes >= 300001 AND bytes <= 500000 THEN 'medium'
		WHEN bytes >= 500000 THEN 'large' 
		ELSE 'Other' END) As bytescategory
FROM tracks 








