CREATE TABLE `Faculties` (
  `FacultyId` int(11) NOT NULL,
  `FacultyName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `Grades` (
  `Grade` int(11) NOT NULL,
  `SubjectId` int(11) NOT NULL,
  `StudentId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `Groups` (
  `GroupId` int(11) NOT NULL,
  `GroupName` varchar(10) NOT NULL,
  `FacultyId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `GroupSubject` (
  `SubjectId` int(11) NOT NULL,
  `GroupId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `Students` (
  `StudentId` int(11) NOT NULL,
  `FirstName` varchar(35) NOT NULL,
  `LastName` varchar(35) NOT NULL,
  `PasswordSha` varchar(55) NOT NULL,
  `GroupId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `Subjects` (
  `SubjectId` int(11) NOT NULL,
  `SubjectName` varchar(50) NOT NULL,
  `TeacherId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `Teachers` (
  `TeacherId` int(11) NOT NULL,
  `FirstName` varchar(35) NOT NULL,
  `LastName` varchar(35) NOT NULL,
  `PasswordSha` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE `Faculties`
  ADD PRIMARY KEY (`FacultyId`);

ALTER TABLE `Grades`
  ADD PRIMARY KEY (`SubjectId`,`StudentId`),
  ADD KEY `StudentId` (`StudentId`);

ALTER TABLE `Groups`
  ADD PRIMARY KEY (`GroupId`),
  ADD KEY `FacultyId` (`FacultyId`);

ALTER TABLE `GroupSubject`
  ADD PRIMARY KEY (`SubjectId`,`GroupId`),
  ADD KEY `GroupId` (`GroupId`);

ALTER TABLE `Students`
  ADD PRIMARY KEY (`StudentId`),
  ADD KEY `GroupId` (`GroupId`);

ALTER TABLE `Subjects`
  ADD PRIMARY KEY (`SubjectId`),
  ADD KEY `TeacherId` (`TeacherId`);

ALTER TABLE `Teachers`
  ADD PRIMARY KEY (`TeacherId`);

ALTER TABLE `Grades`
  ADD CONSTRAINT `Grades_ibfk_1` FOREIGN KEY (`SubjectId`) REFERENCES `Subjects` (`SubjectId`),
  ADD CONSTRAINT `Grades_ibfk_2` FOREIGN KEY (`StudentId`) REFERENCES `Students` (`StudentId`);

ALTER TABLE `Groups`
  ADD CONSTRAINT `Groups_ibfk_1` FOREIGN KEY (`FacultyId`) REFERENCES `Faculties` (`FacultyId`);

ALTER TABLE `GroupSubject`
  ADD CONSTRAINT `GroupSubject_ibfk_1` FOREIGN KEY (`SubjectId`) REFERENCES `Subjects` (`SubjectId`),
  ADD CONSTRAINT `GroupSubject_ibfk_2` FOREIGN KEY (`GroupId`) REFERENCES `Groups` (`GroupId`);

ALTER TABLE `Students`
  ADD CONSTRAINT `Students_ibfk_1` FOREIGN KEY (`GroupId`) REFERENCES `Groups` (`GroupId`);

ALTER TABLE `Subjects`
  ADD CONSTRAINT `Subjects_ibfk_1` FOREIGN KEY (`TeacherId`) REFERENCES `Teachers` (`TeacherId`);