SELECT StudentName, CourseName
from Students
natural JOIN Faculties
JOIN Plan on Plan.LecturerId = Faculties.DeanId
NATURAL JOIN Courses 