# Design workflow checklist

## Before modeling
- [ ] Clarify business rules and required outcomes.
- [ ] Identify core entities and relationships.
- [ ] List key attributes and data types.

## ER modeling
- [ ] Draw entities with primary keys.
- [ ] Add relationships with correct cardinality.
- [ ] Resolve many-to-many with junction tables.

## Normalization
- [ ] Remove repeating groups (1NF).
- [ ] Eliminate partial dependencies (2NF).
- [ ] Eliminate transitive dependencies (3NF).

## DDL build
- [ ] Create tables in dependency order.
- [ ] Add primary keys and foreign keys.
- [ ] Add NOT NULL, UNIQUE, and CHECK constraints.
- [ ] Add indexes for common filters and joins.

## Data validation
- [ ] Seed minimal sample data.
- [ ] Run integrity checks.
- [ ] Fix anomalies and re-run checks.

## Review
- [ ] Verify naming conventions.
- [ ] Review join paths for ambiguity.
- [ ] Confirm queries meet requirements.
