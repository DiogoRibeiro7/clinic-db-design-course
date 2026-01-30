-- Week 04 integrity checks (v2, should return 0 rows)

-- 1) Appointments with invalid time ranges
SELECT appointment_id, start_dt, end_dt
FROM appointment
WHERE end_dt <= start_dt;

-- 2) Orphan appointments
SELECT a.appointment_id
FROM appointment a
LEFT JOIN patient p ON p.patient_id = a.patient_id
WHERE p.patient_id IS NULL;

-- 3) Orphan appointment services
SELECT aps.appointment_id, aps.service_id
FROM appointment_service aps
LEFT JOIN appointment a ON a.appointment_id = aps.appointment_id
LEFT JOIN service s ON s.service_id = aps.service_id
WHERE a.appointment_id IS NULL
   OR s.service_id IS NULL;

-- 4) Zip codes missing reference
SELECT p.patient_id, p.zip_code
FROM patient p
LEFT JOIN zip_code_ref z ON z.zip_code = p.zip_code
WHERE z.zip_code IS NULL;

-- 5) Duplicate service names
SELECT service_name, COUNT(*) AS duplicate_count
FROM service
GROUP BY service_name
HAVING COUNT(*) > 1;
