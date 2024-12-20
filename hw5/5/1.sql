SELECT StudentName, CourseName
FROM (
    SELECT Students.StudentId, Students.StudentName, Courses.CourseName
    FROM Students
    NATURAL JOIN Plan
    NATURAL JOIN Courses
) AS QUERY1;
