-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Set 07, 2024 alle 17:36
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `noleggiosci`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `caschi`
--

CREATE TABLE `caschi` (
  `id` int(2) NOT NULL,
  `Prezzo` double DEFAULT NULL,
  `Taglia` enum('M','L','XL','') DEFAULT NULL,
  `Disponibilita` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `caschi`
--

INSERT INTO `caschi` (`id`, `Prezzo`, `Taglia`, `Disponibilita`) VALUES
(1, 24, 'M', 'Non Disponibile'),
(2, 24, 'L', 'Disponibile'),
(3, 24, 'XL', 'Disponibile'),
(4, 24, 'M', 'Guasto');

-- --------------------------------------------------------

--
-- Struttura della tabella `clienti`
--

CREATE TABLE `clienti` (
  `id` int(2) NOT NULL,
  `NOME` varchar(50) NOT NULL,
  `COGNOME` varchar(50) NOT NULL,
  `EMAIL` varchar(50) NOT NULL,
  `RESIDENZA` int(2) NOT NULL,
  `DOCUMENTO` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `clienti`
--

INSERT INTO `clienti` (`id`, `NOME`, `COGNOME`, `EMAIL`, `RESIDENZA`, `DOCUMENTO`) VALUES
(59, 'giovanni', 'pisnai', 'pisanigiovanni@gmail.com', 61, 'CE3456789');

-- --------------------------------------------------------

--
-- Struttura della tabella `datiprenotazione`
--

CREATE TABLE `datiprenotazione` (
  `Cliente` int(2) NOT NULL,
  `NumeroPrenotazione` int(5) DEFAULT NULL,
  `Attrezzatura` int(2) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  `Consegna` enum('Non Consegnato','Consegnato','Restituito') NOT NULL DEFAULT 'Non Consegnato'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `datiprenotazione`
--

INSERT INTO `datiprenotazione` (`Cliente`, `NumeroPrenotazione`, `Attrezzatura`, `timestamp`, `Consegna`) VALUES
(59, 83744, 1, '2024-09-07 13:07:38', 'Consegnato');

-- --------------------------------------------------------

--
-- Struttura della tabella `residenza`
--

CREATE TABLE `residenza` (
  `id` int(2) NOT NULL,
  `VIA` varchar(50) NOT NULL,
  `CITTA` varchar(50) NOT NULL,
  `PROVINCIA` varchar(50) NOT NULL,
  `NUMEROCIVICO` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `residenza`
--

INSERT INTO `residenza` (`id`, `VIA`, `CITTA`, `PROVINCIA`, `NUMEROCIVICO`) VALUES
(61, 'roma', 'aversa', 'ce', 97);

-- --------------------------------------------------------

--
-- Struttura della tabella `scarponi`
--

CREATE TABLE `scarponi` (
  `id` int(2) NOT NULL,
  `Prezzo` float NOT NULL,
  `Misura` int(2) NOT NULL,
  `Disponibilita` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `scarponi`
--

INSERT INTO `scarponi` (`id`, `Prezzo`, `Misura`, `Disponibilita`) VALUES
(5, 12, 41, 'Disponibile '),
(6, 12, 38, 'Disponibile '),
(7, 12, 40, 'Disponibile '),
(8, 12, 45, 'Guasto');

-- --------------------------------------------------------

--
-- Struttura della tabella `sci`
--

CREATE TABLE `sci` (
  `id` int(2) NOT NULL,
  `Lunghezza` enum('CORTI','MEDI','LUNGHI','') NOT NULL,
  `Tipologia` enum('BASE','MEDI','AVANZATI','') NOT NULL DEFAULT 'BASE',
  `Prezzo` double NOT NULL,
  `Disponibilita` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `sci`
--

INSERT INTO `sci` (`id`, `Lunghezza`, `Tipologia`, `Prezzo`, `Disponibilita`) VALUES
(9, 'CORTI', 'BASE', 20, 'Disponibile'),
(10, 'MEDI', 'AVANZATI', 20, 'Disponibile'),
(11, 'LUNGHI', 'BASE', 20, 'Disponibile'),
(12, 'CORTI', 'MEDI', 20, 'Disponibile'),
(13, 'CORTI', 'BASE', 20, 'Disponibile');

-- --------------------------------------------------------

--
-- Struttura della tabella `snowboard`
--

CREATE TABLE `snowboard` (
  `id` varchar(50) NOT NULL,
  `Disponibilita` varchar(50) DEFAULT NULL,
  `Prezzo` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `snowboard`
--

INSERT INTO `snowboard` (`id`, `Disponibilita`, `Prezzo`) VALUES
('14', 'Disponibile', 21),
('15', 'Disponibile', 21),
('16', 'Guasto', 21),
('17', 'Disponibile', 21);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `caschi`
--
ALTER TABLE `caschi`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `clienti`
--
ALTER TABLE `clienti`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_residenza` (`RESIDENZA`);

--
-- Indici per le tabelle `datiprenotazione`
--
ALTER TABLE `datiprenotazione`
  ADD PRIMARY KEY (`Cliente`,`Attrezzatura`);

--
-- Indici per le tabelle `residenza`
--
ALTER TABLE `residenza`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `scarponi`
--
ALTER TABLE `scarponi`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `sci`
--
ALTER TABLE `sci`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `snowboard`
--
ALTER TABLE `snowboard`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `clienti`
--
ALTER TABLE `clienti`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT per la tabella `residenza`
--
ALTER TABLE `residenza`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `clienti`
--
ALTER TABLE `clienti`
  ADD CONSTRAINT `fk_residenza` FOREIGN KEY (`RESIDENZA`) REFERENCES `residenza` (`id`);

--
-- Limiti per la tabella `datiprenotazione`
--
ALTER TABLE `datiprenotazione`
  ADD CONSTRAINT `fk_clienti` FOREIGN KEY (`Cliente`) REFERENCES `clienti` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
