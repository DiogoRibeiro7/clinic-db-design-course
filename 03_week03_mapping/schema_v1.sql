-- Week 03 schema v1: relational mapping
CREATE TABLE IF NOT EXISTS patient (
  patient_id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  date_of_birth DATE NOT NULL,
  phone VARCHAR(25) NOT NULL,
  email VARCHAR(100) NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY uq_patient_email (email)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS doctor (
  doctor_id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  specialty VARCHAR(50) NOT NULL,
  is_active TINYINT(1) NOT NULL DEFAULT 1,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS room (
  room_id INT AUTO_INCREMENT PRIMARY KEY,
  room_code VARCHAR(20) NOT NULL,
  room_type VARCHAR(30) NOT NULL,
  is_active TINYINT(1) NOT NULL DEFAULT 1,
  UNIQUE KEY uq_room_code (room_code)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS appointment (
  appointment_id INT AUTO_INCREMENT PRIMARY KEY,
  patient_id INT NOT NULL,
  doctor_id INT NOT NULL,
  room_id INT NOT NULL,
  start_dt DATETIME NOT NULL,
  end_dt DATETIME NOT NULL,
  status VARCHAR(20) NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_appointment_patient
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
  CONSTRAINT fk_appointment_doctor
    FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id),
  CONSTRAINT fk_appointment_room
    FOREIGN KEY (room_id) REFERENCES room(room_id)
) ENGINE=InnoDB;

CREATE INDEX idx_appointment_doctor_start_dt
  ON appointment(doctor_id, start_dt);

CREATE INDEX idx_appointment_patient_start_dt
  ON appointment(patient_id, start_dt);

CREATE TABLE IF NOT EXISTS medication (
  medication_id INT AUTO_INCREMENT PRIMARY KEY,
  medication_name VARCHAR(100) NOT NULL,
  form VARCHAR(30) NOT NULL,
  strength_mg INT NOT NULL,
  is_active TINYINT(1) NOT NULL DEFAULT 1,
  UNIQUE KEY uq_medication_name_strength (medication_name, strength_mg)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS prescription (
  prescription_id INT AUTO_INCREMENT PRIMARY KEY,
  appointment_id INT NOT NULL,
  prescribed_at DATETIME NOT NULL,
  notes VARCHAR(255) NULL,
  CONSTRAINT fk_prescription_appointment
    FOREIGN KEY (appointment_id) REFERENCES appointment(appointment_id),
  UNIQUE KEY uq_prescription_appointment (appointment_id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS prescription_item (
  prescription_item_id INT AUTO_INCREMENT PRIMARY KEY,
  prescription_id INT NOT NULL,
  medication_id INT NOT NULL,
  dose_mg INT NOT NULL,
  frequency_per_day INT NOT NULL,
  duration_days INT NOT NULL,
  CONSTRAINT fk_prescription_item_prescription
    FOREIGN KEY (prescription_id) REFERENCES prescription(prescription_id),
  CONSTRAINT fk_prescription_item_medication
    FOREIGN KEY (medication_id) REFERENCES medication(medication_id),
  UNIQUE KEY uq_prescription_item_med (prescription_id, medication_id)
) ENGINE=InnoDB;
