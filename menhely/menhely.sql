-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Okt 10. 11:22
-- Kiszolgáló verziója: 10.4.28-MariaDB
-- PHP verzió: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `menhely`
--
CREATE DATABASE IF NOT EXISTS `menhely` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `menhely`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `allat`
--

DROP TABLE IF EXISTS `allat`;
CREATE TABLE `allat` (
  `allatid` int(10) UNSIGNED NOT NULL,
  `allat_neve` varchar(70) NOT NULL,
  `faj` varchar(60) NOT NULL,
  `fajta` varchar(30) DEFAULT NULL,
  `szuletesi_ido` date DEFAULT NULL,
  `nem` varchar(50) DEFAULT NULL,
  `megjegyzes` varchar(28) DEFAULT NULL,
  `nyilvantartasban` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `allat`
--

INSERT INTO `allat` (`allatid`, `allat_neve`, `faj`, `fajta`, `szuletesi_ido`, `nem`, `megjegyzes`, `nyilvantartasban`) VALUES
(1, 'András', 'kutya', 'vizsla', '2018-09-11', 'kan', 'betegsége nincs', '2022-11-22'),
(2, 'Bodri', 'kutya', 'puli', '2020-10-10', 'kan', 'betegsége nincs', '2023-09-09'),
(3, 'Bosco', 'kutya', 'stafford', '2016-03-18', 'kan', '', '2023-09-11'),
(4, 'Cirmi', 'macska', 'perzsa', '2020-10-20', 'szuka', 'betegsége nincs', '2021-02-10'),
(5, 'Falco', 'kutya', 'palotapincsi', '2021-01-05', 'szuka', 'játékos', '2021-03-16'),
(6, 'Franko', 'kutya', 'buldog', '2018-10-10', 'kan', 'betegsége nincs', '2023-08-10'),
(7, 'Gazsi', 'kutya', 'Mobsz', '2021-01-11', 'szuka', 'csinos', '2023-05-10'),
(8, 'Joker', 'kutya', 'kangal', '2015-02-08', 'kan', 'betegsége nincs', '2023-07-19'),
(9, 'Kati', 'macska', 'perzsa', '2018-10-17', 'szuka', 'beteg', '2023-08-16'),
(10, 'Maci', 'kutya', 'németjuhasz', '2019-10-01', 'kan', 'egészséges', '2020-10-01'),
(11, 'Maszat', 'kutya', 'Tibeti Masztiff', '2021-01-01', 'kan', 'betegség nincs', '2023-02-27'),
(12, 'Métisz', 'macska', 'Maine Coon', '2009-01-22', 'szuka', 'betegség nincs', '2020-11-20'),
(13, 'Mónika', 'matka', 'utca matka', '2024-01-01', 'szuka', 'allandoan fial', '1956-08-06'),
(14, 'Morcika', 'kutya', 'Rottweiler', '2015-12-24', 'kan', 'betegsége nincs', '2020-10-15'),
(15, 'Pocok', 'kutya', 'tacskó', '2019-03-05', 'kan', 'betegsége nincs', '2023-09-24'),
(16, 'Tacsi', 'kutya', 'tacskó', '2014-05-07', 'kan', 'rákos, szürkehályog, rokkant', '2018-09-18');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `orokbefogadas`
--

DROP TABLE IF EXISTS `orokbefogadas`;
CREATE TABLE `orokbefogadas` (
  `allatid` int(10) UNSIGNED NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL,
  `orokbefogadas` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `orokbefogadas`
--

INSERT INTO `orokbefogadas` (`allatid`, `userid`, `orokbefogadas`) VALUES
(14, 2, '2022-10-15'),
(1, 3, '2023-05-23'),
(6, 11, '2023-10-10'),
(9, 8, '2023-10-22'),
(15, 9, '2023-10-02'),
(10, 5, '2022-10-02'),
(2, 1, '2023-10-08'),
(4, 10, '2021-10-10'),
(11, 4, '2023-03-01'),
(7, 7, '2023-10-10'),
(13, 6, '2022-05-02');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `userid` int(10) UNSIGNED NOT NULL,
  `igazolvanyszam` varchar(8) NOT NULL,
  `orokbefogado_neve` varchar(50) NOT NULL,
  `emailcim` varchar(100) NOT NULL,
  `user` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`userid`, `igazolvanyszam`, `orokbefogado_neve`, `emailcim`, `user`, `password`) VALUES
(1, '123456AB', 'Elemér', 'elemer@posta.hu', '', ''),
(2, '152525MJ', 'Józsika', 'jozsibacsi@hotmail.com', '', ''),
(3, '194425BB', 'Ferenc', 'ferike34@gmail.com', '', ''),
(4, '199919JO', 'Pista', 'mcpista@freemail.hu', '', ''),
(5, '306012BC', 'Majka', 'majka@gmail.hu', '', ''),
(6, '34t456EF', 'Edit anya', 'edit_anyu@gmail.com', '', ''),
(7, '543235HR', 'Blanka', 'kutyabarat11@citromail.hu', '', ''),
(8, '567432FD', ' Janos', 'nagyjanos@gmail.com', '', ''),
(9, '632901FF', 'Kálmán', 'kálmán@gmail.com', '', ''),
(10, '789546BK', 'Béla', 'belavagyok@gmail.com', '', ''),
(11, '987654EF', 'Adam', 'nagyadam@gmail.com', '', '');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `allat`
--
ALTER TABLE `allat`
  ADD PRIMARY KEY (`allatid`),
  ADD UNIQUE KEY `allat_neve` (`allat_neve`);

--
-- A tábla indexei `orokbefogadas`
--
ALTER TABLE `orokbefogadas`
  ADD KEY `fk_orokbefogadas_allat` (`allatid`),
  ADD KEY `fk_orokbefogadas_user` (`userid`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`),
  ADD UNIQUE KEY `igazolvanyszam` (`igazolvanyszam`),
  ADD UNIQUE KEY `emailcim` (`emailcim`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `allat`
--
ALTER TABLE `allat`
  MODIFY `allatid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `userid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `orokbefogadas`
--
ALTER TABLE `orokbefogadas`
  ADD CONSTRAINT `fk_orokbefogadas_allat` FOREIGN KEY (`allatid`) REFERENCES `allat` (`allatid`),
  ADD CONSTRAINT `fk_orokbefogadas_user` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
