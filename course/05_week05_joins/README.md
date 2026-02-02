# Week 05: Constraints and triggers

## Learning goals

- Enforce scheduling rules using triggers.
- Detect overlaps with integrity queries.
- Understand trigger behavior on INSERT/UPDATE.

## Run order

1) shared/reset.sql
2) course/03_week03_normalization/schema_v1.sql
3) course/03_week03_normalization/seed_v1.sql
4) course/05_week05_joins/rules.sql
5) course/05_week05_joins/test_negative_inserts.sql
6) course/05_week05_joins/integrity.sql

## Deliverables

- course/05_week05_joins/test_negative_inserts.sql (run results)
- Notes explaining why each statement fails

## Grading criteria

- Triggers block overlapping inserts/updates
- Error messages are clear
- Integrity query returns 0 rows
- Test cases are executed correctly
