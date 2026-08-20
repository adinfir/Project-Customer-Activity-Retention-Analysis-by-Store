# Project Customer Activity & Retention Analysis by Store

Project: 
  Analyzed customer transaction data to evaluate and compare performance across 6 stores based on activity and retention metrics.

Tools: 
  Google BigQuery (GoogleSQL) — CTEs, Window Functions (DENSE_RANK), Conditional Aggregations, SAFE_DIVIDE

Data: 
  Customer transaction records (tabinvoice) containing store ID, customer ID, and sales date.

Analysis: 
  Calculated L7D & L30D active customers, average daily active customers, new vs retained customer segmentation, store rankings, and contribution percentage across all stores.

Insight:
  Siber Sentra ranked #1 with the highest L30D active customers (3,437) contributing 33.41% of total active customers across   all stores, with a strong retention rate of 78.64%
  Master PC Indonesia had the highest L30D active rate (71.45%) and highest new customer rate (74.85%), indicating strong acquisition but weak retention (25.15%) — suggesting potential churn risk
  Dunia Notebook and Master PC Indonesia showed higher daily activity rates (2.93% and 3.69%) compared to larger stores, indicating more engaged customer bases relative to their size
  KlikKomputer Id and Matrix Computer had moderate retention (68%) with room for improvement in customer engagement strategies
