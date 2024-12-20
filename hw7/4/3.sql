UPDATE
    Students
SET
    Marks =(
    SELECT
        COUNT(Marks.Mark)
    FROM
        Marks
    WHERE
        Marks.StudentId = Students.StudentId
)
WHERE
    GroupId IN(
    SELECT
        GroupId
    FROM
        Groups
    JOIN Faculties ON Faculties.FacultyId = Groups.GroupFacultyId
    WHERE
        Faculties.FacultyName = :FacultyName
)