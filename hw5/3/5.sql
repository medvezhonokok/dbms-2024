select Students.StudentId, StudentName, Students.GroupId
from Students
natural join Marks
join Plan on Marks.CourseId = Plan.CourseId
where Marks.Mark = :Mark AND Plan.LecturerId = :LecturerId;