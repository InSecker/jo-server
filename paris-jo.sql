-- Adminer 4.7.5 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `competition`;
CREATE TABLE `competition` (
  `id_competition` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `id_family` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  PRIMARY KEY (`id_competition`),
  KEY `id_family` (`id_family`),
  CONSTRAINT `competition_ibfk_1` FOREIGN KEY (`id_family`) REFERENCES `family` (`id_family`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `competition` (`id_competition`, `name`, `id_family`, `address`, `city`) VALUES
(1,	'Athletics',	9,	'Stade de France',	'Saint-Denis'),
(2,	'Triathlon',	11,	'5 Avenue Anatole France',	'Paris'),
(3,	'Climbing',	11,	'Place de la Concorde',	'Paris'),
(4,	'Weightlifting',	11,	'Le Zénith de Paris - La villette',	'Paris'),
(5,	'Horse riding',	10,	'Château de Versailles',	'Versailles'),
(6,	'Modern pentathlon',	11,	'Château de Versailles',	'Versailles'),
(7,	'Freestyle BMX',	8,	'Place de la Concorde',	'Paris'),
(8,	'BMX',	5,	'Vélodrome national de Saint-Quentin-En-Yvelines',	'Saint-Quentin-En-Yvelines'),
(9,	'Skateboard',	8,	'Place de la Concorde',	'Paris'),
(10,	'Breakdance',	8,	'Place de la Concorde',	'Paris'),
(11,	'Gymnastic',	8,	'Paris la Défense Arena',	'Nanterre'),
(12,	'VTT',	5,	'ColLine d\'Élancourt',	'Élancourt'),
(13,	'Road Cycling',	5,	'Avenue des Champs-Élysées',	'Paris'),
(14,	'Track cycling',	5,	'Vélodrome national de Saint-Quentin-En-Yvelines',	'Saint-Quentin-En-Yvelines'),
(15,	'Badminton',	4,	'Paris Arena II',	'Paris'),
(16,	'Table tennis',	5,	'Paris Expo Porte de Versailles',	'Paris'),
(17,	'Tennis',	5,	'Rolland-Garros',	'Paris'),
(18,	'Shooting',	6,	'Stand de tir du Bourget',	'Le Bourget'),
(19,	'Archery',	6,	'Esplanade des Invalides',	'Paris'),
(20,	'Open water swimming',	7,	'Pont d\'Iéna',	'Paris'),
(21,	'Swimming',	7,	'361 avenue du Président Wilson',	'Saint-Denis'),
(22,	'Water-Polo',	7,	'361 avenue du Président Wilson',	'Saint-Denis'),
(23,	'Plunge',	7,	'361 avenue du Président Wilson',	'Saint-Denis'),
(24,	'Synchronized swimming',	7,	'361 avenue du Président Wilson',	'Saint-Denis'),
(25,	'Handball',	1,	'Paris Expo Porte de Versailles',	'Paris'),
(26,	'Football',	1,	'Le Parc des Princes',	'Paris'),
(27,	'Filed hockey',	1,	'Stade Olympique Yves du Manoir',	'Colombes'),
(28,	'Basket-ball',	1,	'AccorHotels Arena',	'Paris'),
(29,	'Basket-ball 3X3',	1,	'Place de la Concorde',	'Paris'),
(30,	'Rugby sevens',	1,	'Stade Jean Bouin',	'Paris'),
(31,	'Beach volley',	1,	'Champs de Mars',	'Paris'),
(32,	'Volley-ball indoor',	1,	'Parc des Expositions Paris Le Bourget',	'Le Bourget'),
(33,	'Canoe Kayak',	3,	'Base nautique de Vaires-sur-Marne',	'Vaires-sur-Marne'),
(34,	'Rowing',	3,	'Base nautique de Vaires-sur-Marne',	'Vaires-sur-Marne'),
(35,	'Taekwondo',	2,	'Grand Palais',	'Paris'),
(36,	'Boxing',	2,	'Rolland-Garros',	'Paris'),
(37,	'Fencing',	2,	'Grand Palais',	'Paris'),
(38,	'Wrestling',	2,	'Grand Palais',	'Paris'),
(39,	'Judo',	2,	'Grand Palais',	'Paris');

DROP TABLE IF EXISTS `family`;
CREATE TABLE `family` (
  `id_family` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_family`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `family` (`id_family`, `name`) VALUES
(1,	'Teams sports'),
(2,	'Martial Arts'),
(3,	'Sailing'),
(4,	'Racket sports'),
(5,	'Cycling'),
(6,	'Shooting sports'),
(7,	'Water sports'),
(8,	'Artistic sports - Freestyle'),
(9,	'Athletics'),
(10,	'Nature sports'),
(11,	'Others');

DROP TABLE IF EXISTS `travel`;
CREATE TABLE `travel` (
  `area` int(2) NOT NULL,
  `time` int(2) NOT NULL,
  `correspondence` int(2) NOT NULL,
  `id_competition` int(11) NOT NULL,
  KEY `id_competition` (`id_competition`),
  CONSTRAINT `travel_ibfk_1` FOREIGN KEY (`id_competition`) REFERENCES `competition` (`id_competition`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- 2020-01-21 18:35:57
