-- количество студентов группы (по :GroupName)

SELECT count(*)
FROM Students
NATURAL JOIN Groups
WHERE Groups.GroupName = :GroupName