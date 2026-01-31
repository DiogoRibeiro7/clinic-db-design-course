-- Week 01 schema: deliberately denormalized single table
CREATE TABLE IF NOT EXISTS appointment_flat (
  appointment_id INT AUTO_INCREMENT PRIMARY KEY,
  appointment_date DATE NOT NULL,
  start_time TIME NOT NULL,
  end_time TIME NOT NULL,

  patient_id INT NOT NULL,
  patient_first_name VARCHAR(50) NOT NULL,
  patient_last_name VARCHAR(50) NOT NULL,
  patient_phone VARCHAR(25) NOT NULL,
  patient_email VARCHAR(100) NOT NULL,

  doctor_id INT NOT NULL,
  doctor_first_name VARCHAR(50) NOT NULL,
  doctor_last_name VARCHAR(50) NOT NULL,
  doctor_specialty VARCHAR(50) NOT NULL,

  medication_name VARCHAR(100) NULL,
  medication_dose_mg INT NULL,
  medication_frequency_per_day INT NULL,

  invoice_id INT NOT NULL,
  invoice_total_amount DECIMAL(10,2) NOT NULL,
  invoice_status VARCHAR(20) NOT NULL
);
