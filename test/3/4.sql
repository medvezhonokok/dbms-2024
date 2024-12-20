UPDATE Runs
SET Accepted = 1
WHERE RunId IN (
    SELECT R.RunId
    FROM Runs R
    JOIN Sessions S ON R.SessionId = S.SessionId
    JOIN Teams T ON S.TeamId = T.TeamId
    WHERE T.UnivId = :UnivId
    AND R.SubmitTime = (
        SELECT MAX(SubmitTime)
        FROM Runs rR
        WHERE rR.SessionId = S.SessionId
    )
);
