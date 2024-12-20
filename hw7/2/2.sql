DELETE
FROM
    Students
WHERE
    StudentId IN(
    SELECT
        StudentId
    FROM
        Students s
    WHERE
        (
        SELECT
            COUNT(distinct CourseId)
        FROM
            Plan p
        WHERE
            p.GroupId = s.GroupId AND p.CourseId NOT IN(
            SELECT
                CourseId
            FROM
                Marks
            WHERE
                Marks.StudentId = s.StudentId
        )
    ) >= 2
);