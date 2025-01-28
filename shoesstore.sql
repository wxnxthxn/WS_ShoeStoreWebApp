-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 23, 2023 at 06:09 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shoesstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `account_id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `types` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`account_id`, `username`, `password`, `customer_id`, `types`) VALUES
(1, 'bussarakam', '1234', 1, 'admin'),
(2, 'winithon', '2345', 2, 'customer'),
(3, 'pollasith', '1234', 3, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `customersmember`
--

CREATE TABLE `customersmember` (
  `cmID` int(11) NOT NULL,
  `cmName` varchar(40) NOT NULL,
  `cmLastName` varchar(40) NOT NULL,
  `cmAddress` text NOT NULL,
  `cmTel` varchar(10) NOT NULL,
  `cmEmail` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customersmember`
--

INSERT INTO `customersmember` (`cmID`, `cmName`, `cmLastName`, `cmAddress`, `cmTel`, `cmEmail`) VALUES
(1, 'bussarakam', 'dasri', 'bangkok', '0234567890', 'buss@mail.com'),
(2, 'winithon', 'chobchit', 'bangkok', '0812345678', 'wini@mail.com'),
(3, 'pollasith', 'srisook', 'bangkok', '0634567892', 'poll@mail.com');

-- --------------------------------------------------------

--
-- Table structure for table `logadmin`
--

CREATE TABLE `logadmin` (
  `logID` int(13) NOT NULL,
  `logUsername` varchar(30) NOT NULL,
  `logPassword` varchar(30) NOT NULL,
  `logTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `logadmin`
--

INSERT INTO `logadmin` (`logID`, `logUsername`, `logPassword`, `logTime`) VALUES
(1, 'pollasith', '1234', '2023-08-22 22:41:57'),
(2, 'Bussarakam', '1234', '2023-08-22 22:42:50'),
(3, 'pollasith', '1234', '2023-08-22 22:45:54'),
(4, 'pollasith', '1234', '0000-00-00 00:00:00'),
(5, 'Bussarakam', '1234', '0000-00-00 00:00:00'),
(6, 'pollasith', '1234', '0000-00-00 00:00:00'),
(7, 'Bussarakam', '1234', '2023-08-23 05:57:59'),
(8, 'pollasith', '1234', '2023-08-23 05:58:27'),
(9, 'Bussarakam', '1234', '2023-08-23 06:01:32'),
(10, 'Bussarakam', '1234', '2023-08-23 13:39:44'),
(11, 'Bussarakam', '1234', '2023-08-23 13:58:06'),
(12, 'pollasith', '1234', '2023-08-23 15:31:35');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ProductID` int(11) NOT NULL,
  `ProductName` varchar(100) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `ProductPrice` decimal(10,2) DEFAULT 0.00,
  `UnitsInStock` smallint(11) DEFAULT 0,
  `Image` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProductID`, `ProductName`, `Description`, `ProductPrice`, `UnitsInStock`, `Image`) VALUES
(1, 'Nike Air Force 1 \'07', 'รองเท้าผู้หญิง\r\nColor: White\r\nSize : US 5', '3700.00', 15, '1.jpg'),
(2, 'Nike Air Force 1 \'07\r\n', 'รองเท้าผู้หญิง\r\nColor: Black\r\nSize : US 5\r\n', '3700.00', 10, '2.jpg'),
(3, 'Nike Air Max 1\r\nรองเท้าผู้หญิง\r\n', 'รองเท้าผู้หญิง\r\ncolor: Pink\r\nSize : US 6', '5400.00', 15, '3.jpg'),
(4, 'Air Jordan 1 Low\r\n', 'รองเท้าผู้หญิง\r\nColor: Shadow Brown/Sail/Brown Kelp\r\nSize: US 6.5', '4300.00', 11, '4.jpg'),
(5, 'Nike Air Max Excee\r\n', 'รองเท้าผู้หญิง\r\nColor: Phantom/Metallic Gold/Sail/Black\r\nSize: US 7', '3700.00', 15, '5.jpg'),
(6, 'Nike Air Force 1 \'07', 'รองเท้าผู้ชาย\r\nColor: White\r\nSize: US 10', '3700.00', 20, '6.jpg'),
(7, 'Nike Air Force 1 \'07 EasyOn', 'รองเท้าผู้ชาย\r\nColor: White\r\nSize: US 9.5', '4300.00', 15, '7.jpg'),
(8, 'Nike Air Max Pulse', 'รองเท้าผู้ชาย\r\nColor: Cobblestone/Light Orewood Brown/Black/Reflect Silver\r\nSize: US 11.5', '5700.00', 20, '8.jpg'),
(9, 'Nike Air Max 1', 'รองเท้าผู้ชาย\r\nColor: White/Deep Royal Blue/Pure Platinum/Black\r\nSize: US 12', '5400.00', 20, '9.jpg'),
(10, 'Nike Dunk Low Retro Premium', 'รองเท้าผู้ชาย\r\nColor: Mica Green/Photon Dust/Sail\r\nSize: US 12.5', '4300.00', 15, '10.jpg'),
(11, 'Nike Air Force 1 LE', 'รองเท้าเด็กผู้หญิง\r\nColor: White\r\nSize : US 5Y', '3000.00', 15, '11.jpg'),
(12, 'Nike Star Runner 4', 'รองเท้าเด็กผู้หญิง\r\nColor: White\r\nSize : US 7Y', '2000.00', 10, '12.jpg'),
(13, 'Nike Air Max 90 LTR', 'รองเท้าเด็กผู้หญิง\r\nColor: White\r\nSize : US 7Y', '2800.00', 20, '13.jpg'),
(14, 'Nike Team Hustle D 11', 'รองเท้าเด็กผู้หญิง\r\nColor: Pink Foam/White/Black/Summit White\r\nSize : US 3Y', '2000.00', 15, '14.jpg'),
(15, 'Nike Star Runner 3', 'รองเท้าเด็กผู้หญิง\r\nColor: Pink Foam/Black\r\nSize : US 3C', '1500.00', 10, '15.jpg'),
(16, 'Nike Air Force 1 LE', 'รองเท้าเด็กผู้ชาย\r\nColor: White\r\nSize : US 5.5Y', '3000.00', 20, '16.jpg'),
(17, 'Air Jordan 1 Low Flyease', 'รองเท้าเด็กผู้ชาย\r\nColor: Sky J Purple/ขาว/Sky J Light Purple\r\nSize : US 7Y', '4100.00', 15, '17.jpg'),
(18, 'Nike Air More Uptempo', 'รองเท้าเด็กผู้ชาย\r\nColor: Photon Dust/White/Black/Metallic Silver\r\nSize : US 2Y', '3200.00', 10, '18.jpg'),
(19, 'Jordan 1 Low Alt', 'รองเท้าเด็กผู้ชาย\r\nColor: Sky J Purple/White/Sky J Light Purple\r\nSize : US 3Y', '2400.00', 15, '19.jpg'),
(20, 'Nike Air Max 270 SE', 'รองเท้าเด็กผู้ชาย\r\nColor: White/Metallic Silver\r\nSize : US 5Y', '4000.00', 20, '20.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`account_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `customersmember`
--
ALTER TABLE `customersmember`
  ADD PRIMARY KEY (`cmID`);

--
-- Indexes for table `logadmin`
--
ALTER TABLE `logadmin`
  ADD PRIMARY KEY (`logID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProductID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customersmember`
--
ALTER TABLE `customersmember`
  MODIFY `cmID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `logadmin`
--
ALTER TABLE `logadmin`
  MODIFY `logID` int(13) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customersmember` (`cmID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
