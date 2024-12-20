SELECT
    Students.StudentId
FROM
    Students
WHERE
    Students.StudentId NOT IN(
    SELECT DISTINCT
        Students.StudentId
    FROM
        Students,
        Lecturers,
        Plan,
        Marks
    WHERE
        Lecturers.LecturerId = Plan.LecturerId AND Plan.CourseId = Marks.CourseId AND Plan.GroupId = Students.GroupId AND Marks.StudentId = Students.StudentId AND Lecturers.LecturerName = :LecturerName
);