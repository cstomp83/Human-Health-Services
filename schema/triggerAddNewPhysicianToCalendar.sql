
DELIMITER $$

CREATE TRIGGER trg_add_physician_calendar_on_physician
AFTER INSERT ON Physicians
FOR EACH ROW
BEGIN
    INSERT INTO PhysicianCalenders (PhysicianUserName)
    VALUES (NEW.PhysicianUserName);
END $$

DELIMITER ;
