SELECT
    StudentName,
    CourseName
FROM
    (
    SELECT
        StudentId,
        CourseId
    FROM
        Students
    NATURAL JOIN Plan EXCEPT SELECT
        StudentId,
        CourseId
    FROM
        Students
    NATURAL JOIN Marks WHERE Marks.Mark is not null and Marks.Mark > 3
) SubQueryName1
NATURAL JOIN Students 
NATURAL JOIN Courses;