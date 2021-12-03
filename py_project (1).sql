-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2021 at 05:51 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.3.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `py_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer_accounts`
--

CREATE TABLE `tbl_customer_accounts` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(250) NOT NULL,
  `account_number` varchar(250) NOT NULL,
  `address` text NOT NULL,
  `bank_name` varchar(250) NOT NULL,
  `balance` double NOT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_customer_accounts`
--

INSERT INTO `tbl_customer_accounts` (`id`, `customer_id`, `customer_name`, `account_number`, `address`, `bank_name`, `balance`, `last_updated`) VALUES
(1, 101, 'Tavila Sharmin', '111111', '17 Gorman Street, Raleigh, NC.', 'ABC Bank', 1678.5000000000005, '2021-11-25 17:01:30'),
(2, 102, 'Adriana', '222222', '12 Conifer Drive, Raleigh, NC.', 'XYZ Bank', 42, '2021-12-02 16:07:07'),
(3, 103, 'Jerin', '333333', '20 Faircloth road, Raleigh, NC.', 'PQR Bank', 105.8, '2021-12-02 16:09:01');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_image_info`
--

CREATE TABLE `tbl_image_info` (
  `id` int(11) NOT NULL,
  `img_name` varchar(250) NOT NULL,
  `category` varchar(250) NOT NULL,
  `up_by` varchar(250) NOT NULL,
  `up_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_image_info`
--

INSERT INTO `tbl_image_info` (`id`, `img_name`, `category`, `up_by`, `up_time`) VALUES
(1, '1637781329.png', 'Cat1', 'A', '2021-11-24 19:15:29'),
(2, '1637859037.png', 'Cat1', 'A', '2021-11-25 16:50:46'),
(3, '1637861857.png', 'person', '100001', '2021-11-25 17:38:17'),
(4, '1637861972.png', 'person', '100001', '2021-11-25 17:40:00'),
(5, '1637862162.png', 'person', '100001', '2021-11-25 17:43:00'),
(6, '1637862330.png', 'orange', '100001', '2021-11-25 17:45:54'),
(7, '1637862509.png', 'orange', '100001', '2021-11-25 17:49:33'),
(8, '1637862629.png', 'orange', '100001', '2021-11-25 17:50:47'),
(9, '1638376269.png', 'Carrot', '100001', '2021-12-01 16:31:21'),
(10, '1638461883.png', 'Bell_pepper', '102', '2021-12-02 16:18:18'),
(11, '1638461962.png', 'Potato', '103', '2021-12-02 16:19:31'),
(12, '1638462032.png', 'Potato', '103', '2021-12-02 16:20:43'),
(13, '1638462209.png', 'Tomato', '101', '2021-12-02 16:23:52'),
(14, '1638462315.png', 'Carrot', '102', '2021-12-02 16:25:20'),
(15, '1638462349.png', 'Bell_pepper', '102', '2021-12-02 16:25:57'),
(16, '1638462396.png', 'Potato', '102', '2021-12-02 16:27:03'),
(17, '1638462437.png', 'Potato', '102', '2021-12-02 16:27:29'),
(18, '1638462495.png', 'Broccoli', '101', '2021-12-02 16:28:30'),
(19, '1638462543.png', 'Broccoli', '101', '2021-12-02 16:29:13'),
(20, '1638463451.png', 'Broccoli', '103', '2021-12-02 16:44:28'),
(21, '1638465460.png', 'Potato', '101', '2021-12-02 17:17:49'),
(22, '1638466240.png', 'Tomato', '101', '2021-12-02 17:30:51'),
(23, '1638471886.png', 'Broccoli', '101', '2021-12-02 19:04:54'),
(24, 'detected1638472658.png', 'Broccoli', '101', '2021-12-02 19:17:45'),
(25, 'detected1638472832.png', 'Broccoli', '101', '2021-12-02 19:20:42'),
(26, 'detected1638487845.png', 'Broccoli', '101', '2021-12-02 23:30:54'),
(27, 'detected1638487889.png', 'Potato', '101', '2021-12-02 23:31:33'),
(28, 'detected1638488507.png', 'Broccoli', '101', '2021-12-02 23:41:54'),
(29, 'detected1638488585.png', 'Potato', '101', '2021-12-02 23:43:10'),
(30, 'detected1638489714.png', 'Broccoli', '101', '2021-12-03 00:02:04'),
(31, 'detected1638489747.png', 'Bell_pepper', '101', '2021-12-03 00:02:32'),
(32, 'detected1638491442.png', 'Broccoli', '101', '2021-12-03 00:30:47'),
(33, 'detected1638496582.png', 'Broccoli', '101', '2021-12-03 01:56:29'),
(34, 'detected1638496696.png', 'Bell_pepper', '102', '2021-12-03 01:58:21'),
(35, 'detected1638497535.png', 'Bell_pepper', '101', '2021-12-03 02:12:23'),
(36, 'detected1638497584.png', 'Tomato', '101', '2021-12-03 02:13:07'),
(37, 'detected1638497626.png', 'Potato', '101', '2021-12-03 02:13:49'),
(38, 'detected1638497701.png', 'Carrot', '101', '2021-12-03 02:15:10'),
(39, 'detected1638497936.png', 'Tomato', '103', '2021-12-03 02:18:59'),
(40, 'detected1638498138.png', 'Broccoli', '101', '2021-12-03 02:22:32'),
(41, 'detected1638498282.png', 'Bell_pepper', '101', '2021-12-03 02:24:46'),
(42, 'detected1638498307.png', 'Bell_pepper', '101', '2021-12-03 02:25:18'),
(43, 'detected1638498330.png', 'Potato', '101', '2021-12-03 02:25:34'),
(44, 'detected1638499592.png', 'Broccoli', '101', '2021-12-03 02:47:06'),
(45, 'detected1638499836.png', 'Bell_pepper', '102', '2021-12-03 02:50:41'),
(46, 'detected1638499918.png', 'Potato', '102', '2021-12-03 02:52:10'),
(47, 'detected1638500163.png', 'Bell_pepper', '101', '2021-12-03 02:56:08'),
(48, 'detected1638500314.png', 'Potato', '102', '2021-12-03 02:58:40'),
(49, 'detected1638500952.png', 'Potato', '101', '2021-12-03 03:09:20'),
(50, 'detected1638501162.png', 'Bell_pepper', '102', '2021-12-03 03:12:48'),
(51, 'detected1638501360.png', 'Potato', '101', '2021-12-03 03:16:09'),
(52, 'detected1638501511.png', 'Bell_pepper', '102', '2021-12-03 03:18:36'),
(53, 'detected1638501759.png', 'Broccoli', '101', '2021-12-03 03:22:45'),
(54, 'detected1638501917.png', 'Bell_pepper', '102', '2021-12-03 03:25:21'),
(55, 'detected1638502168.png', 'Broccoli', '101', '2021-12-03 03:29:34'),
(56, 'detected1638502271.png', 'Bell_pepper', '102', '2021-12-03 03:31:16'),
(57, 'detected1638503220.png', 'Broccoli', '101', '2021-12-03 03:47:08'),
(58, 'detected1638503341.png', 'Bell_pepper', '102', '2021-12-03 03:49:06'),
(59, 'detected1638503865.png', 'Bell_pepper', '102', '2021-12-03 03:57:49'),
(60, 'detected1638503912.png', 'Bell_pepper', '103', '2021-12-03 03:58:37'),
(61, 'detected1638503930.png', 'Tomato', '103', '2021-12-03 03:58:55'),
(62, 'detected1638503952.png', 'Tomato', '103', '2021-12-03 03:59:18'),
(63, 'detected1638504176.png', 'Potato', '103', '2021-12-03 04:03:07'),
(64, 'detected1638504751.png', 'Potato', '101', '2021-12-03 04:12:38'),
(65, 'detected1638504923.png', 'Potato', '101', '2021-12-03 04:15:30'),
(66, 'detected1638505134.png', 'Potato', '101', '2021-12-03 04:19:00'),
(67, 'detected1638505235.png', 'Bell_pepper', '102', '2021-12-03 04:20:41'),
(68, 'detected1638505552.png', 'Potato', '101', '2021-12-03 04:26:00'),
(69, 'detected1638505974.png', 'Potato', '101', '2021-12-03 04:32:59'),
(70, 'detected1638506369.png', 'Potato', '101', '2021-12-03 04:39:35'),
(71, 'detected1638506678.png', 'Potato', '101', '2021-12-03 04:44:43'),
(72, 'detected1638506772.png', 'Bell_pepper', '102', '2021-12-03 04:46:18');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_item_price`
--

CREATE TABLE `tbl_item_price` (
  `id` int(11) NOT NULL,
  `item_name` varchar(250) NOT NULL,
  `item_price` double NOT NULL,
  `unit` varchar(250) NOT NULL,
  `current_stock_in_lb` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_item_price`
--

INSERT INTO `tbl_item_price` (`id`, `item_name`, `item_price`, `unit`, `current_stock_in_lb`) VALUES
(1, 'Carrot', 2, '$/lb', 4.1),
(2, 'Tomato', 3, '$/lb', 15.9),
(3, 'Broccoli', 4, '$/lb', 16.4),
(4, 'Bell_pepper', 5, '$/lb', 10),
(5, 'Potato', 2, '$/lb', 23.699999999999996);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_customer_accounts`
--
ALTER TABLE `tbl_customer_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_image_info`
--
ALTER TABLE `tbl_image_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_item_price`
--
ALTER TABLE `tbl_item_price`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_customer_accounts`
--
ALTER TABLE `tbl_customer_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_image_info`
--
ALTER TABLE `tbl_image_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `tbl_item_price`
--
ALTER TABLE `tbl_item_price`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
