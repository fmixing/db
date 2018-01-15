--http://www.theolympicdatabase.nl/olympic/sports
insert into OlympicSports (SportId, SportName) values
	(1, 'archery'),
	(2, 'athletics'),
	(3, 'badminton'),
	(4, 'baseball'),
	(5, 'basketball'),
	(6, 'boxing'),
	(7, 'canoeing'),
	(8, 'cycling'),
	(9, 'diving'),
	(10, 'equestrian'),
	(11, 'fencing'),
	(12, 'football'),
	(13, 'gymnastics'),
	(14, 'handball'),
	(15, 'hockey'),
	(16, 'judo'),
	(17, 'modern pentathlon'),
	(18, 'rowing'),
	(19, 'sailing'),
	(20, 'shooting'),
	(21, 'softball'),
	(22, 'swimming'),
	(23, 'synchronized swimming'),
	(24, 'table tennis'),
	(25, 'taekwondo'),
	(26, 'tennis'),
	(27, 'triathlon'),
	(28, 'volleyball'),
	(29, 'water polo'),
	(30, 'weightlifting'),
	(31, 'wrestling'),
	(32, 'cricket'),
	(33, 'croquet'),
	(34, 'golf'),
	(35, 'jeu de paume'),
	(36, 'lacrosse'),
	(37, 'motor boat racing'),
	(38, 'pelota'),
	(39, 'polo'),
	(40, 'rackets'),
	(41, 'roquet'),
	(42, 'rugby'),
	(43, 'tug of war'),
	(44, 'alpine skiing'),
	(45, 'biathlon'),
	(46, 'bobsleigh'),
	(47, 'cross country skiing'),
	(48, 'curling'),
	(49, 'figure skating'),
	(50, 'freestyle skiing'),
	(51, 'ice hockey'),
	(52, 'luge'),
	(53, 'nordic combined'),
	(54, 'short track'),
	(55, 'skeleton'),
	(56, 'ski jumping'),
	(57, 'snowboard'),
	(58, 'speed skating');


