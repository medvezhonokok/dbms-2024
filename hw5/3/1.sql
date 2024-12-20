select StudentId, StudentName, GroupId
from Students      
NATURAL JOIN Marks
where Marks.Mark = :Mark AND Marks.CourseId = :CourseId;