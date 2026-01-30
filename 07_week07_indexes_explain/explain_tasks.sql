-- Week 07 EXPLAIN tasks

-- 1) Appointments for a doctor in a date range
EXPLAIN
SELECT a.appointment_id, a.start_dt, a.end_dt, p.first_name, p.last_name
FROM appointment a
JOIN patient p ON p.patient_id = a.patient_id
WHERE a.doctor_id = 1
  AND a.start_dt >= '2026-02-01'
  AND a.start_dt < '2026-03-01'
ORDER BY a.start_dt;

-- 2) Appointments for a patient in a date range
EXPLAIN
SELECT a.appointment_id, a.start_dt, a.end_dt, d.first_name, d.last_name
FROM appointment a
JOIN doctor d ON d.doctor_id = a.doctor_id
WHERE a.patient_id = 1
  AND a.start_dt >= '2026-02-01'
  AND a.start_dt < '2026-03-01'
ORDER BY a.start_dt;

-- 3) Prescription history for a patient
EXPLAIN
SELECT pr.prescription_id, pr.prescribed_at, m.medication_name
FROM prescription pr
JOIN appointment a ON a.appointment_id = pr.appointment_id
JOIN prescription_item pi ON pi.prescription_id = pr.prescription_id
JOIN medication m ON m.medication_id = pi.medication_id
WHERE a.patient_id = 1
ORDER BY pr.prescribed_at DESC;

-- 4) Revenue per doctor for a month
EXPLAIN
SELECT d.doctor_id, d.first_name, d.last_name, SUM(i.total_amount) AS total_revenue
FROM invoice i
JOIN appointment a ON a.appointment_id = i.appointment_id
JOIN doctor d ON d.doctor_id = a.doctor_id
WHERE i.invoice_date >= '2026-02-01'
  AND i.invoice_date < '2026-03-01'
GROUP BY d.doctor_id, d.first_name, d.last_name
ORDER BY total_revenue DESC;

-- 5) Unpaid invoices
EXPLAIN
SELECT i.invoice_id, i.invoice_date, i.total_amount
FROM invoice i
LEFT JOIN payment p ON p.invoice_id = i.invoice_id
GROUP BY i.invoice_id, i.invoice_date, i.total_amount
HAVING COALESCE(SUM(p.amount), 0.00) = 0.00
ORDER BY i.invoice_date;
