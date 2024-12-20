SELECT ContestId, Letter
FROM Problems p
WHERE NOT EXISTS (
    SELECT 1
    FROM Teams t
    JOIN Sessions s ON t.TeamId = s.TeamId
    WHERE s.ContestId = p.ContestId
    AND NOT EXISTS (
        SELECT 1
        FROM Runs r
        WHERE r.SessionId = s.SessionId
        AND r.Letter = p.Letter
        AND r.Accepted = 1
    )
)
AND p.ContestId = :ContestId;
