CREATE VIEW vw_monthly_sales_profit AS
SELECT
    order_month,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity) AS total_quantity
FROM fact_sales
GROUP BY order_month;

CREATE VIEW vw_category_performance AS
SELECT
    category,
    sub_category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    AVG(discount) AS avg_discount,
    COUNT(DISTINCT order_id) AS total_orders
FROM fact_sales
GROUP BY category, sub_category;

CREATE VIEW vw_customer_value AS
SELECT
    customer_id,
    customer_name,
    segment,
    COUNT(DISTINCT order_id) AS orders_count,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    SUM(quantity) AS total_quantity,
    AVG(discount) AS avg_discount
FROM fact_sales
GROUP BY customer_id, customer_name, segment;

CREATE VIEW vw_regional_performance AS
SELECT
    region,
    state,
    city,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    AVG(discount) AS avg_discount,
    COUNT(DISTINCT order_id) AS total_orders
FROM fact_sales
GROUP BY region, state, city;