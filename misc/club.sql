-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2024 at 08:24 AM
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `Contact` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `advisor_contact`
--

INSERT INTO `advisor_contact` (`Advisor_ID`, `Contact`) VALUES
(2001, '20011'),
(2001, '20012'),
(2002, '20021'),
(2002, '20022'),
(2003, '20031'),
(2003, '20032'),
(2004, '20041'),
(2004, '20042'),
(2005, '20051'),
(2005, '20052'),
(2006, '20061'),
(2006, '20062'),
(2007, '20071'),
(2007, '20072'),
(2008, '20081'),
(2008, '20082'),
(2009, '20091'),
(2009, '20092');

-- --------------------------------------------------------

--
-- Table structure for table `approved_event`
--

CREATE TABLE `approved_event` (
  `Event_ID` int(11) NOT NULL,
  `Club` varchar(255) DEFAULT NULL,
  `Name` varchar(255) NOT NULL,
  `Date` date DEFAULT NULL,
  `Venue` varchar(255) DEFAULT NULL,
  `Entry_Fee` int(11) DEFAULT NULL,
  `Advisor_ID` int(11) DEFAULT NULL,
  `Capacity` int(11) DEFAULT NULL,
  `Event_Cost` int(11) DEFAULT NULL,
  `Participants` int(11) DEFAULT NULL,
  `Fundings` int(11) DEFAULT NULL,
  `Earnings` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `approved_event`
--

INSERT INTO `approved_event` (`Event_ID`, `Club`, `Name`, `Date`, `Venue`, `Entry_Fee`, `Advisor_ID`, `Capacity`, `Event_Cost`, `Participants`, `Fundings`, `Earnings`) VALUES
(4001, 'BIZ BEE', 'Talent BEE Hunt', '2024-03-20', 'Auditorium, Ground Floor', 10, 2006, 100, 10000, 0, 0, 0),
(4002, 'ROBU', 'Soccer Bot Competition', '2024-03-21', 'Free Space, 6th Floor', 10, 2002, 100, 1000, 0, 0, 0),
(4003, 'BUCC', 'Cyber Security Session', '2024-03-22', 'Auditorium, 10th Floor', 10, 2001, 100, 10000, 0, 0, 0),
(4004, 'BUAC', 'Sajek Valley Tour', '2024-03-23', 'Sajek, Khagrachari', 1000, 2003, 100, 100000, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `club`
--

CREATE TABLE `club` (
  `Name` varchar(255) NOT NULL,
  `Advisor_ID` int(11) DEFAULT NULL,
  `Advisor` varchar(255) DEFAULT NULL,
  `Advisor_Email` varchar(255) DEFAULT NULL,
  `President_ID` int(11) DEFAULT NULL,
  `President` varchar(255) DEFAULT NULL,
  `President_Email` varchar(255) DEFAULT NULL,
  `Established` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `club`
--

INSERT INTO `club` (`Name`, `Advisor_ID`, `Advisor`, `Advisor_Email`, `President_ID`, `President`, `President_Email`, `Established`) VALUES
('BIZ BEE', 2006, 'Shamim Ehsanul Haque', 'shamim@gmail.com', 1004, 'Yeamin Adnan', 'yeamin.adnan@gmail.com', '2014-10-21'),
('BUAC', 2003, 'Arif Shakil', 'arif@gmail.com', 1003, 'Raheek Raiyan', 'raheek.raiyan@gmail.com', '2014-10-21'),
('BUCC', 2001, 'Annajiat Alim Rasel', 'annajiat@gmail.com', 1001, 'Musarrat Tasnim', 'musarrat.tasnim@gmail.com', '2014-10-21'),
('BUEDF', 2004, 'Mohammad Atiqul Basher', 'basher@gmail.com', 1002, 'Afif Rayhan', 'afif.rayhan@gmail.com', '2014-10-21'),
('ROBU', 2002, 'Md. Khalilur Rahman', 'khalilur@gmail.com', 1005, 'Nusaiba Alam', 'nusaiba.alam@gmail.com', '2014-10-21');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `Sponsor` varchar(255) NOT NULL,
  `Panel_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`Sponsor`, `Panel_ID`) VALUES
('Standard Bank Ltd.', 1001),
('Standard Bank Ltd.', 1006);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `Name` varchar(255) NOT NULL,
  `Head` varchar(255) DEFAULT NULL,
  `Designation` varchar(255) DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Established` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`Name`, `Head`, `Designation`, `Email`, `Password`, `Established`) VALUES
('ARCH', 'Zainab Faruqui Ali', 'Chairperson', 'arch@gmail.com', '1234', '2002-06-16'),
('BBA', 'Mohammad Mujibul Haque', 'Chairperson', 'bba@gmail.com', '1234', '2002-08-18'),
('CSE', 'Sadia Hamid Kazi', 'Chairperson', 'cse@gmail.com', '1234', '2002-01-11'),
('EEE', 'Md. Mosaddequr Rahman', 'Chairperson', 'eee@gmail.com', '1234', '2002-02-12'),
('ENH', 'Firdous Azim', 'Chairperson', 'enh@gmail.com', '1234', '2002-04-14'),
('ESS', 'Wasiqur Rahman Khan', 'Chairperson', 'ess@gmail.com', '1234', '2002-05-15'),
('LAW', 'K. Shamsuddin Mahmood', 'Chairperson', 'law@gmail.com', '1234', '2002-09-19'),
('MNS', 'A F M Yusuf Haider', 'Chairperson', 'mns@gmail.com', '1234', '2002-03-13'),
('PHR', 'Hasina Yasmin', 'Chairperson', 'phrm@gmail.com', '1234', '2002-07-17');

-- --------------------------------------------------------

--
-- Table structure for table `give_announcement`
--

CREATE TABLE `give_announcement` (
  `Department` varchar(255) NOT NULL,
  `Club` varchar(255) NOT NULL,
  `Message` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `give_announcement`
--

INSERT INTO `give_announcement` (`Department`, `Club`, `Message`) VALUES
('BBA', 'BIZ BEE', 'Job Fair Starts From Today.'),
('CSE', 'BUCC', 'Club Fair Starts From Today.');

-- --------------------------------------------------------

--
-- Table structure for table `give_fund`
--

CREATE TABLE `give_fund` (
  `Event_ID` int(11) NOT NULL,
  `OCA_ID` int(11) NOT NULL,
  `Sponsor` varchar(255) NOT NULL,
  `Amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `manage`
--

CREATE TABLE `manage` (
  `Member_ID` int(11) NOT NULL,
  `OCA_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `member_contact`
--

CREATE TABLE `member_contact` (
  `Member_ID` int(11) NOT NULL,
  `Contact` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `member_contact`
--

INSERT INTO `member_contact` (`Member_ID`, `Contact`) VALUES
(1001, '10011'),
(1001, '10012'),
(1002, '10021'),
(1002, '10022'),
(1003, '10031'),
(1003, '10032'),
(1004, '10041'),
(1004, '10042'),
(1005, '10051'),
(1005, '10052'),
(1006, '10061'),
(1006, '10062'),
(1007, '10071'),
(1007, '10072'),
(1008, '10081'),
(1008, '10082'),
(1009, '10091'),
(1009, '10092'),
(1010, '10101'),
(1010, '10102'),
(1036, '10361'),
(1036, '10362'),
(1037, '10371'),
(1037, '10372'),
(1038, '10381'),
(1038, '10382'),
(1039, '10391'),
(1039, '10392'),
(1040, '10401'),
(1040, '10402');

-- --------------------------------------------------------

--
-- Table structure for table `moderate`
--

CREATE TABLE `moderate` (
  `Member_ID` int(11) NOT NULL,
  `Panel_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `moderate`
--

INSERT INTO `moderate` (`Member_ID`, `Panel_ID`) VALUES
(1036, 1001),
(1036, 1006);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `Contact` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `oca_contact`
--

INSERT INTO `oca_contact` (`OCA_ID`, `Contact`) VALUES
(3001, '30011'),
(3001, '30012'),
(3002, '30021'),
(3002, '30022'),
(3003, '30031'),
(3003, '30032'),
(3004, '30041'),
(3004, '30042'),
(3005, '30051'),
(3005, '30052');

-- --------------------------------------------------------

--
-- Table structure for table `participate`
--

CREATE TABLE `participate` (
  `Member_ID` int(11) NOT NULL,
  `Event_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `provide_fund`
--

CREATE TABLE `provide_fund` (
  `Event_ID` int(11) NOT NULL,
  `OCA_ID` int(11) NOT NULL,
  `Amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `registered_member`
--

CREATE TABLE `registered_member` (
  `Member_ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Gender` varchar(255) DEFAULT NULL,
  `Birth_Date` date DEFAULT NULL,
  `Department` varchar(255) DEFAULT NULL,
  `Admitted` varchar(255) DEFAULT NULL,
  `Credits` int(11) DEFAULT NULL,
  `Club` varchar(255) DEFAULT NULL,
  `Joined_Date` date DEFAULT NULL,
  `Designation` varchar(255) DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `registered_member`
--

INSERT INTO `registered_member` (`Member_ID`, `Name`, `Gender`, `Birth_Date`, `Department`, `Admitted`, `Credits`, `Club`, `Joined_Date`, `Designation`, `Email`, `Password`) VALUES
(1001, 'Musarrat Tasnim', 'Female', '2001-12-16', 'CSE', 'Spring 2022', 66, 'BUCC', '2024-03-01', 'President', 'musarrat.tasnim@gmail.com', '1234'),
(1002, 'Afif Rayhan', 'Male', '2000-06-09', 'CSE', 'Summer 2021', 78, 'BUEDF', '2024-03-01', 'President', 'afif.rayhan@gmail.com', '1234'),
(1003, 'Raheek Raiyan', 'Male', '2001-07-18', 'CSE', 'Fall 2021', 78, 'BUAC', '2024-03-01', 'President', 'raheek.raiyan@gmail.com', '1234'),
(1004, 'Yeamin Adnan', 'Male', '2002-09-07', 'CSE', 'Fall 2021', 78, 'BIZ BEE', '2024-03-01', 'President', 'yeamin.adnan@gmail.com', '1234'),
(1005, 'Nusaiba Alam', 'Female', '2000-06-22', 'CSE', 'Summer 2021', 96, 'ROBU', '2024-03-01', 'President', 'nusaiba.alam@gmail.com', '1234'),
(1006, 'Hasan Mahmud', 'Male', '2000-04-23', 'PHR', 'Summer 2021', 84, 'BUCC', '2024-03-02', 'Vice President', 'hasan.mahmud@gmail.com', '1234'),
(1007, 'Kabir Chowdhury', 'Male', '2000-08-17', 'EEE', 'Fall 2021', 72, 'BUAC', '2024-03-02', 'Vice President', 'kabir.chowdhury@gmail.com', '1234'),
(1008, 'Nabil Ahmed', 'Male', '2001-09-28', 'LAW', 'Spring 2021', 96, 'BIZ BEE', '2024-03-02', 'Vice President', 'nabil.ahmed@gmail.com', '1234'),
(1009, 'Mubtasim Fuad', 'Male', '2002-01-23', 'ENH', 'Spring 2022', 60, 'BUEDF', '2024-03-02', 'Vice President', 'mubtasim.fuad@gmail.com', '1234'),
(1010, 'Towfiq Mahmud', 'Male', '2000-08-22', 'ARCH', 'Spring 2021', 96, 'ROBU', '2024-03-02', 'Vice President', 'towfiq.mahmud@gmail.com', '1234'),
(1036, 'Nafiz Ahmed', 'Male', '2000-03-23', 'CSE', 'Spring 2021', 96, 'BUCC', '2024-03-07', 'Member', 'nafiz.ahmed@gmail.com', '1234'),
(1037, 'Nafis Siddik', 'Male', '2001-02-25', 'EEE', 'Summer 2021', 84, 'BUEDF', '2024-03-08', 'Member', 'nafis.siddik@gmail.com', '1234'),
(1038, 'Humaira Rashmin', 'Female', '2000-07-08', 'ENH', 'Fall 2021', 72, 'BUAC', '2024-03-09', 'Member', 'humaira.rashmin@gmail.com', '1234'),
(1039, 'Maisha Fairooz', 'Female', '2002-09-17', 'LAW', 'Spring 2022', 60, 'BIZ BEE', '2024-03-10', 'Member', 'maisha.fairooz@gmail.com', '1234'),
(1040, 'Nihalul Kabir', 'Male', '2000-05-28', 'MNS', 'Summer 2022', 48, 'ROBU', '2024-03-11', 'Member', 'nihalul.kabir@gmail.com', '1234');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `request_membership`
--

CREATE TABLE `request_membership` (
  `Member_ID` int(11) NOT NULL,
  `Panel_ID` int(11) NOT NULL,
  `Club` varchar(255) NOT NULL,
  `Request_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `request_membership`
--

INSERT INTO `request_membership` (`Member_ID`, `Panel_ID`, `Club`, `Request_Date`) VALUES
(1052, 1001, 'BUCC', '2024-03-28'),
(1052, 1006, 'BUCC', '2024-03-28');

-- --------------------------------------------------------

--
-- Table structure for table `request_sponsorship`
--

CREATE TABLE `request_sponsorship` (
  `Sponsor` varchar(255) NOT NULL,
  `Member_ID` int(11) NOT NULL,
  `OCA_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sponsor_contact`
--

CREATE TABLE `sponsor_contact` (
  `Sponsor` varchar(255) NOT NULL,
  `Contact` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sponsor_contact`
--

INSERT INTO `sponsor_contact` (`Sponsor`, `Contact`) VALUES
('BRAC Bank Ltd.', '40011'),
('BRAC Bank Ltd.', '40012'),
('City Bank Ltd.', '40021'),
('City Bank Ltd.', '40022'),
('Prime Bank Ltd.', '40031'),
('Prime Bank Ltd.', '40032');

-- --------------------------------------------------------

--
-- Table structure for table `tmember_contact`
--

CREATE TABLE `tmember_contact` (
  `Member_ID` int(11) NOT NULL,
  `Contact` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tmember_contact`
--

INSERT INTO `tmember_contact` (`Member_ID`, `Contact`) VALUES
(1051, '10511'),
(1051, '10512'),
(1052, '10521'),
(1052, '10522');

-- --------------------------------------------------------

--
-- Table structure for table `tsponsor_contact`
--

CREATE TABLE `tsponsor_contact` (
  `Sponsor` varchar(255) NOT NULL,
  `Contact` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tsponsor_contact`
--

INSERT INTO `tsponsor_contact` (`Sponsor`, `Contact`) VALUES
('Standard Bank Ltd.', '40101'),
('Standard Bank Ltd.', '40102'),
('Standard Bank Ltd.', '40103');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `unregistered_member`
--

INSERT INTO `unregistered_member` (`Member_ID`, `Name`, `Gender`, `Birth_date`, `Department`, `Admitted`, `Credits`, `Email`, `Password`) VALUES
(1051, 'Nahid Hossain', 'Male', '2001-02-27', 'ENH', 'Spring 2020', 112, 'nahid.hossain@gmail.com', '1234'),
(1052, 'Rakib Hossain', 'Male', '2024-03-20', 'LAW', 'Spring 2022', 84, 'rakib.hossain@gmail.com', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `unverified_sponsor`
--

CREATE TABLE `unverified_sponsor` (
  `Name` varchar(255) NOT NULL,
  `Agent` varchar(255) DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `unverified_sponsor`
--

INSERT INTO `unverified_sponsor` (`Name`, `Agent`, `Email`, `Password`) VALUES
('Standard Bank Ltd.', 'Anupam Roy', 'standardbank@gmail.com', '1234');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  ADD PRIMARY KEY (`Sponsor`,`Panel_ID`),
  ADD KEY `contact_ibfk_1` (`Panel_ID`);

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
  ADD CONSTRAINT `club_ibfk_1` FOREIGN KEY (`Advisor_ID`) REFERENCES `advisor` (`Advisor_ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `club_ibfk_2` FOREIGN KEY (`President_ID`) REFERENCES `registered_member` (`Member_ID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`Panel_ID`) REFERENCES `registered_member` (`Member_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
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
