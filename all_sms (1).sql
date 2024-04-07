-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 06, 2024 at 05:12 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `all_sms`
--

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_name` varchar(99) DEFAULT NULL,
  `class_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `created_by` bigint(20) NOT NULL,
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_by` bigint(20) DEFAULT NULL,
  `row_status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `class_name`, `class_type_id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `row_status`) VALUES
(1, 'I', 1, '2024-03-23 23:30:10', 0, NULL, NULL, 1),
(2, 'II', 1, '2024-03-23 23:30:10', 0, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `class_section_allocation`
--

CREATE TABLE `class_section_allocation` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_id` bigint(20) UNSIGNED DEFAULT NULL,
  `section_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `created_by` bigint(20) NOT NULL,
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_by` bigint(20) DEFAULT NULL,
  `row_status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `class_section_allocation`
--

INSERT INTO `class_section_allocation` (`id`, `class_id`, `section_id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `row_status`) VALUES
(1, 1, 1, '2024-03-23 23:31:21', 0, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `class_subject_allocation`
--

CREATE TABLE `class_subject_allocation` (
  `id` int(11) NOT NULL,
  `medium_id` bigint(20) NOT NULL,
  `class_id` bigint(20) NOT NULL,
  `subject_id` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` bigint(20) NOT NULL,
  `row_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `class_types`
--

CREATE TABLE `class_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `label` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `created_by` bigint(20) NOT NULL,
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_by` bigint(20) DEFAULT NULL,
  `row_status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `class_types`
--

INSERT INTO `class_types` (`id`, `label`, `created_at`, `created_by`, `updated_at`, `updated_by`, `row_status`) VALUES
(1, 'Nursery', '2024-03-23 23:31:40', 0, NULL, NULL, 1),
(2, 'Primary', '2024-03-23 23:31:40', 0, NULL, NULL, 1),
(3, 'Secondary', '2024-03-23 23:31:40', 0, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `id` int(11) NOT NULL,
  `exam_name` varchar(255) NOT NULL,
  `exam_marks` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_by` bigint(20) NOT NULL,
  `row_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`id`, `exam_name`, `exam_marks`, `created_at`, `created_by`, `updated_at`, `updated_by`, `row_status`) VALUES
(1, '1ST Term', '30', '2024-04-05 15:15:31', 0, NULL, 0, 0),
(2, '2ND Term', '40', '2024-04-05 15:15:44', 0, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `fees_details`
--

CREATE TABLE `fees_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fees_header_id` bigint(20) UNSIGNED DEFAULT NULL,
  `class_id` bigint(20) UNSIGNED DEFAULT NULL,
  `fees_title` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `created_by` bigint(20) NOT NULL,
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_by` bigint(20) DEFAULT NULL,
  `row_status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fees_details`
--

INSERT INTO `fees_details` (`id`, `fees_header_id`, `class_id`, `fees_title`, `created_at`, `created_by`, `updated_at`, `updated_by`, `row_status`) VALUES
(1, 2, 1, 'TRANSFER FEES', '2024-03-23 23:32:05', 0, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `fees_headers`
--

CREATE TABLE `fees_headers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fees_type` varchar(255) DEFAULT NULL,
  `profit_loss_balance_sheet` int(10) DEFAULT NULL COMMENT 'Profit & Loss = ''0''  and  Balance Sheet = "1"',
  `profit_loss_balance_sheet_part` int(10) DEFAULT NULL COMMENT 'Profit &  Loss - Income -( 0,0) / Profit &  Loss - Exp -( 0,1)   AND   Balance Sheet - Assets - (1,2) /  Balance Sheet - Liabilities - (1,3)',
  `created_at` datetime DEFAULT current_timestamp(),
  `created_by` bigint(20) NOT NULL,
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_by` bigint(20) DEFAULT NULL,
  `row_status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fees_headers`
--

INSERT INTO `fees_headers` (`id`, `fees_type`, `profit_loss_balance_sheet`, `profit_loss_balance_sheet_part`, `created_at`, `created_by`, `updated_at`, `updated_by`, `row_status`) VALUES
(1, 'New Admission', 5, 4, '2024-03-23 23:32:19', 0, NULL, NULL, 1),
(2, 'Monthly', 5, 5, '2024-03-23 23:32:19', 0, NULL, NULL, 1),
(3, 'Yearly', NULL, NULL, '2024-03-23 23:32:19', 0, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `grace_percent` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_by` bigint(20) NOT NULL,
  `row_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`id`, `name`, `grace_percent`, `created_at`, `created_by`, `updated_at`, `updated_by`, `row_status`) VALUES
(1, 'A+', 80, '2024-04-05 15:20:28', 0, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `master_cities`
--

CREATE TABLE `master_cities` (
  `id` int(11) NOT NULL,
  `state_id` bigint(20) DEFAULT NULL,
  `city_name` varchar(100) NOT NULL,
  `city_code` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `row_status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `master_cities`
--

INSERT INTO `master_cities` (`id`, `state_id`, `city_name`, `city_code`, `created_at`, `created_by`, `updated_at`, `updated_by`, `row_status`) VALUES
(1, 32, 'North and Middle Andaman', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(2, 32, 'South Andaman', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(3, 32, 'Nicobar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(4, 1, 'Adilabad', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(5, 1, 'Anantapur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(6, 1, 'Chittoor', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(7, 1, 'East Godavari', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(8, 1, 'Guntur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(9, 1, 'Hyderabad', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(10, 1, 'Kadapa', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(11, 1, 'Karimnagar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(12, 1, 'Khammam', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(13, 1, 'Krishna', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(14, 1, 'Kurnool', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(15, 1, 'Mahbubnagar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(16, 1, 'Medak', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(17, 1, 'Nalgonda', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(18, 1, 'Nellore', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(19, 1, 'Nizamabad', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(20, 1, 'Prakasam', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(21, 1, 'Rangareddi', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(22, 1, 'Srikakulam', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(23, 1, 'Vishakhapatnam', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(24, 1, 'Vizianagaram', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(25, 1, 'Warangal', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(26, 1, 'West Godavari', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(27, 3, 'Anjaw', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(28, 3, 'Changlang', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(29, 3, 'East Kameng', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(30, 3, 'Lohit', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(31, 3, 'Lower Subansiri', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(32, 3, 'Papum Pare', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(33, 3, 'Tirap', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(34, 3, 'Dibang Valley', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(35, 3, 'Upper Subansiri', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(36, 3, 'West Kameng', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(37, 2, 'Barpeta', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(38, 2, 'Bongaigaon', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(39, 2, 'Cachar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(40, 2, 'Darrang', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(41, 2, 'Dhemaji', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(42, 2, 'Dhubri', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(43, 2, 'Dibrugarh', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(44, 2, 'Goalpara', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(45, 2, 'Golaghat', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(46, 2, 'Hailakandi', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(47, 2, 'Jorhat', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(48, 2, 'Karbi Anglong', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(49, 2, 'Karimganj', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(50, 2, 'Kokrajhar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(51, 2, 'Lakhimpur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(52, 2, 'Marigaon', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(53, 2, 'Nagaon', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(54, 2, 'Nalbari', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(55, 2, 'North Cachar Hills', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(56, 2, 'Sibsagar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(57, 2, 'Sonitpur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(58, 2, 'Tinsukia', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(59, 4, 'Araria', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(60, 4, 'Aurangabad', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(61, 4, 'Banka', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(62, 4, 'Begusarai', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(63, 4, 'Bhagalpur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(64, 4, 'Bhojpur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(65, 4, 'Buxar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(66, 4, 'Darbhanga', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(67, 4, 'Purba Champaran', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(68, 4, 'Gaya', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(69, 4, 'Gopalganj', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(70, 4, 'Jamui', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(71, 4, 'Jehanabad', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(72, 4, 'Khagaria', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(73, 4, 'Kishanganj', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(74, 4, 'Kaimur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(75, 4, 'Katihar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(76, 4, 'Lakhisarai', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(77, 4, 'Madhubani', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(78, 4, 'Munger', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(79, 4, 'Madhepura', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(80, 4, 'Muzaffarpur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(81, 4, 'Nalanda', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(82, 4, 'Nawada', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(83, 4, 'Patna', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(84, 4, 'Purnia', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(85, 4, 'Rohtas', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(86, 4, 'Saharsa', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(87, 4, 'Samastipur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(88, 4, 'Sheohar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(89, 4, 'Sheikhpura', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(90, 4, 'Saran', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(91, 4, 'Sitamarhi', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(92, 4, 'Supaul', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(93, 4, 'Siwan', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(94, 4, 'Vaishali', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(95, 4, 'Pashchim Champaran', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(96, 36, 'Bastar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(97, 36, 'Bilaspur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(98, 36, 'Dantewada', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(99, 36, 'Dhamtari', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(100, 36, 'Durg', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(101, 36, 'Jashpur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(102, 36, 'Janjgir-Champa', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(103, 36, 'Korba', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(104, 36, 'Koriya', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(105, 36, 'Kanker', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(106, 36, 'Kawardha', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(107, 36, 'Mahasamund', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(108, 36, 'Raigarh', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(109, 36, 'Rajnandgaon', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(110, 36, 'Raipur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(111, 36, 'Surguja', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(112, 29, 'Diu', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(113, 29, 'Daman', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(114, 25, 'Central Delhi', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(115, 25, 'East Delhi', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(116, 25, 'New Delhi', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(117, 25, 'North Delhi', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(118, 25, 'North East Delhi', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(119, 25, 'North West Delhi', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(120, 25, 'South Delhi', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(121, 25, 'South West Delhi', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(122, 25, 'West Delhi', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(123, 26, 'North Goa', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(124, 26, 'South Goa', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(125, 5, 'Ahmedabad', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(126, 5, 'Amreli District', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(127, 5, 'Anand', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(128, 5, 'Banaskantha', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(129, 5, 'Bharuch', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(130, 5, 'Bhavnagar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(131, 5, 'Dahod', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(132, 5, 'The Dangs', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(133, 5, 'Gandhinagar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(134, 5, 'Jamnagar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(135, 5, 'Junagadh', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(136, 5, 'Kutch', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(137, 5, 'Kheda', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(138, 5, 'Mehsana', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(139, 5, 'Narmada', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(140, 5, 'Navsari', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(141, 5, 'Patan', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(142, 5, 'Panchmahal', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(143, 5, 'Porbandar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(144, 5, 'Rajkot', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(145, 5, 'Sabarkantha', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(146, 5, 'Surendranagar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(147, 5, 'Surat', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(148, 5, 'Vadodara', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(149, 5, 'Valsad', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(150, 6, 'Ambala', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(151, 6, 'Bhiwani', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(152, 6, 'Faridabad', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(153, 6, 'Fatehabad', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(154, 6, 'Gurgaon', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(155, 6, 'Hissar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(156, 6, 'Jhajjar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(157, 6, 'Jind', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(158, 6, 'Karnal', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(159, 6, 'Kaithal', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(160, 6, 'Kurukshetra', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(161, 6, 'Mahendragarh', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(162, 6, 'Mewat', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(163, 6, 'Panchkula', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(164, 6, 'Panipat', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(165, 6, 'Rewari', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(166, 6, 'Rohtak', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(167, 6, 'Sirsa', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(168, 6, 'Sonepat', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(169, 6, 'Yamuna Nagar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(170, 6, 'Palwal', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(171, 7, 'Bilaspur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(172, 7, 'Chamba', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(173, 7, 'Hamirpur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(174, 7, 'Kangra', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(175, 7, 'Kinnaur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(176, 7, 'Kulu', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(177, 7, 'Lahaul and Spiti', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(178, 7, 'Mandi', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(179, 7, 'Shimla', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(180, 7, 'Sirmaur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(181, 7, 'Solan', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(182, 7, 'Una', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(183, 8, 'Anantnag', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(184, 8, 'Badgam', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(185, 8, 'Bandipore', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(186, 8, 'Baramula', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(187, 8, 'Doda', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(188, 8, 'Jammu', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(189, 8, 'Kargil', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(190, 8, 'Kathua', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(191, 8, 'Kupwara', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(192, 8, 'Leh', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(193, 8, 'Poonch', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(194, 8, 'Pulwama', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(195, 8, 'Rajauri', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(196, 8, 'Srinagar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(197, 8, 'Samba', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(198, 8, 'Udhampur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(199, 34, 'Bokaro', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(200, 34, 'Chatra', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(201, 34, 'Deoghar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(202, 34, 'Dhanbad', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(203, 34, 'Dumka', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(204, 34, 'Purba Singhbhum', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(205, 34, 'Garhwa', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(206, 34, 'Giridih', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(207, 34, 'Godda', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(208, 34, 'Gumla', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(209, 34, 'Hazaribagh', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(210, 34, 'Koderma', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(211, 34, 'Lohardaga', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(212, 34, 'Pakur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(213, 34, 'Palamu', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(214, 34, 'Ranchi', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(215, 34, 'Sahibganj', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(216, 34, 'Seraikela and Kharsawan', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(217, 34, 'Pashchim Singhbhum', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(218, 34, 'Ramgarh', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(219, 9, 'Bidar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(220, 9, 'Belgaum', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(221, 9, 'Bijapur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(222, 9, 'Bagalkot', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(223, 9, 'Bellary', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(224, 9, 'Bangalore Rural District', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(225, 9, 'Bangalore Urban District', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(226, 9, 'Chamarajnagar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(227, 9, 'Chikmagalur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(228, 9, 'Chitradurga', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(229, 9, 'Davanagere', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(230, 9, 'Dharwad', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(231, 9, 'Dakshina Kannada', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(232, 9, 'Gadag', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(233, 9, 'Gulbarga', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(234, 9, 'Hassan', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(235, 9, 'Haveri District', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(236, 9, 'Kodagu', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(237, 9, 'Kolar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(238, 9, 'Koppal', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(239, 9, 'Mandya', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(240, 9, 'Mysore', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(241, 9, 'Raichur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(242, 9, 'Shimoga', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(243, 9, 'Tumkur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(244, 9, 'Udupi', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(245, 9, 'Uttara Kannada', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(246, 9, 'Ramanagara', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(247, 9, 'Chikballapur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(248, 9, 'Yadagiri', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(249, 10, 'Alappuzha', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(250, 10, 'Ernakulam', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(251, 10, 'Idukki', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(252, 10, 'Kollam', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(253, 10, 'Kannur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(254, 10, 'Kasaragod', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(255, 10, 'Kottayam', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(256, 10, 'Kozhikode', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(257, 10, 'Malappuram', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(258, 10, 'Palakkad', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(259, 10, 'Pathanamthitta', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(260, 10, 'Thrissur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(261, 10, 'Thiruvananthapuram', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(262, 10, 'Wayanad', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(263, 11, 'Alirajpur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(264, 11, 'Anuppur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(265, 11, 'Ashok Nagar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(266, 11, 'Balaghat', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(267, 11, 'Barwani', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(268, 11, 'Betul', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(269, 11, 'Bhind', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(270, 11, 'Bhopal', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(271, 11, 'Burhanpur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(272, 11, 'Chhatarpur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(273, 11, 'Chhindwara', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(274, 11, 'Damoh', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(275, 11, 'Datia', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(276, 11, 'Dewas', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(277, 11, 'Dhar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(278, 11, 'Dindori', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(279, 11, 'Guna', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(280, 11, 'Gwalior', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(281, 11, 'Harda', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(282, 11, 'Hoshangabad', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(283, 11, 'Indore', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(284, 11, 'Jabalpur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(285, 11, 'Jhabua', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(286, 11, 'Katni', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(287, 11, 'Khandwa', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(288, 11, 'Khargone', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(289, 11, 'Mandla', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(290, 11, 'Mandsaur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(291, 11, 'Morena', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(292, 11, 'Narsinghpur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(293, 11, 'Neemuch', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(294, 11, 'Panna', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(295, 11, 'Rewa', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(296, 11, 'Rajgarh', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(297, 11, 'Ratlam', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(298, 11, 'Raisen', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(299, 11, 'Sagar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(300, 11, 'Satna', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(301, 11, 'Sehore', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(302, 11, 'Seoni', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(303, 11, 'Shahdol', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(304, 11, 'Shajapur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(305, 11, 'Sheopur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(306, 11, 'Shivpuri', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(307, 11, 'Sidhi', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(308, 11, 'Singrauli', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(309, 11, 'Tikamgarh', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(310, 11, 'Ujjain', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(311, 11, 'Umaria', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(312, 11, 'Vidisha', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(313, 12, 'Ahmednagar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(314, 12, 'Akola', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(315, 12, 'Amrawati', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(316, 12, 'Aurangabad', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(317, 12, 'Bhandara', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(318, 12, 'Beed', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(319, 12, 'Buldhana', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(320, 12, 'Chandrapur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(321, 12, 'Dhule', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(322, 12, 'Gadchiroli', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(323, 12, 'Gondiya', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(324, 12, 'Hingoli', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(325, 12, 'Jalgaon', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(326, 12, 'Jalna', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(327, 12, 'Kolhapur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(328, 12, 'Latur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(329, 12, 'Mumbai City', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(330, 12, 'Mumbai suburban', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(331, 12, 'Nandurbar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(332, 12, 'Nanded', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(333, 12, 'Nagpur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(334, 12, 'Nashik', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(335, 12, 'Osmanabad', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(336, 12, 'Parbhani', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(337, 12, 'Pune', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(338, 12, 'Raigad', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(339, 12, 'Ratnagiri', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(340, 12, 'Sindhudurg', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(341, 12, 'Sangli', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(342, 12, 'Solapur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(343, 12, 'Satara', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(344, 12, 'Thane', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(345, 12, 'Wardha', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(346, 12, 'Washim', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(347, 12, 'Yavatmal', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(348, 13, 'Bishnupur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(349, 13, 'Churachandpur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(350, 13, 'Chandel', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(351, 13, 'Imphal East', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(352, 13, 'Senapati', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(353, 13, 'Tamenglong', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(354, 13, 'Thoubal', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(355, 13, 'Ukhrul', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(356, 13, 'Imphal West', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(357, 14, 'East Garo Hills', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(358, 14, 'East Khasi Hills', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(359, 14, 'Jaintia Hills', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(360, 14, 'Ri-Bhoi', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(361, 14, 'South Garo Hills', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(362, 14, 'West Garo Hills', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(363, 14, 'West Khasi Hills', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(364, 15, 'Aizawl', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(365, 15, 'Champhai', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(366, 15, 'Kolasib', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(367, 15, 'Lawngtlai', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(368, 15, 'Lunglei', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(369, 15, 'Mamit', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(370, 15, 'Saiha', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(371, 15, 'Serchhip', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(372, 16, 'Dimapur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(373, 16, 'Kohima', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(374, 16, 'Mokokchung', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(375, 16, 'Mon', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(376, 16, 'Phek', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(377, 16, 'Tuensang', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(378, 16, 'Wokha', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(379, 16, 'Zunheboto', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(380, 17, 'Angul', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(381, 17, 'Boudh', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(382, 17, 'Bhadrak', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(383, 17, 'Bolangir', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(384, 17, 'Bargarh', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(385, 17, 'Baleswar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(386, 17, 'Cuttack', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(387, 17, 'Debagarh', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(388, 17, 'Dhenkanal', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(389, 17, 'Ganjam', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(390, 17, 'Gajapati', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(391, 17, 'Jharsuguda', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(392, 17, 'Jajapur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(393, 17, 'Jagatsinghpur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(394, 17, 'Khordha', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(395, 17, 'Kendujhar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(396, 17, 'Kalahandi', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(397, 17, 'Kandhamal', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(398, 17, 'Koraput', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(399, 17, 'Kendrapara', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(400, 17, 'Malkangiri', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(401, 17, 'Mayurbhanj', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(402, 17, 'Nabarangpur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(403, 17, 'Nuapada', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(404, 17, 'Nayagarh', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(405, 17, 'Puri', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(406, 17, 'Rayagada', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(407, 17, 'Sambalpur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(408, 17, 'Subarnapur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(409, 17, 'Sundargarh', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(410, 27, 'Karaikal', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(411, 27, 'Mahe', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(412, 27, 'Puducherry', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(413, 27, 'Yanam', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(414, 18, 'Amritsar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(415, 18, 'Bathinda', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(416, 18, 'Firozpur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(417, 18, 'Faridkot', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(418, 18, 'Fatehgarh Sahib', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(419, 18, 'Gurdaspur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(420, 18, 'Hoshiarpur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(421, 18, 'Jalandhar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(422, 18, 'Kapurthala', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(423, 18, 'Ludhiana', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(424, 18, 'Mansa', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(425, 18, 'Moga', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(426, 18, 'Mukatsar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(427, 18, 'Nawan Shehar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(428, 18, 'Patiala', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(429, 18, 'Rupnagar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(430, 18, 'Sangrur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(431, 19, 'Ajmer', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(432, 19, 'Alwar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(433, 19, 'Bikaner', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(434, 19, 'Barmer', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(435, 19, 'Banswara', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(436, 19, 'Bharatpur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(437, 19, 'Baran', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(438, 19, 'Bundi', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(439, 19, 'Bhilwara', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(440, 19, 'Churu', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(441, 19, 'Chittorgarh', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(442, 19, 'Dausa', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(443, 19, 'Dholpur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(444, 19, 'Dungapur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(445, 19, 'Ganganagar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(446, 19, 'Hanumangarh', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(447, 19, 'Juhnjhunun', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(448, 19, 'Jalore', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(449, 19, 'Jodhpur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(450, 19, 'Jaipur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(451, 19, 'Jaisalmer', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(452, 19, 'Jhalawar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(453, 19, 'Karauli', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(454, 19, 'Kota', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(455, 19, 'Nagaur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(456, 19, 'Pali', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(457, 19, 'Pratapgarh', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(458, 19, 'Rajsamand', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(459, 19, 'Sikar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(460, 19, 'Sawai Madhopur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(461, 19, 'Sirohi', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(462, 19, 'Tonk', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(463, 19, 'Udaipur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(464, 20, 'East Sikkim', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(465, 20, 'North Sikkim', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(466, 20, 'South Sikkim', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(467, 20, 'West Sikkim', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(468, 21, 'Ariyalur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(469, 21, 'Chennai', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(470, 21, 'Coimbatore', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(471, 21, 'Cuddalore', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(472, 21, 'Dharmapuri', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(473, 21, 'Dindigul', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(474, 21, 'Erode', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(475, 21, 'Kanchipuram', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(476, 21, 'Kanyakumari', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(477, 21, 'Karur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(478, 21, 'Madurai', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(479, 21, 'Nagapattinam', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(480, 21, 'The Nilgiris', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(481, 21, 'Namakkal', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(482, 21, 'Perambalur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(483, 21, 'Pudukkottai', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(484, 21, 'Ramanathapuram', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(485, 21, 'Salem', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(486, 21, 'Sivagangai', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(487, 21, 'Tiruppur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(488, 21, 'Tiruchirappalli', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(489, 21, 'Theni', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(490, 21, 'Tirunelveli', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(491, 21, 'Thanjavur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(492, 21, 'Thoothukudi', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(493, 21, 'Thiruvallur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(494, 21, 'Thiruvarur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(495, 21, 'Tiruvannamalai', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(496, 21, 'Vellore', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(497, 21, 'Villupuram', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(498, 22, 'Dhalai', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(499, 22, 'North Tripura', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(500, 22, 'South Tripura', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(501, 22, 'West Tripura', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(502, 33, 'Almora', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(503, 33, 'Bageshwar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(504, 33, 'Chamoli', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(505, 33, 'Champawat', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(506, 33, 'Dehradun', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(507, 33, 'Haridwar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(508, 33, 'Nainital', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(509, 33, 'Pauri Garhwal', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(510, 33, 'Pithoragharh', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(511, 33, 'Rudraprayag', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(512, 33, 'Tehri Garhwal', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(513, 33, 'Udham Singh Nagar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(514, 33, 'Uttarkashi', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(515, 23, 'Agra', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(516, 23, 'Allahabad', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(517, 23, 'Aligarh', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(518, 23, 'Ambedkar Nagar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(519, 23, 'Auraiya', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(520, 23, 'Azamgarh', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(521, 23, 'Barabanki', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(522, 23, 'Badaun', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(523, 23, 'Bagpat', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(524, 23, 'Bahraich', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(525, 23, 'Bijnor', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(526, 23, 'Ballia', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(527, 23, 'Banda', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(528, 23, 'Balrampur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(529, 23, 'Bareilly', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(530, 23, 'Basti', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(531, 23, 'Bulandshahr', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(532, 23, 'Chandauli', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(533, 23, 'Chitrakoot', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(534, 23, 'Deoria', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(535, 23, 'Etah', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(536, 23, 'Kanshiram Nagar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(537, 23, 'Etawah', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(538, 23, 'Firozabad', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(539, 23, 'Farrukhabad', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(540, 23, 'Fatehpur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(541, 23, 'Faizabad', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(542, 23, 'Gautam Buddha Nagar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(543, 23, 'Gonda', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(544, 23, 'Ghazipur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(545, 23, 'Gorkakhpur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(546, 23, 'Ghaziabad', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(547, 23, 'Hamirpur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(548, 23, 'Hardoi', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(549, 23, 'Mahamaya Nagar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(550, 23, 'Jhansi', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(551, 23, 'Jalaun', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(552, 23, 'Jyotiba Phule Nagar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(553, 23, 'Jaunpur District', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(554, 23, 'Kanpur Dehat', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(555, 23, 'Kannauj', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(556, 23, 'Kanpur Nagar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(557, 23, 'Kaushambi', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(558, 23, 'Kushinagar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(559, 23, 'Lalitpur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(560, 23, 'Lakhimpur Kheri', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(561, 23, 'Lucknow', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(562, 23, 'Mau', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(563, 23, 'Meerut', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(564, 23, 'Maharajganj', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(565, 23, 'Mahoba', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(566, 23, 'Mirzapur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(567, 23, 'Moradabad', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(568, 23, 'Mainpuri', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(569, 23, 'Mathura', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(570, 23, 'Muzaffarnagar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(571, 23, 'Pilibhit', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(572, 23, 'Pratapgarh', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(573, 23, 'Rampur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(574, 23, 'Rae Bareli', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(575, 23, 'Saharanpur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(576, 23, 'Sitapur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(577, 23, 'Shahjahanpur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(578, 23, 'Sant Kabir Nagar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(579, 23, 'Siddharthnagar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(580, 23, 'Sonbhadra', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(581, 23, 'Sant Ravidas Nagar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(582, 23, 'Sultanpur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(583, 23, 'Shravasti', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(584, 23, 'Unnao', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(585, 23, 'Varanasi', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(586, 24, 'Birbhum', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(587, 24, 'Bankura', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(588, 24, 'Bardhaman', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(589, 24, 'Darjeeling', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(590, 24, 'Dakshin Dinajpur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(591, 24, 'Hooghly', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(592, 24, 'Howrah', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(593, 24, 'Jalpaiguri', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(594, 24, 'Cooch Behar', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(595, 24, 'Kolkata', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(596, 24, 'Malda', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(597, 24, 'Midnapore', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(598, 24, 'Murshidabad', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(599, 24, 'Nadia', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(600, 24, 'North 24 Parganas', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(601, 24, 'South 24 Parganas', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(602, 24, 'Purulia', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1),
(603, 24, 'Uttar Dinajpur', '', '2024-01-10 10:55:03', 0, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `master_holiday_list`
--

CREATE TABLE `master_holiday_list` (
  `id` bigint(20) NOT NULL,
  `hl_date` date NOT NULL,
  `hl_description` varchar(255) NOT NULL,
  `row_status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `master_holiday_list`
--

INSERT INTO `master_holiday_list` (`id`, `hl_date`, `hl_description`, `row_status`) VALUES
(1, '2023-01-23', 'Netaji Subhas Birthday', 1),
(2, '2023-01-26', 'Republic Day', 1),
(3, '2023-03-07', 'Dol Yatra', 1),
(4, '2023-03-08', 'Holi', 1),
(5, '2023-05-01', 'May Day', 1),
(6, '2023-08-15', 'Independence Day', 1),
(7, '2023-10-02', 'Mahatma Gandhi Birthday', 1),
(8, '2023-10-23', 'Navami', 1),
(9, '2023-10-24', 'Dasami', 1),
(10, '2023-11-15', 'Bhaidooj', 1);

-- --------------------------------------------------------

--
-- Table structure for table `master_menu`
--

CREATE TABLE `master_menu` (
  `id` bigint(20) NOT NULL,
  `menu_module` enum('Master','Ticket','Hardware','Report','Messaging','Change_management','User','Student','Teacher') NOT NULL,
  `menu_name` varchar(222) NOT NULL,
  `menu_slug` varchar(222) NOT NULL,
  `show_on_left_nav` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `row_status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `master_menu`
--

INSERT INTO `master_menu` (`id`, `menu_module`, `menu_name`, `menu_slug`, `show_on_left_nav`, `created_at`, `updated_at`, `row_status`) VALUES
(1, 'Master', 'State', 'state', 1, '2023-12-01 15:20:29', '2023-12-01 15:25:44', 1),
(2, 'Master', 'City', 'city', 1, '2023-12-01 15:20:29', '2023-12-01 15:25:48', 1),
(3, 'Master', 'Fees Header', 'fees-header', 1, '2023-12-01 15:20:29', '2024-03-23 16:52:57', 1),
(4, 'Master', 'Fees Details', 'fees-details', 1, '2023-12-01 15:20:29', '2024-03-23 18:08:04', 1),
(13, 'Master', 'Holiday', 'holiday-list', 1, '2023-12-01 15:33:21', '2023-12-02 13:55:13', 1),
(23, 'Report', 'User report', 'report-user', 0, '2023-12-01 16:38:03', '2024-02-01 05:13:40', 1),
(24, 'User', 'User List', 'user-list', 1, '2023-12-03 16:11:01', '2024-01-11 06:34:31', 1),
(25, 'User', 'User Edit', 'user-edit', 0, '2023-12-03 16:11:01', '2024-01-11 06:47:48', 1),
(33, 'User', 'User Add', 'user-add', 0, '2023-12-03 16:11:01', '2024-01-11 06:47:28', 1),
(34, 'User', 'Profile', 'user-profile', 1, '2023-12-03 16:11:01', '2024-01-11 06:35:57', 1),
(35, 'Master', 'Class Type', 'class-type', 1, '2023-12-01 15:20:29', '2024-03-23 16:52:57', 1),
(36, 'Master', 'class', 'class', 1, '2023-12-01 15:20:29', '2024-03-23 16:52:57', 1),
(37, 'Master', 'section', 'section', 1, '2023-12-01 15:20:29', '2024-03-23 16:52:57', 1),
(38, 'Master', 'Section Allocation', 'section-allocation', 1, '2023-12-01 15:20:29', '2024-03-23 16:52:57', 1),
(39, 'Student', 'Student', 'student-details', 1, '2023-12-01 15:20:29', '2024-03-23 18:28:26', 1),
(40, 'Student', 'Parent', 'parent-details', 1, '2023-12-01 15:20:29', '2024-03-23 18:28:26', 1),
(41, 'Master', 'Medium', 'medium', 1, '2024-04-05 14:09:53', NULL, 1),
(42, 'Master', 'Subjects', 'subjects', 1, '2024-04-05 14:30:23', NULL, 1),
(43, 'Master', 'Subject Allocation', 'subject-allocation', 1, '2024-04-05 14:45:52', '2024-04-05 14:46:31', 1),
(44, 'Master', 'Exam', 'exams', 1, '2024-04-05 15:10:13', '2024-04-05 15:14:59', 1),
(45, 'Master', 'Grade', 'grades', 1, '2024-04-05 15:10:29', '2024-04-05 15:16:11', 1),
(46, 'Teacher', 'Exam Marks', 'exam-marks', 1, '2024-04-06 13:59:46', '2024-04-06 14:14:28', 1);

-- --------------------------------------------------------

--
-- Table structure for table `master_otp`
--

CREATE TABLE `master_otp` (
  `id` bigint(20) NOT NULL,
  `type` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `otp` varchar(10) NOT NULL,
  `crt_ts` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `master_otp`
--

INSERT INTO `master_otp` (`id`, `type`, `email`, `otp`, `crt_ts`) VALUES
(50, 'forget password', 'oo1@bk.com', '8047', '2024-01-28 17:33:59'),
(51, 'forget password', 'debanjan.chakraborty@baazarkolkata.com', '3951', '2024-02-20 05:19:08');

-- --------------------------------------------------------

--
-- Table structure for table `master_states`
--

CREATE TABLE `master_states` (
  `id` int(11) NOT NULL,
  `state_name` varchar(255) NOT NULL,
  `state_code` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` bigint(20) NOT NULL,
  `row_status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `master_states`
--

INSERT INTO `master_states` (`id`, `state_name`, `state_code`, `created_at`, `created_by`, `updated_at`, `updated_by`, `row_status`) VALUES
(1, 'ANDHRA PRADESH', '', '2024-01-10 16:22:43', 0, '2024-01-10 16:22:43', 0, 1),
(2, 'ASSAM', '', '2024-01-10 16:22:43', 0, '2024-01-10 16:22:43', 0, 1),
(3, 'ARUNACHAL PRADESH', '', '2024-01-10 16:22:43', 0, '2024-01-10 16:22:43', 0, 1),
(4, 'BIHAR', '', '2024-01-10 16:22:43', 0, '2024-01-10 16:22:43', 0, 1),
(5, 'GUJRAT', '', '2024-01-10 16:22:43', 0, '2024-01-10 16:22:43', 0, 1),
(6, 'HARYANA', '', '2024-01-10 16:22:43', 0, '2024-01-10 16:22:43', 0, 1),
(7, 'HIMACHAL PRADESH', '', '2024-01-10 16:22:43', 0, '2024-01-10 16:22:43', 0, 1),
(8, 'JAMMU & KASHMIR', '', '2024-01-10 16:22:43', 0, '2024-01-10 16:22:43', 0, 1),
(9, 'KARNATAKA', '', '2024-01-10 16:22:43', 0, '2024-01-10 16:22:43', 0, 1),
(10, 'KERALA', '', '2024-01-10 16:22:43', 0, '2024-01-10 16:22:43', 0, 1),
(11, 'MADHYA PRADESH', '', '2024-01-10 16:22:43', 0, '2024-01-10 16:22:43', 0, 1),
(12, 'MAHARASHTRA', '', '2024-01-10 16:22:43', 0, '2024-01-10 16:22:43', 0, 1),
(13, 'MANIPUR', '', '2024-01-10 16:22:43', 0, '2024-01-10 16:22:43', 0, 1),
(14, 'MEGHALAYA', '', '2024-01-10 16:22:43', 0, '2024-01-10 16:22:43', 0, 1),
(15, 'MIZORAM', '', '2024-01-10 16:22:43', 0, '2024-01-10 16:22:43', 0, 1),
(16, 'NAGALAND', '', '2024-01-10 16:22:43', 0, '2024-01-10 16:22:43', 0, 1),
(17, 'ORISSA', '', '2024-01-10 16:22:43', 0, '2024-01-10 16:22:43', 0, 1),
(18, 'PUNJAB', '', '2024-01-10 16:22:43', 0, '2024-01-10 16:22:43', 0, 1),
(19, 'RAJASTHAN', '', '2024-01-10 16:22:43', 0, '2024-01-10 16:22:43', 0, 1),
(20, 'SIKKIM', '', '2024-01-10 16:22:43', 0, '2024-01-10 16:22:43', 0, 1),
(21, 'TAMIL NADU', '', '2024-01-10 16:22:43', 0, '2024-01-10 16:22:43', 0, 1),
(22, 'TRIPURA', '', '2024-01-10 16:22:43', 0, '2024-01-10 16:22:43', 0, 1),
(23, 'UTTAR PRADESH', '', '2024-01-10 16:22:43', 0, '2024-01-10 16:22:43', 0, 1),
(24, 'WEST BENGAL', '', '2024-01-10 16:22:43', 0, '2024-01-10 16:22:43', 0, 1),
(25, 'DELHI', '', '2024-01-10 16:22:43', 0, '2024-01-10 16:22:43', 0, 1),
(26, 'GOA', '', '2024-01-10 16:22:43', 0, '2024-01-10 16:22:43', 0, 1),
(27, 'PONDICHERY', '', '2024-01-10 16:22:43', 0, '2024-01-10 16:22:43', 0, 1),
(28, 'LAKSHDWEEP', '', '2024-01-10 16:22:43', 0, '2024-01-10 16:22:43', 0, 1),
(29, 'DAMAN & DIU', '', '2024-01-10 16:22:43', 0, '2024-01-10 16:22:43', 0, 1),
(30, 'DADRA & NAGAR', '', '2024-01-10 16:22:43', 0, '2024-01-10 16:22:43', 0, 1),
(31, 'CHANDIGARH', '', '2024-01-10 16:22:43', 0, '2024-01-10 16:22:43', 0, 1),
(32, 'ANDAMAN & NICOBAR', '', '2024-01-10 16:22:43', 0, '2024-01-10 16:22:43', 0, 1),
(33, 'UTTARANCHAL', '', '2024-01-10 16:22:43', 0, '2024-01-10 16:22:43', 0, 1),
(34, 'JHARKHAND', '', '2024-01-10 16:22:43', 0, '2024-01-10 16:22:43', 0, 1),
(35, 'CHATTISGARH', '', '2024-01-10 16:22:43', 0, '2024-01-10 16:22:43', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `medium`
--

CREATE TABLE `medium` (
  `id` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_by` bigint(20) NOT NULL,
  `row_status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medium`
--

INSERT INTO `medium` (`id`, `label`, `created_at`, `created_by`, `updated_at`, `updated_by`, `row_status`) VALUES
(2, 'Bengali', '2024-04-05 14:12:31', 0, NULL, 0, 1),
(3, 'English', '2024-04-05 14:12:41', 0, NULL, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `menu_permission`
--

CREATE TABLE `menu_permission` (
  `mp_id` bigint(20) NOT NULL,
  `master_menu_id` bigint(20) DEFAULT NULL COMMENT 'master_menu tbl',
  `user_id` bigint(20) UNSIGNED NOT NULL COMMENT 'users tbl',
  `block` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'sidenav\r\n1=block, 0=open',
  `action_button_1` int(11) NOT NULL COMMENT 'db actions; add/edit/delete',
  `action_button_2` int(11) NOT NULL COMMENT 'non-db actions;print/download',
  `created_by` bigint(20) UNSIGNED NOT NULL COMMENT 'users tbl',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `row_status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu_permission`
--

INSERT INTO `menu_permission` (`mp_id`, `master_menu_id`, `user_id`, `block`, `action_button_1`, `action_button_2`, `created_by`, `created_at`, `updated_by`, `updated_at`, `row_status`) VALUES
(24754, 31, 2393, 0, 1, 1, 2393, '2024-02-28 06:12:36', NULL, NULL, 1),
(24755, 24, 2393, 0, 1, 1, 2393, '2024-02-28 06:12:36', NULL, NULL, 1),
(24756, 25, 2393, 0, 1, 1, 2393, '2024-02-28 06:12:36', NULL, NULL, 1),
(24757, 33, 2393, 0, 1, 1, 2393, '2024-02-28 06:12:36', NULL, NULL, 1),
(24758, 34, 2393, 0, 1, 1, 2393, '2024-02-28 06:12:36', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `table_pk` bigint(20) DEFAULT NULL COMMENT 'cm_header or ticket_details primary key',
  `to_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `status` varchar(99) DEFAULT NULL,
  `notification_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `notification_end_time` datetime DEFAULT NULL,
  `notification_type` enum('ticket_management','change_management') DEFAULT NULL,
  `read_status` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) NOT NULL,
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_by` bigint(20) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=No 1=Yes',
  `row_status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `table_pk`, `to_user_id`, `title`, `description`, `status`, `notification_time`, `notification_end_time`, `notification_type`, `read_status`, `created_at`, `created_by`, `updated_at`, `updated_by`, `is_deleted`, `row_status`) VALUES
(1, 1, 5396, 'Main title here', 'A change request is generated, in the name of Main title here.<br><b>Quick details: </b><p>In publishing and graphic design, Lorem ipsum is a placeholder text <strong>commonly </strong>used to demonstrate the <em>visual </em>form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available. <a href=\"https://en.wikipedia.org/wiki/Lorem_ipsum\">Wikipedia</a></p>', 'created', '2024-02-14 14:29:26', '2024-02-19 00:00:00', 'change_management', 1, '2024-02-14 19:59:26', 5396, '2024-02-14 07:52:56', NULL, 0, 1),
(2, 1, 5394, 'Main title here', 'A change request is generated, in the name of Main title here.<br><b>Quick details: </b><p>In publishing and graphic design, Lorem ipsum is a placeholder text <strong>commonly </strong>used to demonstrate the <em>visual </em>form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available. <a href=\"https://en.wikipedia.org/wiki/Lorem_ipsum\">Wikipedia</a></p>', 'created', '2024-02-14 14:29:26', '2024-02-19 00:00:00', 'change_management', 1, '2024-02-14 19:59:26', 5396, '2024-02-14 07:53:19', NULL, 0, 1),
(3, 1, 5396, 'Main title here', 'A change request is generated, in the name of Main title here.<br><b>Quick details: </b><p>In publishing and graphic design, Lorem ipsum is a placeholder text <strong>commonly </strong>used to demonstrate the <em>visual </em>form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available. <a href=\"https://en.wikipedia.org/wiki/Lorem_ipsum\">Wikipedia</a></p>', 'created', '2024-02-14 15:02:54', '2024-02-19 00:00:00', 'change_management', 1, '2024-02-14 20:32:54', 5396, '2024-02-17 08:23:31', NULL, 0, 1),
(4, 1, 5394, 'Main title here', 'A change request is generated, in the name of Main title here.<br><b>Quick details: </b><p>In publishing and graphic design, Lorem ipsum is a placeholder text <strong>commonly </strong>used to demonstrate the <em>visual </em>form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available. <a href=\"https://en.wikipedia.org/wiki/Lorem_ipsum\">Wikipedia</a></p>', 'created', '2024-02-14 15:02:54', '2024-02-19 00:00:00', 'change_management', 1, '2024-02-14 20:32:54', 5396, '2024-02-14 08:06:47', NULL, 0, 1),
(5, 1, 5394, 'Main title here', '<b>Main title here</b> is denied.', 'denied', '2024-02-14 15:06:30', '2024-02-19 00:00:00', 'change_management', 1, '2024-02-14 20:36:30', 5394, '2024-02-14 08:06:47', NULL, 0, 1),
(6, 1, 5396, 'Main title here', '<b>Main title here</b> is denied.', 'denied', '2024-02-14 15:06:30', '2024-02-19 00:00:00', 'change_management', 1, '2024-02-14 20:36:30', 5394, '2024-02-17 08:23:31', NULL, 0, 1),
(7, 1, 5394, 'Main title here', '', 'sent_back', '2024-02-14 15:12:11', '2024-02-19 00:00:00', 'change_management', 1, '2024-02-14 20:42:11', 5394, '2024-03-13 10:24:52', NULL, 0, 1),
(8, 1, 5396, 'Main title here', '', 'sent_back', '2024-02-14 15:12:11', '2024-02-19 00:00:00', 'change_management', 1, '2024-02-14 20:42:11', 5394, '2024-02-17 08:23:31', NULL, 0, 1),
(9, 1, 5396, 'Main title here', 'A change request is generated, in the name of Main title here.<br><b>Quick details: </b><p>In publishing and graphic design, Lorem ipsum is a placeholder text <strong>commonly </strong>used to demonstrate the <em>visual </em>form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available. <a href=\"https://en.wikipedia.org/wiki/Lorem_ipsum\">Wikipedia</a></p>', 'created', '2024-02-14 15:12:40', '2024-02-19 00:00:00', 'change_management', 1, '2024-02-14 20:42:40', 5396, '2024-02-17 08:23:31', NULL, 0, 1),
(10, 1, 5394, 'Main title here', 'A change request is generated, in the name of Main title here.<br><b>Quick details: </b><p>In publishing and graphic design, Lorem ipsum is a placeholder text <strong>commonly </strong>used to demonstrate the <em>visual </em>form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available. <a href=\"https://en.wikipedia.org/wiki/Lorem_ipsum\">Wikipedia</a></p>', 'created', '2024-02-14 15:12:40', '2024-02-19 00:00:00', 'change_management', 1, '2024-02-14 20:42:40', 5396, '2024-03-13 10:24:52', NULL, 0, 1),
(11, 1, 5394, 'Main title here', '<b>Main title here</b> is approved.', 'approved', '2024-02-14 15:14:16', '2024-02-19 00:00:00', 'change_management', 1, '2024-02-14 20:44:16', 5394, '2024-03-13 10:24:52', NULL, 0, 1),
(12, 1, 5398, 'Main title here', '<b>Main title here</b> is approved.', 'approved', '2024-02-14 15:14:16', '2024-02-19 00:00:00', 'change_management', 0, '2024-02-14 20:44:16', 5394, '2024-02-14 20:44:16', NULL, 0, 1),
(13, 1, 5398, 'Main title here', '<b>Main title here</b> is approved.', 'approved', '2024-02-14 15:18:37', '2024-02-19 00:00:00', 'change_management', 0, '2024-02-14 20:48:37', 5398, '2024-02-14 20:48:37', NULL, 0, 1),
(14, 1, 5397, 'Main title here', '<b>Main title here</b> is approved.', 'approved', '2024-02-14 15:18:37', '2024-02-19 00:00:00', 'change_management', 0, '2024-02-14 20:48:37', 5398, '2024-02-14 20:48:37', NULL, 0, 1),
(15, 1, 5397, 'Main title here', '<b>Main title here</b> is approved.', 'approved', '2024-02-14 15:19:27', '2024-02-19 00:00:00', 'change_management', 0, '2024-02-14 20:49:27', 5397, '2024-02-14 20:49:27', NULL, 0, 1),
(16, 1, 0, 'Main title here', '<b>Main title here</b> is approved.', 'approved', '2024-02-14 15:19:27', '2024-02-19 00:00:00', 'change_management', 0, '2024-02-14 20:49:27', 5397, '2024-02-14 20:49:27', NULL, 0, 1),
(17, 1, 5396, 'Main title here', '', '', '2024-02-14 15:20:01', '2024-02-19 00:00:00', 'change_management', 1, '2024-02-14 20:50:01', 5396, '2024-02-17 08:23:31', NULL, 0, 1),
(18, 1, 5396, 'Main title here', '', '', '2024-02-14 15:20:40', '2024-02-19 00:00:00', 'change_management', 1, '2024-02-14 20:50:40', 5396, '2024-02-17 08:23:31', NULL, 0, 1),
(19, 1, 5396, 'Main title here', '', '', '2024-02-14 15:20:55', '2024-02-19 00:00:00', 'change_management', 1, '2024-02-14 20:50:55', 5396, '2024-02-17 08:23:31', NULL, 0, 1),
(20, 2, 5394, 'Some title', '', 'sent_back', '2024-02-17 15:22:10', '2024-02-22 00:00:00', 'change_management', 1, '2024-02-17 20:52:10', 5394, '2024-03-13 10:24:52', NULL, 0, 1),
(21, 2, 5396, 'Some title', '', 'sent_back', '2024-02-17 15:22:10', '2024-02-22 00:00:00', 'change_management', 1, '2024-02-17 20:52:10', 5394, '2024-02-17 08:23:31', NULL, 0, 1),
(22, 2, 5396, 'Some title', 'A change request is generated, in the name of Some title.<br><b>Quick details: </b><p>hi</p>', 'created', '2024-02-17 15:25:53', '2024-02-22 00:00:00', 'change_management', 1, '2024-02-17 20:55:53', 5396, '2024-02-23 00:57:33', NULL, 0, 1),
(23, 2, 5394, 'Some title', 'A change request is generated, in the name of Some title.<br><b>Quick details: </b><p>hi</p>', 'created', '2024-02-17 15:25:53', '2024-02-22 00:00:00', 'change_management', 1, '2024-02-17 20:55:53', 5396, '2024-03-13 10:24:52', NULL, 0, 1),
(24, 2, 5396, 'Some title', 'A change request is generated, in the name of Some title.<br><b>Quick details: </b><p>hi</p>', 'created', '2024-02-17 15:27:12', '2024-02-22 00:00:00', 'change_management', 1, '2024-02-17 20:57:12', 5396, '2024-02-23 00:57:33', NULL, 0, 1),
(25, 2, 5394, 'Some title', 'A change request is generated, in the name of Some title.<br><b>Quick details: </b><p>hi</p>', 'created', '2024-02-17 15:27:12', '2024-02-22 00:00:00', 'change_management', 1, '2024-02-17 20:57:12', 5396, '2024-03-13 10:24:52', NULL, 0, 1),
(26, 2, 5396, 'Some title', 'A change request is generated, in the name of Some title.<br><b>Quick details: </b><p>hi</p>', 'created', '2024-02-17 15:31:38', '2024-02-22 00:00:00', 'change_management', 1, '2024-02-17 21:01:38', 5396, '2024-02-23 00:57:33', NULL, 0, 1),
(27, 2, 5394, 'Some title', 'A change request is generated, in the name of Some title.<br><b>Quick details: </b><p>hi</p>', 'created', '2024-02-17 15:31:38', '2024-02-22 00:00:00', 'change_management', 1, '2024-02-17 21:01:38', 5396, '2024-03-13 10:24:52', NULL, 0, 1),
(28, 2, 5394, 'Some title', '<b>Some title</b> is approved.', 'approved', '2024-02-17 15:31:56', '2024-02-22 00:00:00', 'change_management', 1, '2024-02-17 21:01:56', 5394, '2024-03-13 10:24:52', NULL, 0, 1),
(29, 2, 5398, 'Some title', '<b>Some title</b> is approved.', 'approved', '2024-02-17 15:31:56', '2024-02-22 00:00:00', 'change_management', 0, '2024-02-17 21:01:56', 5394, '2024-02-17 21:01:56', NULL, 0, 1),
(30, 28, 5396, 'Ticket Activity', 'Ticket <strong>TIK-SMG-28</strong> In-Progress', 'In-Progress', '2024-03-13 17:00:57', '2024-03-18 00:00:00', 'ticket_management', 0, '2024-03-13 22:30:57', 5395, '2024-03-13 11:27:16', NULL, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `parent_details`
--

CREATE TABLE `parent_details` (
  `id` bigint(20) NOT NULL,
  `student_id` bigint(20) DEFAULT NULL,
  `father_full_name` varchar(120) NOT NULL,
  `father_phone` varchar(120) NOT NULL,
  `father_email` varchar(120) DEFAULT NULL,
  `father_occupation` varchar(120) DEFAULT NULL,
  `father_full_address` text DEFAULT NULL,
  `mother_full_name` varchar(120) NOT NULL,
  `mother_phone` varchar(120) NOT NULL,
  `mother_email` varchar(120) DEFAULT NULL,
  `mother_occupation` varchar(120) DEFAULT NULL,
  `mother_full_address` text DEFAULT NULL,
  `guardian_full_name` varchar(120) DEFAULT NULL,
  `guardian_phone` varchar(120) DEFAULT NULL,
  `guardian_email` varchar(120) DEFAULT NULL,
  `guardian_occupation` varchar(120) DEFAULT NULL,
  `guardian_full_address` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `row_status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `parent_details`
--

INSERT INTO `parent_details` (`id`, `student_id`, `father_full_name`, `father_phone`, `father_email`, `father_occupation`, `father_full_address`, `mother_full_name`, `mother_phone`, `mother_email`, `mother_occupation`, `mother_full_address`, `guardian_full_name`, `guardian_phone`, `guardian_email`, `guardian_occupation`, `guardian_full_address`, `created_at`, `created_by`, `updated_at`, `updated_by`, `row_status`) VALUES
(1, NULL, 'Demo father', '9999999999', '9999999999@hci.com', NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-21 15:24:40', 1, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `section_name` varchar(255) NOT NULL,
  `medium_id` bigint(20) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `created_by` bigint(20) NOT NULL,
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_by` bigint(20) DEFAULT NULL,
  `row_status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `section_name`, `medium_id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `row_status`) VALUES
(1, 'A', 1, '2024-03-23 23:32:37', 0, '2024-03-23 23:42:53', NULL, 1),
(2, 'Section B', 2, '2024-04-05 19:55:19', 0, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `student_details`
--

CREATE TABLE `student_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_id` bigint(20) UNSIGNED DEFAULT NULL,
  `section_id` bigint(20) UNSIGNED DEFAULT NULL,
  `full_name` varchar(120) NOT NULL,
  `roll_number` varchar(120) NOT NULL,
  `registration_number` varchar(120) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `date_of_admission` date DEFAULT NULL,
  `blood_group` enum('A+','A-','B+','B-','O+','O-','AB+','AB-') NOT NULL,
  `gender` enum('Male','Female','Transgender','Other') NOT NULL,
  `aadhar_number` int(200) NOT NULL,
  `bangla_shiksha_id` int(222) NOT NULL,
  `state` bigint(20) NOT NULL,
  `city` bigint(20) NOT NULL,
  `full_address` text NOT NULL,
  `pincode` int(100) NOT NULL,
  `nationality` varchar(50) NOT NULL,
  `religion` varchar(100) NOT NULL,
  `category` enum('General','SC','ST','OBC','EBC') NOT NULL,
  `concession_eligible` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=yes,0=no',
  `rc` tinyint(1) NOT NULL,
  `physically_disabled` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=yes,0=no',
  `last_school` varchar(200) NOT NULL,
  `old_TC_number` varchar(120) NOT NULL,
  `old_TC_date` date DEFAULT NULL,
  `old_school_leaving_date` date DEFAULT NULL,
  `TC_number` varchar(120) NOT NULL,
  `TC_date` date DEFAULT NULL,
  `TC_reason` text NOT NULL,
  `school_leaving_date` date DEFAULT NULL,
  `is_left` int(11) NOT NULL DEFAULT 0 COMMENT '0=no,1=yes',
  `promotion_eligible` tinyint(1) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `session` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL COMMENT 'user table',
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `row_status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_details`
--

INSERT INTO `student_details` (`id`, `class_id`, `section_id`, `full_name`, `roll_number`, `registration_number`, `date_of_birth`, `date_of_admission`, `blood_group`, `gender`, `aadhar_number`, `bangla_shiksha_id`, `state`, `city`, `full_address`, `pincode`, `nationality`, `religion`, `category`, `concession_eligible`, `rc`, `physically_disabled`, `last_school`, `old_TC_number`, `old_TC_date`, `old_school_leaving_date`, `TC_number`, `TC_date`, `TC_reason`, `school_leaving_date`, `is_left`, `promotion_eligible`, `image`, `session`, `created_at`, `created_by`, `updated_by`, `updated_at`, `row_status`) VALUES
(1, 1, 1, 'Demo sudent', '001', '001/2024', NULL, NULL, 'A+', 'Male', 0, 0, 0, 0, '', 0, '', '', 'General', 0, 0, 0, '', '', NULL, NULL, '', NULL, '', NULL, 0, NULL, '', 0, '2024-01-12 13:17:29', 0, 5088, '2024-03-23 21:23:49', 1);

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_by` bigint(20) NOT NULL,
  `row_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `label`, `created_at`, `created_by`, `updated_at`, `updated_by`, `row_status`) VALUES
(1, 'English', '2024-04-05 14:31:46', 0, NULL, 0, 0),
(2, 'Math', '2024-04-05 14:50:48', 0, NULL, 0, 0),
(3, 'Chemistry', '2024-04-05 14:50:54', 0, NULL, 0, 0),
(4, 'Physics', '2024-04-05 14:50:59', 0, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `teacher_details`
--

CREATE TABLE `teacher_details` (
  `id` bigint(20) NOT NULL,
  `category` bigint(20) DEFAULT NULL COMMENT '1=temporary,2=permanent',
  `full_name` varchar(120) NOT NULL,
  `date_of_joining` date DEFAULT NULL,
  `previous_institute` varchar(120) DEFAULT NULL,
  `blood_group` enum('A+','A-','B+','B-','O+','O-','AB+','AB-') DEFAULT NULL,
  `gender` enum('Male','Female','Transgender','Others') NOT NULL,
  `aadhar_number` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `city` int(11) NOT NULL,
  `full_address` text NOT NULL,
  `pincode` int(100) NOT NULL,
  `nationality` varchar(120) NOT NULL,
  `religion` varchar(120) NOT NULL,
  `is_left` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=no,1=yes',
  `school_leaving_date` date DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `row_status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teacher_details`
--

INSERT INTO `teacher_details` (`id`, `category`, `full_name`, `date_of_joining`, `previous_institute`, `blood_group`, `gender`, `aadhar_number`, `state`, `city`, `full_address`, `pincode`, `nationality`, `religion`, `is_left`, `school_leaving_date`, `image`, `created_at`, `created_by`, `updated_at`, `updated_by`, `row_status`) VALUES
(1, NULL, 'Demo Teacher', NULL, NULL, NULL, 'Male', 0, 24, 592, 'Demo full address', 700056, 'Indian', 'Hindu', 0, NULL, NULL, '2024-03-21 15:34:05', 1, '2024-03-21 15:34:11', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_role` int(11) NOT NULL DEFAULT 2 COMMENT '1=admin,2=operator',
  `user_type` int(11) NOT NULL DEFAULT 2 COMMENT 'point to usertype details table',
  `user_detail_id` bigint(20) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `login_attempt` int(11) NOT NULL,
  `blocked` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = opened, 1 = blocked',
  `profile_activation` tinyint(4) NOT NULL DEFAULT 1 COMMENT 'first time login activation',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `row_status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_role`, `user_type`, `user_detail_id`, `username`, `email`, `password`, `login_attempt`, `blocked`, `profile_activation`, `created_at`, `updated_at`, `created_by`, `updated_by`, `row_status`) VALUES
(1, 1, 1, NULL, 'admin', 'sketchmeglobal@gmail.com', '4461a6865d191b75bfce45caa8b9f936517310f04ddebfba2669d7526cff73a4df682d002cf10f52c51e70d904084caa68e81f6a13be67902dd2d5bb778b943d', 0, 0, 1, '2024-01-18 20:34:22', '2024-04-05 19:10:39', 1, NULL, 1),
(2, 2, 5, 1, 'demoparent', 'dp1@hci.com', '4461a6865d191b75bfce45caa8b9f936517310f04ddebfba2669d7526cff73a4df682d002cf10f52c51e70d904084caa68e81f6a13be67902dd2d5bb778b943d', 2, 0, 1, '2024-03-21 20:55:19', '2024-03-22 08:02:04', 1, NULL, 1),
(3, 2, 4, 1, 'demostudent', 'ds1@hci.com', '4461a6865d191b75bfce45caa8b9f936517310f04ddebfba2669d7526cff73a4df682d002cf10f52c51e70d904084caa68e81f6a13be67902dd2d5bb778b943d', 0, 0, 1, '2024-01-18 20:34:22', '2024-03-22 16:00:53', 1, NULL, 1),
(4, 2, 2, 1, 'demoteacher', 'dt1@hci.com', '4461a6865d191b75bfce45caa8b9f936517310f04ddebfba2669d7526cff73a4df682d002cf10f52c51e70d904084caa68e81f6a13be67902dd2d5bb778b943d', 0, 0, 1, '2024-03-21 21:04:33', NULL, 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_activity_logs`
--

CREATE TABLE `user_activity_logs` (
  `id` bigint(20) NOT NULL,
  `target_table` varchar(50) NOT NULL,
  `action_taken` varchar(50) NOT NULL,
  `topic_details` text NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `row_status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_activity_logs`
--

INSERT INTO `user_activity_logs` (`id`, `target_table`, `action_taken`, `topic_details`, `comment`, `user_id`, `created_at`, `row_status`) VALUES
(1, 'users', 'login', '{\"ip\":\"103.170.182.187\",\"browser\":\"Firefox\",\"version\":\"123.0\",\"platform\":\"Windows 10\",\"username\":\"ll\"}', 'Invalid User, please try again.', 0, '2024-03-22 07:17:45', 1),
(2, 'users', 'login', '{\"ip\":\"103.170.182.187\",\"browser\":\"Firefox\",\"version\":\"123.0\",\"platform\":\"Windows 10\",\"username\":\"demoparent\"}', 'Wrong credentials, please try again.', 0, '2024-03-22 07:55:26', 1),
(3, 'users', 'login', '{\"ip\":\"103.170.182.187\",\"browser\":\"Firefox\",\"version\":\"123.0\",\"platform\":\"Windows 10\",\"username\":\"demoparent\"}', 'Wrong credentials, please try again.', 0, '2024-03-22 08:02:04', 1),
(4, 'users', 'login', '{\"ip\":\"103.170.182.187\",\"browser\":\"Firefox\",\"version\":\"123.0\",\"platform\":\"Windows 10\",\"username\":\"ll\"}', 'Invalid User, please try again.', 0, '2024-03-22 16:00:36', 1),
(5, 'users', 'login', '{\"ip\":\"103.170.182.187\",\"browser\":\"Firefox\",\"version\":\"123.0\",\"platform\":\"Windows 10\",\"username\":\"demoportal\"}', 'Invalid User, please try again.', 0, '2024-03-22 16:00:41', 1),
(6, 'users', 'login', '{\"ip\":\"103.170.182.187\",\"browser\":\"Firefox\",\"version\":\"123.0\",\"platform\":\"Windows 10\",\"username\":\"demostudent\"}', 'Wrong credentials, please try again.', 0, '2024-03-22 16:00:46', 1),
(7, 'users', 'login', '{\"ip\":\"103.170.182.187\",\"browser\":\"Firefox\",\"version\":\"123.0\",\"platform\":\"Windows 10\",\"username\":\"admin\"}', 'Wrong credentials, please try again.', 0, '2024-03-23 02:25:51', 1),
(8, 'users', 'login', '{\"ip\":\"103.170.182.187\",\"browser\":\"Firefox\",\"version\":\"123.0\",\"platform\":\"Windows 10\",\"username\":\"admin\"}', 'Wrong credentials, please try again.', 0, '2024-03-23 02:25:56', 1),
(9, 'users', 'login', '{\"ip\":\"103.170.182.187\",\"browser\":\"Firefox\",\"version\":\"123.0\",\"platform\":\"Windows 10\",\"username\":\"adminj\"}', 'Invalid User, please try again.', 0, '2024-03-23 02:58:33', 1),
(10, 'users', 'login', '{\"ip\":\"103.170.182.187\",\"browser\":\"Firefox\",\"version\":\"123.0\",\"platform\":\"Windows 10\",\"username\":\"admin\"}', 'Wrong credentials, please try again.', 0, '2024-03-23 02:58:37', 1),
(11, 'users', 'login', '{\"ip\":\"127.0.0.1\",\"browser\":\"Firefox\",\"version\":\"124.0\",\"platform\":\"Windows 10\",\"username\":\"admin\"}', 'Wrong credentials, please try again.', 0, '2024-03-23 09:57:48', 1),
(12, 'users', 'login', '{\"ip\":\"::1\",\"browser\":\"Chrome\",\"version\":\"123.0.0.0\",\"platform\":\"Windows 10\",\"username\":\"admin\"}', 'Wrong credentials, please try again.', 0, '2024-04-05 13:38:05', 1),
(13, 'users', 'login', '{\"ip\":\"::1\",\"browser\":\"Chrome\",\"version\":\"123.0.0.0\",\"platform\":\"Windows 10\",\"username\":\"admin\"}', 'Wrong credentials, please try again.', 0, '2024-04-05 13:39:47', 1),
(14, 'users', 'login', '{\"ip\":\"::1\",\"browser\":\"Chrome\",\"version\":\"123.0.0.0\",\"platform\":\"Windows 10\",\"username\":\"admin\"}', 'Wrong credentials, please try again.', 0, '2024-04-05 13:40:07', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_types`
--

CREATE TABLE `user_types` (
  `id` int(11) NOT NULL,
  `user_type_name` varchar(255) NOT NULL,
  `row_status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='this is not role but each details table';

--
-- Dumping data for table `user_types`
--

INSERT INTO `user_types` (`id`, `user_type_name`, `row_status`) VALUES
(1, 'Admin', 1),
(2, 'Teacher', 1),
(3, 'Accounts', 1),
(4, 'Student', 1),
(5, 'Parent', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_classes_class_type_id` (`class_type_id`);

--
-- Indexes for table `class_section_allocation`
--
ALTER TABLE `class_section_allocation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `class_subject_allocation`
--
ALTER TABLE `class_subject_allocation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `class_types`
--
ALTER TABLE `class_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fees_details`
--
ALTER TABLE `fees_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ACC_MASTER_NAME` (`fees_title`),
  ADD KEY `ACC_GROUP_CODE` (`fees_header_id`),
  ADD KEY `fk_fees_details_class_id` (`class_id`);

--
-- Indexes for table `fees_headers`
--
ALTER TABLE `fees_headers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_cities`
--
ALTER TABLE `master_cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_holiday_list`
--
ALTER TABLE `master_holiday_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_menu`
--
ALTER TABLE `master_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_otp`
--
ALTER TABLE `master_otp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_states`
--
ALTER TABLE `master_states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medium`
--
ALTER TABLE `medium`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_permission`
--
ALTER TABLE `menu_permission`
  ADD PRIMARY KEY (`mp_id`),
  ADD KEY `fkc_menu` (`master_menu_id`),
  ADD KEY `fkc_session` (`user_id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parent_details`
--
ALTER TABLE `parent_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_details`
--
ALTER TABLE `student_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_student_details_class_id` (`class_id`),
  ADD KEY `fk_student_details_section_id` (`section_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teacher_details`
--
ALTER TABLE `teacher_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fkc_state` (`state`),
  ADD KEY `fkc_city` (`city`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fkc_user_type` (`user_type`);

--
-- Indexes for table `user_activity_logs`
--
ALTER TABLE `user_activity_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_types`
--
ALTER TABLE `user_types`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `class_section_allocation`
--
ALTER TABLE `class_section_allocation`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `class_subject_allocation`
--
ALTER TABLE `class_subject_allocation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `class_types`
--
ALTER TABLE `class_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fees_details`
--
ALTER TABLE `fees_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fees_headers`
--
ALTER TABLE `fees_headers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `master_cities`
--
ALTER TABLE `master_cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=604;

--
-- AUTO_INCREMENT for table `master_menu`
--
ALTER TABLE `master_menu`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `master_otp`
--
ALTER TABLE `master_otp`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `medium`
--
ALTER TABLE `medium`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `menu_permission`
--
ALTER TABLE `menu_permission`
  MODIFY `mp_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24759;

--
-- AUTO_INCREMENT for table `parent_details`
--
ALTER TABLE `parent_details`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `teacher_details`
--
ALTER TABLE `teacher_details`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_activity_logs`
--
ALTER TABLE `user_activity_logs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `fk_classes_class_type_id` FOREIGN KEY (`class_type_id`) REFERENCES `class_types` (`id`) ON UPDATE NO ACTION;

--
-- Constraints for table `fees_details`
--
ALTER TABLE `fees_details`
  ADD CONSTRAINT `fk_fees_details_class_id` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_fees_details_fees_header_id` FOREIGN KEY (`fees_header_id`) REFERENCES `fees_headers` (`id`) ON UPDATE NO ACTION;

--
-- Constraints for table `student_details`
--
ALTER TABLE `student_details`
  ADD CONSTRAINT `fk_student_details_class_id` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_student_details_section_id` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON UPDATE NO ACTION;

--
-- Constraints for table `teacher_details`
--
ALTER TABLE `teacher_details`
  ADD CONSTRAINT `fkc_city` FOREIGN KEY (`city`) REFERENCES `master_cities` (`id`),
  ADD CONSTRAINT `fkc_state` FOREIGN KEY (`state`) REFERENCES `master_states` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fkc_user_type` FOREIGN KEY (`user_type`) REFERENCES `user_types` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
