```sql
-- =========================================
-- Retail Sales SQL Analysis Project
-- Goal: analyze sales, products, categories,
-- customers, and monthly sales trends
-- Tool: SQL Server
-- =========================================


-- =========================================
-- 1. Quick Look at the Orders
-- =========================================

SELECT TOP 10
    *
FROM Orders;


-- =========================================
-- 2. Overall Sales Performance
-- =========================================

SELECT
    COUNT(DISTINCT o.OrderID) AS TotalOrders,
    SUM(o.Quantity) AS TotalUnitsSold,
    SUM(o.Quantity * p.Price) AS TotalSales
FROM Orders o
JOIN Products p
    ON o.ProductID = p.ProductID;


-- =========================================
-- 3. Sales Performance by Category
-- =========================================

SELECT
    p.Category,
    SUM(o.Quantity * p.Price) AS TotalSales,
    SUM(o.Quantity) AS UnitsSold,
    COUNT(DISTINCT o.OrderID) AS TotalOrders
FROM Orders o
JOIN Products p
    ON o.ProductID = p.ProductID
GROUP BY p.Category
ORDER BY TotalSales DESC;


-- =========================================
-- 4. Sales Performance by Product
-- =========================================

SELECT
    p.ProductName,
    p.Category,
    SUM(o.Quantity) AS UnitsSold,
    SUM(o.Quantity * p.Price) AS TotalSales,
    COUNT(DISTINCT o.OrderID) AS TotalOrders
FROM Orders o
JOIN Products p
    ON o.ProductID = p.ProductID
GROUP BY
    p.ProductName,
    p.Category
ORDER BY TotalSales DESC;


-- =========================================
-- 5. Monthly Sales Trend
-- =========================================

SELECT
    YEAR(o.OrderDate) AS SalesYear,
    MONTH(o.OrderDate) AS SalesMonth,
    SUM(o.Quantity * p.Price) AS TotalSales,
    SUM(o.Quantity) AS UnitsSold,
    COUNT(DISTINCT o.OrderID) AS TotalOrders
FROM Orders o
JOIN Products p
    ON o.ProductID = p.ProductID
GROUP BY
    YEAR(o.OrderDate),
    MONTH(o.OrderDate)
ORDER BY
    SalesYear,
    SalesMonth;


-- =========================================
-- 6. Customer Sales Performance
-- =========================================

SELECT
    c.CustomerName,
    COUNT(DISTINCT o.OrderID) AS TotalOrders,
    SUM(o.Quantity) AS UnitsPurchased,
    SUM(o.Quantity * p.Price) AS TotalSales,
    ROUND(
        SUM(o.Quantity * p.Price) /
        NULLIF(COUNT(DISTINCT o.OrderID), 0),
        2
    ) AS AverageOrderValue
FROM Customers c
JOIN Orders o
    ON c.CustomerID = o.CustomerID
JOIN Products p
    ON o.ProductID = p.ProductID
GROUP BY c.CustomerName
ORDER BY TotalSales DESC;


-- =========================================
-- 7. Category Contribution to Total Sales
-- =========================================

WITH CategorySales AS (
    SELECT
        p.Category,
        SUM(o.Quantity * p.Price) AS TotalSales
    FROM Orders o
    JOIN Products p
        ON o.ProductID = p.ProductID
    GROUP BY p.Category
)
SELECT
    Category,
    TotalSales,
    ROUND(
        TotalSales /
        NULLIF(SUM(TotalSales) OVER (), 0) * 100,
        2
    ) AS SalesPercentage
FROM CategorySales
ORDER BY TotalSales DESC;


-- =========================================
-- 8. Rank Products by Sales
-- =========================================

WITH ProductSales AS (
    SELECT
        p.ProductName,
        p.Category,
        SUM(o.Quantity * p.Price) AS TotalSales
    FROM Orders o
    JOIN Products p
        ON o.ProductID = p.ProductID
    GROUP BY
        p.ProductName,
        p.Category
)
SELECT
    ProductName,
    Category,
    TotalSales,
    RANK() OVER (ORDER BY TotalSales DESC) AS SalesRank
FROM ProductSales
ORDER BY SalesRank;


-- =========================================
-- Key Business Findings
-- =========================================

-- Electronics generated the highest sales at $4,800,
-- representing approximately 64.43% of total sales.

-- Furniture generated $1,650 in sales,
-- representing approximately 22.15% of total sales.

-- Accessories generated $1,000 in sales,
-- representing approximately 13.42% of total sales.

-- Laptop and Phone generated the highest product sales,
-- with $2,400 in sales each.

-- Bob generated the highest customer sales,
-- with total sales of $2,200.

-- February generated the highest monthly sales,
-- with $1,600 in sales.

-- October generated the lowest monthly sales,
-- with $150 in sales.

-- The analysis demonstrates how SQL joins, aggregations,
-- CTEs, calculated metrics, and window functions can be
-- used to analyze retail sales performance.
```
