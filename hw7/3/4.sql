update Students
set StudentName = :StudentName
where GroupId in (
	select GroupId 
	from Groups 
	where Groups.GroupName = :GroupName
)