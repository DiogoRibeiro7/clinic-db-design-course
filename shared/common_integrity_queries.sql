-- Common integrity checks

-- Orphan checks (replace table/column names per week)
-- Example: appointments without a valid patient
-- SELECT a.appointment_id
-- FROM appointments a
-- LEFT JOIN patients p ON p.patient_id = a.patient_id
-- WHERE p.patient_id IS NULL;

-- Duplicate checks (replace table/column names per week)
-- Example: duplicate patient emails
-- SELECT email, COUNT(*) AS duplicate_count
-- FROM patients
-- GROUP BY email
-- HAVING COUNT(*) > 1;

-- Invalid time ranges (replace table/column names per week)
-- Example: appointments where end_time is before start_time
-- SELECT appointment_id, start_time, end_time
-- FROM appointments
-- WHERE end_time <= start_time;

-- Total mismatches (replace table/column names per week)
-- Example: invoice total does not match line items
-- SELECT i.invoice_id,
--        i.total_amount,
--        SUM(il.line_total) AS computed_total
-- FROM invoices i
-- JOIN invoice_lines il ON il.invoice_id = i.invoice_id
-- GROUP BY i.invoice_id, i.total_amount
-- HAVING i.total_amount <> SUM(il.line_total);
