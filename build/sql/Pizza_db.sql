CREATE DATABASE  IF NOT EXISTS `pizza_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pizza_db`;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: pizza_db
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `clients` (
  `ID_client` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) DEFAULT NULL,
  `prenom` varchar(30) DEFAULT NULL,
  `adresse` varchar(30) DEFAULT NULL,
  `numero_tel` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ID_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commande`
--

DROP TABLE IF EXISTS `commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `commande` (
  `ID_commande` int(11) NOT NULL AUTO_INCREMENT,
  `element_cmd` varchar(30) DEFAULT NULL,
  `type_cmd` varchar(30) DEFAULT NULL,
  `num_table` int(11) DEFAULT NULL,
  `montant` decimal(5,2) DEFAULT NULL,
  `heure_commande` timestamp NULL DEFAULT NULL,
  `ID_client` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_commande`),
  KEY `FK_ClientsCommande` (`ID_client`),
  CONSTRAINT `FK_ClientsCommande` FOREIGN KEY (`ID_client`) REFERENCES `clients` (`ID_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commande`
--

LOCK TABLES `commande` WRITE;
/*!40000 ALTER TABLE `commande` DISABLE KEYS */;
/*!40000 ALTER TABLE `commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturation`
--

DROP TABLE IF EXISTS `facturation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `facturation` (
  `ID_facture` int(11) NOT NULL AUTO_INCREMENT,
  `ID_commande` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_facture`),
  KEY `ID_commande` (`ID_commande`),
  CONSTRAINT `facturation_ibfk_1` FOREIGN KEY (`ID_commande`) REFERENCES `commande` (`ID_commande`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturation`
--

LOCK TABLES `facturation` WRITE;
/*!40000 ALTER TABLE `facturation` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logistique`
--

DROP TABLE IF EXISTS `logistique`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `logistique` (
  `ID_logistique` int(11) NOT NULL AUTO_INCREMENT,
  `ID_commande` int(11) NOT NULL,
  `ID_client` int(11) NOT NULL,
  `heure_depart` timestamp NULL DEFAULT NULL,
  `heure_arrivee` timestamp NULL DEFAULT NULL,
  `heure_retour` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_logistique`),
  KEY `ID_commande` (`ID_commande`),
  KEY `ID_client` (`ID_client`),
  CONSTRAINT `logistique_ibfk_1` FOREIGN KEY (`ID_commande`) REFERENCES `commande` (`ID_commande`),
  CONSTRAINT `logistique_ibfk_2` FOREIGN KEY (`ID_client`) REFERENCES `clients` (`ID_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logistique`
--

LOCK TABLES `logistique` WRITE;
/*!40000 ALTER TABLE `logistique` DISABLE KEYS */;
/*!40000 ALTER TABLE `logistique` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `menus` (
  `ID_menu` int(11) NOT NULL AUTO_INCREMENT,
  `prix` int(11) DEFAULT NULL,
  `disponibilite` tinyint(1) DEFAULT NULL,
  `pizza` varchar(30) DEFAULT NULL,
  `boisson` varchar(30) DEFAULT NULL,
  `dessert` varchar(30) DEFAULT NULL,
  `entree` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-03  9:50:47
