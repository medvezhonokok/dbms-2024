SELECT DISTINCT Problems.ContestId, Problems.Letter
FROM Runs
JOIN Sessions ON Runs.SessionId = Sessions.SessionId
JOIN Problems ON Sessions.ContestId = Problems.ContestId AND Runs.Letter = Problems.Letter
WHERE Runs.Accepted = 1;