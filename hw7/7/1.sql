CREATE VIEW StudentMarks(StudentId, Marks) AS 
SELECT
    Students.StudentId,
    COUNT(Mark) AS Marks
FROM
    Students
LEFT JOIN Marks ON
    Students.StudentId = Marks.StudentId
GROUP BY
    Students.StudentId;