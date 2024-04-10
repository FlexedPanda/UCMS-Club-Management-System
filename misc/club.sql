-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 10, 2024 at 05:16 PM
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
(2005, 'Shamim Ehsanul Haque', 'Advisor', 'shamim@gmail.com', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `advisor_contact`
--

CREATE TABLE `advisor_contact` (
  `Advisor_ID` int(11) NOT NULL,
  `Contact` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(2005, '20052');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `approved_event`
--

INSERT INTO `approved_event` (`Event_ID`, `Club`, `Name`, `Date`, `Venue`, `Entry_Fee`, `Advisor_ID`, `Capacity`, `Event_Cost`, `Participants`, `Fundings`, `Earnings`) VALUES
(5001, 'BIZBEE', 'Talent BEE Hunt', '2024-03-20', 'Auditorium, Ground Floor', 10, 2005, 100, 10000, 0, 0, 0),
(5002, 'ROBU', 'Soccer Bot Competition', '2024-03-21', 'Free Space, 6th Floor', 25, 2002, 100, 1000, 0, 0, 0),
(5003, 'BUCC', 'Cyber Security Session', '2024-03-22', 'Auditorium, 10th Floor', 50, 2001, 100, 10000, 0, 0, 0),
(5004, 'BUAC', 'Sajek Valley Tour', '2024-03-23', 'Sajek, Khagrachari', 1000, 2003, 100, 100000, 0, 0, 0),
(5005, 'BUCC', 'Competitive Programming', '2024-03-24', 'Research Lab, 12th Floor', 100, 2001, 50, 10000, 0, 0, 0),
(5006, 'ROBU', 'Project Duburi', '2024-03-23', 'ROBU Lab, 6th Floor', 0, 2002, 1, 50000, 0, 0, 0);

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
  `Established` date DEFAULT NULL,
  `Club_Reserve` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `club`
--

INSERT INTO `club` (`Name`, `Advisor_ID`, `Advisor`, `Advisor_Email`, `President_ID`, `President`, `President_Email`, `Established`, `Club_Reserve`) VALUES
('BIZBEE', 2005, 'Shamim Ehsanul Haque', 'shamim@gmail.com', 1004, 'Yeamin Adnan', 'yeamin.adnan@gmail.com', '2014-10-21', 0),
('BUAC', 2003, 'Arif Shakil', 'arif@gmail.com', 1003, 'Raheek Raiyan', 'raheek.raiyan@gmail.com', '2014-10-21', 0),
('BUCC', 2001, 'Annajiat Alim Rasel', 'annajiat@gmail.com', 1001, 'Musarrat Tasnim', 'musarrat.tasnim@gmail.com', '2014-10-21', 0),
('BUEDF', 2004, 'Mohammad Atiqul Basher', 'basher@gmail.com', 1002, 'Afif Rayhan', 'afif.rayhan@gmail.com', '2014-10-21', 0),
('ROBU', 2002, 'Md. Khalilur Rahman', 'khalilur@gmail.com', 1005, 'Nusaiba Alam', 'nusaiba.alam@gmail.com', '2014-10-21', 0);

-- --------------------------------------------------------

--
-- Table structure for table `completed_event`
--

CREATE TABLE `completed_event` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `completed_event`
--

INSERT INTO `completed_event` (`Event_ID`, `Club`, `Name`, `Date`, `Venue`, `Entry_Fee`, `Advisor_ID`, `Capacity`, `Event_Cost`, `Participants`, `Fundings`, `Earnings`) VALUES
(6001, 'BUCC', 'DevOps Session', '2024-04-27', 'Auditorium, Ground Floor', 100, 2001, 100, 10000, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `Sponsor` varchar(255) NOT NULL,
  `Panel_ID` int(11) NOT NULL,
  `Event_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`Sponsor`, `Panel_ID`, `Event_ID`) VALUES
('Rupali Bank Ltd.', 1005, 5002),
('Rupali Bank Ltd.', 1010, 5002);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`Name`, `Head`, `Designation`, `Email`, `Password`, `Established`) VALUES
('ARCH', 'Zainab Faruqui Ali', 'Chairperson', 'arch@gmail.com', '1234', '2002-06-16'),
('BBA', 'Mohammad Mujibul Haque', 'Chairperson', 'bba@gmail.com', '1234', '2002-08-18'),
('CSE', 'Kazi Sadia Hamid', 'Chairperson', 'cse@gmail.com', '1234', '2002-01-11'),
('EEE', 'Md. Mosaddequr Rahman', 'Chairperson', 'eee@gmail.com', '1234', '2002-02-12'),
('ENH', 'Firdous Azim', 'Chairperson', 'enh@gmail.com', '1234', '2002-04-14'),
('LAW', 'K. Shamsuddin Mahmood', 'Chairperson', 'law@gmail.com', '1234', '2002-09-19'),
('MNS', 'A F M Yusuf Haider', 'Chairperson', 'mns@gmail.com', '1234', '2002-03-13'),
('PHR', 'Hasina Yasmin', 'Chairperson', 'phr@gmail.com', '1234', '2002-07-17');

-- --------------------------------------------------------

--
-- Table structure for table `give_announcement`
--

CREATE TABLE `give_announcement` (
  `Department` varchar(255) NOT NULL,
  `Club` varchar(255) NOT NULL,
  `Post` varchar(255) NOT NULL,
  `Publisher` varchar(255) DEFAULT NULL,
  `Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `give_announcement`
--

INSERT INTO `give_announcement` (`Department`, `Club`, `Post`, `Publisher`, `Date`) VALUES
('ARCH', 'BUAC', 'We will have a 3 days stay for the \"Sajek Valley Tour\".', 'Advisor', '2024-04-10'),
('ARCH', 'BUCC', 'Registration for \"Cyber Security Session\" starts from today.', 'Advisor', '2024-04-10'),
('BBA', 'BUAC', 'We will have a 3 days stay for the \"Sajek Valley Tour\".', 'Advisor', '2024-04-10'),
('BBA', 'BUCC', 'Registration for \"Cyber Security Session\" starts from today.', 'Advisor', '2024-04-10'),
('CSE', 'BIZBEE', 'The University will remain closed for 7 days during Eid. ', 'Department', '2024-04-10'),
('CSE', 'BUAC', 'The University will remain closed for 7 days during Eid. ', 'Department', '2024-04-10'),
('CSE', 'BUAC', 'We will have a 3 days stay for the \"Sajek Valley Tour\".', 'Advisor', '2024-04-10'),
('CSE', 'BUCC', 'Registration for \"Cyber Security Session\" starts from today.', 'Advisor', '2024-04-10'),
('CSE', 'BUCC', 'The University will remain closed for 7 days during Eid. ', 'Department', '2024-04-10'),
('CSE', 'BUEDF', 'The University will remain closed for 7 days during Eid. ', 'Department', '2024-04-10'),
('CSE', 'ROBU', 'The University will remain closed for 7 days during Eid. ', 'Department', '2024-04-10'),
('EEE', 'BUAC', 'We will have a 3 days stay for the \"Sajek Valley Tour\".', 'Advisor', '2024-04-10'),
('EEE', 'BUCC', 'Registration for \"Cyber Security Session\" starts from today.', 'Advisor', '2024-04-10'),
('ENH', 'BUAC', 'We will have a 3 days stay for the \"Sajek Valley Tour\".', 'Advisor', '2024-04-10'),
('ENH', 'BUCC', 'Registration for \"Cyber Security Session\" starts from today.', 'Advisor', '2024-04-10'),
('LAW', 'BUAC', 'We will have a 3 days stay for the \"Sajek Valley Tour\".', 'Advisor', '2024-04-10'),
('LAW', 'BUCC', 'Registration for \"Cyber Security Session\" starts from today.', 'Advisor', '2024-04-10'),
('MNS', 'BUAC', 'We will have a 3 days stay for the \"Sajek Valley Tour\".', 'Advisor', '2024-04-10'),
('MNS', 'BUCC', 'Registration for \"Cyber Security Session\" starts from today.', 'Advisor', '2024-04-10'),
('PHR', 'BUAC', 'We will have a 3 days stay for the \"Sajek Valley Tour\".', 'Advisor', '2024-04-10'),
('PHR', 'BUCC', 'Registration for \"Cyber Security Session\" starts from today.', 'Advisor', '2024-04-10');

-- --------------------------------------------------------

--
-- Table structure for table `give_fund`
--

CREATE TABLE `give_fund` (
  `Event_ID` int(11) NOT NULL,
  `OCA_ID` int(11) NOT NULL,
  `Sponsor` varchar(255) NOT NULL,
  `Amount` int(11) DEFAULT NULL,
  `Approved` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `manage`
--

CREATE TABLE `manage` (
  `Member_ID` int(11) NOT NULL,
  `OCA_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `manage`
--

INSERT INTO `manage` (`Member_ID`, `OCA_ID`) VALUES
(1001, 3001),
(1001, 3002),
(1002, 3001),
(1002, 3002),
(1003, 3001),
(1003, 3002),
(1004, 3001),
(1004, 3002),
(1005, 3001),
(1005, 3002),
(1006, 3001),
(1006, 3002),
(1007, 3001),
(1007, 3002),
(1008, 3001),
(1008, 3002),
(1009, 3001),
(1009, 3002),
(1010, 3001),
(1010, 3002),
(1031, 3001),
(1031, 3002),
(1032, 3001),
(1032, 3002),
(1033, 3001),
(1033, 3002),
(1034, 3001),
(1034, 3002),
(1035, 3001),
(1035, 3002),
(1041, 3001),
(1041, 3002),
(1042, 3001),
(1042, 3002),
(1043, 3001),
(1043, 3002),
(1044, 3001),
(1044, 3002),
(1045, 3001),
(1045, 3002);

-- --------------------------------------------------------

--
-- Table structure for table `member_contact`
--

CREATE TABLE `member_contact` (
  `Member_ID` int(11) NOT NULL,
  `Contact` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(1005, '10051'),
(1005, '10052'),
(1005, '10053'),
(1006, '10061'),
(1006, '10062'),
(1007, '10071'),
(1007, '10072'),
(1008, '10081'),
(1008, '10082'),
(1009, '10091'),
(1010, '10101'),
(1010, '10102'),
(1031, '10311'),
(1031, '10312'),
(1032, '10321'),
(1032, '10322'),
(1033, '10331'),
(1034, '10341'),
(1034, '10342'),
(1035, '10351'),
(1041, '10411'),
(1041, '10412'),
(1041, '10413'),
(1042, '10421'),
(1042, '10422'),
(1043, '10431'),
(1043, '10432'),
(1044, '10441'),
(1044, '10442'),
(1045, '10451'),
(1045, '10452'),
(1045, '10453');

-- --------------------------------------------------------

--
-- Table structure for table `moderate`
--

CREATE TABLE `moderate` (
  `Member_ID` int(11) NOT NULL,
  `Panel_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `moderate`
--

INSERT INTO `moderate` (`Member_ID`, `Panel_ID`) VALUES
(1031, 1001),
(1031, 1006),
(1032, 1002),
(1032, 1007),
(1033, 1003),
(1033, 1008),
(1034, 1004),
(1034, 1009),
(1035, 1005),
(1035, 1010),
(1041, 1001),
(1041, 1006),
(1042, 1002),
(1042, 1007),
(1043, 1003),
(1043, 1008),
(1044, 1004),
(1044, 1009),
(1045, 1005),
(1045, 1010);

-- --------------------------------------------------------

--
-- Table structure for table `oca`
--

CREATE TABLE `oca` (
  `OCA_ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Designation` varchar(255) DEFAULT NULL,
  `Fund_Balance` int(11) DEFAULT NULL,
  `Fundings` int(11) DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `oca`
--

INSERT INTO `oca` (`OCA_ID`, `Name`, `Designation`, `Fund_Balance`, `Fundings`, `Email`, `Password`) VALUES
(3001, 'Ashraf Hakim', 'Senior Officer', 20000, 0, 'ashraf@gmail.com', '1234'),
(3002, 'Md. Shazzad Hossain', 'Officer', 20000, 0, 'shazzad@gmail.com', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `oca_contact`
--

CREATE TABLE `oca_contact` (
  `OCA_ID` int(11) NOT NULL,
  `Contact` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `oca_contact`
--

INSERT INTO `oca_contact` (`OCA_ID`, `Contact`) VALUES
(3001, '30011'),
(3002, '30021'),
(3002, '30022');

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
  `Birth_Date` date DEFAULT NULL,
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

INSERT INTO `registered_member` (`Member_ID`, `Name`, `Gender`, `Birth_Date`, `Department`, `Admitted`, `Credits`, `Club`, `Joined_Date`, `Designation`, `Email`, `Password`) VALUES
(1001, 'Musarrat Tasnim', 'Female', '2001-12-16', 'CSE', 'Spring 2022', 66, 'BUCC', '2024-03-01', 'President', 'musarrat.tasnim@gmail.com', '1234'),
(1002, 'Afif Rayhan', 'Male', '2000-06-09', 'CSE', 'Summer 2021', 78, 'BUEDF', '2024-03-01', 'President', 'afif.rayhan@gmail.com', '1234'),
(1003, 'Raheek Raiyan', 'Male', '2001-07-18', 'CSE', 'Fall 2021', 78, 'BUAC', '2024-03-01', 'President', 'raheek.raiyan@gmail.com', '1234'),
(1004, 'Yeamin Adnan', 'Male', '2002-09-19', 'EEE', 'Fall 2021', 78, 'BIZBEE', '2024-03-01', 'President', 'yeamin.adnan@gmail.com', '1234'),
(1005, 'Nusaiba Alam', 'Female', '2000-06-22', 'CSE', 'Summer 2021', 96, 'ROBU', '2024-03-01', 'President', 'nusaiba.alam@gmail.com', '1234'),
(1006, 'Hasan Mahmud', 'Male', '2000-04-23', 'PHR', 'Summer 2021', 84, 'BUCC', '2024-03-02', 'Vice President', 'hasan.mahmud@gmail.com', '1234'),
(1007, 'Kabir Chowdhury', 'Male', '2000-08-17', 'EEE', 'Fall 2021', 72, 'BUEDF', '2024-03-02', 'Vice President', 'kabir.chowdhury@gmail.com', '1234'),
(1008, 'Nabil Ahmed', 'Male', '2001-09-28', 'LAW', 'Spring 2021', 96, 'BUAC', '2024-03-02', 'Vice President', 'nabil.ahmed@gmail.com', '1234'),
(1009, 'Mubtasim Fuad', 'Male', '2002-01-08', 'EEE', 'Summer 2021', 84, 'BIZBEE', '2024-03-02', 'Vice President', 'mubtasim.fuad@gmail.com', '1234'),
(1010, 'Towfiq Mahmud', 'Male', '2000-08-22', 'ARCH', 'Spring 2021', 96, 'ROBU', '2024-03-02', 'Vice President', 'towfiq.mahmud@gmail.com', '1234'),
(1031, 'Nafiz Ahmed', 'Male', '2000-03-23', 'CSE', 'Spring 2021', 96, 'BUCC', '2024-03-07', 'Member', 'nafiz.ahmed@gmail.com', '1234'),
(1032, 'Nafis Siddik', 'Male', '2001-02-25', 'EEE', 'Summer 2021', 84, 'BUEDF', '2024-03-08', 'Member', 'nafis.siddik@gmail.com', '1234'),
(1033, 'Humaira Rashmin', 'Female', '2000-06-20', 'LAW', 'Spring 2021', 96, 'BUAC', '2024-03-09', 'Member', 'humaira.rashmin@gmail.com', '1234'),
(1034, 'Maisha Fairooz', 'Female', '2002-09-17', 'LAW', 'Spring 2022', 60, 'BIZBEE', '2024-03-10', 'Member', 'maisha.fairooz@gmail.com', '1234'),
(1035, 'Nihal Kabir', 'Male', '2001-06-06', 'CSE', 'Spring 2022', 48, 'ROBU', '2024-03-11', 'Member', 'nihal.kabir@gmail.com', '1234'),
(1041, 'Nahida Islam', 'Female', '2000-10-24', 'LAW', 'Summer 2021', 84, 'BUCC', '2024-04-02', 'Member', 'nahida.islam@gmail.com', '1234'),
(1042, 'Rakib Hossain', 'Male', '2000-05-17', 'BBA', 'Summer 2021', 84, 'BUEDF', '2024-04-03', 'Member', 'rakib.hossain@gmail.com', '1234'),
(1043, 'Sumaiya Akbor', 'Female', '2001-10-25', 'EEE', 'Summer 2021', 84, 'BUAC', '2024-04-07', 'Member', 'sumaiya.akbor@gmail.com', '1234'),
(1044, 'Sumaitha Islam', 'Female', '2000-09-20', 'BBA', 'Spring 2021', 81, 'BIZBEE', '2024-04-09', 'Member', 'sumaitha.islam@gmail.com', '1234'),
(1045, 'Humayun Ahmed', 'Male', '2000-04-03', 'MNS', 'Spring 2023', 36, 'ROBU', '2024-03-02', 'Member', 'humayun.ahmed@gmail.com', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `request_event`
--

CREATE TABLE `request_event` (
  `Event_ID` int(11) NOT NULL,
  `Member_ID` int(11) NOT NULL,
  `OCA_ID` int(11) NOT NULL,
  `Proposed_Club` varchar(255) DEFAULT NULL,
  `Approved` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `request_event`
--

INSERT INTO `request_event` (`Event_ID`, `Member_ID`, `OCA_ID`, `Proposed_Club`, `Approved`) VALUES
(4002, 1005, 3001, 'ROBU', 'No'),
(4002, 1005, 3002, 'ROBU', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `request_membership`
--

CREATE TABLE `request_membership` (
  `Member_ID` int(11) NOT NULL,
  `Panel_ID` int(11) NOT NULL,
  `Club` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `request_sponsorship`
--

CREATE TABLE `request_sponsorship` (
  `Sponsor` varchar(255) NOT NULL,
  `Panel_ID` int(11) NOT NULL,
  `OCA_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sponsor_contact`
--

CREATE TABLE `sponsor_contact` (
  `Sponsor` varchar(255) NOT NULL,
  `Contact` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sponsor_contact`
--

INSERT INTO `sponsor_contact` (`Sponsor`, `Contact`) VALUES
('AB Bank Ltd.', '40011'),
('AB Bank Ltd.', '40012'),
('BRAC Bank Ltd.', '50011'),
('BRAC Bank Ltd.', '50012'),
('City Bank Ltd.', '50021');

-- --------------------------------------------------------

--
-- Table structure for table `tmember_contact`
--

CREATE TABLE `tmember_contact` (
  `Member_ID` int(11) NOT NULL,
  `Contact` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tsponsor_contact`
--

CREATE TABLE `tsponsor_contact` (
  `Sponsor` varchar(255) NOT NULL,
  `Contact` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tsponsor_contact`
--

INSERT INTO `tsponsor_contact` (`Sponsor`, `Contact`) VALUES
('Rupali Bank Ltd.', '40051'),
('Rupali Bank Ltd.', '40052');

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

--
-- Dumping data for table `unapproved_event`
--

INSERT INTO `unapproved_event` (`Event_ID`, `Name`, `Date`, `Venue`, `Entry_Fee`) VALUES
(4002, 'Project Alter', '2024-04-05', 'Club Room, 6th Floor', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `unregistered_member`
--

CREATE TABLE `unregistered_member` (
  `Member_ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Gender` varchar(255) DEFAULT NULL,
  `Birth_Date` date DEFAULT NULL,
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

--
-- Dumping data for table `unverified_sponsor`
--

INSERT INTO `unverified_sponsor` (`Name`, `Agent`, `Email`, `Password`) VALUES
('Rupali Bank Ltd.', 'Sharifa Azad', 'rupalibank@gmail.com', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `verified_sponsor`
--

CREATE TABLE `verified_sponsor` (
  `Name` varchar(255) NOT NULL,
  `Agent` varchar(255) DEFAULT NULL,
  `Designation` varchar(255) DEFAULT NULL,
  `Fund_Balance` int(11) DEFAULT NULL,
  `Fundings` int(11) DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `verified_sponsor`
--

INSERT INTO `verified_sponsor` (`Name`, `Agent`, `Designation`, `Fund_Balance`, `Fundings`, `Email`, `Password`) VALUES
('AB Bank Ltd.', 'Anindita Labonno', 'Sponsor', 20000, 0, 'abbank@gmail.com', '1234'),
('BRAC Bank Ltd.', 'Rahim Reza', 'Sponsor', 20000, 0, 'bracbank@gmail.com', '1234'),
('City Bank Ltd.', 'Usama Khayer', 'Sponsor', 20000, 0, 'citybank@gmail.com', '1234');

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
-- Indexes for table `completed_event`
--
ALTER TABLE `completed_event`
  ADD PRIMARY KEY (`Event_ID`),
  ADD UNIQUE KEY `Name` (`Name`),
  ADD KEY `completed_event_ibfk_1` (`Advisor_ID`),
  ADD KEY `completed_event_ibfk_2` (`Club`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`Sponsor`,`Panel_ID`,`Event_ID`),
  ADD KEY `contact_ibfk_1` (`Panel_ID`),
  ADD KEY `contact_ibfk_3` (`Event_ID`);

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
  ADD PRIMARY KEY (`Department`,`Club`,`Post`),
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
  ADD PRIMARY KEY (`Sponsor`,`Panel_ID`,`OCA_ID`),
  ADD KEY `request_sponsorship_ibfk_1` (`Panel_ID`),
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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `approved_event`
--
ALTER TABLE `approved_event`
  MODIFY `Event_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5008;

--
-- AUTO_INCREMENT for table `completed_event`
--
ALTER TABLE `completed_event`
  MODIFY `Event_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6002;

--
-- AUTO_INCREMENT for table `unapproved_event`
--
ALTER TABLE `unapproved_event`
  MODIFY `Event_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4007;

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
-- Constraints for table `completed_event`
--
ALTER TABLE `completed_event`
  ADD CONSTRAINT `completed_event_ibfk_1` FOREIGN KEY (`Advisor_ID`) REFERENCES `advisor` (`Advisor_ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `completed_event_ibfk_2` FOREIGN KEY (`Club`) REFERENCES `club` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`Panel_ID`) REFERENCES `registered_member` (`Member_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contact_ibfk_2` FOREIGN KEY (`Sponsor`) REFERENCES `unverified_sponsor` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contact_ibfk_3` FOREIGN KEY (`Event_ID`) REFERENCES `approved_event` (`Event_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `give_announcement`
--
ALTER TABLE `give_announcement`
  ADD CONSTRAINT `give_announcement_ibfk_1` FOREIGN KEY (`Department`) REFERENCES `department` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `give_announcement_ibfk_2` FOREIGN KEY (`Club`) REFERENCES `club` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `request_sponsorship_ibfk_1` FOREIGN KEY (`Panel_ID`) REFERENCES `registered_member` (`Member_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
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
