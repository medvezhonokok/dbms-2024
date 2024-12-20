SELECT TeamName
FROM Teams t
WHERE NOT EXISTS (
    SELECT 1
    FROM Sessions s
    NATURAL JOIN Runs r
    WHERE s.TeamId = t.TeamId
    AND r.Accepted = 1
);