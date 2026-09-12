CREATE DATABASE global_superstore;
USE global_superstore;
SELECT DATABASE();

SELECT COUNT(*) AS Total_Rows
FROM global_superstore_cleaned;

DESCRIBE global_superstore_cleaned;

-- 1. Overall Business Performance
SELECT SUM(Sales) AS Total_Sales,
       SUM(Profit) AS Total_Profit,
       COUNT(DISTINCT `Order ID`) AS Total_Orders,
       SUM(Quantity) AS Total_Quantity
FROM global_superstore_cleaned;

-- 2. Category Performance
SELECT Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM global_superstore_cleaned
GROUP BY Category
ORDER BY Total_Sales DESC;

-- 3. Sub-Category Performance
SELECT `Sub-Category`,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM global_superstore_cleaned
GROUP BY `Sub-Category`
ORDER BY Total_Sales DESC;

-- 4. Regional Performance
SELECT Region,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM global_superstore_cleaned
GROUP BY Region
ORDER BY Total_Sales DESC;


-- 5. Country Performance
SELECT Country,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM global_superstore_cleaned
GROUP BY Country
ORDER BY Total_Sales DESC
LIMIT 10;

-- 6. Customer Segment Analysis
SELECT Segment,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    COUNT(DISTINCT `Customer ID`) AS Total_Customers
FROM global_superstore_cleaned
GROUP BY Segment
ORDER BY Total_Sales DESC;

-- 7. Sales Trend Over Time
SELECT YEAR(`Order Date`) AS Order_Year,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM global_superstore_cleaned
GROUP BY YEAR(`Order Date`)
ORDER BY Order_Year;

-- 8. Monthly Sales and Profit Trend
SELECT YEAR(`Order Date`) AS Order_Year,
    MONTH(`Order Date`) AS Order_Month,
    SUM(Sales) AS Total_Sales
FROM global_superstore_cleaned
GROUP BY
    YEAR(`Order Date`),
    MONTH(`Order Date`)
ORDER BY
    Order_Year,
    Order_Month;
    
-- 9. Top 10 Products by Sales
SELECT `Product Name`,
    SUM(Sales) AS Total_Sales
FROM global_superstore_cleaned
GROUP BY `Product Name`
ORDER BY Total_Sales DESC
LIMIT 10;

-- 10. Top 10 Products by Profit
SELECT `Product Name`,
    SUM(Profit) AS Total_Profit
FROM global_superstore_cleaned
GROUP BY `Product Name`
ORDER BY Total_Profit DESC
LIMIT 10;

-- 11. Loss-Making Products
SELECT `Product Name`,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM global_superstore_cleaned
GROUP BY `Product Name`
HAVING SUM(Profit) < 0
ORDER BY Total_Profit ASC
LIMIT 10;

-- 12. Shipping Mode Performance
SELECT `Ship Mode`,
    COUNT(DISTINCT `Order ID`) AS Total_Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM global_superstore_cleaned
GROUP BY `Ship Mode`
ORDER BY Total_Sales DESC;

-- 13. Order Priority Analysis
SELECT `Order Priority`,
    COUNT(DISTINCT `Order ID`) AS Total_Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM global_superstore_cleaned
GROUP BY `Order Priority`
ORDER BY Total_Orders DESC;

-- 14. Discount vs Profit Analysis
SELECT Discount,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM global_superstore_cleaned
GROUP BY Discount
ORDER BY Discount;

-- 15. Top Customers
SELECT `Customer Name`,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM global_superstore_cleaned
GROUP BY `Customer Name`
ORDER BY Total_Sales DESC
LIMIT 10;