-- Week 07 recommended indexes

-- Appointments by doctor and date
CREATE INDEX idx_appointment_doctor_start_dt
  ON appointment(doctor_id, start_dt);

-- Appointments by patient and date
CREATE INDEX idx_appointment_patient_start_dt
  ON appointment(patient_id, start_dt);

-- Prescription lookup by appointment
CREATE INDEX idx_prescription_appointment
  ON prescription(appointment_id);

-- Prescription items by prescription
CREATE INDEX idx_prescription_item_prescription
  ON prescription_item(prescription_id);

-- Invoice by appointment
CREATE INDEX idx_invoice_appointment
  ON invoice(appointment_id);

-- Payments by invoice
CREATE INDEX idx_payment_invoice
  ON payment(invoice_id);

-- Invoice by date
CREATE INDEX idx_invoice_date
  ON invoice(invoice_date);
