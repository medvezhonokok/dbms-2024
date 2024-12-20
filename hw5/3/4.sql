select StudentId, StudentName, GroupId
from Students      
NATURAL JOIN Marks
NATURAL JOIN Plan
NATURAL JOIN Lecturers
where Marks.Mark = :Mark AND Lecturers.LecturerName = :LecturerName;