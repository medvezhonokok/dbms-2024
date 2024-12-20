select StudentId, StudentName, GroupName
from Students 
JOIN Groups on Students.GroupId = Groups.GroupId
JOIN Faculties on Faculties.FacultyId = Groups.GroupFacultyId
where Faculties.FacultyName = :FacultyName;
