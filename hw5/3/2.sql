select StudentId, StudentName, GroupId
from Students      
NATURAL JOIN Marks
NATURAL JOIN Courses
where Marks.Mark = :Mark AND Courses.CourseName = :CourseName;