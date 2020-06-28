CREATE TABLE `class` (
  `classId` int(11) NOT NULL AUTO_INCREMENT,
  `className` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `classSize` int(11) NOT NULL,
  `camera_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`classId`),
  KEY `cameraId_idx` (`camera_id`),
  CONSTRAINT `cameraId` FOREIGN KEY (`camera_id`) REFERENCES `camera` (`cameraId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
