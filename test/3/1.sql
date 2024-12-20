delete from Runs
where SessionId in (
	select SessionId 
	from Sessions S	
	where S.ContestId = :ContestId
);
