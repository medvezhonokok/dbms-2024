SELECT StudentId
FROM Students
except select StudentId from Students
natural join Plan
natural join Marks
natural join Lecturers 
where Lecturers.LecturerName = :LecturerName;