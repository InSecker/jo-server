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
(1,	'athletics',	9,	'Stade de France',	'Saint-Denis'),
(2,	'triathlon',	10,	'5 Avenue Anatole France',	'Paris'),
(3,	'sport climbing',	10,	'Place de la Concorde',	'Paris'),
(4,	'weightlifting',	10,	'Le Zénith de Paris - La villette',	'Paris'),
(5,	'equestrian',	10,	'Château de Versailles',	'Versailles'),
(6,	'modern pentathlon',	10,	'Château de Versailles',	'Versailles'),
(7,	'freestyle BMX',	8,	'Place de la Concorde',	'Paris'),
(8,	'BMX racing',	5,	'Vélodrome national de Saint-Quentin-En-Yvelines',	'Saint-Quentin-En-Yvelines'),
(9,	'skateboarding',	8,	'Place de la Concorde',	'Paris'),
(10,	'breakdance',	8,	'Place de la Concorde',	'Paris'),
(11,	'gymnastic',	8,	'Paris la Défense Arena',	'Nanterre'),
(12,	'mountain bike',	5,	'9 Avenue Jean Pierre Timbaud',	'Elancourt'),
(13,	'road cycling',	5,	'Avenue des Champs-Élysées',	'Paris'),
(14,	'track cycling',	5,	'Vélodrome national de Saint-Quentin-En-Yvelines',	'Saint-Quentin-En-Yvelines'),
(15,	'badminton',	4,	'Paris Arena II',	'Paris'),
(16,	'table tennis',	4,	'Paris Expo Porte de Versailles',	'Paris'),
(17,	'tennis',	4,	'Rolland-Garros',	'Paris'),
(18,	'shooting',	6,	'Stand de tir du Bourget',	'Le Bourget'),
(19,	'archery',	6,	'Esplanade des Invalides',	'Paris'),
(20,	'open water swimming',	7,	'Pont d\'Iéna',	'Paris'),
(21,	'swimming',	7,	'361 avenue du Président Wilson',	'Saint-Denis'),
(22,	'water-polo',	7,	'361 avenue du Président Wilson',	'Saint-Denis'),
(23,	'plunge',	7,	'361 avenue du Président Wilson',	'Saint-Denis'),
(24,	'synchronized swimming',	7,	'361 avenue du Président Wilson',	'Saint-Denis'),
(25,	'handball',	1,	'Paris Expo Porte de Versailles',	'Paris'),
(26,	'football',	1,	'Le Parc des Princes',	'Paris'),
(27,	'hockey',	1,	'Stade Olympique Yves du Manoir',	'Colombes'),
(28,	'basketball',	1,	'AccorHotels Arena',	'Paris'),
(29,	'basketball 3X3',	1,	'Place de la Concorde',	'Paris'),
(30,	'rugby',	1,	'Stade Jean Bouin',	'Paris'),
(31,	'beach volley',	1,	'Champs de Mars',	'Paris'),
(32,	'volleyball',	1,	'Parc des Expositions Paris Le Bourget',	'Le Bourget'),
(33,	'canoe kayak',	3,	'Base nautique de Vaires-sur-Marne',	'Vaires-sur-Marne'),
(34,	'rowing',	3,	'Base nautique de Vaires-sur-Marne',	'Vaires-sur-Marne'),
(35,	'taekwondo',	2,	'Grand Palais',	'Paris'),
(36,	'boxing',	2,	'Rolland-Garros',	'Paris'),
(37,	'fencing',	2,	'Grand Palais',	'Paris'),
(38,	'wrestling',	2,	'Grand Palais',	'Paris'),
(39,	'judo',	2,	'Grand Palais',	'Paris'),
(40,	'golf',	10,	'2 Avenue du Golf',	'Guyancourt');

