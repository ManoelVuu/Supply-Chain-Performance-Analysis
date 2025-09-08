-- Feature Engineering

SELECT *
FROM supply2;

-- Revenue per unit sold

SELECT `product type`, SKU, `Revenue generated`, `Number of products sold`,
  `Revenue generated` / NULLIF(`Number of products sold`, 0) AS `Revenue per unit sold`
FROM supply2;

-- Cost per unit sold

SELECT `product type`, SKU,
	(`Shipping costs` + `Manufacturing costs` + `Costs`) / NULLIF(`Number of products sold`, 0) AS `Cost per unit sold`
FROM supply2
ORDER BY `Cost per unit sold` DESC;

-- Cost per unit sold

SELECT `product type`, SKU,
(`Shipping costs` + `Manufacturing costs` + `Costs`) / `Number of products sold` AS `Cost per unit sold`
FROM supply2;

-- Profit per unit sold 

SELECT `Product type`, SKU, 
(`Revenue generated`) / NULLIF(`Number of products sold`, 0) - 
(`Shipping costs` + `Manufacturing costs` + `Costs`) / NULLIF(`Number of products sold`, 0) AS `Profit per unit sold`
FROM Supply2;

-- Profit Margin (%)

SELECT `Product type`, SKU, (((`Revenue generated` / NULLIF(`Number of products sold`, 0)) - 
 ((`Shipping costs` + `Manufacturing costs` + `Costs`) / NULLIF(`Number of products sold`, 0))) / 
 (`Revenue generated` / NULLIF(`Number of products sold`, 0))) * 100 AS `Profit margin (%)`
 FROM supply2
 ORDER BY `Profit margin (%)` DESC;

-- Total cost per product

SELECT `product type`, SKU,
`Shipping costs` + `Manufacturing costs` + `Costs` AS `Total cost per product`
FROM supply2;

-- Total revenue per product

SELECT `Product type`, SKU, `Revenue generated`
FROM supply2
ORDER BY `Revenue generated` DESC;

-- Total profit per product

SELECT `Product type`, SKU, 
(`Revenue generated`) - (`Shipping costs` + `Manufacturing costs` + `Costs`) AS `Total profit per product`
FROM supply2;

-- Cost breakdown ratios

SELECT `Product type`, SKU, 
(`Shipping costs`) / (`Shipping costs` + `Manufacturing costs` + `Costs`) AS `Shipping costs ratio`,
(`Manufacturing costs`) / (`Shipping costs` + `Manufacturing costs` + `Costs`) AS `Manufacturing costs ratio`,
(`Costs`) / (`Shipping costs` + `Manufacturing costs` + `Costs`) AS `Other costs ratio`
FROM supply2;

-- Stock efficiency

SELECT `Product type`, SKU, `Number of products sold`, `Stock levels`,
`Number of products sold` / NULLIF(`Stock levels`, 0) AS `Stock turnover ratio`,
CASE
	WHEN `Number of products sold` / NULLIF(`Stock levels`, 0)  < 0.5 THEN 'Overstocked'
    WHEN `Number of products sold` / NULLIF(`Stock levels`, 0) <= 2 THEN 'Balanced'
    WHEN `Number of products sold` / NULLIF(`Stock levels`, 0) <= 10 THEN 'Fast-moving'
    WHEN `Number of products sold` / NULLIF(`Stock levels`, 0) > 10 THEN 'Undersocked'
END AS 'Stock status'
FROM supply2
ORDER BY `Stock turnover ratio` DESC;

SELECT 
  `Product type`,
  SKU,
  `Number of products sold`,
  `Stock levels`,
  
  CASE 
    WHEN `Stock levels` = 0 AND `Number of products sold` > 0 THEN 999
    ELSE ROUND(`Number of products sold` / NULLIF(`Stock levels`, 0), 2)
  END AS `Stock turnover ratio`,

  CASE 
    WHEN `Stock levels` = 0 AND `Number of products sold` > 0 THEN 'Critical - Likely out of stock'
    WHEN (`Number of products sold` / NULLIF(`Stock levels`, 0)) < 0.5 THEN 'Overstocked'
    WHEN (`Number of products sold` / NULLIF(`Stock levels`, 0)) <= 2 THEN 'Balanced'
    WHEN (`Number of products sold` / NULLIF(`Stock levels`, 0)) <= 10 THEN 'Fast-moving'
    WHEN (`Number of products sold` / NULLIF(`Stock levels`, 0)) <= 100 THEN 'Understocked'
    ELSE 'Critical - Likely out of stock soon'
  END AS `Stock status`
