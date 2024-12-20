DELETE
FROM
    Students
WHERE
    Students.GroupId IN(
    SELECT
        GroupId
    FROM
        Groups
    WHERE
        Groups.GroupName = :GroupName
)