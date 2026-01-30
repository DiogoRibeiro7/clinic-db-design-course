-- Week 04 seed v2
INSERT INTO zip_code_ref (zip_code, city, state_name) VALUES
('10001','New York','New York'),
('94105','San Francisco','California'),
('60601','Chicago','Illinois');

INSERT INTO patient (first_name, last_name, phone, email, zip_code) VALUES
('Ana','Silva','555-0101','ana.silva@example.com','10001'),
('Bruno','Souza','555-0202','bruno.souza@example.com','10001'),
('Carla','Mendes','555-0303','carla.mendes@example.com','94105'),
('Diogo','Pereira','555-0404','diogo.pereira@example.com','60601');

INSERT INTO service (service_name, base_price) VALUES
('consultation',120.00),
('skin_exam',95.00),
('xray',180.00);

INSERT INTO appointment (patient_id, start_dt, end_dt) VALUES
(1,'2026-02-03 09:00:00','2026-02-03 09:30:00'),
(1,'2026-02-03 10:00:00','2026-02-03 10:30:00'),
(2,'2026-02-04 09:00:00','2026-02-04 09:20:00'),
(3,'2026-02-05 09:30:00','2026-02-05 10:00:00');

INSERT INTO appointment_service (appointment_id, service_id, quantity) VALUES
(1,1,1),
(1,3,1),
(2,1,1),
(3,2,1),
(4,1,1);