FROM supply2
ORDER BY `Stock turnover ratio` DESC;

-- Understocked/critical-likely out of stock (soon) by supplier

SELECT 
  `Supplier name`,

  CASE 
    WHEN `Stock levels` = 0 AND `Number of products sold` > 0 THEN 'Understocked'
    WHEN (`Number of products sold` / NULLIF(`Stock levels`, 0)) < 0.5 THEN 'Overstocked'
    WHEN (`Number of products sold` / NULLIF(`Stock levels`, 0)) <= 2 THEN 'Balanced'
    WHEN (`Number of products sold` / NULLIF(`Stock levels`, 0)) <= 10 THEN 'Fast-moving'
    WHEN (`Number of products sold` / NULLIF(`Stock levels`, 0)) <= 100 THEN 'Understocked'
    ELSE 'Understocked'
  END AS `Stock status1`
FROM supply2
HAVING `Stock status1` = 'Understocked';


SELECT 
  `Supplier name`,
  COUNT(*) AS `Total SKU`,
  COUNT(CASE WHEN stock_status = 'Understocked' THEN 1 END) AS `Understocked SKU`,
  ROUND(
    100.0 * COUNT(CASE WHEN stock_status = 'Understocked' THEN 1 END) / COUNT(*), 
    2
  ) AS `Percentage understocked`,
  ROUND(AVG(`Lead time`), 2) AS `Avg lead time`
FROM (
  SELECT 
    `Supplier name`,
    `Lead time`,
    CASE 
      WHEN `Stock levels` = 0 AND `Number of products sold` > 0 THEN 'Understocked'
      WHEN (`Number of products sold` / NULLIF(`Stock levels`, 0)) < 0.5 THEN 'Overstocked'
      WHEN (`Number of products sold` / NULLIF(`Stock levels`, 0)) <= 2 THEN 'Balanced'
      WHEN (`Number of products sold` / NULLIF(`Stock levels`, 0)) <= 10 THEN 'Fast-moving'
      WHEN (`Number of products sold` / NULLIF(`Stock levels`, 0)) <= 100 THEN 'Understocked'
      ELSE 'Understocked'
    END AS stock_status
  FROM supply2
) AS sub
GROUP BY `Supplier name`
ORDER BY `Avg lead time` DESC;

SELECT 
  sub.`Supplier name`,
  sub.stock_status,
  COUNT(*) AS `Understocked SKU`,
  ROUND(100.0 * COUNT(*) / total_skus.total_count, 2) AS `Percentage understocked`,
  ROUND(AVG(sub.`Lead time`), 2) AS `Avg lead time`
FROM (
  SELECT 
    `Supplier name`,
    `Lead time`,
    CASE 
      WHEN `Stock levels` = 0 AND `Number of products sold` > 0 THEN 'Understocked'
      WHEN (`Number of products sold` / NULLIF(`Stock levels`, 0)) < 0.5 THEN 'Overstocked'
      WHEN (`Number of products sold` / NULLIF(`Stock levels`, 0)) <= 2 THEN 'Balanced'
      WHEN (`Number of products sold` / NULLIF(`Stock levels`, 0)) <= 10 THEN 'Fast-moving'
      WHEN (`Number of products sold` / NULLIF(`Stock levels`, 0)) <= 100 THEN 'Understocked'
      ELSE 'Understocked'
    END AS stock_status
  FROM supply2
) AS sub
JOIN (
  SELECT 
    `Supplier name`, 
    COUNT(*) AS total_count
  FROM supply2
  GROUP BY `Supplier name`
) AS total_skus ON sub.`Supplier name` = total_skus.`Supplier name`
WHERE sub.stock_status = 'Understocked'
GROUP BY sub.`Supplier name`, sub.stock_status
ORDER BY `Avg lead time` DESC;



-- Lead Time Impact
-- 1. Supplier speed category per product

SELECT 
  `Product type`,
  SKU,
  `Lead time`, `Supplier name`,
  CASE
    WHEN `Lead time` BETWEEN 1 AND 3 THEN 'Fast'
    WHEN `Lead time` BETWEEN 4 AND 7 THEN 'Moderate'
    WHEN `Lead time` BETWEEN 8 AND 14 THEN 'Slow'
    WHEN `Lead time` >= 15 THEN 'Very Slow'
    ELSE 'Unknown'
  END AS `Supplier speed category`
