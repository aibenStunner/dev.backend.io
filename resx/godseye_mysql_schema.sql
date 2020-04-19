CREATE DATABASE  IF NOT EXISTS godseye_db
USE godseye_db;


-- Table structure for table class

DROP TABLE IF EXISTS class;
CREATE TABLE class (
  classId int NOT NULL AUTO_INCREMENT,
  className varchar(100) NOT NULL,
  classSize int NOT NULL,
  PRIMARY KEY (classId)
)


-- Table structure for table parent

DROP TABLE IF EXISTS parent;
CREATE TABLE parent (
  parentId int NOT NULL AUTO_INCREMENT,
  username varchar(100) NOT NULL,
  firstName varchar(100) NOT NULL,
  lastName varchar(100) NOT NULL,
  password varchar(100) NOT NULL,
  numberOfAvailableChildren int NOT NULL,
  email varchar(100) NOT NULL,
  PRIMARY KEY (parentId)
)


-- Table structure for table teacher

DROP TABLE IF EXISTS teacher;
CREATE TABLE teacher (
  teacherId int NOT NULL,
  teacherAge int NOT NULL,
  firstName varchar(100) NOT NULL,
  lastName varchar(100) NOT NULL,
  classId int NOT NULL,
  PRIMARY KEY (teacherId),
  KEY RefClass4 (classId)
)


-- Table structure for table ward

DROP TABLE IF EXISTS ward;
CREATE TABLE ward (
  wardId int NOT NULL AUTO_INCREMENT,
  wardAge int NOT NULL,
  wardName varchar(100) NOT NULL,
  parentId int NOT NULL,
  classId int NOT NULL,
  teacherId int NOT NULL,
  PRIMARY KEY (wardId),
  KEY RefParent1 (parentId),
  KEY RefClass2 (classId),
  KEY RefTeacher3 (teacherId)
)

-- Table structure for table camera

DROP TABLE IF EXISTS camera;
CREATE TABLE camera (
  cameraId int NOT NULL AUTO_INCREMENT,
  cameraDomain varchar(100) NOT NULL,
  cameraLocation varchar(100),
  PRIMARY KEY (cameraId)
)