--http://www.theolympicdatabase.nl/countries.php?show_search=1
insert into Nations (NationId, NationName) values
	(1, 'United States'),
	(2, 'Soviet Union'),
	(3, 'Germany'),
	(4, 'Italy'),
	(5, 'France'),
	(6, 'Great Britain'),
	(7, 'East Germany'),
	(8, 'Sweden'),
	(9, 'China'),
	(10, 'Hungary'),
	(11, 'Norway'),
	(12, 'Finland'),
	(13, 'Russia'),
	(14, 'Australia'),
	(15, 'Japan'),
	(16, 'Netherlands'),
	(17, 'Canada'),
	(18, 'Romania'),
	(19, 'South Korea'),
	(20, 'Switzerland'),
	(21, 'Austria'),
	(22, 'West Germany'),
	(23, 'Cuba'),
	(24, 'Poland'),
	(25, 'Commonwealth of Independent States'),
	(26, 'Bulgaria'),
	(27, 'Czechoslovakia'),
	(28, 'Denemark'),
	(29, 'Belgium'),
	(30, 'Turkey'),
	(31, 'New Zealand'),
	(32, 'Spain'),
	(33, 'Greece'),
	(34, 'Ukraine'),
	(35, 'Yugoslavia'),
	(36, 'Kenya'),
	(37, 'Brazil'),
	(38, 'South Africa'),
	(39, 'Ethiopia'),
	(40, 'Argentina'),
	(41, 'Jamaica'),
	(42, 'Czech Repunlic'),
	(43, 'Estonia'),
	(44, 'Mexico'),
	(45, 'Iran'),
	(46, 'Belarus'),
	(47, 'Kazakhstan'),
	(48, 'North-Korea'),
	(49, 'India'),
	(50, 'Ireland'),
	(51, 'Croatia'),
	(52, 'Slovakia'),
	(53, 'Egypt'),
	(54, 'Thailand'),
	(55, 'Indonesia'),
	(56, 'Morocco'),
	(57, 'Lithuania'),
	(58, 'Uzbekistan'),
	(59, 'Georgia'),
	(60, 'Portugal'),
	(61, 'Azerbaijan'),
	(62, 'Algerija'),
	(63, 'Bahamas'),
	(64, 'Taiwan'),
	(65, 'Slovenia'),
	(66, 'Australasia'),
	(67, 'Zimbabwe'),
	(68, 'Pakistan'),
	(69, 'Cameroon'),
	(70, 'Nigeria'),
	(71, 'Mongolia'),
	(72, 'Chile'),
	(73, 'Uruguay'),
	(74, 'Liechtenstein'),
	(75, 'Tunisia'),
	(76, 'Dominican Republic'),
	(77, 'Latvia'),
	(78, 'Trinidad and Tobago'),
	(79, 'Columbia'),
	(80, 'Uganda'),
	(81, 'Peru'),
	(82, 'Luxembourg'),
	(83, 'Venezuela'),
	(84, 'Armenia'),
	(85, 'Israel'),
	(86, 'Costa Rica'),
	(87, 'Syria'),
	(88, 'Ecuador'),
	(89, 'Hong Kong'),
	(90, 'Panama'),
	(91, 'Mozambique'),
	(92, 'Suriname'),
	(93, 'United Arab Emirates'),
	(94, 'Burundi'),
	(95, 'Namibia'),
	(96, 'Serbia'),
	(97, 'Philippines'),
	(98, 'Moldova'),
	(99, 'Malaysia'),
	(100, 'Iceland'),
	(101, 'Singapore'),
	(102, 'Sri Lanka'),
	(103, 'Tanzania'),
	(104, 'Vietnam'),
	(105, 'Puerto Rico'),
	(106, 'Ghana'),
	(107, 'Bohemia'),
	(108, 'Lebanon'),
	(109, 'Kyrgyzstan'),
	(110, 'Haiti'),
	(111, 'Zambia'),
	(112, 'Image for flag not available!'),
	(113, 'Saudi Arabia'),
	(114, 'Senegal'),
	(115, 'Paraquay'),
	(116, 'Sudan'),
	(117, 'Tonga'),
	(118, 'Virgin Islands'),
	(119, 'Libya'),
	(120, 'Netherlands Antilles'),
	(121, 'Qatar'),
	(122, 'Image for flag not available!'),
	(123, 'Bermuda'),
	(124, 'Afghanistan'),
	(125, 'Barbados'),
	(126, 'Guyana'),
	(127, 'Image for flag not available!'),
	(128, 'Djibouti'),
	(129, 'Niger'),
	(130, 'Mauritius'),
	(131, 'Macedonia'),
	(132, 'Iraq'),
	(133, 'Kuwait'),
	(134, 'Togo');