DROP TABLE IF EXISTS `family`;
CREATE TABLE `family` (
  `id_family` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_family`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `family` (`id_family`, `name`) VALUES
(1,	'teams'),
(2,	'martial arts'),
(3,	'sailing'),
(4,	'rackets'),
(5,	'cycling'),
(6,	'precisions'),
(7,	'aquatics'),
(8,	'artistics'),
(9,	'athletics'),
(10,  'others');

DROP TABLE IF EXISTS `travel`;
CREATE TABLE `travel` (
  `id_travel` int(2) NOT NULL AUTO_INCREMENT,
  `area` int(2) NOT NULL,
  `time` int(2) NOT NULL,
  `correspondence` int(2) NOT NULL,
  `id_competition` int(11) NOT NULL,
  PRIMARY KEY (`id_travel`),
  KEY `id_competition` (`id_competition`),
  CONSTRAINT `travel_ibfk_1` FOREIGN KEY (`id_competition`) REFERENCES `competition` (`id_competition`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `travel` (`id_travel`, `area`, `time`, `correspondence`, `id_competition`) VALUES
(1,	1,	11,	0,	13),
(2,	1,	51,	1,	33),
(3,	1,	35,	0,	11),
(4,	1,	18,	0,	15),
(5,	1,	51,	1,	34),
(6,	1,	37,	0,	4),
(7,	1,	33,	1,	2),
(8,	1,	41,	1,	22),
(9,	1,	31,	0,	25),
(10,	1,	72,	1,	8),
(11,	1,	34,	1,	20),
(12,	1,	18,	0,	28),
(13,	1,	33,	1,	1),
(14,	1,	42,	1,	17),
(15,	1,	47,	1,	27),
(16,	1,	72,	1,	14),
(17,	1,	122,	2,	12),
(18,	1,	63,	1,	5),
(19,	1,	36,	1,	26),
(20,	1,	42,	1,	36),
(21,	1,	53,	1,	32),
(22,	1,	31,	0,	16),
(23,	1,	41,	1,	21),
(24,	1,	63,	1,	6),
(25,	1,	38,	1,	30),
(26,	1,	41,	1,	24),
(27,	1,	22,	1,	19),
(28,	1,	53,	1,	18),
(29,	1,	10,	0,	7),
(30,	1,	10,	0,	9),
(31,	1,	10,	0,	3),
(32,	1,	10,	0,	29),
(33,	1,	41,	1,	23),
(34,	1,	10,	0,	38),
(35,	1,	10,	0,	37),
(36,	1,	10,	0,	35),
(37,	1,	10,	0,	39),
(38,	1,	28,	1,	31),
(39,	1,	10,	0,	10),
(40,	2,	26,	0,	11),
(41,	2,	49,	1,	18),
(42,	2,	35,	1,	16),
(43,	2,	47,	0,	32),
(44,	2,	35,	0,	23),
(45,	2,	67,	1,	6),
(46,	2,	35,	0,	24),
(47,	2,	72,	1,	14),
(48,	2,	35,	0,	21),
(49,	2,	26,	0,	1),
(50,	2,	123,	2,	12),
(51,	2,	49,	1,	33),
(52,	2,	22,	0,	13),
(53,	2,	48,	1,	27),
(54,	2,	49,	1,	34),
(55,	2,	37,	1,	4),
(56,	2,	46,	0,	17),
(57,	2,	40,	0,	26),
(58,	2,	72,	1,	8),
(59,	2,	20,	0,	28),
(60,	2,	21,	0,	3),
(61,	2,	21,	0,	7),
(62,	2,	35,	0,	22),
(63,	2,	21,	0,	29),
(64,	2,	40,	1,	2),
(65,	2,	32,	1,	20),
(66,	2,	42,	0,	30),
(67,	2,	67,	1,	5),
(68,	2,	21,	0,	10),
(69,	2,	35,	1,	25),
(70,	2,	26,	0,	19),
(71,	2,	21,	0,	9),
(72,	2,	20,	0,	15),
(73,	2,	46,	0,	36),
(74,	2,	33,	0,	31),
(75,	2,	24,	0,	37),
(76,	2,	24,	0,	38),
(77,	2,	24,	0,	39),
(78,	2,	24,	0,	35),
(79,	3,	27,	0,	10),
(80,	3,	27,	0,	3),
(81,	3,	27,	0,	7),
(82,	3,	27,	0,	29),
(83,	3,	49,	1,	23),
(84,	3,	29,	0,	13),
(85,	3,	33,	0,	4),
(86,	3,	25,	1,	35),
(87,	3,	53,	0,	17),
(88,	3,	49,	1,	21),
(89,	3,	40,	1,	25),
(90,	3,	84,	1,	14),
(91,	3,	39,	1,	11),
(92,	3,	49,	1,	34),
(93,	3,	40,	1,	16),
(94,	3,	25,	1,	37),
(95,	3,	47,	0,	26),
(96,	3,	49,	0,	30),
(97,	3,	49,	1,	24),
(98,	3,	27,	0,	9),
(99,	3,	56,	1,	32),
(100,	3,	84,	1,	8),
(101,	3,	24,	1,	15),
(102,	3,	39,	0,	31),
(103,	3,	24,	1,	28),
(104,	3,	46,	1,	2),
(105,	3,	25,	1,	39),
(106,	3,	49,	1,	22),
(107,	3,	49,	1,	33),
(108,	3,	74,	1,	6),
(109,	3,	25,	1,	38),
(110,	3,	53,	1,	27),
(111,	3,	49,	2,	18),
(112,	3,	74,	1,	5),
(113,	3,	34,	1,	1),
(114,	3,	32,	0,	19),
(115,	3,	43,	1,	20),
(116,	3,	53,	0,	36),
(117,	3,	136,	3,	12),
(118,	4,	80,	1,	14),
(119,	4,	80,	1,	8),
(120,	4,	54,	1,	33),
(121,	4,	20,	0,	13),
(122,	4,	44,	0,	11),
(123,	4,	54,	1,	34),
(124,	4,	22,	1,	28),
(125,	4,	43,	1,	17),
(126,	4,	37,	0,	4),
(127,	4,	55,	1,	18),
(128,	4,	33,	1,	1),
(129,	4,	39,	1,	16),
(130,	4,	39,	1,	25),
(131,	4,	78,	1,	5),
(132,	4,	78,	1,	6),
(133,	4,	43,	1,	36),
(134,	4,	131,	2,	12),
(135,	4,	55,	1,	32),
(136,	4,	19,	0,	10),
(137,	4,	19,	0,	29),
(138,	4,	46,	2,	23),
(139,	4,	40,	1,	2),
(140,	4,	46,	2,	24),
(141,	4,	27,	1,	19),
(142,	4,	19,	0,	9),
(143,	4,	46,	2,	22),
(144,	4,	49,	2,	27),
(145,	4,	42,	1,	30),
(146,	4,	46,	2,	21),
(147,	4,	22,	1,	15),
(148,	4,	42,	1,	20),
(149,	4,	42,	1,	26),
(150,	4,	19,	0,	7),
(151,	4,	19,	0,	3),
(152,	4,	18,	0,	39),
(153,	4,	18,	0,	37),
(154,	4,	18,	0,	35),
(155,	4,	18,	0,	38),
(156,	4,	34,	1,	31),
(157,	5,	16,	1,	15),
(158,	5,	16,	1,	28),
(159,	5,	48,	1,	21),
(160,	5,	48,	1,	22),
(161,	5,	59,	1,	33),
(162,	5,	39,	1,	11),
(163,	5,	60,	1,	32),
(164,	5,	71,	2,	5),
(165,	5,	67,	2,	27),
(166,	5,	23,	1,	29),
(167,	5,	74,	2,	8),
(168,	5,	32,	2,	25),
(169,	5,	24,	1,	13),
(170,	5,	71,	2,	6),
(171,	5,	48,	1,	23),
(172,	5,	38,	1,	1),
(173,	5,	23,	1,	37),
(174,	5,	32,	2,	16),
(175,	5,	23,	1,	38),
(176,	5,	23,	1,	10),
(177,	5,	134,	3,	12),
(178,	5,	23,	1,	7),
(179,	5,	36,	1,	20),
(180,	5,	60,	1,	18),
(181,	5,	42,	0,	4),
(182,	5,	41,	1,	30),
(183,	5,	42,	1,	36),
(184,	5,	23,	1,	39),
(185,	5,	23,	1,	3),
(186,	5,	42,	1,	17),
(187,	5,	34,	1,	2),
(188,	5,	48,	1,	24),
(189,	5,	59,	1,	34),
(190,	5,	74,	2,	14),
(191,	5,	34,	1,	31),
(192,	5,	23,	1,	9),
(193,	5,	43,	1,	26),
(194,	5,	34,	1,	19),
(195,	5,	23,	1,	35),
(196,	6,	74,	1,	8),
(197,	6,	53,	1,	33),
(198,	6,	53,	1,	34),
(199,	6,	38,	0,	23),
(200,	6,	64,	1,	5),
(201,	6,	38,	0,	21),
(202,	6,	38,	0,	24),
(203,	6,	33,	0,	2),
(204,	6,	132,	3,	12),
(205,	6,	74,	1,	14),
(206,	6,	35,	0,	20),
(207,	6,	37,	0,	30),
(208,	6,	35,	1,	4),
(209,	6,	38,	0,	17),
(210,	6,	39,	0,	26),
(211,	6,	25,	0,	9),
(212,	6,	28,	0,	25),
(213,	6,	38,	0,	36),
(214,	6,	38,	0,	22),
(215,	6,	25,	0,	7),
(216,	6,	50,	0,	32),
(217,	6,	25,	0,	3),
(218,	6,	64,	1,	6),
(219,	6,	26,	1,	13),
(220,	6,	28,	0,	16),
(221,	6,	33,	1,	11),
(222,	6,	25,	0,	10),
(223,	6,	24,	1,	38),
(224,	6,	24,	1,	37),
(225,	6,	34,	1,	19),
(226,	6,	29,	0,	31),
(227,	6,	57,	2,	27),
(228,	6,	24,	1,	35),
(229,	6,	25,	0,	29),
(230,	6,	24,	1,	28),
(231,	6,	50,	1,	18),
(232,	6,	24,	1,	15),
(233,	6,	29,	0,	1),
(234,	6,	24,	1,	39),
(235,	7,	8,	0,	19),
(236,	7,	17,	0,	20),
(237,	7,	17,	0,	13),
(238,	7,	18,	0,	10),
(239,	7,	39,	0,	21),
(240,	7,	39,	0,	22),
(241,	7,	66,	1,	8),
(242,	7,	39,	0,	23),
(243,	7,	10,	0,	31),
(244,	7,	28,	0,	16),
(245,	7,	56,	2,	18),
(246,	7,	29,	1,	28),
(247,	7,	58,	1,	6),
(248,	7,	39,	0,	24),
(249,	7,	62,	2,	34),
(250,	7,	29,	1,	15),
(251,	7,	18,	0,	29),
(252,	7,	36,	0,	1),
(253,	7,	34,	1,	30),
(254,	7,	17,	0,	2),
(255,	7,	18,	0,	9),
(256,	7,	18,	0,	7),
(257,	7,	35,	1,	36),
(258,	7,	119,	3,	12),
(259,	7,	49,	1,	27),
(260,	7,	18,	0,	3),
(261,	7,	49,	1,	4),
(262,	7,	28,	0,	25),
(263,	7,	35,	1,	17),
(264,	7,	62,	2,	33),
(265,	7,	58,	1,	5),
(266,	7,	66,	1,	14),
(267,	7,	56,	2,	32),
(268,	7,	41,	1,	11),
(269,	7,	11,	0,	37),
(270,	7,	11,	0,	39),
(271,	7,	36,	1,	26),
(272,	7,	11,	0,	35),
(273,	7,	11,	0,	38),
(274,	8,	3,	0,	13),
(275,	8,	10,	0,	10),
(276,	8,	10,	0,	7),
(277,	8,	14,	0,	20),
(278,	8,	10,	0,	3),
(279,	8,	4,	0,	38),
(280,	8,	10,	0,	9),
(281,	8,	18,	0,	19),
(282,	8,	10,	0,	29),
(283,	8,	4,	0,	35),
(284,	8,	28,	0,	11),
(285,	8,	32,	0,	1),
(286,	8,	29,	1,	16),
(287,	8,	28,	0,	30),
(288,	8,	34,	0,	23),
(289,	8,	29,	1,	25),
(290,	8,	4,	0,	37),
(291,	8,	56,	2,	33),
(292,	8,	23,	1,	28),
(293,	8,	116,	2,	12),
(294,	8,	54,	1,	6),
(295,	8,	33,	0,	17),
(296,	8,	34,	0,	21),
(297,	8,	13,	0,	2),
(298,	8,	34,	0,	24),
(299,	8,	23,	1,	15),
(300,	8,	49,	2,	18),
(301,	8,	54,	1,	5),
(302,	8,	26,	0,	26),
(303,	8,	4,	0,	39),
(304,	8,	70,	1,	14),
(305,	8,	43,	1,	4),
(306,	8,	33,	0,	36),
(307,	8,	56,	2,	34),
(308,	8,	70,	1,	8),
(309,	8,	34,	0,	22),
(310,	8,	48,	2,	32),
(311,	8,	13,	0,	31),
(312,	8,	45,	1,	27),
(313,	9,	40,	1,	24),
(314,	9,	40,	1,	23),
(315,	9,	17,	0,	7),
(316,	9,	17,	0,	9),
(317,	9,	17,	0,	10),
(318,	9,	21,	1,	39),
(319,	9,	17,	0,	3),
(320,	9,	37,	1,	1),
(321,	9,	22,	1,	13),
(322,	9,	48,	1,	34),
(323,	9,	40,	1,	22),
(324,	9,	17,	0,	29),
(325,	9,	32,	0,	25),
(326,	9,	48,	1,	33),
(327,	9,	40,	1,	21),
(328,	9,	21,	1,	37),
(329,	9,	32,	0,	16),
(330,	9,	37,	1,	32),
(331,	9,	37,	1,	18),
(332,	9,	29,	1,	19),
(333,	9,	36,	1,	11),
(334,	9,	73,	2,	8),
(335,	9,	73,	2,	14),
(336,	9,	50,	1,	17),
(337,	9,	50,	1,	36),
(338,	9,	46,	1,	27),
(339,	9,	21,	1,	38),
(340,	9,	21,	1,	35),
(341,	9,	132,	3,	12),
(342,	9,	36,	0,	20),
(343,	9,	39,	0,	2),
(344,	9,	65,	1,	6),
(345,	9,	65,	1,	5),
(346,	9,	41,	1,	26),
(347,	9,	33,	0,	4),
(348,	9,	36,	0,	31),
(349,	9,	28,	1,	28),
(350,	9,	49,	1,	30),
(351,	9,	28,	1,	15),
(352,	10,	23,	0,	23),
(353,	10,	35,	0,	34),
(354,	10,	21,	1,	10),
(355,	10,	75,	2,	8),
(356,	10,	50,	1,	17),
(357,	10,	23,	0,	21),
(358,	10,	18,	0,	1),
(359,	10,	50,	1,	36),
(360,	10,	131,	3,	12),
(361,	10,	39,	0,	32),
(362,	10,	35,	0,	33),
(363,	10,	23,	0,	22),
(364,	10,	30,	1,	11),
(365,	10,	21,	1,	9),
(366,	10,	41,	1,	18),
(367,	10,	23,	0,	4),
(368,	10,	26,	1,	38),
(369,	10,	37,	1,	25),
(370,	10,	66,	1,	6),
(371,	10,	75,	2,	14),
(372,	10,	42,	1,	30),
(373,	10,	66,	2,	27),
(374,	10,	23,	0,	24),
(375,	10,	66,	1,	5),
(376,	10,	21,	1,	7),
(377,	10,	37,	1,	16),
(378,	10,	26,	1,	35),
(379,	10,	47,	1,	2),
(380,	10,	21,	0,	15),
(381,	10,	26,	1,	37),
(382,	10,	21,	0,	28),
(383,	10,	21,	1,	29),
(384,	10,	26,	1,	39),
(385,	10,	40,	1,	26),
(386,	10,	27,	1,	19),
(387,	10,	27,	1,	13),
(388,	10,	21,	1,	3),
(389,	10,	36,	2,	20),
(390,	10,	34,	1,	31),
(391,	11,	24,	1,	15),
(392,	11,	50,	2,	33),
(393,	11,	82,	1,	8),
(394,	11,	73,	1,	5),
(395,	11,	73,	1,	6),
(396,	11,	28,	1,	29),
(397,	11,	50,	0,	17),
(398,	11,	26,	0,	13),
(399,	11,	28,	1,	10),
(400,	11,	52,	1,	22),
(401,	11,	52,	1,	21),
(402,	11,	34,	1,	4),
(403,	11,	28,	1,	7),
(404,	11,	67,	2,	27),
(405,	11,	38,	1,	11),
(406,	11,	50,	0,	36),
(407,	11,	46,	1,	20),
(408,	11,	24,	1,	28),
(409,	11,	52,	1,	23),
(410,	11,	35,	2,	1),
(411,	11,	136,	3,	12),
(412,	11,	52,	1,	24),
(413,	11,	28,	1,	9),
(414,	11,	50,	3,	32),
(415,	11,	44,	1,	2),
(416,	11,	39,	0,	31),
(417,	11,	50,	2,	34),
(418,	11,	27,	0,	37),
(419,	11,	27,	0,	38),
(420,	11,	43,	2,	16),
(421,	11,	27,	0,	39),
(422,	11,	43,	2,	25),
(423,	11,	44,	0,	26),
(424,	11,	28,	1,	3),
(425,	11,	46,	0,	30),
(426,	11,	50,	3,	18),
(427,	11,	82,	1,	14),
(428,	11,	27,	0,	35),
(429,	11,	34,	1,	19),
(430,	12,	48,	0,	13),
(431,	12,	59,	1,	4),
(432,	12,	77,	1,	34),
(433,	12,	75,	2,	18),
(434,	12,	75,	1,	32),
(435,	12,	47,	0,	7),
(436,	12,	90,	2,	14),
(437,	12,	79,	2,	27),
(438,	12,	58,	1,	20),
(439,	12,	37,	0,	28),
(440,	12,	47,	0,	10),
(441,	12,	37,	0,	15),
(442,	12,	63,	1,	24),
(443,	12,	67,	1,	16),
(444,	12,	77,	1,	33),
(445,	12,	47,	0,	3),
(446,	12,	63,	1,	22),
(447,	12,	60,	1,	19),
(448,	12,	146,	2,	12),
(449,	12,	49,	0,	11),
(450,	12,	94,	2,	5),
(451,	12,	67,	1,	25),
(452,	12,	63,	1,	23),
(453,	12,	53,	1,	1),
(454,	12,	63,	1,	21),
(455,	12,	90,	2,	8),
(456,	12,	73,	1,	30),
(457,	12,	60,	1,	2),
(458,	12,	78,	1,	17),
(459,	12,	78,	1,	36),
(460,	12,	73,	1,	26),
(461,	12,	64,	1,	31),
(462,	12,	94,	2,	6),
(463,	12,	47,	0,	29),
(464,	12,	47,	0,	9),
(465,	12,	48,	0,	37),
(466,	12,	48,	0,	35),
(467,	12,	48,	0,	39),
(468,	12,	48,	0,	38),
(469,	13,	16,	0,	28),
(470,	13,	49,	1,	17),
(471,	13,	31,	0,	10),
(472,	13,	31,	0,	29),
(473,	13,	31,	0,	9),
(474,	13,	73,	2,	14),
(475,	13,	66,	1,	34),
(476,	13,	30,	1,	13),
(477,	13,	40,	1,	19),
(478,	13,	16,	0,	15),
(479,	13,	31,	0,	7),
(480,	13,	55,	1,	23),
(481,	13,	35,	0,	25),
(482,	13,	31,	0,	3),
(483,	13,	73,	2,	8),
(484,	13,	43,	1,	1),
(485,	13,	55,	1,	21),
(486,	13,	40,	1,	11),
(487,	13,	66,	1,	33),
(488,	13,	35,	0,	16),
(489,	13,	35,	1,	2),
(490,	13,	67,	1,	18),
(491,	13,	59,	1,	27),
(492,	13,	49,	1,	26),
(493,	13,	55,	1,	24),
(494,	13,	36,	1,	20),
(495,	13,	70,	2,	5),
(496,	13,	66,	1,	32),
(497,	13,	42,	1,	4),
(498,	13,	48,	1,	30),
(499,	13,	28,	1,	38),
(500,	13,	28,	1,	35),
(501,	13,	49,	1,	36),
(502,	13,	133,	3,	12),
(503,	13,	70,	2,	6),
(504,	13,	28,	1,	39),
(505,	13,	55,	1,	22),
(506,	13,	34,	1,	31),
(507,	13,	28,	1,	37),
(508,	14,	23,	0,	19),
(509,	14,	35,	0,	20),
(510,	14,	71,	1,	6),
(511,	14,	35,	0,	1),
(512,	14,	40,	1,	11),
(513,	14,	71,	1,	5),
(514,	14,	62,	1,	34),
(515,	14,	29,	1,	7),
(516,	14,	62,	1,	33),
(517,	14,	44,	0,	23),
(518,	14,	42,	1,	36),
(519,	14,	30,	0,	2),
(520,	14,	44,	0,	22),
(521,	14,	46,	0,	26),
(522,	14,	29,	1,	10),
(523,	14,	44,	0,	21),
(524,	14,	56,	1,	18),
(525,	14,	29,	1,	29),
(526,	14,	20,	0,	39),
(527,	14,	27,	0,	13),
(528,	14,	41,	1,	30),
(529,	14,	56,	0,	32),
(530,	14,	29,	1,	9),
(531,	14,	29,	1,	3),
(532,	14,	27,	1,	25),
(533,	14,	64,	1,	8),
(534,	14,	20,	0,	35),
(535,	14,	20,	0,	37),
(536,	14,	20,	0,	38),
(537,	14,	64,	1,	14),
(538,	14,	27,	0,	31),
(539,	14,	60,	1,	27),
(540,	14,	44,	0,	24),
(541,	14,	49,	1,	4),
(542,	14,	27,	1,	16),
(543,	14,	42,	1,	17),
(544,	14,	123,	3,	12),
(545,	14,	26,	0,	28),
(546,	14,	26,	0,	15),
(547,	15,	33,	0,	17),
(548,	15,	59,	2,	18),
(549,	15,	27,	1,	2),
(550,	15,	18,	0,	16),
(551,	15,	42,	1,	11),
(552,	15,	28,	1,	20),
(553,	15,	18,	0,	25),
(554,	15,	20,	0,	7),
(555,	15,	64,	1,	6),
(556,	15,	33,	0,	36),
(557,	15,	26,	1,	13),
(558,	15,	20,	0,	3),
(559,	15,	23,	0,	35),
(560,	15,	20,	0,	10),
(561,	15,	64,	1,	5),
(562,	15,	59,	2,	32),
(563,	15,	23,	0,	38),
(564,	15,	33,	0,	26),
(565,	15,	48,	1,	1),
(566,	15,	32,	0,	30),
(567,	15,	23,	0,	39),
(568,	15,	20,	0,	19),
(569,	15,	64,	2,	33),
(570,	15,	51,	1,	21),
(571,	15,	51,	1,	22),
(572,	15,	61,	2,	27),
(573,	15,	51,	1,	23),
(574,	15,	23,	0,	37),
(575,	15,	73,	2,	8),
(576,	15,	35,	1,	28),
(577,	15,	73,	2,	14),
(578,	15,	35,	1,	15),
(579,	15,	51,	1,	4),
(580,	15,	20,	0,	29),
(581,	15,	64,	2,	34),
(582,	15,	135,	3,	12),
(583,	15,	51,	1,	24),
(584,	15,	23,	0,	31),
(585,	15,	20,	0,	9),
(586,	16,	15,	0,	20),
(587,	16,	55,	1,	6),
(588,	16,	16,	0,	2),
(589,	16,	15,	0,	30),
(590,	16,	55,	1,	5),
(591,	16,	61,	1,	14),
(592,	16,	20,	0,	17),
(593,	16,	24,	0,	19),
(594,	16,	65,	2,	33),
(595,	16,	134,	3,	12),
(596,	16,	19,	0,	26),
(597,	16,	30,	1,	25),
(598,	16,	57,	1,	27),
(599,	16,	38,	1,	15),
(600,	16,	65,	2,	34),
(601,	16,	17,	0,	13),
(602,	16,	51,	1,	4),
(603,	16,	30,	1,	16),
(604,	16,	14,	0,	31),
(605,	16,	47,	1,	24),
(606,	16,	39,	1,	11),
(607,	16,	61,	1,	8),
(608,	16,	47,	1,	23),
(609,	16,	47,	1,	22),
(610,	16,	44,	1,	1),
(611,	16,	20,	0,	36),
(612,	16,	68,	2,	18),
(613,	16,	68,	2,	32),
(614,	16,	38,	1,	28),
(615,	16,	47,	1,	21),
(616,	16,	18,	0,	38),
(617,	16,	18,	0,	35),
(618,	16,	18,	0,	37),
(619,	16,	18,	0,	39),
(620,	16,	25,	1,	9),
(621,	16,	25,	1,	7),
(622,	16,	25,	1,	29),
(623,	16,	25,	1,	10),
(624,	16,	25,	1,	3),
(625,	17,	35,	1,	11),
(626,	17,	70,	1,	8),
(627,	17,	25,	0,	20),
(628,	17,	65,	1,	5),
(629,	17,	65,	1,	6),
(630,	17,	23,	0,	9),
(631,	17,	23,	0,	7),
(632,	17,	23,	0,	10),
(633,	17,	23,	0,	3),
(634,	17,	23,	0,	29),
(635,	17,	38,	0,	17),
(636,	17,	43,	1,	21),
(637,	17,	43,	1,	23),
(638,	17,	47,	1,	32),
(639,	17,	70,	1,	14),
(640,	17,	43,	1,	24),
(641,	17,	18,	1,	13),
(642,	17,	40,	1,	16),
(643,	17,	36,	0,	27),
(644,	17,	33,	1,	19),
(645,	17,	131,	3,	12),
(646,	17,	20,	1,	37),
(647,	17,	34,	0,	30),
(648,	17,	28,	1,	15),
(649,	17,	35,	0,	26),
(650,	17,	49,	1,	4),
(651,	17,	28,	1,	28),
(652,	17,	47,	1,	18),
(653,	17,	40,	1,	1),
(654,	17,	20,	1,	35),
(655,	17,	38,	0,	36),
(656,	17,	43,	1,	22),
(657,	17,	24,	0,	31),
(658,	17,	20,	1,	38),
(659,	17,	26,	0,	2),
(660,	17,	20,	1,	39),
(661,	17,	40,	1,	25),
(662,	17,	60,	2,	33),
(663,	17,	60,	2,	34),
(664,	18,	36,	1,	11),
(665,	18,	32,	1,	23),
(666,	18,	32,	1,	21),
(667,	18,	20,	0,	3),
(668,	18,	20,	0,	7),
(669,	18,	25,	1,	13),
(670,	18,	35,	0,	25),
(671,	18,	24,	1,	39),
(672,	18,	20,	0,	9),
(673,	18,	24,	1,	35),
(674,	18,	20,	0,	10),
(675,	18,	27,	1,	18),
(676,	18,	135,	3,	12),
(677,	18,	29,	1,	4),
(678,	18,	25,	1,	1),
(679,	18,	32,	1,	24),
(680,	18,	32,	1,	22),
(681,	18,	27,	1,	15),
(682,	18,	24,	1,	38),
(683,	18,	42,	1,	34),
(684,	18,	27,	1,	32),
(685,	18,	51,	1,	36),
(686,	18,	35,	0,	16),
(687,	18,	42,	1,	33),
(688,	18,	66,	1,	6),
(689,	18,	66,	1,	5),
(690,	18,	32,	1,	19),
(691,	18,	74,	2,	8),
(692,	18,	48,	1,	30),
(693,	18,	74,	2,	14),
(694,	18,	48,	1,	2),
(695,	18,	49,	1,	27),
(696,	18,	20,	0,	29),
(697,	18,	42,	1,	20),
(698,	18,	46,	1,	26),
(699,	18,	24,	1,	37),
(700,	18,	27,	1,	28),
(701,	18,	51,	1,	17),
(702,	18,	39,	1,	31),
(703,	19,	84,	3,	8),
(704,	19,	37,	1,	24),
(705,	19,	48,	1,	34),
(706,	19,	37,	1,	21),
(707,	19,	37,	1,	22),
(708,	19,	32,	1,	15),
(709,	19,	29,	1,	1),
(710,	19,	76,	2,	6),
(711,	19,	36,	1,	9),
(712,	19,	32,	1,	28),
(713,	19,	84,	3,	14),
(714,	19,	56,	1,	26),
(715,	19,	18,	0,	4),
(716,	19,	48,	1,	33),
(717,	19,	38,	1,	13),
(718,	19,	41,	1,	39),
(719,	19,	76,	2,	5),
(720,	19,	62,	1,	17),
(721,	19,	37,	1,	23),
(722,	19,	41,	1,	37),
(723,	19,	58,	1,	30),
(724,	19,	41,	1,	35),
(725,	19,	41,	2,	11),
(726,	19,	50,	1,	32),
(727,	19,	49,	1,	18),
(728,	19,	62,	1,	36),
(729,	19,	41,	1,	38),
(730,	19,	48,	2,	25),
(731,	19,	52,	2,	2),
(732,	19,	48,	2,	16),
(733,	19,	145,	4,	12),
(734,	19,	36,	1,	3),
(735,	19,	53,	2,	20),
(736,	19,	36,	1,	29),
(737,	19,	49,	1,	31),
(738,	19,	36,	1,	10),
(739,	19,	42,	1,	19),
(740,	19,	68,	3,	27),
(741,	19,	36,	1,	7),
(742,	20,	41,	1,	11),
(743,	20,	52,	1,	24),
(744,	20,	52,	1,	22),
(745,	20,	37,	1,	19),
(746,	20,	77,	2,	5),
(747,	20,	57,	1,	17),
(748,	20,	77,	2,	6),
(749,	20,	82,	3,	14),
(750,	20,	37,	2,	1),
(751,	20,	42,	2,	20),
(752,	20,	31,	1,	29),
(753,	20,	31,	1,	7),
(754,	20,	49,	1,	16),
(755,	20,	52,	1,	21),
(756,	20,	33,	1,	13),
(757,	20,	31,	1,	9),
(758,	20,	32,	1,	4),
(759,	20,	51,	1,	26),
(760,	20,	57,	1,	36),
(761,	20,	31,	1,	3),
(762,	20,	37,	1,	28),
(763,	20,	37,	1,	15),
(764,	20,	32,	1,	39),
(765,	20,	52,	1,	23),
(766,	20,	138,	3,	12),
(767,	20,	59,	3,	18),
(768,	20,	53,	1,	30),
(769,	20,	32,	1,	38),
(770,	20,	64,	1,	27),
(771,	20,	54,	2,	34),
(772,	20,	59,	2,	32),
(773,	20,	47,	2,	2),
(774,	20,	32,	1,	37),
(775,	20,	32,	1,	35),
(776,	20,	54,	2,	33),
(777,	20,	49,	1,	25),
(778,	20,	82,	3,	8),
(779,	20,	43,	1,	31),
(780,	20,	31,	1,	10),
(781,	2,	100,	1,	40),
(782,	14,	83,	0,	40),
(783,	7,	85,	1,	40),
(784,	3,	105,	1,	40),
(785,	9,	101,	1,	40),
(786,	1,	100,	1,	40),
(787,	19,	110,	2,	40),
(788,	20,	106,	2,	40),
(789,	6,	93,	1,	40),
(790,	11,	108,	2,	40),
(791,	16,	94,	2,	40),
(792,	18,	102,	1,	40),
(793,	13,	93,	2,	40),
(794,	17,	102,	2,	40),
(795,	8,	94,	1,	40),
(796,	5,	92,	2,	40),
(797,	4,	99,	2,	40),
(798,	10,	102,	1,	40),
(799,	15,	92,	2,	40),
(800,	12,	123,	2,	40);

-- 2020-02-11 14:30:32
