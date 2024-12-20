SELECT
    StudentId,
    StudentName,
    GroupId
FROM
    Students
NATURAL JOIN Courses 
NATURAL JOIN Plan 
WHERE Courses.CourseName = :CourseName 
EXCEPT SELECT
	StudentId,
    StudentName,
    GroupId
FROM Students
    NATURAL JOIN Marks 
	NATURAL JOIN Courses 
	WHERE Courses.CourseName = :CourseName;