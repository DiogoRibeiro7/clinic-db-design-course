-- Week 05 negative tests: inserts that must fail

-- Overlap with existing appointment (same doctor)
INSERT INTO appointment (patient_id, doctor_id, room_id, start_dt, end_dt, status)
VALUES (1, 1, 1, '2026-02-03 09:10:00', '2026-02-03 09:40:00', 'scheduled');

-- Edge case overlap inside another appointment
INSERT INTO appointment (patient_id, doctor_id, room_id, start_dt, end_dt, status)
VALUES (2, 1, 2, '2026-02-03 09:05:00', '2026-02-03 09:15:00', 'scheduled');

-- Overlap on update: move an appointment into an existing slot
UPDATE appointment
SET start_dt = '2026-02-03 10:10:00', end_dt = '2026-02-03 10:25:00'
WHERE appointment_id = 1;

-- Same time but different doctor (should succeed)
-- This is a control case; comment out if you want all to fail.
-- INSERT INTO appointment (patient_id, doctor_id, room_id, start_dt, end_dt, status)
-- VALUES (3, 2, 1, '2026-02-03 09:10:00', '2026-02-03 09:40:00', 'scheduled');
