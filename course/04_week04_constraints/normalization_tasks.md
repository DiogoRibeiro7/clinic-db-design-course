# Normalization tasks (Week 04)

## Functional dependencies (FDs)

1) patient_id -> first_name, last_name, phone, email, zip_code, city, state_name
2) zip_code -> city, state_name
3) service_id -> service_name, base_price
4) appointment_id -> patient_id, start_dt, end_dt
5) (appointment_id, service_id) -> quantity, service_name, base_price

## Tasks

1) Identify partial and transitive dependencies in the bad schema.
2) Explain why zip_code -> city, state_name is a transitive dependency in patient.
3) Remove service_name and base_price from appointment_service without losing data.
4) Create a zip_code reference table and update patient to reference it.
5) Produce a 3NF schema (schema_v2.sql) and migrate the data.
6) Verify integrity with integrity_v2.sql.

## Deliverables

- Corrected schema (3NF)
- Updated seed data that matches the new schema
- A brief explanation of each dependency removed
