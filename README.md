# Table of Contents

- [Business Problem](#business-problem)
- [Project Objectives](#project-objectives)
- [Data Source](#data-source)
- [Dashboard Overview](#dashboard-overview)
- [Methodology](#methodology)
  - [Monthly Customer Snapshots](#monthly-customer-snapshots)
  - [RF Customer Segmentation](#rf-customer-segmentation)
  - [Customer Value Classification](#customer-value-classification)
  - [Average KPI Calculation](#average-kpi-calculation)
- [Business Insights](#business-insights)
- [Business Recommendations](#business-recommendations)
- [Technical Challenges](#technical-challenges)
- [Skills Demonstrated](#skills-demonstrated)
- [Tools Used](#tools-used)
- [Future Improvements](#future-improvements)
- [Conclusion](#conclusion)

- # RF Customer Segmentation & Customer Value Analysis Dashboard

## Executive Summary

Customer retention and customer value optimization are among the most important drivers of sustainable growth in e-commerce. While many organizations segment customers based on purchasing behaviour, customer engagement alone does not always identify the customers who contribute the greatest financial value.

This project analyzes customer behaviour using the **Olist Brazilian E-commerce Dataset** by combining **Recency-Frequency (RF) Customer Segmentation** with a separate **Customer Value Analysis** based on cumulative customer spending. Instead of using the traditional RFM model, this project intentionally separates **customer engagement** (Recency and Frequency) from **customer financial contribution** (Monetary Value), allowing each dimension to be analyzed independently.

To accurately monitor customer evolution over time, monthly customer snapshots were created and all key metrics—including Monetary Value, Frequency, and Recency—were calculated cumulatively. Custom Executive DAX measures were developed to ensure every KPI always returns the **latest available customer snapshot** within the selected reporting period, preventing double-counting while preserving historical accuracy.

The analysis reveals that customer revenue is highly concentrated. Although **High Value customers represent only 19.7% of the customer base, they contribute approximately 53% of cumulative revenue**, while **Low Value customers account for nearly half of all customers (49.5%) but generate only 19% of revenue**. These findings demonstrate the importance of distinguishing customer engagement from customer value when developing customer retention and revenue growth strategies.

---

# Business Problem

Businesses often struggle to answer important questions such as:

- Which customers generate the greatest long-term value?
- Are the most engaged customers also the most profitable?
- How does customer value evolve over time?
- Which customer groups should receive retention investments?
- How can customer performance be monitored without overstating cumulative metrics?

Traditional dashboards frequently provide only a static view of customer behaviour and often aggregate cumulative metrics incorrectly. This project addresses these challenges by implementing **snapshot-based customer analytics**.

---

# Project Objectives

The dashboard was designed to:

- Segment customers based on purchasing behaviour using Recency and Frequency.
- Classify customers into High, Medium and Low Value groups using cumulative monetary value.
- Monitor customer behaviour through monthly snapshots.
- Measure cumulative customer growth over time.
- Provide historically accurate KPIs using snapshot-based DAX measures.
- Support data-driven decisions for customer retention and revenue optimization.

---

# Data Source

**Dataset:** Olist Brazilian E-commerce Dataset (Kaggle)

The raw transactional data was first imported into a SQL database for preprocessing and modeling.

The SQL database enabled the creation of helper tables that were later used to generate monthly customer snapshots. These snapshots became the foundation for all customer analytics.

Project workflow:

```text
Olist Dataset
      │
      ▼
SQL Database
      │
      ▼
Helper Tables
      │
      ▼
Customer_Segmentation_Monthly
      │
      ├────────► RF Customer Segmentation
      │
      └────────► Customer Value Classification (Python)
                     │
                     ▼
                 Power BI Dashboard
```

---

# Dashboard Overview

The project consists of three interactive dashboard pages.

## 1. Overview Dashboard

Provides an executive summary of customer performance.

Includes:

- Total Customers
- Total Monetary Value
- Average Recency
- Average Frequency
- Average Monetary Value
- Customer Distribution by RF Segment
- Revenue by RF Segment
- Cumulative Monetary Value Trend

---

## 2. Customer Value Analysis

Analyzes customer financial contribution.

Includes:

- Customer distribution by Customer Value
- Revenue by Customer Value
- Customer contribution percentages
- Revenue contribution percentages

This page focuses on identifying which customer groups generate the greatest business value.

---

## 3. RF Customer Analysis

Provides detailed customer engagement analysis.

Users can interactively filter customer segments and monitor cumulative customer metrics across time.

---

# Methodology

## Monthly Customer Snapshots

Rather than evaluating customers only once, monthly customer snapshots were created.

Each monthly snapshot stores cumulative customer metrics including:

- Cumulative Monetary Value
- Cumulative Frequency
- Cumulative Recency
- RF Segment
- Customer Value

This allows customers to move naturally between segments as their behaviour changes.

---

## RF Customer Segmentation

Customer engagement was measured using **Recency** and **Frequency** only.

Unlike traditional RFM analysis, Monetary Value was intentionally excluded from segmentation and analyzed independently.

Customers were classified into:

- Champions
- Loyal Customers
- Potential Loyalists
- Need Attention
- About to Sleep
- At Risk
- Can't Lose Them
- Hibernating
- Promising
- New Customers

These segments describe customer engagement rather than financial value.

---

## Customer Value Classification

Customer Value was derived separately using Python.

Within every monthly snapshot, customers were ranked according to their **Cumulative Monetary Value** using percentile ranking.

Customer Value categories:

- **High Value** — Top 20%
- **Medium Value** — Next 30%
- **Low Value** — Bottom 50%

Because rankings are recalculated monthly, customers can transition between Customer Value categories as cumulative spending changes.

---

## Executive Snapshot Measures

One of the biggest challenges was ensuring cumulative metrics remained historically accurate.

Custom Executive DAX measures were created for:

- Executive Total Monetary Value
- Executive Total Frequency
- Executive Total Recency
- Executive Customer Count

Each measure:

1. Finds the latest snapshot within the selected period.
2. Filters the dataset to that snapshot.
3. Returns cumulative metrics from that snapshot only.

For example, selecting **2018** returns the **December 2018 snapshot** instead of summing cumulative values across every month.

---

## Average KPI Calculation

Average KPIs were calculated using Executive measures.

Formula:

```text
Average Metric =
Executive Metric
÷
Executive Customer Count
```

This approach ensures that yearly selections always display averages from the latest available customer snapshot instead of averaging historical rows.

---

# Business Insights

## 1. Revenue is highly concentrated

High Value customers represent only **19.7%** of the customer base but contribute approximately **53%** of cumulative revenue.

**Business Impact**

A relatively small number of customers drives the majority of business revenue, making customer retention a strategic priority.

---

## 2. Low Value customers dominate the customer base

Almost **half of all customers (49.5%)** belong to the Low Value category, yet they contribute only **19%** of cumulative revenue.

**Business Impact**

Customer acquisition alone is insufficient. Businesses should focus on developing customers rather than simply increasing customer numbers.

---

## 3. Medium Value customers represent growth opportunities

Medium Value customers contribute approximately **27%** of revenue while representing **30.8%** of customers.

**Business Impact**

This segment offers significant potential for upselling, cross-selling and loyalty initiatives that encourage progression into the High Value category.

---

## 4. Customer Value evolves over time

Customer Value is recalculated every month using cumulative monetary value.

Customers naturally transition between Low, Medium and High Value categories as they continue purchasing.

**Business Impact**

Businesses should continuously monitor customer progression rather than relying on static customer classifications.

---

## 5. Customer engagement and customer value are different

The project intentionally separates customer engagement (RF) from customer spending (Customer Value).

This demonstrates that highly engaged customers are not always the highest revenue contributors.

**Business Impact**

Retention strategies should consider both customer behaviour and customer financial contribution.

---

# Business Recommendations

Based on the analysis, the following actions are recommended:

### Strengthen High Value customer retention

Develop exclusive loyalty programs, personalized promotions and premium customer experiences to protect the customers responsible for most revenue.

---

### Develop Medium Value customers

Use personalized marketing campaigns, targeted recommendations and purchase incentives to encourage progression into the High Value segment.

---

### Re-engage Low Value customers selectively

Instead of broad marketing campaigns, identify customers showing signs of increasing engagement and prioritize them for reactivation efforts.

---

### Monitor customer progression monthly

Customer Value changes continuously.

Tracking customer movement between value categories provides early warning signs of declining customer engagement while identifying emerging high-value customers.

---

### Use snapshot-based reporting

Executive dashboards should always use snapshot-based KPIs to avoid overstating cumulative customer metrics.

---

# Technical Challenges

## Designing Snapshot-Based DAX

Because Monetary Value, Frequency and Recency are cumulative metrics, summing multiple monthly snapshots would produce incorrect results.

Executive DAX measures were developed to always retrieve the latest available snapshot within the selected reporting period.

---

## Building Accurate Average Measures

Power BI initially averaged historical rows, producing misleading KPI values.

This was resolved by calculating averages using Executive Measures divided by Executive Customer Count.

---

## Dynamic Customer Value Classification

Customers were reclassified every month using cumulative monetary value percentiles.

Designing a model that allowed customers to transition naturally between Customer Value categories while maintaining historical consistency required extensive feature engineering in Python.

---

## Data Modeling

The project required integrating SQL, Python and Power BI into a single analytical workflow.

Helper tables generated in SQL formed the basis for monthly customer snapshots, while Python produced the Customer Value classifications later consumed by Power BI.

---

# Skills Demonstrated

### SQL

- Database design
- Data cleaning
- Data transformation
- Helper table creation
- Snapshot generation

### Python

- Pandas
- NumPy
- Feature engineering
- Percentile ranking
- Customer Value classification

### Power BI

- Data modeling
- Dashboard design
- Interactive reporting
- KPI development
- Drill-through analysis
- Cross-filtering

### DAX

- Variables (`VAR`)
- `CALCULATE`
- Filter context
- Snapshot logic
- Dynamic KPI calculations
- Percentage contribution measures
- Advanced aggregation techniques

### Business Analytics

- Customer Segmentation
- Customer Value Analysis
- Revenue concentration analysis
- Executive reporting
- Customer lifecycle analysis
- Data storytelling

---

# Tools Used

- **SQL** — Data preparation and helper table creation
- **Python (Pandas & NumPy)** — Feature engineering and Customer Value classification
- **Power BI** — Dashboard development and DAX modeling
- **Kaggle Olist Brazilian E-commerce Dataset** — Source data

---

# Future Improvements

Potential enhancements include:

- Customer Lifetime Value (CLV) prediction
- Customer churn prediction
- Cohort analysis
- Customer transition matrix between RF segments
- Machine learning-based customer value forecasting
- Automated data refresh with Power BI Service

---

# Conclusion

This project demonstrates how combining **RF Customer Segmentation**, **Customer Value Analysis**, and **snapshot-based reporting** can provide a more meaningful understanding of customer behaviour than traditional customer segmentation alone.

By separating customer engagement from financial contribution, the analysis highlights that the most engaged customers are not necessarily the most valuable, enabling businesses to design more targeted retention and growth strategies. The findings show that a relatively small proportion of customers drives the majority of cumulative revenue, reinforcing the importance of investing in customer retention, personalized engagement, and value-based marketing.

From a technical perspective, the project showcases an end-to-end analytics workflow that integrates **SQL**, **Python**, and **Power BI**. Through the use of monthly customer snapshots, cumulative metrics, and custom Executive DAX measures, the solution delivers historically accurate KPIs that support executive reporting and strategic decision-making.

This project demonstrates not only technical proficiency in data engineering and business intelligence but also the ability to translate complex customer data into actionable business insights and recommendations.