insert into OlympicGames (OlympiadId, OlympiadNo, Type, Host, OpeningDate, ClosingDate) values
	(1, 1, false, 33, '1896-04-06',  '1896-04-15'),
	(2, 2, false, 5, '1900-05-20',  '1900-10-28'),
	(3, 3, false, 1, '1904-07-01',  '1904-11-23'),
	(4, 4, false, 6, '1908-04-27',  '1908-10-31'),
	(5, 5, false, 8, '1912-05-05',  '1912-07-22'),
	(6, 7, false, 29, '1920-04-20',  '1920-09-12'),
	(7, 8, false, 5, '1924-05-04',  '1924-07-27'),
	(8, 9, false, 16, '1928-05-17',  '1928-08-12'),
	(9, 10, false, 1, '1932-07-30',  '1932-08-14'),
	(10, 11, false, 3, '1936-08-01',  '1936-08-16'),
	(11, 14, false, 6, '1948-07-29',  '1948-08-14'),
	(12, 15, false, 12, '1952-07-19',  '1952-08-03'),
	(13, 16, false, 14, '1956-11-22',  '1956-12-08'),
	(14, 17, false, 4, '1960-08-25',  '1960-09-11'),
	(15, 18, false, 15, '1964-10-10',  '1964-10-24'),
	(16, 19, false, 44, '1968-10-12',  '1968-10-27'),
	(17, 20, false, 22, '1972-08-26',  '1972-09-10'),
	(18, 21, false, 17, '1976-07-17',  '1976-08-01'),
	(19, 22, false, 2, '1980-07-19',  '1980-08-03'),
	(20, 23, false, 1, '1984-07-28',  '1984-08-12'),
	(21, 24, false, 19, '1988-09-17',  '1988-10-02'),
	(22, 25, false, 32, '1992-07-25',  '1992-08-09'),
	(23, 26, false, 1, '1996-07-19',  '1996-08-09'),
	(24, 27, false, 14, '2000-09-15',  '2000-10-01'),
	(25, 28, false, 33, '2004-08-13',  '2004-08-29'),
	(26, 29, false, 9, '2008-08-08',  '2008-08-24'),
	(27, 30, false, 6, '2012-07-27',  '2012-08-12'),
	(28, 31, false, 37, '2016-08-05',  '2016-08-21'),
	(29, 1, true, 5, '1924-01-25',  '1924-02-04'),
	(30, 2, true, 20, '1928-02-11',  '1928-02-19'),
	(31, 3, true, 1, '1932-02-04',  '1932-02-15'),
	(32, 4, true, 3, '1936-02-06',  '1936-02-16'),
	(33, 5, true, 20, '1948-01-30',  '1948-02-08'),
	(34, 6, true, 11, '1952-02-14',  '1952-02-25'),
	(35, 7, true, 4, '1956-01-26',  '1956-02-05'),
	(36, 8, true, 1, '1960-02-18',  '1960-02-28'),
	(37, 9, true, 21, '1964-01-29',  '1964-02-09'),
	(38, 10, true, 5, '1968-02-06',  '1968-02-18'),
	(39, 11, true, 15, '1972-02-03',  '1972-02-13'),
	(40, 12, true, 21, '1976-02-04',  '1976-02-15'),
	(41, 13, true, 1, '1980-02-14',  '1980-02-23'),
	(42, 14, true, 35, '1984-02-07',  '1984-02-19'),
	(43, 15, true, 17, '1988-02-13',  '1988-02-28'),
	(44, 16, true, 5, '1992-02-08',  '1992-02-23'),
	(45, 17, true, 11, '1994-02-12',  '1994-02-27'),
	(46, 18, true, 15, '1998-02-07',  '1998-02-22'),
	(47, 19, true, 1, '2002-02-08',  '2002-02-24'),
	(48, 20, true, 4, '2006-02-10',  '2006-02-26'),
	(49, 21, true, 17, '2010-02-12',  '2010-02-28'),
	(50, 22, true, 13, '2014-02-07',  '2014-02-23'),
	(51, 23, true, 19, '2018-02-09',  '2018-02-25');

insert into EventType (EventTypeId, Type) values
	(1, 'M'),
	(2, 'W'),
	(3, 'TM'),
	(4, 'TW'),
	(5, 'TMIX'),
	(6, 'MIX');



