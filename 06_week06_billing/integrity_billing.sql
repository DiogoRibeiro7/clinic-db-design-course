-- Week 06 billing integrity checks (should return 0 rows)

-- 1) Invoice total mismatch vs line items
SELECT i.invoice_id,
       i.total_amount,
       COALESCE(SUM(ii.line_total), 0.00) AS computed_total
FROM invoice i
LEFT JOIN invoice_item ii ON ii.invoice_id = i.invoice_id
GROUP BY i.invoice_id, i.total_amount
HAVING i.total_amount <> COALESCE(SUM(ii.line_total), 0.00);

-- 2) Payments exceed invoice total
SELECT i.invoice_id,
       i.total_amount,
       COALESCE(SUM(p.amount), 0.00) AS total_paid
FROM invoice i
LEFT JOIN payment p ON p.invoice_id = i.invoice_id
GROUP BY i.invoice_id, i.total_amount
HAVING COALESCE(SUM(p.amount), 0.00) > i.total_amount;
