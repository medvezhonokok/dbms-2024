DELIMITER $$

CREATE OR REPLACE FUNCTION BuyReserved(
    IN UserId INTEGER, 
    IN Pass TEXT, 
    IN FlightId INTEGER, 
    IN SeatNo VARCHAR(4)
)
RETURNS BOOLEAN 
BEGIN
    DECLARE CurrentTime TIMESTAMP;
    DECLARE SelectedPlaneId INTEGER;
    DECLARE FlightTime TIMESTAMP;

    SET CurrentTime = CURRENT_TIMESTAMP();  
    
    IF NOT HasUser(UserId, Pass) THEN
        RETURN FALSE; 
    END IF;

    SELECT Flights.PlaneId, Flights.FlightTime
    INTO SelectedPlaneId, FlightTime
    FROM Flights
    WHERE Flights.FlightId = FlightId 
      AND Flights.FlightTime > CurrentTime
      AND Flights.SellAllowed = TRUE;

    IF SelectedPlaneId IS NULL THEN
        RETURN FALSE; 
    END IF;

    IF SeatNo NOT IN (
        SELECT Seats.SeatNo
        FROM Seats
        WHERE Seats.PlaneId = SelectedPlaneId
    ) THEN
        RETURN FALSE;
    END IF;

    IF NOT EXISTS (
        SELECT 1
        FROM Plan P
        WHERE P.FlightId = FlightId 
          AND P.SeatNo = SeatNo
          AND P.UserId = UserId
          AND P.PlanType = 'RESERVATION'
    ) THEN
        RETURN FALSE;
    END IF;

    IF CURRENT_TIMESTAMP() >= FlightTime - INTERVAL 3 HOUR THEN
        RETURN FALSE;
    END IF;

    UPDATE Plan
    SET Plan.PlanType = 'PURCHASE'
    WHERE Plan.UserId = UserId 
      AND Plan.FlightId = FlightId 
      AND Plan.SeatNo = SeatNo;

    RETURN TRUE;
END $$

DELIMITER ;