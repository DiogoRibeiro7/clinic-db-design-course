-- Week 05 seed: minimal data to demonstrate overlap enforcement
INSERT INTO appointment (appointment_id, patient_id, doctor_id, room_id, start_dt, end_dt, status) VALUES
(1,1,1,1,'2026-02-03 09:00:00','2026-02-03 09:30:00','completed'),
(2,2,1,1,'2026-02-03 10:00:00','2026-02-03 10:30:00','completed'),
(3,3,2,2,'2026-02-03 09:00:00','2026-02-03 09:20:00','completed');
