UPDATE
    Students
SET
    Debts =(
    SELECT
        COUNT(DISTINCT p.CourseId)
    FROM
        Plan p
	JOIN Faculties on Faculties.DeanId = p.LecturerId
    WHERE
        p.GroupId = Students.GroupId AND p.CourseId NOT IN(
        SELECT
            CourseId
        FROM
            Marks
        WHERE
            Marks.StudentId = Students.StudentId
    )
)
WHERE
    GroupId IN(
    SELECT
        GroupId
    FROM
        Groups
    WHERE
        Groups.GroupName = :GroupName
);