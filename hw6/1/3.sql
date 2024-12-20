select StudentId, StudentName, Groups.GroupId
from Students, Groups, Faculties 
where Faculties.FacultyName = :FacultyName and Faculties.FacultyId = Groups.GroupFacultyId and Students.GroupId = Groups.GroupId;

