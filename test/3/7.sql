MERGE INTO Sessions
USING Teams
   ON Sessions.TeamId = Teams.TeamId AND Sessions.ContestId = :ContestId
WHEN MATCHED THEN
   UPDATE SET Start = CURRENT_TIMESTAMP
WHEN NOT MATCHED THEN
   INSERT (TeamId, ContestId, Start)
   VALUES (Teams.TeamId, :ContestId, CURRENT_TIMESTAMP);
