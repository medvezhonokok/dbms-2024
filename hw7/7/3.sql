CREATE VIEW Debts (StudentId, Debts) AS 
SELECT
    s.StudentId,
    COUNT(DISTINCT p.CourseId) AS Debts
FROM
    Students s
JOIN
    Plan p ON s.GroupId = p.GroupId
WHERE
    p.CourseId NOT IN (
        SELECT
            CourseId
        FROM
            Marks
        WHERE
            Marks.StudentId = s.StudentId 
    )
GROUP BY
    s.StudentId;
