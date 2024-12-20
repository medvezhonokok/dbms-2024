SELECT Runs.RunId, Runs.SessionId, Runs.Letter, Runs.SubmitTime
FROM Sessions
JOIN Runs ON Sessions.SessionId = Runs.SessionId
WHERE Sessions.ContestId = :ContestId
  AND Runs.Accepted = 1;