# SQL Analysis

## Overview

This folder contains the SQL analysis used to evaluate the Superstore retail dataset.

The analysis focuses on **sales, profitability, discounts, product performance, and regional trends**.

## Business Questions

The analysis answers questions such as:

* What are the overall sales and profit?
* Which categories and sub-categories are most profitable?
* Which products generate the most profit?
* How are discount levels associated with profitability?
* Which regions generate the strongest profit?
* Which sub-categories rank highest by profit?

## SQL Techniques Used

* `SELECT`
* `TOP`
* `COUNT()`
* `SUM()`
* `GROUP BY`
* `ORDER BY`
* `ROUND()`
* `NULLIF()`
* `RANK()`
* Window functions
* Aggregate functions

## Analysis Areas

### Category & Sub-Category Performance

Analyzed sales and profit across categories and sub-categories to identify strong and weak performers.

### Discount Analysis

Examined sales and profitability across different discount levels.

### Regional Performance

Compared sales and profit across regions to identify differences in business performance.

### Profitability Analysis

Calculated profit margins by category to evaluate profitability beyond total sales.

### Product Analysis

Identified the top 10 products based on total profit.

### Profit Ranking

Ranked sub-categories based on total profit using the `RANK()` window function.

## Key Business Findings

* Strong sales do not always translate into strong profitability.
* Higher discount levels are associated with lower profitability.
* Regional performance varies across the business.
* Product and sub-category performance varies significantly.

## File

* `superstore_analysis.sql` — SQL queries used for the analysis.
