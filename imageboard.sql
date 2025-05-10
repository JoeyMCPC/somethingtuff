/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.11-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: imageboard
-- ------------------------------------------------------
-- Server version	10.11.11-MariaDB-0ubuntu0.24.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
INSERT INTO `announcements` VALUES
(6,'10-15 yappers were added, brace for impact ','2025-04-30 22:29:54'),
(9,'Changed UI a bit, the thread that was on the main screen is now /main/. ','2025-05-03 23:07:33');
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board_rules`
--

DROP TABLE IF EXISTS `board_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `board_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `board` varchar(255) NOT NULL,
  `rule` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board_rules`
--

LOCK TABLES `board_rules` WRITE;
/*!40000 ALTER TABLE `board_rules` DISABLE KEYS */;
INSERT INTO `board_rules` VALUES
(1,'nsfs','Don\'t Do Drugs'),
(2,'nsfs','No Racial Slurs '),
(3,'main','Don\'t post freaky stuff here, do it on /nsfs/'),
(4,'nsfs','If you\'re gonna make freaky jokes, make them funny and not just \"ooh he said a freaky thing\"'),
(5,'nsfs','Don\'t post freaky stuff as teachers'),
(6,'main','Don\'t excessively swear'),
(7,'aca','Only talk about academic subjects');
/*!40000 ALTER TABLE `board_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boards`
--

DROP TABLE IF EXISTS `boards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `boards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shortname` varchar(16) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shortname` (`shortname`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boards`
--

LOCK TABLES `boards` WRITE;
/*!40000 ALTER TABLE `boards` DISABLE KEYS */;
INSERT INTO `boards` VALUES
(1,'nsf','After School'),
(2,'nsfs','After School (again)'),
(3,'soft','Softie the Snowman'),
(4,'hard','Hardie resturant'),
(5,'aca','Academic Discussions');
/*!40000 ALTER TABLE `boards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `parent_id` int(11) DEFAULT NULL,
  `is_announcement` tinyint(1) DEFAULT 0,
  `board_id` int(11) NOT NULL DEFAULT 1,
  `board` varchar(20) DEFAULT 'main',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=270 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES
(1,'Anonymous L.A Teacher','I hate Henry ','2025-05-02 22:58:25',NULL,0,2,'main'),
(4,'2','autism','2025-05-02 23:04:26',NULL,0,1,'main'),
(6,'Anonymous','A','2025-05-02 23:05:58',NULL,0,1,'nsfs'),
(7,'','LMC','2025-05-02 23:06:00',NULL,0,1,'main'),
(10,'Joey','Ok yall do ts on /nsfs/ \r\n','2025-05-02 23:07:10',NULL,0,1,'main'),
(11,'','Communism, as an ideology and historical system, presents a complex mix of arguments for and against its viability. While some argue that communist systems have proven ineffective in practice, particularly in centrally planned economies like the Soviet Union, others point to successful social and economic outcomes in some communist regimes. The core tenets of communism, such as common ownership and a classless society, are often presented as ideals, though their practical implementation has varied significantly across different communist states.Communism, as an ideology and historical system, presents a complex mix of arguments for and against its viability. While some argue that communist systems have proven ineffective in practice, particularly in centrally planned economies like the Soviet Union, others point to successful social and economic outcomes in some communist regimes. The core tenets of communism, such as common ownership and a classless society, are often presented as ideals, though their practical implementation has varied significantly across different communist states.Communism, as an ideology and historical system, presents a complex mix of arguments for and against its viability. While some argue that communist systems have proven ineffective in practice, particularly in centrally planned economies like the Soviet Union, others point to successful social and economic outcomes in some communist regimes. The core tenets of communism, such as common ownership and a classless society, are often presented as ideals, though their practical implementation has varied significantly across different communist states.Communism, as an ideology and historical system, presents a complex mix of arguments for and against its viability. While some argue that communist systems have proven ineffective in practice, particularly in centrally planned economies like the Soviet Union, others point to successful social and economic outcomes in some communist regimes. The core tenets of communism, such as common ownership and a classless society, are often presented as ideals, though their practical implementation has varied significantly across different communist states.Communism, as an ideology and historical system, presents a complex mix of arguments for and against its viability. While some argue that communist systems have proven ineffective in practice, particularly in centrally planned economies like the Soviet Union, others point to successful social and economic outcomes in some communist regimes. The core tenets of communism, such as common ownership and a classless society, are often presented as ideals, though their practical implementation has varied significantly across different communist states.','2025-05-02 23:07:22',NULL,0,1,'main'),
(12,'','Communism, as an ideology and historical system, presents a complex mix of arguments for and against its viability. While some argue that communist systems have proven ineffective in practice, particularly in centrally planned economies like the Soviet Union, others point to successful social and economic outcomes in some communist regimes. The core tenets of communism, such as common ownership and a classless society, are often presented as ideals, though their practical implementation has varied significantly across different communist states.','2025-05-02 23:07:24',NULL,0,1,'main'),
(13,'','Communism, as an ideology and historical system, presents a complex mix of arguments for and against its viability. While some argue that communist systems have proven ineffective in practice, particularly in centrally planned economies like the Soviet Union, others point to successful social and economic outcomes in some communist regimes. The core tenets of communism, such as common ownership and a classless society, are often presented as ideals, though their practical implementation has varied significantly across different communist states.','2025-05-02 23:07:25',NULL,0,1,'main'),
(14,'','Communism, as an ideology and historical system, presents a complex mix of arguments for and against its viability. While some argue that communist systems have proven ineffective in practice, particularly in centrally planned economies like the Soviet Union, others point to successful social and economic outcomes in some communist regimes. The core tenets of communism, such as common ownership and a classless society, are often presented as ideals, though their practical implementation has varied significantly across different communist states.','2025-05-02 23:07:26',NULL,0,1,'main'),
(16,'Anonymous','eww i hate the black henry\r\n','2025-05-02 23:07:27',NULL,0,1,'nsfs'),
(17,'','Communism, as an ideology and historical system, presents a complex mix of arguments for and against its viability. While some argue that communist systems have proven ineffective in practice, particularly in centrally planned economies like the Soviet Union, others point to successful social and economic outcomes in some communist regimes. The core tenets of communism, such as common ownership and a classless society, are often presented as ideals, though their practical implementation has varied significantly across different communist states.','2025-05-02 23:07:28',NULL,0,1,'main'),
(18,'','Communism, as an ideology and historical system, presents a complex mix of arguments for and against its viability. While some argue that communist systems have proven ineffective in practice, particularly in centrally planned economies like the Soviet Union, others point to successful social and economic outcomes in some communist regimes. The core tenets of communism, such as common ownership and a classless society, are often presented as ideals, though their practical implementation has varied significantly across different communist states.','2025-05-02 23:07:38',NULL,0,1,'main'),
(19,'','Communism, as an ideology and historical system, presents a complex mix of arguments for and against its viability. While some argue that communist systems have proven ineffective in practice, particularly in centrally planned economies like the Soviet Union, others point to successful social and economic outcomes in some communist regimes. The core tenets of communism, such as common ownership and a classless society, are often presented as ideals, though their practical implementation has varied significantly across different communist states.','2025-05-02 23:07:38',NULL,0,1,'main'),
(20,'','Communism, as an ideology and historical system, presents a complex mix of arguments for and against its viability. While some argue that communist systems have proven ineffective in practice, particularly in centrally planned economies like the Soviet Union, others point to successful social and economic outcomes in some communist regimes. The core tenets of communism, such as common ownership and a classless society, are often presented as ideals, though their practical implementation has varied significantly across different communist states.','2025-05-02 23:07:40',NULL,0,1,'main'),
(21,'','Communism, as an ideology and historical system, presents a complex mix of arguments for and against its viability. While some argue that communist systems have proven ineffective in practice, particularly in centrally planned economies like the Soviet Union, others point to successful social and economic outcomes in some communist regimes. The core tenets of communism, such as common ownership and a classless society, are often presented as ideals, though their practical implementation has varied significantly across different communist states.','2025-05-02 23:07:42',NULL,0,1,'main'),
(22,'','Communism, as an ideology and historical system, presents a complex mix of arguments for and against its viability. While some argue that communist systems have proven ineffective in practice, particularly in centrally planned economies like the Soviet Union, others point to successful social and economic outcomes in some communist regimes. The core tenets of communism, such as common ownership and a classless society, are often presented as ideals, though their practical implementation has varied significantly across different communist states.','2025-05-02 23:07:45',NULL,0,1,'main'),
(25,'Anonymous','joey can you make it nsfw board?? PLEASE JOEYYY PLEASEE','2025-05-02 23:08:18',NULL,0,1,'nsfs'),
(32,'','Communism, as an ideology and historical system, presents a complex mix of arguments for and against its viability. While some argue that communist systems have proven ineffective in practice, particularly in centrally planned economies like the Soviet Union, others point to successful social and economic outcomes in some communist regimes. The core tenets of communism, such as common ownership and a classless society, are often presented as ideals, though their practical implementation has varied significantly across different communist states.','2025-05-02 23:08:52',NULL,0,1,'main'),
(33,'','Communism, as an ideology and historical system, presents a complex mix of arguments for and against its viability. While some argue that communist systems have proven ineffective in practice, particularly in centrally planned economies like the Soviet Union, others point to successful social and economic outcomes in some communist regimes. The core tenets of communism, such as common ownership and a classless society, are often presented as ideals, though their practical implementation has varied significantly across different communist states.','2025-05-02 23:08:53',NULL,0,1,'main'),
(35,'','Communism, as an ideology and historical system, presents a complex mix of arguments for and against its viability. While some argue that communist systems have proven ineffective in practice, particularly in centrally planned economies like the Soviet Union, others point to successful social and economic outcomes in some communist regimes. The core tenets of communism, such as common ownership and a classless society, are often presented as ideals, though their practical implementation has varied significantly across different communist states.','2025-05-02 23:09:40',NULL,0,1,'main'),
(36,'','Communism, as an ideology and historical system, presents a complex mix of arguments for and against its viability. While some argue that communist systems have proven ineffective in practice, particularly in centrally planned economies like the Soviet Union, others point to successful social and economic outcomes in some communist regimes. The core tenets of communism, such as common ownership and a classless society, are often presented as ideals, though their practical implementation has varied significantly across different communist states.','2025-05-02 23:09:41',NULL,0,1,'main'),
(37,'','Communism, as an ideology and historical system, presents a complex mix of arguments for and against its viability. While some argue that communist systems have proven ineffective in practice, particularly in centrally planned economies like the Soviet Union, others point to successful social and economic outcomes in some communist regimes. The core tenets of communism, such as common ownership and a classless society, are often presented as ideals, though their practical implementation has varied significantly across different communist states.','2025-05-02 23:09:43',NULL,0,1,'main'),
(39,'Anonymous','Communism, as an ideology and historical system, presents a complex mix of arguments for and against its viability. While some argue that communist systems have proven ineffective in practice, particularly in centrally planned economies like the Soviet Union, others point to successful social and economic outcomes in some communist regimes. The core tenets of communism, such as common ownership and a classless society, are often presented as ideals, though their practical implementation has varied significantly across different communist states.','2025-05-02 23:09:49',NULL,0,1,'nsfs'),
(41,'Anonymous','a','2025-05-02 23:11:03',NULL,0,1,'nsfs'),
(42,'Douglas ','I just married Isaac rosensweet call me Henry Rosensweet','2025-05-02 23:13:11',NULL,0,1,'main'),
(45,'Anonymous','I hate ts','2025-05-02 23:19:44',NULL,0,1,'nsf'),
(48,'51','50','2025-05-03 00:12:10',NULL,0,1,'main'),
(58,'gurt','sybau','2025-05-03 22:27:12',42,0,1,'main'),
(59,'Joey','Hi Wsp','2025-05-03 22:27:48',NULL,0,1,'nsfs'),
(61,'grandma mijers','joey is looking real cute rn','2025-05-03 22:28:13',42,0,1,'main'),
(63,'grandma mijers','why is mr beast kinda caked up though\r\n','2025-05-03 22:30:35',42,0,1,'main'),
(64,'Joey','why is mr thomas kinda packing fr\r\n','2025-05-03 22:32:01',NULL,0,1,'nsfs'),
(65,'Joey','@douglas likes someone who is blond, tall, reasonably attractive, and rather annoying','2025-05-03 23:00:03',NULL,0,1,'nsfs'),
(67,'Xavier','Ladies ladies, one at a time ','2025-05-03 23:01:10',65,0,1,'nsfs'),
(68,'Henry Alexander Rosensweet','Oh my god xavier, you are so hot and sexy, I just want to GOON ON YOU ','2025-05-03 23:01:54',67,0,1,'nsfs'),
(69,'Issac Bob Bob','Keep yourself safe Henry','2025-05-03 23:03:03',68,0,1,'nsfs'),
(70,'gurt','sybau aint no one ask yo ass','2025-05-03 23:31:06',45,0,1,'nsf'),
(71,'Brr Brr Bicus Dicus','shut your ***** ass up before i cum in your ass','2025-05-03 23:32:32',59,0,1,'nsfs'),
(74,'fr','what did i do ','2025-05-03 23:34:05',73,0,1,'main'),
(75,'i','idk man','2025-05-03 23:34:16',74,0,1,'main'),
(76,'idk','what? you called me?','2025-05-03 23:34:33',75,0,1,'main'),
(77,'me','no he called you','2025-05-03 23:35:00',76,0,1,'main'),
(78,'you','leave me out of ts','2025-05-03 23:35:12',77,0,1,'main'),
(79,'ts','never wanted you in me','2025-05-03 23:35:24',78,0,1,'main'),
(80,'in','dont mention my name gng','2025-05-03 23:35:44',79,0,1,'main'),
(81,'name','bro we is not tight','2025-05-03 23:35:59',80,0,1,'main'),
(82,'we',':(','2025-05-03 23:36:06',81,0,1,'main'),
(86,'Brr Brr Bicus Dicus','shut your ***** ass up before i cum in your ass','2025-05-03 23:37:31',59,0,1,'nsfs'),
(87,'Brr Brr Bicus Dicus','shut your ***** ass up before i cum in your ass','2025-05-03 23:37:31',59,0,1,'nsfs'),
(88,'Brr Brr Bicus Dicus','shut your ***** ass up before i cum in your ass','2025-05-03 23:37:34',59,0,1,'nsfs'),
(91,'Joey','Henry let\'s touch tips','2025-05-03 23:59:25',NULL,0,1,'nsfs'),
(93,'Henry','Awww that\'s so cute','2025-05-04 00:00:22',91,0,1,'nsfs'),
(94,'Halexainslee Smith','I love Men','2025-05-04 00:28:36',NULL,0,1,'nsfs'),
(95,'Halexainslee Harshil Lover Demarco Rosensweet','Got my name wrong Faker','2025-05-04 00:29:02',94,0,1,'nsfs'),
(96,'Halexainslee Smith','I mean in a sexual way, not romantical','2025-05-04 00:29:12',94,0,1,'nsfs'),
(97,'Halexainslee Smith','Scratch that I love kids','2025-05-04 00:29:35',96,0,1,'nsfs'),
(98,'Henry Alexender Smith','today was such a NIce day, my friends and i drank GoGo squEeze, Really refreShing','2025-05-04 00:31:00',NULL,0,1,'nsfs'),
(99,'Harshil','You can gogo squeeze me any day','2025-05-04 00:31:55',98,0,1,'nsfs'),
(100,'henry alxenders smitthernivvefer','erm what the lover of kids','2025-05-04 00:32:39',NULL,0,1,'nsfs'),
(101,'hnery migger  smither','I love kids','2025-05-04 00:33:07',100,0,1,'nsfs'),
(102,'Henry\'s Left Testicle','bloop bloop bloop (I\'ve never seen a woman in my life)','2025-05-04 00:34:31',NULL,0,1,'nsfs'),
(104,'Halexainslee Harshil Lover Demarco Rosensweet','Erm, this is inaccurate ','2025-05-04 00:37:03',102,0,1,'nsfs'),
(105,'Henry\'s dog','woof woof woof (Henry put yo **** away, it\'s the fifth time you\'ve replaced by toy with that)','2025-05-04 00:38:13',NULL,0,1,'nsfs'),
(106,'Henry\'s Right Testicle','bleep bleep bleep (nah he\'s pretty accurate)','2025-05-04 00:39:11',104,0,1,'nsfs'),
(109,'Heny\'s Mom','...','2025-05-04 00:40:41',106,0,1,'nsfs'),
(110,'Heny','Hey man I think I count','2025-05-04 00:42:47',102,0,1,'nsfs'),
(111,'gurt','sybau heny','2025-05-04 00:43:08',110,0,1,'nsfs'),
(114,'Anonymous','goon','2025-05-04 03:07:28',NULL,0,1,'hard'),
(115,'Soft Serve','I like licking my ice cream','2025-05-04 15:02:10',NULL,0,1,'soft'),
(116,'Gorilla','*Deep* Ooh ooh ahh ahh','2025-05-04 15:22:35',NULL,0,1,'nsfs'),
(117,'Joey','Guys Mr DeVictor and Eli Fox just assaulted me for what MR DEVICTOR was posting. I had nothing to do with it, he posted it himself.','2025-05-05 12:02:44',NULL,0,1,'main'),
(118,'DeVictor','Sure','2025-05-05 12:02:54',117,0,1,'main'),
(119,'DeVictor','I cry at night when people in my classes bully me ','2025-05-05 12:11:41',NULL,0,1,'main'),
(120,'Anonymous L.A Teacher','Hooray','2025-05-05 14:13:34',NULL,0,1,'aca'),
(121,'You know who','LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL','2025-05-05 14:54:30',119,0,1,'main'),
(122,'Comrade','USSR: sent the first man, dog satellite, object, into space\r\n\r\nUS: went to moon\r\n\r\nUs wins','2025-05-05 16:16:54',NULL,0,1,'main'),
(123,'Unlce Sam','USA USA USA!','2025-05-05 16:18:39',NULL,0,1,'main'),
(124,'Hard Serve','sybau','2025-05-05 16:56:33',115,0,1,'soft'),
(125,'Ainslee','that is not hot Henry','2025-05-05 16:57:53',68,0,1,'nsfs'),
(126,'Comrade Opposition','sy\r\n\r\nba\r\n\r\nu','2025-05-05 17:05:05',122,0,1,'main'),
(127,'Root beer beer','sybau','2025-05-05 17:23:27',120,0,1,'aca'),
(128,'Anonymous','bs','2025-05-05 17:27:01',NULL,0,1,'bs'),
(129,'Anonymous','bs','2025-05-05 17:27:02',NULL,0,1,'bs'),
(130,'bs founder','bs','2025-05-05 17:32:02',NULL,0,1,'bs'),
(131,'glazing leppookie','LeBron James\'s \"aura\" in the NBA is often discussed in terms of his ability to connect with teammates, fans, and the game itself. He\'s described as more social and involved than players like Kobe Bryant, who were perceived as more reserved. Some argue that LeBron lacks the \"GOAT aura\" of other legendary athletes like Michael Jordan, Lionel Messi, or Tiger Woods, suggesting a different kind of leadership style. \r\nElaboration:\r\nSocial and Involved:\r\nD\'Angelo Russell, for instance, compared LeBron\'s approach to that of Kobe Bryant. LeBron is described as more social and involved on the bus and plane, while Kobe was more reserved. \r\nLeadership Style:\r\nSome suggest LeBron\'s leadership style is less about a commanding presence and more about a more collaborative and engaging approach, which might not be as widely perceived as \"GOAT\" aura. \r\nGOAT Debate:\r\nThe concept of aura is often tied to the \"GOAT\" (Greatest of All Time) debate in sports. While LeBron is undeniably a great player, some argue that his leadership style and perceived \"aura\" differ from those of players like Michael Jordan. \r\nSubjectivity:\r\nThe notion of \"aura\" is subjective and open to interpretation. What one person perceives as a strong aura, another may see as a different type of leadership or persona. ','2025-05-05 17:54:25',NULL,0,1,'main'),
(132,'I love big coks','guys we should all whip it out at skool so we can compare sizes and then we canstick it in something','2025-05-05 17:55:46',NULL,0,1,'nsfs'),
(133,'Leer','gUyS i LoVe HeNrY mAsSiVe BaLlSaCk so tick and juicy','2025-05-05 17:57:52',NULL,0,1,'nsfs'),
(135,'Anonymous','amoung us sussy imposter on Diddy???','2025-05-05 19:04:02',NULL,0,1,'bs'),
(136,'Anonymous','amoung us sussy imposter on Diddy???','2025-05-05 19:04:02',NULL,0,1,'bs'),
(137,'Anonymous','amoung us sussy imposter on Diddy???','2025-05-05 19:04:03',NULL,0,1,'bs'),
(138,'Anonymous','amoung us sussy imposter on Diddy???','2025-05-05 19:04:03',NULL,0,1,'bs'),
(139,'Anonymous','amoung us sussy imposter on Diddy???','2025-05-05 19:04:05',NULL,0,1,'bs'),
(140,'Anonymous','*****','2025-05-05 21:55:08',NULL,0,1,'bs'),
(141,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:42',NULL,0,1,'i hate niggers'),
(142,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:42',NULL,0,1,'i hate niggers'),
(143,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:42',NULL,0,1,'i hate niggers'),
(144,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:42',NULL,0,1,'i hate niggers'),
(145,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:42',NULL,0,1,'i hate niggers'),
(146,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:42',NULL,0,1,'i hate niggers'),
(147,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:42',NULL,0,1,'i hate niggers'),
(148,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:43',NULL,0,1,'i hate niggers'),
(149,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:43',NULL,0,1,'i hate niggers'),
(150,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:43',NULL,0,1,'i hate niggers'),
(151,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:43',NULL,0,1,'i hate niggers'),
(152,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:43',NULL,0,1,'i hate niggers'),
(153,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:43',NULL,0,1,'i hate niggers'),
(154,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:43',NULL,0,1,'i hate niggers'),
(155,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:43',NULL,0,1,'i hate niggers'),
(156,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:43',NULL,0,1,'i hate niggers'),
(157,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:43',NULL,0,1,'i hate niggers'),
(158,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:44',NULL,0,1,'i hate niggers'),
(159,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:44',NULL,0,1,'i hate niggers'),
(160,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:44',NULL,0,1,'i hate niggers'),
(161,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:44',NULL,0,1,'i hate niggers'),
(162,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:45',NULL,0,1,'i hate niggers'),
(163,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:45',NULL,0,1,'i hate niggers'),
(164,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:45',NULL,0,1,'i hate niggers'),
(165,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:45',NULL,0,1,'i hate niggers'),
(166,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:46',NULL,0,1,'i hate niggers'),
(167,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:46',NULL,0,1,'i hate niggers'),
(168,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:46',NULL,0,1,'i hate niggers'),
(169,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:46',NULL,0,1,'i hate niggers'),
(170,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:46',NULL,0,1,'i hate niggers'),
(171,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:46',NULL,0,1,'i hate niggers'),
(172,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:46',NULL,0,1,'i hate niggers'),
(173,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:46',NULL,0,1,'i hate niggers'),
(174,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:46',NULL,0,1,'i hate niggers'),
(175,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:47',NULL,0,1,'i hate niggers'),
(176,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:47',NULL,0,1,'i hate niggers'),
(177,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:47',NULL,0,1,'i hate niggers'),
(178,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:47',NULL,0,1,'i hate niggers'),
(179,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:47',NULL,0,1,'i hate niggers'),
(180,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:47',NULL,0,1,'i hate niggers'),
(181,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:47',NULL,0,1,'i hate niggers'),
(182,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:47',NULL,0,1,'i hate niggers'),
(183,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:47',NULL,0,1,'i hate niggers'),
(184,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:47',NULL,0,1,'i hate niggers'),
(185,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:48',NULL,0,1,'i hate niggers'),
(186,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:48',NULL,0,1,'i hate niggers'),
(187,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:48',NULL,0,1,'i hate niggers'),
(188,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:58',NULL,0,1,'i hate niggers'),
(189,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:58',NULL,0,1,'i hate niggers'),
(190,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:58',NULL,0,1,'i hate niggers'),
(191,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:58',NULL,0,1,'i hate niggers'),
(192,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:58',NULL,0,1,'i hate niggers'),
(193,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:58',NULL,0,1,'i hate niggers'),
(194,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:58',NULL,0,1,'i hate niggers'),
(195,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:58',NULL,0,1,'i hate niggers'),
(196,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:58',NULL,0,1,'i hate niggers'),
(197,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:58',NULL,0,1,'i hate niggers'),
(198,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:59',NULL,0,1,'i hate niggers'),
(199,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:59',NULL,0,1,'i hate niggers'),
(200,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:56:59',NULL,0,1,'i hate niggers'),
(201,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:57:00',NULL,0,1,'i hate niggers'),
(202,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:57:00',NULL,0,1,'i hate niggers'),
(203,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:57:00',NULL,0,1,'i hate niggers'),
(204,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:57:00',NULL,0,1,'i hate niggers'),
(205,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:57:00',NULL,0,1,'i hate niggers'),
(206,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:57:00',NULL,0,1,'i hate niggers'),
(207,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:57:00',NULL,0,1,'i hate niggers'),
(208,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:57:00',NULL,0,1,'i hate niggers'),
(209,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:57:01',NULL,0,1,'i hate niggers'),
(210,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:57:01',NULL,0,1,'i hate niggers'),
(211,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:57:02',NULL,0,1,'i hate niggers'),
(212,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:57:02',NULL,0,1,'i hate niggers'),
(213,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:57:02',NULL,0,1,'i hate niggers'),
(214,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:57:02',NULL,0,1,'i hate niggers'),
(215,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:57:02',NULL,0,1,'i hate niggers'),
(216,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:57:02',NULL,0,1,'i hate niggers'),
(217,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:57:02',NULL,0,1,'i hate niggers'),
(218,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:57:02',NULL,0,1,'i hate niggers'),
(219,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:57:03',NULL,0,1,'i hate niggers'),
(220,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:57:03',NULL,0,1,'i hate niggers'),
(221,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:57:03',NULL,0,1,'i hate niggers'),
(222,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:57:03',NULL,0,1,'i hate niggers'),
(223,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:57:04',NULL,0,1,'i hate niggers'),
(224,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:57:04',NULL,0,1,'i hate niggers'),
(225,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:57:04',NULL,0,1,'i hate niggers'),
(226,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:57:07',NULL,0,1,'i hate niggers'),
(227,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:57:08',NULL,0,1,'i hate niggers'),
(228,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:57:08',NULL,0,1,'i hate niggers'),
(229,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:57:08',NULL,0,1,'i hate niggers'),
(230,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:57:08',NULL,0,1,'i hate niggers'),
(231,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:57:09',NULL,0,1,'i hate niggers'),
(232,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:57:10',NULL,0,1,'i hate niggers'),
(233,'ewwww n1ggas','nigg4 uprise','2025-05-05 21:57:16',NULL,0,1,'i hate niggers'),
(234,'Joseph Stalin','Communism ','2025-05-06 12:19:39',NULL,0,1,'main'),
(236,'Anonymous','skibito bondito\r\n','2025-05-06 14:10:44',NULL,0,1,'aca'),
(237,'Anonymous L.A Teacher','hi','2025-05-06 14:11:25',NULL,0,1,'aca'),
(238,'Anonymous','yo gurt','2025-05-06 16:20:58',NULL,0,1,'main'),
(239,'gurt','yo','2025-05-06 16:21:23',238,0,1,'main'),
(240,'Anonymous','wanna have some fun together','2025-05-06 16:33:22',239,0,1,'main'),
(241,'gurt\'s father','who are you and why are you talking to my daughter','2025-05-06 17:04:15',238,0,1,'main'),
(242,'gurt','sybau','2025-05-06 17:20:08',240,0,1,'main'),
(243,':)','hello','2025-05-06 17:21:42',NULL,0,1,'main'),
(244,':(','i hate you because you are different from me ','2025-05-06 17:29:59',243,0,1,'main'),
(245,':{(','Ayyyyyy lets just be chill','2025-05-06 17:42:35',244,0,1,'main'),
(246,'gurt','sybau','2025-05-06 18:59:42',245,0,1,'main'),
(247,'gurt','sybau','2025-05-06 18:59:43',245,0,1,'main'),
(248,'Anonymous','hi\r\n','2025-05-06 19:00:48',NULL,0,1,'main'),
(249,'gurt','sybau','2025-05-06 19:01:06',248,0,1,'main'),
(250,'Anonymous','sylau','2025-05-06 19:01:28',249,0,1,'main'),
(251,'Anonymous','*****','2025-05-06 19:02:48',NULL,0,1,'test'),
(252,'Anonymous','****','2025-05-06 19:02:54',NULL,0,1,'test'),
(253,'Anonymous','****','2025-05-06 19:02:57',NULL,0,1,'test'),
(254,'Anonymous','mazafaka\r\n','2025-05-06 19:03:06',NULL,0,1,'test'),
(255,'Anonymous','mother****er','2025-05-06 19:03:13',NULL,0,1,'test'),
(256,'Anonymous','****\r\n','2025-05-06 19:03:18',NULL,0,1,'test'),
(257,'Anonymous','fak u\r\n','2025-05-06 19:03:27',NULL,0,1,'test'),
(258,'Anonymous','rape','2025-05-06 19:03:54',NULL,0,1,'test'),
(259,'Anonymous','kids','2025-05-06 19:04:06',NULL,0,1,'test'),
(260,'Anonymous','rape kids','2025-05-06 19:04:10',NULL,0,1,'test'),
(261,'I am steave','This! Is a crafting table!','2025-05-07 17:04:42',NULL,0,1,'main'),
(262,'infant zombie','yay me on chiken','2025-05-07 17:05:32',261,0,1,'main'),
(263,'I am steave','Aaaa! A, chicken jokey','2025-05-07 17:06:00',262,0,1,'main'),
(264,'Stalin Joseph ','why did you steal my name?','2025-05-07 17:07:07',234,0,1,'main'),
(265,'mikhail','I might like children','2025-05-07 17:07:43',NULL,0,1,'mikhail'),
(266,'Joseph Stalin','No, comrade that is OUR name.','2025-05-07 17:07:51',264,0,1,'main'),
(267,'s','sybau mf','2025-05-07 18:51:34',NULL,0,1,'main'),
(268,':)','The war...','2025-05-08 17:31:41',244,0,1,'main'),
(269,'Anonymous','Je suis anonymous','2025-05-09 15:46:17',NULL,0,1,'main');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rules`
--

DROP TABLE IF EXISTS `rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rules`
--

LOCK TABLES `rules` WRITE;
/*!40000 ALTER TABLE `rules` DISABLE KEYS */;
INSERT INTO `rules` VALUES
(1,'Dont do drugs kids');
/*!40000 ALTER TABLE `rules` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-10 11:18:10
