SELECT Teams.TeamName
FROM Teams
natural join Universities
WHERE Universities.UnivName = :UnivName
  AND Teams.TeamId NOT IN (
    SELECT Sessions.TeamId
    FROM Sessions
    NATURAL JOIN Runs
    WHERE Runs.Accepted = 1
  );

