# Customer Activity & Retention Analysis by Store

## 📌 Project Overview

This project analyzes customer transaction data to evaluate and compare **customer activity, acquisition, and retention performance across 6 stores**.

The analysis focuses on identifying differences in customer engagement between stores using activity and retention metrics such as **L7D Active Customers, L30D Active Customers, Average Daily Active Customers, New Customers, Retained Customers, and Retention Rate**.

The analysis was conducted using **Google BigQuery (GoogleSQL)** with CTEs, window functions, conditional aggregations, and safe division techniques.

---

## 🎯 Business Objective

The objective of this analysis is to help management understand:

* Which stores have the highest customer activity?
* Which stores have the strongest customer retention?
* Which stores rely heavily on new customer acquisition?
* Which stores have potential customer churn risks?
* How does each store contribute to overall customer activity?
* Which stores have relatively stronger customer engagement compared to their customer base?

These insights can be used to support **customer retention, engagement, and acquisition strategies at the store level**.

---

## 🗂️ Dataset

The analysis uses customer transaction records from the `tabinvoice` table.

### Key Columns

| Column        | Description                    |
| ------------- | ------------------------------ |
| `store`       | Store identifier/name          |
| `customer_id` | Unique customer identifier     |
| `sales_date`  | Transaction date               |
| `invoice`     | Transaction/invoice identifier |
| `net_total`   | Transaction revenue            |

The analysis primarily uses:

* Store
* Customer
* Transaction date

to determine customer activity and retention behavior.

---

## 🛠️ Tools & Technologies

* **Google BigQuery**
* **GoogleSQL**
* CTEs (`WITH`)
* Window Functions (`DENSE_RANK`)
* Conditional Aggregation
* `COUNT DISTINCT`
* `SAFE_DIVIDE`
* Date & Time Functions
* `CASE WHEN`

---

## 📊 Key Metrics

### 1. L7D Active Customers

Number of unique customers who made a transaction within the **last 7 days** of the analysis period.

### 2. L30D Active Customers

Number of unique customers who made a transaction within the **last 30 days**.

### 3. Average Daily Active Customers

Average number of unique active customers per day during the analysis period.

### 4. New Customer Rate

Percentage of active customers classified as new customers.

### 5. Retained Customer Rate

Percentage of customers who were previously active and continued to transact during the analysis period.

### 6. Retention Rate

Measures the proportion of customers who remained active compared to the relevant previous customer base.

### 7. Store Contribution

Measures each store's contribution to the total number of active customers across all stores.

### 8. Store Ranking

Stores are ranked based on their customer activity and retention performance using `DENSE_RANK()`.

---

## 🔎 Analysis Approach

The analysis follows several stages:

### 1. Data Preparation

Transaction data is prepared by selecting the required customer, store, and transaction date information.

### 2. Customer Activity Analysis

Customers are classified based on their recent transaction activity, including:

* Last 7 Days
* Last 30 Days
* Daily activity

### 3. New vs Retained Customer Segmentation

Customers are segmented into:

* **New Customers** — customers who recently started transacting.
* **Retained Customers** — customers who had previous activity and remained active.

### 4. Store-Level Aggregation

Customer-level metrics are aggregated by store to compare performance across the six stores.

### 5. Store Ranking

`DENSE_RANK()` is used to rank stores based on customer activity and retention metrics.

### 6. Contribution Analysis

Each store's contribution to total active customers is calculated to understand its relative importance across the business.

---

## 📈 Key Findings

### 🥇 Siber Sentra — Strongest Overall Customer Base

Siber Sentra ranked **#1 in L30D Active Customers**, with **3,437 active customers**.

The store contributed approximately **33.41% of total L30D active customers across all stores** and achieved a strong **78.64% retention rate**.

This indicates that Siber Sentra has both a large active customer base and relatively strong customer retention.

---

### 🚀 Master PC Indonesia — Strong Acquisition but Retention Risk

Master PC Indonesia recorded the **highest L30D active rate at 71.45%** and the **highest new customer rate at 74.85%**.

However, its retained customer rate was only **25.15%**.

This indicates that the store is highly effective at acquiring new customers, but a relatively small proportion of customers are retained.

**Business implication:**
Master PC Indonesia may benefit from stronger post-purchase engagement and customer retention initiatives to convert newly acquired customers into repeat customers.

---

### 📊 Dunia Notebook & Master PC Indonesia — High Relative Daily Activity

