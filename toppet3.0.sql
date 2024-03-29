﻿

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
(7, 'Akvárium dekoráció', 2000, 'Színes műanyag díszek akváriumokhoz, hogy otthonosabbá tegye halai számára az otthont.', 40),
(8, 'Teknős hőlámpa', 3000, 'Infravörös hőlámpa teknősök számára, amely biztosítja a megfelelő hőmérsékletet és megvilágítást a terráriumban.', 41),
(9, 'Hal akváriumszűrő', 4000, 'Hatékony és csendes akváriumszűrő, amely tiszta és egészséges környezetet biztosít a halaknak.', 42),
(4, 'Hal élettér dísz', 2500, 'Természetes megjelenésű műanyag dísz hal akváriumokhoz, amelyek élénkítik a víz alatti környezetet.', 43),
(5, 'Hal élelem', 1500, 'Magas minőségű halélelem, amely biztosítja a halak egészséges táplálkozását és fejlődését.', 44),
(6, 'Hal akváriumszűrő pumpa', 3500, 'Erős és hatékony szűrő pumpa akváriumokhoz, amely tiszta és oxigénben gazdag környezetet biztosít a halaknak.', 45),
(1, 'Hal akváriumdekor', 2000, 'Színes és élethű akváriumdekoráció, amely érdekesebbé teszi a halak élőhelyét és segíti őket a rejtekhelyek megtalálásában.', 46),
(2, 'Hal élettér fenék dísz', 1200, 'Természetes megjelenésű műanyag dísz akváriumokhoz, amely díszíti a halak életterét és segíti azokat a természetes viselkedésükben.', 47),
(3, 'Hal élelmiszertabletta', 1800, 'Tápláló és egészséges élelmiszertabletta halaknak, amely egyszerűvé teszi a táplálkozást és a táplálékadagolást.', 48),
(10, 'Hal akvárium hőmérő', 700, 'Precíz és könnyen olvasható hőmérő akváriumokhoz, amely segít a megfelelő hőmérséklet fenntartásában a halak számára.', 49),
(11, 'Hal akvárium növény', 900, 'Élethű és könnyen gondozható műanyag akváriumnövény, amely díszíti a halak élőhelyét és oxigént termel.', 50),
(12, 'Hüllő hőmérő', 1500, 'Precíz és könnyen olvasható hőmérő hüllők terráriumához, amely segít a megfelelő hőmérséklet fenntartásában.', 51),
(20, 'Hüllő táplálótál', 800, 'Könnyen tisztítható és tartós műanyag táplálótál hüllők számára, amely segíti a rendszeres és tiszta táplálkozást.', 52),
(13, 'Hüllő csontváz dísz', 2000, 'Valósághű és különleges csontváz dísz hüllő terráriumokhoz, amelyek érdekesebbé teszik a terrárium belső kialakítását.', 53),
(14, 'Hüllő napfénylámpa', 2500, 'UVB-sugárzó napfénylámpa hüllők terráriumához, amely segíti azokat a D-vitamin termelésében és az anyagcserében.', 54),
(15, 'Hüllő hidegoldó', 1200, 'Elektromos hidegoldó hüllők terráriumához, amely segít megakadályozni a túlzott hőmérsékletet a terráriumban.', 55),
(16, 'Hüllő szőnyeg', 600, 'Természetes hatású és könnyen tisztítható szőnyeg hüllők terráriumához, amely segíti a hüllők mozgását és kényelmét.', 56),
(17, 'Hüllő terrárium dísz', 1800, 'Természetes megjelenésű műanyag dísz hüllő terráriumokhoz, hogy valósághűbbé tegye a környezetüket.', 57),
(18, 'Hüllő lámpa állvány', 2000, 'Állítható hő- és fényforrás tartó állvány hüllők terráriumához, hogy megfelelő környezetet biztosítson számukra.', 58),
(19, 'Hüllő terrárium növény', 1200, 'Természetes megjelenésű műanyag növény hüllő terráriumokhoz, hogy otthonosabbá tegye a hüllők élőhelyét.', 59);

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
(1, 'Kisemlős futókerék', 1500, 'Kényelmes és biztonságos futókerék kisemlősök számára, amely segít fenntartani az egészségüket és formájukat.', 30),
(2, 'Kisemlős takaróház', 1800, 'Puha és meleg takaróház kisemlősök számára, amely biztosítja a kényelmet és biztonságot.', 31),
(3, 'Kisemlős játék guruló labda', 800, 'Színes és mozgó játék labda kisemlősök számára, amely stimulálja a mozgást és az érzékeket.', 32),
(4, 'Kisemlős alom', 1000, 'Szagtalan és pormentes kisemlős alom, amely biztosítja a higiéniás környezetet és a kényelmet.', 33),
(5, 'Kisemlős fésű', 700, 'Puha sörtéjű fésű kisemlősök szőrzetének ápolásához és tisztításához.', 34),
(6, 'Kisemlős hám', 1500, 'Kényelmes és állítható kisemlős hám, amely segíti a séták során történő irányítást és biztonságos vezetést.', 35),
(7, 'Kisemlős futólabda', 1300, 'Állítható és biztonságos futólabda kisemlősöknek, amely stimulálja a mozgást és a szórakozást.', 36),
(8, 'Kisemlős labirintus játék', 1500, 'Színes és interaktív labirintus játék kisemlősöknek, amely fejleszti az intelligenciát és a készségeket.', 37),
(9, 'Kisemlős játszótér', 2500, 'Színes és változatos játszótér kisemlősöknek, amely segíti a mozgást és a szórakozást.', 38);


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
(56, 'Kutya hálózsák', 4000, 'Kényelmes és puha hálózsák kutyáknak, ideális alváshoz és pihenéshez otthon vagy kirándulások során.',4),
(57, 'Kutya biztonsági öv', 3000, 'Biztonsági öv kutyáknak az autóban, amely biztosítja a kutyád biztonságát és a vezetés zavartalan menetét.', 5),
(58, 'Kutya öltöztető ruha', 2500, 'Divatos és kényelmes öltöztető ruha kutyáknak hideg időkre, amely megvédi őket a hidegtől és stílusos megjelenést biztosít.', 6),
(59, 'Kutya hűsítő matrac', 3500, 'Hűsítő és légáteresztő matrac kutyáknak, amely segít megelőzni a túlmelegedést és biztosítja a kényelmet.', 7),
(60, 'Kutya masszázseszköz', 2000, 'Kényelmes és hatékony masszázseszköz kutyáknak, amely segít lazítani az izmokat és javítja a vérkeringést.', 8),
(61, 'Kutya kutyakabát', 3000, 'Vízálló és meleg kutyakabát hideg időkre, amely védi a kutyádat a nedvességtől és a hidegtől.', 9);

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
(1, 'Macska cicakaparó', 2500, 'Tartós és strapabíró cicakaparó macskáknak, amely segít megelőzni a karmolászást a bútorokon és a falakon.', 10),
(2, 'Macska alomtisztító lapát', 1000, 'Kényelmes és praktikus alomtisztító lapát macskákhoz, amely segíti a gyors és hatékony alomtisztítást.', 11),
(3, 'Macska játékszer labirintus', 1800, 'Interaktív és szórakoztató labirintus játékszer macskáknak, amely fejleszti az intelligenciát és a készségeket.', 12),
(4, 'Macska hordozható WC', 2800, 'Praktikus és könnyen hordozható WC macskáknak utazáshoz vagy kis lakásokba.', 13),
(5, 'Macska játékszer madárfog', 600, 'Színes és mozgó játékszer macskáknak, amely segíti a vadászösztönt és a szórakozást.', 14),
(6, 'Macska cső', 1800, 'Szórakoztató és szöszmözölő cső macskáknak, amely segíti a mozgást és a játékot.', 15),
(7, 'Macska hintaág', 3500, 'Szórakoztató és kényelmes hintaág macskáknak, amely segít az aktív játékban és pihenésben egyaránt.', 16),
(8, 'Macska alomtálca', 3000, 'Szagsemlegesítő fedővel ellátott macska alomtálca, amely kényelmes és higiénikus környezetet biztosít a macskák számára.', 17),
(9, 'Macska játékszer egér', 500, 'Puha és mozgó játék egér macskáknak, amely stimulálja a vadászösztönt és a játékot.', 18);

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
(201, 'Madár fajáték', 800, 'Interaktív és szórakoztató fa játék madaraknak, amely fejleszti a koordinációt és a játékot.', 20),
(202, 'Madár fésű', 500, 'Kényelmes és puha fésű madaraknak, amely segíti a tollak ápolását és a kényelmes érzést.', 21),
(203, 'Madár hintáztató', 1000, 'Biztonságos és szórakoztató hintáztató madaraknak, amely stimulálja a mozgást és a játékot.', 22),
(204, 'Madár rágó játék', 700, 'Biztonságos és szórakoztató rágó játék madaraknak, amely segíti a csőrük egészséges fenntartását és a játékot.', 23),
(205, 'Madár fürdőkád', 1600, 'Könnyen felszerelhető és tisztítható fürdőkád madaraknak, amely segíti a higiéniát és a tollak ápolását.', 24),
(206, 'Madár függő izé', 1200, 'Interaktív és unaloműző segítő játék madaraknak, amely fejleszti az érzékeket és az intelligenciát.', 25),
(207, 'Madár etetőtál', 800, 'Könnyen tisztítható és tartós madár etetőtál, amely lehetővé teszi, hogy kedvenc madaraid kényelmesen táplálkozhassanak.', 26),
(208, 'Madár hinta', 1000, 'Színes és szórakoztató madár hinta, amely lehetővé teszi a madarak számára a szabad repülés érzését a ketrecben.', 27),
(209, 'Madár etetőállvány', 1200, 'Könnyen felállítható és tisztítható madár etetőállvány, amely lehetővé teszi a madarak kényelmes táplálkozását.', 28);



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

