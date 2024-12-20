SELECT R.Letter
FROM Runs R
JOIN Sessions S ON R.SessionId = S.SessionId
JOIN Teams T ON S.TeamId = T.TeamId
WHERE S.ContestId = :ContestId
  AND T.UnivId = :UnivId
  AND R.Accepted = 1
GROUP BY R.Letter
HAVING COUNT(DISTINCT T.TeamId) = (
    SELECT MAX(NumTeams)
    FROM (
        SELECT R2.Letter, COUNT(DISTINCT T2.TeamId) AS NumTeams
        FROM Runs R2
        JOIN Sessions S2 ON R2.SessionId = S2.SessionId
        JOIN Teams T2 ON S2.TeamId = T2.TeamId
        WHERE S2.ContestId = :ContestId
          AND T2.UnivId = :UnivId
          AND R2.Accepted = 1
        GROUP BY R2.Letter
    ) AS LetterCounts
);
