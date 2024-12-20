CREATE VIEW AllMarks (StudentId, Marks) AS
SELECT 
    s.StudentId,
    COALESCE(m.MarkCount, 0) + COALESCE(n.MarkCount, 0) AS Marks
FROM 
    Students s
LEFT JOIN (
    SELECT StudentId, COUNT(*) AS MarkCount
    FROM Marks
    GROUP BY StudentId
) m ON s.StudentId = m.StudentId
LEFT JOIN (
    SELECT StudentId, COUNT(*) AS MarkCount
    FROM NewMarks
    GROUP BY StudentId
) n ON s.StudentId = n.StudentId;