CREATE TABLE `kedvezmenyes_termekek` (
  `id` int(11) NOT NULL,
  `nev` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `erar` int(11) NOT NULL,
  `kedvar` int(11) NOT NULL,
  `leiras` text COLLATE utf8_hungarian_ci DEFAULT NULL,
  `kepek_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

INSERT INTO `kedvezmenyes_termekek` (`id`, `nev`, `erar`,`kedvar`, `leiras`, `kepek_id`) VALUES
(1, 'Madár játszófa', 3000, 2699, 'Színes és interaktív madár játszófa, amely segíti a madarak szellemi és fizikai fejlődését.', 29),
(2, 'Macska karmolófa', 5000, 4599, 'Magas minőségű karmolófa macskáknak, amely megvédi a bútorokat és lehetővé teszi a macska számára a karmolászást.', 19),
(3, 'Kisemlős játszóház', 2000, 1499, 'Színes és strapabíró játszóház kisemlősöknek, amely kényelmes pihenőhelyet és szórakozást biztosít.', 39);


CREATE TABLE `kepek_id` (
    `kep_id` INT PRIMARY KEY,
    `url` VARCHAR(255)
);

INSERT INTO `kepek_id` (`kep_id`, `url`) VALUES
(1, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrDHbRQhuDPA70CzxjPOA7s604J-qwyxFn5g&usqp=CAU'),
(2, 'https://cdn.babamamaoutlet.hu/wp-content/uploads/2016/03/20160321_104123.jpg'),
(3, 'https://www.zooplus.hu/magazin/wp-content/uploads/2018/10/Melyik-a-legjobb-p%C3%B3r%C3%A1z-a-kuty%C3%A1mnak.jpg'),
(4, 'https://whyld-river.com/cdn/shop/products/3-in-bag_800x.jpg?v=1628454828'),
(5, 'https://audishop.hu/wp-content/uploads/2018/05/8X0019409A.jpg'),
(6, 'https://cdn.myshoptet.com/usr/www.heliumking.hu/user/shop/big/17004_kostym-pre-psov-nevesta--meret-kutya-l-.jpg?624e2d57'),
(7, 'https://i.pepita.hu/images/product/1039480/zolta-xl-premium-kisallat-husito-matrac-70x120cm_33172526_1200x630.jpg'),
(8, 'https://fittsport.com/image/503928759.jpg'),
(9, 'https://kutyaruhazat.hu/uploads/import/_cukipro1.jpg'),
(10, 'https://vitalpet.hu/img/4951/TRX-43262/500x500/TRX-43262.jpg'),
(11, 'https://kutyubazar.hu/47020-large_default/11521-magikus-macskaalom-lapat.html.jpg'),
(12, 'https://www.mall.hu/i/84754186/550/550'),
(13, 'https://catmania.hu/wp-content/uploads/2020/03/nyitott-macska-wc.jpg'),
(14, 'https://www.pet4you.hu/img/big/1205.jpg'),
(15, 'https://otthon24.hu/wp-content/uploads/2015/11/cica-kozlekedes2.jpg'),
(16, 'https://catmania.hu/wp-content/uploads/2020/04/macska-fuggoagy.jpg'),
(17, 'https://hernacana.cdn.shoprenter.hu/custom/hernacana/image/cache/w800h424/Blog/alomtalca/macska-alomtalca.jpg?lastmod=0.1667915883.jpg'),
(18, 'https://kovazoo.cdn.shoprenter.hu/custom/kovazoo/image/cache/w900h500wt1/trixie/tri/hu_40344.jpg?lastmod=1704904673.1482236000.jpg'),
(19, 'https://i.pepita.hu/images/product/760643/xxl-5-szintes-macska-kaparofa-jatszohaz-szurke_83950783_1200x630.jpg'),
(20, 'https://cdn.myshoptet.com/usr/www.parrotclub.hu/user/shop/big/2919_kalitkos-jatek-madaraknak-hinta-43x32cm.png?6384b94e'),
(21, 'https://www.alpet.hu/wp-content/uploads/2019/02/fesusszellozo.jpg'),
(22, 'https://dafincsi.hu/wp-content/uploads/2019/10/Duvo-sz%C3%ADnes-mad%C3%A1rhinta.jpg'),
(23, 'https://cdn.myshoptet.com/usr/www.parrotclub.hu/user/shop/big/3252_jatek-papagajoknak-es-madaraknak-fa-ragoka-1eks.png?6384b973'),
(24, 'https://cdn.pixabay.com/photo/2022/09/03/07/42/dove-7428958_960_720.jpg'),
(25, 'https://i.pepita.hu/images/product/5224244/duvo-szines-fuggo-jatek-rafiabol-bambuszbol-es-kokuszbol-egzotikus-madaraknak-s-241x64x64cm_56344126_1200x630.jpg'),
(26, 'https://www.nadland.hu/media/product/331/fuggo-madar-eteto-itato-fem-f01.jpg'),
(27, 'https://i.pepita.hu/images/product/7013483/trixie-hinta-45-30cm-madaraknak-termeszetes-anyagbol-58746_64309327_1200x630.jpg'),
(28, 'https://ablakhaz.hu/wp-content/uploads/2024/01/februari-kert-madareteto.jpg'),
(29, 'https://i.pepita.hu/images/product/7013476/trixie-jatek-madaraknak-natur-31-cm-58993_64309284_1200x630.jpg'),
(30, 'https://glirex.hu/image/cache/catalog/uj/muanyagjkerke/muakerfix0014-1227x817.jpg'),
(31, 'https://webshop.fressnapf.hu/wp-content/uploads/2021/07/1333941-416x175.jpg'),
(32, 'https://iskolaellato.hu/img/80027/PB-1133/PB-1133.webp'),
(33, 'https://glirex.hu/image/cache/catalog/uj/uj%20n%C3%B6v%C3%A9nyek/ygapfoaslfix1-1223x810.jpg'),
(34, 'https://webshop.fressnapf.hu/wp-content/uploads/2020/04/1296528.png'),
(35, 'https://vitalpet.hu/img/4951/TRX-61513_altpic_1/TRX-61513.jpg?time=1644225317'),
(36, 'https://www.fressnapf.hu/wp-content/uploads/2018/05/shutterstock_1023727873.jpg'),
(37, 'https://i.ytimg.com/vi/f9MKWvwGSo4/maxresdefault.jpg'),
(38, 'https://dafincsi.hu/wp-content/uploads/2023/12/Kiki-jatszoter.jpg'),
(39, 'https://webshop.fressnapf.hu/wp-content/uploads/2020/04/1242820-416x249.png'),
(40, 'https://i.pepita.hu/images/product/5223765/zolux-bambusz-haziko-akvarium-dekoracio-11x75x95cm_56343526_1200x630.jpg'),
(41, 'https://www.terrariumkeszites.hu/images/vilagitas.png'),
(42, 'https://i.pepita.hu/images/product/571507/hailea-hl-bt1000-akvariumi-belso-szuro-1000-lh-20-w-90-360-l_31458250_1200x630.jpg'),
(43, 'https://s8.badu.bg/photos/551645/800x538_63c6b68274cfa.jpg'),
(44, 'https://591c6ebc5b.cbaul-cdnwnd.com/779efac90fb8531f5e9e336310cde4b5/200000074-352983529a/s-l1600.jpg?ph=591c6ebc5b'),
(45, 'https://i.pepita.hu/images/product/6742963/akvarium-szuropumpa-aktiv-szennel-600l-ora_80311455_1200x630.jpg'),
(46, 'https://i.pepita.hu/images/product/570520/mufa-akvarium-dekor-550-x-180-x-325-mm_31457263_1200x630.jpg'),
(47, 'https://i.pepita.hu/images/product/570586/happet-kincseslada-levegoporlasztos-akvarium-dekoracio_31457329_1200x630.jpg'),
(48, 'https://ik.imagekit.io/ellns2dxik/img/product/summernote/vegan-100-spirulina-adalekanyagmentes-mikroalga-120-tabletta-natur-tanya-3def184ad8f4755ff269862ea77393dd.jpg'),
(49, 'https://kutyubazar.hu/65528-large_default/19677-digitalis-akvarium-homero.html.jpg'),
(50, 'https://blog.tetra.net/hu-hu/wp-content/uploads/2019/05/nepszeru-akvariumi-novenyek.jpg'),
(51, 'https://www.mobilehome.hu/img/58534/2371540/500x500/2371540.webp?time=1700147417.jpg'),
(52, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0s-xo1UtYQH3NxONi89v2KZR-BuAUUt1yQg&usqp=CAU'),
(53, 'https://images.prom.ua/3091113153_w640_h640_svetodiodnyj-akvariumnyj-svetilnik.jpg'),
(54, 'https://tmreptiles.eu/image/cache/catalog/termekek/terrarium-felszerelesek/ho-es-paratartalom-merok-termosztatok/trixie-thermostat-hygrostat-1200x900.jpg'),
(55, 'https://cdn.rtl.hu/c3/8a/louisiana-aligator-kutyaajto_image_e7f12c73ad1025a56666d1125399'),
(56, 'https://www.terrariumkeszites.hu/pluginAppObj/pluginAppObj_16_22/Hatter-17_fw.jpg'),
(57, 'https://www.terrariumkeszites.eu/images/Lampa-uj-tipusu-5_sh1bkru2.png'),
(58, 'https://kertlap.hu/wp-content/uploads/terrarium-ajandekozas.jpg'),
(59, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWuIO5FOvaSWiTI7CcwX1_z2MKH8QQX0sDFw&usqp=CAU');



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
