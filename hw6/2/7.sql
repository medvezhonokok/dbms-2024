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
        Marks,
        Courses
    WHERE
        Marks.CourseId = Courses.CourseId AND Courses.CourseName = :CourseName
) AND Students.GroupId IN(
    SELECT
        GroupId
    FROM
        Plan,
        Courses
    WHERE
        Plan.CourseId = Courses.CourseId AND Courses.CourseName = :CourseName
);