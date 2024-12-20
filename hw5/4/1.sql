select StudentId, StudentName, GroupId from Students
    except 
        select StudentId, StudentName, GroupId from Students
            natural join Marks
            natural join Courses
            where Courses.CourseName = :CourseName;