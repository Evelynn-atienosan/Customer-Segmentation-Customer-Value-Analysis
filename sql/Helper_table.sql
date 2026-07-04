

/*creating a helper table*/

CREATE TABLE delivered_order_totals_helper AS
SELECT
  o.order_id,
  c.customer_unique_id,
  DATE(o.order_purchase_timestamp) AS purchase_date,
  CAST(DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m-01') AS DATE) AS purchase_month,
  SUM(oi.price + oi.freight_value) AS order_value
FROM orders o
JOIN customers c
  ON o.customer_id = c.customer_id
JOIN order_items oi
  ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered'
GROUP BY
  o.order_id,
  c.customer_unique_id,
  DATE(o.order_purchase_timestamp),
  CAST(DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m-01') AS DATE);
