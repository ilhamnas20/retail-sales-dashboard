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

-- profitability by category
SELECT
    Category,
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit,
    ROUND(SUM(Profit) / NULLIF(SUM(Sales), 0) * 100, 2) AS ProfitMargin
FROM dbo.superstore
GROUP BY Category
ORDER BY ProfitMargin DESC;

-- top 10 products by profit
SELECT TOP 10
    Product_Name,
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit
FROM dbo.superstore
GROUP BY Product_Name
ORDER BY TotalProfit DESC;


-- notes:
-- Key category and sub-category findings:
-- Phones generate strong sales but are not among the highest-profit sub-categories.
-- Copiers generate strong profitability.


-- Key discount finding:
-- Higher discount levels are associated with lower profitability.


-- Key regional findings:
-- West and East are among the strongest regions by profit.
-- Central has the lowest overall profit among the regions analyzed.


-- Key business findings:
-- Revenue performance does not always translate into higher profitability.
-- Discounting can have a significant impact on profit.
-- Regional and product-level performance varies across the business.
