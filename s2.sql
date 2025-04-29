SELECT DISTINCT
    Product
FROM
    salesjan2009
ORDER BY Product;
SELECT 
    DATE_FORMAT(STR_TO_DATE(Transaction_date, '%m/%d/%y %H:%i'),
            '%Y-%m') AS sale_month,
    COUNT(*) AS total_orders,
    SUM(Price) AS total_revenue,
    ROUND(AVG(Price), 2) AS avg_order_value,
    MIN(Price) AS min_order_value,
    MAX(Price) AS max_order_value
FROM
    salesjan2009
WHERE
    LOWER(TRIM(Product)) = 'product1'
        AND STR_TO_DATE(Transaction_date, '%m/%d/%y %H:%i') IS NOT NULL
        AND YEAR(STR_TO_DATE(Transaction_date, '%m/%d/%y %H:%i')) = 2009
GROUP BY DATE_FORMAT(STR_TO_DATE(Transaction_date, '%m/%d/%y %H:%i'),
        '%Y-%m')
ORDER BY sale_month
LIMIT 5;
