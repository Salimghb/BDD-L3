-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: Localhost:3306
-- Generation Time: Jan 18, 2017 at 11:07 AM
-- Server version: 5.5.24-log
-- PHP Version: 5.3.3-7+squeeze19

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bd_o2142062`
--

-- --------------------------------------------------------

--
-- Table structure for table `Acteur`
--

CREATE TABLE IF NOT EXISTS `Acteur` (
  `Id_Artiste` int(11) NOT NULL,
  `Id_Film` int(11) NOT NULL,
  PRIMARY KEY (`Id_Artiste`,`Id_Film`),
  KEY `FK_Acteur_Film` (`Id_Film`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Acteur`
--

INSERT INTO `Acteur` (`Id_Artiste`, `Id_Film`) VALUES
(2, 1),
(3, 1),
(5, 2),
(6, 2);

-- --------------------------------------------------------

--
-- Table structure for table `Artiste`
--

CREATE TABLE IF NOT EXISTS `Artiste` (
  `Id_Artiste` int(11) NOT NULL AUTO_INCREMENT,
  `Prenom` char(64) DEFAULT NULL,
  `Nom` char(64) DEFAULT NULL,
  PRIMARY KEY (`Id_Artiste`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `Artiste`
--

INSERT INTO `Artiste` (`Id_Artiste`, `Prenom`, `Nom`) VALUES
(1, 'James', 'Cameron'),
(2, 'Sigourney', 'Weaver'),
(3, 'Zoe', 'Saldana'),
(4, 'Gary', 'Ross'),
(5, 'Jennifer', 'Lawrence'),
(6, 'Josh', 'Hutcherson');

-- --------------------------------------------------------

--
-- Table structure for table `Commentaire`
--

CREATE TABLE IF NOT EXISTS `Commentaire` (
  `Id_Commentaire` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Film` int(11) NOT NULL,
  `Auteur_Comm` char(64) DEFAULT NULL,
  `Date_post_comm` datetime DEFAULT NULL,
  `Contenu_comm` text,
  PRIMARY KEY (`Id_Commentaire`),
  KEY `FK_Commentaire_Film` (`Id_Film`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `Commentaire`
--

INSERT INTO `Commentaire` (`Id_Commentaire`, `Id_Film`, `Auteur_Comm`, `Date_post_comm`, `Contenu_comm`) VALUES
(1, 1, '@jaimelecinema', '2014-02-20 09:26:00', 'Impossible de ne pas aimer ce film fantastique rempli de couleurs et qui donne envie de s’évader. J’ai été absorbée par ce film, de telle sorte que j’ai eu l’impression que mon esprit a voyagé jusqu’à Pandora. :)'),
(2, 1, '@TheBlueQueens', '2014-11-19 21:31:00', 'J''ai son livre et son DVD et personnellement je ne regrette pas de l''avoir achetée.'),
(3, 1, '@folle2cinema', '2014-12-05 13:00:00', 'Je suis entièrement d’accord avec ta note ! Je suis allée voir ce film à deux reprises et je ne le regrette pas. Cameron a créé un univers grandiose et fantastique dans lequel le spectateur veut bien vivre…'),
(4, 1, '@Visiteur', '2016-01-11 19:30:00', 'Salut,\nComme je suis fan du cinéaste James Cameron, je n’ai pas manqué la sortie d’Avatar ! Ce dernier est fabuleux. Je dois admettre que le jeu des acteurs, ainsi que les effets spéciaux sont irréprochables.'),
(5, 2, '@Visiteur', '2013-05-18 17:23:00', '10/10 !'),
(6, 2, '@Visiteur', '2013-07-30 21:42:00', 'film parfait..?'),
(7, 2, '@Visiteur', '2015-02-02 18:22:00', 'Bonjour,\nLe premier volet d’Hunger Games dévoile un jeu cruel. J’avoue que l’histoire ne m’a pas trop accroché !'),
(8, 2, '@Visiteur', '2015-06-10 22:21:00', 'Salut,\nLe premier chapitre d’Hunger Games est mon préféré. Je trouve que le personnage de Jennifer Lawrence est très courageux dans cet opus.');

-- --------------------------------------------------------

--
-- Table structure for table `Film`
--

CREATE TABLE IF NOT EXISTS `Film` (
  `Id_Film` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Artiste` int(11) NOT NULL,
  `Titre` char(50) DEFAULT NULL,
  `Date_Sortie` date DEFAULT NULL,
  `Genre` char(64) DEFAULT NULL,
  `Origine` char(64) DEFAULT NULL,
  `Resume` text,
  PRIMARY KEY (`Id_Film`),
  KEY `FK_Film_Artiste` (`Id_Artiste`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `Film`
--

INSERT INTO `Film` (`Id_Film`, `Id_Artiste`, `Titre`, `Date_Sortie`, `Genre`, `Origine`, `Resume`) VALUES
(1, 1, 'Avatar', '2009-12-16', 'Aventure / Science-Fiction', 'Américain', 'Malgré sa paralysie, Jake Sully, un ancien marine immobilisé dans un fauteuil roulant, est resté un combattant au plus profond de son être. Il est recruté pour se rendre à des années-lumière de la Terre, sur Pandora, où de puissants groupes industriels exploitent un minerai rarissime destiné à résoudre la crise énergétique sur Terre.'),
(2, 4, 'Hunger Games', '2012-03-21', 'Action / Drame / Science-Fiction', 'Américain', 'Chaque année, dans les ruines de ce qui était autrefois l''Amérique du Nord, le Capitole, l''impitoyable capitale de la nation de Panem, oblige chacun de ses douze districts à envoyer un garçon et une fille - les "Tributs" - concourir aux Hunger Games. A la fois sanction contre la population pour s''être rebellée et stratégie d''intimidation de la part du gouvernement, les Hunger Games sont un événement télévisé national au cours duquel les tributs doivent s''affronter jusqu''à la mort. L''unique survivant est déclaré vainqueur.\nLa jeune Katniss, 16 ans, se porte volontaire pour prendre la place de sa jeune sœur dans la compétition. Elle se retrouve face à des adversaires surentraînés qui se sont préparés toute leur vie. Elle a pour seuls atouts son instinct et un mentor, Haymitch Abernathy, qui gagna les Hunger Games il y a des années mais n''est plus désormais qu''une épave alcoolique. Pour espérer pouvoir revenir un jour chez elle, Katniss va devoir, une fois dans l''arène, faire des choix impossibles entre la survie et son humanité, entre la vie et l''amour...');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Acteur`
--
ALTER TABLE `Acteur`
  ADD CONSTRAINT `Acteur_ibfk_1` FOREIGN KEY (`Id_Artiste`) REFERENCES `Artiste` (`Id_Artiste`),
  ADD CONSTRAINT `Acteur_ibfk_10` FOREIGN KEY (`Id_Film`) REFERENCES `Film` (`Id_Film`),
  ADD CONSTRAINT `Acteur_ibfk_11` FOREIGN KEY (`Id_Artiste`) REFERENCES `Artiste` (`Id_Artiste`),
  ADD CONSTRAINT `Acteur_ibfk_12` FOREIGN KEY (`Id_Film`) REFERENCES `Film` (`Id_Film`),
  ADD CONSTRAINT `Acteur_ibfk_13` FOREIGN KEY (`Id_Artiste`) REFERENCES `Artiste` (`Id_Artiste`),
  ADD CONSTRAINT `Acteur_ibfk_14` FOREIGN KEY (`Id_Film`) REFERENCES `Film` (`Id_Film`),
  ADD CONSTRAINT `Acteur_ibfk_15` FOREIGN KEY (`Id_Artiste`) REFERENCES `Artiste` (`Id_Artiste`),
  ADD CONSTRAINT `Acteur_ibfk_16` FOREIGN KEY (`Id_Film`) REFERENCES `Film` (`Id_Film`),
  ADD CONSTRAINT `Acteur_ibfk_17` FOREIGN KEY (`Id_Artiste`) REFERENCES `Artiste` (`Id_Artiste`),
  ADD CONSTRAINT `Acteur_ibfk_18` FOREIGN KEY (`Id_Film`) REFERENCES `Film` (`Id_Film`),
  ADD CONSTRAINT `Acteur_ibfk_19` FOREIGN KEY (`Id_Artiste`) REFERENCES `Artiste` (`Id_Artiste`),
  ADD CONSTRAINT `Acteur_ibfk_2` FOREIGN KEY (`Id_Film`) REFERENCES `Film` (`Id_Film`),
  ADD CONSTRAINT `Acteur_ibfk_20` FOREIGN KEY (`Id_Film`) REFERENCES `Film` (`Id_Film`),
  ADD CONSTRAINT `Acteur_ibfk_3` FOREIGN KEY (`Id_Artiste`) REFERENCES `Artiste` (`Id_Artiste`),
  ADD CONSTRAINT `Acteur_ibfk_4` FOREIGN KEY (`Id_Film`) REFERENCES `Film` (`Id_Film`),
  ADD CONSTRAINT `Acteur_ibfk_5` FOREIGN KEY (`Id_Artiste`) REFERENCES `Artiste` (`Id_Artiste`),
  ADD CONSTRAINT `Acteur_ibfk_6` FOREIGN KEY (`Id_Film`) REFERENCES `Film` (`Id_Film`),
  ADD CONSTRAINT `Acteur_ibfk_7` FOREIGN KEY (`Id_Artiste`) REFERENCES `Artiste` (`Id_Artiste`),
  ADD CONSTRAINT `Acteur_ibfk_8` FOREIGN KEY (`Id_Film`) REFERENCES `Film` (`Id_Film`),
  ADD CONSTRAINT `Acteur_ibfk_9` FOREIGN KEY (`Id_Artiste`) REFERENCES `Artiste` (`Id_Artiste`);

--
-- Constraints for table `Commentaire`
--
ALTER TABLE `Commentaire`
  ADD CONSTRAINT `Commentaire_ibfk_1` FOREIGN KEY (`Id_Film`) REFERENCES `Film` (`Id_Film`),
  ADD CONSTRAINT `Commentaire_ibfk_10` FOREIGN KEY (`Id_Film`) REFERENCES `Film` (`Id_Film`),
  ADD CONSTRAINT `Commentaire_ibfk_2` FOREIGN KEY (`Id_Film`) REFERENCES `Film` (`Id_Film`),
  ADD CONSTRAINT `Commentaire_ibfk_3` FOREIGN KEY (`Id_Film`) REFERENCES `Film` (`Id_Film`),
  ADD CONSTRAINT `Commentaire_ibfk_4` FOREIGN KEY (`Id_Film`) REFERENCES `Film` (`Id_Film`),
  ADD CONSTRAINT `Commentaire_ibfk_5` FOREIGN KEY (`Id_Film`) REFERENCES `Film` (`Id_Film`),
  ADD CONSTRAINT `Commentaire_ibfk_6` FOREIGN KEY (`Id_Film`) REFERENCES `Film` (`Id_Film`),
  ADD CONSTRAINT `Commentaire_ibfk_7` FOREIGN KEY (`Id_Film`) REFERENCES `Film` (`Id_Film`),
  ADD CONSTRAINT `Commentaire_ibfk_8` FOREIGN KEY (`Id_Film`) REFERENCES `Film` (`Id_Film`),
  ADD CONSTRAINT `Commentaire_ibfk_9` FOREIGN KEY (`Id_Film`) REFERENCES `Film` (`Id_Film`);

--
-- Constraints for table `Film`
--
ALTER TABLE `Film`
  ADD CONSTRAINT `Film_ibfk_1` FOREIGN KEY (`Id_Artiste`) REFERENCES `Artiste` (`Id_Artiste`),
  ADD CONSTRAINT `Film_ibfk_10` FOREIGN KEY (`Id_Artiste`) REFERENCES `Artiste` (`Id_Artiste`),
  ADD CONSTRAINT `Film_ibfk_2` FOREIGN KEY (`Id_Artiste`) REFERENCES `Artiste` (`Id_Artiste`),
  ADD CONSTRAINT `Film_ibfk_3` FOREIGN KEY (`Id_Artiste`) REFERENCES `Artiste` (`Id_Artiste`),
  ADD CONSTRAINT `Film_ibfk_4` FOREIGN KEY (`Id_Artiste`) REFERENCES `Artiste` (`Id_Artiste`),
  ADD CONSTRAINT `Film_ibfk_5` FOREIGN KEY (`Id_Artiste`) REFERENCES `Artiste` (`Id_Artiste`),
  ADD CONSTRAINT `Film_ibfk_6` FOREIGN KEY (`Id_Artiste`) REFERENCES `Artiste` (`Id_Artiste`),
  ADD CONSTRAINT `Film_ibfk_7` FOREIGN KEY (`Id_Artiste`) REFERENCES `Artiste` (`Id_Artiste`),
  ADD CONSTRAINT `Film_ibfk_8` FOREIGN KEY (`Id_Artiste`) REFERENCES `Artiste` (`Id_Artiste`),
  ADD CONSTRAINT `Film_ibfk_9` FOREIGN KEY (`Id_Artiste`) REFERENCES `Artiste` (`Id_Artiste`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
