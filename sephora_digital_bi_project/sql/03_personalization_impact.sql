WITH perf AS (
  SELECT
    is_personalized,
    SUM(sessions) AS sessions,
    SUM(add_to_cart) AS add_to_cart,
    SUM(checkout_starts) AS checkout_starts,
    SUM(orders) AS orders,
    SUM(revenue) AS revenue
  FROM fact_sessions
  GROUP BY is_personalized
)
SELECT
  CASE WHEN is_personalized = 1 THEN 'personalized' ELSE 'non_personalized' END AS experience,
  sessions,
  add_to_cart,
  checkout_starts,
  orders,
  ROUND(revenue, 2) AS revenue,
  ROUND(1.0 * orders / NULLIF(sessions, 0), 4) AS session_to_order_rate,
  ROUND(1.0 * revenue / NULLIF(orders, 0), 2) AS avg_order_value,
  ROUND(1.0 * revenue / NULLIF(sessions, 0), 2) AS revenue_per_session
FROM perf
ORDER BY experience;

SELECT
  channel,
  CASE WHEN is_personalized = 1 THEN 'personalized' ELSE 'non_personalized' END AS experience,
  SUM(sessions) AS sessions,
  SUM(orders) AS orders,
  ROUND(1.0 * SUM(orders) / SUM(sessions), 4) AS session_to_order_rate,
  ROUND(SUM(revenue), 2) AS revenue,
  ROUND(1.0 * SUM(revenue) / SUM(sessions), 2) AS revenue_per_session
FROM fact_sessions
GROUP BY channel, is_personalized
ORDER BY channel, experience;
