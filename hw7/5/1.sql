UPDATE
    Students
SET
    Marks =(
    SELECT
        COUNT(DISTINCT CourseId)
    FROM
        Marks
    WHERE
        Marks.StudentId = Students.StudentId
)