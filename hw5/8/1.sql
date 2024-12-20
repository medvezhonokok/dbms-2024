SELECT
    SUM(Mark) SumMark
FROM
    Marks
WHERE
    StudentId = :StudentId;