select StudentId, StudentName, Groups.GroupId 
from Students, Groups 
where Groups.GroupName = :GroupName and Students.GroupId = Groups.GroupId;