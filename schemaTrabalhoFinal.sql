-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: trabalhofinalbd2
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `camera`
--

DROP TABLE IF EXISTS `camera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camera` (
  `mac_equipamento` varchar(40) NOT NULL,
  `lente` varchar(50) DEFAULT NULL,
  `megapixels` int DEFAULT NULL,
  PRIMARY KEY (`mac_equipamento`),
  CONSTRAINT `camera_ibfk_1` FOREIGN KEY (`mac_equipamento`) REFERENCES `equipamento` (`mac`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chamado`
--

DROP TABLE IF EXISTS `chamado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chamado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(200) NOT NULL,
  `data` date NOT NULL,
  `urgencia` varchar(50) NOT NULL,
  `id_localizacao` int NOT NULL,
  `esta_aberto` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_chamado_id_localizacao` (`id_localizacao`),
  CONSTRAINT `fk_chamado_id_localizacao` FOREIGN KEY (`id_localizacao`) REFERENCES `localizacao` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chamado_equipamento`
--

DROP TABLE IF EXISTS `chamado_equipamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chamado_equipamento` (
  `id_chamado` int NOT NULL,
  `mac_equipamento` varchar(40) NOT NULL,
  PRIMARY KEY (`id_chamado`,`mac_equipamento`),
  KEY `fk_chamado_equipamento_mac_equipamento` (`mac_equipamento`),
  CONSTRAINT `fk_chamado_equipamento_id_chamado` FOREIGN KEY (`id_chamado`) REFERENCES `usuario` (`id`),
  CONSTRAINT `fk_chamado_equipamento_mac_equipamento` FOREIGN KEY (`mac_equipamento`) REFERENCES `equipamento` (`mac`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chamado_ligado`
--

DROP TABLE IF EXISTS `chamado_ligado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chamado_ligado` (
  `id_chamado` int NOT NULL,
  `id_chamado_ligado` int NOT NULL,
  PRIMARY KEY (`id_chamado`,`id_chamado_ligado`),
  CONSTRAINT `fk_chamado_ligado_id_chamado` FOREIGN KEY (`id_chamado`) REFERENCES `chamado` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `computador`
--

DROP TABLE IF EXISTS `computador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `computador` (
  `mac_equipamento` varchar(40) NOT NULL,
  `qtd_nucleos` int DEFAULT NULL,
  `qtd_ram` int DEFAULT NULL,
  `qtd_armazenamento` int DEFAULT NULL,
  PRIMARY KEY (`mac_equipamento`),
  CONSTRAINT `computador_ibfk_1` FOREIGN KEY (`mac_equipamento`) REFERENCES `equipamento` (`mac`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dvr`
--

DROP TABLE IF EXISTS `dvr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dvr` (
  `mac_equipamento` varchar(40) NOT NULL,
  `nro_portas` int DEFAULT NULL,
  PRIMARY KEY (`mac_equipamento`),
  CONSTRAINT `dvr_ibfk_1` FOREIGN KEY (`mac_equipamento`) REFERENCES `equipamento` (`mac`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `equipamento`
--

DROP TABLE IF EXISTS `equipamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipamento` (
  `mac` varchar(40) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `data_aquisicao` date DEFAULT NULL,
  `id_localizacao` int DEFAULT NULL,
  `ip` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`mac`),
  KEY `fk_equipamento_id_localizacao` (`id_localizacao`),
  CONSTRAINT `fk_equipamento_id_localizacao` FOREIGN KEY (`id_localizacao`) REFERENCES `localizacao` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `localizacao`
--

DROP TABLE IF EXISTS `localizacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localizacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `id_localizacao` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_localizacao_id_localizacao` (`id_localizacao`),
  CONSTRAINT `fk_localizacao_id_localizacao` FOREIGN KEY (`id_localizacao`) REFERENCES `localizacao` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nivel`
--

DROP TABLE IF EXISTS `nivel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nivel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(20) NOT NULL,
  `descricao` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `responsavel_equipamento`
--

DROP TABLE IF EXISTS `responsavel_equipamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `responsavel_equipamento` (
  `id_usuario` int NOT NULL,
  `mac_equipamento` varchar(40) NOT NULL,
  PRIMARY KEY (`id_usuario`,`mac_equipamento`),
  KEY `fk_responsavel_equipamento_mac_equipamento` (`mac_equipamento`),
  CONSTRAINT `fk_responsavel_equipamento_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`),
  CONSTRAINT `fk_responsavel_equipamento_mac_equipamento` FOREIGN KEY (`mac_equipamento`) REFERENCES `equipamento` (`mac`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `solucao_chamado`
--

DROP TABLE IF EXISTS `solucao_chamado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solucao_chamado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_chamado` int NOT NULL,
  `mensagem` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_solucao_chamado_id_chamado` (`id_chamado`),
  CONSTRAINT `fk_solucao_chamado_id_chamado` FOREIGN KEY (`id_chamado`) REFERENCES `chamado` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `switch`
--

DROP TABLE IF EXISTS `switch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `switch` (
  `mac_equipamento` varchar(40) NOT NULL,
  `velocidade` varchar(20) DEFAULT NULL,
  `nro_portas` int DEFAULT NULL,
  PRIMARY KEY (`mac_equipamento`),
  CONSTRAINT `switch_ibfk_1` FOREIGN KEY (`mac_equipamento`) REFERENCES `equipamento` (`mac`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `telefone_contato`
--

DROP TABLE IF EXISTS `telefone_contato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefone_contato` (
  `id` int NOT NULL AUTO_INCREMENT,
  `num` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `nome` varchar(50) NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `cpf` varchar(14) NOT NULL,
  `dt_nasc` date DEFAULT NULL,
  `id_nivel` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_nivel` (`id_nivel`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_nivel`) REFERENCES `nivel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuario_chamado`
--

DROP TABLE IF EXISTS `usuario_chamado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_chamado` (
  `id_usuario_abriu` int NOT NULL,
  `id_chamado` int NOT NULL,
  `id_usuario_fechou` int NOT NULL,
  PRIMARY KEY (`id_usuario_abriu`,`id_chamado`,`id_usuario_fechou`),
  KEY `fk_usuario_chamado_id_chamado` (`id_chamado`),
  KEY `fk_usuario_chamado_id_usuario_fechou` (`id_usuario_fechou`),
  CONSTRAINT `fk_usuario_chamado_id_chamado` FOREIGN KEY (`id_chamado`) REFERENCES `chamado` (`id`),
  CONSTRAINT `fk_usuario_chamado_id_usuario_abriu` FOREIGN KEY (`id_usuario_abriu`) REFERENCES `usuario` (`id`),
  CONSTRAINT `fk_usuario_chamado_id_usuario_fechou` FOREIGN KEY (`id_usuario_fechou`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-11 20:29:44