insert into SportEvents (SportId, EventId, EventName, EventTypeId) values
	(1, 1, 'Individual', 1),
	(1, 2, 'Individual', 2),
	(1, 3, 'Team', 3),
	(1, 4, 'Team', 4),
	(2, 5, '100 metres', 1),
	(2, 6, '100 metres', 2),
	(2, 7, '200 metres', 1),
	(2, 8, '200 metres', 2),
	(2, 9, '400 metres', 1),
	(2, 10, '400 metres', 2),
	(2, 11, '800 metres', 1),
	(2, 12, '800 metres', 2),
	(2, 13, '1500 metres', 1),
	(2, 14, '1500 metres', 2),
	(2, 15, '5000 metres', 1),
	(2, 16, '5000 metres', 2),
	(2, 17, '10000 metres', 1),
	(2, 18, '10000 metres', 2),
	(2, 19, 'Marathon', 1),
	(2, 20, 'Marathon', 2),
	(2, 21, '110 metre hurdles', 1),
	(2, 22, '100 metre hurdles', 2),
	(2, 23, '400 metre hurdles', 1),
	(2, 24, '400 metre hurdles', 2),
	(2, 25, '4 x 100 m relay', 1),
	(2, 26, '4 x 100 m relay', 2),
	(2, 27, '4 x 400 m relay', 1),
	(2, 28, '4 x 400 m relay', 2),
	(2, 29, '20 km walk', 1),
	(2, 30, '20 km walk', 2),
	(2, 31, '50 km walk', 1),
	(2, 32, '3000 metre steeplechase', 1),
	(2, 33, '3000 metre steeplechase', 2),
	(2, 34, 'High jump', 1),
	(2, 35, 'High jump', 2),
	(2, 36, 'Long jump', 1),
	(2, 37, 'Long jump', 2),
	(2, 38, 'Discus throw', 1),
	(2, 39, 'Discus throw', 2),
	(2, 40, 'Shot put', 1),
	(2, 41, 'Shot put', 2),
	(2, 42, 'Javelin throw', 1),
	(2, 43, 'Javelin throw', 2),
	(2, 44, 'Pole vault', 1),
	(2, 45, 'Pole vault', 2),
	(2, 46, 'Triple jump', 1),
	(2, 47, 'Triple jump', 2),
	(2, 48, 'Hammer throw', 1),
	(2, 49, 'Hammer throw', 2),
	(2, 50, 'Decathlon', 1),
	(2, 51, 'Heptathlon', 2),
	(3, 52, 'Singles', 1),
	(3, 53, 'Singles', 2),
	(3, 54, 'Doubles', 3),
	(3, 55, 'Doubles', 4),
	(3, 56, 'Doubles', 5),
	(4, 57, 'Baseball', 3),
	(5, 58, 'Basketball', 3),
	(5, 59, 'Basketball', 4),
	(6, 60, 'Light flyweight', 1),
	(6, 61, 'Flyweight', 1),
	(6, 62, 'Bantamweight', 1),
	(6, 63, 'Featherweight', 1),
	(6, 64, 'Lightweight', 1),
	(6, 65, 'Light welterweight', 1),
	(6, 66, 'Welterweight', 1),
	(6, 67, 'Middleweight', 1),
	(6, 68, 'Light heavyweight', 1),
	(6, 69, 'Heavyweight', 1),
	(6, 70, 'Super heavyweight', 1),
	(7, 71, 'C-1 500 metres', 1),
	(7, 72, 'C-1 1000 metres', 1),
	(7, 73, 'C-2 500 metres', 3),
	(7, 74, 'C-2 1000 metres', 3),
	(7, 75, 'K-1 500 metres', 1),
	(7, 76, 'K-1 500 metres', 2),
	(7, 77, 'K-1 1000 metres', 1),
	(7, 78, 'K-2 500 metres', 3),
	(7, 79, 'K-2 500 metres', 4),
	(7, 80, 'K-2 1000 metres', 3),
	(7, 81, 'K-4 500 metres', 4),
	(7, 82, 'K-4 1000 metres', 3),
	(7, 83, 'K-1 slalom', 1),
	(7, 84, 'K-1 slalom', 2),
	(7, 85, 'C-1 slalom', 1),
	(7, 86, 'C-2 slalom', 3),
	(44, 87, 'Downhill', 1),
	(44, 88, 'Downhill', 2),
	(44, 89, 'Super-G', 1),
	(44, 90, 'Super-G', 2),
	(44, 91, 'Giant slalom', 1),
	(44, 92, 'Giant slalom', 2),
	(44, 93, 'Slalom', 1),
	(44, 94, 'Slalom', 2),
	(44, 95, 'Alpine combined', 1),
	(44, 96, 'Alpine combined', 2),
	(51, 97, 'Ice hockey', 3),
	(51, 98, 'Ice hockey', 4),
	(45, 99, '7.5 km', 2),
	(45, 100, '10 km', 1),
	(45, 101, '15 km', 2),
	(45, 102, '20 km', 1),
	(45, 103, '12.5 km pursuit', 1),
	(45, 104, '10 km pursuit', 2),
	(45, 105, '15 km mass start', 1),
	(45, 106, '12.5 km mass start', 2),
	(45, 107, '4 x 7.5 km relay', 3),
	(45, 108, '4 x 6 km relay', 4),
	(46, 123, 'Two-man', 3),
	(46, 109, 'Four-man', 3),
	(46, 110, 'Two-man', 4),
	(47, 111, '15 km + 15 km double pursuit', 1),
	(47, 112, '15 km classical interval start', 1),
	(47, 113, '1,5 km sprint', 1),
	(47, 114, '50 km freestyle mass start', 1),
	(47, 115, 'Team sprint', 3),
	(47, 116, '4 x 10 km relay', 3),
	(47, 117, '7,5 km + 7,5 km double pursuit', 2),
	(47, 118, '10 km classical interval start', 2),
	(47, 119, '1,5 km sprint', 2),
	(47, 120, '30 km freestyle mass start', 2),
	(47, 121, 'Team sprint', 4),
	(47, 122, '4 x 5 km relay', 4);

