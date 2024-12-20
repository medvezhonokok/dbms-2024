UPDATE Runs
SET Accepted = 1
WHERE RunId IN (
    SELECT R.RunId
    FROM Runs R
    WHERE R.SubmitTime = (
        SELECT MAX(rR.SubmitTime)
        FROM Runs rR
        WHERE rR.SessionId = R.SessionId 
          AND rR.Letter = R.Letter
    )
);
