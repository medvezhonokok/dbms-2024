UPDATE
    Students
SET
    Marks = Marks + (
    SELECT
        COUNT(NewMarks.Mark)
    FROM
        NewMarks
    WHERE
        NewMarks.StudentId = Students.StudentId
)                                  
