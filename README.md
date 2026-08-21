# Customer Activity & Retention Analysis by Store

## 📌 Project Overview

This project analyzes customer transaction data to evaluate and compare **customer activity, acquisition, and retention performance across 6 stores**.

The analysis focuses on identifying differences in customer engagement between stores using activity and retention metrics such as **L7D Active Customers, L30D Active Customers, Average Daily Active Customers, New Customers, Retained Customers, and Retention Rate**.

The analysis was conducted using **Google BigQuery (GoogleSQL)** with CTEs, window functions, conditional aggregations, and safe division techniques.


---

## 🗂️ Dataset

The analysis uses customer transaction records from the `tabinvoice` table.

### Key Columns

| Column          | Description                                    |
| ----------------| -----------------------------------------------|    
| `store`         | Store identifier/name                          |
| `customer_id`   | Unique customer identifier                     | 
| `customer_name` | Customer name associated with the transaction  |
| `sales_date`    | Transaction date                               |
| `invoice`       | Transaction/invoice identifier                 |
| `net_total`     | Transaction revenue                            |
| `total_qty`     | Transaction quantity                           |

The analysis primarily uses:

* Store
* Customer_id
* Transaction date

to determine customer activity and retention behavior.

---

## 🛠️ Tools & Technologies

* **Google BigQuery**
* **GoogleSQL**
* **Tableau**
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
│   └── item.csv
    └── tabinvoice.csv
│
└── dashboard/
    └── Dashboard Customer Activity & retention analysis.png
```

> The raw transaction dataset is not included in this repository to maintain data privacy and avoid unnecessarily exposing source data.

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

[Curiculum Vitae](Https://xxx) | [Portofolio](Https://xxx)

**Adient fir**

Data Analyst Portfolio Project

**Focus:** SQL | Customer Analytics | Retention Analysis | BigQuery


