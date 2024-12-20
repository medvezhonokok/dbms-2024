SELECT Runs.RunId, Runs.SessionId, Runs.Letter, Runs.SubmitTime, Runs.Accepted
FROM Sessions
JOIN Runs ON Sessions.SessionId = Runs.SessionId
WHERE Sessions.TeamId = :TeamId 
  AND Sessions.ContestId = :ContestId;
