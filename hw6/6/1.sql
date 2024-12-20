SELECT
    GroupId,
    CourseId
FROM
    Groups,
    Courses
WHERE NOT EXISTS
(
	SELECT
        GroupId
    FROM
        Students
    WHERE
        Students.GroupId = Groups.GroupId AND NOT EXISTS(
        SELECT
            CourseId
        FROM
            Marks
        WHERE
            Marks.StudentId = Students.StudentId and Marks.CourseId = Courses.CourseId
    )
);