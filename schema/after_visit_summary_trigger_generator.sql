DELIMITER //

CREATE TRIGGER after_pmr_update
AFTER UPDATE ON patientmedicalrecords
FOR EACH ROW
BEGIN
    -- Call the stored procedure with the related DetailNoteID
    CALL GenerateAfterVisitSummary(NEW.DetailNoteID);
END //

DELIMITER ;