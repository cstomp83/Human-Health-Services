CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTodayAppointmentsByStaff`(
    IN inputStaffUserName VARCHAR(50)
)
BEGIN
    SELECT 
        pc.PhysicianUserName,
        p.PatientUserName,
        p.StartTime,
        p.ApptTypeID
    FROM 
        physicianappts p
    JOIN 
        staff s ON p.ClinicID = s.ClinicID
    JOIN 
        physiciancalenders pc ON p.PhysicianCalenderID = pc.PhysicianCalenderID
    WHERE 
        s.StaffUserName = inputStaffUserName
        AND p.Date = CURDATE()
    ORDER BY 
        p.StartTime;
END