-- Week 01 teacher solutions

-- 1) Update all rows for patient_id = 1
UPDATE appointment_flat
SET patient_phone = '555-0199'
WHERE patient_id = 1;

-- 2) Update all rows for doctor_id = 10
UPDATE appointment_flat
SET doctor_specialty = 'internal_medicine'
WHERE doctor_id = 10;

-- 3) Insert placeholder appointment to store a new patient (illustrates insert anomaly)
INSERT INTO appointment_flat (
  appointment_date, start_time, end_time,
  patient_id, patient_first_name, patient_last_name, patient_phone, patient_email,
  doctor_id, doctor_first_name, doctor_last_name, doctor_specialty,
  medication_name, medication_dose_mg, medication_frequency_per_day,
  invoice_id, invoice_total_amount, invoice_status
) VALUES
('2026-02-20','00:00:00','00:00:00', 9,'Igor','Santos','555-0909','igor.santos@example.com',
 0,'unknown','unknown','unknown', NULL,NULL,NULL, 0,0.00,'pending');

-- 4) Delete the only appointment for patient_id = 7
DELETE FROM appointment_flat
WHERE patient_id = 7;

-- 5) To record another medication for appointment_id = 1008,
-- you must duplicate the entire appointment row with a different medication.
INSERT INTO appointment_flat (
  appointment_date, start_time, end_time,
  patient_id, patient_first_name, patient_last_name, patient_phone, patient_email,
  doctor_id, doctor_first_name, doctor_last_name, doctor_specialty,
  medication_name, medication_dose_mg, medication_frequency_per_day,
  invoice_id, invoice_total_amount, invoice_status
) SELECT
  appointment_date, start_time, end_time,
  patient_id, patient_first_name, patient_last_name, patient_phone, patient_email,
  doctor_id, doctor_first_name, doctor_last_name, doctor_specialty,
  'Paracetamol',500,3,
  invoice_id, invoice_total_amount, invoice_status
FROM appointment_flat
WHERE appointment_id = 1008
LIMIT 1;

-- 6) Fix invoice total for invoice_id = 1009
UPDATE appointment_flat
SET invoice_total_amount = 190.00
WHERE invoice_id = 1009;

-- 7) Delete all rows for doctor_id = 12
DELETE FROM appointment_flat
WHERE doctor_id = 12;

-- 8) Update email for patient_id = 6
UPDATE appointment_flat
SET patient_email = 'fernanda.rocha@newmail.com'
WHERE patient_id = 6;
