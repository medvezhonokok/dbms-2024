-- ������ �� primary key ������� Lecturers.
-- 5.2.5
-- 5.3.4
-- 5.5.4
create unique index lid_index on Lecturers using hash(LecturerId);

-- ����������� ������ �� ������� ���� ������� Lecturers. ����� �� ����� �������������.
-- 5.2.5
-- 5.3.4
-- 5.5.4
create unique index lname_lid_index on Lecturers using btree(LecturerName, LecturerId);

-- ������ �� ������� ���� ������� Lecturers ��� Faculties.FacultyId.
-- 5.5.3
-- 5.5.4
create index fk_lfid_index on Lecturers using hash(LecturerFacultyId);