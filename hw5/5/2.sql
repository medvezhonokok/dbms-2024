select StudentName, CourseName 
from Students
natural join Plan
natural join Courses
left join Marks on Students.StudentId = Marks.StudentId
except StudentName, CourseName 
from Students
natural join Plan
natural join Courses
natural join Marks;	