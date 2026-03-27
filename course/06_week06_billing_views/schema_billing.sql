-- Week 06 billing schema

CREATE TABLE IF NOT EXISTS invoice (
  invoice_id INT AUTO_INCREMENT PRIMARY KEY,
  appointment_id INT NOT NULL,
  invoice_date DATE NOT NULL,
  total_amount DECIMAL(10,2) NOT NULL,
  status VARCHAR(20) NOT NULL,
  CONSTRAINT fk_invoice_appointment
    FOREIGN KEY (appointment_id) REFERENCES appointment(appointment_id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS invoice_item (
  invoice_item_id INT AUTO_INCREMENT PRIMARY KEY,
  invoice_id INT NOT NULL,
  description VARCHAR(100) NOT NULL,
  quantity INT NOT NULL,
  unit_price DECIMAL(10,2) NOT NULL,
  line_total DECIMAL(10,2) NOT NULL,
  CONSTRAINT fk_invoice_item_invoice
    FOREIGN KEY (invoice_id) REFERENCES invoice(invoice_id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS payment (
  payment_id INT AUTO_INCREMENT PRIMARY KEY,
  invoice_id INT NOT NULL,
  payment_dt DATETIME NOT NULL,
  amount DECIMAL(10,2) NOT NULL,
  method VARCHAR(20) NOT NULL,
  CONSTRAINT fk_payment_invoice
    FOREIGN KEY (invoice_id) REFERENCES invoice(invoice_id)
) ENGINE=InnoDB;

-- Optional: prevent payments that exceed invoice total
DELIMITER $$

CREATE TRIGGER trg_payment_total_guard_insert
BEFORE INSERT ON payment
FOR EACH ROW
BEGIN
  DECLARE total_paid DECIMAL(10,2);
  DECLARE invoice_total DECIMAL(10,2);

  SELECT COALESCE(SUM(p.amount), 0.00)
    INTO total_paid
  FROM payment p
  WHERE p.invoice_id = NEW.invoice_id;

  SELECT i.total_amount
    INTO invoice_total
  FROM invoice i
  WHERE i.invoice_id = NEW.invoice_id;

  IF total_paid + NEW.amount > invoice_total THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Payment exceeds invoice total';
  END IF;
END$$

CREATE TRIGGER trg_payment_total_guard_update
BEFORE UPDATE ON payment
FOR EACH ROW
BEGIN
  DECLARE total_paid DECIMAL(10,2);
  DECLARE invoice_total DECIMAL(10,2);

  SELECT COALESCE(SUM(p.amount), 0.00)
    INTO total_paid
  FROM payment p
  WHERE p.invoice_id = NEW.invoice_id
    AND p.payment_id <> NEW.payment_id;

  SELECT i.total_amount
    INTO invoice_total
  FROM invoice i
  WHERE i.invoice_id = NEW.invoice_id;

  IF total_paid + NEW.amount > invoice_total THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Payment exceeds invoice total';
  END IF;
END$$

DELIMITER ;
