-- Week 05 rules: prevent overlapping appointments per doctor

DELIMITER $$

CREATE TRIGGER trg_appointment_no_overlap_insert
BEFORE INSERT ON appointment
FOR EACH ROW
BEGIN
  IF EXISTS (
    SELECT 1
    FROM appointment a
    WHERE a.doctor_id = NEW.doctor_id
      AND NEW.start_dt < a.end_dt
      AND NEW.end_dt > a.start_dt
  ) THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Doctor has overlapping appointment';
  END IF;
END$$

CREATE TRIGGER trg_appointment_no_overlap_update
BEFORE UPDATE ON appointment
FOR EACH ROW
BEGIN
  IF EXISTS (
    SELECT 1
    FROM appointment a
    WHERE a.doctor_id = NEW.doctor_id
      AND a.appointment_id <> NEW.appointment_id
      AND NEW.start_dt < a.end_dt
      AND NEW.end_dt > a.start_dt
  ) THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Doctor has overlapping appointment';
  END IF;
END$$

DELIMITER ;
