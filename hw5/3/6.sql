select Students.StudentId, StudentName, Students.GroupId
from Students
natural join Marks
join Plan on Marks.CourseId = Plan.CourseId
join Lecturers on Lecturers.LecturerId = Plan.LecturerId
where Marks.Mark = :Mark AND Lecturers.LecturerName = :LecturerName;