Dunia Notebook and Master PC Indonesia showed relatively higher daily activity rates of approximately **2.93% and 3.69%**, respectively.

Despite having smaller customer bases compared with some larger stores, these stores demonstrate relatively strong customer activity compared with their overall customer population.

**Business implication:**
These stores may have more engaged customer bases and could provide useful benchmarks for customer engagement strategies.

---

### ⚠️ KlikKomputer Id & Matrix Computer — Retention Opportunity

KlikKomputer Id and Matrix Computer recorded moderate retention rates of approximately **68%**.

Although their retention performance is relatively stable, there is still room to improve customer engagement and encourage repeat transactions.

Potential strategies include:

* Personalized promotions
* Repeat-purchase campaigns
* Customer loyalty programs
* Targeted remarketing
* Post-purchase engagement

---

## 💡 Business Recommendations

Based on the analysis, several strategies can be considered:

### 1. Strengthen Retention at Master PC Indonesia

The high new customer rate combined with the relatively low retained customer rate suggests a potential churn risk.

Focus on converting first-time customers into repeat customers through:

* Follow-up campaigns
* Personalized offers
* Loyalty incentives
* Repeat-purchase reminders

### 2. Leverage Siber Sentra as a Benchmark

Siber Sentra demonstrates strong performance in both customer volume and retention.

Its customer engagement strategy can be investigated and potentially used as a benchmark for other stores.

### 3. Improve Engagement at Moderate-Retention Stores

KlikKomputer Id and Matrix Computer can focus on increasing repeat purchases and customer engagement.

### 4. Study High-Activity Stores

Dunia Notebook and Master PC Indonesia show relatively high daily activity rates.

Further analysis could investigate what customer behaviors, products, or transaction patterns contribute to this activity.

---

## 📌 Key Takeaways

| Store                   | Key Finding                   | Business Interpretation                     |
| ----------------------- | ----------------------------- | ------------------------------------------- |
| **Siber Sentra**        | Highest L30D active customers | Strong customer scale and retention         |
| **Master PC Indonesia** | Highest new customer rate     | Strong acquisition but potential churn risk |
| **Dunia Notebook**      | High daily activity rate      | Relatively engaged customer base            |
| **KlikKomputer Id**     | ~68% retention                | Stable but has room for improvement         |
| **Matrix Computer**     | ~68% retention                | Stable but has room for improvement         |

---

## 🧮 SQL Techniques Demonstrated

This project demonstrates practical Data Analyst SQL techniques including:

```sql
WITH ...
```

**CTEs** for breaking complex analysis into logical steps.

```sql
DENSE_RANK() OVER (
    ORDER BY ...
)
```

**Window Functions** for ranking store performance.

```sql
COUNT(DISTINCT customer_id)
```

**Distinct customer counting** for customer activity metrics.

```sql
COUNTIF(...)
```

**Conditional aggregation** for customer segmentation.

```sql
SAFE_DIVIDE(...)
```

**Safe percentage calculations** to prevent division-by-zero errors.

---

## 📁 Project Structure

```text
Customer-Activity-Retention-Analysis-by-Store/
│
├── README.md
│
├── sql/
│   └── customer_activity_retention.sql
│
├── data/
│   └── README.md
│
└── dashboard/
    └── README.md
```

> The raw transaction dataset is not included in this repository to maintain data privacy and avoid unnecessarily exposing source data.

---

## 📊 Potential Dashboard

The analysis can be further visualized through a dashboard containing:

* L7D Active Customers by Store
* L30D Active Customers by Store
* Retention Rate by Store
* New vs Retained Customer Distribution
* Store Customer Contribution
* Store Ranking
* Daily Customer Activity Trend

Recommended dashboard tools include **Looker Studio, Tableau, or Power BI**.

---

## 🚀 Future Analysis

This project can be extended with additional customer analytics such as:

* Customer Cohort Analysis
* Monthly Retention Rate
* Customer Churn Analysis
* Repeat Purchase Rate
* Customer Lifetime Value (CLV)
* RFM Customer Segmentation
* Customer Purchase Frequency
* Average Transaction Value
* Customer Reactivation Analysis

These additional analyses would provide a deeper understanding of **customer lifecycle and long-term customer value**.

---

## 👤 Author

**Adient fir**

Data Analyst Portfolio Project

**Focus:** SQL | Customer Analytics | Retention Analysis | BigQuery