insert into SportOlympiads (OlympiadId, SportId) values
	(26, 1),
	(26, 2),
	(26, 3),
	(26, 4),
	(26, 5),
	(26, 6),
	(26, 7),
	(26, 8),
	(26, 9),
	(26, 10),
	(26, 11),
	(26, 12),
	(26, 13),
	(26, 14),
	(26, 15),
	(26, 16),
	(26, 17),
	(26, 18),
	(26, 19),
	(26, 20),
	(26, 21),
	(26, 22),
	(26, 23),
	(26, 24),
	(26, 25),
	(26, 26),
	(26, 27),
	(26, 28),
	(26, 29),
	(26, 30),
	(26, 31),

	(48, 44),
	(48, 45),
	(48, 46),
	(48, 47),
	(48, 48),
	(48, 49),
	(48, 50),
	(48, 51),
	(48, 52),
	(48, 53),
	(48, 54),
	(48, 55),
	(48, 56),
	(48, 57);

--Олимпиада в нацию
insert into NationTeams (NationTeamId, OlympiadId, NationId) values
	(1, 26, 124),
	(2, 26, 40),
	(3, 26, 84),
	(4, 26, 14),
	(5, 26, 21),
	(6, 26, 61),
	(7, 26, 63),
	(8, 26, 125),
	(9, 26, 46),
	(10, 26, 29),
	(11, 26, 123),
	(12, 26, 37),
	(13, 26, 26),
	(14, 26, 94),
	(15, 26, 69),
	(16, 26, 17),
	(17, 26, 72),
	(18, 26, 9),
	(19, 26, 86),
	(20, 26, 51),
	(21, 26, 23),
	(22, 26, 128),
	(23, 26, 76),
	(24, 26, 88),
	(25, 26, 53),
	(26, 26, 43),
	(27, 26, 39),
	(28, 26, 12),
	(29, 26, 5),
	(30, 26, 59),
	(31, 26, 3),
	(32, 26, 106),
	(33, 26, 6),
	(34, 26, 33),
	(35, 26, 126),
	(36, 26, 110),
	(37, 26, 89),
	(38, 26, 10),
	(39, 26, 100),
	(40, 26, 49),
	(41, 26, 55),
	(42, 26, 45),
	(43, 26, 132),
	(44, 26, 50),
	(45, 26, 85),
	(46, 26, 4),
	(47, 26, 41),
	(48, 26, 15),
	(49, 26, 47),
	(50, 26, 36),
	(51, 26, 133),
	(52, 26, 109),
	(53, 26, 77),
	(54, 26, 108),
	(55, 26, 119),
	(56, 26, 74),
	(57, 26, 57),
	(58, 26, 82),
	(59, 26, 131),
	(60, 26, 99),
	(61, 26, 130),
	(62, 26, 44),
	(63, 26, 98),
	(64, 26, 71),
	(65, 26, 56),
	(66, 26, 91),
	(67, 26, 95),
	(68, 26, 16),
	(69, 26, 120),
	(70, 26, 31),
	(71, 26, 129),
	(72, 26, 70),
	(73, 26, 11),
	(74, 26, 68),
	(75, 26, 90),
	(76, 26, 81),
	(77, 26, 97),
	(78, 26, 24),
	(79, 26, 60),
	(80, 26, 105),
	(81, 26, 121),
	(82, 26, 18),
	(83, 26, 13),
	(84, 26, 113),
	(85, 26, 114),
	(86, 26, 96),
	(87, 26, 101),
	(88, 26, 52),
	(89, 26, 65),
	(90, 26, 38),
	(91, 26, 19),
	(92, 26, 32),
	(93, 26, 102),
	(94, 26, 116),
	(95, 26, 92),
	(96, 26, 8),
	(97, 26, 20),
	(98, 26, 87),
	(99, 26, 103),
	(100, 26, 54),
	(101, 26, 134),
	(102, 26, 117),
	(103, 26, 78),
	(104, 26, 75),
	(105, 26, 30),
	(106, 26, 80),
	(107, 26, 34),
	(108, 26, 93),
	(109, 26, 1),
	(110, 26, 73),
	(111, 26, 58),
	(112, 26, 83),
	(113, 26, 104),
	(114, 26, 111),
	(115, 26, 67),
	(116, 48, 40),
	(117, 48, 84),
	(118, 48, 14),
	(119, 48, 21),
	(120, 48, 61),
	(121, 48, 46),
	(122, 48, 29),
	(123, 48, 123),
	(124, 48, 37),
	(125, 48, 26),
	(126, 48, 17),
	(127, 48, 72),
	(128, 48, 9),
	(129, 48, 86),
	(130, 48, 51),
	(131, 48, 43),
	(132, 48, 39),
	(133, 48, 12),
	(134, 48, 5),
	(135, 48, 59),
	(136, 48, 3),
	(137, 48, 6),
	(138, 48, 33),
	(139, 48, 89),
	(140, 48, 10),
	(141, 48, 100),
	(142, 48, 49),
	(143, 48, 45),
	(144, 48, 50),
	(145, 48, 85),
	(146, 48, 4),
	(147, 48, 15),
	(148, 48, 47),
	(149, 48, 36),
	(150, 48, 109),
	(151, 48, 77),
	(152, 48, 108),
	(153, 48, 74),
	(154, 48, 57),
	(155, 48, 82),
	(156, 48, 131),
	(157, 48, 98),
	(158, 48, 71),
	(159, 48, 16),
	(160, 48, 31),
	(161, 48, 11),
	(162, 48, 24),
	(163, 48, 60),
	(164, 48, 18),
	(165, 48, 13),
	(166, 48, 114),
	(167, 48, 52),
	(168, 48, 65),
	(169, 48, 38),
	(170, 48, 19),
	(171, 48, 32),
	(172, 48, 8),
	(173, 48, 20),
	(174, 48, 54),
	(175, 48, 30),
	(176, 48, 34),
	(177, 48, 1),
	(178, 48, 58),
	(179, 48, 83);

