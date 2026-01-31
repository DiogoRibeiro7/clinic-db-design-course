-- Week 03 queries v1

-- 1) Daily schedule for a doctor
SELECT a.appointment_id,
       a.start_dt,
       a.end_dt,
       p.first_name AS patient_first_name,
       p.last_name AS patient_last_name,
       r.room_code
FROM appointment a
JOIN patient p ON p.patient_id = a.patient_id
JOIN room r ON r.room_id = a.room_id
WHERE a.doctor_id = 1
  AND a.start_dt >= '2026-02-03'
  AND a.start_dt < '2026-02-04'
ORDER BY a.start_dt;

-- 2) Patient appointment history
SELECT a.appointment_id,
       a.start_dt,
       a.end_dt,
       d.first_name AS doctor_first_name,
       d.last_name AS doctor_last_name,
       a.status
FROM appointment a
JOIN doctor d ON d.doctor_id = a.doctor_id
WHERE a.patient_id = 1
ORDER BY a.start_dt DESC;

-- 3) Doctor workload (appointments per doctor)
SELECT d.doctor_id,
       d.first_name,
       d.last_name,
       COUNT(*) AS appointment_count
FROM appointment a
JOIN doctor d ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.first_name, d.last_name
ORDER BY appointment_count DESC;

-- 4) Patients with upcoming appointments
SELECT p.patient_id,
       p.first_name,
       p.last_name,
       MIN(a.start_dt) AS next_appointment
FROM appointment a
JOIN patient p ON p.patient_id = a.patient_id
WHERE a.start_dt >= '2026-02-06'
GROUP BY p.patient_id, p.first_name, p.last_name
ORDER BY next_appointment;

-- 5) Appointments with prescriptions
SELECT a.appointment_id,
       a.start_dt,
       p.first_name,
       p.last_name,
       pr.prescription_id
FROM appointment a
JOIN patient p ON p.patient_id = a.patient_id
JOIN prescription pr ON pr.appointment_id = a.appointment_id
ORDER BY a.start_dt;

-- 6) Prescription items by patient
SELECT p.patient_id,
       p.first_name,
       p.last_name,
       m.medication_name,
       pi.dose_mg,
       pi.frequency_per_day,
       pi.duration_days
FROM prescription_item pi
JOIN prescription pr ON pr.prescription_id = pi.prescription_id
JOIN appointment a ON a.appointment_id = pr.appointment_id
JOIN patient p ON p.patient_id = a.patient_id
JOIN medication m ON m.medication_id = pi.medication_id
ORDER BY p.last_name, p.first_name, m.medication_name;

-- 7) Average appointment duration (minutes) by doctor
SELECT d.doctor_id,
       d.first_name,
       d.last_name,
       AVG(TIMESTAMPDIFF(MINUTE, a.start_dt, a.end_dt)) AS avg_minutes
FROM appointment a
JOIN doctor d ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.first_name, d.last_name
ORDER BY avg_minutes DESC;

-- 8) Rooms used most often
SELECT r.room_code,
       r.room_type,
       COUNT(*) AS usage_count
FROM appointment a
JOIN room r ON r.room_id = a.room_id
GROUP BY r.room_code, r.room_type
ORDER BY usage_count DESC;

-- 9) Patients without prescriptions
SELECT DISTINCT p.patient_id,
       p.first_name,
       p.last_name
FROM appointment a
JOIN patient p ON p.patient_id = a.patient_id
LEFT JOIN prescription pr ON pr.appointment_id = a.appointment_id
WHERE pr.prescription_id IS NULL
ORDER BY p.last_name, p.first_name;

-- 10) Doctors with no appointments
SELECT d.doctor_id,
       d.first_name,
       d.last_name
FROM doctor d
LEFT JOIN appointment a ON a.doctor_id = d.doctor_id
WHERE a.appointment_id IS NULL;
