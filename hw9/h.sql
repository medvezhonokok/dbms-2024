DELIMITER $$

CREATE OR REPLACE PROCEDURE FlightStatistics(
    IN UserId INTEGER,
    IN Pass TEXT
)
BEGIN
    DECLARE CurrentTime TIMESTAMP;    
    DECLARE TotalSeats INTEGER;
    DECLARE ReservedSeats INTEGER;
    DECLARE SoldSeats INTEGER;
    DECLARE SoldOrReservedSeats INTEGER;
    DECLARE TotalReservedByUser INTEGER;
    DECLARE TotalBoughtByUser INTEGER;

    SET CurrentTime = CURRENT_TIMESTAMP();

    IF NOT HasUser(UserId, Pass) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No such user.';
    END IF;

    SET TotalSeats = (SELECT COUNT(*)
                      FROM Seats S
                      NATURAL JOIN Flights F
                      WHERE F.FlightTime > CurrentTime);

    SET ReservedSeats = (SELECT COUNT(*)
                      FROM Seats S
                      NATURAL JOIN Flights F
                      NATURAL JOIN Plan P
                      WHERE F.FlightTime > CurrentTime AND P.PlanType = 'RESERVATION');

    SET SoldSeats = (SELECT COUNT(*)
                      FROM Seats S
                      NATURAL JOIN Flights F
                      NATURAL JOIN Plan P
                      WHERE F.FlightTime > CurrentTime AND P.PlanType = 'PURCHASE');

    SET TotalReservedByUser = (
        SELECT COUNT(*) 
        FROM Plan
        WHERE Plan.UserId = UserId AND Plan.PlanType = 'RESERVATION'
    );

    SET TotalBoughtByUser = (
        SELECT COUNT(*) 
        FROM Plan
        WHERE Plan.UserId = UserId AND Plan.PlanType = 'PURCHASE'
    );

    SELECT 
        TotalSeats AS TotalSeats,
        ReservedSeats AS ReservedSeats,
        SoldSeats AS SoldSeats,
        (SoldSeats + ReservedSeats) AS SoldOrReservedSeats,
        TotalReservedByUser AS TotalReservedByUser,
        TotalBoughtByUser AS TotalBoughtByUser;

END $$

DELIMITER ;