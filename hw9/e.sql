DELIMITER $$

CREATE OR REPLACE FUNCTION ExtendReservation(
    IN UserId INTEGER, 
    IN Pass TEXT, 
    IN FlightId INTEGER, 
    IN SeatNo VARCHAR(4)
)
RETURNS BOOLEAN 
BEGIN
    DECLARE CurrentTime TIMESTAMP;
    DECLARE SelectedPlaneId INTEGER;
    
    SET CurrentTime = CURRENT_TIMESTAMP();  
    
    IF NOT HasUser(UserId, Pass) THEN
        RETURN FALSE;
    END IF;  
    
    SET SelectedPlaneId = (
        SELECT Flights.PlaneId
        FROM Flights
        WHERE Flights.FlightId = FlightId 
          AND Flights.FlightTime > CurrentTime 
          AND Flights.ReservationAllowed
    );
    
    IF SelectedPlaneId IS NULL OR SeatNo NOT IN (
        SELECT Seats.SeatNo
        FROM Seats
        WHERE Seats.PlaneId = SelectedPlaneId
    ) THEN
        RETURN FALSE;
    END IF; 

    -- Проверка, что место уже занято другим человеком или куплено
    IF EXISTS (
        SELECT 1 
        FROM Plan P
        WHERE (P.UserId != UserId OR P.PlanType = 'PURCHASE') 
          AND P.FlightId = FlightId
          AND P.SeatNo = SeatNo
    ) THEN
        RETURN FALSE;  
    END IF;
    
    IF EXISTS (
        SELECT 1 
        FROM Plan P
        WHERE P.UserId = UserId 
          AND P.FlightId = FlightId 
          AND P.SeatNo = SeatNo
          AND P.PlanType = 'RESERVATION'
    ) THEN
        UPDATE Plan
        SET CreationTime = CurrentTime + INTERVAL 1 DAY
        WHERE UserId = UserId 
          AND FlightId = FlightId 
          AND SeatNo = SeatNo
          AND PlanType = 'RESERVATION';

        RETURN TRUE;  
    ELSE
        RETURN FALSE; 
    END IF;
END $$

DELIMITER ;
