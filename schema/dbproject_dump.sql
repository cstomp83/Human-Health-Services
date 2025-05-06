-- MySQL dump 10.13  Distrib 9.2.0, for Win64 (x86_64)
--
-- Host: localhost    Database: dbproject
-- ------------------------------------------------------
-- Server version	9.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `AdminUserName` varchar(50) NOT NULL,
  `DepartmentID` int DEFAULT NULL,
  PRIMARY KEY (`AdminUserName`),
  KEY `DepartmentID` (`DepartmentID`),
  CONSTRAINT `admins_ibfk_1` FOREIGN KEY (`DepartmentID`) REFERENCES `departments` (`DepartmentID`),
  CONSTRAINT `admins_ibfk_2` FOREIGN KEY (`AdminUserName`) REFERENCES `usernames` (`UserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aftervisitsummary`
--

DROP TABLE IF EXISTS `aftervisitsummary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aftervisitsummary` (
  `SummaryID` int NOT NULL AUTO_INCREMENT,
  `PatientUserName` varchar(50) NOT NULL,
  `PhysicianUserName` varchar(50) NOT NULL,
  `ClinicName` varchar(100) NOT NULL,
  `RecordDesc` text,
  `Conditions` varchar(255) DEFAULT NULL,
  `LabTests` text,
  `Dosage` varchar(100) DEFAULT NULL,
  `Dose` varchar(100) DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL,
  `MedicationName` varchar(100) DEFAULT NULL,
  `DateCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`SummaryID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aftervisitsummary`
--

LOCK TABLES `aftervisitsummary` WRITE;
/*!40000 ALTER TABLE `aftervisitsummary` DISABLE KEYS */;
INSERT INTO `aftervisitsummary` VALUES (1,'MaHiggens','ConDoc','Northview Family Practice','SHIT PAINFUL','Knee Tension','Blood, X- Ray',NULL,NULL,NULL,NULL,NULL,'2025-05-05 00:56:32');
/*!40000 ALTER TABLE `aftervisitsummary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `allergies`
--

DROP TABLE IF EXISTS `allergies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allergies` (
  `AllergyID` int NOT NULL AUTO_INCREMENT,
  `PatientMedicalRecordsID` int DEFAULT NULL,
  `AllergyName` varchar(30) DEFAULT NULL,
  `AllergyDesc` text,
  PRIMARY KEY (`AllergyID`),
  KEY `PatientMedicalRecordsID` (`PatientMedicalRecordsID`),
  CONSTRAINT `allergies_ibfk_1` FOREIGN KEY (`PatientMedicalRecordsID`) REFERENCES `patientmedicalrecords` (`PatientMedicalRecordsID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allergies`
--

LOCK TABLES `allergies` WRITE;
/*!40000 ALTER TABLE `allergies` DISABLE KEYS */;
INSERT INTO `allergies` VALUES (3,1,'Penicillin','Causes rash and swelling'),(4,2,'Pollen','Triggers sneezing and watery eyes');
/*!40000 ALTER TABLE `allergies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appttypes`
--

DROP TABLE IF EXISTS `appttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appttypes` (
  `ApptTypeID` int NOT NULL AUTO_INCREMENT,
  `ApptTypeDesc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ApptTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appttypes`
--

LOCK TABLES `appttypes` WRITE;
/*!40000 ALTER TABLE `appttypes` DISABLE KEYS */;
INSERT INTO `appttypes` VALUES (1,'Annual Physical'),(2,'Well-Patient Visit'),(3,'Sick Visit'),(4,'Follow-Up'),(5,'Consultation'),(6,'Post-Surgery Checkup');
/*!40000 ALTER TABLE `appttypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beds`
--

DROP TABLE IF EXISTS `beds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `beds` (
  `BedID` int NOT NULL AUTO_INCREMENT,
  `FloorNumber` int DEFAULT NULL,
  `RoomLocation` varchar(10) NOT NULL,
  `Occupied` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`BedID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beds`
--

LOCK TABLES `beds` WRITE;
/*!40000 ALTER TABLE `beds` DISABLE KEYS */;
INSERT INTO `beds` VALUES (1,1,'101A',0),(2,1,'101B',1),(3,2,'201A',0),(4,2,'202B',1),(5,3,'301C',0),(6,3,'302D',0),(7,4,'401E',1),(8,4,'402F',0);
/*!40000 ALTER TABLE `beds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billing`
--

DROP TABLE IF EXISTS `billing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing` (
  `BillingID` int NOT NULL AUTO_INCREMENT,
  `PatientUserName` varchar(50) NOT NULL,
  `BalanceDue` bigint DEFAULT NULL,
  `ClaimDesc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`BillingID`),
  KEY `billing_ibfk_1` (`PatientUserName`),
  CONSTRAINT `billing_ibfk_1` FOREIGN KEY (`PatientUserName`) REFERENCES `patients` (`PatientUserName`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing`
--

LOCK TABLES `billing` WRITE;
/*!40000 ALTER TABLE `billing` DISABLE KEYS */;
INSERT INTO `billing` VALUES (1,'MaHiggens',1200,'X-Ray Services'),(6,'MaHiggens',1000,'obu');
/*!40000 ALTER TABLE `billing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinics`
--

DROP TABLE IF EXISTS `clinics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinics` (
  `ClinicID` int NOT NULL AUTO_INCREMENT,
  `ClinicName` varchar(30) DEFAULT NULL,
  `Address1` varchar(30) DEFAULT NULL,
  `Address2` varchar(30) DEFAULT NULL,
  `City` varchar(30) DEFAULT NULL,
  `State` varchar(30) DEFAULT NULL,
  `Zip` int DEFAULT NULL,
  PRIMARY KEY (`ClinicID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinics`
--

LOCK TABLES `clinics` WRITE;
/*!40000 ALTER TABLE `clinics` DISABLE KEYS */;
INSERT INTO `clinics` VALUES (1,'Downtown Medical Center','123 Main St','Suite 200','Chicago','IL',60601),(2,'Westside Health Clinic','456 Elm Ave',NULL,'Los Angeles','CA',90017),(3,'Northview Family Practice','789 Pine Rd','Building A','Seattle','WA',98101),(4,'Southtown Pediatrics','321 Oak St',NULL,'Austin','TX',73301),(5,'Lakeside Wellness Center','654 Lake Dr','Floor 3','Minneapolis','MN',55401),(6,'Midtown Urgent Care','987 Cedar Blvd',NULL,'Denver','CO',80202),(7,'Hillside Medical Group','213 Maple Ln','Suite 110','Portland','OR',97201),(8,'Green Valley Clinic','111 Spruce St',NULL,'Madison','WI',53703),(9,'Sunrise Health Associates','444 Sunrise Pkwy','Ste 5B','Phoenix','AZ',85004),(10,'Bay Area Health Hub','888 Mission St','Room 9','San Francisco','CA',94103);
/*!40000 ALTER TABLE `clinics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `DepartmentID` int NOT NULL AUTO_INCREMENT,
  `DepartmentName` varchar(30) DEFAULT NULL,
  `Location` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`DepartmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detailnotes`
--

DROP TABLE IF EXISTS `detailnotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detailnotes` (
  `DetailNoteID` int NOT NULL AUTO_INCREMENT,
  `PhysicianUserName` varchar(50) DEFAULT NULL,
  `StaffUserName` varchar(50) DEFAULT NULL,
  `NotesDesc` varchar(50) DEFAULT NULL,
  `NurseUserName` varchar(50) DEFAULT NULL,
  `PatientUserName` varchar(50) DEFAULT NULL,
  `DateTimeCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ClinicID` int DEFAULT NULL,
  PRIMARY KEY (`DetailNoteID`),
  KEY `PhysicianUserName` (`PhysicianUserName`),
  KEY `StaffUserName` (`StaffUserName`),
  KEY `NurseUserName` (`NurseUserName`),
  KEY `PatientUserName` (`PatientUserName`),
  KEY `fk_detailNotes_clinic` (`ClinicID`),
  CONSTRAINT `detailnotes_ibfk_1` FOREIGN KEY (`PhysicianUserName`) REFERENCES `physicians` (`PhysicianUserName`),
  CONSTRAINT `detailnotes_ibfk_2` FOREIGN KEY (`StaffUserName`) REFERENCES `staff` (`StaffUserName`),
  CONSTRAINT `detailnotes_ibfk_3` FOREIGN KEY (`NurseUserName`) REFERENCES `nurses` (`NurseUserName`),
  CONSTRAINT `detailnotes_ibfk_4` FOREIGN KEY (`PatientUserName`) REFERENCES `patients` (`PatientUserName`),
  CONSTRAINT `fk_detailNotes_clinic` FOREIGN KEY (`ClinicID`) REFERENCES `clinics` (`ClinicID`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detailnotes`
--

LOCK TABLES `detailnotes` WRITE;
/*!40000 ALTER TABLE `detailnotes` DISABLE KEYS */;
INSERT INTO `detailnotes` VALUES (1,'ConDoc','ConStaff','Vitals stable.','erin','MaHiggens','2025-04-30 20:13:41',NULL),(38,'ConDoc','ConStaff','Reviewed blood work.','Erin','MaHiggens','2025-05-01 02:01:49',NULL),(39,'ErinDoc','ConStaff','Vitals normal.','Erin','MaHiggens','2025-05-01 02:01:49',NULL),(40,'ErinDoc','ConStaff','Scheduled follow-up.','Erin','MaHiggens','2025-05-01 02:01:49',NULL),(41,'ErinDoc','ConStaff','Adjusted meds.','Erin','MaHiggens','2025-05-01 02:01:49',NULL),(42,'ConDoc','ConStaff','Meds given.','Howdy','MaHiggens','2025-05-01 02:01:49',NULL),(43,'ConDoc','ConStaff','Intake complete.','Erin','MaHiggens','2025-05-01 02:01:49',NULL),(44,'ConDoc','ConStaff','He chilling','Erin','MaHiggens','2025-05-04 21:44:05',NULL),(45,'ConDoc','ConStaff','He doing good','Erin','MaHiggens','2025-05-04 22:42:10',NULL),(46,'ConDoc','ConStaff','HE DYING','Erin','MaHiggens','2025-05-04 22:44:03',NULL),(47,'ConDoc','ConStaff','AHHH','Erin','MaHiggens','2025-05-04 23:07:45',NULL),(48,'ConDoc','ConStaff','BUILDING ON FIRE','Erin','MaHiggens','2025-05-05 00:53:58',3),(49,'ConDoc','ConStaff',NULL,'ConNurse','MaHiggens','2025-05-05 00:53:59',3),(50,'ConDoc','ConStaff',NULL,'Erin','MaHiggens','2025-05-05 13:51:14',3),(51,'ConDoc','ConStaff',NULL,'Erin','MaHiggens','2025-05-05 16:07:04',3);
/*!40000 ALTER TABLE `detailnotes` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_detailnote_insert` AFTER INSERT ON `detailnotes` FOR EACH ROW BEGIN
    INSERT INTO patientmedicalrecords (
        RecordDate, 
        PatientUserName, 
        DetailNoteID
    ) VALUES (
        NEW.DateTimeCreated,
        NEW.PatientUserName,
        NEW.DetailNoteID
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `insurance`
--

DROP TABLE IF EXISTS `insurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insurance` (
  `InsuranceID` int NOT NULL AUTO_INCREMENT,
  `ProviderName` varchar(50) DEFAULT NULL,
  `CoverageDesc` varchar(50) DEFAULT NULL,
  `Copay` bigint DEFAULT NULL,
  `Deductible` bigint DEFAULT NULL,
  `CoInsurance` bigint DEFAULT NULL,
  `OutOfPocketMax` bigint DEFAULT NULL,
  PRIMARY KEY (`InsuranceID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance`
--

LOCK TABLES `insurance` WRITE;
/*!40000 ALTER TABLE `insurance` DISABLE KEYS */;
INSERT INTO `insurance` VALUES (1,'BlueCross BlueShield','Standard PPO',30,1000,20,5000),(2,'UnitedHealthcare','HSA High Deductible Plan',40,2000,15,6000),(3,'Aetna','Comprehensive Coverage',25,750,10,4000),(4,'Cigna','Premium Gold Plan',20,500,5,3000),(5,'Kaiser Permanente','Basic Coverage',35,1500,25,5500);
/*!40000 ALTER TABLE `insurance` ENABLE KEYS */;
UNLOCK TABLES;

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
  `PatientMedicalRecordsID` int DEFAULT NULL,
  PRIMARY KEY (`LabTestID`),
  KEY `PatientUserName` (`PatientUserName`),
  KEY `PhysicianUserName` (`PhysicianUserName`),
  KEY `PatientMedicalRecordsID` (`PatientMedicalRecordsID`),
  CONSTRAINT `labtest_ibfk_1` FOREIGN KEY (`PatientUserName`) REFERENCES `patients` (`PatientUserName`),
  CONSTRAINT `labtest_ibfk_2` FOREIGN KEY (`PhysicianUserName`) REFERENCES `physicians` (`PhysicianUserName`),
  CONSTRAINT `labtest_ibfk_3` FOREIGN KEY (`PatientMedicalRecordsID`) REFERENCES `patientmedicalrecords` (`PatientMedicalRecordsID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labtest`
--

LOCK TABLES `labtest` WRITE;
/*!40000 ALTER TABLE `labtest` DISABLE KEYS */;
INSERT INTO `labtest` VALUES (1,'Complete Blood Count','Blood Test','WBC: Normal, RBC: Normal, Hemoglobin: Normal','ConDoc','MaHiggens',NULL),(2,'X-Ray Chest','Imaging','No abnormalities detected','ConDoc','MaHiggens',NULL),(3,'Lipid Panel','Blood Test','Cholesterol: Elevated, LDL: High, HDL: Low','ConDoc','MaHiggens',NULL),(4,'COVID-19 PCR','Swab Test','Negative','ConDoc','MaHiggens',NULL),(5,'Urinalysis','Urine Test','pH: 6.5, Protein: Negative, Glucose: Negative','ConDoc','MaHiggens',NULL),(7,'Blood','Blood Test','','ConDoc','MaHiggens',NULL),(8,'Blood','Blood Test','','ConDoc','MaHiggens',NULL),(9,'Blood','Blood Test','','ConDoc','MaHiggens',NULL),(10,'X- Ray','obu','','ConDoc','MaHiggens',NULL),(11,'Blood','obu','','ConDoc','MaHiggens',4),(12,'X- Ray','OIB\"U:I','','ConDoc','MaHiggens',7),(13,'Blood','AHHH','','ConDoc','MaHiggens',7);
/*!40000 ALTER TABLE `labtest` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_labtest_insert` AFTER INSERT ON `labtest` FOR EACH ROW BEGIN
    INSERT INTO Billing (PatientUserName, BalanceDue, ClaimDesc)
    VALUES (NEW.PatientUserName, 1000, NEW.TestType);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `medications`
--

DROP TABLE IF EXISTS `medications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medications` (
  `MedicationID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `strength` varchar(50) DEFAULT NULL,
  `ExpDate` date DEFAULT NULL,
  PRIMARY KEY (`MedicationID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medications`
--

LOCK TABLES `medications` WRITE;
/*!40000 ALTER TABLE `medications` DISABLE KEYS */;
INSERT INTO `medications` VALUES (1,'Amoxicillin','500mg','2026-05-01'),(2,'Ibuprofen','200mg','2025-12-31'),(3,'Lisinopril','10mg','2027-03-15');
/*!40000 ALTER TABLE `medications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nurses`
--

DROP TABLE IF EXISTS `nurses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nurses` (
  `NurseUserName` varchar(50) NOT NULL,
  `Rank` varchar(50) DEFAULT NULL,
  `ClinicID` int DEFAULT NULL,
  PRIMARY KEY (`NurseUserName`),
  KEY `ClinicID` (`ClinicID`),
  CONSTRAINT `nurses_ibfk_1` FOREIGN KEY (`NurseUserName`) REFERENCES `usernames` (`UserName`),
  CONSTRAINT `nurses_ibfk_2` FOREIGN KEY (`ClinicID`) REFERENCES `clinics` (`ClinicID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurses`
--

LOCK TABLES `nurses` WRITE;
/*!40000 ALTER TABLE `nurses` DISABLE KEYS */;
INSERT INTO `nurses` VALUES ('ConNurse','Upper Decker',3),('DanDoc',NULL,NULL),('Erin','Registered Nurse',3),('Howdy','Registerd',2);
/*!40000 ALTER TABLE `nurses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientmedicalrecords`
--

DROP TABLE IF EXISTS `patientmedicalrecords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patientmedicalrecords` (
  `PatientMedicalRecordsID` int NOT NULL AUTO_INCREMENT,
  `RecordDate` datetime DEFAULT NULL,
  `RecordDesc` text,
  `Conditions` varchar(100) DEFAULT NULL,
  `PrescriptionID` int DEFAULT NULL,
  `PatientUserName` varchar(50) NOT NULL,
  `DetailNoteID` int DEFAULT NULL,
  PRIMARY KEY (`PatientMedicalRecordsID`),
  KEY `PrescriptionID` (`PrescriptionID`),
  KEY `PatientUserName` (`PatientUserName`),
  KEY `fk_DetailNotes` (`DetailNoteID`),
  CONSTRAINT `fk_DetailNotes` FOREIGN KEY (`DetailNoteID`) REFERENCES `detailnotes` (`DetailNoteID`),
  CONSTRAINT `patientmedicalrecords_ibfk_1` FOREIGN KEY (`PrescriptionID`) REFERENCES `prescriptions` (`PrescriptionID`),
  CONSTRAINT `patientmedicalrecords_ibfk_2` FOREIGN KEY (`PatientUserName`) REFERENCES `patients` (`PatientUserName`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientmedicalrecords`
--

LOCK TABLES `patientmedicalrecords` WRITE;
/*!40000 ALTER TABLE `patientmedicalrecords` DISABLE KEYS */;
INSERT INTO `patientmedicalrecords` VALUES (1,'2025-04-01 09:00:00','Patient diagnosed with bacterial infection.','Sinusitis',1,'MaHiggens',NULL),(2,'2025-04-05 07:30:00','Complaints of muscle pain after workouts.','Muscle Strain',2,'MaHiggens',NULL),(3,'2025-03-15 09:00:00','Routine check-up and hypertension management.','Hypertension',3,'MaHiggens',NULL),(4,'2025-05-04 22:42:10','AHHHHH',NULL,NULL,'MaHiggens',45),(5,'2025-05-04 22:44:03','AHHHHH',NULL,NULL,'MaHiggens',46),(6,'2025-05-04 23:07:45','Pain bad','Knee Tension',NULL,'MaHiggens',47),(7,'2025-05-05 00:53:58','SHIT PAINFUL','Knee Tension',NULL,'MaHiggens',48),(8,'2025-05-05 00:53:59','OH MY WORD','LEG EXPLODED',NULL,'MaHiggens',49),(9,'2025-05-05 13:51:14',NULL,NULL,NULL,'MaHiggens',50),(10,'2025-05-05 16:07:04',NULL,NULL,NULL,'MaHiggens',51);
/*!40000 ALTER TABLE `patientmedicalrecords` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_pmr_update` AFTER UPDATE ON `patientmedicalrecords` FOR EACH ROW BEGIN
    -- Call the stored procedure with the related DetailNoteID
    CALL GenerateAfterVisitSummary(NEW.DetailNoteID);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `PatientUserName` varchar(50) NOT NULL,
  `BedID` int DEFAULT NULL,
  `InsuranceID` int NOT NULL,
  PRIMARY KEY (`PatientUserName`),
  UNIQUE KEY `PatientUserName` (`PatientUserName`),
  KEY `BedID` (`BedID`),
  CONSTRAINT `patients_ibfk_1` FOREIGN KEY (`PatientUserName`) REFERENCES `usernames` (`UserName`),
  CONSTRAINT `patients_ibfk_2` FOREIGN KEY (`BedID`) REFERENCES `beds` (`BedID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES ('MaHiggens',1,3);
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

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
  `ClinicID` int NOT NULL,
  `ScheduleTypeID` int DEFAULT NULL,
  `checkedIn` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`PhysicianApptID`),
  KEY `PhysicianCalenderID` (`PhysicianCalenderID`),
  KEY `ApptTypeID` (`ApptTypeID`),
  KEY `fk_physicianappts_clinic` (`ClinicID`),
  KEY `fk_PhysicianAppts_ScheduleTypeID` (`ScheduleTypeID`),
  KEY `fk_PhysicianAppts_PatientUserName` (`PatientUserName`),
  CONSTRAINT `fk_physicianappts_clinic` FOREIGN KEY (`ClinicID`) REFERENCES `clinics` (`ClinicID`),
  CONSTRAINT `fk_PhysicianAppts_PatientUserName` FOREIGN KEY (`PatientUserName`) REFERENCES `patients` (`PatientUserName`),
  CONSTRAINT `fk_PhysicianAppts_ScheduleTypeID` FOREIGN KEY (`ScheduleTypeID`) REFERENCES `scheduletypes` (`ScheduleTypeID`),
  CONSTRAINT `physicianappts_ibfk_1` FOREIGN KEY (`PhysicianCalenderID`) REFERENCES `physiciancalenders` (`PhysicianCalenderID`),
  CONSTRAINT `physicianappts_ibfk_3` FOREIGN KEY (`ApptTypeID`) REFERENCES `appttypes` (`ApptTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `physicianappts`
--

LOCK TABLES `physicianappts` WRITE;
/*!40000 ALTER TABLE `physicianappts` DISABLE KEYS */;
INSERT INTO `physicianappts` VALUES (1,1,'MaHiggens','2025-05-03','02:32:00',3,'02:32:00',1,NULL,0),(3,1,'MaHiggens','2025-05-05','16:25:00',3,'17:25:00',2,2,0),(4,1,'MaHiggens','2025-05-07','16:50:00',2,'04:54:00',4,2,0),(5,1,'MaHiggens','2025-05-04','20:39:00',1,'19:39:00',3,1,0),(6,1,'MaHiggens','2025-05-04','22:39:00',2,'22:39:00',3,2,0),(7,1,'MaHiggens','2025-05-04','22:39:00',6,'22:39:00',3,3,0),(8,1,'MaHiggens','2025-05-04','00:39:00',5,'00:40:00',3,5,1),(9,1,'MaHiggens','2025-05-05','00:52:00',3,'01:52:00',3,3,1),(10,1,'MaHiggens','2025-05-05','03:53:00',6,'01:55:00',3,1,1),(11,1,'MaHiggens','2025-05-05','13:50:00',1,'16:50:00',3,1,1),(12,1,'MaHiggens','2025-05-05','16:06:00',2,'16:06:00',3,2,1);
/*!40000 ALTER TABLE `physicianappts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `physiciancalenders`
--

DROP TABLE IF EXISTS `physiciancalenders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `physiciancalenders` (
  `PhysicianCalenderID` int NOT NULL AUTO_INCREMENT,
  `PhysicianUserName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PhysicianCalenderID`),
  KEY `PhysicianUserName` (`PhysicianUserName`),
  CONSTRAINT `physiciancalenders_ibfk_1` FOREIGN KEY (`PhysicianUserName`) REFERENCES `physicians` (`PhysicianUserName`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `physiciancalenders`
--

LOCK TABLES `physiciancalenders` WRITE;
/*!40000 ALTER TABLE `physiciancalenders` DISABLE KEYS */;
INSERT INTO `physiciancalenders` VALUES (1,'ConDoc'),(3,'DanPhys');
/*!40000 ALTER TABLE `physiciancalenders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `physicianclinicassignments`
--

DROP TABLE IF EXISTS `physicianclinicassignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `physicianclinicassignments` (
  `PhysicianUserName` varchar(50) NOT NULL,
  `ClinicID` int NOT NULL,
  PRIMARY KEY (`ClinicID`,`PhysicianUserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `physicianclinicassignments`
--

LOCK TABLES `physicianclinicassignments` WRITE;
/*!40000 ALTER TABLE `physicianclinicassignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `physicianclinicassignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `physicianpatientassignments`
--

DROP TABLE IF EXISTS `physicianpatientassignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `physicianpatientassignments` (
  `PhysicianUserName` varchar(50) NOT NULL,
  `PatientUserName` varchar(50) NOT NULL,
  PRIMARY KEY (`PhysicianUserName`,`PatientUserName`),
  KEY `PatientUserName` (`PatientUserName`),
  CONSTRAINT `physicianpatientassignments_ibfk_1` FOREIGN KEY (`PhysicianUserName`) REFERENCES `physicians` (`PhysicianUserName`),
  CONSTRAINT `physicianpatientassignments_ibfk_2` FOREIGN KEY (`PatientUserName`) REFERENCES `patients` (`PatientUserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `physicianpatientassignments`
--

LOCK TABLES `physicianpatientassignments` WRITE;
/*!40000 ALTER TABLE `physicianpatientassignments` DISABLE KEYS */;
INSERT INTO `physicianpatientassignments` VALUES ('ConDoc','MaHiggens');
/*!40000 ALTER TABLE `physicianpatientassignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `physicians`
--

DROP TABLE IF EXISTS `physicians`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `physicians` (
  `PhysicianUserName` varchar(50) NOT NULL,
  `PhysicianSpecialtiesID` int DEFAULT NULL,
  `PhysicianTypeID` int DEFAULT NULL,
  `DepartmentID` int DEFAULT NULL,
  `NPI` varchar(20) DEFAULT NULL,
  `Rank` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PhysicianUserName`),
  UNIQUE KEY `PhysicianUserName` (`PhysicianUserName`),
  KEY `PhysicianSpecialtiesID` (`PhysicianSpecialtiesID`),
  KEY `PhysicianTypeID` (`PhysicianTypeID`),
  CONSTRAINT `physicians_ibfk_1` FOREIGN KEY (`PhysicianUserName`) REFERENCES `usernames` (`UserName`),
  CONSTRAINT `physicians_ibfk_2` FOREIGN KEY (`PhysicianSpecialtiesID`) REFERENCES `physicianspecialties` (`PhysicianSpecialtiesID`),
  CONSTRAINT `physicians_ibfk_3` FOREIGN KEY (`PhysicianTypeID`) REFERENCES `physiciantypes` (`PhysicianTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `physicians`
--

LOCK TABLES `physicians` WRITE;
/*!40000 ALTER TABLE `physicians` DISABLE KEYS */;
INSERT INTO `physicians` VALUES ('ConDoc',1,1,1,'1234567890','Attending'),('DanPhys',NULL,NULL,NULL,NULL,NULL),('ErinDoc',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `physicians` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_add_physician_calendar_on_physician` AFTER INSERT ON `physicians` FOR EACH ROW BEGIN
    INSERT INTO PhysicianCalenders (PhysicianUserName)
    VALUES (NEW.PhysicianUserName);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `physicianspecialties`
--

DROP TABLE IF EXISTS `physicianspecialties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `physicianspecialties` (
  `PhysicianSpecialtiesID` int NOT NULL AUTO_INCREMENT,
  `SpecialtyDesc` varchar(255) NOT NULL,
  PRIMARY KEY (`PhysicianSpecialtiesID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `physicianspecialties`
--

LOCK TABLES `physicianspecialties` WRITE;
/*!40000 ALTER TABLE `physicianspecialties` DISABLE KEYS */;
INSERT INTO `physicianspecialties` VALUES (1,'Anesthesiology'),(2,'Pulmonology'),(3,'Cardiology'),(4,'Pediatrics'),(5,'Family Medicine'),(6,'Internal Medicine');
/*!40000 ALTER TABLE `physicianspecialties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `physiciantypes`
--

DROP TABLE IF EXISTS `physiciantypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `physiciantypes` (
  `PhysicianTypeID` int NOT NULL AUTO_INCREMENT,
  `PhysicianTypeDesc` varchar(255) NOT NULL,
  PRIMARY KEY (`PhysicianTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `physiciantypes`
--

LOCK TABLES `physiciantypes` WRITE;
/*!40000 ALTER TABLE `physiciantypes` DISABLE KEYS */;
INSERT INTO `physiciantypes` VALUES (1,'Primary Care Physician'),(2,'Specialty Care'),(3,'Family Medicine'),(4,'Adult Care'),(5,'Pediatric Care');
/*!40000 ALTER TABLE `physiciantypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescriptions`
--

DROP TABLE IF EXISTS `prescriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescriptions` (
  `PrescriptionID` int NOT NULL AUTO_INCREMENT,
  `PatientUserName` varchar(50) DEFAULT NULL,
  `PhysicianUserName` varchar(50) DEFAULT NULL,
  `MedicationID` int DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL,
  `Dose` varchar(50) DEFAULT NULL,
  `Dosage` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PrescriptionID`),
  KEY `PatientUserName` (`PatientUserName`),
  KEY `PhysicianUserName` (`PhysicianUserName`),
  KEY `MedicationID` (`MedicationID`),
  CONSTRAINT `prescriptions_ibfk_1` FOREIGN KEY (`PatientUserName`) REFERENCES `patients` (`PatientUserName`),
  CONSTRAINT `prescriptions_ibfk_2` FOREIGN KEY (`PhysicianUserName`) REFERENCES `physicians` (`PhysicianUserName`),
  CONSTRAINT `prescriptions_ibfk_3` FOREIGN KEY (`MedicationID`) REFERENCES `medications` (`MedicationID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescriptions`
--

LOCK TABLES `prescriptions` WRITE;
/*!40000 ALTER TABLE `prescriptions` DISABLE KEYS */;
INSERT INTO `prescriptions` VALUES (1,'MaHiggens','ConDoc',1,'2025-04-01 10:00:00','2025-04-10 10:00:00','1 tablet','twice daily'),(2,'MaHiggens','ConDoc',2,'2025-04-05 08:00:00','2025-04-12 08:00:00','2 tablets','as needed'),(3,'MaHiggens','ConDoc',3,'2025-03-15 09:00:00','2025-09-15 09:00:00','1 tablet','once daily');
/*!40000 ALTER TABLE `prescriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduletypes`
--

DROP TABLE IF EXISTS `scheduletypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scheduletypes` (
  `ScheduleTypeID` int NOT NULL AUTO_INCREMENT,
  `ScheduleTypeDesc` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ScheduleTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduletypes`
--

LOCK TABLES `scheduletypes` WRITE;
/*!40000 ALTER TABLE `scheduletypes` DISABLE KEYS */;
INSERT INTO `scheduletypes` VALUES (1,'Office Visit'),(2,'Emergency Room (ER)'),(3,'Inpatient'),(4,'Outpatient'),(5,'Telehealth'),(6,'Walk-In');
/*!40000 ALTER TABLE `scheduletypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `StaffUserName` varchar(50) NOT NULL,
  `Rank` varchar(50) DEFAULT NULL,
  `ClinicID` int DEFAULT NULL,
  PRIMARY KEY (`StaffUserName`),
  KEY `ClinicID` (`ClinicID`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`StaffUserName`) REFERENCES `usernames` (`UserName`),
  CONSTRAINT `staff_ibfk_2` FOREIGN KEY (`ClinicID`) REFERENCES `clinics` (`ClinicID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES ('ConStaff','Nurse',3);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `usernames` VALUES ('ConDoc',6,3,'doc1',NULL,NULL,NULL,NULL,NULL,NULL,'con@conmail.com'),('conman',6,4,'con',NULL,NULL,NULL,NULL,NULL,NULL,'con@conmail.com'),('ConNurse',6,1,'Nurse1',NULL,NULL,NULL,NULL,NULL,NULL,'nurse@gmail.com'),('ConStaff',6,5,'StaffC',NULL,NULL,NULL,NULL,NULL,NULL,'con@conmail.com'),('DanDoc',10,1,'Dan2',NULL,NULL,NULL,NULL,NULL,NULL,'Dan@DanMail.com'),('DanPhys',10,3,'Phys1',NULL,NULL,NULL,NULL,NULL,NULL,'Dan@DanMail.com'),('DanStaff',10,5,'Dan@',NULL,NULL,NULL,NULL,NULL,NULL,'Dan@DanMail.com'),('erin',7,1,'er4','What is your mother\'s maiden name?','What was the name of your first pet?','What was the name of your elementary school?','add','azul','barkstall','cstomp@uiowa.edu'),('ErinDoc',7,3,'DocMan',NULL,NULL,NULL,NULL,NULL,NULL,'erin@dogmail.com'),('howdy',6,1,'how','What is your mother\'s maiden name?','What was the name of your first pet?','What is your favorite color?','mom','medo','yellow','connorstomp@gmail.com'),('MaHiggens',1,2,'rah','yuh','what','dance','ham','dog','lobster','dance@hotmail.com'),('MaPhysician',1,3,'lol',NULL,NULL,NULL,NULL,NULL,NULL,'lol@hotmail.com');
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

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `MiddleName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) NOT NULL,
  `DOB` date NOT NULL,
  `Address1` varchar(100) DEFAULT NULL,
  `Address2` varchar(100) DEFAULT NULL,
  `City` varchar(50) NOT NULL,
  `State` char(2) NOT NULL,
  `Zip` char(5) NOT NULL,
  `Phone` varchar(10) DEFAULT NULL,
  `ssn` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Malinda','Ann','Carvana','1995-07-14','123 main ave',NULL,'Lemont','IL','60439','6306489446','123456789'),(6,'Connor','','Stomp','2021-01-05','730 Tomaszewski St',NULL,'Lemont','IL','60439','6306489446','333444555'),(7,'erin','a','conwan','2015-02-19','319 E church St',NULL,'Iowa City','IA','52242','5678889999','123444466'),(10,'Dan','H','Dale','1990-02-28','319 E church St',NULL,'Iowa City','IA','52242','4458829913','111333999');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usertypes`
--

DROP TABLE IF EXISTS `usertypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usertypes` (
  `UserTypeID` int NOT NULL AUTO_INCREMENT,
  `UserTypeDesc` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`UserTypeID`),
  UNIQUE KEY `UserTypeDesc` (`UserTypeDesc`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usertypes`
--

LOCK TABLES `usertypes` WRITE;
/*!40000 ALTER TABLE `usertypes` DISABLE KEYS */;
INSERT INTO `usertypes` VALUES (4,'Admin'),(1,'Nurse'),(2,'Patient'),(3,'Physician'),(5,'Staff');
/*!40000 ALTER TABLE `usertypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dbproject'
--

--
-- Dumping routines for database 'dbproject'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddBillingEntry` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddBillingEntry`(
    IN p_PatientUserName VARCHAR(50),
    IN p_BalanceDue BIGINT,
    IN p_ClaimDesc VARCHAR(50)
)
BEGIN
    INSERT INTO billing (PatientUserName, BalanceDue, ClaimDesc)
    VALUES (p_PatientUserName, p_BalanceDue, p_ClaimDesc);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddDetailedMedicalNote` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddDetailedMedicalNote`(
    IN p_PatientUserName VARCHAR(50),
    IN p_PhysicianUserName VARCHAR(50),
    IN p_StaffUserName VARCHAR(50),
    IN p_NurseUserName VARCHAR(50),
    IN p_NotesDesc VARCHAR(50)
)
BEGIN
    -- Ensure all required values are provided
    IF p_StaffUserName IS NULL OR p_NurseUserName IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'StaffUserName and NurseUserName must be provided.';
    END IF;

    -- Insert into detailnotes with correct column order
    INSERT INTO detailnotes (
        PhysicianUserName,
        StaffUserName,
        NotesDesc,
        NurseUserName,
        PatientUserName,
        DateTimeCreated
    )
    VALUES (
        p_PhysicianUserName,
        p_StaffUserName,
        p_NotesDesc,
        p_NurseUserName,
        p_PatientUserName,
        NOW()
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AssignPhysicianToPatient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AssignPhysicianToPatient`(
    IN p_PhysicianUserName VARCHAR(50),
    IN p_PatientUserName VARCHAR(50)
)
BEGIN
    INSERT INTO physicianpatientassignments (PhysicianUserName, PatientUserName)
    VALUES (p_PhysicianUserName, p_PatientUserName)
    ON DUPLICATE KEY UPDATE PhysicianUserName = p_PhysicianUserName;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EndPhysicianPatientAssociation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EndPhysicianPatientAssociation`(
    IN p_PhysicianUserName VARCHAR(50),
    IN p_PatientUserName VARCHAR(50)
)
BEGIN
    DELETE FROM physicianpatientassignments
    WHERE PhysicianUserName = p_PhysicianUserName
      AND PatientUserName = p_PatientUserName;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GenerateAfterVisitSummary` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GenerateAfterVisitSummary`(IN p_DetailNoteID INT)
BEGIN
    INSERT INTO AfterVisitSummary (
        PatientUserName,
        PhysicianUserName,
        ClinicName,
        RecordDesc,
        Conditions,
        LabTests,
        Dosage,
        Dose,
        StartDate,
        EndDate,
        MedicationName
    )
    SELECT
        dn.PatientUserName,
        dn.PhysicianUserName,
        c.ClinicName,
        pmr.RecordDesc,
        pmr.Conditions,
        GROUP_CONCAT(DISTINCT lt.TestName SEPARATOR ', '),
        p.Dosage,
        p.Dose,
        p.StartDate,
        p.EndDate,
        m.Name AS MedicationName
    FROM detailnotes dn
    JOIN clinics c ON dn.ClinicID = c.ClinicID
    JOIN patientmedicalrecords pmr ON dn.DetailNoteID = pmr.DetailNoteID
    LEFT JOIN prescriptions p ON pmr.PrescriptionID = p.PrescriptionID
    LEFT JOIN medications m ON p.MedicationID = m.MedicationID
    LEFT JOIN labtest lt ON pmr.PatientMedicalRecordsID = lt.PatientMedicalRecordsID
    WHERE dn.DetailNoteID = p_DetailNoteID
    GROUP BY 
        dn.DetailNoteID,
        dn.PatientUserName,
        dn.PhysicianUserName,
        c.ClinicName,
        pmr.RecordDesc,
        pmr.Conditions,
        p.Dosage,
        p.Dose,
        p.StartDate,
        p.EndDate,
        m.Name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAfterVisitSummary` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAfterVisitSummary`(
    IN p_PatientUserName VARCHAR(50)
)
BEGIN
    SELECT RecordDesc AS SummaryText, RecordDate AS VisitDate
    FROM patientmedicalrecords
    WHERE PatientUserName = p_PatientUserName
    ORDER BY RecordDate DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetDetailNotesByProviderAndPatient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDetailNotesByProviderAndPatient`(
    IN p_ProviderUserName VARCHAR(50),
    IN p_PatientUserName VARCHAR(50)
)
BEGIN
    SELECT 
        DetailNoteID,
        PhysicianUserName,
        StaffUserName,
        NotesDesc,
        NurseUserName,
        PatientUserName,
        DateTimeCreated
    FROM DetailNotes
    WHERE (PhysicianUserName = p_ProviderUserName OR 
           StaffUserName = p_ProviderUserName OR 
           NurseUserName = p_ProviderUserName)
      AND PatientUserName = p_PatientUserName
    ORDER BY DateTimeCreated DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetFullMedicalRecords` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetFullMedicalRecords`(IN p_PatientUserName VARCHAR(50))
BEGIN
    SELECT 
        pmr.PatientMedicalRecordsID,
        pmr.RecordDate,
        pmr.RecordDesc,
        pmr.Conditions,
        a.AllergyName,
        a.AllergyDesc,
        m.Name AS MedicationName,
        m.Strength AS MedicationStrength,
        pr.Dose,
        pr.Dosage
    FROM PatientMedicalRecords pmr
    LEFT JOIN Allergies a ON a.PatientMedicalRecordsID = pmr.PatientMedicalRecordsID
    LEFT JOIN Prescriptions pr ON pr.PrescriptionID = pmr.PrescriptionID
    LEFT JOIN Medications m ON m.MedicationID = pr.MedicationID
    WHERE pmr.PatientUserName = p_PatientUserName
    ORDER BY RecordDate DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetFutureAppointmentsByPatient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetFutureAppointmentsByPatient`(IN p_PatientUserName VARCHAR(50))
BEGIN
    SELECT 
        c.ClinicName,
        c.Address1,
        pc.PhysicianUserName,
        at.ApptTypeDesc,
        pa.Date,
        pa.StartTime,
        pa.CheckedIn
    FROM PhysicianAppts pa
    JOIN Clinics c ON pa.ClinicID = c.ClinicID
    JOIN PhysicianCalenders pc ON pa.PhysicianCalenderID = pc.PhysicianCalenderID
    JOIN ApptTypes at ON pa.ApptTypeID = at.ApptTypeID
    WHERE pa.PatientUserName = p_PatientUserName
      AND pa.Date >= CURDATE()
      AND pa.CheckedIn = False
    ORDER BY pa.Date, pa.StartTime;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetPatientBilling` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetPatientBilling`(IN patient_username VARCHAR(50))
BEGIN
    SELECT * 
    FROM Billing
    WHERE PatientUserName = patient_username;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetPatientInsuranceInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetPatientInsuranceInfo`(IN patient_username VARCHAR(50))
BEGIN
    DECLARE ins_id INT;

    -- Step 1: Get the InsuranceID from the Patients table
    SELECT InsuranceID INTO ins_id
    FROM Patients
    WHERE PatientUserName = patient_username;

    -- Step 2: Fetch insurance details from InsuranceInfo
    SELECT *
    FROM Insurance
    WHERE InsuranceID = ins_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetPhysicianPatients` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetPhysicianPatients`(
    IN p_PhysicianUserName VARCHAR(50)
)
BEGIN
    SELECT 
        up.UserName,
        u.FirstName,
        u.LastName,
        u.DOB
    FROM physicianpatientassignments ppa
    JOIN usernames up ON ppa.PatientUserName = up.UserName
    JOIN users u ON up.UserID = u.UserID
    WHERE ppa.PhysicianUserName = p_PhysicianUserName;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetTodayAppointmentsByStaff` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTodayAppointmentsByStaff`(
    IN inputStaffUserName VARCHAR(50)
)
BEGIN
    SELECT 
        pc.PhysicianUserName,
        p.PatientUserName,
        p.StartTime,
        p.ApptTypeID,
        p.PhysicianApptID,
        at.ApptTypeDesc
    FROM 
        physicianappts p
    JOIN 
        staff s ON p.ClinicID = s.ClinicID
    JOIN 
        physiciancalenders pc ON p.PhysicianCalenderID = pc.PhysicianCalenderID
    JOIN
        appttypes at ON p.ApptTypeID = at.ApptTypeID
    WHERE 
        s.StaffUserName = inputStaffUserName
        AND p.Date = CURDATE()
        AND p.checkedIn = FALSE
    ORDER BY 
        p.StartTime;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUnfinishedMedicalRecords` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUnfinishedMedicalRecords`(
    IN inputPhysicianUserName VARCHAR(50)
)
BEGIN
    SELECT pmr.*
    FROM patientmedicalrecords pmr
    JOIN detailnotes dn ON pmr.DetailNoteID = dn.DetailNoteID
    WHERE pmr.RecordDesc IS NULL
      AND dn.PhysicianUserName = inputPhysicianUserName;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUserDetailNotes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUserDetailNotes`(
    IN p_UserName VARCHAR(50)
)
BEGIN
    DECLARE v_UserType VARCHAR(30);

    -- Get the user type (e.g., 'Physician', 'Nurse', 'Staff')
    SELECT ut.UserTypeDesc
    INTO v_UserType
    FROM usernames u
    JOIN usertypes ut ON u.UserTypeID = ut.UserTypeID
    WHERE u.UserName = p_UserName;

    -- Return detail notes depending on their role
    IF v_UserType = 'Physician' THEN
        SELECT * FROM detailnotes WHERE PhysicianUserName = p_UserName;

    ELSEIF v_UserType = 'Nurse' THEN
        SELECT * FROM detailnotes WHERE NurseUserName = p_UserName;

    ELSEIF v_UserType = 'Staff' THEN
        SELECT * FROM detailnotes WHERE StaffUserName = p_UserName;

    ELSE
        SELECT 'Unauthorized user type or no matching notes' AS Error;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertIntoUsernames` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertIntoUsernames`(
    IN p_UserName VARCHAR(50),
    IN p_UserID INT,
    IN p_UserTypeID INT,
    IN p_PasswordHash VARCHAR(255),
    IN p_Email VARCHAR(255)
)
BEGIN
    INSERT INTO usernames (
        UserName,
        UserID,
        UserTypeID,
        PasswordHash,
        Email
    )
    VALUES (
        p_UserName,
        p_UserID,
        p_UserTypeID,
        p_PasswordHash,
        p_Email
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertIntoUsers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertIntoUsers`(
    IN p_SSN VARCHAR(11),
    IN p_FirstName VARCHAR(50),
    IN p_LastName VARCHAR(50),
    IN p_MiddleName VARCHAR(50),
    IN p_Address1 VARCHAR(255),
    IN p_City VARCHAR(100),
    IN p_State VARCHAR(2),
    IN p_Zip VARCHAR(10),
    IN p_DOB DATE,
    IN p_Phone VARCHAR(20)
)
BEGIN
    INSERT INTO Users (
        SSN, FirstName, LastName, MiddleName,
        Address1, City, State, Zip, DOB, Phone
    ) VALUES (
        p_SSN, p_FirstName, p_LastName, p_MiddleName,
        p_Address1, p_City, p_State, p_Zip, p_DOB, p_Phone
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdatePatientInsurance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdatePatientInsurance`(
    IN p_PatientUserName VARCHAR(50),
    IN p_InsuranceID INT
)
BEGIN
    UPDATE patients
    SET InsuranceID = p_InsuranceID
    WHERE PatientUserName = p_PatientUserName;
END ;;
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

-- Dump completed on 2025-05-06 13:27:10
