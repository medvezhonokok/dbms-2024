DELIMITER $$

CREATE OR REPLACE PROCEDURE ManageFlight(
    IN UserId INTEGER,
    IN Pass TEXT,
    IN FlightId INTEGER,
    IN SellAllowed BOOLEAN,
    IN ReservationAllowed BOOLEAN
)
BEGIN
    DECLARE FlightTime TIMESTAMP;
    
    IF NOT HasUser(UserId, Pass) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No such user.';
    END IF;
    
	SET FlightTime = (
        SELECT F.FlightTime
        FROM Flights F
        WHERE F.FlightId = FlightId
        LIMIT 1
    );    

    IF FlightTime IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No such Flight.';
    END IF;
   
    UPDATE Flights F
    SET 
        SellAllowed = CASE
                        WHEN TIMESTAMPDIFF(HOUR, CURRENT_TIMESTAMP(), FlightTime) > 3 THEN SellAllowed
                        ELSE FALSE
                     END,

		ReservationAllowed = CASE
                                WHEN TIMESTAMPDIFF(DAY, CURRENT_TIMESTAMP(), FlightTime) > 3 THEN ReservationAllowed
                                ELSE FALSE
                             END
    WHERE F.FlightId = FlightId;
END $$

DELIMITER ;