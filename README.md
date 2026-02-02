# Clinic DB Design Course (MySQL 8.0)

## Table of contents

- Overview
- Learning outcomes
- Getting started
- Standard workflow
- Course structure
- Tooling and CI
- Contributing

## Course goals

- Design relational schemas using ER modeling and normalization principles.
- Implement schemas in MySQL Community Server 8.0.x.
- Apply constraints, transactions, and indexing for data integrity and performance.
- Practice iterative design changes with a final change request.

## Overview

This repository contains an 8-week bachelor-level course on relational database design using MySQL 8.0 and MySQL Workbench. Each week includes a focused lab with scripts, exercises, and guidance.

## Learning outcomes

- Translate requirements into ER models with correct cardinality and keys.
- Map ER models into normalized relational schemas.
- Write DDL with appropriate constraints and indexes.
- Detect and explain data anomalies and integrity violations.
- Validate schemas using repeatable integrity checks.

## Getting started

1) Install MySQL Community Server 8.0.x and MySQL Workbench 8.0.x:
   - `course/00_setup/00_mysql_install_windows.md`
2) Create a Workbench connection and user:
   - `course/00_setup/01_workbench_connection.md`
3) Run scripts in Workbench:
   - `course/00_setup/02_running_sql_scripts.md`
4) Start with Week 1:
   - `course/01_week01_basics/README.md`

## Standard workflow

Use the week-specific files for each lab. Examples:

Week 1 (denormalized):

1) `shared/reset.sql`
2) `course/01_week01_basics/schema.sql`
3) `course/01_week01_basics/seed.sql`
4) `course/01_week01_basics/exercises.sql`

Week 2 (ER modeling):

1) `course/02_week02_er_modeling/requirements.md`
2) `course/02_week02_er_modeling/er_diagram_template.drawio`
3) `course/02_week02_er_modeling/assumptions_template.md`
4) `course/02_week02_er_modeling/submission_checklist.md`

Week 3 (mapping):

1) `shared/reset.sql`
2) `course/03_week03_normalization/schema_v1.sql`
3) `course/03_week03_normalization/seed_v1.sql`
4) `course/03_week03_normalization/queries_v1.sql`
5) `course/03_week03_normalization/integrity_v1.sql`

Week 4 (normalization):

1) `course/04_week04_constraints/bad_schema.sql`
2) `course/04_week04_constraints/bad_seed.sql`
3) `course/04_week04_constraints/schema_v2.sql`
4) `course/04_week04_constraints/seed_v2.sql`
5) `course/04_week04_constraints/integrity_v2.sql`

Week 5 (overlap triggers):

1) `shared/reset.sql`
2) `course/03_week03_normalization/schema_v1.sql`
3) `course/03_week03_normalization/seed_v1.sql`
4) `course/05_week05_joins/rules.sql`
5) `course/05_week05_joins/test_negative_inserts.sql`
6) `course/05_week05_joins/integrity.sql`

Week 6 (billing):

1) `shared/reset.sql`
2) `course/03_week03_normalization/schema_v1.sql`
3) `course/03_week03_normalization/seed_v1.sql`
4) `course/06_week06_transactions/schema_billing.sql`
5) `course/06_week06_transactions/seed_billing.sql`
6) `course/06_week06_transactions/reporting_views.sql`
7) `course/06_week06_transactions/integrity.sql`

Week 7 (indexes and EXPLAIN):

1) `shared/reset.sql`
2) `course/03_week03_normalization/schema_v1.sql`
3) `course/03_week03_normalization/seed_v1.sql`
4) `course/06_week06_transactions/schema_billing.sql`
5) `course/06_week06_transactions/seed_billing.sql`
6) `course/07_week07_indexing/explain_tasks.sql` (before indexes)
7) `course/07_week07_indexing/indexes.sql`
8) `course/07_week07_indexing/explain_tasks.sql` (after indexes)

Week 8 (final change request):

1) `course/08_week08_final_change_request/change_request_A_insurance.md` or `course/08_week08_final_change_request/change_request_B_lab_tests.md` or `course/08_week08_final_change_request/change_request_C_rooms.md`
2) `course/08_week08_final_change_request/migration_template.sql`
3) `course/08_week08_final_change_request/final_submission_checklist.md`

## Course structure

- `course/00_setup/` (install notes, tooling, and starter checks)
- `shared/` (shared scripts and assets)
- `course/01_week01_basics/ ... course/08_week08_final_change_request/` (weekly materials)

## Environment

- Windows
- MySQL Community Server 8.0.x
- MySQL Workbench 8.0.x

## Solutions policy

Solutions are kept off the main branch. See `docs/solutions_policy.md` for the recommended workflow.

## Tooling and CI

- SQL smoke tests run with MySQL 8 on GitHub Actions.
- Integrity checks must return 0 rows (see `shared/integrity_contract.md`).
- Structure validation ensures required folders exist.

## Contributing

- Use issue templates for week content and bug reports.
- Follow the run order in each week README and include integrity output in PRs.
- Keep student-facing content on main; put solutions on a `teacher` branch.

## Docker (labs)

Use the root `docker-compose.yml` to start Mongo once for all labs.

```shell
docker compose up -d
py scripts\wait_for_mongo.py --host 127.0.0.1 --port 27017 --timeout 60
```

See `docs/RUNNING_LABS.md` for the standard lab workflow and troubleshooting.
