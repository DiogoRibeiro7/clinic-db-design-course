-- Week 05 negative tests: inserts that must fail

-- 1) Overlap with existing appointment (same doctor)
INSERT INTO appointment (patient_id, doctor_id, room_id, start_dt, end_dt, status)
VALUES (1, 1, 1, '2026-02-03 09:10:00', '2026-02-03 09:40:00', 'scheduled');

-- 2) Overlap inside another appointment
INSERT INTO appointment (patient_id, doctor_id, room_id, start_dt, end_dt, status)
VALUES (2, 1, 2, '2026-02-03 09:05:00', '2026-02-03 09:15:00', 'scheduled');

-- 3) Overlap at the end boundary (starts before end)
INSERT INTO appointment (patient_id, doctor_id, room_id, start_dt, end_dt, status)
VALUES (3, 1, 1, '2026-02-03 09:25:00', '2026-02-03 09:35:00', 'scheduled');

-- 4) Overlap spanning multiple appointments
INSERT INTO appointment (patient_id, doctor_id, room_id, start_dt, end_dt, status)
VALUES (4, 1, 2, '2026-02-03 08:50:00', '2026-02-03 10:05:00', 'scheduled');

-- 5) Overlap on update
UPDATE appointment
SET start_dt = '2026-02-03 10:10:00', end_dt = '2026-02-03 10:25:00'
WHERE appointment_id = 1;

-- 6) Overlap with a later appointment
INSERT INTO appointment (patient_id, doctor_id, room_id, start_dt, end_dt, status)
VALUES (5, 1, 1, '2026-02-03 09:50:00', '2026-02-03 10:20:00', 'scheduled');
