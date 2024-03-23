

CREATE DATABASe toppet;


USE `toppet`;
-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Már 04. 09:33
-- Kiszolgáló verziója: 10.4.24-MariaDB
-- PHP verzió: 8.1.6

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
  `hal_hullo_termek_id` int(11) NOT NULL,
  `hullő_termek_id` int(11) NOT NULL,
  `kutya_termek_id` int(11) NOT NULL,
  `macska_termek_id` int(11) NOT NULL,
  `madar_termek_id` int(11) NOT NULL,
  `kisemlos_termek_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `felhasznalo`
--

CREATE TABLE `felhasznalo` (
  `felhasznalo_id` int(20) NOT NULL,
  `jelszo` varchar(15) COLLATE utf8_hungarian_ci NOT NULL,
  `felhaszn_nev` varchar(30) COLLATE utf8_hungarian_ci NOT NULL,
  `email_cim` varchar(50) COLLATE utf8_hungarian_ci NOT NULL,
  `szallitasi_cim_id` int(11) NOT NULL,
  `szamlazasi_cim_id` int(11) NOT NULL,
  `telefonszam` varchar(30) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `hal_hullo_termek`
--

CREATE TABLE `hal_hullo_termek` (
  `id` int(11) NOT NULL,
  `nev` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `ar` int(11) NOT NULL,
  `leiras` text COLLATE utf8_hungarian_ci DEFAULT NULL,
  `kepek_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

