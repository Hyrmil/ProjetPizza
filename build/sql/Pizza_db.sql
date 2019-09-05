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
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `articles` (
  `ID_ARTICLE` int(11) NOT NULL AUTO_INCREMENT,
  `NOM` varchar(30) DEFAULT NULL,
  `PRIX` decimal(5,2) DEFAULT NULL,
  `CATEGORY` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_ARTICLE`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (1,'4 Fromages',9.50,'Pizza'),(2,'Margherita',8.50,'Pizza'),(3,'Reine',8.50,'Pizza'),(4,'Napolitaine',9.50,'Pizza'),(5,'Romaine',8.95,'Pizza'),(6,'Calzone',9.50,'Pizza'),(7,'Hawaïenne',10.95,'Pizza'),(8,'Pepperoni',9.50,'Pizza'),(9,'Montagnarde',10.95,'Pizza'),(10,'Pollosa',9.50,'Pizza'),(11,'Saumona',10.95,'Pizza'),(12,'Cola',2.95,'Boisson'),(13,'Orangeade',2.95,'Boisson'),(14,'Thé Glacé',2.95,'Boisson'),(15,'Eau ',1.50,'Boisson'),(16,'Limonade',2.95,'Boisson'),(17,'Binouze',5.95,'Boisson'),(18,'Mozza Sticks',3.95,'Entrée'),(19,'Burrata',3.95,'Entrée'),(20,'Salade',4.95,'Entrée'),(21,'Nuggets',3.95,'Entrée'),(22,'Glace',3.95,'Dessert'),(23,'Beignet',3.95,'Dessert'),(24,'Pancake',3.95,'Dessert'),(25,'Chti\'ramisu',2.95,'Dessert');
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commande`
--

DROP TABLE IF EXISTS `commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `commande` (
  `ID_COMMANDE` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_CMD` date DEFAULT NULL,
  `HEURE` time DEFAULT NULL,
  `ID_CLIENT` int(11) DEFAULT NULL,
  `ARTICLES` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_COMMANDE`),
  KEY `ID_CLIENT` (`ID_CLIENT`),
  CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`ID_CLIENT`) REFERENCES `custommer` (`ID_CLIENT`)
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
-- Table structure for table `commande_article`
--

DROP TABLE IF EXISTS `commande_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `commande_article` (
  `ID_COMMANDE_ARTICLE` int(11) NOT NULL AUTO_INCREMENT,
  `ID_COMMANDE` int(11) NOT NULL,
  `ID_ARTICLE` int(11) NOT NULL,
  `ARTICLE_QUANTITY` int(11) DEFAULT NULL,
  KEY `ID_COMMANDE` (`ID_COMMANDE`),
  KEY `ID_ARTICLE` (`ID_ARTICLE`),
  PRIMARY KEY (`ID_COMMANDE_ARTICLE`),
  CONSTRAINT `commande_article_ibfk_1` FOREIGN KEY (`ID_COMMANDE`) REFERENCES `commande` (`ID_COMMANDE`),
  CONSTRAINT `commande_article_ibfk_2` FOREIGN KEY (`ID_ARTICLE`) REFERENCES `articles` (`ID_ARTICLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commande_article`
--

LOCK TABLES `commande_article` WRITE;
/*!40000 ALTER TABLE `commande_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `commande_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custommer`
--

DROP TABLE IF EXISTS `custommer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `custommer` (
  `ID_CLIENT` int(11) NOT NULL AUTO_INCREMENT,
  `NOM` varchar(30) DEFAULT NULL,
  `PRENOM` varchar(30) DEFAULT NULL,
  `ADRESSE` varchar(100) DEFAULT NULL,
  `NUM_TEL` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ID_CLIENT`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custommer`
--

LOCK TABLES `custommer` WRITE;
/*!40000 ALTER TABLE `custommer` DISABLE KEYS */;
INSERT INTO `custommer` VALUES (3,'Bodin','Coline','29 Rue Bonte Pollet, 59000 Lille','0236152987'),(4,'Becuwe','Clément','57 Rue Christophe Colomb, 59800 Lille','0642398521'),(5,'Callenaere','Charles','23 Rue Ferrer, 59155 Faches-Thumesnil','0198763249'),(6,'Machin','Bidule','2 Rue d\'Iéna, 59000 Lille','0695301945'),(7,'Noël','Père','91 Rue Masséna, 59800 Lille','3615'),(8,'Robert','Catherine','37 Rue Bonte Pollet, 59000 Lille','0320925755');
/*!40000 ALTER TABLE `custommer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livraison`
--

DROP TABLE IF EXISTS `livraison`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `livraison` (
  `ID_LIVRAISON` int(11) NOT NULL AUTO_INCREMENT,
  `HEURE_DEPART` time DEFAULT NULL,
  `HEURE_CLIENT` time DEFAULT NULL,
  `HEURE_RETOUR` time DEFAULT NULL,
  `ID_COMMANDE` int(11) DEFAULT NULL,
  `ID_LIVREUR` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_LIVRAISON`),
  KEY `ID_COMMANDE` (`ID_COMMANDE`),
  KEY `ID_LIVREUR` (`ID_LIVREUR`),
  CONSTRAINT `livraison_ibfk_1` FOREIGN KEY (`ID_COMMANDE`) REFERENCES `commande` (`ID_COMMANDE`),
  CONSTRAINT `livraison_ibfk_2` FOREIGN KEY (`ID_LIVREUR`) REFERENCES `livreur` (`ID_LIVREUR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livraison`
--

LOCK TABLES `livraison` WRITE;
/*!40000 ALTER TABLE `livraison` DISABLE KEYS */;
/*!40000 ALTER TABLE `livraison` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livreur`
--

DROP TABLE IF EXISTS `livreur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `livreur` (
  `ID_LIVREUR` int(11) NOT NULL AUTO_INCREMENT,
  `NOM` varchar(30) DEFAULT NULL,
  `MDP` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID_LIVREUR`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livreur`
--

LOCK TABLES `livreur` WRITE;
/*!40000 ALTER TABLE `livreur` DISABLE KEYS */;
INSERT INTO `livreur` VALUES (1,'Codeville','Codeville1'),(2,'Canard','Canard1'),(3,'Becoue','Becoue1'),(4,'Boudin','Boudin1'),(5,'Podevin','Podevin1');
/*!40000 ALTER TABLE `livreur` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

INSERT INTO `pizza_db`.`articles` (`NOM`, `PRIX`, `CATEGORY`) VALUES ('4 Fromages', '9.50', 'Pizza');
INSERT INTO `pizza_db`.`articles` (`NOM`, `PRIX`, `CATEGORY`) VALUES ('Margherita', '8.50', 'Pizza');
INSERT INTO `pizza_db`.`articles` (`NOM`, `PRIX`, `CATEGORY`) VALUES ('Reine', '8.50', 'Pizza');
INSERT INTO `pizza_db`.`articles` (`NOM`, `PRIX`, `CATEGORY`) VALUES ('Napolitaine', '9.50', 'Pizza');
INSERT INTO `pizza_db`.`articles` (`NOM`, `PRIX`, `CATEGORY`) VALUES ('Romaine', '8.95', 'Pizza');
INSERT INTO `pizza_db`.`articles` (`NOM`, `PRIX`, `CATEGORY`) VALUES ('Calzone', '9.50', 'Pizza');
INSERT INTO `pizza_db`.`articles` (`NOM`, `PRIX`, `CATEGORY`) VALUES ('Hawaïenne', '10.95', 'Pizza');
INSERT INTO `pizza_db`.`articles` (`NOM`, `PRIX`, `CATEGORY`) VALUES ('Pepperoni', '9.50', 'Pizza');
INSERT INTO `pizza_db`.`articles` (`NOM`, `PRIX`, `CATEGORY`) VALUES ('Montagnarde', '10.95', 'Pizza');
INSERT INTO `pizza_db`.`articles` (`NOM`, `PRIX`, `CATEGORY`) VALUES ('Pollosa', '9.50', 'Pizza');
INSERT INTO `pizza_db`.`articles` (`NOM`, `PRIX`, `CATEGORY`) VALUES ('Saumona', '10.95', 'Pizza');
INSERT INTO `pizza_db`.`articles` (`NOM`, `PRIX`, `CATEGORY`) VALUES ('Cola', '2.95', 'Boisson');
INSERT INTO `pizza_db`.`articles` (`NOM`, `PRIX`, `CATEGORY`) VALUES ('Orangeade', '2.95', 'Boisson');
INSERT INTO `pizza_db`.`articles` (`NOM`, `PRIX`, `CATEGORY`) VALUES ('Thé Glacé', '2.95', 'Boisson');
INSERT INTO `pizza_db`.`articles` (`NOM`, `PRIX`, `CATEGORY`) VALUES ('Eau ', '1.50', 'Boisson');
INSERT INTO `pizza_db`.`articles` (`NOM`, `PRIX`, `CATEGORY`) VALUES ('Limonade', '2.95', 'Boisson');
INSERT INTO `pizza_db`.`articles` (`NOM`, `PRIX`, `CATEGORY`) VALUES ('Binouze', '5.95', 'Boisson');
INSERT INTO `pizza_db`.`articles` (`NOM`, `PRIX`, `CATEGORY`) VALUES ('Mozza Sticks', '3.95', 'Entrée');
INSERT INTO `pizza_db`.`articles` (`NOM`, `PRIX`, `CATEGORY`) VALUES ('Burrata', '3.95', 'Entrée');
INSERT INTO `pizza_db`.`articles` (`NOM`, `PRIX`, `CATEGORY`) VALUES ('Salade', '4.95', 'Entrée');
INSERT INTO `pizza_db`.`articles` (`NOM`, `PRIX`, `CATEGORY`) VALUES ('Nuggets', '3.95', 'Entrée');
INSERT INTO `pizza_db`.`articles` (`NOM`, `PRIX`, `CATEGORY`) VALUES ('Glace', '3.95', 'Dessert');
INSERT INTO `pizza_db`.`articles` (`NOM`, `PRIX`, `CATEGORY`) VALUES ('Beignet', '3.95', 'Dessert');
INSERT INTO `pizza_db`.`articles` (`NOM`, `PRIX`, `CATEGORY`) VALUES ('Pancake', '3.95', 'Dessert');
INSERT INTO `pizza_db`.`articles` (`NOM`, `PRIX`, `CATEGORY`) VALUES ('Chti\'ramisu', '2.95', 'Dessert');

INSERT INTO `pizza_db`.`custommer` (`NOM`, `PRENOM`, `ADRESSE`, `NUM_TEL`) VALUES ('Bodin', 'Coline', '29 Rue Bonte Pollet, 59000 Lille', '0236152987');
INSERT INTO `pizza_db`.`custommer` (`NOM`, `PRENOM`, `ADRESSE`, `NUM_TEL`) VALUES ('Becuwe', 'Clément', '57 Rue Christophe Colomb, 59800 Lille', '0642398521');
INSERT INTO `pizza_db`.`custommer` (`NOM`, `PRENOM`, `ADRESSE`, `NUM_TEL`) VALUES ('Callenaere', 'Charles', '23 Rue Ferrer, 59155 Faches-Thumesnil', '0198763249');
INSERT INTO `pizza_db`.`custommer` (`NOM`, `PRENOM`, `ADRESSE`, `NUM_TEL`) VALUES ('Machin', 'Bidule', '2 Rue d\'Iéna, 59000 Lille', '0695301945');
INSERT INTO `pizza_db`.`custommer` (`NOM`, `PRENOM`, `ADRESSE`, `NUM_TEL`) VALUES ('Noël', 'Père', '91 Rue Masséna, 59800 Lille', '3615');
INSERT INTO `pizza_db`.`custommer` (`NOM`, `PRENOM`, `ADRESSE`, `NUM_TEL`) VALUES ('Robert', 'Catherine', '37 Rue Bonte Pollet, 59000 Lille', '0320925755');

INSERT INTO `pizza_db`.`livreur` (`NOM`, `MDP`) VALUES ('Codeville', 'Codeville1');
INSERT INTO `pizza_db`.`livreur` (`NOM`, `MDP`) VALUES ('Canard', 'Canard1');
INSERT INTO `pizza_db`.`livreur` (`NOM`, `MDP`) VALUES ('Becoue', 'Becoue1');
INSERT INTO `pizza_db`.`livreur` (`NOM`, `MDP`) VALUES ('Boudin', 'Boudin1');
INSERT INTO `pizza_db`.`livreur` (`NOM`, `MDP`) VALUES ('Podevin', 'Podevin1');
