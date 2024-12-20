SELECT
    StudentName,
    CourseName
FROM
    Students,
    Courses
WHERE
    StudentId IN(
    SELECT
        StudentId
    FROM
        Students,
        Plan
    WHERE
        Students.GroupId = Plan.GroupId AND Plan.CourseId = Courses.CourseId
    UNION
	SELECT
    	StudentId
	FROM
    	Marks
	WHERE 
		Marks.CourseId = Courses.CourseId
);