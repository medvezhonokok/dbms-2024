SELECT
    Students.StudentId,
    Students.StudentName,
    Students.GroupId
FROM
    Students
JOIN Groups ON Students.GroupId = Groups.GroupId
JOIN Faculties ON Faculties.FacultyId = Groups.GroupFacultyId
WHERE
    Faculties.FacultyName = :FacultyName

EXCEPT

SELECT
    Students.StudentId,
    Students.StudentName,
    Students.GroupId
FROM
    Students
JOIN Groups ON Students.GroupId = Groups.GroupId
JOIN Faculties ON Faculties.FacultyId = Groups.GroupFacultyId
JOIN Marks ON Students.StudentId = Marks.StudentId
JOIN Courses ON Marks.CourseId = Courses.CourseId
WHERE
    Faculties.FacultyName = :FacultyName
    AND Courses.CourseName = :CourseName;
