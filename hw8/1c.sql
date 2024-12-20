-- Индекс на primary key таблицы Courses.
-- 5.3.1
-- 5.4.1
-- 5.4.4
create unique index cid_index on Courses using hash(CourseId);

-- Покрывающий индекс на внешний ключ таблицы Courses. Поиск по названию курса
-- 5.3.1
-- 5.4.1
-- 5.4.4
create unique index cname_cid_index on Courses using btree(CourseName, CourseId);