select Students.StudentId, StudentName, GroupId
from Students, Marks      
where Marks.Mark = :Mark AND Marks.CourseId = :CourseId and Marks.StudentId = Students.StudentId;

