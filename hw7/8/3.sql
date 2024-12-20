-- MariaDB 
-- version: mariadb:10.11

DELIMITER //

CREATE TRIGGER PreserveMarks
BEFORE UPDATE ON
	Marks FOR EACH ROW
BEGIN
    IF NEW.Mark < OLD.Mark THEN SET NEW.Mark = OLD.Mark ;
    END IF ;
END // ; 

DELIMITER ;