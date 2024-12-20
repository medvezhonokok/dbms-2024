SELECT StudentId
FROM Students
natural join Plan
natural join Marks
natural join Lecturers
where Lecturers.LecturerName = :LecturerName;