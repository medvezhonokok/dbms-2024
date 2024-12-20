select StudentId, StudentName, GroupName
from Students 
NATURAL JOIN Groups
JOIN Faculties on Faculties.FacultyId = Groups.GroupFacultyId
JOIN Lecturers on Lecturers.LecturerId = Faculties.DeanId
where Lecturers.LecturerName = :LecturerName;