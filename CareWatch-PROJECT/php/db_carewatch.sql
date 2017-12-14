-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2017 at 11:23 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_carewatch`
--

-- --------------------------------------------------------

--
-- Table structure for table `acd`
--

CREATE TABLE `acd` (
  `acd_snr_id` int(20) NOT NULL,
  `acd_actie` int(40) NOT NULL,
  `acd_tijd` time(6) NOT NULL,
  `acd_message` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `naw`
--

CREATE TABLE `naw` (
  `naw_id` int(11) NOT NULL,
  `naw_snr_id` int(25) NOT NULL,
  `naw_voornaam` varchar(30) NOT NULL,
  `naw_tussenvoegsel` varchar(15) NOT NULL,
  `naw_achternaam` varchar(25) NOT NULL,
  `naw_geslacht` varchar(11) NOT NULL,
  `naw_geboortedatum` date NOT NULL,
  `naw_bsn_nr` varchar(25) NOT NULL,
  `naw_adres` varchar(35) NOT NULL,
  `naw_postcode` varchar(15) NOT NULL,
  `naw_woonplaats` varchar(35) NOT NULL,
  `naw_land` varchar(35) NOT NULL,
  `naw_email` varchar(35) NOT NULL,
  `naw_username` varchar(20) NOT NULL,
  `naw_wachtwoord` varchar(100) NOT NULL,
  `naw_securitylevel` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `naw`
--

INSERT INTO `naw` (`naw_id`, `naw_snr_id`, `naw_voornaam`, `naw_tussenvoegsel`, `naw_achternaam`, `naw_geslacht`, `naw_geboortedatum`, `naw_bsn_nr`, `naw_adres`, `naw_postcode`, `naw_woonplaats`, `naw_land`, `naw_email`, `naw_username`, `naw_wachtwoord`, `naw_securitylevel`) VALUES
(1, 0, 'Richard', 'van der', 'Veen', 'Male', '1967-12-27', '12345', 'Ransuil 118', '7827GM', 'Emmen', 'Netherlands', 'r_vd_veen@hotmail.com', 'richard', 'Üìæ†\\4ÅNo2åñƒ', 0),
(2, 0, 'test1', 'test2', 'test3', 'Female', '1980-02-07', 'test4', 'test5', 'test6', 'test7', 'test8', 'test@test.nl', 'testje', 'þáÜ0pö¸‰„;²BY', 0),
(3, 0, '', '', '', '', '0000-00-00', '', '', '', '', '', 'kees@vpro.nl', 'kees', 'Üìæ†\\4ÅNo2åñƒ', 0);

-- --------------------------------------------------------

--
-- Table structure for table `snrd`
--

CREATE TABLE `snrd` (
  `snrd_id` int(10) NOT NULL,
  `snrd_type` varchar(25) NOT NULL,
  `snrd_val` varchar(30) NOT NULL,
  `snsr_tijd` time(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `snsr`
--

CREATE TABLE `snsr` (
  `snsr_id` int(30) NOT NULL,
  `snsr_serienr` text NOT NULL,
  `snsr_locatie` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acd`
--
ALTER TABLE `acd`
  ADD PRIMARY KEY (`acd_snr_id`);

--
-- Indexes for table `naw`
--
ALTER TABLE `naw`
  ADD PRIMARY KEY (`naw_id`);

--
-- Indexes for table `snrd`
--
ALTER TABLE `snrd`
  ADD PRIMARY KEY (`snrd_id`);

--
-- Indexes for table `snsr`
--
ALTER TABLE `snsr`
  ADD PRIMARY KEY (`snsr_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `naw`
--
ALTER TABLE `naw`
  MODIFY `naw_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
