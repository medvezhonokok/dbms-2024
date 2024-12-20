DELIMITER $$

CREATE OR REPLACE FUNCTION ValidUserId(in UserId INTEGER)
RETURNS BOOLEAN
BEGIN
    IF UserId IS NULL THEN
        RETURN FALSE;
    ELSE RETURN NOT EXISTS (
        SELECT 1
        FROM Users
        WHERE Users.UserId = UserId
    );
    END IF;
END $$

CREATE OR REPLACE FUNCTION HasUser(in UserId INTEGER, in Pass TEXT)
RETURNS BOOLEAN
BEGIN
    RETURN EXISTS (
		SELECT 1
		FROM Users
		Where Users.UserId = UserId AND Users.PasswordSha = SHA1(CONCAT(
            Pass,
            '<hash>',
            Users.CreationTime
        ))
	);
END $$

DELIMITER ;
