create index fname_index on Faculties using hash(FacultyName);

create index cname_index on Courses using hash(CourseName);

create index gfid_index ON Groups using hash(GroupFacultyId);

create index gid on Students using hash(GroupId); 

create index cid_sid on Marks using btree (CourseId, StudentId, Mark);

create index gid_cid_lid_index ON Plan (GroupId, CourseId, LecturerId);