-- ������ �� primary key ������� Students.
-- 5.1.1
-- 5.2.1
-- 6.1.1
create unique index sid_index on Students using hash(StudentId);

-- ������ �� ������� ���� ������� Students. ����� �� ����� ��������
-- 5.2.1
-- 5.2.2
-- 6.1.1
create index sname_sid_index on Students using btree(StudentName, StudentId);

-- ������ �� ������� ���� (GroupId ��� Groups).
-- 5.2.3
-- 5.7.1
-- 7.1.1
create index fk_sgid_index on Students using hash(GroupId);