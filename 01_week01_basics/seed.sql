-- Week 01 seed: denormalized rows with repetition and anomalies
INSERT INTO appointment_flat (
  appointment_date, start_time, end_time,
  patient_id, patient_first_name, patient_last_name, patient_phone, patient_email,
  doctor_id, doctor_first_name, doctor_last_name, doctor_specialty,
  medication_name, medication_dose_mg, medication_frequency_per_day,
  invoice_id, invoice_total_amount, invoice_status
) VALUES
('2026-02-03','09:00:00','09:30:00', 1,'Ana','Silva','555-0101','ana.silva@example.com', 10,'Marco','Lima','cardiology', 'Aspirin',100,1, 1001,120.00,'paid'),
('2026-02-03','10:00:00','10:30:00', 1,'Ana','Silva','555-0101','ana.silva@example.com', 10,'Marco','Lima','cardiology', 'Aspirin',100,1, 1002,120.00,'paid'),
('2026-02-04','09:00:00','09:20:00', 1,'Ana','Silva','555-0111','ana.silva@example.com', 11,'Rita','Costa','dermatology', NULL,NULL,NULL, 1003,80.00,'unpaid'),

('2026-02-04','11:00:00','11:45:00', 2,'Bruno','Souza','555-0202','bruno.souza@example.com', 10,'Marco','Lima','cardiology', 'Atorvastatin',20,1, 1004,150.00,'paid'),
('2026-02-05','14:00:00','14:30:00', 2,'Bruno','Souza','555-0202','bruno.souza@example.com', 12,'Elena','Ramos','pediatrics', 'Ibuprofen',200,2, 1005,90.00,'paid'),

('2026-02-05','09:30:00','10:00:00', 3,'Carla','Mendes','555-0303','carla.mendes@example.com', 11,'Rita','Costa','dermatology', 'Cetirizine',10,1, 1006,110.00,'paid'),
('2026-02-06','15:00:00','15:30:00', 3,'Carla','Mendes','555-0303','carla.mendes@example.com', 11,'Rita','Costa','dermatology', 'Cetirizine',10,1, 1007,110.00,'paid'),

('2026-02-06','08:30:00','09:00:00', 4,'Diogo','Pereira','555-0404','diogo.pereira@example.com', 13,'Nina','Alves','orthopedics', 'Naproxen',250,2, 1008,200.00,'unpaid'),
('2026-02-07','10:30:00','11:00:00', 4,'Diogo','Pereira','555-0404','diogo.pereira@example.com', 13,'Nina','Alves','orthopedics', 'Naproxen',250,2, 1009,200.00,'unpaid'),

('2026-02-07','13:00:00','13:30:00', 5,'Eva','Martins','555-0505','eva.martins@example.com', 10,'Marco','Lima','cardiology', NULL,NULL,NULL, 1010,130.00,'paid'),
('2026-02-08','09:00:00','09:30:00', 5,'Eva','Martins','555-0505','eva.martins@example.com', 14,'Paulo','Dias','neurology', 'Sumatriptan',50,1, 1011,180.00,'paid'),

('2026-02-08','11:00:00','11:20:00', 6,'Fernanda','Rocha','555-0606','fernanda.rocha@example.com', 12,'Elena','Ramos','pediatrics', 'Amoxicillin',500,3, 1012,95.00,'paid'),
('2026-02-09','16:00:00','16:30:00', 6,'Fernanda','Rocha','555-0606','fernanda.rocha@example.com', 12,'Elena','Ramos','pediatrics', 'Amoxicillin',500,3, 1013,95.00,'paid'),

('2026-02-09','09:00:00','09:45:00', 7,'Gustavo','Nunes','555-0707','gustavo.nunes@example.com', 14,'Paulo','Dias','neurology', 'Topiramate',25,2, 1014,210.00,'paid'),
('2026-02-10','10:00:00','10:30:00', 8,'Helena','Barros','555-0808','helena.barros@example.com', 10,'Marco','Lima','cardiology', 'Aspirin',100,1, 1015,120.00,'paid');
