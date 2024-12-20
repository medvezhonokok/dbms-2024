-- Индекс на внешний ключ для Students
-- 5.3.1
-- 5.3.2
-- 6.3.1
create unique index sid_cid_index on Marks using btree(StudentId, CourseId, Mark);

-- Индекс на внешний ключ для Courses
-- 5.4.1
-- 5.5.2
-- 5.5.3
create unique index cid_sid_index on Marks using btree(CourseId, StudentId, Mark);

-- 5.5.2
-- 5.5.3
-- 6.4.1
create index cid_index on Marks using hash (CourseId);