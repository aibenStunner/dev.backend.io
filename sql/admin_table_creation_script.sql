CREATE TABLE `admin` (
  `admin` int(11) NOT NULL,
  `adminFirstName` varchar(100) NOT NULL,
  `adminLastName` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `adminEmail` varchar(100) NOT NULL,
  `adminPhoneNumber` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`admin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
