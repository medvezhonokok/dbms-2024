SELECT
    s.StudentName,
    SUM(m.Mark) AS SumMark
FROM
    Students s
LEFT JOIN Marks m ON
    s.StudentId = m.StudentId
GROUP BY
    s.StudentId, s.StudentName;