MERGE INTO 
    Marks 
USING 
    NewMarks
ON
    Marks.StudentId = NewMarks.StudentId AND Marks.CourseId = NewMarks.CourseId WHEN matched and Marks.Mark < NewMarks.Mark THEN
UPDATE
SET
    Mark = NewMarks.Mark WHEN NOT matched THEN
INSERT
    (StudentId, CourseId, Mark) 
    VALUES(
        NewMarks.StudentId,
        NewMarks.CourseId,
        NewMarks.Mark
    )