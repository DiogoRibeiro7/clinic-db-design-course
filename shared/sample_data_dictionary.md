# Sample data dictionary

## Conventions
- Dates are fixed (not relative to "today") to keep examples stable.
- Primary keys are stable across weeks where possible (e.g., patient_id 1..N).
- Seed files should insert explicit ids when cross-week references exist.

## Core tables

### patient
Stores patient identity and contact info. Key columns: patient_id, first_name, last_name, date_of_birth, phone, email.

### doctor
Stores clinicians and their specialties. Key columns: doctor_id, first_name, last_name, specialty, is_active.

### room
Clinic rooms used for appointments. Key columns: room_id, room_code, room_type, is_active.

### appointment
Scheduled visits connecting patient, doctor, and room. Key columns: appointment_id, patient_id, doctor_id, room_id, start_dt, end_dt, status.

### medication
Medication catalog for prescriptions. Key columns: medication_id, medication_name, form, strength_mg, is_active.

### prescription
Prescription header tied to an appointment. Key columns: prescription_id, appointment_id, prescribed_at, notes.

### prescription_item
Line items within a prescription. Key columns: prescription_item_id, prescription_id, medication_id, dose_mg, frequency_per_day, duration_days.

### invoice
Billing header tied to an appointment. Key columns: invoice_id, appointment_id, invoice_date, total_amount, status.

### invoice_item
Invoice line items. Key columns: invoice_item_id, invoice_id, description, quantity, unit_price, line_total.

### payment
Payments applied to invoices. Key columns: payment_id, invoice_id, payment_dt, amount, method.
