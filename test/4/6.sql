SELECT 
    S.ContestId, 
    T.TeamName, 
    R.SubmitTime
FROM 
    Teams T
JOIN 
    Sessions S ON T.TeamId = S.TeamId
JOIN 
    Runs R ON S.SessionId = R.SessionId
WHERE 
    R.SubmitTime = (
        SELECT MAX(R2.SubmitTime)
        FROM Runs R2
        JOIN Sessions S2 ON R2.SessionId = S2.SessionId
        WHERE S2.ContestId = S.ContestId
    );
