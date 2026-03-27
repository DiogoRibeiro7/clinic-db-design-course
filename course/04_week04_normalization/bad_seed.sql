-- Week 04 bad seed: includes 2NF/3NF violations
-- Note: patient city/state repeats per zip_code.
-- Note: appointment_service repeats service_name/base_price.

INSERT INTO patient (patient_id, first_name, last_name, phone, email, zip_code, city, state_name) VALUES
(1,'Ana','Silva','555-0101','ana.silva@example.com','10001','New York','New York'),
(2,'Bruno','Souza','555-0202','bruno.souza@example.com','10001','New York','New York'),
(3,'Carla','Mendes','555-0303','carla.mendes@example.com','94105','San Francisco','California'),
(4,'Diogo','Pereira','555-0404','diogo.pereira@example.com','60601','Chicago','Illinois');

INSERT INTO service (service_id, service_name, base_price) VALUES
(1,'consultation',120.00),
(2,'skin_exam',95.00),
(3,'xray',180.00);

INSERT INTO appointment (appointment_id, patient_id, start_dt, end_dt) VALUES
(1,1,'2026-02-03 09:00:00','2026-02-03 09:30:00'),
(2,1,'2026-02-03 10:00:00','2026-02-03 10:30:00'),
(3,2,'2026-02-04 09:00:00','2026-02-04 09:20:00'),
(4,3,'2026-02-05 09:30:00','2026-02-05 10:00:00');

INSERT INTO appointment_service (appointment_id, service_id, service_name, base_price, quantity) VALUES
(1,1,'consultation',120.00,1),
(1,3,'xray',180.00,1),
(2,1,'consultation',120.00,1),
(3,2,'skin_exam',95.00,1),
(4,1,'consultation',120.00,1);
