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

-- Bottom 10 customers by profit
SELECT
    customer_name,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM fact_sales
GROUP BY customer_name
ORDER BY total_profit ASC
LIMIT 10;

-- Category and sub-category profitabiliy
SELECT
    category,
    sub_category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(100.0 * SUM(profit) / NULLIF(SUM(sales), 0), 2) AS profit_margin_pct
FROM fact_sales
GROUP BY category, sub_category
ORDER BY total_profit DESC;

-- Regions with high sales but weak profit
SELECT
    region,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(100.0 * SUM(profit) / NULLIF(SUM(sales), 0), 2) AS profit_margin_pct
FROM fact_sales
GROUP BY region
ORDER BY total_sales DESC;

-- Discount impact on profitability
SELECT
    CASE
        WHEN discount = 0 THEN 'No Discount'
        WHEN discount > 0 AND discount <= 0.10 THEN '0-10%'
        WHEN discount > 0.10 AND discount <= 0.20 THEN '10-20%'
        ELSE '20%+'
    END AS discount_bucket,
    COUNT(*) AS line_count,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM fact_sales
GROUP BY discount_bucket
ORDER BY discount_bucket;

-- Top 10 products by sales
SELECT
    product_name,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    SUM(quantity) AS total_quantity
FROM fact_sales
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;

-- Repeat customers
SELECT
    customer_name,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(sales) AS total_sales
FROM fact_sales
GROUP BY customer_name
HAVING COUNT(DISTINCT order_id) > 1
ORDER BY total_orders DESC, total_sales DESC;

-- Shipping performance
SELECT
    ship_mode,
    ROUND(AVG(ship_days), 2) AS avg_ship_days,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM fact_sales
GROUP BY ship_mode
ORDER BY avg_ship_days;