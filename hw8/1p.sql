-- ����� �� ��������/id ������, ��������/id �����.
-- ����� ��������� ��� Groups � Courses, ��� � Courses � Groups => ������� ������
-- 5.3.1
-- 6.2.4
-- 6.2.5
create unique index cid_gid_index on Plan using btree (CourseId, GroupId);

-- 5.3.1
-- 6.4.1
-- 6.4.3
create unique index gid_cid_index on Plan using btree (GroupId, CourseId);

-- hash ������ btree, �.�. ������� �� �����
-- 5.2.5
-- 5.3.4
-- 5.5.4
create index lid_index on Plan using hash (LecturerId);