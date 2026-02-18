# Sephora Digital BI Portfolio Project

This project simulates the work of an **Analyst, Business Intelligence & Analytics, Digital** at Sephora.

It demonstrates how to:
- Analyze digital performance across desktop, mobile web, and app
- Diagnose funnel drop-off and conversion opportunities
- Evaluate feature launches and personalization impact
- Build executive-ready KPI reporting and recommendations

## 1) Business Scenario
You are the Digital BI Analyst supporting Sephora's ecommerce channels:
- `desktop_web`
- `mobile_web`
- `app`

Leadership wants to understand:
1. Which channel drives the strongest conversion and revenue efficiency
2. Where users drop off in the purchase funnel
3. Whether a new personalization module improved outcomes
4. Which initiatives should be prioritized next quarter

## 2) Project Deliverables
- **Data model and sample data**: `data/`
- **SQL analyses**: `sql/01_kpi_performance.sql`, `sql/02_funnel_analysis.sql`, `sql/03_personalization_impact.sql`
- **Dashboard blueprint**: `dashboard/dashboard_spec.md`
- **Executive readout outline**: `docs/executive_storyline.md`
- **Interview talk track**: `docs/interview_talk_track.md`

## 3) Data Model (Star Schema)
### Fact table
- `fact_sessions`
  - `session_id`
  - `session_date`
  - `channel` (`desktop_web`, `mobile_web`, `app`)
  - `device_type`
  - `traffic_source`
  - `campaign`
  - `is_personalized` (0/1)
  - `sessions` (aggregated visit volume)
  - `product_views`
  - `add_to_cart`
  - `checkout_starts`
  - `orders`
  - `revenue`

### Dimensions
- `dim_channel`
- `dim_traffic_source`
- `dim_calendar`

## 4) How to Run (SQLite)
```bash
cd /Users/betelhemyinges/Documents/New\ project/sephora_digital_bi_project
sqlite3 sephora_bi.db < data/schema_and_seed.sql
sqlite3 -header -column sephora_bi.db < sql/01_kpi_performance.sql
sqlite3 -header -column sephora_bi.db < sql/02_funnel_analysis.sql
sqlite3 -header -column sephora_bi.db < sql/03_personalization_impact.sql
```

## 5) Recommended Dashboard Pages
1. **Executive KPI Overview**
2. **Channel & Funnel Performance**
3. **Personalization Impact**
4. **Opportunity Backlog & Experiment Tracker**

## 6) What to Show Recruiters / Hiring Managers
- Your SQL depth (joins, CTEs, KPI logic)
- Your ability to connect metrics to business decisions
- Your product thinking (measurement plan, tracking requirements)
- Your communication style for technical and non-technical audiences

## 7) Suggested Next Steps
- Recreate the dashboard in Tableau or Power BI
- Add one A/B test design and power assumptions
- Convert recommendations into a 30-60-90 day action plan
