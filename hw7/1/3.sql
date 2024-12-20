DELETE
FROM
    Students
WHERE
    Students.GroupId IN(
    SELECT
        GroupId
    FROM
        Faculties,
        Groups
    WHERE
        Groups.GroupFacultyId = Faculties.FacultyId AND Faculties.FacultyName = :FacultyName
)