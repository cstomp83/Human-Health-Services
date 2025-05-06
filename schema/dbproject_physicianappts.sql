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
-- Table structure for table `physicianappts`
--

DROP TABLE IF EXISTS `physicianappts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `physicianappts` (
  `PhysicianApptID` int NOT NULL AUTO_INCREMENT,
  `PhysicianCalenderID` int DEFAULT NULL,
  `PatientUserName` varchar(50) NOT NULL,
  `Date` date DEFAULT NULL,
  `StartTime` time DEFAULT NULL,
  `ApptTypeID` int DEFAULT NULL,
  `EndTime` time DEFAULT NULL,
  PRIMARY KEY (`PhysicianApptID`),
  UNIQUE KEY `PatientUserName` (`PatientUserName`),
  KEY `PhysicianCalenderID` (`PhysicianCalenderID`),
  KEY `ApptTypeID` (`ApptTypeID`),
  CONSTRAINT `physicianappts_ibfk_1` FOREIGN KEY (`PhysicianCalenderID`) REFERENCES `physiciancalenders` (`PhysicianCalenderID`),
  CONSTRAINT `physicianappts_ibfk_2` FOREIGN KEY (`PatientUserName`) REFERENCES `patients` (`PatientUserName`),
  CONSTRAINT `physicianappts_ibfk_3` FOREIGN KEY (`ApptTypeID`) REFERENCES `appttypes` (`ApptTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `physicianappts`
--

LOCK TABLES `physicianappts` WRITE;
/*!40000 ALTER TABLE `physicianappts` DISABLE KEYS */;
/*!40000 ALTER TABLE `physicianappts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-29 15:23:09
