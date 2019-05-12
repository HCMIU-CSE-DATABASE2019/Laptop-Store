CREATE DATABASE  IF NOT EXISTS `laptop_store` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `laptop_store`;
-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: laptop_store
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `battery`
--

DROP TABLE IF EXISTS battery;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE battery (
  laptop_model varchar(45) NOT NULL,
  cell int(10) DEFAULT NULL,
  battery_capacity int(10) DEFAULT NULL,
  power_unit varchar(45) DEFAULT NULL,
  UNIQUE KEY laptop_model_UNIQUE (laptop_model),
  CONSTRAINT battery_laptop_model FOREIGN KEY (laptop_model) REFERENCES laptopmodel (laptop_model) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `battery`
--

INSERT INTO battery VALUES ('13 9370-415PX1',4,52,'Wh');
INSERT INTO battery VALUES ('13-ah0027TU',4,52,'Wh');
INSERT INTO battery VALUES ('15-cs01045TX (5JL29PA)',3,41,'Wh');
INSERT INTO battery VALUES ('3467 (P63F002N67T)',4,NULL,NULL);
INSERT INTO battery VALUES ('5 SF5 (NX.H7HSV.002)',2,NULL,NULL);
INSERT INTO battery VALUES ('Air 2018 (MRE82SA/A)',NULL,50,'Wh');
INSERT INTO battery VALUES ('Helios 300 PH315-51-759Y',4,3220,'mAh');
INSERT INTO battery VALUES ('PS42 (476VN)',4,NULL,NULL);
INSERT INTO battery VALUES ('Triton 500 PT515-51-79ZP',4,NULL,NULL);
INSERT INTO battery VALUES ('Zephyrus S GX531GV-ES010T',4,60,'Wh');

--
-- Table structure for table `brandseries`
--

DROP TABLE IF EXISTS brandseries;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE brandseries (
  brand_series_id int(11) NOT NULL AUTO_INCREMENT,
  laptop_brand_id int(11) NOT NULL,
  brand_series_name varchar(45) DEFAULT NULL,
  PRIMARY KEY (brand_series_id),
  UNIQUE KEY laptop_series_name_UNIQUE (brand_series_name),
  KEY laptop_brand_id_idx (laptop_brand_id),
  CONSTRAINT laptop_brand_id FOREIGN KEY (laptop_brand_id) REFERENCES laptopbrand (laptop_brand_id) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brandseries`
--

INSERT INTO brandseries VALUES (1,1,'Inspiron');
INSERT INTO brandseries VALUES (2,3,'Swift');
INSERT INTO brandseries VALUES (3,3,'Predator');
INSERT INTO brandseries VALUES (4,1,'XPS');
INSERT INTO brandseries VALUES (5,6,'Pavilion');
INSERT INTO brandseries VALUES (6,5,'Macbook');
INSERT INTO brandseries VALUES (7,6,'Envy');
INSERT INTO brandseries VALUES (8,2,'ROG');
INSERT INTO brandseries VALUES (9,4,'Prestige');

--
-- Table structure for table `cpu`
--

DROP TABLE IF EXISTS cpu;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cpu` (
  cpu_brand_id int(11) NOT NULL,
  cpu_modifier varchar(45) NOT NULL,
  cpu_model varchar(45) NOT NULL,
  UNIQUE KEY cpu_model_UNIQUE (cpu_model),
  KEY cpu_brand_id_idx (cpu_brand_id),
  CONSTRAINT cpu_brand_id FOREIGN KEY (cpu_brand_id) REFERENCES cpubrand (cpu_brand_id),
  CONSTRAINT cpu_model FOREIGN KEY (cpu_model) REFERENCES cpumodel (cpu_model)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cpu`
--

INSERT INTO cpu VALUES (1,'Xeon E','2176M');
INSERT INTO cpu VALUES (1,'Xeon E','2186M');
INSERT INTO cpu VALUES (2,'Ryzen 3','2200U');
INSERT INTO cpu VALUES (2,'Ryzen 3','2300U');
INSERT INTO cpu VALUES (2,'Ryzen 5','2500U');
INSERT INTO cpu VALUES (2,'Ryzen 5','2600H');
INSERT INTO cpu VALUES (2,'Ryzen 7','2700U');
INSERT INTO cpu VALUES (2,'Ryzen 7','2800H');
INSERT INTO cpu VALUES (1,'Celeron','3865U');
INSERT INTO cpu VALUES (1,'Celeron','3965U');
INSERT INTO cpu VALUES (1,'Pentium','4410Y');
INSERT INTO cpu VALUES (1,'Pentium','4415U');
INSERT INTO cpu VALUES (1,'Core i3','7020U');
INSERT INTO cpu VALUES (1,'Core i3','7100H');
INSERT INTO cpu VALUES (1,'Core i3','7100U');
INSERT INTO cpu VALUES (1,'Core i3','7130U');
INSERT INTO cpu VALUES (1,'Core i3','7167U');
INSERT INTO cpu VALUES (1,'Core i5','7200U');
INSERT INTO cpu VALUES (1,'Core i5','7260U');
INSERT INTO cpu VALUES (1,'Core i5','7267U');
INSERT INTO cpu VALUES (1,'Core i5','7287U');
INSERT INTO cpu VALUES (1,'Core i5','7300HQ');
INSERT INTO cpu VALUES (1,'Core i5','7300U');
INSERT INTO cpu VALUES (1,'Core i5','7360U');
INSERT INTO cpu VALUES (1,'Core i5','7440HQ');
INSERT INTO cpu VALUES (1,'Core i7','7500U');
INSERT INTO cpu VALUES (1,'Core i7','7560U');
INSERT INTO cpu VALUES (1,'Core i7','7567U');
INSERT INTO cpu VALUES (1,'Core i7','7600U');
INSERT INTO cpu VALUES (1,'Core i7','7660U');
INSERT INTO cpu VALUES (1,'Core i7','7700HQ');
INSERT INTO cpu VALUES (1,'Core i7','7820HK');
INSERT INTO cpu VALUES (1,'Core i7','7820HQ');
INSERT INTO cpu VALUES (1,'Core i7','7920HQ');
INSERT INTO cpu VALUES (1,'Core m3','7Y30');
INSERT INTO cpu VALUES (1,'Core m3','7Y32');
INSERT INTO cpu VALUES (1,'Core i5','7Y54');
INSERT INTO cpu VALUES (1,'Core i5','7Y57');
INSERT INTO cpu VALUES (1,'Core i7','7Y75');
INSERT INTO cpu VALUES (1,'Core i3','8100H');
INSERT INTO cpu VALUES (1,'Core i3','8109U');
INSERT INTO cpu VALUES (1,'Core i3','8130U');
INSERT INTO cpu VALUES (1,'Core i5','8210Y');
INSERT INTO cpu VALUES (1,'Core i5','8250U');
INSERT INTO cpu VALUES (1,'Core i5','8259U');
INSERT INTO cpu VALUES (1,'Core i5','8265U');
INSERT INTO cpu VALUES (1,'Core i5','8269U');
INSERT INTO cpu VALUES (1,'Core i5','8300H');
INSERT INTO cpu VALUES (1,'Core i5','8350U');
INSERT INTO cpu VALUES (1,'Core i5','8400H');
INSERT INTO cpu VALUES (1,'Core i7','8550U');
INSERT INTO cpu VALUES (1,'Core i7','8559U');
INSERT INTO cpu VALUES (1,'Core i7','8565U');
INSERT INTO cpu VALUES (1,'Core i7','8650U');
INSERT INTO cpu VALUES (1,'Core i7','8750H');
INSERT INTO cpu VALUES (1,'Core i7','8850H');
INSERT INTO cpu VALUES (1,'Core i9','8950HK');

--
-- Table structure for table `cpubrand`
--

DROP TABLE IF EXISTS cpubrand;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE cpubrand (
  cpu_brand_id int(11) NOT NULL AUTO_INCREMENT,
  cpu_brand_name varchar(45) NOT NULL,
  PRIMARY KEY (cpu_brand_id)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cpubrand`
--

INSERT INTO cpubrand VALUES (1,'Intel');
INSERT INTO cpubrand VALUES (2,'AMD');

--
-- Table structure for table `cpumodel`
--

DROP TABLE IF EXISTS cpumodel;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE cpumodel (
  cpu_model varchar(45) NOT NULL,
  core int(11) NOT NULL,
  thread int(11) NOT NULL,
  cpu_base_freq float NOT NULL,
  cpu_max_freq float DEFAULT NULL,
  `cache` float NOT NULL,
  igpu_id varchar(45) NOT NULL,
  PRIMARY KEY (cpu_model),
  UNIQUE KEY cpu_model_UNIQUE (cpu_model) /*!80000 INVISIBLE */,
  KEY integrated_gpu_idx (igpu_id) /*!80000 INVISIBLE */,
  CONSTRAINT igpu_id FOREIGN KEY (igpu_id) REFERENCES integratedgpu (igpu_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cpumodel`
--

INSERT INTO cpumodel VALUES ('2176M',6,12,2.7,4.4,12,'UHD P630');
INSERT INTO cpumodel VALUES ('2186M',6,12,2.9,4.8,12,'UHD P630');
INSERT INTO cpumodel VALUES ('2200U',2,4,2.5,3.4,4,'Vega 3');
INSERT INTO cpumodel VALUES ('2300U',4,4,2,3.4,4,'Vega 6');
INSERT INTO cpumodel VALUES ('2500U',4,8,2,3.6,4,'Vega 8');
INSERT INTO cpumodel VALUES ('2600H',4,8,3.2,3.6,4,'Vega 8');
INSERT INTO cpumodel VALUES ('2700U',4,8,2.2,3.8,4,'Vega 10');
INSERT INTO cpumodel VALUES ('2800H',4,8,3.3,3.8,4,'Vega 11');
INSERT INTO cpumodel VALUES ('3865U',2,2,1.8,NULL,2,'HD 610');
INSERT INTO cpumodel VALUES ('3965U',2,2,2.2,NULL,2,'HD 610');
INSERT INTO cpumodel VALUES ('4410Y',2,4,1.5,NULL,2,'HD 615');
INSERT INTO cpumodel VALUES ('4415U',2,4,2.3,NULL,2,'HD 610');
INSERT INTO cpumodel VALUES ('7020U',2,4,2.3,NULL,3,'HD 620');
INSERT INTO cpumodel VALUES ('7100H',2,4,3,NULL,3,'HD 630');
INSERT INTO cpumodel VALUES ('7100U',2,4,2.4,NULL,3,'HD 620');
INSERT INTO cpumodel VALUES ('7130U',2,4,2.7,NULL,3,'HD 620');
INSERT INTO cpumodel VALUES ('7167U',2,4,2.8,NULL,3,'Iris Plus 650');
INSERT INTO cpumodel VALUES ('7200U',2,4,2.5,3.1,3,'HD 620');
INSERT INTO cpumodel VALUES ('7260U',2,4,2.2,3.4,4,'Iris Plus 640');
INSERT INTO cpumodel VALUES ('7267U',2,4,3.1,3.5,4,'Iris Plus 650');
INSERT INTO cpumodel VALUES ('7287U',2,4,3.3,3.7,4,'Iris Plus 650');
INSERT INTO cpumodel VALUES ('7300HQ',4,4,2.5,3.5,6,'HD 630');
INSERT INTO cpumodel VALUES ('7300U',2,4,2.6,3.5,3,'HD 620');
INSERT INTO cpumodel VALUES ('7360U',2,4,2.3,3.6,4,'Iris Plus 640');
INSERT INTO cpumodel VALUES ('7440HQ',4,4,2.8,3.8,6,'HD 630');
INSERT INTO cpumodel VALUES ('7500U',2,4,2.7,3.5,4,'HD 620');
INSERT INTO cpumodel VALUES ('7560U',2,4,2.4,3.8,4,'Iris Plus 640');
INSERT INTO cpumodel VALUES ('7567U',2,4,3.5,4,4,'Iris Plus 650');
INSERT INTO cpumodel VALUES ('7600U',2,4,2.8,3.9,4,'HD 620');
INSERT INTO cpumodel VALUES ('7660U',2,4,2.5,4,4,'Iris Plus 640');
INSERT INTO cpumodel VALUES ('7700HQ',4,8,2.8,3.8,6,'HD 630');
INSERT INTO cpumodel VALUES ('7820HK',4,8,2.9,3.9,8,'HD 630');
INSERT INTO cpumodel VALUES ('7820HQ',4,8,2.9,3.9,8,'HD 630');
INSERT INTO cpumodel VALUES ('7920HQ',4,8,3.1,4.1,8,'HD 630');
INSERT INTO cpumodel VALUES ('7Y30',2,4,1,2.6,4,'HD 615');
INSERT INTO cpumodel VALUES ('7Y32',2,4,1.1,3,4,'HD 615');
INSERT INTO cpumodel VALUES ('7Y54',2,4,1.2,3.2,4,'HD 615');
INSERT INTO cpumodel VALUES ('7Y57',2,4,1.2,3.3,4,'HD 615');
INSERT INTO cpumodel VALUES ('7Y75',2,4,1.3,3.6,4,'HD 615');
INSERT INTO cpumodel VALUES ('8100H',4,4,3,NULL,6,'UHD 630');
INSERT INTO cpumodel VALUES ('8109U',2,4,3,3.6,4,'Iris Plus 655');
INSERT INTO cpumodel VALUES ('8130U',2,4,2.2,3.4,4,'UHD 620');
INSERT INTO cpumodel VALUES ('8210Y',2,4,1.6,3.6,4,'UHD 617');
INSERT INTO cpumodel VALUES ('8250U',4,8,1.6,3.4,6,'UHD 620');
INSERT INTO cpumodel VALUES ('8259U',4,8,2.3,3.8,6,'Iris Plus 655');
INSERT INTO cpumodel VALUES ('8265U',4,8,1.6,3.9,6,'UHD 620');
INSERT INTO cpumodel VALUES ('8269U',4,8,2.6,4.2,6,'Iris Plus 655');
INSERT INTO cpumodel VALUES ('8300H',4,8,2.3,4,8,'UHD 630');
INSERT INTO cpumodel VALUES ('8350U',4,8,1.7,3.6,6,'UHD 620');
INSERT INTO cpumodel VALUES ('8400H',4,8,2.5,4.2,8,'UHD 630');
INSERT INTO cpumodel VALUES ('8550U',4,8,1.8,4,8,'UHD 620');
INSERT INTO cpumodel VALUES ('8559U',4,8,2.7,4.5,12,'Iris Plus 655');
INSERT INTO cpumodel VALUES ('8565U',4,8,1.8,4.6,8,'UHD 620');
INSERT INTO cpumodel VALUES ('8650U',4,8,1.9,4.2,8,'UHD 620');
INSERT INTO cpumodel VALUES ('8750H',6,12,2.2,4.1,9,'UHD 630');
INSERT INTO cpumodel VALUES ('8850H',6,12,2.6,4.3,9,'UHD 630');
INSERT INTO cpumodel VALUES ('8950HK',6,12,2.9,4.8,12,'UHD 630');

--
-- Table structure for table `display`
--

DROP TABLE IF EXISTS display;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE display (
  laptop_model varchar(45) NOT NULL,
  screen_size float NOT NULL,
  resolution varchar(45) NOT NULL,
  refresh_rate int(10) NOT NULL,
  UNIQUE KEY laptop_model_UNIQUE (laptop_model),
  CONSTRAINT screen_laptop_model FOREIGN KEY (laptop_model) REFERENCES laptopmodel (laptop_model) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `display`
--

INSERT INTO display VALUES ('13 9370-415PX1',13.3,'1920x1080',60);
INSERT INTO display VALUES ('13-ah0027TU',13.3,'1920x1080',60);
INSERT INTO display VALUES ('15-cs01045TX (5JL29PA)',15.6,'1920x1080',60);
INSERT INTO display VALUES ('3467 (P63F002N67T)',15.6,'1920x1080',60);
INSERT INTO display VALUES ('5 SF5 (NX.H7HSV.002)',14,'1920x1080',60);
INSERT INTO display VALUES ('Air 2018 (MRE82SA/A)',13.3,'2560x1600',60);
INSERT INTO display VALUES ('Helios 300 PH315-51-759Y',15.6,'1920x1080',60);
INSERT INTO display VALUES ('PS42 (476VN)',14,'1920x1080',60);
INSERT INTO display VALUES ('Triton 500 PT515-51-79ZP',15.6,'1920x1080',144);
INSERT INTO display VALUES ('Zephyrus S GX531GV-ES010T',15.6,'1920x1080',144);

--
-- Table structure for table `gpu`
--

DROP TABLE IF EXISTS gpu;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE gpu (
  gpu_brand_id int(11) NOT NULL,
  gpu_modifier varchar(45) NOT NULL,
  gpu_model varchar(45) NOT NULL,
  gpu_capacity1 int(10) NOT NULL,
  gpu_capacity2 int(10) DEFAULT NULL,
  gpu_bus_type varchar(45) NOT NULL,
  PRIMARY KEY (gpu_model),
  UNIQUE KEY gpu_model_UNIQUE (gpu_model),
  KEY gpu_brand_idx (gpu_brand_id),
  CONSTRAINT gpu_brand FOREIGN KEY (gpu_brand_id) REFERENCES gpubrand (gpu_brand_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gpu`
--

INSERT INTO gpu VALUES (1,'GeForce GTX','1050',2,4,'GDDR5');
INSERT INTO gpu VALUES (1,'GeForce GTX','1050 Max-Q',2,4,'GDDR5');
INSERT INTO gpu VALUES (1,'GeForce GTX','1050 Ti',4,NULL,'GDDR5');
INSERT INTO gpu VALUES (1,'GeForce GTX','1050 Ti Max-Q',4,NULL,'GDDR5');
INSERT INTO gpu VALUES (1,'GeForce GTX','1060',3,6,'GDDR5');
INSERT INTO gpu VALUES (1,'GeForce GTX','1060 Max-Q',3,6,'GDDR5');
INSERT INTO gpu VALUES (1,'GeForce GTX','1070',8,NULL,'GDDR5');
INSERT INTO gpu VALUES (1,'GeForce GTX','1070 Max-Q',8,NULL,'GDDR5');
INSERT INTO gpu VALUES (1,'GeForce GTX','1080',8,NULL,'GDDR5X');
INSERT INTO gpu VALUES (1,'GeForce GTX','1080 Max-Q',8,NULL,'GDDR5X');
INSERT INTO gpu VALUES (1,'GeForce RTX','2060',6,NULL,'GDDR6');
INSERT INTO gpu VALUES (1,'GeForce RTX','2070',8,NULL,'GDDR6');
INSERT INTO gpu VALUES (1,'GeForce RTX','2080',8,NULL,'GDDR6');
INSERT INTO gpu VALUES (2,'Radeon Pro','555',2,NULL,'GDDR5');
INSERT INTO gpu VALUES (2,'Radeon Pro','555X',4,NULL,'GDDR5');
INSERT INTO gpu VALUES (2,'Radeon Pro','560',4,NULL,'GDDR5');
INSERT INTO gpu VALUES (2,'Radeon Pro','560X',4,NULL,'GDDR5');
INSERT INTO gpu VALUES (2,'Radeon Pro','570',4,NULL,'GDDR5');
INSERT INTO gpu VALUES (2,'Radeon Pro','575',4,NULL,'GDDR5');
INSERT INTO gpu VALUES (2,'Radeon Pro','580',8,NULL,'GDDR5');
INSERT INTO gpu VALUES (1,'GeForce','910M',1,2,'DDR3');
INSERT INTO gpu VALUES (1,'GeForce','920M',1,2,'DDR3');
INSERT INTO gpu VALUES (1,'GeForce','920MX',2,NULL,'GDDR5');
INSERT INTO gpu VALUES (1,'GeForce','930M',2,NULL,'DDR3');
INSERT INTO gpu VALUES (1,'GeForce','930MX',2,NULL,'GDDR5');
INSERT INTO gpu VALUES (1,'GeForce','940M',2,NULL,'GDDR5');
INSERT INTO gpu VALUES (1,'GeForce','940MX',2,4,'GDDR5');
INSERT INTO gpu VALUES (1,'GeForce GT','945A',2,NULL,'DDR3');
INSERT INTO gpu VALUES (1,'GeForce','945M',2,NULL,'GDDR5');
INSERT INTO gpu VALUES (1,'GeForce GTX','950M',2,4,'GDDR5');
INSERT INTO gpu VALUES (1,'GeForce GTX','960M',2,4,'GDDR5');
INSERT INTO gpu VALUES (1,'GeForce GTX','965M',2,4,'GDDR5');
INSERT INTO gpu VALUES (1,'GeForce GTX','970M',3,6,'GDDR5');
INSERT INTO gpu VALUES (1,'GeForce GTX','980',4,8,'GDDR5');
INSERT INTO gpu VALUES (1,'GeForce GTX','980M',4,8,'GDDR5');
INSERT INTO gpu VALUES (1,'GeForce','MX110',2,NULL,'GDDR5');
INSERT INTO gpu VALUES (1,'GeForce','MX130',2,NULL,'GDDR5');
INSERT INTO gpu VALUES (1,'GeForce','MX150',2,4,'GDDR5');

--
-- Table structure for table `gpubrand`
--

DROP TABLE IF EXISTS gpubrand;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE gpubrand (
  gpu_brand_id int(11) NOT NULL AUTO_INCREMENT,
  gpu_brand_name varchar(45) NOT NULL,
  PRIMARY KEY (gpu_brand_id),
  UNIQUE KEY gpu_brand_id_UNIQUE (gpu_brand_id),
  UNIQUE KEY gpu_brand_name_UNIQUE (gpu_brand_name)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gpubrand`
--

INSERT INTO gpubrand VALUES (2,'AMD');
INSERT INTO gpubrand VALUES (1,'Nvidia');

--
-- Table structure for table `hdd`
--

DROP TABLE IF EXISTS hdd;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE hdd (
  laptop_model varchar(45) NOT NULL,
  hdd_capacity int(10) NOT NULL,
  rpm int(10) DEFAULT NULL,
  UNIQUE KEY laptop_model_UNIQUE (laptop_model),
  CONSTRAINT hdd_laptop_model FOREIGN KEY (laptop_model) REFERENCES laptopmodel (laptop_model) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hdd`
--

INSERT INTO hdd VALUES ('15-cs01045TX (5JL29PA)',1024,5400);
INSERT INTO hdd VALUES ('3467 (P63F002N67T)',1024,NULL);
INSERT INTO hdd VALUES ('Helios 300 PH315-51-759Y',1024,5400);

--
-- Table structure for table `integratedgpu`
--

DROP TABLE IF EXISTS integratedgpu;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE integratedgpu (
  igpu_id varchar(45) NOT NULL,
  igpu_name varchar(45) NOT NULL,
  PRIMARY KEY (igpu_id),
  UNIQUE KEY igpu_name_UNIQUE (igpu_name),
  UNIQUE KEY igpu_id_UNIQUE (igpu_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `integratedgpu`
--

INSERT INTO integratedgpu VALUES ('HD 610','Intel HD Graphics 610');
INSERT INTO integratedgpu VALUES ('HD 615','Intel HD Graphics 615');
INSERT INTO integratedgpu VALUES ('HD 620','Intel HD Graphics 620');
INSERT INTO integratedgpu VALUES ('HD 630','Intel HD Graphics 630');
INSERT INTO integratedgpu VALUES ('Iris Plus 640','Intel Iris Plus Graphics 640');
INSERT INTO integratedgpu VALUES ('Iris Plus 650','Intel Iris Plus Graphics 650');
INSERT INTO integratedgpu VALUES ('Iris Plus 655','Intel Iris Plus Graphics 655');
INSERT INTO integratedgpu VALUES ('UHD 617','Intel UHD Graphics 617');
INSERT INTO integratedgpu VALUES ('UHD 620','Intel UHD Graphics 620');
INSERT INTO integratedgpu VALUES ('UHD 630','Intel UHD Graphics 630');
INSERT INTO integratedgpu VALUES ('UHD P630','Intel UHD Graphics P630');
INSERT INTO integratedgpu VALUES ('Vega 10','Radeon™ RX Vega 10 Graphics');
INSERT INTO integratedgpu VALUES ('Vega 11','Radeon™ RX Vega 11 Graphics');
INSERT INTO integratedgpu VALUES ('Vega 3','Radeon™ RX Vega 3 Graphics');
INSERT INTO integratedgpu VALUES ('Vega 6','Radeon™ RX Vega 6 Graphics');
INSERT INTO integratedgpu VALUES ('Vega 8','Radeon™ RX Vega 8 Graphics');

--
-- Table structure for table `laptop`
--

DROP TABLE IF EXISTS laptop;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE laptop (
  brand_series_id int(11) NOT NULL,
  laptop_model varchar(45) NOT NULL,
  os_id int(11) DEFAULT NULL,
  laptop_price int(10) NOT NULL,
  date_released date DEFAULT NULL,
  image varchar(200) NOT NULL,
  UNIQUE KEY image_UNIQUE (image),
  KEY fk_laptop_model_idx (laptop_model),
  KEY os_id_idx (os_id),
  KEY brand_series_id_idx (brand_series_id),
  CONSTRAINT brand_series_id FOREIGN KEY (brand_series_id) REFERENCES brandseries (brand_series_id) ON UPDATE CASCADE,
  CONSTRAINT fk_laptop_model FOREIGN KEY (laptop_model) REFERENCES laptopmodel (laptop_model) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT os_id FOREIGN KEY (os_id) REFERENCES operatingsystem (os_id) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laptop`
--

INSERT INTO laptop VALUES (7,'13-ah0027TU',1,26490000,NULL,'636384034193136493_HP-Envy-13-ad076TU-3.png');
INSERT INTO laptop VALUES (3,'Triton 500 PT515-51-79ZP',1,79990000,NULL,'Acer-Predator-Triton-500-3-lbox-800x800-fefefe.jpg');
INSERT INTO laptop VALUES (2,'5 SF5 (NX.H7HSV.002)',1,29990000,NULL,'acer-swift-sf5-i7-8565u-8gb-256gb-win10-xanh-duong-2-org.jpg');
INSERT INTO laptop VALUES (6,'Air 2018 (MRE82SA/A)',3,31490000,NULL,'apple-macbook-air-mre82sa-a-i5-8gb-128gb-2018-2-1-org.jpg');
INSERT INTO laptop VALUES (1,'3467 (P63F002N67T)',1,11690000,NULL,'dell-inspiron-3576-i3-7020u-450-600x600.png');
INSERT INTO laptop VALUES (4,'13 9370-415PX1',1,41690000,NULL,'e58ae94b980935020cf27846d6490689.jpg');
INSERT INTO laptop VALUES (8,'Zephyrus S GX531GV-ES010T',1,53990000,NULL,'f7a6fb22b9c296f3cdb362872c1f7547_laptop asus gx531_2.jpg');
INSERT INTO laptop VALUES (5,'15-cs01045TX (5JL29PA)',1,15890000,NULL,'laptop_hp_pavilion_15-cs_2.jpg');
INSERT INTO laptop VALUES (3,'Helios 300 PH315-51-759Y',4,40999000,NULL,'Laptop-Acer-Predator-Helios-300-G3-572-50XL-2.jpg');
INSERT INTO laptop VALUES (9,'PS42 (476VN)',1,19490000,NULL,'msi-prestige-ps42-i5-8250u-4gb-256gb-14-win10-33397-thumb-123-600x600.jpg');

--
-- Table structure for table `laptopbrand`
--

DROP TABLE IF EXISTS laptopbrand;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE laptopbrand (
  laptop_brand_id int(11) NOT NULL AUTO_INCREMENT,
  laptop_brand_name varchar(45) NOT NULL,
  PRIMARY KEY (laptop_brand_id),
  UNIQUE KEY laptop_brand_name_UNIQUE (laptop_brand_name)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laptopbrand`
--

INSERT INTO laptopbrand VALUES (3,'Acer');
INSERT INTO laptopbrand VALUES (5,'Apple');
INSERT INTO laptopbrand VALUES (2,'Asus');
INSERT INTO laptopbrand VALUES (1,'Dell');
INSERT INTO laptopbrand VALUES (6,'HP');
INSERT INTO laptopbrand VALUES (8,'Lenovo');
INSERT INTO laptopbrand VALUES (7,'LG');
INSERT INTO laptopbrand VALUES (4,'MSI');

--
-- Table structure for table `laptopmodel`
--

DROP TABLE IF EXISTS laptopmodel;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE laptopmodel (
  laptop_model varchar(45) NOT NULL,
  cpu_model varchar(45) NOT NULL,
  gpu_model varchar(45) DEFAULT NULL,
  gpu_option int(10) DEFAULT NULL,
  PRIMARY KEY (laptop_model),
  UNIQUE KEY laptop_model_UNIQUE (laptop_model),
  KEY laptop_cpu_model_idx (cpu_model),
  KEY laptop_gpu_model_idx (gpu_model),
  CONSTRAINT laptop_cpu_model FOREIGN KEY (cpu_model) REFERENCES cpu (cpu_model),
  CONSTRAINT laptop_gpu_model FOREIGN KEY (gpu_model) REFERENCES gpu (gpu_model)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laptopmodel`
--

INSERT INTO laptopmodel VALUES ('13 9370-415PX1','8550U',NULL,NULL);
INSERT INTO laptopmodel VALUES ('13-ah0027TU','8550U',NULL,NULL);
INSERT INTO laptopmodel VALUES ('15-cs01045TX (5JL29PA)','8265U','MX130',1);
INSERT INTO laptopmodel VALUES ('3467 (P63F002N67T)','7020U',NULL,NULL);
INSERT INTO laptopmodel VALUES ('5 SF5 (NX.H7HSV.002)','8565U',NULL,NULL);
INSERT INTO laptopmodel VALUES ('Air 2018 (MRE82SA/A)','8210Y',NULL,NULL);
INSERT INTO laptopmodel VALUES ('Helios 300 PH315-51-759Y','8750H','1060',2);
INSERT INTO laptopmodel VALUES ('PS42 (476VN)','8250U',NULL,NULL);
INSERT INTO laptopmodel VALUES ('Triton 500 PT515-51-79ZP','8750H','2080',1);
INSERT INTO laptopmodel VALUES ('Zephyrus S GX531GV-ES010T','8750H','2060',1);

--
-- Table structure for table `operatingsystem`
--

DROP TABLE IF EXISTS operatingsystem;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE operatingsystem (
  os_id int(11) NOT NULL AUTO_INCREMENT,
  os_name varchar(45) NOT NULL,
  PRIMARY KEY (os_id),
  UNIQUE KEY os_name_UNIQUE (os_name),
  UNIQUE KEY os_id_UNIQUE (os_id)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operatingsystem`
--

INSERT INTO operatingsystem VALUES (4,'Linux');
INSERT INTO operatingsystem VALUES (3,'macOS');
INSERT INTO operatingsystem VALUES (5,'Ubuntu');
INSERT INTO operatingsystem VALUES (1,'Windows 10 Home');
INSERT INTO operatingsystem VALUES (2,'Windows 10 Pro');

--
-- Table structure for table `ram`
--

DROP TABLE IF EXISTS ram;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE ram (
  laptop_model varchar(45) NOT NULL,
  ram_generation varchar(45) NOT NULL,
  ram_capacity int(10) NOT NULL,
  ram_bus int(10) DEFAULT NULL,
  UNIQUE KEY laptop_model_UNIQUE (laptop_model),
  CONSTRAINT laptop_model FOREIGN KEY (laptop_model) REFERENCES laptopmodel (laptop_model) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ram`
--

INSERT INTO ram VALUES ('13 9370-415PX1','LPDDR3',8,NULL);
INSERT INTO ram VALUES ('13-ah0027TU','LPDDR3',8,2400);
INSERT INTO ram VALUES ('15-cs01045TX (5JL29PA)','DDR4',4,2666);
INSERT INTO ram VALUES ('3467 (P63F002N67T)','DDR4',4,2133);
INSERT INTO ram VALUES ('5 SF5 (NX.H7HSV.002)','DDR4',8,2133);
INSERT INTO ram VALUES ('Air 2018 (MRE82SA/A)','DDR3',8,2133);
INSERT INTO ram VALUES ('Helios 300 PH315-51-759Y','DDR4',16,2666);
INSERT INTO ram VALUES ('PS42 (476VN)','DDR4',4,2666);
INSERT INTO ram VALUES ('Triton 500 PT515-51-79ZP','DDR4',32,2666);
INSERT INTO ram VALUES ('Zephyrus S GX531GV-ES010T','DDR4',16,2666);

--
-- Table structure for table `ssd`
--

DROP TABLE IF EXISTS ssd;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE ssd (
  laptop_model varchar(45) NOT NULL,
  ssd_capacity int(10) NOT NULL,
  ssd_type_id int(11) DEFAULT NULL,
  UNIQUE KEY laptop_model_UNIQUE (laptop_model),
  KEY ssd_type_idx (ssd_type_id),
  CONSTRAINT ssd_laptop_model FOREIGN KEY (laptop_model) REFERENCES laptopmodel (laptop_model) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT ssd_type_id FOREIGN KEY (ssd_type_id) REFERENCES ssdtype (ssd_type_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ssd`
--

INSERT INTO ssd VALUES ('13 9370-415PX1',256,3);
INSERT INTO ssd VALUES ('13-ah0027TU',256,NULL);
INSERT INTO ssd VALUES ('5 SF5 (NX.H7HSV.002)',256,3);
INSERT INTO ssd VALUES ('Air 2018 (MRE82SA/A)',128,NULL);
INSERT INTO ssd VALUES ('Helios 300 PH315-51-759Y',256,3);
INSERT INTO ssd VALUES ('PS42 (476VN)',512,3);
INSERT INTO ssd VALUES ('Triton 500 PT515-51-79ZP',512,3);
INSERT INTO ssd VALUES ('Zephyrus S GX531GV-ES010T',512,3);

--
-- Table structure for table `ssdtype`
--

DROP TABLE IF EXISTS ssdtype;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE ssdtype (
  ssd_type_id int(11) NOT NULL AUTO_INCREMENT,
  ssd_type_name varchar(45) NOT NULL,
  PRIMARY KEY (ssd_type_id),
  UNIQUE KEY ssd_type_name_UNIQUE (ssd_type_name),
  UNIQUE KEY ssd_type_id_UNIQUE (ssd_type_id)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ssdtype`
--

INSERT INTO ssdtype VALUES (1,'2.5 inch');
INSERT INTO ssdtype VALUES (3,'M.2 NVMe');
INSERT INTO ssdtype VALUES (2,'M.2 SATA');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
