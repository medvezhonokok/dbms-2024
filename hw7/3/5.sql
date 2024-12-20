update Students
set GroupId = (
	select GroupId 
	from Groups
	where Groups.GroupName = :GroupName
)
where GroupId in (
	select GroupId 
	from Groups 
	where Groups.GroupName = :FromGroupName
)