select StudentId, StudentName, GroupId
from Students      
NATURAL JOIN Marks  
NATURAL JOIN Plan
where Marks.Mark = :Mark AND Plan.LecturerId = :LecturerId;