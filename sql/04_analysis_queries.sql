-- Monthly sales and profit trend
SELECT
    order_month,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM fact_sales
GROUP BY order_month
ORDER BY order_month;

-- Month-over-month sales growth
WITH monthly AS (
    SELECT
        order_month,
        SUM(sales) AS total_sales
    FROM fact_sales
    GROUP BY order_month
)
SELECT
    order_month,
    total_sales,
    LAG(total_sales) OVER (ORDER BY order_month) AS prev_month_sales,
    ROUND(
        100.0 * (total_sales - LAG(total_sales) OVER (ORDER BY order_month))
        / NULLIF(LAG(total_sales) OVER (ORDER BY order_month), 0), 2
    ) AS mom_sales_growth_pct
FROM monthly
ORDER BY order_month;

-- Top 10 customers by sales
SELECT
    customer_name,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders
FROM fact_sales
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;