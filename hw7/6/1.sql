INSERT INTO Marks(StudentId, CourseId, Mark)
SELECT
    NewMarks.StudentId,
    NewMarks.CourseId,
    NewMarks.Mark
FROM
    NewMarks
	LEFT JOIN Marks ON Marks.StudentId = NewMarks.StudentId AND Marks.CourseId = NewMarks.CourseId
WHERE
    Marks.Mark IS NULL