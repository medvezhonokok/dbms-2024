UPDATE
    Students
SET
    Marks =(
    SELECT
        COUNT(Marks.Mark)
    FROM
        Marks
    WHERE
        Marks.StudentId = Students.StudentId
)
WHERE
    Students.StudentId = :StudentId