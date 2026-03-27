-- Week 03 integrity checks (should return 0 rows)

-- INTEGRITY: invalid_appointment_times
SELECT appointment_id, start_dt, end_dt
FROM appointment
WHERE end_dt <= start_dt;

-- INTEGRITY: orphan_appointments
SELECT a.appointment_id
FROM appointment a
LEFT JOIN patient p ON p.patient_id = a.patient_id
LEFT JOIN doctor d ON d.doctor_id = a.doctor_id
LEFT JOIN room r ON r.room_id = a.room_id
WHERE p.patient_id IS NULL
   OR d.doctor_id IS NULL
   OR r.room_id IS NULL;

-- INTEGRITY: orphan_prescriptions
SELECT pr.prescription_id
FROM prescription pr
LEFT JOIN appointment a ON a.appointment_id = pr.appointment_id
WHERE a.appointment_id IS NULL;

-- INTEGRITY: orphan_prescription_items
SELECT pi.prescription_item_id
FROM prescription_item pi
LEFT JOIN prescription pr ON pr.prescription_id = pi.prescription_id
WHERE pr.prescription_id IS NULL;

-- INTEGRITY: orphan_prescription_items_medication
SELECT pi.prescription_item_id
FROM prescription_item pi
LEFT JOIN medication m ON m.medication_id = pi.medication_id
WHERE m.medication_id IS NULL;

-- INTEGRITY: duplicate_patient_emails
SELECT email, COUNT(*) AS duplicate_count
FROM patient
GROUP BY email
HAVING COUNT(*) > 1;

-- INTEGRITY: duplicate_room_codes
SELECT room_code, COUNT(*) AS duplicate_count
FROM room
GROUP BY room_code
HAVING COUNT(*) > 1;

-- INTEGRITY: prescriptions_without_items
SELECT pr.prescription_id
FROM prescription pr
LEFT JOIN prescription_item pi ON pi.prescription_id = pr.prescription_id
WHERE pi.prescription_item_id IS NULL;
