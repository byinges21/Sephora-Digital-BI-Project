# Power BI Build Guide

## 1) Prepare Data
1. Run:
```bash
sqlite3 sephora_bi.db < data/schema_and_seed.sql
sqlite3 -header -csv sephora_bi.db "SELECT * FROM fact_sessions;" > data/fact_sessions.csv
```
2. In Power BI Desktop: `Get Data` -> `Text/CSV` -> import `data/fact_sessions.csv`.

## 2) Create Measures (DAX)
```DAX
Sessions = SUM(fact_sessions[sessions])
Orders = SUM(fact_sessions[orders])
Revenue = SUM(fact_sessions[revenue])
Product Views = SUM(fact_sessions[product_views])
Add To Cart = SUM(fact_sessions[add_to_cart])
Checkout Starts = SUM(fact_sessions[checkout_starts])

Session to Order Rate = DIVIDE([Orders], [Sessions])
View to Cart Rate = DIVIDE([Add To Cart], [Product Views])
Cart to Checkout Rate = DIVIDE([Checkout Starts], [Add To Cart])
Checkout to Order Rate = DIVIDE([Orders], [Checkout Starts])
Revenue per Session = DIVIDE([Revenue], [Sessions])
AOV = DIVIDE([Revenue], [Orders])
```

## 3) Build Pages
- Page 1 Executive KPI Overview:
  - Cards: Sessions, Orders, Revenue, Session to Order Rate, AOV, Revenue per Session
  - Line chart by `session_date`
  - Bar chart by `channel`
- Page 2 Funnel Performance:
  - Funnel visual by stage and channel
  - Clustered bars for stage conversion rates
  - Matrix for `channel x traffic_source`
- Page 3 Personalization Impact:
  - Comparison visuals split by `is_personalized`
  - Channel uplift chart for conversion and revenue/session

## 4) Screenshot Checklist
- `executive_kpis.png`
- `funnel_performance.png`
- `personalization_impact.png`

## 5) Publish in Repo
- Save screenshots in `dashboard/screenshots/powerbi/`.
- Reference screenshots in root `README.md` when available.
