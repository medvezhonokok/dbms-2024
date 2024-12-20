delete from Runs
where SessionId in (
	select SessionId
	from Sessions
	join Teams on Teams.TeamId = Sessions.TeamId
	where Teams.UnivId = :UnivId
);