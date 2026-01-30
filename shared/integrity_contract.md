# Integrity contract

## Rule
Integrity queries must return 0 rows. Any returned row indicates a data issue.

## Conventions
- Each integrity query must be preceded by a label comment:
  - `-- INTEGRITY: <name>`
- Use descriptive names, e.g., `-- INTEGRITY: orphan_appointments`.
- Each integrity query should be a standalone `SELECT` statement.

## Example
```sql
-- INTEGRITY: orphan_appointments
SELECT a.appointment_id
FROM appointment a
LEFT JOIN patient p ON p.patient_id = a.patient_id
WHERE p.patient_id IS NULL;
```

## Grading
- A run passes only if all integrity queries return 0 rows.
- Any output from the integrity file is a failure.
