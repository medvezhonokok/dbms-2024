DELIMITER $$

CREATE OR REPLACE FUNCTION BuyFree(
    IN FlightId INTEGER, 
    IN SeatNo VARCHAR(4)
)
RETURNS BOOLEAN 
BEGIN
    DECLARE CurrentTime TIMESTAMP;
    DECLARE SelectedPlaneId INTEGER;
    DECLARE FlightTime TIMESTAMP;
    
    SET CurrentTime = CURRENT_TIMESTAMP();  

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

    IF EXISTS (
        SELECT 1 
        FROM Plan P
        WHERE P.FlightId = FlightId 
          AND P.SeatNo = SeatNo 
          AND (P.PlanType = 'PURCHASE' OR P.PlanType = 'RESERVATION')
    ) THEN 
        RETURN FALSE; 
    END IF;

	IF FlightTime - INTERVAL 3 HOUR <= CurrentTime THEN
        RETURN FALSE;
    END IF;

    INSERT INTO Plan (UserId, FlightId, SeatNo, PlanType, CreationTime)
    VALUES (NULL, FlightId, SeatNo, 'PURCHASE', CurrentTime);
    
    RETURN TRUE;
END $$

DELIMITER ;
