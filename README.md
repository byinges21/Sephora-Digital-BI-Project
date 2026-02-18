# Sephora Digital BI Portfolio Project
A recruiter-ready digital analytics case study showing how BI can improve ecommerce conversion and revenue across desktop web, mobile web, and app.

## Business Objective
This project simulates a Business Intelligence analyst workflow for Sephora-style digital channels. The objective is to identify where conversion is leaking, quantify the impact of personalization, and prioritize actions that increase revenue per session.

## Key Findings
- App outperforms other channels on efficiency: `6.68%` session-to-order rate and `4.95` revenue per session.
- Mobile web has the largest monetization gap: `2.15%` session-to-order rate and `1.48` revenue per session.
- Funnel leakage is highest on mobile web from cart to checkout (`62.60%` progression), indicating checkout friction.
- Personalization performs better overall: `4.76%` session-to-order rate vs `2.70%` for non-personalized sessions.
- Revenue impact follows the same pattern: personalized experiences drive `3.52` revenue per session vs `1.99` non-personalized.

## Business Recommendations
1. Prioritize mobile web checkout simplification (payment, shipping form friction, and speed).
2. Expand personalization to more high-traffic mobile web entry points and categories.
3. Establish weekly channel x source review with KPI guardrails and clear owners.
4. Use app best practices as a blueprint for mobile web conversion improvements.

## Tech Stack + Methods
- SQL (SQLite) for KPI rollups, funnel diagnostics, and personalization analysis.
- BI planning for both Power BI and Tableau, with shared KPI definitions.
- Funnel model: `product_view -> add_to_cart -> checkout_start -> order`.
- Segmentation: channel, traffic source, campaign, and personalization exposure.

## Repository Map
- `data/schema_and_seed.sql`: schema + seeded sample ecommerce data.
- `sql/01_kpi_performance.sql`: KPI summary by channel.
- `sql/02_funnel_analysis.sql`: funnel conversion + source diagnostics.
- `sql/03_personalization_impact.sql`: personalized vs non-personalized performance.
- `dashboard/dashboard_spec.md`: canonical KPI definitions and dashboard blueprint.
- `dashboard/powerbi_guide.md`: implementation guide for Power BI.
- `dashboard/tableau_guide.md`: implementation guide for Tableau.
- `docs/executive_storyline.md`: 5-7 minute leadership readout script.
- `docs/interview_talk_track.md`: interview framing and responses.
- `docs/resume_bullets.md`: resume-ready bullet points.

## How to Reproduce
```bash
cd "/Users/betelhemyinges/Documents/New project"
sqlite3 sephora_bi.db < data/schema_and_seed.sql
sqlite3 -header -column sephora_bi.db < sql/01_kpi_performance.sql
sqlite3 -header -column sephora_bi.db < sql/02_funnel_analysis.sql
sqlite3 -header -column sephora_bi.db < sql/03_personalization_impact.sql
```

## Dashboard Build Options
- Power BI: follow `dashboard/powerbi_guide.md`.
- Tableau: follow `dashboard/tableau_guide.md`.
- Both guides use identical KPI formulas and page structure so outputs are comparable.

## Interview Talking Points
- I translated digital behavior into measurable business outcomes.
- I identified the highest-leverage channel-stage bottlenecks instead of only reporting topline KPIs.
- I connected analysis to actionable product and merchandising decisions.
- I designed a consistent metric layer that works across BI tools and stakeholder audiences.
