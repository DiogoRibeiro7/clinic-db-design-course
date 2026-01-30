-- Week 03 queries v1

-- 1) List all appointments with patient and doctor names
SELECT a.appointment_id,
       a.start_dt,
       a.end_dt,
       p.first_name AS patient_first_name,
       p.last_name AS patient_last_name,
       d.first_name AS doctor_first_name,
       d.last_name AS doctor_last_name
FROM appointment a
JOIN patient p ON p.patient_id = a.patient_id
JOIN doctor d ON d.doctor_id = a.doctor_id
ORDER BY a.start_dt;

-- 2) Count appointments per doctor
SELECT d.doctor_id,
       d.first_name,
       d.last_name,
       COUNT(*) AS appointment_count
FROM appointment a
JOIN doctor d ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.first_name, d.last_name
ORDER BY appointment_count DESC;

-- 3) Appointments per patient with latest appointment date
SELECT p.patient_id,
       p.first_name,
       p.last_name,
       COUNT(*) AS appointment_count,
       MAX(a.start_dt) AS last_appointment
FROM appointment a
JOIN patient p ON p.patient_id = a.patient_id
GROUP BY p.patient_id, p.first_name, p.last_name
ORDER BY last_appointment DESC;

-- 4) List prescriptions with medication names
SELECT pr.prescription_id,
       pr.prescribed_at,
       m.medication_name,
       pi.dose_mg,
       pi.frequency_per_day,
       pi.duration_days
FROM prescription pr
JOIN prescription_item pi ON pi.prescription_id = pr.prescription_id
JOIN medication m ON m.medication_id = pi.medication_id
ORDER BY pr.prescription_id;

-- 5) Patients who received medications in the last week
SELECT DISTINCT p.patient_id,
       p.first_name,
       p.last_name
FROM prescription pr
JOIN appointment a ON a.appointment_id = pr.appointment_id
JOIN patient p ON p.patient_id = a.patient_id
WHERE pr.prescribed_at >= '2026-02-02'
ORDER BY p.last_name, p.first_name;

-- 6) Average appointment duration (minutes) by doctor
SELECT d.doctor_id,
       d.first_name,
       d.last_name,
       AVG(TIMESTAMPDIFF(MINUTE, a.start_dt, a.end_dt)) AS avg_minutes
FROM appointment a
JOIN doctor d ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.first_name, d.last_name
ORDER BY avg_minutes DESC;

-- 7) Rooms used most often
SELECT r.room_code,
       r.room_type,
       COUNT(*) AS usage_count
FROM appointment a
JOIN room r ON r.room_id = a.room_id
GROUP BY r.room_code, r.room_type
ORDER BY usage_count DESC;

-- 8) Medications prescribed per patient
SELECT p.patient_id,
       p.first_name,
       p.last_name,
       COUNT(DISTINCT m.medication_id) AS medication_count
FROM prescription pr
JOIN appointment a ON a.appointment_id = pr.appointment_id
JOIN patient p ON p.patient_id = a.patient_id
JOIN prescription_item pi ON pi.prescription_id = pr.prescription_id
JOIN medication m ON m.medication_id = pi.medication_id
GROUP BY p.patient_id, p.first_name, p.last_name
ORDER BY medication_count DESC;

-- 9) Appointments with no prescriptions
SELECT a.appointment_id,
       a.start_dt,
       p.first_name,
       p.last_name
FROM appointment a
JOIN patient p ON p.patient_id = a.patient_id
LEFT JOIN prescription pr ON pr.appointment_id = a.appointment_id
WHERE pr.prescription_id IS NULL
ORDER BY a.start_dt;

-- 10) Active doctors with upcoming appointments
SELECT d.doctor_id,
       d.first_name,
       d.last_name,
       COUNT(*) AS upcoming_count
FROM appointment a
JOIN doctor d ON d.doctor_id = a.doctor_id
WHERE d.is_active = 1
  AND a.start_dt >= '2026-02-06'
GROUP BY d.doctor_id, d.first_name, d.last_name
ORDER BY upcoming_count DESC;
