INSERT INTO `Faculties`(`FacultyId`, `FacultyName`) VALUES 
('1','Компьютерные технологии'), ('2', 'Информационные системы');

INSERT INTO `Groups`(`GroupId`, `GroupName`, `FacultyId`) VALUES 
('1','M3435','1'), ('2','M3439','1');

INSERT INTO `Students`(`StudentId`, `FirstName`, `LastName`, `PasswordSha`, `GroupId`) VALUES 
('1','Михаил','Ким','sdalkjglfd21321dsajlkqwnczx','2'), ('2','Алексей','Иванов','12sdalkjglfd21321dsajlkqwnczx','1'),('3','Иван','Алексеев','32sdalkjglfd21321dsajlkqwnczx','2');

INSERT INTO `Teachers`(`TeacherId`, `FirstName`, `LastName`, `PasswordSha`) VALUES ('1','Георгий','Корнеев','sdalkjglfd21321dsajlkqwnczx1'), ('2','Андрей','Станкевич','12sdalkjglfd21321dsajlkqwnczx'),('3','Михаил','Мирзаянов','32sdalkjglfd21321dsajlkqwnczx');

INSERT INTO `Subjects`(`SubjectId`, `SubjectName`, `TeacherId`) VALUES
('1','Дискретная математика','2'),
('2','Базы данных','1'),
('3','Web-программирование','3');

INSERT INTO `Grades`(`Grade`, `SubjectId`, `StudentId`) VALUES
('4','1','1'),
('3','3','1'),
('5','2','2');

INSERT INTO `GroupSubject`(`SubjectId`, `GroupId`) VALUES 
('1','1'), 
('2','2'), 
('3','1'), 
('2','1');