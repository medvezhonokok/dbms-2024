select Students.StudentId, StudentName, GroupName
from Students, Groups, Faculties, Lecturers      
where Groups.GroupId = Students.GroupId 
	and Lecturers.LecturerName = :LecturerName 
	and Faculties.FacultyId = Groups.GroupFacultyId
	and Lecturers.LecturerId = Faculties.DeanId;

