-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Már 03. 12:41
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `toppet`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `categories`
--

CREATE TABLE `categories` (
  `kategoria_id` int(11) NOT NULL,
  `madar_termek_id` int(50) NOT NULL,
  `hal_hullo_termek_id` int(255) NOT NULL,
  `hullo_termek_id` int(255) NOT NULL,
  `kisemlos_termek_id` int(255) NOT NULL,
  `kutya_termek_id` int(255) NOT NULL,
  `macska_termek_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `felhasznalo`
--

CREATE TABLE `felhasznalo` (
  `felhasznalo_id` int(20) NOT NULL,
  `jelszo` varchar(255) NOT NULL,
  `felhaszn_nev` varchar(255) NOT NULL,
  `email_cim` varchar(255) NOT NULL,
  `szallitasi_cim_id` int(11) NOT NULL,
  `szamlazasi_cim_id` int(11) NOT NULL,
  `telefonszam` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `hal_hullo_termek`
--

CREATE TABLE `hal_hullo_termek` (
  `id` int(11) NOT NULL,
  `nev` varchar(255) NOT NULL,
  `ar` int(11) NOT NULL,
  `leiras` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `hullő_termek`
--

CREATE TABLE `hullő_termek` (
  `id` int(11) NOT NULL,
  `nev` varchar(255) NOT NULL,
  `ar` int(11) NOT NULL,
  `leiras` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kisemlos_termek`
--

CREATE TABLE `kisemlos_termek` (
  `id` int(11) NOT NULL,
  `nev` varchar(255) NOT NULL,
  `ar` int(11) NOT NULL,
  `leiras` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kosar`
--

CREATE TABLE `kosar` (
  `kosar_id` int(11) NOT NULL,
  `felhasznalo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kosar_termek`
--

CREATE TABLE `kosar_termek` (
  `kosar_termek_id` bigint(20) NOT NULL,
  `kosar_id` int(11) NOT NULL,
  `kategoria_id` int(11) NOT NULL,
  `mennyiseg` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kutya_termek`
--

CREATE TABLE `kutya_termek` (
  `id` int(11) NOT NULL,
  `nev` varchar(255) NOT NULL,
  `ar` int(11) NOT NULL,
  `leiras` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `macska_termek`
--

CREATE TABLE `macska_termek` (
  `id` int(11) NOT NULL,
  `nev` varchar(255) NOT NULL,
  `ar` int(11) NOT NULL,
  `leiras` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `madar_termek`
--

CREATE TABLE `madar_termek` (
  `id` int(11) NOT NULL,
  `nev` varchar(255) NOT NULL,
  `ar` int(11) NOT NULL,
  `leiras` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`kategoria_id`),
  ADD KEY `madar_termek_id` (`madar_termek_id`,`hal_hullo_termek_id`,`hullo_termek_id`,`kisemlos_termek_id`,`kutya_termek_id`,`macska_termek_id`),
  ADD KEY `hullo_termek_id` (`hullo_termek_id`),
  ADD KEY `macska_termek_id` (`macska_termek_id`),
  ADD KEY `hal_hullo_termek_id` (`hal_hullo_termek_id`),
  ADD KEY `kutya_termek_id` (`kutya_termek_id`),
  ADD KEY `kisemlos_termek_id` (`kisemlos_termek_id`);

--
-- A tábla indexei `felhasznalo`
--
ALTER TABLE `felhasznalo`
  ADD UNIQUE KEY `felhaszn_id` (`felhasznalo_id`);

--
-- A tábla indexei `hal_hullo_termek`
--
ALTER TABLE `hal_hullo_termek`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `hullő_termek`
--
ALTER TABLE `hullő_termek`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `kisemlos_termek`
--
ALTER TABLE `kisemlos_termek`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `kosar`
--
ALTER TABLE `kosar`
  ADD PRIMARY KEY (`kosar_id`),
  ADD KEY `felhasznalo_id` (`felhasznalo_id`);

--
-- A tábla indexei `kosar_termek`
--
ALTER TABLE `kosar_termek`
  ADD PRIMARY KEY (`kosar_termek_id`),
  ADD KEY `kategoria_id` (`kategoria_id`),
  ADD KEY `kosar_id` (`kosar_id`);

--
-- A tábla indexei `kutya_termek`
--
ALTER TABLE `kutya_termek`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `macska_termek`
--
ALTER TABLE `macska_termek`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `madar_termek`
--
ALTER TABLE `madar_termek`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `categories`
--
ALTER TABLE `categories`
  MODIFY `kategoria_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `felhasznalo`
--
ALTER TABLE `felhasznalo`
  MODIFY `felhasznalo_id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `hal_hullo_termek`
--
ALTER TABLE `hal_hullo_termek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `hullő_termek`
--
ALTER TABLE `hullő_termek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `kisemlos_termek`
--
ALTER TABLE `kisemlos_termek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `kutya_termek`
--
ALTER TABLE `kutya_termek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `macska_termek`
--
ALTER TABLE `macska_termek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `madar_termek`
--
ALTER TABLE `madar_termek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`kategoria_id`) REFERENCES `kosar_termek` (`kategoria_id`),
  ADD CONSTRAINT `categories_ibfk_3` FOREIGN KEY (`hullo_termek_id`) REFERENCES `hullő_termek` (`id`),
  ADD CONSTRAINT `categories_ibfk_4` FOREIGN KEY (`macska_termek_id`) REFERENCES `macska_termek` (`id`),
  ADD CONSTRAINT `categories_ibfk_5` FOREIGN KEY (`hal_hullo_termek_id`) REFERENCES `hal_hullo_termek` (`id`),
  ADD CONSTRAINT `categories_ibfk_6` FOREIGN KEY (`kutya_termek_id`) REFERENCES `kutya_termek` (`id`),
  ADD CONSTRAINT `categories_ibfk_7` FOREIGN KEY (`kisemlos_termek_id`) REFERENCES `kisemlos_termek` (`id`);

--
-- Megkötések a táblához `kosar`
--
ALTER TABLE `kosar`
  ADD CONSTRAINT `kosar_ibfk_1` FOREIGN KEY (`felhasznalo_id`) REFERENCES `felhasznalo` (`felhasznalo_id`);

--
-- Megkötések a táblához `kosar_termek`
--
ALTER TABLE `kosar_termek`
  ADD CONSTRAINT `kosar_termek_ibfk_1` FOREIGN KEY (`kosar_id`) REFERENCES `kosar` (`kosar_id`);

--
-- Megkötések a táblához `madar_termek`
--
ALTER TABLE `madar_termek`
  ADD CONSTRAINT `madar_termek_ibfk_1` FOREIGN KEY (`id`) REFERENCES `categories` (`madar_termek_id`);



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
