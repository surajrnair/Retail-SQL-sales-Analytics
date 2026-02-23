📊 Retail Sales Analytics – SQL Business Intelligence Project
📌 Project Overview

This project analyzes 10,000+ retail transactions using SQL to uncover actionable business insights related to revenue performance, profitability, customer behavior, and growth trends. The objective was to simulate a real-world Business Intelligence use case by:

Designing a structured relational table
Validating data integrity
Performing KPI analysis
Conducting profitability diagnostics
Identifying growth trends using window functions
Delivering business recommendations based on findings

🛠 Tech Stack

MySQL Workbench
SQL (Aggregations, Window Functions, Subqueries, CASE statements)
CSV data source (10,000+ retail transactions)

🗂 Dataset Overview

The dataset contains:

10,000+ retail transactions
Multiple product categories
Customer segmentation
Regional sales data
Revenue, cost & profit metrics
Payment methods
Time-based transaction records

🔎 Data Validation & Quality Checks

Before analysis, the following validations were performed:

Verified total row count consistency
Checked for duplicate order IDs
Validated discount range (0–1)
Confirmed profit = revenue - cost
Ensured no negative quantities or invalid values

This ensured the dataset was analysis-ready and reliable.

📈 Executive KPI Summary
Metric	Value
Total Revenue	~9.8M+
Total Profit	~340K+
Profit Margin	~3–4%
Total Orders	10,000+
Unique Customers	1,000+

Key Insight:

The business generates strong revenue volume but operates on relatively thin margins — indicating potential cost optimization opportunities.

🌍 Regional Performance Analysis

Findings:

Certain regions generate high revenue but relatively lower margin %
Margin variability suggests differences in cost structure across regions
Some regions show strong profitability consistency month-over-month

Business Insight:

Revenue concentration in a few high-performing regions may expose the business to regional risk. Margin optimization should focus on underperforming regions.

🏷 Product Category Analysis

Findings:

Top 2 categories contribute the majority of total profit
Some categories generate high revenue but comparatively lower margin
Profit concentration indicates product dependency risk

Business Insight:

High-revenue / low-margin categories may require pricing strategy review or cost renegotiation.

👥 Customer Segmentation Analysis

Revenue Contribution by Segment:

Corporate segment drives the largest revenue share
Consumer segment has high order volume
Small Business segment shows steady profitability

Business Insight:

Corporate customers represent high-value accounts and may benefit from loyalty or retention programs.

🏆 Top Customers (Window Function Analysis)

Using RANK() window function:

Top 10 customers contribute a disproportionate share of total profit.
Customer profitability distribution follows a Pareto-like pattern (80/20 rule).

Business Insight:

Customer retention strategies targeting the top 10–15% of customers could significantly impact overall profitability.

📉 Margin Classification Analysis

Orders were categorized using CASE logic:

Low Margin (<10%)
Medium Margin (10–25%)
High Margin (>25%)

Findings:

A significant portion of transactions fall into the low-margin category.

Business Insight:

Operational costs or aggressive discounting may be impacting margin sustainability.

📆 Monthly Revenue Trend & MoM Growth

Using LAG() window function:

Revenue trends show moderate month-over-month variability
Growth spikes align with specific seasonal months
Profit remains relatively stable despite revenue fluctuation

Business Insight:

Seasonality exists. Forecasting models could improve inventory and operational planning.

💳 Payment Method Insights

Certain payment methods correlate with higher average order value
Digital payments show consistent profitability

Business Insight:

Encouraging preferred payment channels may improve order value and operational efficiency.

📊 Advanced SQL Techniques Used

GROUP BY & Aggregations
Subqueries
CASE WHEN
RANK() & DENSE_RANK()
LAG() for growth analysis
Nested queries for contribution %
Profit margin calculations
Derived metrics
