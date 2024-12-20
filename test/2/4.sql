SELECT p.ContestId, p.Letter
FROM Problems p
WHERE NOT EXISTS (
    SELECT 1
    FROM Runs r
    JOIN Sessions s ON s.SessionId = r.SessionId
    JOIN Teams t ON t.TeamId = s.TeamId
    WHERE t.UnivId = :UnivId
      AND r.Accepted = 1
      AND r.Letter = p.Letter
      AND s.ContestId = p.ContestId
);
