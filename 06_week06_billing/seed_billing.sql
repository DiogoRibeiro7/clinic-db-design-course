-- Week 06 billing seed
INSERT INTO invoice (appointment_id, invoice_date, total_amount, status) VALUES
(1,'2026-02-03',120.00,'issued'),
(2,'2026-02-03',120.00,'paid'),
(4,'2026-02-05',95.00,'paid'),
(6,'2026-02-06',90.00,'issued'),
(8,'2026-02-07',150.00,'issued');

INSERT INTO invoice_item (invoice_id, description, quantity, unit_price, line_total) VALUES
(1,'consultation',1,120.00,120.00),
(2,'consultation',1,120.00,120.00),
(3,'skin_exam',1,95.00,95.00),
(4,'pediatrics_visit',1,90.00,90.00),
(5,'orthopedics_visit',1,150.00,150.00);

INSERT INTO payment (invoice_id, payment_dt, amount, method) VALUES
(1,'2026-02-03 12:00:00',60.00,'card'),
(2,'2026-02-03 13:00:00',120.00,'card'),
(3,'2026-02-05 11:00:00',95.00,'cash');
