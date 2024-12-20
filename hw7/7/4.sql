CREATE VIEW StudentDebts AS
SELECT 
    Students.StudentId,
    COALESCE(SD.StudentDebts, 0) AS Debts
FROM 
    Students
LEFT JOIN (
    SELECT 
        Students.StudentId,
		count(distinct p.CourseId) as StudentDebts
    FROM 
        Students
    NATURAL JOIN Plan p
    LEFT JOIN 
        Marks m ON Students.StudentId = m.StudentId AND p.CourseId = m.CourseId
    WHERE 
        m.Mark IS NULL
    GROUP BY 
        Students.StudentId
) SD ON SD.StudentId = Students.StudentId;