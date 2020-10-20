-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: hms
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `ssn` int NOT NULL AUTO_INCREMENT,
  `Patient_id` int NOT NULL,
  `date` date NOT NULL,
  `time` varchar(10) DEFAULT NULL,
  `doctor_id` int NOT NULL,
  PRIMARY KEY (`ssn`),
  KEY `fk_Appointment_Patient1_idx` (`Patient_id`),
  KEY `fk_Appointment_doctor1_idx` (`doctor_id`),
  CONSTRAINT `fk_Appointment_doctor1` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`),
  CONSTRAINT `fk_Appointment_Patient1` FOREIGN KEY (`Patient_id`) REFERENCES `patient` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (7,30300006,'2020-10-20','2:30 PM',10100001),(8,30300004,'2020-10-20','2:30 PM',10100001),(9,30300006,'2020-10-21','10:00 AM',10100002),(10,30300010,'2020-10-20','2:30 PM',10100001);
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone_no` int DEFAULT NULL,
  `qualification` varchar(45) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `speciality` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `doctor_phone_no_uindex` (`phone_no`),
  KEY `fk_doctor_user1_idx` (`username`),
  CONSTRAINT `fk_doctor_user1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10100014 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (10100001,'Koushik Sarker','koushiksk.ks@gmail.com',170000000,'doctor1','doctor1','speciality1'),(10100002,'doctor2.0','doctor2@gmail.com',170000001,'doctor2','doctor2','speciality2'),(10100004,'doctor4','doctor4s@gmail.com',1700000004,'doctor4','doctor4','speciality4'),(10100005,'doctor5','doctor5@gmail.com',1700000005,'doctor5','doctor5','speciality5'),(10100006,'doctor6','doctor6@gmail.com',1700000006,'doctor6','doctor6','speciality6'),(10100012,'doctor12','doctor12@gmail.com',1700000012,'doctor12','doctor12','speciality12'),(10100013,'doctor23','doctor23@gmail.com',170000005,'doctor23','doctor23','speciality1');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_availability`
--

DROP TABLE IF EXISTS `doctor_availability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_availability` (
  `ssn` int NOT NULL AUTO_INCREMENT,
  `day` varchar(45) DEFAULT NULL,
  `start_time` varchar(10) DEFAULT NULL,
  `end_time` varchar(10) DEFAULT NULL,
  `Shift` varchar(45) DEFAULT NULL,
  `patient_limit` int DEFAULT NULL,
  `room` varchar(45) DEFAULT NULL,
  `doctor_id` int NOT NULL,
  PRIMARY KEY (`ssn`),
  KEY `fk_doctor_availablity_doctor1_idx` (`doctor_id`),
  CONSTRAINT `fk_doctor_availablity_doctor1` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_availability`
--

LOCK TABLES `doctor_availability` WRITE;
/*!40000 ALTER TABLE `doctor_availability` DISABLE KEYS */;
INSERT INTO `doctor_availability` VALUES (7,'Sunday','9:08 AM','12:30 PM','Shift1',30,'R101',10100001),(8,'Tuesday','2:30 PM','5:30 PM','Shift1',20,'R101',10100001),(9,'Wednesday','10:00 AM','2:00 PM','Shift1',25,'room',10100002),(10,'Saturday','3:00 PM','6:50 PM','Shift2',35,'d111',10100002);
/*!40000 ALTER TABLE `doctor_availability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone_no` varchar(45) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `sex` enum('FEMALE','MALE','OTHER') DEFAULT NULL,
  `username` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `phone_no_UNIQUE` (`phone_no`),
  KEY `fk_Patient_user1_idx` (`username`),
  CONSTRAINT `fk_Patient_user1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30300011 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (30300004,'patient3','patient3@gmail.com','0170000018','sad',30,'FEMALE','patient3'),(30300006,'patient1','patient1@gmail.com','0170000015','saa',22,'MALE','patient1'),(30300007,'patient2','patient2@gmail.com','0170000014','sad',15,'FEMALE','patient2'),(30300009,'patient4','patient4@gmail.com','0170000012','address 4',13,'FEMALE','patient4'),(30300010,'patient5','patient5@gmail.com','0170000145','01622774014',15,'MALE','patient5');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_limit`
--

DROP TABLE IF EXISTS `patient_limit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_limit` (
  `ssn` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `doctor_avail_ssn` int DEFAULT NULL,
  `limit` int NOT NULL,
  PRIMARY KEY (`ssn`),
  KEY `patient_limit_doctor_availability_ssn_fk` (`doctor_avail_ssn`),
  CONSTRAINT `patient_limit_doctor_availability_ssn_fk` FOREIGN KEY (`doctor_avail_ssn`) REFERENCES `doctor_availability` (`ssn`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_limit`
--

LOCK TABLES `patient_limit` WRITE;
/*!40000 ALTER TABLE `patient_limit` DISABLE KEYS */;
INSERT INTO `patient_limit` VALUES (180,'2020-10-20',8,11),(181,'2020-10-25',7,30),(182,'2020-10-21',9,24),(183,'2020-10-24',10,35);
/*!40000 ALTER TABLE `patient_limit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `department` varchar(45) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone_no` varchar(45) DEFAULT NULL,
  `sex` enum('FEMALE','MALE','OTHER') DEFAULT NULL,
  `salary` int DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `phone_no_UNIQUE` (`phone_no`),
  KEY `fk_Staff_user1_idx` (`username`),
  CONSTRAINT `fk_Staff_user1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20200018 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (20200003,'Staff1','staff1@gmail.com','Department1','Address1','01711111111','MALE',100000,NULL),(20200004,'Staff2','staff2@gmail.com ','dep2','address2','017222222222','MALE',100000,NULL),(20200005,'staff3','staff3@gmail.com','Department1','staff3','01622774190','MALE',24255,'staff3');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `role` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `active` tinyint NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('doctor1','doctor1','DOCTOR','koushiksk.ks@gmail.com',1),('doctor10','doctor10','DOCTOR','doctor10@gmail.com',1),('doctor11','doctor111','DOCTOR','doctor11@gmail.com',1),('doctor12','doctor12','DOCTOR','doctor12@gmail.com',1),('doctor2','doctor2','DOCTOR','doctor2@gmail.com',1),('doctor23','doctor23','DOCTOR','doctor23@gmail.com',1),('doctor3','doctor3','DOCTOR','doctor3@gmail.com',1),('doctor4','doctor4','DOCTOR','doctor4s@gmail.com',1),('doctor5','doctor5','DOCTOR','doctor5@gmail.com',1),('doctor6','doctor6','DOCTOR','doctor6@gmail.com',1),('doctor7','doctor7','DOCTOR','doctor7@gmail.com',1),('doctor8','doctor8','DOCTOR','doctor8@gmail.com',1),('doctor9','doctor9','DOCTOR','doctor9@gmail.com',1),('patient1','patient1','PATIENT','patient1@gmail.com',1),('patient2','patient2','PATIENT','patient2@gmail.com',1),('patient3','patient3','PATIENT','patient3@gmail.com',1),('patient4','patient4','PATIENT','patient4@gmail.com',1),('patient5','patient5','PATIENT','patient5@gmail.com',1),('staff3','staff3','STAFF','staff3@gmail.com',1),('staff6','staff6','STAFF','staff6@gmail.com',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-20 19:36:11
