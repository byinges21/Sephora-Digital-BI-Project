# Tableau Build Guide

## 1) Prepare Data
1. Run:
```bash
sqlite3 sephora_bi.db < data/schema_and_seed.sql
sqlite3 -header -csv sephora_bi.db "SELECT * FROM fact_sessions;" > data/fact_sessions.csv
```
2. In Tableau: connect to `Text file` and load `data/fact_sessions.csv`.

## 2) Create Calculated Fields
```text
Sessions = SUM([sessions])
Orders = SUM([orders])
Revenue = SUM([revenue])
Product Views = SUM([product_views])
Add To Cart = SUM([add_to_cart])
Checkout Starts = SUM([checkout_starts])

Session to Order Rate = SUM([orders]) / SUM([sessions])
View to Cart Rate = SUM([add_to_cart]) / SUM([product_views])
Cart to Checkout Rate = SUM([checkout_starts]) / SUM([add_to_cart])
Checkout to Order Rate = SUM([orders]) / SUM([checkout_starts])
Revenue per Session = SUM([revenue]) / SUM([sessions])
AOV = SUM([revenue]) / SUM([orders])
```

## 3) Build Dashboards
- Dashboard 1 Executive KPI Overview:
  - KPI BANs for sessions, orders, revenue, conversion, AOV, revenue/session
  - Daily trend chart by date
  - Channel comparison bar chart
- Dashboard 2 Funnel Performance:
  - Funnel by channel (stage progression)
  - Stage conversion chart
  - `channel x traffic_source` diagnostic table
- Dashboard 3 Personalization Impact:
  - Personalized vs non-personalized KPI comparison
  - Uplift by channel chart

## 4) Screenshot Checklist
- `executive_kpis.png`
- `funnel_performance.png`
- `personalization_impact.png`

## 5) Publish in Repo
- Save screenshots in `dashboard/screenshots/tableau/`.
- Reference screenshots in root `README.md` when available.
