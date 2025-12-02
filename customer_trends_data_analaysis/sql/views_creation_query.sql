-- 1. view_customer_revenue_gender
-- Q1 repeated often in analytics → gender-wise performance.

CREATE VIEW view_customer_revenue_gender AS
SELECT gender,
       SUM(purchase_amount) AS total_revenue
FROM customer
GROUP BY gender;

-- 2. view_discount_vs_avg_purchase
-- Q2 logic reused in promo-analysis dashboards.

CREATE VIEW view_discount_vs_avg_purchase AS
SELECT customer_id,
       purchase_amount
FROM customer
WHERE discount_applied = 'Yes'
  AND purchase_amount >= (SELECT AVG(purchase_amount) FROM customer);

-- 3. view_product_avg_rating
-- Q3 forms the base layer for product ranking, trend analysis.

CREATE VIEW view_product_avg_rating AS
SELECT item_purchased,
       ROUND(AVG(review_rating::numeric), 2) AS avg_rating
FROM customer
GROUP BY item_purchased;

-- 4. view_shipping_purchase_stats
-- shipping KPI is reused in ops dashboards.

CREATE VIEW view_shipping_purchase_stats AS
SELECT shipping_type,
       ROUND(AVG(purchase_amount), 2) AS avg_purchase
FROM customer
WHERE shipping_type IN ('Standard', 'Express')
GROUP BY shipping_type;

-- 5. view_subscription_revenue
-- Q5 used heavily in customer-lifecycle dashboards.

CREATE VIEW view_subscription_revenue AS
SELECT subscription_status,
       COUNT(customer_id) AS total_customers,
       ROUND(AVG(purchase_amount),2) AS avg_spend,
       ROUND(SUM(purchase_amount),2) AS total_revenue
FROM customer
GROUP BY subscription_status;

-- 6. view_customer_segments
-- Q7 segmentation is a foundational dimension table reused across models.

CREATE VIEW view_customer_segments AS
WITH customer_type AS (
    SELECT customer_id,
           previous_purchases,
           CASE
               WHEN previous_purchases = 1 THEN 'New'
               WHEN previous_purchases BETWEEN 2 AND 10 THEN 'Returning'
               ELSE 'Loyal'
           END AS customer_segment
    FROM customer
)
SELECT customer_id,
       customer_segment
FROM customer_type;









  
