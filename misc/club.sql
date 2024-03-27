-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 26, 2024 at 03:55 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `club`
--

-- --------------------------------------------------------

--
-- Table structure for table `advisor`
--

CREATE TABLE `advisor` (
  `Advisor_ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Designation` varchar(255) DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `advisor`
--

INSERT INTO `advisor` (`Advisor_ID`, `Name`, `Designation`, `Email`, `Password`) VALUES
(2001, 'Annajiat Alim Rasel', 'Advisor', 'annajiat@gmail.com', '1234'),
(2002, 'Md. Khalilur Rahman', 'Advisor', 'khalilur@gmail.com', '1234'),
(2003, 'Arif Shakil', 'Advisor', 'arif@gmail.com', '1234'),
(2004, 'Mohammad Atiqul Basher', 'Advisor', 'basher@gmail.com', '1234'),
(2005, 'Kabbya Kantam Patwary', 'Advisor', 'kabbya@gmail.com', '1234'),
(2006, 'Shamim Ehsanul Haque', 'Advisor', 'shamim@gmail.com', '1234'),
(2007, 'Liza Reshmin', 'Advisor', 'liza@gmail.com', '1234'),
(2008, 'Sanjida Hossain Sabah', 'Advisor', 'sabah@gmail.com', '1234'),
(2009, 'Tanjina Khan', 'Advisor', 'tanjina@gmail.com', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `advisor_contact`
--

CREATE TABLE `advisor_contact` (
  `Advisor_ID` int(11) NOT NULL,
  `Contact` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `approved_event`
--

CREATE TABLE `approved_event` (
  `Event_ID` int(11) NOT NULL,
  `Advisor_ID` int(11) DEFAULT NULL,
  `Club` varchar(255) DEFAULT NULL,
  `Name` varchar(255) NOT NULL,
  `Date` date DEFAULT NULL,
  `Venue` varchar(255) DEFAULT NULL,
  `Entry_Fee` int(11) DEFAULT NULL,
  `Capacity` int(11) DEFAULT NULL,
  `Event_Cost` int(11) DEFAULT NULL,
  `Participants` int(11) DEFAULT NULL,
  `Fundings` int(11) DEFAULT NULL,
  `Earnings` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `club`
--

CREATE TABLE `club` (
  `Name` varchar(255) NOT NULL,
  `President` varchar(255) DEFAULT NULL,
  `Advisor` varchar(255) DEFAULT NULL,
  `President_ID` int(11) DEFAULT NULL,
  `Advisor_ID` int(11) DEFAULT NULL,
  `Established` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `club`
--

INSERT INTO `club` (`Name`, `President`, `Advisor`, `President_ID`, `Advisor_ID`, `Established`) VALUES
('BIZ BEE', 'Yeamin Adnan', 'Shamim Ehsanul Haque', 1004, 2006, '2014-10-21'),
('BUAC', 'Raheek Raiyan', 'Arif Shakil', 1003, 2003, '2014-10-21'),
('BUCC', 'Musarrat Tasnim', 'Annajiat Alim Rasel', 1001, 2001, '2014-10-21'),
('BUEDF', 'Afif Rayhan', 'Mohammad Atiqul Basher', 1002, 2004, '2014-10-21'),
('ROBU', 'Nusaiba Alam', 'Md. Khalilur Rahman', 1005, 2002, '2014-10-21');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `Sponsor` varchar(255) NOT NULL,
  `Member_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `Name` varchar(255) NOT NULL,
  `Head` varchar(255) DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Established` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`Name`, `Head`, `Email`, `Password`, `Established`) VALUES
('ARCH', 'Zainab Faruqui Ali', 'arch@gmail.com', '1234', '2002-06-16'),
('BBA', 'Mohammad Mujibul Haque', 'bba@gmail.com', '1234', '2002-08-18'),
('CSE', 'Sadia Hamid Kazi', 'cse@gmail.com', '1234', '2002-01-11'),
('EEE', 'Md. Mosaddequr Rahman', 'eee@gmail.com', '1234', '2002-02-12'),
('ENH', 'Firdous Azim', 'enh@gmail.com', '1234', '2002-04-14'),
('ESS', 'Wasiqur Rahman Khan', 'ess@gmail.com', '1234', '2002-05-15'),
('LAW', 'K. Shamsuddin Mahmood', 'law@gmail.com', '1234', '2002-09-19'),
('MNS', 'A F M Yusuf Haider', 'mns@gmail.com', '1234', '2002-03-13'),
('PHRM', 'Hasina Yasmin', 'phrm@gmail.com', '1234', '2002-07-17');

-- --------------------------------------------------------

--
-- Table structure for table `give_announcement`
--

CREATE TABLE `give_announcement` (
  `Department` varchar(255) NOT NULL,
  `Club` varchar(255) NOT NULL,
  `Message` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `give_fund`
--

CREATE TABLE `give_fund` (
  `Event_ID` int(11) NOT NULL,
  `OCA_ID` int(11) NOT NULL,
  `Sponsor` varchar(255) NOT NULL,
  `Amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `manage`
--

CREATE TABLE `manage` (
  `Member_ID` int(11) NOT NULL,
  `OCA_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `member_contact`
--

CREATE TABLE `member_contact` (
  `Member_ID` int(11) NOT NULL,
  `Contact` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `moderate`
--

CREATE TABLE `moderate` (
  `Member_ID` int(11) NOT NULL,
  `Panel_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oca`
--

CREATE TABLE `oca` (
  `OCA_ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Designation` varchar(255) DEFAULT NULL,
  `Fund_Balance` int(11) DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `oca`
--

INSERT INTO `oca` (`OCA_ID`, `Name`, `Designation`, `Fund_Balance`, `Email`, `Password`) VALUES
(3001, 'Tahsina Rahman', 'Officer of Co-curricular Activities', 0, 'tahsina@gmail.com', '1234'),
(3002, 'Md. Shazzad Hossain', 'Officer of Co-curricular Activities', 0, 'shazzad@gmail.com', '1234'),
(3003, 'Kazi Ashraf Hakim', 'Officer of Co-curricular Activities', 0, 'ashraf@gmail.com', '1234'),
(3004, 'Md. Ashfak Chowdhury', 'Officer of Co-curricular Activities', 0, 'ashfak@gmail.com', '1234'),
(3005, 'Suraiya Akbor', 'Officer of Co-curricular Activities', 0, 'suraiya@gmail.com', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `oca_contact`
--

CREATE TABLE `oca_contact` (
  `OCA_ID` int(11) NOT NULL,
  `Contact` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `participate`
--

CREATE TABLE `participate` (
  `Member_ID` int(11) NOT NULL,
  `Event_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `provide_fund`
--

CREATE TABLE `provide_fund` (
  `Event_ID` int(11) NOT NULL,
  `OCA_ID` int(11) NOT NULL,
  `Amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `registered_member`
--

CREATE TABLE `registered_member` (
  `Member_ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Gender` varchar(255) DEFAULT NULL,
  `Birth_date` date DEFAULT NULL,
  `Department` varchar(255) DEFAULT NULL,
  `Admitted` varchar(255) DEFAULT NULL,
  `Credits` int(11) DEFAULT NULL,
  `Club` varchar(255) DEFAULT NULL,
  `Joined_Date` date DEFAULT NULL,
  `Designation` varchar(255) DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registered_member`
--

INSERT INTO `registered_member` (`Member_ID`, `Name`, `Gender`, `Birth_date`, `Department`, `Admitted`, `Credits`, `Club`, `Joined_Date`, `Designation`, `Email`, `Password`) VALUES
(1001, 'Musarrat Tasnim', 'Female', '2001-12-16', 'CSE', 'Spring 2022', 66, 'BUCC', '0000-00-00', 'President', 'musarrat.tasnim@gmail.com', '1234'),
(1002, 'Afif Rayhan', 'Male', '2000-06-09', 'CSE', 'Summer 2021', 78, 'BUEDF', '0000-00-00', 'President', 'afif.rayhan@gmail.com', '1234'),
(1003, 'Raheek Raiyan', 'Male', '2001-07-18', 'CSE', 'Fall 2021', 78, 'BUAC', '0000-00-00', 'President', 'raheek.raiyan@gmail.com', '1234'),
(1004, 'Yeamin Adnan', 'Male', '2002-09-07', 'CSE', 'Fall 2021', 78, 'BIZ BEE', '0000-00-00', 'President', 'yeamin.adnan@gmail.com', '1234'),
(1005, 'Nusaiba Alam', 'Female', '2000-06-22', 'CSE', 'Summer 2021', 96, 'ROBU', '0000-00-00', 'President', 'nusaiba.alam@gmail.com', '1234'),
(1036, 'Nafiz Ahmed', 'Male', '2000-03-23', 'BBA', 'Spring 2021', 96, 'BUCC', '0000-00-00', 'Member', 'nafiz.ahmed@gmail.com', '1234'),
(1037, 'Nafis Siddik', 'Male', '2001-02-25', 'EEE', 'Summer 2021', 84, 'BUEDF', '0000-00-00', 'Member', 'nafis.siddik@gmail.com', '1234'),
(1038, 'Humaira Rashmin', 'Female', '2000-07-08', 'ENH', 'Fall 2021', 72, 'BUAC', '0000-00-00', 'Member', 'humaira.rashmin@gmail.com', '1234'),
(1039, 'Maisha Fairooz', 'Female', '2002-09-17', 'LAW', 'Spring 2022', 60, 'BIZ BEE', '0000-00-00', 'Member', 'maisha.fairooz@gmail.com', '1234'),
(1040, 'Nihalul Kabir', 'Male', '2000-05-28', 'MNS', 'Summer 2022', 48, 'ROBU', '0000-00-00', 'Member', 'nihalul.kabir@gmail.com', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `request_event`
--

CREATE TABLE `request_event` (
  `Event_ID` int(11) NOT NULL,
  `Member_ID` int(11) NOT NULL,
  `OCA_ID` int(11) NOT NULL,
  `Proposed_Club` varchar(255) DEFAULT NULL,
  `Capacity` int(11) DEFAULT NULL,
  `Projected_Cost` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `request_membership`
--

CREATE TABLE `request_membership` (
  `Member_ID` int(11) NOT NULL,
  `Panel_ID` int(11) NOT NULL,
  `Club` varchar(255) NOT NULL,
  `Request_Date` date DEFAULT NULL,
  `Accept_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `request_sponsorship`
--

CREATE TABLE `request_sponsorship` (
  `Sponsor` varchar(255) NOT NULL,
  `Member_ID` int(11) NOT NULL,
  `OCA_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sponsor_contact`
--

CREATE TABLE `sponsor_contact` (
  `Sponsor` varchar(255) NOT NULL,
  `Contact` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmember_contact`
--

CREATE TABLE `tmember_contact` (
  `Member_ID` int(11) NOT NULL,
  `Contact` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tsponsor_contact`
--

CREATE TABLE `tsponsor_contact` (
  `Sponsor` varchar(255) NOT NULL,
  `Contact` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `unapproved_event`
--

CREATE TABLE `unapproved_event` (
  `Event_ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Date` date DEFAULT NULL,
  `Venue` varchar(255) DEFAULT NULL,
  `Entry_Fee` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `unregistered_member`
--

CREATE TABLE `unregistered_member` (
  `Member_ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Gender` varchar(255) DEFAULT NULL,
  `Birth_date` date DEFAULT NULL,
  `Department` varchar(255) DEFAULT NULL,
  `Admitted` varchar(255) DEFAULT NULL,
  `Credits` int(11) DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `unverified_sponsor`
--

CREATE TABLE `unverified_sponsor` (
  `Name` varchar(255) NOT NULL,
  `Agent` varchar(255) DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `verified_sponsor`
--

CREATE TABLE `verified_sponsor` (
  `Name` varchar(255) NOT NULL,
  `Agent` varchar(255) DEFAULT NULL,
  `Designation` varchar(255) DEFAULT NULL,
  `Fund_Balance` int(11) DEFAULT NULL,
  `Fund_Provided` int(11) DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `verified_sponsor`
--

INSERT INTO `verified_sponsor` (`Name`, `Agent`, `Designation`, `Fund_Balance`, `Fund_Provided`, `Email`, `Password`) VALUES
('BRAC Bank Ltd.', 'Rahim Rafeez', 'Sponsor', 0, 0, 'bracbank@gmail.com', '1234'),
('City Bank Ltd.', 'Abul Khayer', 'Sponsor', 0, 0, 'citybank@gmail.com', '1234'),
('Prime Bank Ltd.', 'Hasheem Uddin', 'Sponsor', 0, 0, 'primebank@gmail.com', '1234');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advisor`
--
ALTER TABLE `advisor`
  ADD PRIMARY KEY (`Advisor_ID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `advisor_contact`
--
ALTER TABLE `advisor_contact`
  ADD PRIMARY KEY (`Advisor_ID`,`Contact`);

--
-- Indexes for table `approved_event`
--
ALTER TABLE `approved_event`
  ADD PRIMARY KEY (`Event_ID`),
  ADD UNIQUE KEY `Name` (`Name`),
  ADD KEY `Advisor_ID` (`Advisor_ID`),
  ADD KEY `Club` (`Club`);

--
-- Indexes for table `club`
--
ALTER TABLE `club`
  ADD PRIMARY KEY (`Name`),
  ADD KEY `President_ID` (`President_ID`),
  ADD KEY `Advisor_ID` (`Advisor_ID`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`Sponsor`,`Member_ID`),
  ADD KEY `contact_ibfk_1` (`Member_ID`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`Name`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `give_announcement`
--
ALTER TABLE `give_announcement`
  ADD PRIMARY KEY (`Department`,`Club`),
  ADD KEY `give_announcement_ibfk_2` (`Club`);

--
-- Indexes for table `give_fund`
--
ALTER TABLE `give_fund`
  ADD PRIMARY KEY (`Event_ID`,`OCA_ID`,`Sponsor`),
  ADD KEY `give_fund_ibfk_2` (`Sponsor`),
  ADD KEY `give_fund_ibfk_3` (`OCA_ID`);

--
-- Indexes for table `manage`
--
ALTER TABLE `manage`
  ADD PRIMARY KEY (`Member_ID`,`OCA_ID`),
  ADD KEY `manage_ibfk_2` (`OCA_ID`);

--
-- Indexes for table `member_contact`
--
ALTER TABLE `member_contact`
  ADD PRIMARY KEY (`Member_ID`,`Contact`);

--
-- Indexes for table `moderate`
--
ALTER TABLE `moderate`
  ADD PRIMARY KEY (`Member_ID`,`Panel_ID`),
  ADD KEY `moderate_ibfk_2` (`Panel_ID`);

--
-- Indexes for table `oca`
--
ALTER TABLE `oca`
  ADD PRIMARY KEY (`OCA_ID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `oca_contact`
--
ALTER TABLE `oca_contact`
  ADD PRIMARY KEY (`OCA_ID`,`Contact`);

--
-- Indexes for table `participate`
--
ALTER TABLE `participate`
  ADD PRIMARY KEY (`Member_ID`,`Event_ID`),
  ADD KEY `participate_ibfk_1` (`Event_ID`);

--
-- Indexes for table `provide_fund`
--
ALTER TABLE `provide_fund`
  ADD PRIMARY KEY (`Event_ID`,`OCA_ID`),
  ADD KEY `provide_fund_ibfk_2` (`OCA_ID`);

--
-- Indexes for table `registered_member`
--
ALTER TABLE `registered_member`
  ADD PRIMARY KEY (`Member_ID`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `Club` (`Club`),
  ADD KEY `Department` (`Department`);

--
-- Indexes for table `request_event`
--
ALTER TABLE `request_event`
  ADD PRIMARY KEY (`Event_ID`,`Member_ID`,`OCA_ID`),
  ADD KEY `request_event_ibfk_2` (`Member_ID`),
  ADD KEY `request_event_ibfk_3` (`OCA_ID`);

--
-- Indexes for table `request_membership`
--
ALTER TABLE `request_membership`
  ADD PRIMARY KEY (`Member_ID`,`Panel_ID`,`Club`),
  ADD KEY `request_membership_ibfk_2` (`Panel_ID`),
  ADD KEY `request_membership_ibfk_3` (`Club`);

--
-- Indexes for table `request_sponsorship`
--
ALTER TABLE `request_sponsorship`
  ADD PRIMARY KEY (`Sponsor`,`Member_ID`,`OCA_ID`),
  ADD KEY `request_sponsorship_ibfk_1` (`Member_ID`),
  ADD KEY `request_sponsorship_ibfk_2` (`OCA_ID`);

--
-- Indexes for table `sponsor_contact`
--
ALTER TABLE `sponsor_contact`
  ADD PRIMARY KEY (`Sponsor`,`Contact`);

--
-- Indexes for table `tmember_contact`
--
ALTER TABLE `tmember_contact`
  ADD PRIMARY KEY (`Member_ID`,`Contact`);

--
-- Indexes for table `tsponsor_contact`
--
ALTER TABLE `tsponsor_contact`
  ADD PRIMARY KEY (`Sponsor`,`Contact`);

--
-- Indexes for table `unapproved_event`
--
ALTER TABLE `unapproved_event`
  ADD PRIMARY KEY (`Event_ID`),
  ADD UNIQUE KEY `Name` (`Name`);

--
-- Indexes for table `unregistered_member`
--
ALTER TABLE `unregistered_member`
  ADD PRIMARY KEY (`Member_ID`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `Department` (`Department`);

--
-- Indexes for table `unverified_sponsor`
--
ALTER TABLE `unverified_sponsor`
  ADD PRIMARY KEY (`Name`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `verified_sponsor`
--
ALTER TABLE `verified_sponsor`
  ADD PRIMARY KEY (`Name`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `advisor_contact`
--
ALTER TABLE `advisor_contact`
  ADD CONSTRAINT `advisor_contact_ibfk_1` FOREIGN KEY (`Advisor_ID`) REFERENCES `advisor` (`Advisor_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `approved_event`
--
ALTER TABLE `approved_event`
  ADD CONSTRAINT `approved_event_ibfk_1` FOREIGN KEY (`Advisor_ID`) REFERENCES `advisor` (`Advisor_ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `approved_event_ibfk_2` FOREIGN KEY (`Club`) REFERENCES `club` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `club`
--
ALTER TABLE `club`
  ADD CONSTRAINT `club_ibfk_1` FOREIGN KEY (`President_ID`) REFERENCES `registered_member` (`Member_ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `club_ibfk_2` FOREIGN KEY (`Advisor_ID`) REFERENCES `advisor` (`Advisor_ID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`Member_ID`) REFERENCES `registered_member` (`Member_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contact_ibfk_2` FOREIGN KEY (`Sponsor`) REFERENCES `unverified_sponsor` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `give_announcement`
--
ALTER TABLE `give_announcement`
  ADD CONSTRAINT `give_announcement_ibfk_1` FOREIGN KEY (`Department`) REFERENCES `department` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `give_announcement_ibfk_2` FOREIGN KEY (`Club`) REFERENCES `club` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `give_fund`
--
ALTER TABLE `give_fund`
  ADD CONSTRAINT `give_fund_ibfk_1` FOREIGN KEY (`Event_ID`) REFERENCES `approved_event` (`Event_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `give_fund_ibfk_2` FOREIGN KEY (`Sponsor`) REFERENCES `verified_sponsor` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `give_fund_ibfk_3` FOREIGN KEY (`OCA_ID`) REFERENCES `oca` (`OCA_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `manage`
--
ALTER TABLE `manage`
  ADD CONSTRAINT `manage_ibfk_1` FOREIGN KEY (`Member_ID`) REFERENCES `registered_member` (`Member_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `manage_ibfk_2` FOREIGN KEY (`OCA_ID`) REFERENCES `oca` (`OCA_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `member_contact`
--
ALTER TABLE `member_contact`
  ADD CONSTRAINT `member_contact_ibfk_1` FOREIGN KEY (`Member_ID`) REFERENCES `registered_member` (`Member_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `moderate`
--
ALTER TABLE `moderate`
  ADD CONSTRAINT `moderate_ibfk_1` FOREIGN KEY (`Member_ID`) REFERENCES `registered_member` (`Member_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `moderate_ibfk_2` FOREIGN KEY (`Panel_ID`) REFERENCES `registered_member` (`Member_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `oca_contact`
--
ALTER TABLE `oca_contact`
  ADD CONSTRAINT `oca_contact_ibfk_1` FOREIGN KEY (`OCA_ID`) REFERENCES `oca` (`OCA_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `participate`
--
ALTER TABLE `participate`
  ADD CONSTRAINT `participate_ibfk_1` FOREIGN KEY (`Event_ID`) REFERENCES `approved_event` (`Event_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `participate_ibfk_2` FOREIGN KEY (`Member_ID`) REFERENCES `registered_member` (`Member_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `provide_fund`
--
ALTER TABLE `provide_fund`
  ADD CONSTRAINT `provide_fund_ibfk_1` FOREIGN KEY (`Event_ID`) REFERENCES `approved_event` (`Event_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `provide_fund_ibfk_2` FOREIGN KEY (`OCA_ID`) REFERENCES `oca` (`OCA_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `registered_member`
--
ALTER TABLE `registered_member`
  ADD CONSTRAINT `registered_member_ibfk_1` FOREIGN KEY (`Club`) REFERENCES `club` (`Name`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `registered_member_ibfk_2` FOREIGN KEY (`Department`) REFERENCES `department` (`Name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `request_event`
--
ALTER TABLE `request_event`
  ADD CONSTRAINT `request_event_ibfk_1` FOREIGN KEY (`Event_ID`) REFERENCES `unapproved_event` (`Event_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `request_event_ibfk_2` FOREIGN KEY (`Member_ID`) REFERENCES `registered_member` (`Member_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `request_event_ibfk_3` FOREIGN KEY (`OCA_ID`) REFERENCES `oca` (`OCA_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `request_membership`
--
ALTER TABLE `request_membership`
  ADD CONSTRAINT `request_membership_ibfk_1` FOREIGN KEY (`Member_ID`) REFERENCES `unregistered_member` (`Member_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `request_membership_ibfk_2` FOREIGN KEY (`Panel_ID`) REFERENCES `registered_member` (`Member_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `request_membership_ibfk_3` FOREIGN KEY (`Club`) REFERENCES `club` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `request_sponsorship`
--
ALTER TABLE `request_sponsorship`
  ADD CONSTRAINT `request_sponsorship_ibfk_1` FOREIGN KEY (`Member_ID`) REFERENCES `registered_member` (`Member_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `request_sponsorship_ibfk_2` FOREIGN KEY (`OCA_ID`) REFERENCES `oca` (`OCA_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `request_sponsorship_ibfk_3` FOREIGN KEY (`Sponsor`) REFERENCES `unverified_sponsor` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sponsor_contact`
--
ALTER TABLE `sponsor_contact`
  ADD CONSTRAINT `sponsor_contact_ibfk_1` FOREIGN KEY (`Sponsor`) REFERENCES `verified_sponsor` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tmember_contact`
--
ALTER TABLE `tmember_contact`
  ADD CONSTRAINT `tmember_contact_ibfk_1` FOREIGN KEY (`Member_ID`) REFERENCES `unregistered_member` (`Member_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tsponsor_contact`
--
ALTER TABLE `tsponsor_contact`
  ADD CONSTRAINT `tsponsor_contact_ibfk_1` FOREIGN KEY (`Sponsor`) REFERENCES `unverified_sponsor` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `unregistered_member`
--
ALTER TABLE `unregistered_member`
  ADD CONSTRAINT `unregistered_member_ibfk_1` FOREIGN KEY (`Department`) REFERENCES `department` (`Name`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
