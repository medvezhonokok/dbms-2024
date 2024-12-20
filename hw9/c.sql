DELIMITER $$

CREATE OR REPLACE PROCEDURE FreeSeats(IN FlightId INTEGER)
BEGIN
    DECLARE CurrentTime TIMESTAMP;
	DECLARE SelectedPlaneId INT;    

    SET CurrentTime = CURRENT_TIMESTAMP();
	SET SelectedPlaneId = (
		SELECT Flights.PlaneId
		FROM Flights
		WHERE Flights.FlightId = FlightId AND Flights.FlightTime > CurrentTime AND (Flights.SellAllowed or Flights.ReservationAllowed)
	);

	IF SelectedPlaneId IS NULL THEN
        SELECT 'No such free seats on this flight.' AS Message;
    ELSE
        SELECT S.SeatNo 
        FROM Seats S
        WHERE S.PlaneId = SelectedPlaneId
        EXCEPT
        (
            SELECT Plan.SeatNo
            FROM Plan
            WHERE Plan.FlightId = FlightId AND (Plan.PlanType = 'PURCHASE' or Plan.CreationTime + INTERVAL 3 DAY > CurrentTime)	
        );
	END IF;
END $$
DELIMITER ;