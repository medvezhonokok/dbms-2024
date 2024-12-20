-- Индекс на primary key таблицы Faculties 
create unique index fid_index on Faculties using hash (FacultyId);

-- Покрывающий индекс для поиска по названию факультета (FacultyName).
-- 5.2.4
-- 5.5.5
-- 6.1.3
create unique index fname_fid_index on Faculties using btree (FacultyName, FacultyId);

-- Индекс на внешний ключ (DeanId).
-- Не unique, тк разные факультеты могут иметь одного и того же декана.
-- 5.2.5
-- 5.5.7
-- 6.2.3
create index fk_deadid_index on Faculties using hash (DeanId);