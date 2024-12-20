INSERT INTO `Faculties`(`FacultyId`, `FacultyName`) VALUES 
('1','������������ ����������'), ('2', '�������������� �������');

INSERT INTO `Groups`(`GroupId`, `GroupName`, `FacultyId`) VALUES 
('1','M3435','1'), ('2','M3439','1');

INSERT INTO `Students`(`StudentId`, `FirstName`, `LastName`, `PasswordSha`, `GroupId`) VALUES 
('1','������','���','sdalkjglfd21321dsajlkqwnczx','2'), ('2','�������','������','12sdalkjglfd21321dsajlkqwnczx','1'),('3','����','��������','32sdalkjglfd21321dsajlkqwnczx','2');

INSERT INTO `Teachers`(`TeacherId`, `FirstName`, `LastName`, `PasswordSha`) VALUES ('1','�������','�������','sdalkjglfd21321dsajlkqwnczx1'), ('2','������','���������','12sdalkjglfd21321dsajlkqwnczx'),('3','������','���������','32sdalkjglfd21321dsajlkqwnczx');

INSERT INTO `Subjects`(`SubjectId`, `SubjectName`, `TeacherId`) VALUES
('1','���������� ����������','2'),
('2','���� ������','1'),
('3','Web-����������������','3');

INSERT INTO `Grades`(`Grade`, `SubjectId`, `StudentId`) VALUES
('4','1','1'),
('3','3','1'),
('5','2','2');

INSERT INTO `GroupSubject`(`SubjectId`, `GroupId`) VALUES 
('1','1'), 
('2','2'), 
('3','1'), 
('2','1');