-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 06 Sty 2021, 14:25
-- Wersja serwera: 5.7.17
-- Wersja PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `sklep`
--

DELIMITER $$
--
-- Procedury
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `1` ()  NO SQL
SELECT hurtownie.nazwa_h, produkty.nazwa_p FROM hurtownie INNER JOIN produkty WHERE hurtownie.id_h = produkty.id_h$$

--
-- Funkcje
--
CREATE DEFINER=`root`@`localhost` FUNCTION `1` (`p0` INT(20)) RETURNS TEXT CHARSET utf8mb4 COLLATE utf8mb4_polish_ci NO SQL
IF (
  SELECT
    COUNT(*)
  FROM
    produkty
  WHERE
    id_p = @p0
  AND
	ilosc_p = 0
) > 0 THEN RETURN "Brak produktu";ELSE RETURN "produktu sa jeszcze dostepne";
END IF$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `1`
-- (See below for the actual view)
--
CREATE TABLE `1` (
`login_u` varchar(40)
,`nazwa_o` varchar(60)
,`nazwa_p` varchar(60)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `2`
-- (See below for the actual view)
--
CREATE TABLE `2` (
`id_p` int(11)
,`nazwa_p` varchar(60)
,`waga_p` int(11)
,`ilosc_p` int(11)
,`id_h` int(11)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `3`
-- (See below for the actual view)
--
CREATE TABLE `3` (
`nazwa_p` varchar(60)
,`nazwa_h` varchar(50)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `4`
-- (See below for the actual view)
--
CREATE TABLE `4` (
`Srednia ilosc sprzedanych produktow` decimal(14,4)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `5`
-- (See below for the actual view)
--
CREATE TABLE `5` (
`SUM(sprzedaz.ilosc)` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `6`
-- (See below for the actual view)
--
CREATE TABLE `6` (
`id_u` int(11)
,`login_u` varchar(40)
,`haslo_u` varchar(50)
,`email_u` varchar(50)
,`rodzaj_u` enum('administrator','hurtownia','uzytkownik')
,`weryfikacja_u` int(11)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `7`
-- (See below for the actual view)
--
CREATE TABLE `7` (
`nazwa_p` varchar(60)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `8`
-- (See below for the actual view)
--
CREATE TABLE `8` (
`COUNT(produkty.ilosc_p)` bigint(21)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `9`
-- (See below for the actual view)
--
CREATE TABLE `9` (
`id_p` int(11)
,`nazwa_p` varchar(60)
,`IF(produkty.ilosc_p > 1700, "Tak", "Nie")` varchar(3)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `10`
-- (See below for the actual view)
--
CREATE TABLE `10` (
`login_u` varchar(40)
,`nazwa_o` varchar(60)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `11`
-- (See below for the actual view)
--
CREATE TABLE `11` (
`login_u` varchar(40)
,`nazwa_p` varchar(60)
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dostawcy`
--

CREATE TABLE `dostawcy` (
  `id_d` int(11) NOT NULL,
  `nazwa_d` varchar(60) COLLATE utf8mb4_polish_ci NOT NULL,
  `nip_d` varchar(60) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `dostawcy`
--

INSERT INTO `dostawcy` (`id_d`, `nazwa_d`, `nip_d`) VALUES
(1, 'DHL', '5121112663'),
(2, 'UPS', '1143368592'),
(3, 'DPD', '3814226125'),
(4, 'Geis Parcel', '4179259143'),
(5, 'InPost', '3371047670'),
(6, 'FedEx', '4979616863'),
(7, 'GLS', '7997076456'),
(8, 'Poczta Polska', '8217005821'),
(9, 'Pocztex', '5273742944');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `hurtownie`
--

CREATE TABLE `hurtownie` (
  `id_h` int(11) NOT NULL,
  `nazwa_h` varchar(50) COLLATE utf8mb4_polish_ci NOT NULL,
  `nip_h` bigint(20) NOT NULL,
  `numer_konta_h` varchar(100) COLLATE utf8mb4_polish_ci NOT NULL,
  `kategoria` varchar(30) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `hurtownie`
--

INSERT INTO `hurtownie` (`id_h`, `nazwa_h`, `nip_h`, `numer_konta_h`, `kategoria`) VALUES
(1, 'Action.pl', 9521631601, '47132011046443307244189374', 'AGD, RTV'),
(2, 'Ab.pl', 7623797155, '17158000060529233298934923', 'Akcesoria GSM'),
(3, 'AgdPartner', 1172142755, '26124065822078916357413811', 'AgdPartner'),
(4, 'PARTNER PAPES', 5699633275, '76124041261296892800016085', 'PARTNER PAPES'),
(5, 'Unimet', 5681400050, '37124038713093439569143157', 'Artykuły przemysłowe'),
(6, 'ANP', 1115675709, '85137013569090793039994816', 'Bielizna'),
(7, 'LUKA', 5664870818, '12124068433672485069174838', 'Biuro'),
(8, 'ChicoChica', 3765066784, '85103014656934516602423091', 'Biżuteria'),
(9, 'Aluro', 9711595038, '19150015049578446728221834', 'Dom i ogród'),
(10, 'Agawa', 5097840010, '68864710595845536730527752', 'Druk'),
(11, '4Kraft', 7599501405, '70804600025559835116104741', 'Dziecięce/zabawki'),
(12, 'AB', 1182834704, '69124014448934311744948225', 'Elektronika'),
(13, 'nextoAPI', 4979839698, '77883410227577083017323636', 'E-booki, Audio-booki'),
(14, 'BOSS OF TOYS', 1086126146, '53150011001875830409933594', 'Erotyka'),
(15, 'AMP Polska', 8380890977, '98150000316797749599623613', 'Fitness i sport');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `oferta`
--

CREATE TABLE `oferta` (
  `id_o` int(11) NOT NULL,
  `nazwa_o` varchar(60) COLLATE utf8mb4_polish_ci NOT NULL,
  `opis_o` text COLLATE utf8mb4_polish_ci NOT NULL,
  `id_u` int(11) NOT NULL,
  `id_p` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `oferta`
--

INSERT INTO `oferta` (`id_o`, `nazwa_o`, `opis_o`, `id_u`, `id_p`) VALUES
(1, 'Stringi Damskie rozmiar M', 'Czerwone damskie stringi w rozmiarze M, ', 6, 10),
(2, 'Stringi Damskie rozmiar S', 'Czerwone damskie stringi w rozmiarze S, ', 6, 9),
(3, 'Stringi Damskie rozmiar L', 'Stringi Damskie czerwone rozmiar L', 6, 11),
(5, 'Telefon Asus zenfone 7 pro', 'Najbardziej zawansowany technologicznie telefon na rynku.\r\nPamiec ram 8GB, 3 aparaty 2x64mp, 1x48mp', 7, 4),
(6, 'Telewizor samsung', 'Wywietlacz amoled 20 calowy', 7, 1),
(7, 'Majtki meskie S', 'Czarne majtki meskie w rozmiarze S', 8, 8),
(8, 'Majtki meskie M', 'Czarne majtki meskie w rozmiarze M', 8, 6),
(9, 'Majtki meskie rozmiar L', 'Majtki meskie czarne rozmiar L', 8, 7),
(10, 'Krzesla do ogrodu ', 'krzesla ogrodowe caloroczne', 9, 12),
(11, 'Stolik ogrodowy', 'Stolik ogrodowy caloroczny', 9, 13);

--
-- Wyzwalacze `oferta`
--
DELIMITER $$
CREATE TRIGGER `2` BEFORE DELETE ON `oferta` FOR EACH ROW INSERT INTO przedawnione_oferty VALUES (null, OLD.id_u, OLD.nazwa_o, OLD.id_p)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `produkty`
--

CREATE TABLE `produkty` (
  `id_p` int(11) NOT NULL,
  `nazwa_p` varchar(60) COLLATE utf8mb4_polish_ci NOT NULL,
  `waga_p` int(11) NOT NULL,
  `ilosc_p` int(11) NOT NULL,
  `id_h` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `produkty`
--

INSERT INTO `produkty` (`id_p`, `nazwa_p`, `waga_p`, `ilosc_p`, `id_h`) VALUES
(1, 'Telewizor Samsung Amoled 20 cali', 25, 2800, 1),
(2, 'Telefon Samsung S20', 1, 3200, 1),
(3, 'Etui do Galaxy A6 i A6 Plus 2018', 0, 11200, 2),
(4, 'Telefon Asus zenfone 7 pro', 1, 128, 3),
(5, 'SmartWatch xiaomi', 0, 0, 3),
(6, 'Majtki meskie M', 0, 3180, 6),
(7, 'Majtki meskie L', 0, 3200, 6),
(8, 'Majtki meskie S', 0, 3200, 6),
(9, 'Stringi Damskie S', 0, 3200, 6),
(10, 'Stringi Damskie M', 0, 3200, 6),
(11, 'Stringi Damskie L', 0, 3200, 6),
(12, 'Krzesla ogrodowe', 1, 3800, 9),
(13, 'Stolik ogrodowy', 0, 200, 9);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `przedawnione_oferty`
--

CREATE TABLE `przedawnione_oferty` (
  `id_po` int(11) NOT NULL,
  `id_u` int(11) NOT NULL,
  `nazwa_o` varchar(60) COLLATE utf8mb4_polish_ci NOT NULL,
  `id_p` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `przedawnione_oferty`
--

INSERT INTO `przedawnione_oferty` (`id_po`, `id_u`, `nazwa_o`, `id_p`) VALUES
(1, 11, 'Etui', 3),
(2, 10, 'Smartwatch', 5),
(3, 10, 'Telefon Samsung', 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sprzedaz`
--

CREATE TABLE `sprzedaz` (
  `id_s` int(11) NOT NULL,
  `id_u` int(11) NOT NULL,
  `id_p` int(11) NOT NULL,
  `id_d` int(11) NOT NULL,
  `ilosc` int(11) NOT NULL,
  `waga` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `sprzedaz`
--

INSERT INTO `sprzedaz` (`id_s`, `id_u`, `id_p`, `id_d`, `ilosc`, `waga`) VALUES
(1, 1, 6, 9, 100, 1),
(2, 1, 12, 1, 4, 4),
(3, 5, 5, 5, 1, 0),
(4, 6, 4, 3, 2, 2),
(5, 12, 2, 2, 100, 100),
(6, 14, 6, 3, 20, 0),
(7, 16, 9, 9, 1, 0),
(8, 14, 3, 6, 2, 0),
(9, 14, 1, 2, 2, 50),
(10, 16, 5, 1, 2, 0),
(11, 13, 8, 5, 4, 0),
(12, 11, 6, 1, 100, 4),
(13, 11, 6, 1, 100, 4),
(14, 11, 6, 1, 100, 4),
(15, 13, 6, 3, 2, 0),
(16, 14, 6, 1, 100, 4),
(17, 15, 9, 3, 4, 4),
(18, 5, 6, 1, 20, 4);

--
-- Wyzwalacze `sprzedaz`
--
DELIMITER $$
CREATE TRIGGER `1` AFTER INSERT ON `sprzedaz` FOR EACH ROW UPDATE produkty SET produkty.ilosc_p = produkty.ilosc_p - NEW.ilosc
WHERE produkty.id_p = NEW.id_p
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownik`
--

CREATE TABLE `uzytkownik` (
  `id_u` int(11) NOT NULL,
  `login_u` varchar(40) COLLATE utf8mb4_polish_ci NOT NULL,
  `haslo_u` varchar(50) COLLATE utf8mb4_polish_ci NOT NULL,
  `email_u` varchar(50) COLLATE utf8mb4_polish_ci NOT NULL,
  `rodzaj_u` enum('administrator','hurtownia','uzytkownik') COLLATE utf8mb4_polish_ci NOT NULL,
  `weryfikacja_u` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `uzytkownik`
--

INSERT INTO `uzytkownik` (`id_u`, `login_u`, `haslo_u`, `email_u`, `rodzaj_u`, `weryfikacja_u`) VALUES
(1, 'ciapaty102', '1234', 'ciapaty124@gmail.com', 'uzytkownik', 1),
(2, 'ciapaty103', '1234', 'ciapaty103@gmail.com', 'uzytkownik', 1),
(3, 'DrozdaSQL', 'toor', 'Drozda@gmail.com', 'administrator', 1),
(4, 'Dr4GoN', 'toor', 'Dr4GoN@gmail.com', 'administrator', 1),
(5, 'ciapaty104', '1234', 'ciapaty104@gmail.com', 'uzytkownik', 1),
(6, 'Adam01', '1234', 'Adam01@gmail.com', 'hurtownia', 1),
(7, 'BartekDom', '1234', 'BartekDom@gmail.com', 'hurtownia', 1),
(8, 'PatrykKom', '1234', 'PatrykKom@gmail.com', 'hurtownia', 1),
(9, 'WiktorDor', '1234', 'WiktorDor@gmail.com', 'hurtownia', 1),
(10, 'Quero', '1234', 'Quero@gmail.com', 'uzytkownik', 1),
(11, 'Wojtek', '1234', 'Wojtek@gmail.com', 'uzytkownik', 1),
(12, 'Brtoszk', '1234', 'bartoszk@gmail.com', 'uzytkownik', 1),
(13, 'Brtoszd', '1234', 'bartoszd@gmail.com', 'uzytkownik', 1),
(14, 'Brtosza', '1234', 'bartosza@gmail.com', 'uzytkownik', 1),
(15, 'Kasiaa', '1234', 'kasia@gmail.com', 'uzytkownik', 1),
(16, 'Kasiad', '1234', 'kasid@gmail.com', 'uzytkownik', 1);

-- --------------------------------------------------------

--
-- Struktura widoku `1`
--
DROP TABLE IF EXISTS `1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `1`  AS  select `uzytkownik`.`login_u` AS `login_u`,`przedawnione_oferty`.`nazwa_o` AS `nazwa_o`,`produkty`.`nazwa_p` AS `nazwa_p` from ((`przedawnione_oferty` join `uzytkownik`) join `produkty`) where ((`produkty`.`id_p` = `przedawnione_oferty`.`id_p`) and (`uzytkownik`.`id_u` = `przedawnione_oferty`.`id_u`)) ;

-- --------------------------------------------------------

--
-- Struktura widoku `2`
--
DROP TABLE IF EXISTS `2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `2`  AS  select `produkty`.`id_p` AS `id_p`,`produkty`.`nazwa_p` AS `nazwa_p`,`produkty`.`waga_p` AS `waga_p`,`produkty`.`ilosc_p` AS `ilosc_p`,`produkty`.`id_h` AS `id_h` from `produkty` where (`produkty`.`ilosc_p` between 1200 and 3000) ;

-- --------------------------------------------------------

--
-- Struktura widoku `3`
--
DROP TABLE IF EXISTS `3`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `3`  AS  select `produkty`.`nazwa_p` AS `nazwa_p`,`hurtownie`.`nazwa_h` AS `nazwa_h` from (`produkty` join `hurtownie`) where (`hurtownie`.`id_h` = `produkty`.`id_h`) ;

-- --------------------------------------------------------

--
-- Struktura widoku `4`
--
DROP TABLE IF EXISTS `4`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `4`  AS  select avg(`sprzedaz`.`ilosc`) AS `Srednia ilosc sprzedanych produktow` from `sprzedaz` ;

-- --------------------------------------------------------

--
-- Struktura widoku `5`
--
DROP TABLE IF EXISTS `5`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `5`  AS  select sum(`sprzedaz`.`ilosc`) AS `SUM(sprzedaz.ilosc)` from `sprzedaz` where (`sprzedaz`.`id_u` = 1) ;

-- --------------------------------------------------------

--
-- Struktura widoku `6`
--
DROP TABLE IF EXISTS `6`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `6`  AS  select `uzytkownik`.`id_u` AS `id_u`,`uzytkownik`.`login_u` AS `login_u`,`uzytkownik`.`haslo_u` AS `haslo_u`,`uzytkownik`.`email_u` AS `email_u`,`uzytkownik`.`rodzaj_u` AS `rodzaj_u`,`uzytkownik`.`weryfikacja_u` AS `weryfikacja_u` from `uzytkownik` where ((`uzytkownik`.`id_u` between 10 and 20) and (not((`uzytkownik`.`login_u` like 'Ka%')))) ;

-- --------------------------------------------------------

--
-- Struktura widoku `7`
--
DROP TABLE IF EXISTS `7`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `7`  AS  select `produkty`.`nazwa_p` AS `nazwa_p` from (`produkty` join `hurtownie`) where `hurtownie`.`id_h` in (select `produkty`.`id_h` from `produkty` where (`produkty`.`id_h` between 8 and 10)) ;

-- --------------------------------------------------------

--
-- Struktura widoku `8`
--
DROP TABLE IF EXISTS `8`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `8`  AS  select count(`produkty`.`ilosc_p`) AS `COUNT(produkty.ilosc_p)` from `produkty` where (`produkty`.`nazwa_p` like 'Ma%') ;

-- --------------------------------------------------------

--
-- Struktura widoku `9`
--
DROP TABLE IF EXISTS `9`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `9`  AS  select `produkty`.`id_p` AS `id_p`,`produkty`.`nazwa_p` AS `nazwa_p`,if((`produkty`.`ilosc_p` > 1700),'Tak','Nie') AS `IF(produkty.ilosc_p > 1700, "Tak", "Nie")` from `produkty` ;

-- --------------------------------------------------------

--
-- Struktura widoku `10`
--
DROP TABLE IF EXISTS `10`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `10`  AS  select `uzytkownik`.`login_u` AS `login_u`,`oferta`.`nazwa_o` AS `nazwa_o` from (`oferta` join `uzytkownik`) where ((`oferta`.`id_u` = `uzytkownik`.`id_u`) and (`uzytkownik`.`id_u` between 3 and 12)) ;

-- --------------------------------------------------------

--
-- Struktura widoku `11`
--
DROP TABLE IF EXISTS `11`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `11`  AS  select `uzytkownik`.`login_u` AS `login_u`,`produkty`.`nazwa_p` AS `nazwa_p` from ((`uzytkownik` join `produkty`) join `sprzedaz`) where ((`uzytkownik`.`id_u` = `sprzedaz`.`id_u`) and (`produkty`.`id_p` = `sprzedaz`.`id_p`)) order by `sprzedaz`.`ilosc` ;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `dostawcy`
--
ALTER TABLE `dostawcy`
  ADD PRIMARY KEY (`id_d`);

--
-- Indexes for table `hurtownie`
--
ALTER TABLE `hurtownie`
  ADD PRIMARY KEY (`id_h`);

--
-- Indexes for table `oferta`
--
ALTER TABLE `oferta`
  ADD PRIMARY KEY (`id_o`);

--
-- Indexes for table `produkty`
--
ALTER TABLE `produkty`
  ADD PRIMARY KEY (`id_p`);

--
-- Indexes for table `przedawnione_oferty`
--
ALTER TABLE `przedawnione_oferty`
  ADD PRIMARY KEY (`id_po`);

--
-- Indexes for table `sprzedaz`
--
ALTER TABLE `sprzedaz`
  ADD PRIMARY KEY (`id_s`),
  ADD KEY `id_s` (`id_s`,`id_u`,`id_p`,`id_d`,`ilosc`,`waga`);

--
-- Indexes for table `uzytkownik`
--
ALTER TABLE `uzytkownik`
  ADD PRIMARY KEY (`id_u`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `dostawcy`
--
ALTER TABLE `dostawcy`
  MODIFY `id_d` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT dla tabeli `hurtownie`
--
ALTER TABLE `hurtownie`
  MODIFY `id_h` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT dla tabeli `oferta`
--
ALTER TABLE `oferta`
  MODIFY `id_o` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT dla tabeli `produkty`
--
ALTER TABLE `produkty`
  MODIFY `id_p` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT dla tabeli `przedawnione_oferty`
--
ALTER TABLE `przedawnione_oferty`
  MODIFY `id_po` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT dla tabeli `sprzedaz`
--
ALTER TABLE `sprzedaz`
  MODIFY `id_s` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT dla tabeli `uzytkownik`
--
ALTER TABLE `uzytkownik`
  MODIFY `id_u` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
