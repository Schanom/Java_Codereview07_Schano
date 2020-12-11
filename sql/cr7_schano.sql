-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 11. Dez 2020 um 16:09
-- Server-Version: 10.4.11-MariaDB
-- PHP-Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr7_schano`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `classes`
--

CREATE TABLE `classes` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `classes`
--

INSERT INTO `classes` (`id`, `name`) VALUES
(1, 'Java'),
(2, 'PhP'),
(3, 'Python'),
(4, 'Javascript'),
(5, 'C#');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `enrollment`
--

CREATE TABLE `enrollment` (
  `id` int(11) NOT NULL,
  `fk_student_id` int(11) NOT NULL,
  `fk_class_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `enrollment`
--

INSERT INTO `enrollment` (`id`, `fk_student_id`, `fk_class_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 3),
(5, 3, 2),
(6, 3, 1),
(7, 4, 2),
(8, 5, 2),
(9, 6, 2),
(10, 5, 2),
(11, 6, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `students`
--

INSERT INTO `students` (`id`, `name`, `surname`, `email`) VALUES
(1, 'Adam', 'Antler', 'adam@gmail.com'),
(2, 'Britney', 'Barn', 'britney@gmail.com'),
(3, 'Cloe', 'Cinder', 'cloe@gmail.com'),
(4, 'Dennis', 'Daniels', 'dennis@gmail.com'),
(5, 'Efren', 'Entha', 'efren@gmail.com'),
(6, 'Frederik', 'Firnwald', 'fred@gmail.com'),
(7, 'Gustav', 'Gans', 'gustav@gmail.com'),
(8, 'Horst', 'Heimlich', 'horst@gmail.com'),
(9, 'Iris', 'Isengard', 'iris@gmail.com'),
(10, 'Jona', 'Jam', 'jona@gmail.com');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `teachers`
--

CREATE TABLE `teachers` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `teachers`
--

INSERT INTO `teachers` (`id`, `name`, `surname`, `email`) VALUES
(1, 'Albert', 'Einstein', 'albi@gmail.com'),
(2, 'Robert', 'Oppenheimer', 'robby@gmail.com'),
(3, 'Richard', 'Feinman', 'richy@gmail.com'),
(4, 'Charles', 'Darwin', 'charlie@gmail.com'),
(5, 'Werner', 'Heisenberg', 'werner@gmail.com');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `teachersclassesrelation`
--

CREATE TABLE `teachersclassesrelation` (
  `id` int(11) NOT NULL,
  `fk_teacher_id` int(11) NOT NULL,
  `fk_class_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `teachersclassesrelation`
--

INSERT INTO `teachersclassesrelation` (`id`, `fk_teacher_id`, `fk_class_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 3, 5);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `enrollment`
--
ALTER TABLE `enrollment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_student_id` (`fk_student_id`),
  ADD KEY `fk_class_id` (`fk_class_id`);

--
-- Indizes für die Tabelle `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `teachersclassesrelation`
--
ALTER TABLE `teachersclassesrelation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_teacher_id` (`fk_teacher_id`),
  ADD KEY `fk_class_id` (`fk_class_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `enrollment`
--
ALTER TABLE `enrollment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT für Tabelle `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `teachersclassesrelation`
--
ALTER TABLE `teachersclassesrelation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `enrollment`
--
ALTER TABLE `enrollment`
  ADD CONSTRAINT `enrollment_ibfk_1` FOREIGN KEY (`fk_student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `enrollment_ibfk_2` FOREIGN KEY (`fk_class_id`) REFERENCES `classes` (`id`);

--
-- Constraints der Tabelle `teachersclassesrelation`
--
ALTER TABLE `teachersclassesrelation`
  ADD CONSTRAINT `teachersclassesrelation_ibfk_1` FOREIGN KEY (`fk_teacher_id`) REFERENCES `teachers` (`id`),
  ADD CONSTRAINT `teachersclassesrelation_ibfk_2` FOREIGN KEY (`fk_class_id`) REFERENCES `classes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
