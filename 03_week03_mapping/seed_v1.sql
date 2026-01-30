-- Week 03 seed v1
INSERT INTO patient (first_name, last_name, date_of_birth, phone, email) VALUES
('Ana','Silva','1990-04-12','555-0101','ana.silva@example.com'),
('Bruno','Souza','1985-09-23','555-0202','bruno.souza@example.com'),
('Carla','Mendes','1992-01-05','555-0303','carla.mendes@example.com'),
('Diogo','Pereira','1988-06-17','555-0404','diogo.pereira@example.com'),
('Eva','Martins','1995-11-30','555-0505','eva.martins@example.com'),
('Fernanda','Rocha','1991-02-14','555-0606','fernanda.rocha@example.com'),
('Gustavo','Nunes','1983-08-09','555-0707','gustavo.nunes@example.com');

INSERT INTO doctor (first_name, last_name, specialty, is_active) VALUES
('Marco','Lima','cardiology',1),
('Rita','Costa','dermatology',1),
('Elena','Ramos','pediatrics',1),
('Nina','Alves','orthopedics',1);

INSERT INTO room (room_code, room_type, is_active) VALUES
('R-101','exam',1),
('R-102','exam',1),
('R-201','procedure',1);

INSERT INTO medication (medication_name, form, strength_mg, is_active) VALUES
('Aspirin','tablet',100,1),
('Ibuprofen','tablet',200,1),
('Amoxicillin','capsule',500,1),
('Cetirizine','tablet',10,1),
('Naproxen','tablet',250,1);

INSERT INTO appointment (patient_id, doctor_id, room_id, start_dt, end_dt, status) VALUES
(1,1,1,'2026-02-03 09:00:00','2026-02-03 09:30:00','completed'),
(1,1,2,'2026-02-03 10:00:00','2026-02-03 10:30:00','completed'),
(2,1,1,'2026-02-04 09:00:00','2026-02-04 09:20:00','completed'),
(3,2,2,'2026-02-05 09:30:00','2026-02-05 10:00:00','completed'),
(4,4,3,'2026-02-06 08:30:00','2026-02-06 09:00:00','scheduled'),
(5,3,1,'2026-02-06 11:00:00','2026-02-06 11:20:00','completed'),
(6,3,1,'2026-02-07 13:00:00','2026-02-07 13:30:00','completed'),
(7,2,2,'2026-02-07 15:00:00','2026-02-07 15:20:00','completed'),
(2,4,3,'2026-02-08 09:00:00','2026-02-08 09:40:00','completed'),
(3,1,1,'2026-02-08 10:30:00','2026-02-08 11:00:00','completed'),
(4,2,2,'2026-02-09 09:00:00','2026-02-09 09:30:00','completed'),
(5,1,1,'2026-02-10 10:00:00','2026-02-10 10:30:00','scheduled');

INSERT INTO prescription (appointment_id, prescribed_at, notes) VALUES
(1,'2026-02-03 09:20:00','low dose daily'),
(2,'2026-02-03 10:20:00','continue 7 days'),
(4,'2026-02-05 09:50:00','as needed'),
(8,'2026-02-07 15:10:00','after meal'),
(10,'2026-02-08 10:45:00','morning only');

INSERT INTO prescription_item (prescription_id, medication_id, dose_mg, frequency_per_day, duration_days) VALUES
(1,1,100,1,30),
(2,1,100,1,30),
(3,4,10,1,10),
(4,3,500,3,7),
(4,2,200,2,7),
(5,5,250,2,14);
