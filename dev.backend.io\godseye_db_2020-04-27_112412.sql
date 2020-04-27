/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: camera
# ------------------------------------------------------------

DROP TABLE IF EXISTS `camera`;
CREATE TABLE `camera` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `camera_name` varchar(100) NOT NULL,
  `camera_link` varchar(100) DEFAULT NULL,
  `camera_password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `camera_name` (`camera_name`),
  UNIQUE KEY `camera_link` (`camera_link`)
) AUTO_INCREMENT = 2;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: class
# ------------------------------------------------------------

DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `classId` int(11) NOT NULL AUTO_INCREMENT,
  `className` varchar(100) NOT NULL,
  `classSize` int(11) NOT NULL,
  PRIMARY KEY (`classId`)
);

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: parent
# ------------------------------------------------------------

DROP TABLE IF EXISTS `parent`;
CREATE TABLE `parent` (
  `parentId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `numberOfAvailableChildren` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`parentId`)
) AUTO_INCREMENT = 8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) unsigned NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
);

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: teacher
# ------------------------------------------------------------

DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `teacherId` int(11) NOT NULL,
  `teacherAge` int(11) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `classId` int(11) NOT NULL,
  PRIMARY KEY (`teacherId`),
  KEY `RefClass4` (`classId`)
);

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: ward
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ward`;
CREATE TABLE `ward` (
  `wardId` int(11) NOT NULL AUTO_INCREMENT,
  `wardAge` int(11) NOT NULL,
  `wardName` varchar(100) NOT NULL,
  `parentId` int(11) NOT NULL,
  `classId` int(11) NOT NULL,
  `teacherId` int(11) NOT NULL,
  PRIMARY KEY (`wardId`),
  KEY `RefParent1` (`parentId`),
  KEY `RefClass2` (`classId`),
  KEY `RefTeacher3` (`teacherId`)
);

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: Parent Info
# ------------------------------------------------------------

CREATE OR REPLACE VIEW `Parent Info` AS (
  select
  `parent`.`parentId` AS `parentId`,
  `parent`.`username` AS `username`,
  `parent`.`firstName` AS `firstName`,
  `parent`.`lastName` AS `lastName`,
  `parent`.`password` AS `password`,
  `parent`.`numberOfAvailableChildren` AS `numberOfAvailableChildren`,
  `parent`.`email` AS `email`
  from
  `parent`
);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: camera
# ------------------------------------------------------------

INSERT INTO
  `camera` (
    `id`,
    `camera_name`,
    `camera_link`,
    `camera_password`
  )
VALUES
  (
    1,
    'Mum\'s phone',
    '192.168.43.1:8080/video',
    '00000000'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: class
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: parent
# ------------------------------------------------------------

INSERT INTO
  `parent` (
    `parentId`,
    `username`,
    `firstName`,
    `lastName`,
    `password`,
    `numberOfAvailableChildren`,
    `email`
  )
VALUES
  (
    7,
    'knotuteye',
    'Kevin',
    'Otuteye',
    '$2b$10$fxTfk6xhZjt0VDCqZe4nbuURWfUd0FP2Mk5I.ftYt1b.mTBnIQwlm',
    5,
    'kevinotuteye@gmail.com'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: sessions
# ------------------------------------------------------------

INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '-8k-OMzMf38AwNa-oJruVYOVZLMXxe_h',
    1587741146,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '-FTJX_c52fP1pPnexXY9s3dlJJaiJ1C4',
    1587741635,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '-TPPpZkH9VjwwklhEyjMMzK-Ew6J7q4O',
    1587753920,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '-ZZX0H8XbP35G3S7UfzTk6k3qnJtPGQQ',
    1587742191,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '-t-mgYWXBu9DP-DV0kEX0oiGHOvR92aR',
    1587753216,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '-uGoYp_VAm9sjOwC-o_hgzccjDP4wrLQ',
    1587741361,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '-vdnzf1BgRQpjUN5uTko9LU6DEbjO8BV',
    1587742229,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '18-choGzlTPrAxGA1IkUTgnxvrqYJVaR',
    1587742232,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '1oifQHNOCp7cVY8WJAm0vGXSG8YUFoX7',
    1587755691,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"domain\":\"localhost\",\"path\":\"/\",\"sameSite\":\"strict\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '1tIFIIQzou-E2G1aQe1X8B3hB19a0RV_',
    1587743647,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '23xPL3W6unda1uPbeIqkDNOGNlZydml1',
    1587742821,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '2FLiosC5uKT6_vaxJrWCryX0QtC0Oq6A',
    1587755992,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"domain\":\"http://localhost:5000\",\"path\":\"/\",\"sameSite\":\"strict\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '2SVx3W1rI36ZxWo9FS3yk-Bfy-tCi5NY',
    1587753259,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '3-sWEuy3-iO40ubq4xHKgB6isdMAxXTO',
    1587742230,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '39ufKqJwo4JKHEWcWVV-fpTkT3kcwOzy',
    1587760231,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '3sHVu47k85i0uVl1w3GllRui5Hop88A9',
    1587743843,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '3xjUR15ZG1sjzZ6seuRbLk7ERhnLPaAR',
    1587755990,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"domain\":\"http://localhost:5000\",\"path\":\"/\",\"sameSite\":\"strict\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '4-1Nt_bnv3Fmp4QFUG7_8VQvOkIcE_rJ',
    1587815775,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":[{\"id\":\"mumsphone\",\"link\":\"http://192.168.43.1:8080/video\"},{\"id\":\"golfcam\",\"link\":\"http://wmccpinetop.axiscam.net/mjpg/video.mjpg\"}]}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '4L35VKUWNh0PQ3frGfwunY1HkznTw7oW',
    1587742188,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '4Ul2kzWPAgb5h4f4TZkgHpe8vPJJuASf',
    1587742190,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '4YLWAx1UTZfejqw1E9trfkCR4IYdVbW3',
    1587742398,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '4na9ZcRpXF-puBmfEVgY7Q5ISESWVyX_',
    1587742186,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '51_MivWGKj8u3Jrc8rbaEdb3ZJWCM_w3',
    1587742191,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '5QtEubuf7KLNfhiZhDvwFGDRmBMgXaPu',
    1587755015,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"strict\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '5UPFkVoPthCCQAlBqzSnf9RH6U_r04UQ',
    1587755398,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"domain\":\"localhost\",\"path\":\"/\",\"sameSite\":\"none\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '5WYqoiUV5b9I2rfbPlWo-xI7X91-EI73',
    1587742191,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '5uaIM8rRzN2FhY4LPOhqiSe7EEwLU4f8',
    1587742189,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '64qS4c6l4_6dgvtZXNoeXM8fuUwjNrpG',
    1587741943,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '6AoRMhnoIv34U66gX3imwsIl-9zotNuF',
    1587753503,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '6gXeRQSRV82A-uY0kfMNq8df8UpLJJo9',
    1587743646,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '6lupMogj7Ii34vfRjmzj2FtG-zwIxLhj',
    1587741971,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '798EVmrRyi54fZTe-7h4ce6WZK60cSH7',
    1587753923,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '7ZCfoHuf6EAV4Wg2Qtdo_Mrp21IfczJE',
    1587756000,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"domain\":\"http://localhost:5000\",\"path\":\"/\",\"sameSite\":\"strict\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '7bDlNWIa7cCMtmU2azbcZ4G-FMftBkc8',
    1587754757,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '7dOPeg6Sxk1VklJ0qKtjZavPn7nVLkJd',
    1587753214,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '7e34dlPWHq2lAfP4onD-7lU1SBDDs7n-',
    1587754733,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '85u2dLLhxATBBmFO772e0kNmDiF4PVYv',
    1587742311,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '8MlbehQaFF4Zgnc3UaCJZZJAY8G_u8Uz',
    1587742230,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '8PqOhUImAS-lhHbhpNy_BSLFlIvEp52R',
    1587752302,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '90VYhj7URfV6OHfV8qAsGwA5t3Vhdz1d',
    1587742839,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '93s_Bj3T1wgjabnaTz3BV4CgPHby24A2',
    1587755918,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"domain\":\"localhost/:5000\",\"path\":\"/\",\"sameSite\":\"strict\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '97tQSu8Eb3BKfDZGgy8CV5fYGcEQTQs3',
    1587741233,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '98kWJ2RFtWiroAmUs-yTtgpZxWsytl8L',
    1587741930,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '9DClSybMCcX9pDh8bGAKRMPY54JgV_in',
    1587742842,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '9WlkbHw2oQZpiArAKnDaFpfKBWQ6LRj9',
    1587756913,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'A-bDnaqNgFjLXMOhl-x0uOYCBLs6KDeZ',
    1587743638,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'ANokClu6gGvDAJ_E77lfUVzN40RZt5ZF',
    1587741926,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'AXnGBaauOmbj_uGC6vsW3udO07VVQKkx',
    1587741706,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'Ajt7uHaYQG_MgzAu7Qe0jXo9XhvAlfC4',
    1587753716,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'AyqF4PDMSBdA7czno7xAHRWAxZOInk94',
    1587753260,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'B0ESV79YHNl4LHcpfQrv-eZlD340_NkJ',
    1587743520,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'BtV84QwI4Ama4RDnpm9GR7sY0ZjQgNs2',
    1587754982,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'CH3T3m5CLBP9nx2SCJTMx7mrDP9zwpAh',
    1587753717,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'ChpcExLRPpv7cmx7SVMYDzxNCjf3d1Lj',
    1587760377,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":[{\"id\":\"mumsphone\",\"link\":\"http://192.168.43.1:8080/video\"},{\"id\":\"golfcam\",\"link\":\"http://wmccpinetop.axiscam.net/mjpg/video.mjpg\"}]}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'Cj1dKjZCfS395FdBcMlBXtQKPhiltwTc',
    1587742228,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'CwSUyPDB5aB91PM0kjJ1UzCnBGPDQOwr',
    1587742452,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'DY8dWgYMWqiR12NwDK_xkcvX5JYyXrWN',
    1587753553,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'D_cY69ZYMk74yHXeUu1x-P9Z9dcTCEPB',
    1587743210,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'DeYMOz4Mxm7tlFE5JDSNbP5Ec41lNn0H',
    1587753709,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'Dh_8vq5gp8YQAitX6RC1eOedrQw8VQyy',
    1587743527,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'DwBVFlxKQB6l_xbzggLCxFytvqYGojeD',
    1587740820,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'EDyO8OXbfgKIIry7EG6Vmhzxp2_miLD0',
    1587754735,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'EEl_IxSap3ZmeB_oZ2A3EjhxDS_SEv7a',
    1587754726,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'Ec3iGuVYva9fFAgnJBoRllyKDwVFbcPH',
    1587756173,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"domain\":\"http://localhost:5000\",\"path\":\"/\",\"sameSite\":\"none\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'Ez8LEGL7YqFXpX_TuhyOxfcaBXP5oOKz',
    1587743636,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'F0A_ZmIXqpXzsRVhfqzw5_i4AVPf7OIO',
    1587812604,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":[{\"id\":\"mumsphone\",\"link\":\"http://192.168.43.1:8080/video\"},{\"id\":\"golfcam\",\"link\":\"http://wmccpinetop.axiscam.net/mjpg/video.mjpg\"}]}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'FX0Icvy5i21JjA3HlP-RFjCMSCUeE0VI',
    1587756058,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"domain\":\"http://localhost:5000\",\"path\":\"/\",\"sameSite\":\"lax\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'FXi_MjI29PKrRjOZRxPzDiVtrgysFjHo',
    1587753715,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'F_7J5IKvnMCHy6QPdnhv4JYCAXb-W6EI',
    1587752238,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'FsMW9ImZKo5hg9dFvz8lz0OHE-yPmxAY',
    1587753552,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'G8L_Gfrwykcpob2t85PD4OyyWI8yTZwh',
    1587743768,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'GPO8US-28rxA0TPn7nhHGg7reEY-vAJY',
    1587742190,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'Gak-3ZyDM7CZ8HYJ8d_OO4vQ4kDMWYO3',
    1587742461,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'HAN_D9JRwgLANmJxWXH9zxkDzdyP_z1X',
    1587741425,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'HTm5bqFNuA50NaRdFqjadUMy1DuAFBFg',
    1587743639,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'IF30wcEyeQP0D6gS1ZeHpwEDNh4pLoXb',
    1587743638,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'IKPMavx-DgJvMm-pWsUqSQdrNXp94TGm',
    1587742230,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'IgYgsGYZGrf8q-4CCCC55mvqzveF6c3U',
    1587742837,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'IuigJbxkCOQUW2CN6KbF6E0dHCZBTNoj',
    1587743639,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'JDhlCNXTC8r5wNGUQPLcz0gB3B00D1qs',
    1587753215,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'JYz_aAr9LEDNH9bTyJ9aAKbDenSMTG-O',
    1587743638,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'JsiVW7RveBrg3_qNb-9sSVGXIRlE5Jbn',
    1587754738,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'K3sVDxeQkKIL-h2iAB7RKdNptaYDhDGe',
    1587752331,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'KD-NLjEkxGu8KsI41IcMxmUHgKR_D4lg',
    1587742231,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'KIr9O0yRdYKH3Zx420ayBiRNlfJqBzWy',
    1587742824,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'KVpybK5abOWXgkS_x5_8yfEPJ5c6BCnc',
    1587754739,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'KmjcuSHVWcZE8bMDj_BeijWyPehZr0Dc',
    1587756052,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"domain\":\"http://localhost:5000\",\"path\":\"/\",\"sameSite\":\"lax\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'KrQa508Q9Tl6nM2KViSxVpK9QUGK2CrK',
    1587741296,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'LCNZRghD0Jy-2Ovqf_tlqz9V4Y7pyBqg',
    1587742189,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'LDZIc0-xmM-JVnBWKfc9gaYvBJ2HPgGi',
    1587742229,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'LMF7OnFA2SnWetZIjtOpwaoqTBwSaGk2',
    1587756174,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"domain\":\"http://localhost:5000\",\"path\":\"/\",\"sameSite\":\"none\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'LPySIk8mTWHXbCRflwyvL4My0j535Q53',
    1587741968,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'Lak9uuk1loBRwILcSzFIA1ugB6ELkzFw',
    1587754740,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'MBeGi52txMVtoiyDI8kmtG-IrSG-FTvN',
    1587742231,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'MNpKj1I_j1UuoMl3kuXs9rgakB3s1qRG',
    1587770929,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":[{\"id\":\"mumsphone\",\"link\":\"http://192.168.43.1:8080/video\"},{\"id\":\"golfcam\",\"link\":\"http://wmccpinetop.axiscam.net/mjpg/video.mjpg\"}]}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'MY7p-FgtZDZAfeErGuOWnIiQmBDOfDwW',
    1587741422,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'Mh8AYB8ntYznWXUkW5l9z385BH_PcBai',
    1587754735,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'MujC_4U9s6wcD8EZ5mKaIEpPvXqH4c_Z',
    1587742191,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'MyEkWLiwp-JNdEnnfHagRf1NpUdvjLPv',
    1587752567,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'NOsXpTLb5H49a24MxcKShjzKk9bnYDBa',
    1587743638,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'NiXQMxOz7fznagwIHWVySNdTv16LkqtN',
    1587805275,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":[{\"id\":\"mumsphone\",\"link\":\"http://192.168.43.1:8080/video\"},{\"id\":\"golfcam\",\"link\":\"http://wmccpinetop.axiscam.net/mjpg/video.mjpg\"}]}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'Nk9kkKbcvp45zoi3RzRVXrq-Hfe6ypir',
    1587740822,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'NtVf6kRBstGru6Vn0244nFK7bs1eRPyQ',
    1587743637,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'OBXMONk6RTnkadwlRFpf7dZBJZ7UyDPQ',
    1587754428,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'OH_4OhWdaA-tjX9CX7bVxUy7o3l-k7An',
    1587743819,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'OLXvovX-P5RyLyKjr5IpYXdZJ59AUOzQ',
    1587753213,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'OpKz7aArdD9tiBhuAKKCqYPdNk5eiMrM',
    1587752325,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'OsSgLlBZE-HUHB9PYWoL09rh25auyS1X',
    1587742247,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'PCahdbCmmrOpMBKoKrIqnOjmKhfCbC6X',
    1587754730,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'PM41cWrGNGDyxWckIC4ZMprpniqau3-W',
    1587754737,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'PWcT-h8SCrL_yS5HEZXCLSHRkzf3f1JG',
    1587754781,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'PzJdZSqHddqdhSESEmD0KOAcpb3c2yjN',
    1587741927,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'QF1kLtxlcB2GNcPcu-Yf2piY2mz9XuPX',
    1587754695,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'QQceueDb_H4_NAso4dixLIfaOoSaytmK',
    1587756171,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"domain\":\"http://localhost:5000\",\"path\":\"/\",\"sameSite\":\"none\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'Qatib1M6x-n1mLq3ZOuCbJ4JF6-0YVjf',
    1587742188,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'QfeT9QrcGOtxN957_D3wIojLc8kWqOy7',
    1587742183,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'QuD3ltJUHq8PvTdJhfxXYLNXSN9niB1U',
    1587743811,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'Qx7bq1oQbnvevdzMvtExcc1r7D9JjI9A',
    1587755696,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"domain\":\"localhost\",\"path\":\"/\",\"sameSite\":\"strict\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'R0Dt0IYgllVCPK1ldFE4VCmamaNWDcUo',
    1587741252,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'RLDI9Y5vW09hkdu9SAKNvNwO7000AwRS',
    1587743647,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'RLlCwlk2jIuLr7FyQHEN7ItuEsplH8CQ',
    1587742478,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'RrETwCzMXc5WfENbwDIdh3CyrGE_MS5s',
    1587741925,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'RrQ52-r-HXzPG3KBJu5s4PXzdN8eD7rU',
    1587743326,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'SGdWSSsHaKztsqbv4ue6DKDXGNwXz2RX',
    1587752301,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'Skdc-XHrXH7SWkltYwfkfED44FdR_yNj',
    1587742466,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'T0iszzMYbXAmkNt8r2R3cvj1tRUKi3d2',
    1587742317,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'T2w-nm-rKw1WByhdsfYzEfwtETJ-s2-O',
    1587742230,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'TxIbMeieEiquMurro8xwDRCZ1CwQsfVE',
    1587742476,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'UPg9fZMyAB7Hr4kEZ2ImyKqwmsbnvN3I',
    1587805208,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":[{\"id\":\"mumsphone\",\"link\":\"http://192.168.43.1:8080/video\"},{\"id\":\"golfcam\",\"link\":\"http://wmccpinetop.axiscam.net/mjpg/video.mjpg\"}]}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'UXxbi3E74N7h0b2nc-paZ_wYZr-0JIhC',
    1587755701,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"domain\":\"localhost\",\"path\":\"/\",\"sameSite\":\"strict\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'UaW_jFdHe-gPwhaJPTFHle5ZCFHNxQzq',
    1587742405,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'Uyu0hEkEoKv1fFO8GXRBIq7ZjqYR9yAR',
    1587742232,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'V5Hz0TQBit47EJAYIOVfSjCbAGiXWQc7',
    1587755941,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"domain\":\"localhost/:5000\",\"path\":\"/\",\"sameSite\":\"strict\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'VGQnuJpnjlU1LXmFtu_7B2X1q2mlgNpz',
    1587754996,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'Veo95xVkYef_q_2CDe3pHFsX5-nc7Xt8',
    1587753710,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'VvkLwD4-2XijVgVBDgP5sGgvLhOEelc-',
    1587756153,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"domain\":\"http://localhost:5000\",\"path\":\"/\",\"sameSite\":\"lax\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'WNTQgoNMqjkGDDrKOHqVIPsPviahkWPK',
    1587742307,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'X7QSgk3CjWQ6e3GBhYb2WaFB27TrQTBJ',
    1587804109,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":[{\"id\":\"mumsphone\",\"link\":\"http://192.168.43.1:8080/video\"},{\"id\":\"golfcam\",\"link\":\"http://wmccpinetop.axiscam.net/mjpg/video.mjpg\"}]}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'XPfiFtldP-hcGOCqA933kcvqUeEhYFRK',
    1587752329,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'YHuL9_s9JisQVRqu-g7hlfqKxrHXzJA3',
    1587752311,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'YV0WWGGObjHIbNDUBZRRA2gYXfYRfKwv',
    1587743645,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'YehRKDktrosIVek9NGZLRm5BWJnFjtRo',
    1587742191,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'Ykdm8uZxIX3nluHEnrpoJnea2cTohiTQ',
    1587752324,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'YrXevQxajxZNzHEFWVIjLvtzbN5WRgHM',
    1587742232,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'ZMYIn_0Wq9574fGCsiuirdpyJUOY7dzc',
    1587753501,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'ZVG87Hfg-2taOpThGFhzY_9SIoe-CHhx',
    1587756736,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'ZdaDSse7OGd_Cp7nTFYZDxDpeZZHaC4r',
    1587741634,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '_4hZMEfAFA-6EosBWJGYM8uRkWDURXJ0',
    1587743639,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '_8OcAF3arQBmNaMKCTe-ecCjZbydZAJE',
    1587753260,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '_MCV3fBGzCsI499kQqAK-4pmA58ydnLd',
    1587742192,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '_UPg46u9fplZl2kvOA9RaSsQpZsum66M',
    1587742187,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '_d2Yw8l4v3O0iDgQ_mNEWuhrEG9boSZO',
    1587822246,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":[{\"id\":\"mumsphone\",\"link\":\"http://192.168.43.1:8080/video\"},{\"id\":\"golfcam\",\"link\":\"http://wmccpinetop.axiscam.net/mjpg/video.mjpg\"}]}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '_dwRUB63R0X-TCr7ySwETVftjf21y0KU',
    1587743529,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '_laPj1RVhk0lyh-G4A3QwL-9siRvjXd6',
    1587741923,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'a1HCXAbIMce73bS9Zkd8TD7gifGmN2cY',
    1587753716,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'a1aX8fHpKfx01HTaOCU1XRqoqSwSPRRP',
    1587743640,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'aBV1K6V67dXh37bjfHUA07uZSHl7GtWp',
    1587756055,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"domain\":\"http://localhost:5000\",\"path\":\"/\",\"sameSite\":\"lax\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'aI1xl6O1hoBgdPH2mQasmHHEqkVFH9we',
    1587743641,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'aX5CW497Gm5q1fekT6mJmhZfdlK7aoMh',
    1587743208,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'aZT7mj1JAZVzrMASjnVDDKWqlArpHBDx',
    1587743644,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'acBWtOU_vTp0he0UHR94u8NKQhFyxbP1',
    1587743646,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'adT4A3MzhwDCUqIZu7Ps-QZiAL6aLN0a',
    1587742836,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'afAph_8j5Bw2E6YqPexVyiJgiWKG9ugw',
    1587752553,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'afdLMCsOmNMEgRzdi_wXcEmyUjCOXt1g',
    1587742192,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'as_mxdAxi9latX_hWYjNyV-BPItgKHOa',
    1587742184,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'bCdWlnPide-6xeI_YF0zstgCXFT179m-',
    1587743646,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'bL-agdx5crYUUInp-e8B7el_MLixk5JS',
    1587741421,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'bLT1uI2DPov4G5OUgQQ7ts_xfIhpirxX',
    1587756176,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"domain\":\"http://localhost:5000\",\"path\":\"/\",\"sameSite\":\"none\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'be9N2MKX97eb0Awj8kRn4pSu0TuQRvB4',
    1587742231,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'bg3B5CT_fC26DtRhWEDp5oT7kcj2x-2m',
    1587742191,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'bslcK04VvvHjkoAxCupgjdDqgJjQCWyV',
    1587743640,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'cIX_hMLimOQ7nik__gxrvyafolsd7UZt',
    1587754994,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'caEzQb2mw026kiKuHak5cDLV7vcD0UT3',
    1587754779,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'cnpqJEX89P3y4eKaMUIaAaA0OkLFJyFQ',
    1587743647,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'cwzecN-mdlQE4Gn8onXsl9J8KXnZsieF',
    1587742190,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'dW99-GKlx2da96hBtqzM0H5ma9sAMOiZ',
    1587743213,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'dZZL1HJyxtzh-CI6A_YEOcIlvj-LlfFu',
    1587756057,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"domain\":\"http://localhost:5000\",\"path\":\"/\",\"sameSite\":\"lax\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'db6l2zDPRsM16qp__wgW_JSfz_RCtZxt',
    1587753715,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'den6dhhkhwglvQeHReIpnp3GuGKdqOpg',
    1587754669,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'eBe7JuOeWw8ddIJij57xEgkd3wSgi5PM',
    1587743522,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'eqWguiUauYW0a8i33Y2W3k3qLZ-u1E8w',
    1587754732,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'ezR9-Hi5fSL6vGzsYCUO1VnFwItkbCNf',
    1587755693,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"domain\":\"localhost\",\"path\":\"/\",\"sameSite\":\"strict\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'fBi0yQiaXZFDbOJM6fyOxbxYArkGtlmW',
    1587743639,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'fDe-ufcVRBhac-4K6RS1tk5-hxajSmtZ',
    1587743206,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'fObRmZsllwY04NN0bs6iiQS2oBObeN9c',
    1587754984,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'fbCYbkaHhtykQDRC5vodedEWOtwD3hl8',
    1587753261,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'feTUa7r3dsKQQNJkEovzkyd2_pngshGg',
    1587743534,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'fm4jNI6WLLW7jDMdacn-F9X4OljrMBwn',
    1587742404,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'fv_kKXuxrBViLmO6czXFN238HT0ivS0m',
    1587756485,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'fyymLesrBkzgfFHkESCtANG0CekNELLm',
    1587742231,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'gcEN12GgZ4VGXKaMiGYKeot9ZxqkrrWq',
    1587752223,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'h1pYtqVCXvz31RnsFgFCPNDS7kQCR9Cp',
    1587743647,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'hS0bAZn_FeqEBlDdtcdxHLaZsqMt06ig',
    1587742402,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'hW63wdX4bf698-zgF4XFomcRtPONd09-',
    1587755948,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"domain\":\"localhost/:5000\",\"path\":\"/\",\"sameSite\":\"strict\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'hp-hRlR5G6ujVimukfik35wsiFX23k8z',
    1587743645,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'iGK88PPI4p-ZD9Mpu70Mlay-Q9q0v4eR',
    1587752565,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'iZVXDDCGbp0eO70MKICCV0NFDKLcbW9v',
    1587743640,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'ik1wM_HFFBp-llYHZMdnli0lCKZ8ugjK',
    1587755013,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"strict\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'ipKTNp5CFI6laWVY_W_QW-RJsJMz4Bcc',
    1587743204,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'ix4BTx1djAeNCGfbv1ktQqUrFLgEBljd',
    1587752313,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'j5oIigEdZ_vVOaYdUno3BNQ94wGd8-85',
    1587754784,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'jV1ZC8aQHTOYh2XEFFYikN07swnwY1cl',
    1587753718,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'k1RJpjkFqN39dK5NWJUDeol4nEAI6G5O',
    1587741938,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'kW05Eouhusp1Yip5ypfP57eqDzjbDLaA',
    1587743647,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'kaNP2wjQVx1qjUdRP02mhwSIXY3RQBkU',
    1587752244,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'kd7rZbv7OtqUQhb3C_-TgDeaFwNc4Pm_',
    1587742192,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'kkuOPsqAhVyoAh_bcuxfYKMjJGpqGTZ5',
    1587757008,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'l0hDxUWZMSD67XhdjVugPNJya927Ng1o',
    1587755689,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"domain\":\"localhost\",\"path\":\"/\",\"sameSite\":\"strict\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'l29jAWsl4-jRnyh5Mv08z4H8mpVT1axo',
    1587742190,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'lIYRYshDtH9c0wx4pD59F2xvk3stERto',
    1587742820,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'lzYPiiLGVHySGv60P7X4suGrU_V91dpS',
    1587739009,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'mSufUl2Wszq8_Dlu0_jIBd7rSvjU-kRJ',
    1587742189,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'masbyChL07g_Y4AlJGOTWKRmXyy_QgWL',
    1587752330,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'mfTWsdRHqTXpcKaIQyBFVUvQ5JbpTh4a',
    1587755016,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"strict\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'mh1jQZ9DlODqBSVU8zSeToC40nVZIbOa',
    1587740398,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'mi8lxH30gP322hU-UIeu8Kysk5oNF9qK',
    1587742310,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'ml-r284kTLtTZX2SvZyjLORssUD7NwtZ',
    1587753215,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'nP5oZ_kqzPIsafcdUi5YqYO2QWFuiCmU',
    1587742189,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'nTJ0s2tI18spdAx4VRp-p1VqObokYRwk',
    1587743645,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'nlu1s-ccNCUbHEEBaNjHlNTv_IYa5rD0',
    1587743525,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'ntoZl4cvsa00zmycAHcLoY-cDHRsJnNn',
    1587743809,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'oKhIFIH_-otlEfCvKKF7itGnfnSlha17',
    1587743644,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'pKQ2U5I3HhJ2DmOmqPlI3LWtyytr2E0l',
    1587742309,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'pLywrpM4RozEWja4deqIp-8-EbcsiPGY',
    1587742229,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'psXpHAa0zaDO70genrpJjMYciI_nea-e',
    1588072882,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":[{\"id\":\"mumsphone\",\"link\":\"http://192.168.43.1:8080/video\"},{\"id\":\"golfcam\",\"link\":\"http://wmccpinetop.axiscam.net/mjpg/video.mjpg\"}]}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'q9EeNjSFHevA6kpU31SsX0V3xd_YRpZF',
    1587743646,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'q9ozoYF4mx7eN8t7ycaNc6SKdBWx_RUc',
    1587743772,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'qm6mGB8E2B-BttQoKxw8A7eYVrJN6yGz',
    1587742190,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'r4HLOBjK9II8CnLrT-wSy_SnzTG-IwvY',
    1587812462,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":[{\"id\":\"mumsphone\",\"link\":\"http://192.168.43.1:8080/video\"},{\"id\":\"golfcam\",\"link\":\"http://wmccpinetop.axiscam.net/mjpg/video.mjpg\"}]}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'rI2fJ7NC0awgb4ScOpt4wIfprz20GooY',
    1587753211,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'roT_mRn0o11mr3o40bSOGgB_8S70hVgJ',
    1587754425,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'sQOQF4u9i8hNltkN27XLlZP0Xx3GjrnR',
    1587753214,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'stbNfE9CsMnYR4-Opwp3rwJW0UGwILB6',
    1587755694,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"domain\":\"localhost\",\"path\":\"/\",\"sameSite\":\"strict\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'tKJrdhGBKJItCiSaIgUlN-cXXK5fsCEr',
    1587755921,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"domain\":\"localhost/:5000\",\"path\":\"/\",\"sameSite\":\"strict\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'tOfc9PNEgJTI7SPys64C491wSjBgsrzB',
    1587753258,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'u3XejNh5raO0xIqA98KgV-FIB6G7R_FU',
    1587753709,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'ufpn8vw7Ape4gnr_8l_1dMynmZYzY9aA',
    1587754734,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'usabxrpuzjII5EF8me2jKz0WjO6U8MSR',
    1587754750,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'uxS4AJFzyN_cElRXbYsyKL_BCPF9J2zB',
    1587742192,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'v-m_Qw_k00l_JsnOI9jAAkUTOkurk8kS',
    1587754778,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'v6X-gNlXohXhxCVe84YmYsGeUfcT6sBj',
    1587743645,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'vCZujqYOkjFE3M1BVvTdDO_hTylBosir',
    1587754432,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'w8qKwji3_pBY-9ZNqwsB15k_GKHiKpp2',
    1587743636,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'wGmV7sTT5VaPTyjLMvMWMRITLvigo7wX',
    1587741944,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'wIrVYaC9BD8LReOhDBaD6mg4ckfFm6BO',
    1587754436,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'wfKLRy6mJAW1FBm1K1LO0M0_cZZRUZv2',
    1587742462,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'wiuDRNDHkvn8h1Egmtjh7Ibly1iTiPM5',
    1587756169,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"domain\":\"http://localhost:5000\",\"path\":\"/\",\"sameSite\":\"none\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'xBEzSXREyqSjF8e7dDKkPLxtNe05ZPpL',
    1587756177,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"domain\":\"localhost\",\"path\":\"/\",\"sameSite\":\"strict\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'xCLxx-M-n-S_ocP44MSOI9GiY6OvQjVF',
    1587742259,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'xRCI7sASTTgQaYKoof0DN9gX4nJxkWTz',
    1587741964,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'xWei8yUzeohudEsmbpSrCwNOjjT2cwmw',
    1587755929,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"domain\":\"localhost/:5000\",\"path\":\"/\",\"sameSite\":\"strict\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'xX1I6Kawx057vhd18aJVuUapZsfPAMah',
    1587757114,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'xfEsWzKhqYQspGC96IKTdRxO_zC6ldwa',
    1587742227,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'xpxRysVJc33gO0ZxohhV0Ed7-Zeh3cqk',
    1587755685,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"domain\":\"localhost\",\"path\":\"/\",\"sameSite\":\"strict\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'yWizRWuTylqNvYoZktfrYXV_b7mUEJke',
    1587754455,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'yjkaIG44PE9Bwc6NpoOgV6yn_o5Utt7W',
    1587741254,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'ytrb7ga1ftyFp9UpgC7RHQopXaKqWZKy',
    1587753706,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'zDZPjbXzbYigeX5K7V47eZZNXzM37E0B',
    1587742454,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'zGJ2Ujk6euNpcJxhr7uSNSrVr9sVY0mJ',
    1587741945,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'zNnBBHsnrX10f4ieCD9-x8iw8ReFhtHM',
    1587754798,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'zcRgkLjpCayK26JoHKDWbKQs9Mzoxf71',
    1587741965,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'zgJde8V8JwrlVrPugPbzVAf4tu-Ikq7s',
    1587743820,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'zk7XKKHXNtYomkZk1sWSgDmvEyUzEt88',
    1587742401,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"userId\":7,\"username\":\"knotuteye\",\"cameras\":{\"testcam\":{\"id\":\"test001\",\"link\":\"http://192.168.43.1:8080/video\"}}}'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: teacher
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: ward
# ------------------------------------------------------------


/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
