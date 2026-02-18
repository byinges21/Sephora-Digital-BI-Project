# Sephora Digital BI Portfolio Project

Interview-ready BI case study aligned to Sephora's Digital Analytics role.

## Contents
- `data/schema_and_seed.sql`: creates and seeds sample ecommerce data
- `sql/01_kpi_performance.sql`: channel KPI rollup
- `sql/02_funnel_analysis.sql`: funnel and drop-off diagnostics
- `sql/03_personalization_impact.sql`: personalized vs non-personalized impact
- `dashboard/dashboard_spec.md`: Tableau/Power BI page blueprint
- `docs/executive_storyline.md`: 5-7 minute leadership narrative
- `docs/interview_talk_track.md`: interview script and Q&A
- `docs/resume_bullets.md`: bullets you can paste in your resume

## Data model
`fact_sessions`
- session_id, session_date, channel, device_type, traffic_source, campaign
- is_personalized, sessions, product_views, add_to_cart, checkout_starts, orders, revenue

## Run locally
```bash
cd /Users/betelhemyinges/Documents/New\ project/sephora_digital_bi_project
sqlite3 sephora_bi.db < data/schema_and_seed.sql
sqlite3 -header -column sephora_bi.db < sql/01_kpi_performance.sql
sqlite3 -header -column sephora_bi.db < sql/02_funnel_analysis.sql
sqlite3 -header -column sephora_bi.db < sql/03_personalization_impact.sql
```
