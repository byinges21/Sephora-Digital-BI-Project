WITH base AS (
  SELECT
    channel,
    SUM(sessions) AS sessions,
    SUM(product_views) AS product_views,
    SUM(add_to_cart) AS add_to_cart,
    SUM(checkout_starts) AS checkout_starts,
    SUM(orders) AS orders,
    SUM(revenue) AS revenue
  FROM fact_sessions
  GROUP BY channel
)
SELECT
  channel,
  sessions,
  product_views,
  add_to_cart,
  checkout_starts,
  orders,
  ROUND(revenue, 2) AS revenue,
  ROUND(1.0 * orders / NULLIF(sessions, 0), 4) AS session_to_order_rate,
  ROUND(1.0 * add_to_cart / NULLIF(product_views, 0), 4) AS view_to_cart_rate,
  ROUND(1.0 * checkout_starts / NULLIF(add_to_cart, 0), 4) AS cart_to_checkout_rate,
  ROUND(1.0 * orders / NULLIF(checkout_starts, 0), 4) AS checkout_to_order_rate,
  ROUND(1.0 * revenue / NULLIF(orders, 0), 2) AS avg_order_value,
  ROUND(1.0 * revenue / NULLIF(sessions, 0), 2) AS revenue_per_session
FROM base
ORDER BY revenue DESC;
