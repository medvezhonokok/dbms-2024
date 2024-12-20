select distinct UnivName
from Universities U
join Teams on Teams.UnivId = U.UnivId
join Sessions on Sessions.TeamId = Teams.TeamId
where Sessions.ContestId = :ContestId
