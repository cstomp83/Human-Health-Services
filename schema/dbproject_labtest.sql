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
-- Table structure for table `labtest`
--

DROP TABLE IF EXISTS `labtest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `labtest` (
  `LabTestID` int NOT NULL AUTO_INCREMENT,
  `TestName` text,
  `TestType` text,
  `TestResult` text,
  `PhysicianUserName` varchar(50) DEFAULT NULL,
  `PatientUserName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`LabTestID`),
  KEY `PatientUserName` (`PatientUserName`),
  KEY `PhysicianUserName` (`PhysicianUserName`),
  CONSTRAINT `labtest_ibfk_1` FOREIGN KEY (`PatientUserName`) REFERENCES `patients` (`PatientUserName`),
  CONSTRAINT `labtest_ibfk_2` FOREIGN KEY (`PhysicianUserName`) REFERENCES `physicians` (`PhysicianUserName`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labtest`
--

LOCK TABLES `labtest` WRITE;
/*!40000 ALTER TABLE `labtest` DISABLE KEYS */;
INSERT INTO `labtest` VALUES (1,'Complete Blood Count','Blood Test','WBC: Normal, RBC: Normal, Hemoglobin: Normal','ConDoc','MaHiggens'),(2,'X-Ray Chest','Imaging','No abnormalities detected','ConDoc','MaHiggens'),(3,'Lipid Panel','Blood Test','Cholesterol: Elevated, LDL: High, HDL: Low','ConDoc','MaHiggens'),(4,'COVID-19 PCR','Swab Test','Negative','ConDoc','MaHiggens'),(5,'Urinalysis','Urine Test','pH: 6.5, Protein: Negative, Glucose: Negative','ConDoc','MaHiggens');
/*!40000 ALTER TABLE `labtest` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-01  2:35:56
