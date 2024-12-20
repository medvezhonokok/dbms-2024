SELECT 
    T.TeamName,
    COUNT(DISTINCT R.Letter) AS Solved,
    SUM(
        CASE 
            WHEN R.Accepted = 1 THEN TIMESTAMPDIFF(SECOND, S.Start, R.SubmitTime) 
            ELSE 0 
        END
    ) AS Penalty
FROM 
    Teams T
JOIN 
    Sessions S ON T.TeamId = S.TeamId
JOIN 
    Runs R ON S.SessionId = R.SessionId
WHERE 
    S.ContestId = :ContestId
GROUP BY 
    T.TeamName
ORDER BY 
    Solved DESC, Penalty ASC, S.SessionId ASC;
