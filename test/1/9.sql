SELECT SessionId
FROM Sessions
WHERE NOT EXISTS (
    SELECT 1
    FROM Problems
    WHERE Problems.ContestId = Sessions.ContestId
    AND NOT EXISTS (
        SELECT 1
        FROM Runs
        WHERE Runs.SessionId = Sessions.SessionId
        AND Runs.Letter = Problems.Letter
    )
);