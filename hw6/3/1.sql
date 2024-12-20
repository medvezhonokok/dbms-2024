SELECT
    Students.StudentId,
    Plan.CourseId
FROM
    Students,
    Plan
WHERE
    Students.GroupId = Plan.GroupId
UNION
SELECT
    Marks.StudentId,
    Marks.CourseId
FROM
    Marks;