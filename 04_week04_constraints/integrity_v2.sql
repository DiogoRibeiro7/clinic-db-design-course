-- Week 04 integrity checks (v2, should return 0 rows)

-- INTEGRITY: invalid_appointment_times
SELECT appointment_id, start_dt, end_dt
FROM appointment
WHERE end_dt <= start_dt;

-- INTEGRITY: orphan_appointments
SELECT a.appointment_id
FROM appointment a
LEFT JOIN patient p ON p.patient_id = a.patient_id
WHERE p.patient_id IS NULL;

-- INTEGRITY: orphan_appointment_services
SELECT aps.appointment_id, aps.service_id
FROM appointment_service aps
LEFT JOIN appointment a ON a.appointment_id = aps.appointment_id
LEFT JOIN service s ON s.service_id = aps.service_id
WHERE a.appointment_id IS NULL
   OR s.service_id IS NULL;

-- INTEGRITY: missing_zip_code_ref
SELECT p.patient_id, p.zip_code
FROM patient p
LEFT JOIN zip_code_ref z ON z.zip_code = p.zip_code
WHERE z.zip_code IS NULL;

-- INTEGRITY: duplicate_service_names
SELECT service_name, COUNT(*) AS duplicate_count
FROM service
GROUP BY service_name
HAVING COUNT(*) > 1;
