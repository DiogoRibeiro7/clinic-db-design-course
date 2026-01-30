-- Week 05 integrity query: detect overlaps per doctor
SELECT a1.appointment_id AS appointment_id_1,
       a2.appointment_id AS appointment_id_2,
       a1.doctor_id,
       a1.start_dt AS start_dt_1,
       a1.end_dt AS end_dt_1,
       a2.start_dt AS start_dt_2,
       a2.end_dt AS end_dt_2
FROM appointment a1
JOIN appointment a2
  ON a1.doctor_id = a2.doctor_id
 AND a1.appointment_id < a2.appointment_id
WHERE a1.start_dt < a2.end_dt
  AND a1.end_dt > a2.start_dt
ORDER BY a1.doctor_id, a1.start_dt;
