SELECT
    StudentId,
    StudentName,
    GroupName
FROM
    Students,
    Groups
WHERE
    Students.GroupId = Groups.GroupId AND Students.StudentId NOT IN(
    SELECT
        StudentId
    FROM
        Marks
    WHERE
        Marks.CourseId = :CourseId
) AND Students.GroupId IN(
    SELECT
        GroupId
    FROM
        Plan
    WHERE
        Plan.CourseId = :CourseId
);