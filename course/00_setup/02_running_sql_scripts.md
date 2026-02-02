# Running SQL scripts in MySQL Workbench

## Goal

Run course SQL scripts in the correct order.

## Exact steps (Workbench)

1) Open MySQL Workbench and connect to clinic_local.
2) File -> Open SQL Script, then select the script file.
3) In the Navigator, set the default schema to clinic_db.
4) Click the lightning bolt to run the script.
5) Repeat for each script in order.

## Week 3 run order (example)

1) shared/reset.sql
2) course/03_week03_normalization/schema_v1.sql
3) course/03_week03_normalization/seed_v1.sql
4) course/03_week03_normalization/queries_v1.sql
5) course/03_week03_normalization/integrity_v1.sql

## Tips

- If a script fails, fix the error and re-run only the failing statements.
- Use shared/reset.sql before re-running schema and seed files.

## Troubleshooting

- Service not running:
  - Start the MySQL service in Windows Services.
- Port conflicts:
  - Confirm MySQL is listening on 3306.
- Connection errors:
  - Re-test the connection with 127.0.0.1 and clinic_admin.

## First run checklist

- [ ] Scripts run in the correct order
- [ ] Week 3 integrity checks return 0 rows
- [ ] Completed: run shared/reset.sql then Week 3 scripts successfully
