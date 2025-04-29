# Sales-Data-jan2009 Sql
Ecommerce Sales Analysis — January 2009
Dataset Used:
File: SalesJan2009.csv
Description: Transactional data from an ecommerce store for January 2009.
Columns:
- Transaction_date: Date and time of purchase (MM/DD/YY HH:MM)
- Product: Name of the product sold
- Price: Price of the item sold
- Payment_Type: Payment method used
- Name, City, Country, etc.
Objective:
Analyze sales metrics specifically for 'Product1' across different months using MySQL.
Key SQL Features Used:
- STR_TO_DATE() for parsing custom date formats
- DATE_FORMAT() for grouping by month
- WHERE clause for filtering by product and year
- Aggregate functions: COUNT(), SUM(), AVG(), MIN(), MAX()
Final Query:

SELECT 
    DATE_FORMAT(STR_TO_DATE(Transaction_date, '%m/%d/%y %H:%i'), '%Y-%m') AS sale_month,
    COUNT(*) AS total_orders,
    SUM(Price) AS total_revenue,
    ROUND(AVG(Price), 2) AS avg_order_value,
    MIN(Price) AS min_order_value,
    MAX(Price) AS max_order_value
FROM salesjan2009
WHERE 
    LOWER(TRIM(Product)) = 'product1'
    AND STR_TO_DATE(Transaction_date, '%m/%d/%y %H:%i') IS NOT NULL
    AND YEAR(STR_TO_DATE(Transaction_date, '%m/%d/%y %H:%i')) = 2009
GROUP BY sale_month
ORDER BY sale_month
LIMIT 12;

Output:
This query returns monthly sales statistics for 'Product1' including:
- Number of orders
- Total revenue
- Average, minimum, and maximum order value
Insights Gained:
- Demonstrated parsing and filtering date strings in SQL
- Learned how to isolate and troubleshoot data issues
- Developed monthly-level KPIs for specific products
