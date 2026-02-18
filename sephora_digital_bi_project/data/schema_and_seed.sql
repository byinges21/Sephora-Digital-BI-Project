DROP TABLE IF EXISTS fact_sessions;
DROP TABLE IF EXISTS dim_channel;
DROP TABLE IF EXISTS dim_traffic_source;
DROP TABLE IF EXISTS dim_calendar;

CREATE TABLE dim_channel (
  channel_id INTEGER PRIMARY KEY,
  channel TEXT NOT NULL
);

CREATE TABLE dim_traffic_source (
  source_id INTEGER PRIMARY KEY,
  traffic_source TEXT NOT NULL
);

CREATE TABLE dim_calendar (
  date_id TEXT PRIMARY KEY,
  year INTEGER,
  month INTEGER,
  week INTEGER,
  day_of_week TEXT
);

CREATE TABLE fact_sessions (
  session_id INTEGER PRIMARY KEY,
  session_date TEXT NOT NULL,
  channel TEXT NOT NULL,
  device_type TEXT NOT NULL,
  traffic_source TEXT NOT NULL,
  campaign TEXT,
  is_personalized INTEGER NOT NULL,
  sessions INTEGER NOT NULL DEFAULT 1,
  product_views INTEGER NOT NULL,
  add_to_cart INTEGER NOT NULL,
  checkout_starts INTEGER NOT NULL,
  orders INTEGER NOT NULL,
  revenue REAL NOT NULL
);

INSERT INTO dim_channel (channel_id, channel) VALUES
(1, 'desktop_web'),
(2, 'mobile_web'),
(3, 'app');

INSERT INTO dim_traffic_source (source_id, traffic_source) VALUES
(1, 'organic_search'),
(2, 'paid_search'),
(3, 'email'),
(4, 'social'),
(5, 'direct');

INSERT INTO dim_calendar (date_id, year, month, week, day_of_week) VALUES
('2026-01-05', 2026, 1, 2, 'Monday'),
('2026-01-06', 2026, 1, 2, 'Tuesday'),
('2026-01-07', 2026, 1, 2, 'Wednesday'),
('2026-01-08', 2026, 1, 2, 'Thursday'),
('2026-01-09', 2026, 1, 2, 'Friday'),
('2026-01-12', 2026, 1, 3, 'Monday'),
('2026-01-13', 2026, 1, 3, 'Tuesday'),
('2026-01-14', 2026, 1, 3, 'Wednesday'),
('2026-01-15', 2026, 1, 3, 'Thursday'),
('2026-01-16', 2026, 1, 3, 'Friday');

