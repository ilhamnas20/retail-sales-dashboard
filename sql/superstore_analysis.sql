-- =========================================
-- Superstore SQL Analysis Project
-- Goal: understand sales, profit, discounts, and regional performance
-- Tool: SQL Server
-- =========================================


-- Quick look at the data
SELECT TOP 10 *
FROM dbo.superstore;


-- Overall dataset size and performance
SELECT
    COUNT(*) AS TotalRows,
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit
FROM dbo.superstore;


-- Sales and profit by category and sub-category
SELECT 
    Category,
    Sub_Category,
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit
FROM dbo.superstore
GROUP BY Category, Sub_Category
ORDER BY TotalProfit DESC;


-- Discount and profitability analysis
SELECT 
    Discount,
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit
FROM dbo.superstore
GROUP BY Discount
ORDER BY Discount;


-- Regional performance analysis
SELECT 
    Region,
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit
FROM dbo.superstore
GROUP BY Region
ORDER BY TotalProfit DESC;


-- Profit margin by category
SELECT
    Category,
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit,
    ROUND(SUM(Profit) / NULLIF(SUM(Sales), 0) * 100, 2) AS ProfitMargin
FROM dbo.superstore
GROUP BY Category
ORDER BY ProfitMargin DESC;


-- Top 10 products by profit
SELECT TOP 10
    Product_Name,
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit
FROM dbo.superstore
GROUP BY Product_Name
ORDER BY TotalProfit DESC;


-- Rank sub-categories by profit
SELECT
    Sub_Category,
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit,
    RANK() OVER (ORDER BY SUM(Profit) DESC) AS ProfitRank
FROM dbo.superstore
GROUP BY Sub_Category
ORDER BY ProfitRank;


-- =========================================
-- Key Business Findings
-- =========================================

-- Category and sub-category findings:
-- Phones generate strong sales but are not among the highest-profit sub-categories.
-- Copiers generate strong profitability.

-- Discount finding:
-- Higher discount levels are associated with lower profitability.

-- Regional findings:
-- West and East are among the strongest regions by profit.
-- Central has the lowest overall profit among the regions analyzed.

-- Business findings:
-- Revenue performance does not always translate into higher profitability.
-- Discounting can have a significant impact on profit.
-- Regional and product-level performance varies across the business.
