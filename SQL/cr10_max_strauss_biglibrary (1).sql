-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 18. Jul 2020 um 16:50
-- Server-Version: 10.4.13-MariaDB
-- PHP-Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr10_max_strauss_biglibrary`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `author`
--

CREATE TABLE `author` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `author`
--

INSERT INTO `author` (`id`, `first_name`, `last_name`) VALUES
(1, 'Test', 'Author'),
(2, 'Test', 'Author2'),
(3, 'Test', 'Author3'),
(4, 'Test', 'Author');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `ISBN_code` varchar(13) NOT NULL,
  `type` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `fk_author` int(11) NOT NULL,
  `author` varchar(255) NOT NULL,
  `publisher` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `publish_date` date DEFAULT NULL,
  `description` varchar(9999) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `books`
--

INSERT INTO `books` (`id`, `status`, `ISBN_code`, `type`, `title`, `fk_author`, `author`, `publisher`, `image`, `publish_date`, `description`, `email`, `created_at`) VALUES
(1, 'Reserved', '3944676262', 'Book', 'Der Behüter', 1, 'Catherine Shepherd', 'Kafel Verlag', 'https://m.media-amazon.com/images/I/51TuGBvBF9L.jpg', '2020-06-25', 'Catherine Shepherds neuer Thriller macht Sie mit der perfiden Gefühlswelt eines Serienkillers bekannt. Eines Killers, der eigentlich nur nach Liebe sucht.', 'john.doe@testmail.com', '2020-07-17 10:11:40'),
(2, 'Available', '978345343968', 'Book', 'Achtsam morden', 2, 'Karsten Dusse', 'Heyne Verlag', 'https://m.media-amazon.com/images/I/41HS-9lYXZL.jpg', '2020-07-17', 'Björn Diemel wird von seiner Frau gezwungen, ein Achtsamkeits-Seminar zu besuchen, um seine Ehe ins Reine zu bringen, sich als guter Vater zu beweisen und die etwas aus den Fugen geratene Work-Life-Balance wieder herzustellen.', 'max.mustermann@gmail.com', '2020-07-17 10:12:04'),
(3, 'Available', '0978342652199', 'Book', 'Madame le Commissaire und die Frau ohne Gedächtnis', 3, 'Pierre Martin', 'Knaur eBook', 'https://images-na.ssl-images-amazon.com/images/I/51sKEJwvm6L._SX327_BO1,204,203,200_.jpg', '2020-07-01', 'Im beschaulichen Fragolin in der Provence kehrt nach dem dramatischen Tod von Bürgermeister Thierry langsam wieder der Alltag ein. Für »Madame le Commissaire« Isabelle Bonnet gibt es nichts zu tun, also dreht sie ihre morgendlichen Joggingrunden durch die', 'fritz.fritz@fritzmail.fz', '2020-07-17 12:52:56'),
(4, 'Available', '123456789', 'Blu-ray', 'Joker', 4, 'Todd Phillips', 'Knaur eBook', 'https://images-na.ssl-images-amazon.com/images/I/81jfFUPE-eL._SX342_.jpg', '2020-03-12', 'Joker“ hat den ikonischen Erzfeind zum Thema und ist eine originale, eigenständige Story, die noch nie auf der Kinoleinwand gezeigt wurde. Phillips’ Studie über Arthur Fleck (Phoenix), einen von der Gesellschaft missachteten Mann, ist nicht nur eine düste', 'abc.cba@abc.cda', '2020-07-17 14:08:53'),
(29, 'Available', '3423422', 'Blu-ray', 'Sonic the Hedgehog', 6, 'Jeff Fowler', 'Paramount Pictures (Universal Pictures)', 'https://images-na.ssl-images-amazon.com/images/I/91hCkjcgnuL._SX385_.jpg', '2020-06-09', 'Sonic (gesprochen von Julien Bam) ist mit seinen 15 Jahren ein pubertierendes Powerpaket, ohne sich dessen selbst schon wirklich bewusst zu sein. Zu seiner eigenen Sicherheit soll er sich auf dem Planeten Erde verstecken. Allerdings gibt es hierfür eine B', '123@333.at', '2020-07-18 14:19:17'),
(30, 'Aviable', 'B084WV8WMP', 'CD', 'After Hours', 6, 'The Weeknd', 'Republic Records', 'https://m.media-amazon.com/images/I/81XiZxda-8L._SS500_.jpg', '2020-07-08', 'The full After Hours tracklist is as follows:\r\n\r\n‘Alone Again’\r\n‘Too Late’\r\n‘Hardest To Love’\r\n‘Scared To Live’\r\n‘Snowchild’\r\n‘Escape From L.A.’\r\n‘Heartless’\r\n‘Faith’\r\n‘Blinding Lights’\r\n‘In Your Eyes’\r\n‘Save Your Tears’\r\n‘Repeat After Me (Interlude)’\r\n‘After Hours’\r\n‘Until I Bleed Out’', 'ggat5@gta.de', '2020-07-18 14:27:49'),
(32, 'Reserved', '312543232', 'DVD', 'Prison Break: The Complete Series', 7, 'Paul Scheuring', 'FOX TV', 'https://images-na.ssl-images-amazon.com/images/I/91w6VikkltL._SX342_.jpg', '2017-07-03', 'Prison Break was a serialized show that aired originally from 2005-2009, then was revived in 2017 for a nine-episode limited-run event series. The story started with a man named Michael Scofield (played by Wentworth Miller) getting himself thrown into the prison where his brother Lincoln Burrows (played by Dominic Purcell) was on death row, due to be executed in thirty-days for a murder he was framed for. The entire first season (which was the best, in my opinion) was all about the break-out, and the subsequent seasons were about the group of prisoners on the run and trying to take down those responsible for setting Lincoln up.', 'jane.goe@gmail.com', '2020-07-18 14:35:03'),
(33, 'Reserved', '4543435', 'Blu-ray', 'Narcos: Season 1', 8, ' Carlo Bernard', 'Lionsgate', 'https://images-na.ssl-images-amazon.com/images/I/61cnquDLOML._SX385_.jpg', '2020-06-17', 'Narcos is an American crime drama television series created and produced by Chris Brancato, Carlo Bernard, and Doug Miro. Set and filmed in Colombia, seasons 1 and 2 are based on the story of drug kingpin Pablo Escobar, who became a billionaire ...', 'idk@idk.dk', '2020-07-18 14:39:28'),
(34, 'Aviable', 'B071ZS56Z4', 'DVD', 'La casa de papel', 10, 'Álex Pina', 'Netflix', 'https://images-na.ssl-images-amazon.com/images/I/81STwti5DZL._SY445_.jpg', '2020-02-12', 'Money Heist (Spanish: La casa de papel, \"The House of Paper\") is a Spanish heist crime drama television series created by Álex Pina. The series traces two long-prepared heists led by the Professor (Álvaro Morte), one on the Royal Mint of Spain, and one on the Bank of Spain. ', 'hans.maier@gmx.at', '2020-07-18 14:45:19'),
(35, 'Reserved', '2432423412', 'Blu-ray', 'Bad Boys for Life', 5, 'Adil El Arbi', 'Sony Pictures Entertainment Deutschland GmbH', 'https://images-na.ssl-images-amazon.com/images/I/81EeAzvL%2BAL._SX342_.jpg', '2020-05-28', 'Draufgänger Mike Lowrey (Will Smith) und sein Partner Marcus Burnett (Martin Lawrence) stehen immer noch im Dienst der Polizei und treiben Captain Howard nach wie vor zur Weißglut. Während Einzelgänger Mike immer noch mit seinem Job verheiratet ist, wird ', 'test@testmail.com', '2020-07-18 14:16:54');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `publisher`
--

CREATE TABLE `publisher` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `publisher`
--

INSERT INTO `publisher` (`id`, `first_name`, `last_name`) VALUES
(1, 'Test', 'Author'),
(2, 'Test', 'Author2'),
(3, 'Test', 'Author3'),
(4, 'Test', 'Author');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `author`
--
ALTER TABLE `author`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT für Tabelle `publisher`
--
ALTER TABLE `publisher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
