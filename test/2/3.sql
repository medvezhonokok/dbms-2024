SELECT DISTINCT S.TeamId
FROM Sessions S
JOIN Runs R ON S.SessionId = R.SessionId
WHERE S.ContestId = :ContestId AND R.Accepted = 1;
