-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dbproject
-- ------------------------------------------------------
-- Server version	9.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `usernames`
--

DROP TABLE IF EXISTS `usernames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usernames` (
  `UserName` varchar(50) NOT NULL,
  `UserID` int NOT NULL,
  `UserTypeID` int NOT NULL,
  `PasswordHash` varchar(255) NOT NULL,
  `SecuirtyQuestion1` varchar(255) DEFAULT NULL,
  `SecuirtyQuestion2` varchar(255) DEFAULT NULL,
  `SecuirtyQuestion3` varchar(255) DEFAULT NULL,
  `SecurityAnswer1` varchar(255) DEFAULT NULL,
  `SecurityAnswer2` varchar(255) DEFAULT NULL,
  `SecurityAnswer3` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`UserName`),
  UNIQUE KEY `UserName` (`UserName`),
  KEY `UserID` (`UserID`),
  KEY `UserTypeID` (`UserTypeID`),
  CONSTRAINT `usernames_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`),
  CONSTRAINT `usernames_ibfk_2` FOREIGN KEY (`UserTypeID`) REFERENCES `usertypes` (`UserTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usernames`
--

LOCK TABLES `usernames` WRITE;
/*!40000 ALTER TABLE `usernames` DISABLE KEYS */;
INSERT INTO `usernames` VALUES ('ConDoc',6,3,'doc1',NULL,NULL,NULL,NULL,NULL,NULL,'con@conmail.com'),('conman',6,4,'con',NULL,NULL,NULL,NULL,NULL,NULL,'con@conmail.com'),('ConNurse',6,1,'Nurse1',NULL,NULL,NULL,NULL,NULL,NULL,'nurse@gmail.com'),('ConStaff',6,5,'StaffC',NULL,NULL,NULL,NULL,NULL,NULL,'con@conmail.com'),('DanStaff',10,5,'Dan@',NULL,NULL,NULL,NULL,NULL,NULL,'Dan@DanMail.com'),('erin',7,1,'er4','What is your mother\'s maiden name?','What was the name of your first pet?','What was the name of your elementary school?','add','azul','barkstall','cstomp@uiowa.edu'),('ErinDoc',7,3,'DocMan',NULL,NULL,NULL,NULL,NULL,NULL,'erin@dogmail.com'),('howdy',6,1,'how','What is your mother\'s maiden name?','What was the name of your first pet?','What is your favorite color?','mom','medo','yellow','connorstomp@gmail.com'),('MaHiggens',1,2,'rah','yuh','what','dance','ham','dog','lobster','dance@hotmail.com'),('MaPhysician',1,3,'lol',NULL,NULL,NULL,NULL,NULL,NULL,'lol@hotmail.com');
/*!40000 ALTER TABLE `usernames` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `InsertIntoRoleTable` AFTER INSERT ON `usernames` FOR EACH ROW BEGIN
    -- Check the user type and insert into the corresponding table
    IF NEW.UserTypeID = 1 THEN
        -- Insert into Nurses table
        INSERT INTO Nurses (NurseUserName)
        VALUES (NEW.Username);
    
    ELSEIF NEW.UserTypeID = 3 THEN
        -- Insert into Physicians table
        INSERT INTO Physicians (PhysicianUserName)
        VALUES (NEW.Username);
    
    ELSEIF NEW.UserTypeID = 2 THEN
        -- Insert into Patients table
        INSERT INTO Patients (PatientUserName)
        VALUES (NEW.Username);
    
    ELSEIF NEW.UserTypeID = 4 THEN
        -- Insert into Admin table
        INSERT INTO Admin (AdminUserName)
        VALUES (NEW.Username);
    
    ELSEIF NEW.UserTypeID = 5 THEN
        -- Insert into Staff table
        INSERT INTO Staff (StaffUserName)
        VALUES (NEW.Username);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-01  2:35:57
