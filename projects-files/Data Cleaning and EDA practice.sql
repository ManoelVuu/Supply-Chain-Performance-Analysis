-- Data Cleaning & EDA

SELECT *
FROM supply;

-- Create a duplicate table

CREATE TABLE supply2
LIKE supply;

SELECT *
FROM supply2;

INSERT supply2
SELECT *
FROM supply;

SELECT *
FROM supply2;

-- #Data Cleaning Checks 

SELECT COUNT(*), COUNT(DISTINCT SKU), AVG(`Revenue generated`), MIN(`Stock levels`), MAX(`Lead time`)
FROM supply;

-- #Exploratory Data Analysis (EDA)

-- Total revenue by Location

SELECT DISTINCT Location, SUM(`Revenue generated`) AS `Total revenue`
FROM supply2
GROUP BY Location
ORDER BY `Total revenue` DESC;

-- Total revenue by Location

SELECT Location, SUM(`Revenue generated`) AS `Total revenue`
FROM supply2
GROUP BY Location
ORDER BY `Total revenue` DESC;

-- Total revenue by Product

SELECT DISTINCT `Product type`, SUM(`Revenue generated`) AS `Total revenue`
FROM supply2
GROUP BY `Product type`
ORDER BY `Total revenue` DESC;

-- Average Revenue

SELECT DISTINCT `Product type`, AVG(`Revenue generated`) AS `Average revenue`
FROM supply2
GROUP BY `Product type`
ORDER BY `Average revenue` DESC;

-- Which product generates most revenue in a Location

SELECT Location, `Product type`, SUM(`Revenue generated`) AS `Total revenue`
FROM supply2
GROUP BY Location, `Product type`
ORDER BY `Total revenue` DESC;

-- Comparing Revenues Across Locations for a Product

SELECT Location, `Product type`, SUM(`Revenue generated`) AS `Location revenue`
FROM supply2
WHERE `Product type` = 'skincare'
GROUP BY Location
ORDER BY `Location revenue` DESC;

-- Analyzing Product-Wise Revenue in a Location

SELECT `Product type`,  Location, SUM(`Revenue generated`) AS `Product revenue`
FROM supply2
WHERE Location = 'Mumbai'
GROUP BY `Product type`
ORDER BY `Product revenue` DESC;

-- Price Analysis

SELECT `Product type`,
	AVG(`Price`), MIN(`Price`), MAX(`Price`), STDDEV(`Price`)
FROM supply2
GROUP BY `Product type`;