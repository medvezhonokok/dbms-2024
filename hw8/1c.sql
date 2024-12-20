-- ������ �� primary key ������� Courses.
-- 5.3.1
-- 5.4.1
-- 5.4.4
create unique index cid_index on Courses using hash(CourseId);

-- ����������� ������ �� ������� ���� ������� Courses. ����� �� �������� �����
-- 5.3.1
-- 5.4.1
-- 5.4.4
create unique index cname_cid_index on Courses using btree(CourseName, CourseId);