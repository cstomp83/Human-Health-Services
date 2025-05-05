DELIMITER $$

CREATE TRIGGER after_detailnote_insert
AFTER INSERT ON detailnotes
FOR EACH ROW
BEGIN
    INSERT INTO patientmedicalrecords (
        RecordDate, 
        PatientUserName, 
        DetailNoteID
    ) VALUES (
        NEW.DateTimeCreated,
        NEW.PatientUserName,
        NEW.DetailNoteID
    );
END$$

DELIMITER ;