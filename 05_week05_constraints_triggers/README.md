# Week 05: Appointment overlap enforcement

## Goal
Prevent doctors from being double-booked by using triggers.

## How to test in MySQL Workbench
1) Load your Week 03 schema and seed data.
2) Run 05_week05_constraints_triggers/rules.sql to create the triggers.
3) Run 05_week05_constraints_triggers/test_negative_inserts.sql.
   - Each statement should fail with a clear overlap error.
4) Run 05_week05_constraints_triggers/integrity.sql to confirm 0 overlaps.

## Notes
- Triggers only check overlaps per doctor.
- Overlap rule: NEW.start_dt < existing.end_dt AND NEW.end_dt > existing.start_dt.