insert into Athletes (AthleteId, NationTeamId, AthleteName, AthleteSex) values
--Russia
	-- (1, 83, 'Andrey Abramov', false), --лук
	-- (2, 83, 'Bair Badënov', false),
	-- (3, 83, 'Balzhinima Tsyrempilov', false),
	-- (4, 83, 'Miroslava Dagbaeva', true),
	-- (5, 83, 'Natalia Erdyniyeva', true),

	(6, 83, 'Valeriy Borchin', false), --атлетикс 20 km walk
	(7, 83, 'Denis Nizhegorodov', false), --50 km walk
	(8, 83, 'Olga Kaniskina', true), --20 km walk
	(9, 83, 'Gulnara Samitova-Galkina', true), --3000 m steeplechase
	(30, 83, 'Tatyana Firova', true), --400 m

	(10, 83, 'Georgy Balakshin', false), --боксинг Flyweight
	(11, 83, 'Alexey Tishchenko', false), --Lightweight

	(12, 83, 'Mikhail Kuznetsov', false),--каноинг Slalom2
	(13, 83, 'Dmitry Larionov', false), --Slalom2
	(14, 83, 'Maxim Opalev', false), --C-1 500 m
	(15, 83, 'Yuliana Salakhova', true), --K-1 500 m

--USA
	-- (16, 109, 'Brady Ellison', false), --лук
	-- (17, 109, 'Butch Johnson', false),
	-- (18, 109, 'Vic Wunderle', false),
	-- (19, 109, 'Khatuna Lorig', true),
	-- (20, 109, 'Jennifer Nichols', true),

	(21, 109, 'LaShawn Merritt', false), --атлетикс 400 m

	(22, 109, 'David Neville', false), --400 m
	(23, 109, 'Jeremy Wariner', false), --400 m

	(24, 109, 'Kevin Eastler', false), --20 km walk
	(25, 109, 'Philip Dunn', false), --50 km walk
	(27, 109, 'Sanya Richards', true), --400 m
	(28, 109, 'Jennifer Barringer', true), --3000 m steeplechase
	(29, 109, 'Joanne Dow', true), --20 km walk

	(31, 109, 'Deontay Wilder', false), --боксинг heavyweight

	(32, 109, 'Benn Fraker', false),--каноинг слалом
	(33, 109, 'Heather Corrie', false),
	
