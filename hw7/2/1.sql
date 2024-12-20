DELETE
FROM
    Students
WHERE
    EXISTS(
    SELECT
        CourseId
    FROM
        Plan
    WHERE
        Plan.GroupId = Students.GroupId AND Plan.CourseId NOT IN(
        SELECT
            CourseId
        FROM
            Marks
        WHERE
            Marks.StudentId = Students.StudentId
    )
)