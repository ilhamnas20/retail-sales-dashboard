-- =========================================
-- Superstore SQL Analysis Project
-- Goal: understand sales, profit, discounts, and region performance
-- Tool: SQL Server
-- =========================================


-- quick look at the data
SELECT TOP 10 *
FROM dbo.superstore;


-- check total size and overall performance
SELECT
    COUNT(*) AS TotalRows,
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit
FROM dbo.superstore;


-- looking at which categories are doing better
SELECT 
    Category,
    Sub_Category,
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit
FROM dbo.superstore
GROUP BY Category, Sub_Category
ORDER BY TotalProfit DESC;


-- notes:
-- phones have high sales but profit is not as strong as expected
-- copiers seem to be the most profitable overall


-- checking if discount is affecting profit
SELECT 
    Discount,
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit
FROM dbo.superstore
GROUP BY Discount
ORDER BY Discount;


-- notes:
-- higher discounts seem to reduce profit a lot
-- after around 30% discount, profit often goes negative


-- regional performance check
SELECT 
    Region,
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit
FROM dbo.superstore
GROUP BY Region
ORDER BY TotalProfit DESC;


-- notes:
-- west and east are strongest regions
-- central is the weakest in terms of profit


-- quick summary of what I noticed:
-- phones = strong sales but not top profit
-- copiers = best profit category
-- heavy discounts reduce profit
-- central region is underperforming
