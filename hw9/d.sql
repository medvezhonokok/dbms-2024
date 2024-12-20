DELIMITER $$

CREATE OR REPLACE FUNCTION Reserve(
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
        WHERE Flights.FlightId = FlightId AND Flights.FlightTime > CurrentTime AND Flights.ReservationAllowed
    );
    
    IF SelectedPlaneId IS NULL OR SeatNo NOT IN (
        SELECT Seats.SeatNo
        FROM Seats
        WHERE Seats.PlaneId = SelectedPlaneId
    ) THEN
        RETURN FALSE;
    END IF; 

    -- Выбранное место занято другим человеком, либо уже просто куплено.
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
    ) THEN
    	-- ::NOTE:: в mariadb нет upsert, который сюда бы хорошо "уместился".
        -- 			можно использовать INSERT ... ON DUPLICATE KEY ...
        -- 			но в данном случае это увеличит кол-во кода.  
        UPDATE Plan
        SET Plan.CreationTime = CURRENT_TIMESTAMP + INTERVAL 1 DAY
        WHERE Plan.UserId = UserId 
          AND Plan.FlightId = FlightId 
          AND Plan.SeatNo = SeatNo;
    ELSE
        INSERT INTO Plan (UserId, FlightId, SeatNo, PlanType, CreationTime)
        VALUES (UserId, FlightId, SeatNo, 'RESERVATION', CURRENT_TIMESTAMP + INTERVAL 1 DAY);
    END IF;

    RETURN TRUE;
END $$

DELIMITER ;
