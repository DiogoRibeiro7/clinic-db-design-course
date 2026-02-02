# Naming conventions

## Goals

- Consistent, readable SQL across all weeks.
- Avoid ambiguity when joining tables and reading queries.

## Conventions

- Use snake_case for all identifiers.
- Table names: plural nouns (patients, appointments, invoices).
- Column names: singular nouns (patient_id, start_time, total_amount).
- Primary keys: `<table>`_id (patient_id, appointment_id).
- Foreign keys: <referenced_table>_id (patient_id, provider_id).
- Junction tables: <table_a>_<table_b> (patient_provider).
- Index names: idx_`<table>`_`<column>` (idx_appointments_start_time).
- Unique constraints: uq_`<table>`_`<column>` (uq_patients_email).
- Foreign keys: fk_`<table>`_<referenced_table> (fk_appointments_patients).
- Timestamps: use *_at (created_at, updated_at).
- Booleans: use is_* or has_* (is_active, has_insurance).

## SQL formatting

- One clause per line for readability.
- Keywords in uppercase (SELECT, FROM, WHERE, JOIN).
- Trailing commas in multi-line lists.
