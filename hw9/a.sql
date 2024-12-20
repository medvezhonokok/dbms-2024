DELIMITER $$

CREATE OR REPLACE FUNCTION RegisterUser(in UserId INTEGER, in Pass TEXT)
RETURNS BOOLEAN
BEGIN
    DECLARE Salt TEXT;
    SET Salt = '<hash>';

    IF Pass IS NULL OR TRIM(Pass) = '' THEN
        RETURN FALSE;
    END IF;

    IF LENGTH(Pass) < 1 OR LENGTH(Pass) > 25 THEN
        RETURN FALSE;
    END IF;

    IF Pass NOT REGEXP '^[a-z]+$' THEN
        RETURN FALSE;
    END IF;

    IF (ValidUserId(UserId)) THEN
        INSERT INTO Users (UserId, PasswordSha, CreationTime)
        VALUES (UserId, SHA1(CONCAT(Pass, Salt, NOW())), NOW());
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END $$

DELIMITER ;
