SELECT
    StudentName,
    CourseName
FROM
    Students,
    Groups,
    Courses,
    Lecturers,
    Plan
WHERE
    Lecturers.LecturerFacultyId = Groups.GroupFacultyId AND Lecturers.LecturerId = Plan.LecturerId AND Plan.GroupId = Students.GroupId AND Groups.GroupId = Students.GroupId AND Courses.CourseId = Plan.CourseId;