-- Week 06 reporting views

-- Balance per patient (invoiced minus paid)
CREATE OR REPLACE VIEW vw_patient_balance AS
SELECT p.patient_id,
       p.first_name,
       p.last_name,
       COALESCE(SUM(i.total_amount), 0.00) AS total_invoiced,
       COALESCE(SUM(pay.total_paid), 0.00) AS total_paid,
       COALESCE(SUM(i.total_amount), 0.00) - COALESCE(SUM(pay.total_paid), 0.00) AS balance_due
FROM patient p
LEFT JOIN appointment a ON a.patient_id = p.patient_id
LEFT JOIN invoice i ON i.appointment_id = a.appointment_id
LEFT JOIN (
  SELECT invoice_id, SUM(amount) AS total_paid
  FROM payment
  GROUP BY invoice_id
) pay ON pay.invoice_id = i.invoice_id
GROUP BY p.patient_id, p.first_name, p.last_name;

-- Revenue per doctor per month (invoiced)
CREATE OR REPLACE VIEW vw_revenue_doctor_month AS
SELECT d.doctor_id,
       d.first_name,
       d.last_name,
       DATE_FORMAT(i.invoice_date, '%Y-%m') AS invoice_month,
       SUM(i.total_amount) AS total_revenue
FROM invoice i
JOIN appointment a ON a.appointment_id = i.appointment_id
JOIN doctor d ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.first_name, d.last_name, DATE_FORMAT(i.invoice_date, '%Y-%m')
ORDER BY d.doctor_id, invoice_month;
