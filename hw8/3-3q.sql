-- ���������� ��������� ������ (�� :GroupName)

SELECT count(*)
FROM Students
NATURAL JOIN Groups
WHERE Groups.GroupName = :GroupName