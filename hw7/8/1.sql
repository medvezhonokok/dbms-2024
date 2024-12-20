-- MariaDB 
-- version: mariadb:10.11

DELIMITER
    //
CREATE TRIGGER NoExtraMarks BEFORE INSERT ON
    Marks FOR EACH ROW
BEGIN
    IF NOT EXISTS
        (
        SELECT
            1
        FROM
            Students
        JOIN Plan ON Plan.GroupId = Students.GroupId
        WHERE
            Students.StudentId = NEW.StudentId AND Plan.CourseId = NEW.CourseId
    ) THEN SIGNAL SQLSTATE '45000' ;
END IF ;
END //
DELIMITER
    ;