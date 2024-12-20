-- Средний балл студентов конкретного курса (по :CourseName)

select avg(Mark)
from Marks
natural join Courses
where Courses.CourseName = :CourseName