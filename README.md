# Superstore Sales & Profit Insights Dashboard

## Overview
This project analyzes the Superstore retail dataset using SQL and Power BI to uncover trends in sales, profit, customer value, regional performance, and discount-driven profitability.

The goal was to build a production-style analytics workflow that:
- cleans and validates retail order-line data,
- creates reusable SQL reporting views,
- and delivers an interactive Power BI dashboard for business decision-making.

## Business Questions
This project answers questions such as:
- Which regions and categories drive the most sales and profit?
- Which sub-categories generate revenue but underperform on margin?
- How do discounts affect profitability?
- Who are the highest-value customers?
- How are sales and profit trending month over month?

## Dataset
- Source: [Superstore Dataset on Kaggle](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final)
- Grain: order-line level
- Key fields: order date, ship date, customer, segment, geography, category, sub-category, product, sales, quantity, discount, profit

## Tech Stack
- SQL
- PostgreSQL
- Power BI
- GitHub

## Repository Structure
```text
superstore-sales-profit-dashboard/
├── README.md
├── data/
│   ├── raw/
│   └── clean/
├── sql/
│   ├── 01_schema.sql
│   ├── 02_load_data.sql
│   ├── 03_cleaning_checks.sql
│   ├── 04_analysis_queries.sql
│   └── 05_reporting_views.sql
├── powerbi/
│   └── superstore-sales-profit-dashboard.pbix
├── images/
│   ├── dashboard-overview.png
│   ├── profitability-discounts.png
│   └── customer-product-insights.png
└── docs/
    └── business_questions.md
```

## Data Preparation
The dataset was loaded into SQL and transformed into an analytics-ready fact table. Cleaning and validation steps included:
- checking for nulls and duplicate rows,
- validating order and ship dates,
- standardizing data types,
- deriving order month, ship days, and profit margin fields.

## KPI Definitions
- Total Sales = sum of sales
- Total Profit = sum of profit
- Profit Margin % = total profit / total sales
- Total Orders = distinct order count
- Total Customers = distinct customer count
- Total Quantity = sum of quantity
- Average Order Value = total sales / distinct orders
- Average Discount % = average discount
- Unprofitable Orders % = loss-making orders / total orders
- Monthly Sales Growth % = current month sales vs previous month sales

## SQL Analysis
The SQL layer includes:
- base schema and raw load scripts,
- cleaning and validation checks,
- reusable reporting views,
- analytical queries for trends, customers, products, discounts, and regional performance.

## Dashboard Pages
### 1. Executive Overview
High-level KPIs, monthly trends, sales and profit by region, and category performance.

### 2. Profitability & Discounts
Analysis of discount impact, sub-category margin issues, and low-profit areas.

### 3. Customer & Product Insights
Top and bottom customers, top-selling products, repeat customer behavior, and AOV analysis.

## Key Insights
Add 4–6 findings here after building the dashboard. Example placeholders:
- The highest-sales region did not always produce the highest profit.
- Some sub-categories showed strong revenue but negative margins.
- Higher discount bands were associated with weaker profitability.
- A small group of customers contributed a disproportionate share of revenue.

## Screenshots
Add dashboard screenshots here.

## How to Use
1. Download the dataset from Kaggle.
2. Load the CSV into PostgreSQL.
3. Run the SQL scripts in order.
4. Open the Power BI file and refresh the data model.
5. Review the dashboard pages and filters.

## Resume Bullet
Built a production-style analytics project using SQL and Power BI to clean, model, and visualize Superstore retail data, delivering KPI dashboards on sales, profit, discount impact, customer value, and regional performance.

## Future Improvements
- Add customer segmentation (RFM)
- Add forecast visuals
- Add returns analysis if a returns dataset is included
- Convert the SQL layer to dbt models