--China
	-- (34, 18, 'Jiang Lin', false), --лук
	-- (35, 18, 'Li Wenquan', false),
	-- (36, 18, 'Xue Haifeng', false),
	-- (37, 18, 'Zhang Juanjuan', true),
	-- (38, 18, 'Guo Dan', true),
	-- (39, 18, 'Chen Ling', true),

	(40, 18, 'Wang Hao', false), --атлетикс 20 km walk
	(41, 18, 'Li Jianbo', false), --50 km walk
	(42, 18, 'Liu Hong', true), --20 km walk
	(43, 18, 'Shi Na', true), --20 km walk

	(44, 18, 'Zou Shiming', false), --боксинг Light flyweight
	(45, 18, 'Zhang Xiaoping', false), --Light heavyweight

	(46, 18, 'Li Qiang', false);--каноинг C-1 500 m
	
insert into NationTeamMembers (AthleteId, NationTeamId, SportId) values
	(6, 83, 2), --атлетикс 20 km walk
	(7, 83, 2), --50 km walk
	(8, 83, 2), --20 km walk
	(9, 83, 2), --3000 m steeplechase
	(30, 83, 2), --400 m

	(10, 83, 6), --боксинг Flyweight
	(11, 83, 6), --Lightweight

	(12, 83, 7),--каноинг Slalom2
	(13, 83, 7), --Slalom2
	(14, 83, 7), --C-1 500 m
	(15, 83, 7), --K-1 500 m

	(21, 109, 2), --атлетикс 400 m
	(22, 109, 2), --400 m
	(23, 109, 2), --400 m
	(24, 109, 2), --20 km walk
	(25, 109, 2), --50 km walk
	(27, 109, 2), --400 m
	(28, 109, 2), --3000 m steeplechase
	(29, 109, 2), --20 km walk

	(31, 109, 6), --боксинг heavyweight

	(32, 109, 7),--каноинг слалом
	(33, 109, 7),

	(40, 18, 2), --атлетикс 20 km walk
	(41, 18, 2), --50 km walk
	(42, 18, 2), --20 km walk
	(43, 18, 2), --20 km walk

	(44, 18, 6), --боксинг Light flyweight
	(45, 18, 6), --Light heavyweight

	(46, 18, 7);--каноинг C-1 500 m


