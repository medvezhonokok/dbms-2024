SELECT TeamId, COUNT(*) AS Solved
FROM Sessions s
JOIN Runs r ON s.SessionId = r.SessionId
WHERE r.Accepted = 1
GROUP BY TeamId;
