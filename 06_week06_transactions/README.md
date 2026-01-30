# Week 06: Billing and reporting

## Learning goals
- Model invoices, line items, and payments.
- Build reporting views for balances and revenue.
- Validate totals with integrity queries.

## Run order
1) shared/reset.sql
2) 03_week03_normalization/schema_v1.sql
3) 03_week03_normalization/seed_v1.sql
4) 06_week06_transactions/schema_billing.sql
5) 06_week06_transactions/seed_billing.sql
6) 06_week06_transactions/reporting_views.sql
7) 06_week06_transactions/integrity.sql

## Deliverables
- 06_week06_transactions/reporting_views.sql (run output)
- Integrity check output showing 0 rows

## Grading criteria
- Views return correct aggregates
- No invoice total mismatches
- Payments do not exceed invoice totals
- Naming follows snake_case


