# Clinic DB Design Course (MySQL 8.0)

## Course goals
- Design relational schemas using ER modeling and normalization principles.
- Implement schemas in MySQL Community Server 8.0.x.
- Apply constraints, transactions, and indexing for data integrity and performance.
- Practice iterative design changes with a final change request.

## Standard workflow
Use the week-specific files for each lab. Examples:

Week 1 (denormalized):
1) shared/reset.sql
2) 01_week01_basics/schema.sql
3) 01_week01_basics/seed.sql
4) 01_week01_basics/exercises.sql

Week 3 (mapping):
1) shared/reset.sql
2) 03_week03_normalization/schema_v1.sql
3) 03_week03_normalization/seed_v1.sql
4) 03_week03_normalization/queries_v1.sql
5) 03_week03_normalization/integrity_v1.sql

Week 4 (normalization):
1) 04_week04_constraints/bad_schema.sql
2) 04_week04_constraints/bad_seed.sql
3) 04_week04_constraints/schema_v2.sql
4) 04_week04_constraints/seed_v2.sql
5) 04_week04_constraints/integrity_v2.sql

Week 5 (overlap triggers):
1) shared/reset.sql
2) 03_week03_normalization/schema_v1.sql
3) 03_week03_normalization/seed_v1.sql
4) 05_week05_joins/rules.sql
5) 05_week05_joins/test_negative_inserts.sql
6) 05_week05_joins/integrity.sql

Week 6 (billing):
1) shared/reset.sql
2) 03_week03_normalization/schema_v1.sql
3) 03_week03_normalization/seed_v1.sql
4) 06_week06_transactions/schema_billing.sql
5) 06_week06_transactions/seed_billing.sql
6) 06_week06_transactions/reporting_views.sql
7) 06_week06_transactions/integrity.sql

Week 7 (indexes and EXPLAIN):
1) shared/reset.sql
2) 03_week03_normalization/schema_v1.sql
3) 03_week03_normalization/seed_v1.sql
4) 06_week06_transactions/schema_billing.sql
5) 06_week06_transactions/seed_billing.sql
6) 07_week07_indexing/explain_tasks.sql (before indexes)
7) 07_week07_indexing/indexes.sql
8) 07_week07_indexing/explain_tasks.sql (after indexes)

## Folder structure
- 00_setup/ (install notes, tooling, and starter checks)
- shared/ (shared scripts and assets)
- 01_week01_basics/ ... 08_week08_final_change_request/ (weekly materials)

## Environment
- Windows
- MySQL Community Server 8.0.x
- MySQL Workbench 8.0.x

## Solutions policy
Solutions are kept off the main branch. See `docs/solutions_policy.md` for the recommended workflow.

## Docker (labs)
Use the root `docker-compose.yml` to start Mongo once for all labs.

```shell
docker compose up -d
py scripts\wait_for_mongo.py --host 127.0.0.1 --port 27017 --timeout 60
```

See `docs/RUNNING_LABS.md` for the standard lab workflow and troubleshooting.
  
