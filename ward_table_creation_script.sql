CREATE TABLE `ward` (
  `wardId` int(11) NOT NULL AUTO_INCREMENT,
  `wardAge` int(11) NOT NULL,
  `wardFirstName` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `wardLastName` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `parentId` int(11) NOT NULL,
  `classId` int(11) NOT NULL,
  PRIMARY KEY (`wardId`),
  KEY `RefParent1` (`parentId`),
  KEY `RefClass2` (`classId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
