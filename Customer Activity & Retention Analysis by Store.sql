--Customer Activity & Retention Analysis by Store 
WITH max_date AS (
  SELECT
    MAX(sales_date) AS max_sales_date
  FROM privat-class.course1.tabinvoice
),

base AS (
  SELECT
    store,
    customer_id,
    sales_date
  FROM privat-class.course1.tabinvoice
  WHERE customer_id IS NOT NULL
),

-- Transaksi pertama per customer per store
customer_first_transaction AS (
  SELECT
    store,
    customer_id,
    MIN(sales_date) AS first_transaction_date
  FROM base
  GROUP BY store, customer_id
),

-- Daily active customer 30 hari terakhir
daily_customer AS (
  SELECT
    b.store,
    b.sales_date,
    COUNT(DISTINCT b.customer_id) AS daily_active
  FROM base b
  CROSS JOIN max_date m
  WHERE b.sales_date BETWEEN DATE_SUB(m.max_sales_date, INTERVAL 29 DAY) AND m.max_sales_date
  GROUP BY b.store, b.sales_date
),

-- Avg Daily 
avg_daily AS (
  SELECT
    store,
    ROUND(AVG(daily_active), 0) AS avg_daily
  FROM daily_customer
  GROUP BY store
),

-- Rekap L7D, L30D, New, dan Retained 
store_metrics AS (
  SELECT
    b.store,
    COUNT(DISTINCT b.customer_id) AS total_member,
    
    -- Active L7D
    COUNT(DISTINCT CASE 
      WHEN b.sales_date BETWEEN DATE_SUB(m.max_sales_date, INTERVAL 6 DAY) AND m.max_sales_date 
      THEN b.customer_id 
    END) AS l7d_active,

    -- Active L30D
    COUNT(DISTINCT CASE 
      WHEN b.sales_date BETWEEN DATE_SUB(m.max_sales_date, INTERVAL 29 DAY) AND m.max_sales_date 
      THEN b.customer_id 
    END) AS l30d_active,

    -- New Customer L30D (Aktif di L30D & First Transaction di L30D)
    COUNT(DISTINCT CASE 
      WHEN b.sales_date BETWEEN DATE_SUB(m.max_sales_date, INTERVAL 29 DAY) AND m.max_sales_date 
           AND f.first_transaction_date BETWEEN DATE_SUB(m.max_sales_date, INTERVAL 29 DAY) AND m.max_sales_date 
      THEN b.customer_id 
    END) AS l30d_new,

    -- Retained Customer L30D (Aktif di L30D & First Transaction sebelum L30D)
    COUNT(DISTINCT CASE 
      WHEN b.sales_date BETWEEN DATE_SUB(m.max_sales_date, INTERVAL 29 DAY) AND m.max_sales_date 
           AND f.first_transaction_date < DATE_SUB(m.max_sales_date, INTERVAL 29 DAY) 
      THEN b.customer_id 
    END) AS retained_customer

  FROM base b
  JOIN customer_first_transaction f
    ON b.store = f.store AND b.customer_id = f.customer_id
  CROSS JOIN max_date m
  GROUP BY b.store
)

SELECT
  m.store,
  m.total_member,
  ROUND(COALESCE(a.avg_daily, 0), 2) AS avg_daily,
  ROUND(SAFE_DIVIDE(COALESCE(a.avg_daily, 0), m.total_member) * 100, 2) AS pct_avg_daily,
  m.l7d_active,
  ROUND(SAFE_DIVIDE(m.l7d_active, m.total_member) * 100, 2) AS pct_l7d_active,
  m.l30d_active,
  ROUND(SAFE_DIVIDE(m.l30d_active, m.total_member) * 100, 2) AS pct_l30d_active,
  ROUND(SAFE_DIVIDE(m.l30d_new, m.l30d_active) * 100, 2) AS pct_l30d_new,
  ROUND(SAFE_DIVIDE(m.retained_customer, m.l30d_active) * 100, 2) AS pct_retention,

  -- 1. Peringkat Toko berdasarkan L30D Active
  DENSE_RANK() OVER (
    ORDER BY m.l30d_active DESC
  ) AS rank_by_active_customer,

  -- 2. % Kontribusi Toko terhadap Total Customer Aktif Semua Toko
  ROUND(
    SAFE_DIVIDE(
      m.l30d_active,
      SUM(m.l30d_active) OVER ()
    ) * 100,
    2
  ) AS pct_share_l30d_all_stores
  
FROM store_metrics m
LEFT JOIN avg_daily a
  USING(store)
ORDER BY
  m.l30d_active DESC;
