# SQL Sales Analysis

## Overview

This folder contains the SQL analysis used to evaluate retail sales performance using a relational sales database.

The analysis focuses on **sales revenue, products, categories, customers, order trends, and sales contribution**.

## Business Questions

The analysis answers questions such as:

* What are the total sales and units sold?
* Which categories generate the most sales?
* Which products generate the most revenue?
* Which customers generate the most sales?
* How do sales change by month?
* What percentage of total sales comes from each category?
* How do products rank based on sales?

## SQL Techniques Used

* `SELECT`
* `TOP`
* `COUNT()`
* `SUM()`
* `GROUP BY`
* `ORDER BY`
* `JOIN`
* `ROUND()`
* `NULLIF()`
* `WITH` / CTEs
* `RANK()`
* Window functions
* Aggregate functions
* Calculated fields

## Analysis Areas

### Overall Sales Performance

Calculated total orders, units sold, and total sales revenue.

### Category Performance

Compared sales, units sold, and order volume across product categories.

### Product Performance

Identified products generating the highest sales revenue.

### Monthly Sales Trends

Analyzed sales performance by month to identify periods of higher and lower sales.

### Customer Performance

Compared customers based on total sales, units purchased, order count, and average order value.

### Sales Contribution

Calculated each category's percentage contribution to total sales.

### Product Ranking

Ranked products based on total sales using the `RANK()` window function.

## Key Business Findings

* Electronics generated the highest sales at approximately **$4,800**.
* Electronics represented approximately **64.43% of total sales**.
* Laptop and Phone generated the highest product sales at **$2,400 each**.
* Bob generated the highest customer sales at **$2,200**.
* February generated the highest monthly sales at **$1,600**.
* October generated the lowest monthly sales at **$150**.

## Skills Demonstrated

* SQL Server
* Data Analysis
* Relational Database Queries
* SQL JOINs
* Aggregate Functions
* CTEs
* Window Functions
* Business Analysis

## File

* `superstore_analysis.sql` — SQL queries used for the retail sales analysis.
