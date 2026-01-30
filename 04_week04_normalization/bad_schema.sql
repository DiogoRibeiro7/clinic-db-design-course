-- Week 04 bad schema: 2NF/3NF violations
-- Functional dependencies (FDs):
-- 1) patient_id -> first_name, last_name, phone, email, zip_code, city, state_name
-- 2) zip_code -> city, state_name
-- 3) service_id -> service_name, base_price
-- 4) appointment_id -> patient_id, start_dt, end_dt
-- 5) (appointment_id, service_id) -> quantity, service_name, base_price

CREATE TABLE IF NOT EXISTS patient (
  patient_id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  phone VARCHAR(25) NOT NULL,
  email VARCHAR(100) NOT NULL,
  zip_code VARCHAR(10) NOT NULL,
  city VARCHAR(50) NOT NULL,
  state_name VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS service (
  service_id INT AUTO_INCREMENT PRIMARY KEY,
  service_name VARCHAR(100) NOT NULL,
  base_price DECIMAL(10,2) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS appointment (
  appointment_id INT AUTO_INCREMENT PRIMARY KEY,
  patient_id INT NOT NULL,
  start_dt DATETIME NOT NULL,
  end_dt DATETIME NOT NULL,
  CONSTRAINT fk_appointment_patient
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS appointment_service (
  appointment_id INT NOT NULL,
  service_id INT NOT NULL,
  service_name VARCHAR(100) NOT NULL,
  base_price DECIMAL(10,2) NOT NULL,
  quantity INT NOT NULL,
  PRIMARY KEY (appointment_id, service_id),
  CONSTRAINT fk_appointment_service_appointment
    FOREIGN KEY (appointment_id) REFERENCES appointment(appointment_id),
  CONSTRAINT fk_appointment_service_service
    FOREIGN KEY (service_id) REFERENCES service(service_id)
) ENGINE=InnoDB;
