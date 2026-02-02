# Run a week end-to-end

These scripts run a week in order: reset -> schema -> seed -> integrity.
They require the MySQL client (`mysql`) on your PATH.

## Windows (PowerShell)

```powershell
scripts\run_week.ps1 -WeekPath course/03_week03_normalization -User root -Database clinic_db -Host 127.0.0.1 -Port 3306
```

## macOS/Linux (bash)

```bash
./scripts/run_week.sh --week_path course/03_week03_normalization --user root --database clinic_db --host 127.0.0.1 --port 3306
```

## Notes

- The script looks for schema.sql or schema_v*.sql.
- The script looks for seed.sql or seed_v*.sql.
- The script looks for integrity.sql or integrity_v*.sql.