insert into EventOlympiads (EventId, OlympiadId) values
	(1, 26),
	(9, 26),
	(10, 26),
	(29, 26),
	(30, 26),
	(31, 26),
	(33, 26),
	(64, 26), 
	(61, 26),
	(68, 26),
	(60, 26),
	(85, 26),
	(76, 26),
	(86, 26);

insert into Teams (TeamId, NationTeamId) values
	(1, 83),
	(2, 83),
	(3, 83),
	(4, 83),
	(5, 83), 
	(6, 83),
	(7, 83),
	(8, 83),
	(10, 83),
	(11, 83), 
	(12, 109),
	(13, 109),
	(14, 109),
	(15, 109),
	(16, 109),
	(17, 109),
	(18, 109),
	(19, 109),
	(20, 109),
	(21, 109),
	(22, 109), 
	(24, 18), 
	(25, 18), 
	(26, 18), 
	(27, 18), 
	(28, 18), 
	(29, 18), 
	(30, 18);


insert into TeamMembers (TeamId, AthleteId, NationTeamId) values
	(1, 6, 83), --атлетикс
	(2, 7, 83),
	(3, 8, 83),
	(4, 9, 83),
	(5, 30, 83),
	(6, 10, 83),
	(7, 11, 83),

	(8, 12, 83),
	(8, 13, 83),
	
	(10, 14, 83),
	(11, 15, 83),
	(12, 21, 109), --атлетикс 400 m
	(13, 22, 109), --400 m
	(14, 23, 109), --400 m
	(15, 24, 109), --20 km walk
	(16, 25, 109), --50 km walk
	(17, 27, 109), --400 m
	(18, 28, 109), --3000 m steeplechase
	(20, 29, 109), --20 km walk
	(21, 31, 109), --боксинг heavyweight

	(22, 32, 109),--каноинг слалом
	(22, 33, 109),
	
	(24, 40, 18), --атлетикс 20 km walk
	(25, 41, 18), --50 km walk
	(26, 42, 18), --20 km walk
	(27, 43, 18), --20 km walk
	(28, 44, 18), --боксинг Light flyweight
	(29, 45, 18), --Light heavyweight
	(30, 46, 18);--каноинг C-1 500 m

insert into Competition (EndingDate, CompetitionId, OlympiadId, EventId) values
	('2008-08-16', 1, 26, 29), --20 km walk M
	('2008-08-21',2, 26, 30), --20 km walk
	('2008-08-22',3, 26, 31), --50 km walk
	('2008-08-21',4, 26, 9), --400 metres M
	('2008-08-17',5, 26, 33), --3000 metre steeplechase
	('2008-08-19',6, 26, 10), --400 metres W

	('2008-08-24',7, 26, 64), --Lightweight
	('2008-08-23',8, 26, 61), --Flyweight
	('2008-08-24',9, 26, 60), --Light flyweight
	('2008-08-24',10, 26, 68), --Light heavyweight
	('2008-08-12',11, 26, 85), --C-1 slalom M
	('2008-08-14',12, 26, 76), --K-1 500 metres W
	('2008-08-23',13, 26, 86); --C-2 slalom M


	
insert into CompetitionPlacing (CompetitionId, TeamId, Place) values
	(5, 4, 1), -- 9 --атлетикс
	(5, 18, 15), --28

	(6, 17, 1), -- 27
	(6, 5, 3), --DSQ 30

	(1, 1, 1), -- 6
	(1, 14, 43), --  24
	(1, 24, 4), --40

	(2, 3, 1), -- 8
	(2, 20, 30), --  29
	(2, 26, 4), --  42
	(2, 27, 12), --  43

	(3, 2, 3), --7
	(3, 16, 39), --25
	(3, 25, 14), --41

	(4, 13, 1), -- 22 
	(4, 14, 2), -- 23

	(7, 6, 1), -- 10 --Boxing
	(8, 21, 2), -- 31
	(9, 28, 1), -- 44
	(10, 29, 2), -- 45

	(13, 8, 1), -- 45
	(13, 22, 2); -- 45