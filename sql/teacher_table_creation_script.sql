CREATE TABLE `teacher` (
  `teacherId` int(11) NOT NULL AUTO_INCREMENT,
  `teacherAge` int(11) NOT NULL,
  `firstName` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lastName` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `classId` int(11) NOT NULL,
  `teacherEmail` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `teacherContact` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`teacherId`),
  KEY `RefClass4` (`classId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