INSERT INTO `hal_hullo_termek` (`id`, `nev`, `ar`, `leiras`, `kepek_id`) VALUES
(1, 'Akvárium dekoráció', 2000, 'Színes műanyag díszek akváriumokhoz, hogy otthonosabbá tegye halai számára az otthont.', 0),
(2, 'Teknős hőlámpa', 3000, 'Infravörös hőlámpa teknősök számára, amely biztosítja a megfelelő hőmérsékletet és megvilágítást a terráriumban.', 0),
(3, 'Hal akváriumszűrő', 4000, 'Hatékony és csendes akváriumszűrő, amely tiszta és egészséges környezetet biztosít a halaknak.', 0),
(4, 'Hal élettér dísz', 2500, 'Természetes megjelenésű műanyag dísz hal akváriumokhoz, amelyek élénkítik a víz alatti környezetet.', 0),
(5, 'Hal élelem', 1500, 'Magas minőségű halélelem, amely biztosítja a halak egészséges táplálkozását és fejlődését.', 0),
(6, 'Hal akváriumszűrő pumpa', 3500, 'Erős és hatékony szűrő pumpa akváriumokhoz, amely tiszta és oxigénben gazdag környezetet biztosít a halaknak.', 0),
(7, 'Hal akváriumdekor', 2000, 'Színes és élethű akváriumdekoráció, amely érdekesebbé teszi a halak élőhelyét és segíti őket a rejtekhelyek megtalálásában.', 0),
(8, 'Hal élettér fenék dísz', 1200, 'Természetes megjelenésű műanyag dísz akváriumokhoz, amely díszíti a halak életterét és segíti azokat a természetes viselkedésükben.', 0),
(9, 'Hal élelmiszertabletta', 1800, 'Tápláló és egészséges élelmiszertabletta halaknak, amely egyszerűvé teszi a táplálkozást és a táplálékadagolást.', 0),
(10, 'Hal akvárium hőmérő', 700, 'Precíz és könnyen olvasható hőmérő akváriumokhoz, amely segít a megfelelő hőmérséklet fenntartásában a halak számára.', 0),
(11, 'Hal akvárium növény', 900, 'Élethű és könnyen gondozható műanyag akváriumnövény, amely díszíti a halak élőhelyét és oxigént termel.', 0);
(12, 'Hüllő hőmérő', 1500, 'Precíz és könnyen olvasható hőmérő hüllők terráriumához, amely segít a megfelelő hőmérséklet fenntartásában.', 0),
(20, 'Hüllő táplálótál', 800, 'Könnyen tisztítható és tartós műanyag táplálótál hüllők számára, amely segíti a rendszeres és tiszta táplálkozást.', 0),
(13, 'Hüllő csontváz dísz', 2000, 'Valósághű és különleges csontváz dísz hüllő terráriumokhoz, amelyek érdekesebbé teszik a terrárium belső kialakítását.', 0),
(14, 'Hüllő napfénylámpa', 2500, 'UVB-sugárzó napfénylámpa hüllők terráriumához, amely segíti azokat a D-vitamin termelésében és az anyagcserében.', 0),
(15, 'Hüllő hidegoldó', 1200, 'Elektromos hidegoldó hüllők terráriumához, amely segít megakadályozni a túlzott hőmérsékletet a terráriumban.', 0),
(16, 'Hüllő szőnyeg', 600, 'Természetes hatású és könnyen tisztítható szőnyeg hüllők terráriumához, amely segíti a hüllők mozgását és kényelmét.', 0),
(17, 'Hüllő terrárium dísz', 1800, 'Természetes megjelenésű műanyag dísz hüllő terráriumokhoz, hogy valósághűbbé tegye a környezetüket.', 0),
(18, 'Hüllő lámpa állvány', 2000, 'Állítható hő- és fényforrás tartó állvány hüllők terráriumához, hogy megfelelő környezetet biztosítson számukra.', 0),
(19, 'Hüllő terrárium növény', 1200, 'Természetes megjelenésű műanyag növény hüllő terráriumokhoz, hogy otthonosabbá tegye a hüllők élőhelyét.', 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `hullő_termek`
--

CREATE TABLE `hullő_termek` (
  `id` int(11) NOT NULL,
  `nev` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `ar` int(11) NOT NULL,
  `leiras` text COLLATE utf8_hungarian_ci DEFAULT NULL,
  `kepek_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kepek`
--

CREATE TABLE `kepek` (
  `kepek_id` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kisemlos_termek`
--

CREATE TABLE `kisemlos_termek` (
  `id` int(11) NOT NULL,
  `nev` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `ar` int(11) NOT NULL,
  `leiras` text COLLATE utf8_hungarian_ci DEFAULT NULL,
  `kepek_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

INSERT INTO `kisemlos_termek` (`id`, `nev`, `ar`, `leiras`, `kepek_id`) VALUES
(1, 'Kisemlős futókerék', 1500, 'Kényelmes és biztonságos futókerék kisemlősök számára, amely segít fenntartani az egészségüket és formájukat.', 0),
(2, 'Kisemlős takaróház', 1800, 'Puha és meleg takaróház kisemlősök számára, amely biztosítja a kényelmet és biztonságot.', 0),
(3, 'Kisemlős játék guruló labda', 800, 'Színes és mozgó játék labda kisemlősök számára, amely stimulálja a mozgást és az érzékeket.', 0),
(4, 'Kisemlős alom', 1000, 'Szagtalan és pormentes kisemlős alom, amely biztosítja a higiéniás környezetet és a kényelmet.', 0),
(5, 'Kisemlős fésű', 700, 'Puha sörtéjű fésű kisemlősök szőrzetének ápolásához és tisztításához.', 0),
(6, 'Kisemlős hám', 1500, 'Kényelmes és állítható kisemlős hám, amely segíti a séták során történő irányítást és biztonságos vezetést.', 0),
(7, 'Kisemlős futólabda', 1300, 'Állítható és biztonságos futólabda kisemlősöknek, amely stimulálja a mozgást és a szórakozást.', 0),
(8, 'Kisemlős labirintus játék', 1500, 'Színes és interaktív labirintus játék kisemlősöknek, amely fejleszti az intelligenciát és a készségeket.', 0),
(9, 'Kisemlős játszótér', 2500, 'Színes és változatos játszótér kisemlősöknek, amely segíti a mozgást és a szórakozást.', 0),
(10, 'Kisemlős játszóház', 2000, 'Színes és strapabíró játszóház kisemlősöknek, amely kényelmes pihenőhelyet és szórakozást biztosít.', 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kosar`
--

CREATE TABLE `kosar` (
  `kosar_id` int(11) NOT NULL,
  `felhasznalo_id` int(11) NOT NULL,
  `megrendeles_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kosar_termek`
--

CREATE TABLE `kosar_termek` (
  `kosar_termek_id` int(11) NOT NULL,
  `kosar_id` int(11) NOT NULL,
  `termek_id` int(11) NOT NULL,
  `mennyiseg` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kutya_termek`
--

CREATE TABLE `kutya_termek` (
  `id` int(11) NOT NULL,
  `nev` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `ar` int(11) NOT NULL,
  `leiras` text COLLATE utf8_hungarian_ci DEFAULT NULL,
  `kepek_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------
INSERT INTO `kutya_termek` (`id`, `nev`, `ar`, `leiras`, `kepek_id`) VALUES
(53, 'Kutya nyakörv', 2500, 'Divatos és kényelmes kutya nyakörv puha anyagból, amely biztosítja a kutyád biztonságát és kényelmét séták során.', 1),
(54, 'Kutya etetőtál', 1500, 'Praktikus és könnyen tisztítható műanyag etetőtál kutyáknak, amely segít a rendszeres és egészséges táplálkozásban.', 2),
(55, 'Kutya póráz', 2000, 'Erős és strapabíró póráz kutyáknak, amely segít a biztonságos sétákban és vezetéken tartásban.', 3),
(56, 'Kutya hálózsák', 4000, 'Kényelmes és puha hálózsák kutyáknak, ideális alváshoz és pihenéshez otthon vagy kirándulások során.', 0),
(57, 'Kutya biztonsági öv', 3000, 'Biztonsági öv kutyáknak az autóban, amely biztosítja a kutyád biztonságát és a vezetés zavartalan menetét.', 0),
(58, 'Kutya öltöztető ruha', 2500, 'Divatos és kényelmes öltöztető ruha kutyáknak hideg időkre, amely megvédi őket a hidegtől és stílusos megjelenést biztosít.', 0),
(59, 'Kutya hűsítő matrac', 3500, 'Hűsítő és légáteresztő matrac kutyáknak, amely segít megelőzni a túlmelegedést és biztosítja a kényelmet.', 0),
(60, 'Kutya masszázseszköz', 2000, 'Kényelmes és hatékony masszázseszköz kutyáknak, amely segít lazítani az izmokat és javítja a vérkeringést.', 0),
(61, 'Kutya kutyakabát', 3000, 'Vízálló és meleg kutyakabát hideg időkre, amely védi a kutyádat a nedvességtől és a hidegtől.', 0);
--
-- Tábla szerkezet ehhez a táblához `macska_termek`
--

CREATE TABLE `macska_termek` (
  `id` int(11) NOT NULL,
  `nev` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `ar` int(11) NOT NULL,
  `leiras` text COLLATE utf8_hungarian_ci DEFAULT NULL,
  `kepek_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

INSERT INTO `macska_termek` (`id`, `nev`, `ar`, `leiras`, `kepek_id`) VALUES
(1, 'Macska cicakaparó', 2500, 'Tartós és strapabíró cicakaparó macskáknak, amely segít megelőzni a karmolászást a bútorokon és a falakon.', 0),
(2, 'Macska alomtisztító lapát', 1000, 'Kényelmes és praktikus alomtisztító lapát macskákhoz, amely segíti a gyors és hatékony alomtisztítást.', 0),
(3, 'Macska játékszer labirintus', 1800, 'Interaktív és szórakoztató labirintus játékszer macskáknak, amely fejleszti az intelligenciát és a készségeket.', 0),
(4, 'Macska hordozható WC', 2800, 'Praktikus és könnyen hordozható WC macskáknak utazáshoz vagy kis lakásokba.', 0),
(5, 'Macska játékszer madárfog', 600, 'Színes és mozgó játékszer macskáknak, amely segíti a vadászösztönt és a szórakozást.', 0),
(6, 'Macska cső', 1800, 'Szórakoztató és szöszmözölő cső macskáknak, amely segíti a mozgást és a játékot.', 0),
(7, 'Macska hintaág', 3500, 'Szórakoztató és kényelmes hintaág macskáknak, amely segít az aktív játékban és pihenésben egyaránt.', 0),
(8, 'Macska alomtálca', 3000, 'Szagsemlegesítő fedővel ellátott macska alomtálca, amely kényelmes és higiénikus környezetet biztosít a macskák számára.', 0),
(9, 'Macska játékszer egér', 500, 'Puha és mozgó játék egér macskáknak, amely stimulálja a vadászösztönt és a játékot.', 0),
(10, 'Macska karmolófa', 5000, 'Magas minőségű karmolófa macskáknak, amely megvédi a bútorokat és lehetővé teszi a macska számára a karmolászást.', 0);
-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `madar_termek`
--

CREATE TABLE `madar_termek` (
  `id` int(11) NOT NULL,
  `nev` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `ar` int(11) NOT NULL,
  `leiras` text COLLATE utf8_hungarian_ci DEFAULT NULL,
  `kepek_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

INSERT INTO `madar_termek` (`id`, `nev`, `ar`, `leiras`, `kepek_id`) VALUES
(201, 'Madár tollas játék', 800, 'Interaktív és szórakoztató tollas játék madaraknak, amely fejleszti a koordinációt és a játékot.', 0),
(202, 'Madár fésű', 500, 'Kényelmes és puha fésű madaraknak, amely segíti a tollak ápolását és a kényelmes érzést.', 0),
(203, 'Madár hintáztató', 1000, 'Biztonságos és szórakoztató hintáztató madaraknak, amely stimulálja a mozgást és a játékot.', 0),
(204, 'Madár rágó játék', 700, 'Biztonságos és szórakoztató rágó játék madaraknak, amely segíti a csőrük egészséges fenntartását és a játékot.', 0),
(205, 'Madár fürdőkád', 1600, 'Könnyen felszerelhető és tisztítható fürdőkád madaraknak, amely segíti a higiéniát és a tollak ápolását.', 0),
(206, 'Madár játékkönyv', 1200, 'Interaktív és tanulást segítő játékkönyv madaraknak, amely fejleszti az érzékeket és az intelligenciát.', 0),
(207, 'Madár etetőtál', 800, 'Könnyen tisztítható és tartós madár etetőtál, amely lehetővé teszi, hogy kedvenc madaraid kényelmesen táplálkozhassanak.', 0),
(208, 'Madár hinta', 1000, 'Színes és szórakoztató madár hinta, amely lehetővé teszi a madarak számára a szabad repülés érzését a ketrecben.', 0),
(209, 'Madár etetőállvány', 1200, 'Könnyen felállítható és tisztítható madár etetőállvány, amely lehetővé teszi a madarak kényelmes táplálkozását.', 0),
(210, 'Madár játszófa', 3000, 'Színes és interaktív madár játszófa, amely segíti a madarak szellemi és fizikai fejlődését.', 0);


-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `megrendeles`
--

CREATE TABLE `megrendeles` (
  `megrendeles_id` int(11) NOT NULL,
  `statusz` int(11) NOT NULL,
  `termek_id` int(11) NOT NULL,
  `mennyiseg` int(11) NOT NULL,
  `megrendelő_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `megrendelő`
--

CREATE TABLE `megrendelő` (
  `megrendelő_id` int(11) NOT NULL,
  `felhasznalo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `termekek`
--

CREATE TABLE `termekek` (
  `termek_id` int(11) NOT NULL,
  `nev` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `ar` int(11) NOT NULL,
  `leiras` text COLLATE utf8_hungarian_ci DEFAULT NULL,
  `kategoria_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

CREATE TABLE `kepek_id` (
    kepek_id INT PRIMARY KEY,
    url VARCHAR(255)
);


INSERT INTO `kepek_id` (`kep_id`,`url`) VALUES
(1, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fjatekszallito.hu%2Ftermek%2Fmeretre-szabhato-vilagito-kutya-nyakorv-figyelemfelkelto-biztonsagi-nyakorv-esti-setakhoz-barmilyen-meretu-kutyanak-sarga-led-fennyel-bb-21631%2F&psig=AOvVaw2RV4NRTV5-9Upm0LJTX3nn&ust=1711291372348000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCMjL8abPioUDFQAAAAAdAAAAABAF'),
(2, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fmypetdolgok.com%2Fproduct%2Frozsdamentes-etetotal-kolyok-kutya-elvalasztasara%2F&psig=AOvVaw1ohjmI_S9tgXZRG_v4hKsX&ust=1711288789518000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCKipudfFioUDFQAAAAAdAAAAABAw'),
(3, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.zooplus.hu%2Fmagazin%2Fkutya-magazin%2Fkutyatartas%2Flegjobb-poraz&psig=AOvVaw3Q27zRGNOfKkIbRjMHsBMJ&ust=1711291411664000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCOCZxrnPioUDFQAAAAAdAAAAABAL'),

--
-- A tábla adatainak kiíratása `termekek`
--



--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`kategoria_id`),
  ADD KEY `hal_hullo_termek_id` (`hal_hullo_termek_id`,`hullő_termek_id`,`kutya_termek_id`,`macska_termek_id`,`madar_termek_id`,`kisemlos_termek_id`),
  ADD KEY `kisemlos_termek_id` (`kisemlos_termek_id`),
  ADD KEY `kutya_termek_id` (`kutya_termek_id`),
  ADD KEY `hal_termek_id` (`hullő_termek_id`),
  ADD KEY `madar_termek_id` (`madar_termek_id`),
  ADD KEY `macska_termek_id` (`macska_termek_id`);

--
-- A tábla indexei `felhasznalo`
--
ALTER TABLE `felhasznalo`
  ADD UNIQUE KEY `felhaszn_id` (`felhasznalo_id`);

--
-- A tábla indexei `hal_hullo_termek`
--
ALTER TABLE `hal_hullo_termek`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kepek_id` (`kepek_id`);

--
-- A tábla indexei `hullő_termek`
--
ALTER TABLE `hullő_termek`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kepek_id` (`kepek_id`);

--
-- A tábla indexei `kepek`
--
ALTER TABLE `kepek`
  ADD PRIMARY KEY (`kepek_id`);

--
-- A tábla indexei `kisemlos_termek`
--
ALTER TABLE `kisemlos_termek`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kepek_id` (`kepek_id`);

--
-- A tábla indexei `kosar`
--
ALTER TABLE `kosar`
  ADD PRIMARY KEY (`kosar_id`),
  ADD KEY `felhasznalo_id` (`felhasznalo_id`),
  ADD KEY `megrendeles_id` (`megrendeles_id`);

--
-- A tábla indexei `kosar_termek`
--
ALTER TABLE `kosar_termek`
  ADD PRIMARY KEY (`kosar_termek_id`),
  ADD KEY `kategoria_id` (`termek_id`),
  ADD KEY `kosar_id` (`kosar_id`);

--
-- A tábla indexei `kutya_termek`
--
ALTER TABLE `kutya_termek`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kepek_id` (`kepek_id`);

--
-- A tábla indexei `macska_termek`
--
ALTER TABLE `macska_termek`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kepek_id` (`kepek_id`);

--
-- A tábla indexei `madar_termek`
--
ALTER TABLE `madar_termek`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kepek_id` (`kepek_id`);

--
-- A tábla indexei `megrendeles`
--
ALTER TABLE `megrendeles`
  ADD PRIMARY KEY (`megrendeles_id`),
  ADD KEY `termek_id` (`termek_id`,`megrendelő_id`),
  ADD KEY `megrendelő_id` (`megrendelő_id`);

--
-- A tábla indexei `megrendelő`
--
ALTER TABLE `megrendelő`
  ADD PRIMARY KEY (`megrendelő_id`),
  ADD KEY `felhasznalo_id` (`felhasznalo_id`);

--
-- A tábla indexei `termekek`
--
ALTER TABLE `termekek`
  ADD PRIMARY KEY (`termek_id`),
  ADD KEY `kategoria_id` (`kategoria_id`);

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
-- AUTO_INCREMENT a táblához `termekek`
--
ALTER TABLE `termekek`
  MODIFY `termek_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`kategoria_id`) REFERENCES `termekek` (`kategoria_id`),
  ADD CONSTRAINT `categories_ibfk_2` FOREIGN KEY (`kisemlos_termek_id`) REFERENCES `kisemlos_termek` (`id`),
  ADD CONSTRAINT `categories_ibfk_3` FOREIGN KEY (`kutya_termek_id`) REFERENCES `kutya_termek` (`id`),
  ADD CONSTRAINT `categories_ibfk_4` FOREIGN KEY (`hullő_termek_id`) REFERENCES `hullő_termek` (`id`),
  ADD CONSTRAINT `categories_ibfk_5` FOREIGN KEY (`madar_termek_id`) REFERENCES `madar_termek` (`id`),
  ADD CONSTRAINT `categories_ibfk_6` FOREIGN KEY (`macska_termek_id`) REFERENCES `macska_termek` (`id`),
  ADD CONSTRAINT `categories_ibfk_7` FOREIGN KEY (`hal_hullo_termek_id`) REFERENCES `hal_hullo_termek` (`id`);

--
-- Megkötések a táblához `felhasznalo`
--
ALTER TABLE `felhasznalo`
  ADD CONSTRAINT `felhasznalo_ibfk_1` FOREIGN KEY (`felhasznalo_id`) REFERENCES `megrendelő` (`felhasznalo_id`);

--
-- Megkötések a táblához `hal_hullo_termek`
--
ALTER TABLE `hal_hullo_termek`
  ADD CONSTRAINT `hal_hullo_termek_ibfk_1` FOREIGN KEY (`kepek_id`) REFERENCES `kepek` (`kepek_id`);

--
-- Megkötések a táblához `hullő_termek`
--
ALTER TABLE `hullő_termek`
  ADD CONSTRAINT `hullő_termek_ibfk_1` FOREIGN KEY (`kepek_id`) REFERENCES `kepek` (`kepek_id`);

--
-- Megkötések a táblához `kisemlos_termek`
--
ALTER TABLE `kisemlos_termek`
  ADD CONSTRAINT `kisemlos_termek_ibfk_1` FOREIGN KEY (`kepek_id`) REFERENCES `kepek` (`kepek_id`);

--
-- Megkötések a táblához `kosar`
--
ALTER TABLE `kosar`
  ADD CONSTRAINT `kosar_ibfk_1` FOREIGN KEY (`felhasznalo_id`) REFERENCES `felhasznalo` (`felhasznalo_id`);

--
-- Megkötések a táblához `kosar_termek`
--
ALTER TABLE `kosar_termek`
  ADD CONSTRAINT `kosar_termek_ibfk_1` FOREIGN KEY (`kosar_id`) REFERENCES `kosar` (`kosar_id`),
  ADD CONSTRAINT `kosar_termek_ibfk_2` FOREIGN KEY (`termek_id`) REFERENCES `termekek` (`termek_id`);

--
-- Megkötések a táblához `kutya_termek`
--
ALTER TABLE `kutya_termek`
  ADD CONSTRAINT `kutya_termek_ibfk_1` FOREIGN KEY (`kepek_id`) REFERENCES `kepek` (`kepek_id`);

--
-- Megkötések a táblához `macska_termek`
--
ALTER TABLE `macska_termek`
  ADD CONSTRAINT `macska_termek_ibfk_1` FOREIGN KEY (`kepek_id`) REFERENCES `kepek` (`kepek_id`);

--
-- Megkötések a táblához `madar_termek`
--
ALTER TABLE `madar_termek`
  ADD CONSTRAINT `madar_termek_ibfk_1` FOREIGN KEY (`kepek_id`) REFERENCES `kepek` (`kepek_id`);

--
-- Megkötések a táblához `megrendeles`
--
ALTER TABLE `megrendeles`
  ADD CONSTRAINT `megrendeles_ibfk_1` FOREIGN KEY (`megrendelő_id`) REFERENCES `megrendelő` (`megrendelő_id`),
  ADD CONSTRAINT `megrendeles_ibfk_2` FOREIGN KEY (`megrendeles_id`) REFERENCES `kosar` (`megrendeles_id`);
COMMIT;


CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `author` varchar(255) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

ALTER TABLE messages ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;


CREATE TABLE `replies` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `author` varchar(255) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `replies`
--
ALTER TABLE `replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `replies`
--
ALTER TABLE `replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `replies`
--
ALTER TABLE `replies`
  ADD CONSTRAINT `replies_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `messages` (`id`);
COMMIT;




/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