INSERT INTO fact_sessions
(session_id, session_date, channel, device_type, traffic_source, campaign, is_personalized, product_views, add_to_cart, checkout_starts, orders, revenue)
VALUES
(1, '2026-01-05', 'desktop_web', 'desktop', 'organic_search', 'n/a', 0, 180, 42, 30, 24, 1824.00),
(2, '2026-01-05', 'mobile_web', 'mobile', 'paid_search', 'winter_skin', 0, 220, 44, 25, 16, 1104.00),
(3, '2026-01-05', 'app', 'mobile', 'email', 'loyalty_drop', 1, 260, 76, 58, 46, 3358.00),
(4, '2026-01-05', 'desktop_web', 'desktop', 'direct', 'n/a', 1, 150, 39, 29, 23, 1794.00),
(5, '2026-01-05', 'mobile_web', 'mobile', 'social', 'fragrance_new', 1, 205, 49, 33, 21, 1428.00),
(6, '2026-01-06', 'desktop_web', 'desktop', 'paid_search', 'winter_skin', 0, 190, 45, 32, 25, 1950.00),
(7, '2026-01-06', 'mobile_web', 'mobile', 'organic_search', 'n/a', 0, 230, 46, 28, 17, 1173.00),
(8, '2026-01-06', 'app', 'mobile', 'direct', 'n/a', 1, 270, 81, 62, 49, 3626.00),
(9, '2026-01-06', 'desktop_web', 'desktop', 'email', 'loyalty_drop', 1, 165, 43, 31, 25, 1975.00),
(10, '2026-01-06', 'mobile_web', 'mobile', 'paid_search', 'fragrance_new', 1, 210, 51, 34, 22, 1518.00),
(11, '2026-01-07', 'desktop_web', 'desktop', 'organic_search', 'n/a', 0, 175, 41, 30, 23, 1725.00),
(12, '2026-01-07', 'mobile_web', 'mobile', 'social', 'winter_skin', 0, 225, 45, 26, 16, 1120.00),
(13, '2026-01-07', 'app', 'mobile', 'email', 'loyalty_drop', 1, 255, 79, 60, 47, 3478.00),
(14, '2026-01-07', 'desktop_web', 'desktop', 'direct', 'n/a', 1, 160, 40, 30, 24, 1848.00),
(15, '2026-01-07', 'mobile_web', 'mobile', 'direct', 'n/a', 1, 215, 53, 35, 23, 1587.00),
(16, '2026-01-08', 'desktop_web', 'desktop', 'paid_search', 'fragrance_new', 0, 185, 44, 31, 24, 1824.00),
(17, '2026-01-08', 'mobile_web', 'mobile', 'paid_search', 'winter_skin', 0, 235, 47, 27, 17, 1190.00),
(18, '2026-01-08', 'app', 'mobile', 'organic_search', 'n/a', 1, 268, 83, 64, 50, 3750.00),
(19, '2026-01-08', 'desktop_web', 'desktop', 'email', 'loyalty_drop', 1, 170, 45, 33, 26, 2054.00),
(20, '2026-01-08', 'mobile_web', 'mobile', 'social', 'fragrance_new', 1, 208, 50, 33, 21, 1459.00),
(21, '2026-01-09', 'desktop_web', 'desktop', 'organic_search', 'n/a', 0, 188, 46, 33, 25, 1925.00),
(22, '2026-01-09', 'mobile_web', 'mobile', 'organic_search', 'n/a', 0, 238, 48, 28, 18, 1260.00),
(23, '2026-01-09', 'app', 'mobile', 'direct', 'n/a', 1, 275, 84, 65, 52, 3900.00),
(24, '2026-01-09', 'desktop_web', 'desktop', 'direct', 'n/a', 1, 172, 44, 32, 25, 1975.00),
(25, '2026-01-09', 'mobile_web', 'mobile', 'email', 'loyalty_drop', 1, 212, 52, 34, 22, 1518.00),
(26, '2026-01-12', 'desktop_web', 'desktop', 'paid_search', 'winter_skin', 0, 182, 43, 31, 24, 1800.00),
(27, '2026-01-12', 'mobile_web', 'mobile', 'paid_search', 'winter_skin', 0, 228, 45, 26, 16, 1088.00),
(28, '2026-01-12', 'app', 'mobile', 'email', 'loyalty_drop', 1, 262, 80, 61, 48, 3552.00),
(29, '2026-01-12', 'desktop_web', 'desktop', 'email', 'loyalty_drop', 1, 168, 42, 31, 25, 1900.00),
(30, '2026-01-12', 'mobile_web', 'mobile', 'direct', 'n/a', 1, 210, 51, 33, 21, 1449.00),
(31, '2026-01-13', 'desktop_web', 'desktop', 'organic_search', 'n/a', 0, 186, 45, 32, 24, 1848.00),
(32, '2026-01-13', 'mobile_web', 'mobile', 'social', 'fragrance_new', 0, 232, 46, 27, 17, 1173.00),
(33, '2026-01-13', 'app', 'mobile', 'direct', 'n/a', 1, 271, 82, 63, 50, 3700.00),
(34, '2026-01-13', 'desktop_web', 'desktop', 'direct', 'n/a', 1, 169, 43, 32, 25, 1925.00),
(35, '2026-01-13', 'mobile_web', 'mobile', 'email', 'loyalty_drop', 1, 214, 52, 34, 22, 1496.00),
(36, '2026-01-14', 'desktop_web', 'desktop', 'paid_search', 'fragrance_new', 0, 184, 44, 31, 24, 1800.00),
(37, '2026-01-14', 'mobile_web', 'mobile', 'organic_search', 'n/a', 0, 229, 45, 26, 16, 1120.00),
(38, '2026-01-14', 'app', 'mobile', 'organic_search', 'n/a', 1, 269, 83, 64, 51, 3774.00),
(39, '2026-01-14', 'desktop_web', 'desktop', 'email', 'loyalty_drop', 1, 171, 44, 32, 25, 1950.00),
(40, '2026-01-14', 'mobile_web', 'mobile', 'social', 'winter_skin', 1, 211, 50, 33, 21, 1428.00),
(41, '2026-01-15', 'desktop_web', 'desktop', 'organic_search', 'n/a', 0, 187, 45, 32, 25, 1900.00),
(42, '2026-01-15', 'mobile_web', 'mobile', 'paid_search', 'fragrance_new', 0, 233, 46, 27, 17, 1190.00),
(43, '2026-01-15', 'app', 'mobile', 'email', 'loyalty_drop', 1, 273, 84, 65, 52, 3850.00),
(44, '2026-01-15', 'desktop_web', 'desktop', 'direct', 'n/a', 1, 170, 43, 31, 24, 1872.00),
(45, '2026-01-15', 'mobile_web', 'mobile', 'direct', 'n/a', 1, 213, 51, 34, 22, 1518.00),
(46, '2026-01-16', 'desktop_web', 'desktop', 'paid_search', 'winter_skin', 0, 189, 46, 33, 25, 1925.00),
(47, '2026-01-16', 'mobile_web', 'mobile', 'organic_search', 'n/a', 0, 236, 47, 28, 18, 1242.00),
(48, '2026-01-16', 'app', 'mobile', 'direct', 'n/a', 1, 276, 85, 66, 53, 3922.00),
(49, '2026-01-16', 'desktop_web', 'desktop', 'email', 'loyalty_drop', 1, 173, 45, 33, 26, 2054.00),
(50, '2026-01-16', 'mobile_web', 'mobile', 'email', 'loyalty_drop', 1, 216, 53, 35, 23, 1587.00);

UPDATE fact_sessions
SET sessions = CASE
  WHEN channel = 'desktop_web' THEN 600 + ((session_id % 5) * 25)
  WHEN channel = 'mobile_web' THEN 850 + ((session_id % 5) * 35)
  WHEN channel = 'app' THEN 700 + ((session_id % 5) * 30)
  ELSE 500
END;
