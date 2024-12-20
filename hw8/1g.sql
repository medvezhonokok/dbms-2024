-- ������ �� primary key ������� Groups 
-- 5.2.3
-- 5.7.1
-- 7.1.1
create unique index gid_index on Groups using hash (GroupId);

-- ����������� ������ ��� ������ �� �������� ������ (GroupName).
-- 5.2.3
-- 5.7.2
-- 6.1.2
create unique index gid_gname_index on Groups using btree(GroupName, GroupId);

-- ������ �� ������� ���� (GroupFacultyId ��� Faculties - FacultyId) .
-- 5.2.4
-- 5.4.3
-- 5.5.5
create index fk_gfid_index on Groups using hash(GroupFacultyId);