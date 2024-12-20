SELECT StudentName, CourseName
FROM Students 
NATURAL JOIN Plan
NATURAL JOIN Courses
NATURAL JOIN Lecturers
WHERE Lecturers.LecturerName=:LecturerName;