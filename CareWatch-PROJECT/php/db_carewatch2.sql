-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 01, 2017 at 04:43 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_carewatch`
--

-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

CREATE TABLE IF NOT EXISTS `devices` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `owner` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `naw`
--

CREATE TABLE IF NOT EXISTS `naw` (
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `permission_link`
--

CREATE TABLE IF NOT EXISTS `permission_link` (
  `device_id` int(11) NOT NULL,
  `naw_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `snra`
--

CREATE TABLE IF NOT EXISTS `snra` (
`id` int(11) NOT NULL,
  `snrd_id` int(11) NOT NULL,
  `state` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `snrd`
--

CREATE TABLE IF NOT EXISTS `snrd` (
`snrd_id` int(10) NOT NULL,
  `snrd_val` varchar(30) NOT NULL,
  `snsr_tijd` time(6) NOT NULL,
  `snsr_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `snsr`
--

CREATE TABLE IF NOT EXISTS `snsr` (
`snsr_id` int(30) NOT NULL,
  `snsr_serienr` text NOT NULL,
  `snsr_locatie` text NOT NULL,
  `snsr_device_id` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `devices`
--
ALTER TABLE `devices`
 ADD PRIMARY KEY (`id`), ADD KEY `devices_naw_FK` (`owner`);

--
-- Indexes for table `naw`
--
ALTER TABLE `naw`
 ADD PRIMARY KEY (`naw_id`);

--
-- Indexes for table `permission_link`
--
ALTER TABLE `permission_link`
 ADD KEY `permission_link_devices_FK` (`device_id`), ADD KEY `permission_link_naw_FK` (`naw_id`);

--
-- Indexes for table `snra`
--
ALTER TABLE `snra`
 ADD PRIMARY KEY (`id`), ADD KEY `snra_snrd_FK` (`snrd_id`);

--
-- Indexes for table `snrd`
--
ALTER TABLE `snrd`
 ADD PRIMARY KEY (`snrd_id`), ADD KEY `snsr_id` (`snsr_id`);

--
-- Indexes for table `snsr`
--
ALTER TABLE `snsr`
 ADD PRIMARY KEY (`snsr_id`), ADD KEY `snsr_devices_FK` (`snsr_device_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `devices`
--
ALTER TABLE `devices`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `naw`
--
ALTER TABLE `naw`
MODIFY `naw_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `snra`
--
ALTER TABLE `snra`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `snrd`
--
ALTER TABLE `snrd`
MODIFY `snrd_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `snsr`
--
ALTER TABLE `snsr`
MODIFY `snsr_id` int(30) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `devices`
--
ALTER TABLE `devices`
ADD CONSTRAINT `devices_naw_FK` FOREIGN KEY (`owner`) REFERENCES `naw` (`naw_id`);

--
-- Constraints for table `permission_link`
--
ALTER TABLE `permission_link`
ADD CONSTRAINT `permission_link_devices_FK` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`),
ADD CONSTRAINT `permission_link_naw_FK` FOREIGN KEY (`naw_id`) REFERENCES `naw` (`naw_id`);

--
-- Constraints for table `snra`
--
ALTER TABLE `snra`
ADD CONSTRAINT `snra_snrd_FK` FOREIGN KEY (`snrd_id`) REFERENCES `snrd` (`snrd_id`);

--
-- Constraints for table `snrd`
--
ALTER TABLE `snrd`
ADD CONSTRAINT `snrd_snsr_FK` FOREIGN KEY (`snsr_id`) REFERENCES `snsr` (`snsr_id`);

--
-- Constraints for table `snsr`
--
ALTER TABLE `snsr`
ADD CONSTRAINT `snsr_devices_FK` FOREIGN KEY (`snsr_device_id`) REFERENCES `devices` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
