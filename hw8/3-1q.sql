-- ����� ��� ������, ������� ����������� ���������� �� :FacultyName

select *
from Groups
join Faculties on Faculties.FacultyId = Groups.GroupFacultyId
where Faculties.FacultyName = :FacultyName