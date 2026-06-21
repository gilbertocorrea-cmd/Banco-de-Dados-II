/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-12.2.2-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: hospital
-- ------------------------------------------------------
-- Server version	12.2.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `ambulatorio`
--

DROP TABLE IF EXISTS `ambulatorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ambulatorio` (
  `nroa` int(11) NOT NULL,
  `andar` int(11) DEFAULT NULL,
  `capacidade` int(11) DEFAULT NULL,
  PRIMARY KEY (`nroa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ambulatorio`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `ambulatorio` WRITE;
/*!40000 ALTER TABLE `ambulatorio` DISABLE KEYS */;
INSERT INTO `ambulatorio` VALUES
(1,1,30),
(2,2,50),
(3,3,40);
/*!40000 ALTER TABLE `ambulatorio` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `auditoria_exames`
--

DROP TABLE IF EXISTS `auditoria_exames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria_exames` (
  `codexame` int(11) DEFAULT NULL,
  `data_hora` datetime DEFAULT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `valor_obtido` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_exames`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `auditoria_exames` WRITE;
/*!40000 ALTER TABLE `auditoria_exames` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditoria_exames` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `cirurgia`
--

DROP TABLE IF EXISTS `cirurgia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cirurgia` (
  `codcirurgia` int(11) NOT NULL,
  `codinternacao` int(11) NOT NULL,
  `codm_cirurgiao` int(11) NOT NULL,
  `data` date NOT NULL,
  `hora` varchar(5) NOT NULL,
  `tipo_cirurgia` varchar(100) NOT NULL,
  `sala` varchar(50) NOT NULL,
  PRIMARY KEY (`codcirurgia`),
  KEY `codinternacao` (`codinternacao`),
  KEY `codm_cirurgiao` (`codm_cirurgiao`),
  CONSTRAINT `1` FOREIGN KEY (`codinternacao`) REFERENCES `internacao` (`codinternacao`),
  CONSTRAINT `2` FOREIGN KEY (`codm_cirurgiao`) REFERENCES `medico` (`codm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cirurgia`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `cirurgia` WRITE;
/*!40000 ALTER TABLE `cirurgia` DISABLE KEYS */;
INSERT INTO `cirurgia` VALUES
(1,1,1,'2006-06-12','08:00','Fixação de fratura','Sala 1');
/*!40000 ALTER TABLE `cirurgia` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `consulta`
--

DROP TABLE IF EXISTS `consulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `consulta` (
  `codm` int(11) NOT NULL,
  `codp` int(11) NOT NULL,
  `data` varchar(10) NOT NULL,
  `hora` varchar(5) NOT NULL,
  PRIMARY KEY (`codm`,`codp`,`data`,`hora`),
  KEY `codp` (`codp`),
  CONSTRAINT `1` FOREIGN KEY (`codm`) REFERENCES `medico` (`codm`),
  CONSTRAINT `2` FOREIGN KEY (`codp`) REFERENCES `paciente` (`codp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consulta`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `consulta` WRITE;
/*!40000 ALTER TABLE `consulta` DISABLE KEYS */;
INSERT INTO `consulta` VALUES
(1,1,'2006-06-10','10:00'),
(5,1,'2006-06-13','16:00'),
(2,2,'2006-06-15','14:00'),
(6,2,'2006-06-13','17:30'),
(2,3,'2006-06-21','13:00'),
(3,3,'2006-06-20','09:00'),
(1,4,'2006-06-25','15:30'),
(4,5,'2006-06-13','11:00');
/*!40000 ALTER TABLE `consulta` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `doenca`
--

DROP TABLE IF EXISTS `doenca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `doenca` (
  `codd` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doenca`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `doenca` WRITE;
/*!40000 ALTER TABLE `doenca` DISABLE KEYS */;
INSERT INTO `doenca` VALUES
(1,'tendinite'),
(2,'fratura'),
(3,'gripe'),
(4,'sarampo'),
(5,'outra');
/*!40000 ALTER TABLE `doenca` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque` (
  `codmed` int(11) NOT NULL,
  `codforn` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL DEFAULT 0,
  `data_entrada` date NOT NULL,
  `lote` varchar(50) NOT NULL,
  PRIMARY KEY (`codmed`,`codforn`,`lote`),
  KEY `codforn` (`codforn`),
  CONSTRAINT `1` FOREIGN KEY (`codmed`) REFERENCES `medicamento` (`codmed`),
  CONSTRAINT `2` FOREIGN KEY (`codforn`) REFERENCES `fornecedor` (`codforn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` VALUES
(1,1,1000,'2006-01-01','LOTE001'),
(2,2,500,'2006-05-01','LOTE002'),
(3,1,800,'2006-03-15','LOTE003');
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `exame`
--

DROP TABLE IF EXISTS `exame`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `exame` (
  `codexame` int(11) NOT NULL,
  `codlab` int(11) NOT NULL,
  `codtipo` int(11) NOT NULL,
  `data` date NOT NULL,
  `hora` varchar(5) NOT NULL,
  `codp` int(11) NOT NULL,
  `codm_solicitante` int(11) NOT NULL,
  PRIMARY KEY (`codexame`),
  KEY `codlab` (`codlab`),
  KEY `codtipo` (`codtipo`),
  KEY `codp` (`codp`),
  KEY `codm_solicitante` (`codm_solicitante`),
  CONSTRAINT `1` FOREIGN KEY (`codlab`) REFERENCES `laboratorio` (`codlab`),
  CONSTRAINT `2` FOREIGN KEY (`codtipo`) REFERENCES `tipo_exame` (`codtipo`),
  CONSTRAINT `3` FOREIGN KEY (`codp`) REFERENCES `paciente` (`codp`),
  CONSTRAINT `4` FOREIGN KEY (`codm_solicitante`) REFERENCES `medico` (`codm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exame`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `exame` WRITE;
/*!40000 ALTER TABLE `exame` DISABLE KEYS */;
INSERT INTO `exame` VALUES
(1,1,1,'2006-06-13','09:00',1,5),
(2,1,2,'2006-06-20','10:30',3,3),
(3,2,3,'2006-06-25','14:00',4,1);
/*!40000 ALTER TABLE `exame` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor` (
  `codforn` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cnpj` varchar(14) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  PRIMARY KEY (`codforn`),
  UNIQUE KEY `cnpj` (`cnpj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES
(1,'Farmácia ABC','12345678901234','Florianópolis'),
(2,'Medix Ltda','98765432109876','Sao Paulo');
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `codf` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES
(1,'Fernanda','78901234567',5000.00,'Florianópolis'),
(2,'Gustavo','89012345678',6000.00,'Sao Paulo'),
(3,'Helena','90123456789',4500.00,'Florianópolis'),
(4,'Igor','01234567890',7000.00,'Rio de Janeiro'),
(5,'Julia','1234500000',5500.00,'Florianópolis');
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `internacao`
--

DROP TABLE IF EXISTS `internacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `internacao` (
  `codinternacao` int(11) NOT NULL,
  `codp` int(11) NOT NULL,
  `nroleito` int(11) NOT NULL,
  `data_entrada` date NOT NULL,
  `data_saida` date DEFAULT NULL,
  `motivo` varchar(200) NOT NULL,
  `codm_responsavel` int(11) NOT NULL,
  PRIMARY KEY (`codinternacao`),
  KEY `codp` (`codp`),
  KEY `nroleito` (`nroleito`),
  KEY `codm_responsavel` (`codm_responsavel`),
  CONSTRAINT `1` FOREIGN KEY (`codp`) REFERENCES `paciente` (`codp`),
  CONSTRAINT `2` FOREIGN KEY (`nroleito`) REFERENCES `leito` (`nroleito`),
  CONSTRAINT `3` FOREIGN KEY (`codm_responsavel`) REFERENCES `medico` (`codm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `internacao`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `internacao` WRITE;
/*!40000 ALTER TABLE `internacao` DISABLE KEYS */;
INSERT INTO `internacao` VALUES
(1,1,1,'2006-06-10','2006-06-15','Cirurgia de fratura',1),
(2,4,3,'2006-06-20',NULL,'Observação de tendinite e fratura',4);
/*!40000 ALTER TABLE `internacao` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_VerificarLeito
BEFORE INSERT ON internacao
FOR EACH ROW
BEGIN

    DECLARE status_leito VARCHAR(20);

    SELECT status
    INTO status_leito
    FROM leito
    WHERE nroleito = NEW.nroleito;

    IF(status_leito = 'ocupado') THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Leito indisponível';

    ELSE

        UPDATE leito
        SET status = 'ocupado'
        WHERE nroleito = NEW.nroleito;

    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_PrevenirDeleteInternacao
BEFORE DELETE ON internacao
FOR EACH ROW
BEGIN

    IF(OLD.data_saida IS NULL) THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Internação ativa não pode ser excluída';

    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `item_prescricao`
--

DROP TABLE IF EXISTS `item_prescricao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_prescricao` (
  `codprescricao` int(11) NOT NULL,
  `codmed` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `posologia` varchar(200) NOT NULL,
  `duracao_dias` int(11) NOT NULL,
  PRIMARY KEY (`codprescricao`,`codmed`),
  KEY `codmed` (`codmed`),
  CONSTRAINT `1` FOREIGN KEY (`codprescricao`) REFERENCES `prescricao` (`codprescricao`),
  CONSTRAINT `2` FOREIGN KEY (`codmed`) REFERENCES `medicamento` (`codmed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_prescricao`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `item_prescricao` WRITE;
/*!40000 ALTER TABLE `item_prescricao` DISABLE KEYS */;
INSERT INTO `item_prescricao` VALUES
(1,1,20,'1 comprimido a cada 8 horas',7),
(1,2,10,'1 cápsula a cada 12 horas',5),
(2,3,15,'1 comprimido a cada 6 horas',3);
/*!40000 ALTER TABLE `item_prescricao` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_ReduzirEstoque
AFTER INSERT ON item_prescricao
FOR EACH ROW
BEGIN

    UPDATE estoque
    SET quantidade = quantidade - NEW.quantidade
    WHERE codmed = NEW.codmed;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `laboratorio`
--

DROP TABLE IF EXISTS `laboratorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `laboratorio` (
  `codlab` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `andar` int(11) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  PRIMARY KEY (`codlab`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laboratorio`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `laboratorio` WRITE;
/*!40000 ALTER TABLE `laboratorio` DISABLE KEYS */;
INSERT INTO `laboratorio` VALUES
(1,'Laboratório Central',1,'483333-4444'),
(2,'Laboratório Diagnóstico',2,'483555-6666');
/*!40000 ALTER TABLE `laboratorio` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `leito`
--

DROP TABLE IF EXISTS `leito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `leito` (
  `nroleito` int(11) NOT NULL,
  `nroq` int(11) NOT NULL,
  `status` enum('disponível','ocupado','manutenção') NOT NULL DEFAULT 'disponível',
  PRIMARY KEY (`nroleito`),
  KEY `nroq` (`nroq`),
  CONSTRAINT `1` FOREIGN KEY (`nroq`) REFERENCES `quarto` (`nroq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leito`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `leito` WRITE;
/*!40000 ALTER TABLE `leito` DISABLE KEYS */;
INSERT INTO `leito` VALUES
(1,1,'ocupado'),
(2,1,'ocupado'),
(3,2,'ocupado'),
(4,3,'disponível');
/*!40000 ALTER TABLE `leito` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `medicamento`
--

DROP TABLE IF EXISTS `medicamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicamento` (
  `codmed` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `principio_ativo` varchar(100) NOT NULL,
  `dosagem` varchar(50) NOT NULL,
  `validade_padrao` varchar(50) NOT NULL,
  `preco_unitario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`codmed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamento`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `medicamento` WRITE;
/*!40000 ALTER TABLE `medicamento` DISABLE KEYS */;
INSERT INTO `medicamento` VALUES
(1,'Paracetamol','Paracetamol','500mg','2 anos',5.00),
(2,'Amoxicilina','Amoxicilina','250mg','1 ano',12.50),
(3,'Dipirona','Metamizol','500mg','3 anos',8.00);
/*!40000 ALTER TABLE `medicamento` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_PrevenirPrecoNegativo
BEFORE UPDATE ON medicamento
FOR EACH ROW
BEGIN

    IF(NEW.preco_unitario <= 0) THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Preço inválido';

    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `medico`
--

DROP TABLE IF EXISTS `medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `medico` (
  `codm` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `idade` int(11) DEFAULT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  `especialidade` varchar(50) DEFAULT NULL,
  `nroa` int(11) DEFAULT NULL,
  PRIMARY KEY (`codm`),
  KEY `nroa` (`nroa`),
  CONSTRAINT `1` FOREIGN KEY (`nroa`) REFERENCES `ambulatorio` (`nroa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `medico` WRITE;
/*!40000 ALTER TABLE `medico` DISABLE KEYS */;
INSERT INTO `medico` VALUES
(1,'Joao',38,'12345678901','traumatologia',1),
(2,'Maria',42,'23456789012','pediatria',1),
(3,'Pedro',35,'34567890123','cardiologia',2),
(4,'Carlos',50,'45678901234','traumatologia',3),
(5,'Antonio',32,'56789012345','neurologia',3),
(6,'Ronaldo',45,'67890123456','ortopedia',2);
/*!40000 ALTER TABLE `medico` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente` (
  `codp` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `idade` int(11) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES
(1,'Ana',20,'Florianópolis'),
(2,'Bruno',30,'Sao Paulo'),
(3,'Carla',45,'Rio de Janeiro'),
(4,'Daniel',26,'Belo Horizonte'),
(5,'Elena',10,'Florianópolis');
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `participa_cirurgia`
--

DROP TABLE IF EXISTS `participa_cirurgia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `participa_cirurgia` (
  `codcirurgia` int(11) NOT NULL,
  `codm` int(11) NOT NULL,
  `papel` enum('cirurgião','anestesista','auxiliar') NOT NULL,
  PRIMARY KEY (`codcirurgia`,`codm`),
  KEY `codm` (`codm`),
  CONSTRAINT `1` FOREIGN KEY (`codcirurgia`) REFERENCES `cirurgia` (`codcirurgia`),
  CONSTRAINT `2` FOREIGN KEY (`codm`) REFERENCES `medico` (`codm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participa_cirurgia`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `participa_cirurgia` WRITE;
/*!40000 ALTER TABLE `participa_cirurgia` DISABLE KEYS */;
INSERT INTO `participa_cirurgia` VALUES
(1,1,'cirurgião'),
(1,6,'auxiliar');
/*!40000 ALTER TABLE `participa_cirurgia` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `prescricao`
--

DROP TABLE IF EXISTS `prescricao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescricao` (
  `codprescricao` int(11) NOT NULL,
  `codm` int(11) NOT NULL,
  `codp` int(11) NOT NULL,
  `data` date NOT NULL,
  `codconsulta` int(11) DEFAULT NULL,
  PRIMARY KEY (`codprescricao`),
  KEY `codm` (`codm`),
  KEY `codp` (`codp`),
  CONSTRAINT `1` FOREIGN KEY (`codm`) REFERENCES `medico` (`codm`),
  CONSTRAINT `2` FOREIGN KEY (`codp`) REFERENCES `paciente` (`codp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescricao`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `prescricao` WRITE;
/*!40000 ALTER TABLE `prescricao` DISABLE KEYS */;
INSERT INTO `prescricao` VALUES
(1,2,2,'2006-06-15',NULL),
(2,1,4,'2006-06-25',NULL);
/*!40000 ALTER TABLE `prescricao` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `quarto`
--

DROP TABLE IF EXISTS `quarto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `quarto` (
  `nroq` int(11) NOT NULL,
  `andar` int(11) NOT NULL,
  `capacidade` int(11) NOT NULL,
  `tipo` enum('enfermaria','UTI','isolamento') NOT NULL,
  PRIMARY KEY (`nroq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quarto`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `quarto` WRITE;
/*!40000 ALTER TABLE `quarto` DISABLE KEYS */;
INSERT INTO `quarto` VALUES
(1,1,10,'enfermaria'),
(2,2,5,'UTI'),
(3,3,8,'isolamento');
/*!40000 ALTER TABLE `quarto` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `resultado_exame`
--

DROP TABLE IF EXISTS `resultado_exame`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `resultado_exame` (
  `codexame` int(11) NOT NULL,
  `codtipo` int(11) NOT NULL,
  `valor_obtido` varchar(100) NOT NULL,
  `observacao` text DEFAULT NULL,
  PRIMARY KEY (`codexame`,`codtipo`),
  KEY `codtipo` (`codtipo`),
  CONSTRAINT `1` FOREIGN KEY (`codexame`) REFERENCES `exame` (`codexame`),
  CONSTRAINT `2` FOREIGN KEY (`codtipo`) REFERENCES `tipo_exame` (`codtipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resultado_exame`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `resultado_exame` WRITE;
/*!40000 ALTER TABLE `resultado_exame` DISABLE KEYS */;
INSERT INTO `resultado_exame` VALUES
(1,1,'Normal','Sem alterações significativas'),
(2,2,'135','Elevado - possível pré-diabetes'),
(3,3,'0.9','Dentro dos valores de referência');
/*!40000 ALTER TABLE `resultado_exame` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_AuditoriaExame
AFTER INSERT ON resultado_exame
FOR EACH ROW
BEGIN

    INSERT INTO auditoria_exames (
        codexame,
        data_hora,
        usuario,
        valor_obtido
    )
    VALUES (
        NEW.codexame,
        NOW(),
        CURRENT_USER(),
        NEW.valor_obtido
    );

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sofre`
--

DROP TABLE IF EXISTS `sofre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sofre` (
  `codp` int(11) NOT NULL,
  `codd` int(11) NOT NULL,
  PRIMARY KEY (`codp`,`codd`),
  KEY `codd` (`codd`),
  CONSTRAINT `1` FOREIGN KEY (`codp`) REFERENCES `paciente` (`codp`),
  CONSTRAINT `2` FOREIGN KEY (`codd`) REFERENCES `doenca` (`codd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sofre`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `sofre` WRITE;
/*!40000 ALTER TABLE `sofre` DISABLE KEYS */;
INSERT INTO `sofre` VALUES
(2,1),
(4,1),
(4,2),
(2,3),
(4,3),
(3,4),
(4,4);
/*!40000 ALTER TABLE `sofre` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `tecnico_lab`
--

DROP TABLE IF EXISTS `tecnico_lab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tecnico_lab` (
  `codtec` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `codlab` int(11) NOT NULL,
  PRIMARY KEY (`codtec`),
  UNIQUE KEY `cpf` (`cpf`),
  KEY `codlab` (`codlab`),
  CONSTRAINT `1` FOREIGN KEY (`codlab`) REFERENCES `laboratorio` (`codlab`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnico_lab`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `tecnico_lab` WRITE;
/*!40000 ALTER TABLE `tecnico_lab` DISABLE KEYS */;
INSERT INTO `tecnico_lab` VALUES
(1,'Técnico Ana Silva','11122233344',1),
(2,'Técnico Bruno Costa','55566677788',2);
/*!40000 ALTER TABLE `tecnico_lab` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `tipo_exame`
--

DROP TABLE IF EXISTS `tipo_exame`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_exame` (
  `codtipo` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` text DEFAULT NULL,
  `valor_referencia` varchar(100) DEFAULT NULL,
  `unidade` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`codtipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_exame`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `tipo_exame` WRITE;
/*!40000 ALTER TABLE `tipo_exame` DISABLE KEYS */;
INSERT INTO `tipo_exame` VALUES
(1,'Hemograma','Contagem completa de células sanguíneas','Valores normais variam por idade','unidades'),
(2,'Glicose','Nível de glicose no sangue','70-99 mg/dL em jejum','mg/dL'),
(3,'Creatinina','Função renal','0,6 - 1,2 mg/dL','mg/dL');
/*!40000 ALTER TABLE `tipo_exame` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Temporary table structure for view `vw_ConsultasMedicos`
--

DROP TABLE IF EXISTS `vw_ConsultasMedicos`;
/*!50001 DROP VIEW IF EXISTS `vw_ConsultasMedicos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `vw_ConsultasMedicos` AS SELECT
 1 AS `paciente`,
  1 AS `medico`,
  1 AS `especialidade`,
  1 AS `data`,
  1 AS `hora` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_EstoqueMedicamentos`
--

DROP TABLE IF EXISTS `vw_EstoqueMedicamentos`;
/*!50001 DROP VIEW IF EXISTS `vw_EstoqueMedicamentos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `vw_EstoqueMedicamentos` AS SELECT
 1 AS `nome`,
  1 AS `principio_ativo`,
  1 AS `quantidade_total`,
  1 AS `valor_total` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_ExamesPacientes`
--

DROP TABLE IF EXISTS `vw_ExamesPacientes`;
/*!50001 DROP VIEW IF EXISTS `vw_ExamesPacientes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `vw_ExamesPacientes` AS SELECT
 1 AS `paciente`,
  1 AS `tipo_exame`,
  1 AS `data`,
  1 AS `hora`,
  1 AS `valor_obtido` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_PacientesDoencas`
--

DROP TABLE IF EXISTS `vw_PacientesDoencas`;
/*!50001 DROP VIEW IF EXISTS `vw_PacientesDoencas`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `vw_PacientesDoencas` AS SELECT
 1 AS `paciente`,
  1 AS `idade`,
  1 AS `cidade`,
  1 AS `doenca` */;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'hospital'
--

--
-- Dumping routines for database 'hospital'
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AtualizarEstoque` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AtualizarEstoque`(
    IN p_codmed INT,
    IN p_codforn INT,
    IN p_lote VARCHAR(50),
    IN quantidade_adicionada INT,
    OUT mensagem VARCHAR(100)
)
BEGIN

    START TRANSACTION;

    UPDATE estoque
    SET quantidade = quantidade + quantidade_adicionada
    WHERE codmed = p_codmed
    AND codforn = p_codforn
    AND lote = p_lote;

    COMMIT;

    SET mensagem = 'Estoque atualizado';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EstatisticasPaciente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EstatisticasPaciente`(
    IN p_codp INT,
    OUT total_consultas INT,
    OUT total_internacoes INT,
    OUT total_exames INT
)
BEGIN

    SELECT COUNT(*)
    INTO total_consultas
    FROM consulta
    WHERE codp = p_codp;

    SELECT COUNT(*)
    INTO total_internacoes
    FROM internacao
    WHERE codp = p_codp;

    SELECT COUNT(*)
    INTO total_exames
    FROM exame
    WHERE codp = p_codp;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InserirPrescricao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InserirPrescricao`()
BEGIN

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro na prescrição';
    END;

    START TRANSACTION;

    INSERT INTO prescricao (
        codprescricao,
        codp,
        codm,
        data
    )
    VALUES (
        20,
        1,
        1,
        CURDATE()
    );

    INSERT INTO item_prescricao (
        codprescricao,
        codmed,
        quantidade
    )
    VALUES (
        20,
        1,
        2
    );

    COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InserirResultadoExame` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InserirResultadoExame`(
    IN p_codexame INT,
    IN p_codtipo INT,
    IN p_valor_obtido VARCHAR(100),
    IN p_observacao VARCHAR(100),
    OUT mensagem VARCHAR(100)
)
BEGIN

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET mensagem = 'Erro ao inserir resultado';
    END;

    START TRANSACTION;

    INSERT INTO resultado_exame (
        codexame,
        codtipo,
        valor_obtido,
        observacao
    )
    VALUES (
        p_codexame,
        p_codtipo,
        p_valor_obtido,
        p_observacao
    );

    COMMIT;

    SET mensagem = 'Resultado inserido';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegistrarInternacao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegistrarInternacao`(
    IN p_codp INT,
    IN p_nroleito INT,
    IN p_data_entrada DATE,
    IN p_motivo VARCHAR(100),
    IN p_codm_responsavel INT,
    OUT p_msg VARCHAR(100)
)
BEGIN

    DECLARE status_leito VARCHAR(20);

    SELECT status
    INTO status_leito
    FROM leito
    WHERE nroleito = p_nroleito;

    IF(status_leito = 'ocupado') THEN

        SET p_msg = 'Leito indisponível';

    ELSE

        INSERT INTO internacao (
            codinternacao,
            codp,
            nroleito,
            data_entrada,
            motivo,
            codm_responsavel
        )
        VALUES (
            200,
            p_codp,
            p_nroleito,
            p_data_entrada,
            p_motivo,
            p_codm_responsavel
        );

        UPDATE leito
        SET status = 'ocupado'
        WHERE nroleito = p_nroleito;

        SET p_msg = 'Internação registrada';

    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RelatorioInternacoes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RelatorioInternacoes`(
    IN data_inicio DATE,
    IN data_fim DATE,
    OUT total_internacoes INT
)
BEGIN

    SELECT COUNT(*)
    INTO total_internacoes
    FROM internacao
    WHERE data_entrada BETWEEN data_inicio AND data_fim;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_ConsultasMedicos`
--

/*!50001 DROP VIEW IF EXISTS `vw_ConsultasMedicos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ConsultasMedicos` AS select `p`.`nome` AS `paciente`,`m`.`nome` AS `medico`,`m`.`especialidade` AS `especialidade`,`c`.`data` AS `data`,`c`.`hora` AS `hora` from ((`consulta` `c` join `paciente` `p` on(`c`.`codp` = `p`.`codp`)) join `medico` `m` on(`c`.`codm` = `m`.`codm`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_EstoqueMedicamentos`
--

/*!50001 DROP VIEW IF EXISTS `vw_EstoqueMedicamentos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_EstoqueMedicamentos` AS select `m`.`nome` AS `nome`,`m`.`principio_ativo` AS `principio_ativo`,sum(`e`.`quantidade`) AS `quantidade_total`,sum(`m`.`preco_unitario` * `e`.`quantidade`) AS `valor_total` from (`medicamento` `m` join `estoque` `e` on(`m`.`codmed` = `e`.`codmed`)) group by `m`.`nome`,`m`.`principio_ativo` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ExamesPacientes`
--

/*!50001 DROP VIEW IF EXISTS `vw_ExamesPacientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ExamesPacientes` AS select `p`.`nome` AS `paciente`,`t`.`nome` AS `tipo_exame`,`e`.`data` AS `data`,`e`.`hora` AS `hora`,`r`.`valor_obtido` AS `valor_obtido` from (((`exame` `e` join `paciente` `p` on(`e`.`codp` = `p`.`codp`)) join `tipo_exame` `t` on(`e`.`codtipo` = `t`.`codtipo`)) join `resultado_exame` `r` on(`e`.`codexame` = `r`.`codexame`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_PacientesDoencas`
--

/*!50001 DROP VIEW IF EXISTS `vw_PacientesDoencas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_PacientesDoencas` AS select `p`.`nome` AS `paciente`,`p`.`idade` AS `idade`,`p`.`cidade` AS `cidade`,`d`.`nome` AS `doenca` from ((`paciente` `p` join `sofre` `s` on(`p`.`codp` = `s`.`codp`)) join `doenca` `d` on(`s`.`codd` = `d`.`codd`)) */;
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
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-05-27 20:18:15
