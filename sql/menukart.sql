-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 23. Mrz 2021 um 17:24
-- Server-Version: 10.4.17-MariaDB
-- PHP-Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `menukart`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bestellung`
--

CREATE TABLE `bestellung` (
  `id` int(11) NOT NULL,
  `tisch` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bnummer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preis` double DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `bestellung`
--

INSERT INTO `bestellung` (`id`, `tisch`, `bnummer`, `name`, `preis`, `status`) VALUES
(1, 'tisch1', '12', 'brot', 4, 'fertig'),
(2, 'tisch1', '16', 'eis schocko', 14, 'fertig'),
(3, 'tisch1', '15', 'coca cola', 6, 'offen'),
(4, 'tisch1', '24', 'Pommes', 23, 'offen'),
(7, 'tisch1', '11', 'burger', 12, 'offen');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `gericht`
--

CREATE TABLE `gericht` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `beschreibung` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preis` double DEFAULT NULL,
  `bild` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kategorie_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `gericht`
--

INSERT INTO `gericht` (`id`, `name`, `beschreibung`, `preis`, `bild`, `kategorie_id`) VALUES
(11, 'burger', 'burgerrr', 12, 'a38611acb51b258be538fe788a6b7f9a.jpg', 3),
(12, 'brot', 'frisches Brot', 4, '175d70d6b6fdcd01dab07f5ad24e78fe.jpg', 2),
(13, 'Aufschnitt', 'Aufschnitt', 23, '2c06eb02e593b3ef3959a07c9870d473.jpg', 2),
(14, 'Aufschnitt brot', 'frisches Brot mit Aufschnitt', 12, '1d5897ea1d5fe5d0f17ed6574316e795.jpg', 2),
(15, 'coca cola', 'kühl frisches cola', 6, '6f5fdd2b0158e4ab065646f649d1ad37.jpg', 1),
(16, 'eis schocko', 'schocko creme im glas', 14, '716e7e83d56ca0c310d4a130f550f6d0.jpg', 4),
(17, 'eiscreme', 'erdbeere creme im glas', 10.9, '1cb860f2779abb429dddd2ac1c0da653.jpg', 4),
(18, 'erdbeeren eis', 'erdbeere creme im glas', 7.5, '56f432e6ea89b345b5db3dd2feb6a407.jpg', 4),
(19, 'filet', 'früsches filet', 50.9, 'c786f33402584bba0aa63c350bf99d5f.jpg', 3),
(20, 'Früchte Teller', 'Früchte Teller von der Sasion', 17, 'f49c0b5d512adb42dcb4bc6a6b6040ff.jpg', 4),
(21, 'Kaffe', 'heisser kaffe', 3, 'b3bb4507bbd89bfea43dbfea95264705.jpg', 1),
(22, 'Lasagne', 'Italienische Lasagne', 30.5, 'ea91b01d4b7af9c88cd484688fdba319.jpg', 3),
(23, 'Pizzza', 'Italienische Pizza', 34.6, '92c6b8c0637036fb06f7c837838d7d36.jpg', 3),
(24, 'Pommes', 'pommes frites', 23, '62dc9619bb3edcc197fd6d19a095564a.jpg', 2),
(25, 'Pudding', 'Pudding mit Früchte', 12.5, '93dda95fefb8b549f9fa4c6f41893182.jpg', 4),
(26, 'Salat', 'Salat frisch und knackig', 5.5, 'fd2988ec33adbca1f6a98cc0c4e7fe98.jpg', 2),
(27, 'Kürbis suppe', 'Kürbis creme Suppe', 11.9, '431d05ab4bb54b1093bd39d4b421dd94.jpg', 2),
(28, 'Sushi', 'Japanische sushi', 20.5, 'fa530424b05e1e5ea143728e4df10eb7.jpg', 2),
(29, 'tiramisu', 'Kaffe Tiramisu', 24.5, '5f238e2f643c36f21e8d04b3671a55d8.jpg', 4),
(30, 'Gemüse Teller', 'Gemischter Gemüse Teller', 21.4, '31e4b75262d6e0ce20873ae8cf120552.jpg', 2),
(31, 'Gemüse Teller', 'Gemischter Gemüse Teller', 30.4, '7923fc4400b377413059fadd44a4b4cf.jpg', 2),
(32, 'Wasser', 'Glas Wasser', 2, '700a865554027546614e92bab7808a64.jpg', 1),
(33, 'Weiss Wein', 'Glas Weiss Wein', 24.9, '0cf7e33996c023d7b6ee5e8675f8d013.jpg', 1),
(35, 'Bier', 'Hopfig kühl frisch', 15.5, 'a83d8d42509461b7a44182cac99376dd.jpg', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kategorie`
--

CREATE TABLE `kategorie` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `kategorie`
--

INSERT INTO `kategorie` (`id`, `name`) VALUES
(1, 'Getränk'),
(2, 'Vorspeise'),
(3, 'Hauptspeise'),
(4, 'Nachspeise');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`roles`)),
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`id`, `username`, `roles`, `password`) VALUES
(1, 'janick', '[]', '$argon2id$v=19$m=65536,t=4,p=1$WHRqZnJ0WEs3OE12VG5VZg$F4JKWRHcsenQ4PvjoktSP0xfPVBj/quUD9iL4EGZSKY');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `bestellung`
--
ALTER TABLE `bestellung`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indizes für die Tabelle `gericht`
--
ALTER TABLE `gericht`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_FEA51929BAF991D3` (`kategorie_id`);

--
-- Indizes für die Tabelle `kategorie`
--
ALTER TABLE `kategorie`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649F85E0677` (`username`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `bestellung`
--
ALTER TABLE `bestellung`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `gericht`
--
ALTER TABLE `gericht`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT für Tabelle `kategorie`
--
ALTER TABLE `kategorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `gericht`
--
ALTER TABLE `gericht`
  ADD CONSTRAINT `FK_FEA51929BAF991D3` FOREIGN KEY (`kategorie_id`) REFERENCES `kategorie` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
