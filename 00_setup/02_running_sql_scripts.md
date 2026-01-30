# 02_running_sql_scripts

## Goal
Run course SQL scripts in MySQL Workbench.

## Standard workflow
1) reset.sql
2) schema.sql
3) seed.sql
4) exercises.sql (queries)
5) integrity.sql

## Run a script
1) Open MySQL Workbench and connect to clinic_local.
2) File -> Open SQL Script, then select the script file.
3) Set the default schema to clinic_db.
4) Click the lightning bolt to run the script.

## Tips
- If a script fails, fix the error and re-run only the failing statements.
- Use reset.sql before re-running schema and seed files.

## Troubleshooting
- Service not running:
  - Start the MySQL service in Windows Services.
- Port conflicts:
  - Confirm MySQL is listening on 3306.
- Connection errors:
  - Re-test the connection with 127.0.0.1 and clinic_admin.
