-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2020 at 12:22 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dboch`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adminId` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bidding`
--

CREATE TABLE `bidding` (
  `bidId` int(11) NOT NULL,
  `descriptin` varchar(500) NOT NULL,
  `price` varchar(20) NOT NULL,
  `numberOfDays` varchar(20) NOT NULL,
  `fkUserId` int(11) NOT NULL,
  `fkConstructorId` int(11) NOT NULL,
  `fkRequestId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `blogId` int(11) NOT NULL,
  `blogImage` varchar(255) NOT NULL,
  `blogTitle` varchar(255) NOT NULL,
  `blogDescription` varchar(255) NOT NULL,
  `blogEndDate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `constructor`
--

CREATE TABLE `constructor` (
  `constructorId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `specialization` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profileImage` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `constructorbasicform`
--

CREATE TABLE `constructorbasicform` (
  `formId` int(11) NOT NULL,
  `requirements` varchar(255) NOT NULL,
  `deal` varchar(255) NOT NULL,
  `quality` varchar(255) NOT NULL,
  `times` varchar(500) NOT NULL,
  `fkConstructorId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `constructorratting`
--

CREATE TABLE `constructorratting` (
  `rateId` int(11) NOT NULL,
  `people` int(11) NOT NULL,
  `ratting` varchar(20) NOT NULL,
  `overallRatting` varchar(20) NOT NULL,
  `userRate` int(11) NOT NULL,
  `fkUserId` int(11) NOT NULL,
  `fkContructorId` int(11) NOT NULL,
  `display` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `contactmessages`
--

CREATE TABLE `contactmessages` (
  `contactId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `contructorprojects`
--

CREATE TABLE `contructorprojects` (
  `projectId` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `locality` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `description` varchar(5000) NOT NULL,
  `fkConstructorId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customerId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `profile` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `qualification` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customerrequest`
--

CREATE TABLE `customerrequest` (
  `requestId` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `request` varchar(255) NOT NULL,
  `fkCustomerId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `imagegallery`
--

CREATE TABLE `imagegallery` (
  `gallaryId` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `fkConstructorId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminId`);

--
-- Indexes for table `bidding`
--
ALTER TABLE `bidding`
  ADD PRIMARY KEY (`bidId`),
  ADD KEY `fkConstructorId` (`fkConstructorId`),
  ADD KEY `fkRequestId` (`fkRequestId`),
  ADD KEY `fkUserId` (`fkUserId`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`blogId`);

--
-- Indexes for table `constructor`
--
ALTER TABLE `constructor`
  ADD PRIMARY KEY (`constructorId`);

--
-- Indexes for table `constructorbasicform`
--
ALTER TABLE `constructorbasicform`
  ADD PRIMARY KEY (`formId`);

--
-- Indexes for table `constructorratting`
--
ALTER TABLE `constructorratting`
  ADD PRIMARY KEY (`rateId`),
  ADD KEY `fkUserId` (`fkUserId`),
  ADD KEY `fkContructorId` (`fkContructorId`);

--
-- Indexes for table `contactmessages`
--
ALTER TABLE `contactmessages`
  ADD PRIMARY KEY (`contactId`);

--
-- Indexes for table `contructorprojects`
--
ALTER TABLE `contructorprojects`
  ADD PRIMARY KEY (`projectId`),
  ADD KEY `fkConstructorId` (`fkConstructorId`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerId`);

--
-- Indexes for table `customerrequest`
--
ALTER TABLE `customerrequest`
  ADD PRIMARY KEY (`requestId`),
  ADD KEY `fkCustomerId` (`fkCustomerId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adminId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bidding`
--
ALTER TABLE `bidding`
  MODIFY `bidId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `blogId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `constructor`
--
ALTER TABLE `constructor`
  MODIFY `constructorId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `constructorbasicform`
--
ALTER TABLE `constructorbasicform`
  MODIFY `formId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `constructorratting`
--
ALTER TABLE `constructorratting`
  MODIFY `rateId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contactmessages`
--
ALTER TABLE `contactmessages`
  MODIFY `contactId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contructorprojects`
--
ALTER TABLE `contructorprojects`
  MODIFY `projectId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customerrequest`
--
ALTER TABLE `customerrequest`
  MODIFY `requestId` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bidding`
--
ALTER TABLE `bidding`
  ADD CONSTRAINT `bidding_ibfk_1` FOREIGN KEY (`fkConstructorId`) REFERENCES `constructor` (`constructorId`),
  ADD CONSTRAINT `bidding_ibfk_2` FOREIGN KEY (`fkRequestId`) REFERENCES `customerrequest` (`requestId`),
  ADD CONSTRAINT `bidding_ibfk_3` FOREIGN KEY (`fkUserId`) REFERENCES `customer` (`customerId`);

--
-- Constraints for table `constructorratting`
--
ALTER TABLE `constructorratting`
  ADD CONSTRAINT `constructorratting_ibfk_1` FOREIGN KEY (`fkUserId`) REFERENCES `customer` (`customerId`),
  ADD CONSTRAINT `constructorratting_ibfk_2` FOREIGN KEY (`fkContructorId`) REFERENCES `constructor` (`constructorId`);

--
-- Constraints for table `contructorprojects`
--
ALTER TABLE `contructorprojects`
  ADD CONSTRAINT `contructorprojects_ibfk_1` FOREIGN KEY (`fkConstructorId`) REFERENCES `constructor` (`constructorId`);

--
-- Constraints for table `customerrequest`
--
ALTER TABLE `customerrequest`
  ADD CONSTRAINT `customerrequest_ibfk_1` FOREIGN KEY (`fkCustomerId`) REFERENCES `customer` (`customerId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
