-- Индекс на primary key таблицы Groups 
-- 5.2.3
-- 5.7.1
-- 7.1.1
create unique index gid_index on Groups using hash (GroupId);

-- Покрывающий индекс для поиска по названию группы (GroupName).
-- 5.2.3
-- 5.7.2
-- 6.1.2
create unique index gid_gname_index on Groups using btree(GroupName, GroupId);

-- Индекс на внешний ключ (GroupFacultyId для Faculties - FacultyId) .
-- 5.2.4
-- 5.4.3
-- 5.5.5
create index fk_gfid_index on Groups using hash(GroupFacultyId);