FROM Supply2;

-- 2. Number of products in each category

SELECT 
  CASE
    WHEN `Lead time` BETWEEN 1 AND 3 THEN 'Fast'
    WHEN `Lead time` BETWEEN 4 AND 7 THEN 'Moderate'
    WHEN `Lead time` BETWEEN 8 AND 14 THEN 'Slow'
    WHEN `Lead time` >= 15 THEN 'Very Slow'
    ELSE 'Unknown'
  END AS `Supplier speed category`,
  COUNT(*) AS `Number of products`
FROM supply2
GROUP BY  (`Supplier speed category`)
ORDER BY `Number of products` DESC;

-- 3. Product types that suffer the most delays

SELECT `Product type`,
	 COUNT(*) AS `Number of products`,
	AVG(`Lead time`) AS `Avg lead time`
FROM supply2
GROUP BY (`Product type`)
ORDER BY (`Avg lead time`) DESC;

-- 4. Products from very slow suppliers

SELECT `Product type`, SKU, `Supplier name`, `Lead time`,
	CASE
    WHEN `Lead time` >= 15 THEN 'Very Slow'
    ELSE 'Unknown'
  END AS `Supplier speed category`
FROM Supply2
WHERE `Lead time` >= 15
ORDER BY `lead time` DESC;

-- 5. Supplier speed category per suppliers

SELECT `Supplier name`,
	COUNT(*) AS `Orders from Supplier`,
	AVG(`Lead time`) AS `Avg lead time`
FROM supply2
GROUP BY (`Supplier name`)
ORDER BY (`Avg lead time`) ASC;

SELECT 
  `Supplier name`,
  COUNT(*) AS `Orders from Supplier`,
  AVG(`Lead time`) AS `Avg lead time`,
  CASE 
    WHEN AVG(`Lead time`) <= 10 THEN 'Fast'
    ELSE 'Slow'
  END AS `Supplier Speed`
FROM supply2
GROUP BY `Supplier name`
ORDER BY `Avg lead time` ASC;

-- 

-- Unit price deviation from mean

SELECT 
  `Product type`,
  SKU,
  `Supplier name`,
  `Price` AS `Unit Price`,
  ROUND(AVG(`Price`) OVER (PARTITION BY `Product type`), 2) AS `Avg price per product type`,
  ROUND(`Price` - AVG(`Price`) OVER (PARTITION BY `Product type`), 2) AS `Price deviation`
FROM supply2;

-- Average price per product

SELECT `Product type`,
AVG(`Price`) AS `Avg price per product`
FROM supply2
GROUP BY `Product type`;

-- Price deviation classification

SELECT 
  `Product type`,
  SKU,
  `Price`,
  ROUND(`Price` - AVG(`Price`) OVER (PARTITION BY `Product type`), 2) AS `Price Deviation`,
  CASE 
    WHEN `Price` - AVG(`Price`) OVER (PARTITION BY `Product type`) <= -5 THEN 'Underpriced'
    WHEN `Price` - AVG(`Price`) OVER (PARTITION BY `Product type`) BETWEEN -5 AND 5 THEN 'Standard'
    WHEN `Price` - AVG(`Price`) OVER (PARTITION BY `Product type`) > 5 THEN 'Overpriced'
    ELSE 'Unknown'
  END AS `Pricing Category`
FROM supply2;

SELECT 
  `Product type`,
  SKU,
  `Price`,
  ROUND(`Price` - AVG(`Price`) OVER (PARTITION BY `Product type`), 2) AS `Price Deviation`,
  ROUND(STDDEV(`Price`) OVER (PARTITION BY `Product type`), 2) AS `Std Dev`,
  CASE 
    WHEN `Price` < AVG(`Price`) OVER (PARTITION BY `Product type`) - STDDEV(`Price`) OVER (PARTITION BY `Product type`) THEN 'Underpriced'
    WHEN `Price` > AVG(`Price`) OVER (PARTITION BY `Product type`) + STDDEV(`Price`) OVER (PARTITION BY `Product type`) THEN 'Overpriced'
    ELSE 'Standard'
  END AS `Pricing Category`
FROM supply2;
