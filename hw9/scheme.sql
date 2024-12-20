CREATE TABLE Flights(
    FlightId INTEGER,
    FlightTime TIMESTAMP NOT NULL,
    PlaneId INTEGER NOT NULL,
    SellAllowed BOOLEAN,
    ReservationAllowed BOOLEAN
); 

CREATE TABLE Seats(
    PlaneId INTEGER NOT NULL,
    SeatNo VARCHAR(4) NOT NULL 									-- 123A
);

-- ������� �������������
CREATE TABLE Users(
    UserId INTEGER PRIMARY KEY, 								-- id ������������
    PasswordSha TEXT NOT NULL,   								-- ������������ � ���������� ������
    CreationTime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() -- timestamp ����������� ������������
);

-- ������� ������/������ �������
CREATE TABLE Plan(
    UserId INTEGER,
    FlightId INTEGER NOT NULL,
    SeatNo VARCHAR(4) NOT NULL,
    PlanType ENUM('RESERVATION', 'PURCHASE') NOT NULL,          -- enum ����� �������� ������� ������ �� ������������
    CreationTime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() -- timestamp �������� ������
);