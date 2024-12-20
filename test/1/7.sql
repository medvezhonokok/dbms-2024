SELECT DISTINCT UnivName
FROM Universities
JOIN Teams ON Universities.UnivId = Teams.UnivId
WHERE Teams.TeamId IN (
    SELECT DISTINCT Sessions.TeamId
    FROM Sessions
    JOIN Runs ON Sessions.SessionId = Runs.SessionId
    WHERE Runs.Accepted = 0
);
