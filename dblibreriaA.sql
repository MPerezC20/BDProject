-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dblibreria
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `accounts_customuser`
--

DROP TABLE IF EXISTS `accounts_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_customuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_customuser`
--

LOCK TABLES `accounts_customuser` WRITE;
/*!40000 ALTER TABLE `accounts_customuser` DISABLE KEYS */;
INSERT INTO `accounts_customuser` VALUES (1,'pbkdf2_sha256$1000000$29sKkbHdt6QG5WR068tf0L$Kr2uKFHbsFN39CygFM0zKbJdPdg3/noU5XZ4PL6mmOI=','2025-06-30 23:39:40.228543',0,'Yun','','','kimerashima23@gmail.com',0,1,'2025-06-30 20:48:11.128460','+507 62848732'),(2,'pbkdf2_sha256$1000000$mhKKmvEsSd2MEPKGsCAqYe$EjmRxRX8NTg7sMKG1sm8Uu0xpB4cBcnwQOgtuobt924=','2025-07-04 14:28:37.962062',0,'Nashley','','','ashley.perez2@utp.ac.pa',0,1,'2025-07-04 14:28:36.995083','64528587');
/*!40000 ALTER TABLE `accounts_customuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_customuser_groups`
--

DROP TABLE IF EXISTS `accounts_customuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_customuser_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_customuser_groups_customuser_id_group_id_c074bdcb_uniq` (`customuser_id`,`group_id`),
  KEY `accounts_customuser_groups_group_id_86ba5f9e_fk_auth_group_id` (`group_id`),
  CONSTRAINT `accounts_customuser__customuser_id_bc55088e_fk_accounts_` FOREIGN KEY (`customuser_id`) REFERENCES `accounts_customuser` (`id`),
  CONSTRAINT `accounts_customuser_groups_group_id_86ba5f9e_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_customuser_groups`
--

LOCK TABLES `accounts_customuser_groups` WRITE;
/*!40000 ALTER TABLE `accounts_customuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_customuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_customuser_user_permissions`
--

DROP TABLE IF EXISTS `accounts_customuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_customuser_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_customuser_user_customuser_id_permission_9632a709_uniq` (`customuser_id`,`permission_id`),
  KEY `accounts_customuser__permission_id_aea3d0e5_fk_auth_perm` (`permission_id`),
  CONSTRAINT `accounts_customuser__customuser_id_0deaefae_fk_accounts_` FOREIGN KEY (`customuser_id`) REFERENCES `accounts_customuser` (`id`),
  CONSTRAINT `accounts_customuser__permission_id_aea3d0e5_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_customuser_user_permissions`
--

LOCK TABLES `accounts_customuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `accounts_customuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_customuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_customuser'),(22,'Can change user',6,'change_customuser'),(23,'Can delete user',6,'delete_customuser'),(24,'Can view user',6,'view_customuser'),(25,'Can add libro',7,'add_libro'),(26,'Can change libro',7,'change_libro'),(27,'Can delete libro',7,'delete_libro'),(28,'Can view libro',7,'view_libro');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biblioteca_libro`
--

DROP TABLE IF EXISTS `biblioteca_libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `biblioteca_libro` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `titulo` varchar(200) NOT NULL,
  `autor` varchar(100) NOT NULL,
  `editorial` varchar(100) NOT NULL,
  `fecha_publicacion` date NOT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `paginas` int NOT NULL,
  `disponible` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `isbn` (`isbn`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biblioteca_libro`
--

LOCK TABLES `biblioteca_libro` WRITE;
/*!40000 ALTER TABLE `biblioteca_libro` DISABLE KEYS */;
INSERT INTO `biblioteca_libro` VALUES (1,'Cien años de soledad','Gabriel García Márquez','Alfaguara','1967-05-30','9788437604947',432,1),(2,'Don Quijote de la Mancha','Miguel de Cervantes','Alianza','1605-01-16','9788420412146',928,1),(3,'El principito','Antoine de Saint-Exupéry','Salamandra','1943-04-06','9788426135267',96,1),(4,'La chica del tren','Paula Hawkins','Planeta','2015-01-13','9788423347969',416,1),(5,'El señor de los anillos','J.R.R. Tolkien','Minotauro','1954-07-29','9788445000664',1216,1),(6,'It (Eso)','Stephen King','Debolsillo','1986-09-15','9788490328729',1504,1),(7,'El código Da Vinci','Dan Brown','Doubleday','2003-03-18','9780307474278',656,1),(8,'Orgullo y prejuicio','Jane Austen','Alma','1813-01-28','9788484286362',432,1),(9,'Harry Potter y la piedra filosofal','J.K. Rowling','Salamandra','1997-06-26','9788469841471',264,1),(10,'El silencio de los corderos','Thomas Harris','Plaza & Janés','1988-08-29','9788401021350',416,1),(11,'Juego de tronos','George R.R. Martin','Gigamesh','1996-08-01','9788498381491',800,1),(12,'Drácula','Bram Stoker','Alianza','1897-05-26','9788497593878',512,1);
/*!40000 ALTER TABLE `biblioteca_libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `Id_Compra` int NOT NULL AUTO_INCREMENT,
  `Fecha_deCompra` date DEFAULT NULL,
  `Nom_Usuario` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id_Compra`),
  KEY `Nom_Usuario` (`Nom_Usuario`),
  CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`Nom_Usuario`) REFERENCES `usuario` (`Nom_Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (1,'2023-05-10','anaruiz'),(2,'2023-05-12','juanperez'),(3,'2023-05-15','mlopez'),(4,'2023-05-18','cgarcia'),(5,'2023-05-20','dvaldez');
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallecompra`
--

DROP TABLE IF EXISTS `detallecompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detallecompra` (
  `Id_Compra` int NOT NULL,
  `ISBN` varchar(20) NOT NULL,
  `Cantidad` int DEFAULT NULL,
  PRIMARY KEY (`Id_Compra`,`ISBN`),
  KEY `ISBN` (`ISBN`),
  CONSTRAINT `detallecompra_ibfk_1` FOREIGN KEY (`Id_Compra`) REFERENCES `compra` (`Id_Compra`),
  CONSTRAINT `detallecompra_ibfk_2` FOREIGN KEY (`ISBN`) REFERENCES `libro` (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallecompra`
--

LOCK TABLES `detallecompra` WRITE;
/*!40000 ALTER TABLE `detallecompra` DISABLE KEYS */;
INSERT INTO `detallecompra` VALUES (1,'978-8426135267',2),(1,'978-8437604947',1),(2,'978-8445000664',1),(3,'978-8420412146',1),(3,'978-8423347969',1),(3,'978-8490328729',1),(4,'978-0307474278',2),(5,'978-8466657662',1),(5,'978-8498381491',1);
/*!40000 ALTER TABLE `detallecompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_accounts_customuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_customuser` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (6,'accounts','customuser'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(7,'biblioteca','libro'),(4,'contenttypes','contenttype'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-06-28 06:53:28.184237'),(2,'contenttypes','0002_remove_content_type_name','2025-06-28 06:53:28.525576'),(3,'auth','0001_initial','2025-06-28 06:53:29.425620'),(4,'auth','0002_alter_permission_name_max_length','2025-06-28 06:53:29.622892'),(5,'auth','0003_alter_user_email_max_length','2025-06-28 06:53:29.639164'),(6,'auth','0004_alter_user_username_opts','2025-06-28 06:53:29.657509'),(7,'auth','0005_alter_user_last_login_null','2025-06-28 06:53:29.689179'),(8,'auth','0006_require_contenttypes_0002','2025-06-28 06:53:29.700124'),(9,'auth','0007_alter_validators_add_error_messages','2025-06-28 06:53:29.719050'),(10,'auth','0008_alter_user_username_max_length','2025-06-28 06:53:29.736221'),(11,'auth','0009_alter_user_last_name_max_length','2025-06-28 06:53:29.751128'),(12,'auth','0010_alter_group_name_max_length','2025-06-28 06:53:29.796605'),(13,'auth','0011_update_proxy_permissions','2025-06-28 06:53:29.812447'),(14,'auth','0012_alter_user_first_name_max_length','2025-06-28 06:53:29.827470'),(15,'accounts','0001_initial','2025-06-28 06:53:30.878921'),(16,'admin','0001_initial','2025-06-28 06:53:31.329474'),(17,'admin','0002_logentry_remove_auto_add','2025-06-28 06:53:31.346213'),(18,'admin','0003_logentry_add_action_flag_choices','2025-06-28 06:53:31.365673'),(19,'biblioteca','0001_initial','2025-06-28 06:53:31.477340'),(20,'sessions','0001_initial','2025-06-28 06:53:31.598221');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('k0l9dggwv58wzd3pdovjsf4bp01cxe0s','.eJxVjMEOgjAQRP-lZ9NQ6NLWo3e-odntbgU1JaFwMv67kHDQ22Tem3mriNs6xq3KEidWV2XU5bcjTE8pB-AHlvus01zWZSJ9KPqkVQ8zy-t2un8HI9ZxX7dOArC1KZAAN2nPKA2A7Xoy4Alcwp6RKfSdxSy2zeSZfTYZwBGrzxf1RjjN:1uWO68:A5R7O4ZLAxeVcvRILmrjIvvCXoxyvJsHbzi_5S8q8CU','2025-07-14 23:39:40.277578');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `Id_Local` varchar(20) NOT NULL,
  `ISBN` varchar(20) NOT NULL,
  `Cantidad_disponible` int DEFAULT NULL,
  `Costo` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Id_Local`,`ISBN`),
  KEY `ISBN` (`ISBN`),
  CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`Id_Local`) REFERENCES `local` (`Id_Local`),
  CONSTRAINT `inventario_ibfk_2` FOREIGN KEY (`ISBN`) REFERENCES `libro` (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
INSERT INTO `inventario` VALUES ('LOC001','978-6073160570',26,10.18),('LOC001','978-8432238616',30,13.12),('LOC001','978-8437602330',18,9.97),('LOC001','978-8437621661',14,15.20),('LOC001','978-8484286362',30,14.90),('LOC001','978-8497592208',10,16.58),('LOC001','978-8497892071',22,13.72),('LOC001','978-9684113465',15,15.59),('LOC001','978-9871138133',14,18.00),('LOC002','978-6070754000',26,11.93),('LOC002','978-8432218564',29,11.44),('LOC002','978-8437602385',22,11.68),('LOC002','978-8466369879',13,12.27),('LOC002','978-8469841471',20,17.10),('LOC002','978-8490328729',17,15.44),('LOC002','978-9505470945',18,16.86),('LOC003','978-8437606918',30,13.81),('LOC003','978-8466657662',25,16.10),('LOC003','978-8478887395',13,14.71),('LOC003','978-8498381491',16,10.02),('LOC003','978-8498383624',24,8.48),('LOC003','978-9584232638',29,14.82),('LOC003','978-9681660702',25,17.29),('LOC004','978-0307474278',17,11.55),('LOC004','978-6073134984',23,8.15),('LOC004','978-8415618839',15,17.20),('LOC004','978-8437602392',24,12.38),('LOC004','978-9584232645',30,17.27),('LOC004','978-9681604782',18,11.97),('LOC005','978-0307743656',25,13.40),('LOC005','978-6071129159',11,10.88),('LOC005','978-8420412146',11,11.30),('LOC005','978-8432316966',10,16.81),('LOC005','978-8437606963',10,11.94),('LOC005','978-8437607097',26,14.15),('LOC005','978-8498387087',12,11.78),('LOC006','978-0545582889',14,9.50),('LOC006','978-6070723488',29,17.77),('LOC006','978-8420674209',14,19.20),('LOC006','978-8437600657',17,16.63),('LOC006','978-8472236151',13,13.43),('LOC007','978-6070737904',29,13.52),('LOC007','978-6073158454',13,18.83),('LOC007','978-8423347969',19,14.50),('LOC007','978-8426135267',14,12.20),('LOC007','978-8432239456',10,10.26),('LOC007','978-8437602378',13,12.87),('LOC007','978-9588886042',19,8.40),('LOC008','978-6071105788',13,10.77),('LOC008','978-6074215552',25,11.40),('LOC008','978-8433966717',11,11.49),('LOC008','978-8437602361',17,17.73),('LOC008','978-8437604947',25,11.70),('LOC008','978-8490323762',10,9.24),('LOC009','978-8401021350',14,16.50),('LOC009','978-8420464177',25,10.78),('LOC009','978-8437612589',19,9.35),('LOC009','978-8478884455',26,14.60),('LOC009','978-8497593878',10,18.74),('LOC010','978-6070744361',25,15.12),('LOC010','978-8408183615',20,14.20),('LOC010','978-8437602177',13,14.25),('LOC010','978-8437604204',11,10.00),('LOC010','978-8445000664',12,11.70),('LOC010','978-8498383638',15,11.29);
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro`
--

DROP TABLE IF EXISTS `libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libro` (
  `ISBN` varchar(20) NOT NULL,
  `Titulo` varchar(100) DEFAULT NULL,
  `Autor` varchar(100) DEFAULT NULL,
  `Editorial` varchar(100) DEFAULT NULL,
  `Genero` varchar(50) DEFAULT NULL,
  `descripcion` text,
  `UrlPDF` varchar(255) DEFAULT NULL,
  `PortadaURL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro`
--

LOCK TABLES `libro` WRITE;
/*!40000 ALTER TABLE `libro` DISABLE KEYS */;
INSERT INTO `libro` VALUES ('978-0307474278','El código Da Vinci','Dan Brown','Doubleday','Ficcion','El código Da Vinci es un thriller de misterio escrito por Dan Brown y publicado en 2003. La historia sigue al profesor de simbología Robert Langdon, quien investiga un asesinato en el Museo del Louvre. La víctima, Jacques Saunière, dejó pistas en obras de Leonardo da Vinci, revelando un secreto sobre el linaje de Jesucristo y María Magdalena. Langdon y la criptóloga Sophie Neveu descifran códigos ocultos mientras huyen de la policía y el Opus Dei, desenterrando una conspiración que desafía la historia del cristianismo. El libro mezcla arte, religión y suspense, generando controversia mundial.','http://example.com/pdf/codigo-davinci.pdf','https://covers.openlibrary.org/b/id/14540893-L.jpg'),('978-0307743656','Carrie','Stephen King','Debolsillo','Terror','Carrie White es una adolescente tímida y retraída, víctima del bullying escolar y del fanatismo religioso de su madre. Al descubrir que posee poderes telequinéticos, su vida cambia drásticamente. Todo explota el día del baile de graduación, cuando una humillación final desata su furia y transforma la noche en una pesadilla sangrienta. Una obra icónica del terror que aborda la crueldad adolescente, la represión y la venganza.','http://ejemplo.com/carrie.pdf','https://cdn1.booknode.com/book_cover/5031/full/carrie-5030937.jpg'),('978-0545582889','Harry Potter y el prisionero de Azkaban','J.K. Rowling','Salamandra','Fantasía','En su tercer año en el Colegio Hogwarts, Harry se entera de que un peligroso criminal, Sirius Black, ha escapado de la prisión de Azkaban aparentemente para encontrarlo. Mientras descubre verdades ocultas sobre sus padres y su conexión con Sirius, Harry también se enfrenta a criaturas llamadas Dementores que amenazan con absorberle la felicidad. Con nuevos aliados, como el profesor Lupin y la mágica criatura Buckbeak, Harry debe aprender a enfrentarse no solo a enemigos exteriores, sino también a los miedos internos que lo atormentan.','http://ejemplo.com/hp3.pdf','https://horadelrecreo.com/wp-content/uploads/2020/02/harry-potter-y-el-prisionero-de-azkaban-640x1024.jpg'),('978-6070723488','Un paseo para recordar','Nicholas Sparks','Roca Editorial','Romance','Landon y Jamie, dos jóvenes de mundos diferentes, se enamoran en un contexto escolar, enfrentando juntos un destino inesperado.','http://example.com/pdf/paseo-recordar.pdf','https://images.cdn1.buscalibre.com/fit-in/360x360/e2/6b/e26b1264e282ae137862f2fb2dcf8e56.jpg'),('978-6070737904','Cartas a Julieta','Lise Friedman','Aguilar','Romance','Relato real sobre las cartas que miles de personas escriben a Julieta en Verona, buscando consejo amoroso. Una historia sobre esperanza y el amor eterno.','http://example.com/pdf/julieta.pdf','https://images.cdn1.buscalibre.com/fit-in/360x360/95/da/95da6ef41368596ce8cced0e3b2a36c7.jpg'),('978-6070744361','Poemas de la oficina','Mario Benedetti','Planeta','Poesía','Una serie de poemas que retratan la monotonía de la vida laboral y los sueños que se esconden detrás de los escritorios.','http://example.com/pdf/poemas-oficina.pdf','https://m.media-amazon.com/images/I/81F7goMJlHL._SL1500_.jpg'),('978-6070754000','Orgullo y prejuicio y zombis','Seth Grahame-Smith','Umbriel','Romance','Una parodia de la clásica novela de Jane Austen, que introduce zombis en la Inglaterra del siglo XIX mientras Elizabeth Bennet combate monstruos y el amor.','http://example.com/pdf/pride-zombies.pdf','https://epocadistribuciones.com/5831-large_default/orgullo-y-prejuicio-y-zombis.jpg'),('978-6071105788','La mecánica del corazón','Mathias Malzieu','Anagrama','Romance','Jack nació con el corazón dañado y vive con un reloj en su pecho. Le advierten que no debe enamorarse, pero entonces conoce a Miss Acacia.','http://example.com/pdf/mecanica-corazon.pdf','https://m.media-amazon.com/images/I/81Vvs+D+x0L._SL1500_.jpg'),('978-6071129159','Perdona si te llamo amor','Federico Moccia','Planeta','Romance','Alex, de 37 años, conoce a Niki, una adolescente de 17. Entre ellos nace un amor imposible que desafía los prejuicios y la diferencia de edad.','http://example.com/pdf/perdona-amor.pdf','https://images.cdn1.buscalibre.com/fit-in/360x360/ff/09/ff0944fa7b5bfca5b4abbf8661df7fd3.jpg'),('978-6073134984','Tres metros sobre el cielo','Federico Moccia','Planeta','Romance','Una historia de amor entre Babi, una joven de clase alta, y Step, un chico rebelde, que luchan contra las diferencias sociales y sus propias emociones.','http://example.com/pdf/tres-metros.pdf','https://m.media-amazon.com/images/I/41p7PRaUM3L.jpg'),('978-6073158454','Wonder','R. J. Palacio','Nube de Tinta','Infantil','August Pullman, conocido como Auggie, es un niño con una deformidad facial que ha sido educado en casa hasta los 10 años. Cuando se enfrenta por primera vez a la escuela tradicional, debe aprender a lidiar con las miradas, los prejuicios y el rechazo. Pero también descubrirá el poder de la amistad, la empatía y la valentía. Narrada desde múltiples perspectivas, esta historia emotiva enseña a ver más allá de las apariencias y valorar la bondad como una fuerza transformadora.','http://ejemplo.com/wonder.pdf','https://solo-libros.com/wp-content/uploads/2022/02/libro-de-preceptos-del-senor-Browne.jpg'),('978-6073160570','Bajo la misma estrella','John Green','Nube de Tinta','Romance','Hazel y Gus son dos adolescentes con cáncer que se conocen en un grupo de apoyo. Juntos emprenden un viaje para conocer a su autor favorito y, en el camino, descubren el amor, la vida y la pérdida.','http://example.com/pdf/bajo-estrella.pdf','https://www.miblogdecineytv.com/wp-content/uploads/2014/06/Bajo-la-Misma-Estrella.jpg'),('978-6074215552','El psicoanalista','John Katzenbach','Ediciones B','Suspenso','El Dr. Frederick Starks, un reconocido psicoanalista de Nueva York, recibe una carta anónima en la que se le acusa de arruinar una vida. Tiene quince días para descubrir la identidad de su acosador o ver su mundo destruido. A medida que el juego avanza, se ve arrastrado a una espiral de manipulación, amenazas y confrontación con su propia mente. Una obra maestra del thriller psicológico que plantea hasta dónde puede llegar alguien para sobrevivir cuando la lógica y la razón dejan de funcionar.','http://ejemplo.com/psicoanalista.pdf','https://www.delectura.com/wp-content/uploads/2020/03/el-psicoanalista.jpg'),('978-8401021350','El silencio de los corderos','Thomas Harris','Plaza & Janés','Suspenso','Su título original en inglés es The Silence of the Lambs , es una película norteamericana estrenada en 1991, basada en una novela de Thomas Harris que cuenta con las actuaciones de Jodie Foster, Anthony Hopkins y Scott Glenn, todos dirigidos por Jonathan Demme; y que narra la labor de un grupo de especialistas de perfiles que se acercan a un ex-analista del FBI, acusado de canibalismo, para que ayude en la captura de Buffalo Bill, un asesino en serie que mata a chicas jóvenes y les arranca la piel del cuerpo.','http://example.com/pdf/silencio-corderos.pdf','https://covers.openlibrary.org/b/id/9255930-L.jpg'),('978-8408183615','Donde viven los monstruos','Maurice Sendak','Kalandraka','Infantil','\"Donde viven los monstruos\" es un libro que cuenta la historia de Max, un niño incomprendido y rebelde cuya mayor fantasía es ser un monstruo que aterrorice a cualquiera. Una noche, después de hacer maldades y travesuras en su casa, su madre lo castiga a irse a su habitación, la cual de pronto sufre una transformación y se convierte en una selva. En el mundo de los monstruos, Max es proclamado rey, pero pronto descubre que estaba equivocado. Es un álbum clásico leído por millones de niños y niñas de todo el mundo. ','http://example.com/pdf/monstruos.pdf','https://covers.openlibrary.org/b/id/7304774-L.jpg'),('978-8415618839','Frankenstein','Mary Shelley','Penguin Clásicos','Terror','Aprende el resumen de Frankenstein de Mary Shelley la cual es una novela de terror gótica sobre un hombre llamado Victor Frankenstein que descubre el secreto para crear vida. Utiliza este conocimiento para formar un monstruo horrible, que se convierte en la fuente de su miseria y desaparición.','http://example.com/pdf/frankenstein.pdf','https://covers.openlibrary.org/b/id/12752093-L.jpg'),('978-8420412146','Don Quijote de la Mancha','Miguel de Cervantes','Alianza','Clasico','Don Quijote de la Mancha, obra maestra de Miguel de Cervantes publicada en 1605, es considerada la primera novela moderna y una joya fundamental de la literatura universal. La historia sigue a Alonso Quijano, un noble que, tras leer numerosas novelas de caballería, se obsesiona con convertirse en caballero andante y asume el nombre de  Don Quijote. Acompañado por su escudero Sancho Panza, se embarca en una serie de aventuras que reflejan la locura y la idealización de la caballería. La obra, rica en sátira y reflexión sobre la realidad y la ficción, presenta una diversidad de personajes y se divide en dos tomos; el primero narra la locura de Don Quijote y el segundo su regreso a la lucidez, culminando en su trágico final. La relación entre Don Quijote y Sancho es central en la obra, provocando diálogos hilarantes y situaciones ingeniosas. Cervantes, conocido como el “Príncipe de los ingenios”, dejó un legado que ha influido profundamente en la literatura y la cultura mundial.','http://example.com/pdf/quijote.pdf','https://covers.openlibrary.org/b/id/13642228-L.jpg'),('978-8420464177','El amor, las mujeres y la vida','Mario Benedetti','Seix Barral','Poesía','Una antología de poemas sobre el amor en sus diversas formas: la pasión, la ausencia, la ternura y el deseo.','http://example.com/pdf/amor-mujeres.pdf','https://www.penguinlibros.com/mx/1716712-thickbox_default/el-amor-las-mujeres-y-la-vida.jpg'),('978-8420674209','Moby Dick','Herman Melville','Alianza','Clasico','Clásico de la literatura universal, \"Moby Dick\" narra la obsesiva búsqueda del capitán Ahab por vengarse de la ballena blanca que le arrancó una pierna. A través de los ojos de Ismael, un joven marinero que se une al ballenero Pequod, la obra explora temas como la locura, la naturaleza indomable y el conflicto entre el hombre y la divinidad. Melville combina narrativa aventurera con reflexiones filosóficas y detalles técnicos sobre la caza de ballenas, creando una metáfora sobre la lucha contra lo imposible. La frase \"¡Llámame Ismael!\" es una de las más célebres de la literatura.','http://example.com/pdf/moby-dick.pdf','https://covers.openlibrary.org/b/id/13786943-L.jpg'),('978-8423347969','La chica del tren','Paula Hawkins','Planeta','Suspenso','Thriller psicológico que sigue a Rachel, una mujer alcohólica que espía a una pareja perfecta desde el tren hasta que un día presencia algo impactante. Cuando la mujer (Megan) desaparece, Rachel se ve involucrada en la investigación, aunque su memoria fragmentada por el alcohol la convierte en una testigo poco fiable. La historia alterna perspectivas entre Rachel, Megan y Anna (la nueva esposa del exmarido de Rachel), revelando secretos oscuros y giros inesperados. La novela explora temas como la adicción, la violencia doméstica y las mentiras que ocultamos, convirtiéndose en un bestseller global adaptado al cine en 2016.','http://example.com/pdf/chica-tren.pdf','https://covers.openlibrary.org/b/id/7395624-L.jpg'),('978-8426135267','El principito','Antoine de Saint-Exupéry','Salamandra','Infantil','El Principito es una novela escrita por el aviador Antoine de Saint Exupéry en 1943. Se trata de uno de los libros más vendidos, traducidos y leídos a nivel mundial, esta relata la historia de un niño proveniente de un asteroide que decide emprender un viaje a través del cual conocerá personajes muy peculiares, que lo harán cuestionarse sobre el comportamiento de los adultos y reflexionar acerca de los aspectos más importantes de la vida. Es una novela corta, apta para todo público, de carácter poético, crítico, reflexivo y filosófico, que invita a replantear nuestra visión con respecto a las cosas que son realmente importantes para la humanidad, tales como la amistad, el amor y el afecto, asimismo, el desarrollo de la historia se presenta acompañado por ilustraciones sencillas que muestran a algunos personajes, escenarios y situaciones vividas en el libro.','http://example.com/pdf/principito.pdf','https://covers.openlibrary.org/b/id/13529309-L.jpg'),('978-8432218564','Rayuela','Julio Cortázar','Cátedra','Experimental','Edición especial de la famosa novela que permite un abordaje más profundo de su carácter fragmentario y polifónico.','http://example.com/pdf/rayuela-ed.pdf','https://m.media-amazon.com/images/I/61Hje5q9CRL.jpg'),('978-8432238616','Niebla','Miguel de Unamuno','Cátedra','Experimental','Augusto Pérez, protagonista de esta “nivola”, reflexiona sobre su existencia y llega a discutir con el propio autor.','http://example.com/pdf/niebla.pdf','https://www.loqueleo.es/uploads/2017/10/resized/600_9788491221777-niebla.jpg'),('978-8432239456','Finnegans Wake','James Joyce','Alianza','Experimental','Una de las obras más complejas del siglo XX. Joyce mezcla lenguas, símbolos y sueños en una narración sin estructura tradicional.','http://example.com/pdf/finnegans.pdf','https://m.media-amazon.com/images/I/71SyA9mSusL.jpg'),('978-8432316966','2666','Roberto Bolaño','Anagrama','Experimental','Una obra colosal dividida en cinco partes aparentemente desconectadas que giran en torno a la desaparición de mujeres en Santa Teresa, un alter ego de Ciudad Juárez.','http://example.com/pdf/2666.pdf','https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1672791535i/63032.jpg'),('978-8433966717','Los detectives salvajes','Roberto Bolaño','Anagrama','Experimental','Dos poetas, Arturo Belano y Ulises Lima, exploran los márgenes de la poesía y la vida en un viaje por México, África y Europa.','http://example.com/pdf/detectives.pdf','https://images.cdn3.buscalibre.com/fit-in/360x360/a8/24/a824831c1fa3b11433f118b9ab4d9e7b.jpg'),('978-8437600657','La casa de hojas','Mark Z. Danielewski','Alpha Decay','Experimental','Una novela laberíntica con múltiples narradores y tipografía no convencional que explora la locura y lo inexplicable en una casa que cambia de tamaño.','http://example.com/pdf/hojas.pdf','https://m.media-amazon.com/images/I/61MdP7kIoNL._SL1500_.jpg'),('978-8437602177','El hacedor','Jorge Luis Borges','Alianza','Experimental','Relatos breves, poemas y ensayos que desafían la realidad y el lenguaje en un juego constante con lo infinito y lo imposible.','http://example.com/pdf/hacedor.pdf','https://www.ecured.cu/images/1/11/El_hacedor_libro.jpg'),('978-8437602330','Prometeo encadenado','Esquilo','Cátedra','Clásico griego','Prometeo sufre el castigo de los dioses por entregar el fuego a los humanos.','http://example.com/pdf/prometeo.pdf','https://editorialverbum.es/wp-content/uploads/2023/01/Cubierta-PROMETEO-ENCADENADO.jpg'),('978-8437602361','Edipo Rey','Sófocles','Cátedra','Clásico griego','Edipo trata de salvar Tebas de una plaga, pero descubre que él mismo es el culpable del castigo divino.','http://example.com/pdf/edipo.pdf','https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1660705979i/62000880.jpg'),('978-8437602378','Antígona','Sófocles','Cátedra','Clásico griego','Antígona desafía la ley del rey Creonte al querer enterrar a su hermano. Un drama sobre el deber moral y el conflicto entre leyes humanas y divinas.','http://example.com/pdf/antigona.pdf','https://elrinconliterario.com/wp-content/uploads/portada-del-libro-antigona-7041138-1099x1536.jpg'),('978-8437602385','Las Bacantes','Eurípides','Cátedra','Clásico griego','Penteo desafía al dios Dionisio y paga un alto precio. Obra que explora la irracionalidad, la religión y el castigo.','http://example.com/pdf/bacantes.pdf','https://www.isliada.org/static/images/2023/02/Las-bacantes-768x1084.jpg'),('978-8437602392','Las suplicantes','Esquilo','Cátedra','Clásico griego','Obra en la que las hijas de Dánao huyen del matrimonio forzado y buscan asilo en Argos.','http://example.com/pdf/suplicantes.pdf','https://info-biblioteca.mincyt.gob.ve/wp-content/uploads/2024/05/Las_Suplicantes-Esquilo-md.jpg'),('978-8437604204','Electra','Eurípides','Cátedra','Clásico griego','Electra y su hermano Orestes buscan vengar la muerte de su padre Agamenón, asesinado por su esposa Clitemnestra.','http://example.com/pdf/electra.pdf','https://m.media-amazon.com/images/I/71CVdyN7yXL._SY385_.jpg'),('978-8437604947','Cien años de soledad','Gabriel García Márquez','Alfaguara','Ficcion','\"Cien años de soledad\" es una novela escrita por Gabriel García Márquez que narra la historia de la familia Buendía a lo largo de siete generaciones en el pueblo ficticio de Macondo. La obra explora temas como el realismo mágico, la soledad y el destino, mostrando cómo los eventos históricos y las tragedias personales se entrelazan en la vida de los personajes. A través de la vida de José Arcadio Buendía y su esposa Úrsula Iguarán, se retratan las luchas y los sueños de una familia marcada por la repetición de patrones y la fatalidad. ','http://example.com/pdf/cien-anos.pdf','https://covers.openlibrary.org/b/id/14831384-L.jpg'),('978-8437606918','Las flores del mal','Charles Baudelaire','Cátedra','Poesía','Una colección poética provocadora que explora la decadencia, el erotismo, la muerte y el spleen de la existencia.','http://example.com/pdf/flores-mal.pdf','https://1.bp.blogspot.com/-Axd04o5SEMU/YGOEsJc3GsI/AAAAAAAAS5s/JHfIDeFw_5AzaETj4deSIVfkSK8F5BrIACLcBGAsYHQ/s855/Las_flores_del_mal_SOLOWEB.jpg'),('978-8437606963','Altazor','Vicente Huidobro','Cátedra','Poesía','Un viaje lírico y experimental a través del lenguaje, la ruptura de formas y la vanguardia poética.','http://example.com/pdf/altazor.pdf','https://www.ecolectura.cl/Content/Images/Libros/Altazor_o_el_viaje_e_223915004.jpg'),('978-8437607097','El gato con botas','Charles Perrault','Anaya','Infantil','Un astuto gato logra que su dueño pase de la pobreza a la nobleza con ingenio, disfraces y un par de botas elegantes.','http://example.com/pdf/gato.pdf','https://www.isliada.org/static/images/2023/01/El-gato-con-botas-1-500x750.jpg'),('978-8437612589','Pedro Páramo','Juan Rulfo','Cátedra','Experimental','Juan Preciado viaja a Comala para buscar a su padre. Pero la ciudad parece habitada por fantasmas. Un clásico del realismo mágico.','http://example.com/pdf/pedro-paramo.pdf','https://www.universilibros.com/images/stories/virtuemart/product/1872_1.jpg'),('978-8437621661','La metamorfosis','Franz Kafka','Cátedra','Clásico','Gregor Samsa, un joven viajante de comercio, despierta una mañana transformado en un insecto monstruoso. Atrapado en su habitación, marginado por su familia y víctima de la indiferencia, la historia expone la alienación del individuo moderno, la deshumanización de las relaciones familiares y la incomprensión social. Escrita con una prosa sobria y simbólica, esta obra es un hito del existencialismo y la literatura absurda del siglo XX.','http://ejemplo.com/metamorfosis.pdf','https://cdn.agapea.com//Editorial-LIBSA-S-A-/La-Metamorfosis-i6n15704524.jpg'),('978-8445000664','El señor de los anillos','J.R.R. Tolkien','Minotauro','Fantasia','Es el primer libro de la trilogía \"El Señor de los Anillos\". La historia sigue las aventuras de un joven hobbit llamado Frodo , quien hereda un poderoso y peligroso anillo mágico. Junto con un variado grupo de personajes, incluyendo a hobbits, humanos, enanos y elfos, Frodo emprende un viaje épico para destruir el anillo en el Monte del Destino y evitar que caiga en manos del malvado Señor Oscuro Sauron. A lo largo de su viaje, la Comunidad enfrenta numerosos peligros y desafíos mientras luchan contra las fuerzas oscuras que buscan recuperar el anillo. Es la lucha entre el bien y el mal en un mundo de fantasía lleno de criaturas, magia y conflictos épicos.','http://example.com/pdf/senor-anillos.pdf','https://proassetspdlcom.cdnstatics2.com/usuaris/libros/thumbs/24fb5128-9aaf-4802-8222-047db4b93ef3/d_1200_1200/portada_el-senor-de-los-anillos_j-r-r-tolkien_201601252224.webp'),('978-8466369879','Antología poética','César Vallejo','Alianza','Poesía','Selección de poemas de uno de los grandes innovadores del verso en español, centrado en el sufrimiento, la fe y la esperanza.','http://example.com/pdf/vallejo.pdf','https://postdataediciones.com/wp-content/uploads/2021/08/Portada-Andrea_Antologia-PD-scaled.jpg'),('978-8466657662','El nombre del viento','Patrick Rothfuss','Plaza & Janés','Fantasia','The Name of the Wind es la primera entrega de la serie «The Kingkiller Chronicle» del autor Patrick Rothfuss. Es una novela de fantasía que fue publicada en 2007 y ha recibido una valoración positiva por parte de los lectores.\nLa historia comienza cuando el protagonista, Kvothe, decide contarle su vida al Cronista, un escriba que busca recopilar historias legendarias. Kvothe relata su infancia como niño de la calle y su ingreso a la Universidad, donde estudia magia y se enfrenta a desafíos y rivales. El mundo en el que se desarrolla la historia está ambientado en una especie de Edad Media, donde la magia es una disciplina respetada y estudiada.','http://example.com/pdf/nombre-viento.pdf','https://covers.openlibrary.org/b/id/10526441-L.jpg'),('978-8469841471','Harry Potter y la piedra filosofal','J.K. Rowling','Salamandra','Fantasía','Harry Potter y la piedra filosofal cuenta la historia de un huérfano de once años que repentinamente descubre que es un mago. J.K. Rowling comienza a escribir el libro en 1990, en un viaje en tren de Manchester a Londres durante el cual se le presenta la idea de un niño con poderes mágicos. Al describir su pensamiento en aquella época, Rowling escribe: \"un niño flaco, pequeño, de cabello negro y con anteojos se fue transformando cada vez más en un mago frente a mí... Comencé a escribir La piedra filosofal esa misma noche. Sin embargo, las primeras páginas no se parecen en nada al producto final\".','http://example.com/pdf/harry-potter.pdf','https://covers.openlibrary.org/b/id/14925450-L.jpg'),('978-8472236151','La voz a ti debida','Pedro Salinas','Tusquets','Poesía','Poemario de amor donde Salinas reflexiona sobre la presencia, el deseo y el misterio del ser amado.','http://example.com/pdf/voz-tidebida.pdf','https://ww2.ebookelo.com/images/cover/12602.jpg'),('978-8478884455','Medea','Eurípides','Vicens Vives','Clásico griego','Medea, traicionada por Jasón, toma venganza extrema asesinando a sus propios hijos. Una tragedia de dolor, ira y ruptura moral.','http://example.com/pdf/medea.pdf','https://www.marcialpons.es/media/img/portadas/2023/9/21/9788424940713.jpg'),('978-8478887395','Áyax','Sófocles','Vicens Vives','Clásico griego','Áyax, tras no recibir las armas de Aquiles, enloquece y se suicida. Una reflexión sobre el honor, la locura y la muerte.','http://example.com/pdf/ayax.pdf','https://cdn.pruebat.org/recursos/recursos/libros/portadas/Ayax-Sofocles.jpg'),('978-8484286362','Orgullo y prejuicio','Jane Austen','Alma','Clasico','El 28 de enero de 1813 se publica por primera vez Orgullo y prejuicio, la que se convertiría en una de las obras más reconocidas de la litera inglesa. Ésta se publicó inicialmente como una obra anónima, ya que el padre de su autora, Jane Austen, se la ofreció a un editor que la rechazó.  Sin embargo, Jane Austen pudo acabar presumiendo de haber escrito a la edad de veinte años una de las mejores novelas de la historia de la literatura. De manera poético e irónica, Jane Austen refleja cómo debajo de la aparente perfección de la sociedad británica del cambio de siglo se esconden las apariencias y los prejuicios, todo mientras sigue de cerca la vida cotidiana de personajes comunes y corrientes.','http://example.com/pdf/orgullo.pdf','https://covers.openlibrary.org/b/id/8144249-L.jpg'),('978-8490323762','Gone Girl','Gillian Flynn','Círculo de Lectores','Suspenso','En un caluroso día de verano, Amy y Nick se disponen a celebrar su quinto aniversario de bodas en North Carthage, a orillas del río Mississippi. Pero Amy desaparece esa misma mañana sin dejar rastro. A medida que la investigación policial avanza las sospechas recaen sobre Nick. Sin embargo, Nick insiste en su inocencia. Es cierto que se muestra extrañamente evasivo y frío, pero ¿es un asesino? La adaptación de la novela ha sido llevada al cine en la película dirigida por David Fincher con Ben Affleck y Rosamund Pike como protagonistas principales.','http://example.com/pdf/gone-girl.pdf','https://covers.openlibrary.org/b/id/11567588-L.jpg'),('978-8490328729','It (Eso)','Stephen King','Debolsillo','Terror','¿Quién o qué mutila y mata a los niños de un pequeño pueblo norteamericano? ¿Por qué llega cíclicamente el horror a Derry en forma de un payaso siniestro que va sembrando la destrucción a su paso? Esto es lo que se proponen averiguar los protagonistas de esta novela. Tras veintisiete años de tranquilidad y lejanía una antigua promesa infantil les hace volver al lugar en el que vivieron su infancia y juventud como una terrible pesadilla. Regresan a Derry para enfrentarse con su pasado y enterrar definitivamente la amenaza que los amargó durante su niñez. Saben que pueden morir, pero son conscientes de que no conocerán la paz hasta que aquella cosa sea destruida para siempre. It es una de las novelas más ambiciosas de Stephen King, donde ha logrado perfeccionar de un modo muy personal las claves del género de terror.','http://example.com/pdf/it.pdf','https://covers.openlibrary.org/b/id/14651795-L.jpg'),('978-8497592208','La sombra del viento','Carlos Ruiz Zafón','Planeta','Ficcion','Un amanecer de 1945 un muchacho es conducido por su padre a un misterioso lugar oculto en el corazón de la ciudad vieja: El Cementerio de los Libros Olvidados. Allí, Daniel Sempere encuentra un libro maldito que cambiará el rumbo de su vida y le arrastrará a un laberinto de intrigas y secretos enterrados en el alma oscura de la ciudad.\nLa Sombra del Viento es un misterio literario ambientado en la Barcelona de la primera mitad del siglo XX, desde los últimos esplendores del Modernismo a las tinieblas de la posguerra. La Sombra del Viento mezcla técnicas de relato de intriga, de novela histórica y de comedia de costumbres pero es, sobre todo, una tragedia histórica de amor cuyo eco se proyecta a través del tiempo. Con gran fuerza narrativa, el autor entrelaza tramas y enigmas a modo de muñecas rusas en un inolvidable relato sobre los secretos del corazón y el embrujo de los libros, manteniendo la intriga hasta la última página.','http://example.com/pdf/sombra-viento.pdf','https://covers.openlibrary.org/b/id/10522126-L.jpg'),('978-8497593878','Drácula','Bram Stoker','Alianza','Terror','\"Drácula\" (1897) es la obra cumbre de la literatura gótica y vampírica. La novela epistolar sigue al conde Drácula, un vampiro ancestral que viaja desde Transilvania hasta Inglaterra para expandir su maldición. El grupo protagonista —incluyendo al abogado Jonathan Harker, la valiente Mina Murray y el profesor Van Helsing— debe enfrentarse a esta criatura de la noche, combinando leyendas medievales con la ciencia victoriana. Drácula encarna el terror sexual y lo desconocido, simbolizando miedos atávicos a la inmortalidad y la corrupción del alma. Su castillo gótico, las noches de pesadilla y el famoso \"No bebo... vino\" han influenciado eternamente el género de terror.','http://example.com/pdf/dracula.pdf','https://covers.openlibrary.org/b/id/12622155-L.jpg'),('978-8497892071','La princesa y el guisante','Hans Christian Andersen','Anaya','Infantil','Una delicada princesa llega a un castillo en medio de una tormenta. Para probar su nobleza, la reina la hace dormir sobre veinte colchones con un guisante oculto en el fondo. Una historia clásica sobre la sensibilidad y la verdadera nobleza.','https://www.ejemplo.com/pdf/princesa_guisante.pdf','https://1.bp.blogspot.com/-L64-k8draN4/Uw4HPGX1m6I/AAAAAAAAK7Q/_GR0yFCHApM/s1600/la-princesa-y-el-guisante-9788426389954.jpg'),('978-8498381491','Juego de tronos','George R.R. Martin','Gigamesh','Fantasia','Tras el largo verano, el invierno se acerca a los Siete Reinos. Lord Eddars Stark, señor de Invernalia, deja sus dominios para unirse a la corte del rey Robert Baratheon el Usurpador, hombre díscolo y otrora guerrero audaz cuyas mayores aficiones son comer, beber y engendrar bastardos. Eddard Stark desempeñará el cargo de Mano del Rey e intentará desentrañar una maraña de intrigas que pondrá en peligro su vida... y la de los suyos. En un mundo cuyas estaciones duran décadas y en el que retazos de una magia inmemorial y olvidada surgen en los rincones más sombrios y maravillosos, la traición y la lealtad, la compasión y la sed de venganza, el amor y el poder hacen del juego de tronos una poderosa trampa que atrapa en sus fauces a los personajes... y al lector.','http://example.com/pdf/juego-tronos.pdf','https://ellector.com.pa/cdn/shop/files/9788466374934.jpg?v=1724691485'),('978-8498383624','Posdata: Te amo','Cecelia Ahern','Ediciones B','Romance','Holly queda devastada por la muerte de su esposo Gerry. Pero él le dejó cartas para cada mes del año, ayudándola a superar el duelo y redescubrirse.','http://example.com/pdf/posdata.pdf','https://images.librotea.com/uploads/media/2006/04/21/posdata-te-amo_2.jpeg'),('978-8498383638','El temor de un hombre sabio','Patrick Rothfuss','Plaza & Janés','Fantasía','Kvothe continúa relatando la historia de su vida al escribano Cronista. En este segundo día de narración, narra sus hazañas en la Universidad, sus duelos con enemigos poderosos, su exilio forzado, su encuentro con los temibles adem y su experiencia con Felurian, una criatura de leyenda. La novela profundiza en los misterios del mundo y de su protagonista, expandiendo una historia épica de aprendizaje, pérdida y poder que desafía los límites de la fantasía convencional.','http://ejemplo.com/temor.pdf','https://literatil.com/wp-content/uploads/2014/10/temorhombresabio-263x400.jpg'),('978-8498387087','El castillo ambulante','Diana Wynne Jones','Nocturna Ediciones','Fantasía','Sophie, una joven sombrerera, es víctima de un hechizo que la convierte en una anciana. Decide buscar al misterioso mago Howl, cuyo castillo se desplaza por las colinas. En su viaje, Sophie descubrirá que la magia esconde muchas capas de verdad y que los destinos están entrelazados por el amor, la valentía y el sacrificio. Una aventura encantadora que combina humor, misterio y ternura, y que inspiró una famosa adaptación cinematográfica por Studio Ghibli.','http://ejemplo.com/castillo.pdf','https://i.pinimg.com/736x/5f/45/9a/5f459af7cce58cf088784046f7087745.jpg'),('978-9505470945','Las batallas en el desierto','José Emilio Pacheco','ERA','Ficción','A través de la voz de Carlos, un hombre adulto que rememora su niñez en el México de los años cuarenta, esta novela breve presenta un relato nostálgico, cargado de crítica social, sobre el primer amor imposible y el paso de la infancia a la adolescencia. Una historia sencilla, pero profundamente emotiva y representativa de una época de cambios culturales y políticos en el país.','http://ejemplo.com/batallas.pdf','https://www.ecured.cu/images/thumb/0/0e/Batallas_en_el_Desierto.jpg/1200px-Batallas_en_el_Desierto.jpg'),('978-9584232638','Matilda','Roald Dahl','Alfaguara','Infantil','Matilda es una niña extraordinaria con poderes especiales, que desafía a adultos crueles como la temible Tronchatoro, con inteligencia y ternura.','http://example.com/pdf/matilda.pdf','https://bibliometro.cl/wp-content/uploads/2019/04/matilda-2.jpg'),('978-9584232645','Charlie y la fábrica de chocolate','Roald Dahl','Alfaguara','Infantil','Charlie visita la misteriosa fábrica de Willy Wonka junto a otros niños, descubriendo un mundo mágico y lleno de enseñanzas.','http://example.com/pdf/charlie.pdf','https://www.libreriaalberti.com/media/img/portadas/_visd_0000JPG02OZL.jpg'),('978-9588886042','Aura','Carlos Fuentes','FCE','Ficción','Felipe Montero, un joven historiador, encuentra un extraño anuncio laboral que lo conduce a una antigua casona en el Centro Histórico de Ciudad de México. Allí, comienza a trabajar con la enigmática señora Consuelo y la misteriosa Aura, su sobrina, en un ambiente que se vuelve cada vez más inquietante. El tiempo se desdibuja, los límites entre realidad y fantasía se desmoronan, y Felipe es arrastrado a un destino tan oscuro como inevitable. Una joya literaria de lo fantástico que fusiona erotismo, tiempo y memoria con maestría poética.','http://ejemplo.com/aura.pdf','https://resumendellibro.net/wp-content/uploads/aura-de-carlos-fuentes-1406x2048.jpg'),('978-9681604782','Poeta en Nueva York','Federico García Lorca','FCE','Poesía','Lorca retrata una ciudad alienante, caótica y cruel a través de imágenes potentes y simbolismo oscuro.','http://example.com/pdf/poeta-ny.pdf','https://www.marcialpons.es/media/img/portadas/9788419466242.jpg'),('978-9681660702','El llano en llamas','Juan Rulfo','FCE','Clásico','Esta colección de cuentos, considerada una de las más importantes de la literatura mexicana, retrata la desolación, la violencia, la miseria y el silencio de los habitantes del campo mexicano. Rulfo utiliza una prosa sobria y poderosa para capturar el alma de personajes marcados por la soledad, el rencor, la fatalidad y la supervivencia. Desde bandidos hasta campesinos, cada historia revela una parte oscura y profunda de la condición humana en un México árido y brutal. Una obra clave del realismo latinoamericano.','http://ejemplo.com/llano.pdf','https://portallibros.com/wp-content/uploads/2021/02/el-llano-en-llamas.jpg'),('978-9684113465','Residencia en la tierra','Pablo Neruda','Losada','Poesía','Obra oscura e introspectiva de Neruda que mezcla el surrealismo con el dolor existencial y la búsqueda de sentido.','http://example.com/pdf/residencia.pdf','https://miro.medium.com/v2/resize:fit:1200/0*YCrxiEcj4AI-wqTH.jpg'),('978-9871138133','El horla','Guy de Maupassant','Longseller','Terror','A través de un diario íntimo, un hombre comienza a narrar una serie de sucesos extraños e inexplicables que lo llevan a creer que una entidad invisible, el \"Horla\", lo está controlando y consumiendo. Su cordura se va deteriorando, mientras lucha por entender si está siendo víctima de un ser sobrenatural o de su propia mente. Esta breve pero poderosa obra del terror psicológico anticipa muchos elementos del horror moderno, explorando la angustia existencial y la fragilidad de la percepción.','http://ejemplo.com/horla.pdf','https://nidodelibros.com/wp-content/uploads/2021/03/9788494884832.jpg');
/*!40000 ALTER TABLE `libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `local`
--

DROP TABLE IF EXISTS `local`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `local` (
  `Id_Local` varchar(20) NOT NULL,
  `Ubicacion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id_Local`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `local`
--

LOCK TABLES `local` WRITE;
/*!40000 ALTER TABLE `local` DISABLE KEYS */;
INSERT INTO `local` VALUES ('LOC001','Av. Principal 123, Ciudad Central'),('LOC002','Calle Secundaria 456, Zona Norte'),('LOC003','Plaza Comercial 789, Distrito Sur'),('LOC004','Av. del Bosque 101, Sector Verde'),('LOC005','Calle 8 Este, Centro Histórico'),('LOC006','Boulevard del Saber, Campus Universitario'),('LOC007','Av. Libertad 202, Distrito Oeste'),('LOC008','Callejón Cultural 55, Zona Creativa'),('LOC009','Finca 4, Bocas del toro'),('LOC010','Limas, Distrito norte');
/*!40000 ALTER TABLE `local` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `Nom_Usuario` varchar(50) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Apellido` varchar(50) DEFAULT NULL,
  `Correo_Electronico` varchar(100) DEFAULT NULL,
  `Contrasena` varchar(100) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Nom_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('anaruiz','Ana','Ruiz','anaruiz@mail.com','123456','611223344'),('cgarcia','Carlos','Garcia','cgarcia@mail.com','qwerty','677788899'),('dvaldez','Diego','Valdez','dvaldez@mail.com','secret','655443322'),('juanperez','Juan','Perez','juanperez@mail.com','abc123','612345678'),('mlopez','Maria','Lopez','mlopez@mail.com','pass456','698765432');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_inventario_completo`
--

DROP TABLE IF EXISTS `vista_inventario_completo`;
/*!50001 DROP VIEW IF EXISTS `vista_inventario_completo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_inventario_completo` AS SELECT 
 1 AS `Id_Local`,
 1 AS `Ubicacion`,
 1 AS `ISBN`,
 1 AS `Titulo`,
 1 AS `Autor`,
 1 AS `Cantidad_disponible`,
 1 AS `Costo`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vista_inventario_completo`
--

/*!50001 DROP VIEW IF EXISTS `vista_inventario_completo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_inventario_completo` AS select `l`.`Id_Local` AS `Id_Local`,`l`.`Ubicacion` AS `Ubicacion`,`b`.`ISBN` AS `ISBN`,`b`.`Titulo` AS `Titulo`,`b`.`Autor` AS `Autor`,`i`.`Cantidad_disponible` AS `Cantidad_disponible`,`i`.`Costo` AS `Costo` from ((`inventario` `i` join `local` `l` on((`i`.`Id_Local` = `l`.`Id_Local`))) join `libro` `b` on((`i`.`ISBN` = `b`.`ISBN`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-05 18:39:46
