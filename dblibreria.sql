-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: dblibreria
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_customuser`
--

LOCK TABLES `accounts_customuser` WRITE;
/*!40000 ALTER TABLE `accounts_customuser` DISABLE KEYS */;
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
INSERT INTO `inventario` VALUES ('LOC001','978-8420412146',8,24.50),('LOC001','978-8423347969',10,15.75),('LOC001','978-8426135267',20,12.99),('LOC001','978-8437604947',15,19.99),('LOC001','978-8445000664',5,29.99),('LOC001','978-8490328729',12,18.50),('LOC002','978-0307474278',18,16.99),('LOC002','978-8401021350',9,17.50),('LOC002','978-8469841471',25,14.99),('LOC002','978-8484286362',7,21.25),('LOC002','978-8497593878',11,16.75),('LOC002','978-8498381491',6,27.99),('LOC003','978-8408183615',15,11.50),('LOC003','978-8415618839',7,15.99),('LOC003','978-8420674209',10,22.99),('LOC003','978-8466657662',4,25.99),('LOC003','978-8490323762',8,16.25);
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
INSERT INTO `libro` VALUES ('978-0307474278','El código Da Vinci','Dan Brown','Doubleday','Ficcion','http://example.com/pdf/codigo-davinci.pdf','https://covers.openlibrary.org/b/id/14540893-L.jpg'),('978-8401021350','El silencio de los corderos','Thomas Harris','Plaza & Janés','Suspenso','http://example.com/pdf/silencio-corderos.pdf','https://covers.openlibrary.org/b/id/9255930-L.jpg'),('978-8408183615','Donde viven los monstruos','Maurice Sendak','Kalandraka','Infantil','http://example.com/pdf/monstruos.pdf','https://covers.openlibrary.org/b/id/7304774-L.jpg'),('978-8415618839','Frankenstein','Mary Shelley','Penguin Clásicos','Terror','http://example.com/pdf/frankenstein.pdf','https://covers.openlibrary.org/b/id/12752093-L.jpg'),('978-8420412146','Don Quijote de la Mancha','Miguel de Cervantes','Alianza','Clasico','http://example.com/pdf/quijote.pdf','https://covers.openlibrary.org/b/id/13642228-L.jpg'),('978-8420674209','Moby Dick','Herman Melville','Alianza','Clasico','http://example.com/pdf/moby-dick.pdf','https://covers.openlibrary.org/b/id/13786943-L.jpg'),('978-8423347969','La chica del tren','Paula Hawkins','Planeta','Suspenso','http://example.com/pdf/chica-tren.pdf','https://covers.openlibrary.org/b/id/7395624-L.jpg'),('978-8426135267','El principito','Antoine de Saint-Exupéry','Salamandra','Infantil','http://example.com/pdf/principito.pdf','https://covers.openlibrary.org/b/id/13529309-L.jpg'),('978-8437604947','Cien años de soledad','Gabriel García Márquez','Alfaguara','Ficcion','http://example.com/pdf/cien-anos.pdf','https://covers.openlibrary.org/b/id/14831384-L.jpg'),('978-8445000664','El señor de los anillos','J.R.R. Tolkien','Minotauro','Fantasia','http://example.com/pdf/senor-anillos.pdf','https://proassetspdlcom.cdnstatics2.com/usuaris/libros/thumbs/24fb5128-9aaf-4802-8222-047db4b93ef3/d_1200_1200/portada_el-senor-de-los-anillos_j-r-r-tolkien_201601252224.webp'),('978-8466657662','El nombre del viento','Patrick Rothfuss','Plaza & Janés','Fantasia','http://example.com/pdf/nombre-viento.pdf','https://covers.openlibrary.org/b/id/10526441-L.jpg'),('978-8469841471','Harry Potter y la piedra filosofal','J.K. Rowling','Salamandra','Infantil','http://example.com/pdf/harry-potter.pdf','https://covers.openlibrary.org/b/id/14925450-L.jpg'),('978-8484286362','Orgullo y prejuicio','Jane Austen','Alma','Clasico','http://example.com/pdf/orgullo.pdf','https://covers.openlibrary.org/b/id/8144249-L.jpg'),('978-8490323762','Gone Girl','Gillian Flynn','Círculo de Lectores','Suspenso','http://example.com/pdf/gone-girl.pdf','https://covers.openlibrary.org/b/id/11567588-L.jpg'),('978-8490328729','It (Eso)','Stephen King','Debolsillo','Terror','http://example.com/pdf/it.pdf','https://covers.openlibrary.org/b/id/14651795-L.jpg'),('978-8497592208','La sombra del viento','Carlos Ruiz Zafón','Planeta','Ficcion','http://example.com/pdf/sombra-viento.pdf','https://covers.openlibrary.org/b/id/10522126-L.jpg'),('978-8497593878','Drácula','Bram Stoker','Alianza','Terror','http://example.com/pdf/dracula.pdf','https://covers.openlibrary.org/b/id/12622155-L.jpg'),('978-8498381491','Juego de tronos','George R.R. Martin','Gigamesh','Fantasia','http://example.com/pdf/juego-tronos.pdf','https://ellector.com.pa/cdn/shop/files/9788466374934.jpg?v=1724691485');
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
INSERT INTO `local` VALUES ('LOC001','Av. Principal 123, Ciudad Central'),('LOC002','Calle Secundaria 456, Zona Norte'),('LOC003','Plaza Comercial 789, Distrito Sur');
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-29 23:21:41
