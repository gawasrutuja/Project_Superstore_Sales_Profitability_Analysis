📊 **Project Title**
-- Superstore Sales & Profitability Analysis

📌 **Project Overview**
-- This project analyzes sales and profitability data from the Superstore dataset to identify loss-making products and categories over time.
The primary objective is to understand where the business is consistently losing money and highlight areas that require deeper investigation.

📂 **Dataset Details**
    Dataset: Superstore Sales Data
    Source: Kaggle
    Time Period: 2014 – 2017
    Granularity: Order-level transactional data

🎯 **Business Objective**
The goal of this analysis is to:
-- Identify sub-categories contributing the highest share of overall losses
-- Understand how these losses are distributed over multiple years
-- Narrow down priority areas for further investigation (region, discounts, shipping, etc.)
-- This analysis intentionally focuses on loss-making products, as the objective is to identify revenue leakage rather than overall sales performance.

🛠️ **Tools & Technologies Used**
-- SQL (MySQL) – Data aggregation, window functions, filtering
-- Excel / CSV – Initial data exploration
-- GitHub – Version control and documentation

🧠 **Analysis Approach**
1. Identify Loss-Making Sub-Categories
	- Aggregated profit at category and sub-category level
	- Filtered sub-categories where total profit is negative

2. Measure Contribution to Total Loss
	- Calculated running loss using window functions
	- Computed each sub-category’s percentage contribution to overall loss
	- Included sub-categories contributing to 95% of total loss

3. Year-wise Loss Distribution
	- Analyzed how losses from top contributing sub-categories are spread across years (2014–2017)
   
🧾**SQL Logic**
Key SQL techniques used:
-- GROUP BY for aggregation
-- HAVING to filter loss-making groups
-- Window functions:
	--- SUM() OVER() for running totals
-- Cumulative loss percentage calculation
-- CTEs for readable queries

📁 **SQL Script: super_store_data_analysis.sql**

📈 **Key Findings**
- In the Furniture category, Tables are the biggest source of losses, contributing nearly 80% of the total loss.
- In 2017, Tables alone contributed around 38% of the overall loss, followed by 2015 (~16%) and 2014 (~14%). This indicates that the losses are spread across multiple years rather than being driven by a single bad year.
- Bookcases, on the other hand, contributed approximately 17% of the total loss. While this sub-category is also loss-making, its impact is significantly lower compared to Tables and more evenly distributed across the years.
  
Overall, losses are heavily concentrated in the Tables sub-category, making it the highest-priority area for further investigation, particularly across regions and discount levels.

🚀 **Next Steps / Further Analysis**
-- To better understand the root causes of these losses, further analysis can be done on:
-- Region-wise loss distribution
-- Impact of discount levels
-- Shipping mode and delivery delays
-- Customer segments
-- Product-level drill-down within high-loss sub-categories

📌 **Notes**
- This project focuses only on loss-making products to highlight revenue leakage areas. Profitable categories were intentionally excluded to maintain analytical focus.

📬 **Contact**
Author: Rutuja Gawas
📧 gawasrutuja@gmail.com
🔗 www.linkedin.com/in/rutujagawas


