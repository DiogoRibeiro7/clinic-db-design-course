# Clinic DB Design Course (MySQL 8.0)

## Course goals
- Design relational schemas using ER modeling and normalization principles.
- Implement schemas in MySQL Community Server 8.0.x.
- Apply constraints, transactions, and indexing for data integrity and performance.
- Practice iterative design changes with a final change request.

## Standard workflow
1) reset.sql
2) schema.sql
3) seed.sql
4) exercises.sql (queries)
5) integrity.sql

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
  
