delete
from Students
where Students.StudentId not in (
	select StudentId 
	from Marks
)