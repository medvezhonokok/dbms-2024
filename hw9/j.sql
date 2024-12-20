DELIMITER $$

CREATE OR REPLACE PROCEDURE CompressSeats(
    IN UserId INTEGER,
    IN Pass TEXT,
    IN FlightId INTEGER
)
BEGIN
    DECLARE done INT DEFAULT FALSE;
    
    DECLARE PUserId INT;
    DECLARE PSeatNo VARCHAR(4);
    DECLARE PPlanType ENUM('RESERVATION', 'PURCHASE');
    DECLARE SSeatNo VARCHAR(4);
            
    DECLARE cur1 CURSOR FOR 
        SELECT p.UserId, p.SeatNo, p.PlanType
        FROM Plan p
        WHERE p.FlightId = FlightId
        ORDER BY CASE 
                    WHEN p.PlanType = 'PURCHASE' THEN 1 
                    WHEN p.PlanType = 'RESERVATION' THEN 2
                    ELSE 3 
                 END, 
                 CAST(SUBSTRING(SeatNo, 1, 3) AS UNSIGNED) ASC,
                 SUBSTRING(SeatNo, 4, 1) ASC;  
                 
    DECLARE cur2 CURSOR FOR 
        SELECT s.SeatNo
        FROM Seats s
        JOIN Flights f ON f.PlaneId = s.PlaneId
        WHERE f.FlightId = FlightId
        ORDER BY CAST(SUBSTRING(SeatNo, 1, 3) AS UNSIGNED) ASC,
                 SUBSTRING(SeatNo, 4, 1) ASC; 
                 
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    CREATE TEMPORARY TABLE TempPlan (
        FlightId INTEGER,
        UserId INTEGER,
        SeatNo VARCHAR(4),
        PlanType ENUM('RESERVATION', 'PURCHASE')
    );
    
    OPEN cur1;
    OPEN cur2;
    
    read_loop: LOOP
        FETCH cur1 INTO PUserId, PSeatNo, PPlanType;
        FETCH cur2 INTO SSeatNo;
        
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        INSERT INTO TempPlan (FlightId, UserId, SeatNo, PlanType)
        VALUES (FlightId, PUserId, SSeatNo, PPlanType); 
        
    END LOOP;
    
    CLOSE cur1;
    CLOSE cur2;
    
    DELETE FROM Plan WHERE FlightId = FlightId;
    
    INSERT INTO Plan (UserId, FlightId, SeatNo, PlanType, CreationTime)
    SELECT TempPlan.UserId, FlightId, TempPlan.SeatNo, TempPlan.PlanType, NOW()
    FROM TempPlan;
    
    DROP TEMPORARY TABLE IF EXISTS TempPlan;
END $$

DELIMITER ;
