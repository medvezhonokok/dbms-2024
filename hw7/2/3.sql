DELETE
FROM
    Students
WHERE
    StudentId IN(
    SELECT
        StudentId
    FROM
        Students s
    JOIN Groups g ON
        s.GroupId = g.GroupId
    JOIN Faculties f ON
        g.GroupFacultyId = f.FacultyId
    WHERE
        f.FacultyName = :FacultyName AND(
        SELECT
            COUNT(DISTINCT CourseId)
        FROM
            Plan p
        WHERE
            p.GroupId = s.GroupId AND p.CourseId NOT IN(
            SELECT
                CourseId
            FROM
                Marks
            WHERE
                Marks.StudentId = s.StudentId
        )
    ) >= 2
);