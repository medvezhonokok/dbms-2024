SELECT
    AVG(Mark) AS average_mark
FROM
    Students
    NATURAL JOIN Plan
    NATURAL JOIN Marks
    NATURAL JOIN Courses
    NATURAL JOIN Groups
    JOIN Faculties ON Faculties.FacultyId = Groups.GroupFacultyId
WHERE
    Faculties.FacultyName = :FacultyName
    AND Courses.CourseName = :CourseName;