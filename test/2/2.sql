SELECT DISTINCT T.TeamName
FROM Teams T
JOIN Sessions S ON T.TeamId = S.TeamId
JOIN Runs R ON S.SessionId = R.SessionId
WHERE S.ContestId = :ContestId AND R.Letter = :Letter AND R.Accepted = 1;