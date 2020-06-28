CREATE TABLE `camera` (
  `cameraId` int(11) NOT NULL AUTO_INCREMENT,
  `camera_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `camera_link` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `camera_password` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`cameraId`),
  UNIQUE KEY `camera_name` (`camera_name`),
  UNIQUE KEY `camera_link` (`camera_link`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
