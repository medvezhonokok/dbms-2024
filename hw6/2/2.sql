select Students.StudentId, StudentName, GroupName
from Students, Groups, Faculties      
where Groups.GroupId = Students.GroupId and Faculties.FacultyId = Groups.GroupFacultyId and Faculties.FacultyName = :FacultyName;

