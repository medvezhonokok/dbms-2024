UPDATE
    Students
SET
    Marks =(
    SELECT
        COUNT(Mark)
    FROM
        Marks
    WHERE
        Marks.StudentId = Students.StudentId
),
Debts =(
    SELECT
        COUNT(DISTINCT p.CourseId)
    FROM
        Plan p
    WHERE
        p.GroupId = Students.GroupId AND p.CourseId NOT IN(
        SELECT
            CourseId
        FROM
            Marks
        WHERE
            Marks.StudentId = Students.StudentId
    )
);