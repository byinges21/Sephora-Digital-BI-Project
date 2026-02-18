WITH channel_funnel AS (
  SELECT
    channel,
    SUM(product_views) AS views,
    SUM(add_to_cart) AS carts,
    SUM(checkout_starts) AS checkouts,
    SUM(orders) AS orders
  FROM fact_sessions
  GROUP BY channel
)
SELECT
  channel,
  views,
  carts,
  checkouts,
  orders,
  ROUND(1.0 * carts / NULLIF(views, 0), 4) AS view_to_cart,
  ROUND(1.0 * checkouts / NULLIF(carts, 0), 4) AS cart_to_checkout,
  ROUND(1.0 * orders / NULLIF(checkouts, 0), 4) AS checkout_to_order,
  ROUND(1.0 - (1.0 * carts / NULLIF(views, 0)), 4) AS drop_after_view,
  ROUND(1.0 - (1.0 * checkouts / NULLIF(carts, 0)), 4) AS drop_after_cart,
  ROUND(1.0 - (1.0 * orders / NULLIF(checkouts, 0)), 4) AS drop_after_checkout
FROM channel_funnel
ORDER BY channel;

-- Additional view for channel + traffic source diagnostics
SELECT
  channel,
  traffic_source,
  SUM(sessions) AS sessions,
  SUM(orders) AS orders,
  ROUND(1.0 * SUM(orders) / SUM(sessions), 4) AS session_to_order_rate,
  ROUND(SUM(revenue), 2) AS revenue
FROM fact_sessions
GROUP BY channel, traffic_source
ORDER BY channel, revenue DESC;
