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

-- “аблица пользователей
CREATE TABLE Users(
    UserId INTEGER PRIMARY KEY, 								-- id пользовател€
    PasswordSha TEXT NOT NULL,   								-- хэшированный и посоленный пароль
    CreationTime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() -- timestamp регистрации пользовател€
);

-- “аблица продаж/броней билетов
CREATE TABLE Plan(
    UserId INTEGER,
    FlightId INTEGER NOT NULL,
    SeatNo VARCHAR(4) NOT NULL,
    PlanType ENUM('RESERVATION', 'PURCHASE') NOT NULL,          -- enum чтобы отличить покупку билета от бронировани€
    CreationTime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() -- timestamp создани€ заказа
);