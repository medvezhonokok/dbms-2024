-- Поиск по названию/id группы, названию/id курса.
-- хотим связывать как Groups с Courses, так и Courses с Groups => двойной индекс
-- 5.3.1
-- 6.2.4
-- 6.2.5
create unique index cid_gid_index on Plan using btree (CourseId, GroupId);

-- 5.3.1
-- 6.4.1
-- 6.4.3
create unique index gid_cid_index on Plan using btree (GroupId, CourseId);

-- hash вместо btree, т.к. порядок не важен
-- 5.2.5
-- 5.3.4
-- 5.5.4
create index lid_index on Plan using hash (LecturerId);