INSERT INTO Sessions (TeamId, ContestId, Start)
SELECT TeamId, :ContestId, current_timestamp
FROM Teams
WHERE TeamId NOT IN (
    SELECT TeamId
    FROM Sessions
    WHERE ContestId = :ContestId
);
