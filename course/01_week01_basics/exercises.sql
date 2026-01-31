-- Week 01 exercises: anomaly exploration on appointment_flat

-- 1) Update anomaly:
-- The patient phone for patient_id = 1 appears in multiple rows and is inconsistent.
-- Write an UPDATE to set the phone to 555-0199 for all rows of patient_id = 1.

-- 2) Update anomaly:
-- Doctor Marco Lima changed specialty from cardiology to internal_medicine.
-- Update all rows for doctor_id = 10.

-- 3) Insert anomaly:
-- A new patient arrives, but no appointment is scheduled yet.
-- Why is it hard to store the patient without creating a fake appointment?
-- Insert a placeholder row to illustrate the problem (use appointment_date = '2026-02-20').

-- 4) Delete anomaly:
-- If you delete the only appointment for patient_id = 7, you lose the patient record.
-- Delete that appointment and note what information is lost.

-- 5) Insert anomaly:
-- Add a new medication for an existing appointment_id = 1008 without duplicating appointment data.
-- Explain why this structure forces duplication.

-- 6) Update anomaly:
-- The invoice total for invoice_id = 1009 is wrong. Fix it to 190.00.
-- How many rows must be updated if invoices repeat?

-- 7) Delete anomaly:
-- Remove doctor_id = 12 from the dataset.
-- Which patient history disappears as a side effect?

-- 8) Update anomaly:
-- Patient email for patient_id = 6 changed to fernanda.rocha@newmail.com.
-- Update all rows and identify any inconsistent rows after the update.
