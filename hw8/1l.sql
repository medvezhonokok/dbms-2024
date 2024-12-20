-- Индекс на primary key таблицы Lecturers.
-- 5.2.5
-- 5.3.4
-- 5.5.4
create unique index lid_index on Lecturers using hash(LecturerId);

-- Покрывающий индекс на внешний ключ таблицы Lecturers. Поиск по имени преподавателя.
-- 5.2.5
-- 5.3.4
-- 5.5.4
create unique index lname_lid_index on Lecturers using btree(LecturerName, LecturerId);

-- Индекс на внешний ключ таблицы Lecturers для Faculties.FacultyId.
-- 5.5.3
-- 5.5.4
create index fk_lfid_index on Lecturers using hash(LecturerFacultyId);