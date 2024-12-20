UPDATE
    Marks
SET
    Mark =(
    SELECT
        NewMarks.Mark
    FROM
        NewMarks
    WHERE
        NewMarks.CourseId = Marks.CourseId AND NewMarks.StudentId = Marks.StudentId
)
WHERE
    EXISTS(
    SELECT
        *
    FROM
        NewMarks
    WHERE
        NewMarks.CourseId = Marks.CourseId AND NewMarks.StudentId = Marks.StudentId
)