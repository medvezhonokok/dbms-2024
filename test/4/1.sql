SELECT SessionId, COUNT(DISTINCT Letter) AS Solved
FROM Runs
WHERE Accepted = 1
GROUP BY SessionId;
