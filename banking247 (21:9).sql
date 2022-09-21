-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 21, 2022 at 11:59 AM
-- Server version: 5.7.34
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `banking247`
--

-- --------------------------------------------------------

--
-- Table structure for table `bank_list`
--

CREATE TABLE `bank_list` (
  `Bank_list_id` int(11) NOT NULL,
  `Card_infor_id` int(11) DEFAULT NULL,
  `Bank_name` varchar(50) DEFAULT NULL,
  `Create_date` date DEFAULT NULL,
  `Update_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `card_infor`
--

CREATE TABLE `card_infor` (
  `Card_infor_id` int(11) NOT NULL,
  `User_id` int(11) DEFAULT NULL,
  `Account_number` varchar(11) DEFAULT NULL,
  `Card_balance` double DEFAULT NULL,
  `Notice` varchar(50) DEFAULT NULL,
  `Create_date` date DEFAULT NULL,
  `Status` varchar(16) DEFAULT NULL,
  `Update_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `card_infor`
--

INSERT INTO `card_infor` (`Card_infor_id`, `User_id`, `Account_number`, `Card_balance`, `Notice`, `Create_date`, `Status`, `Update_date`) VALUES
(1, 2, '00002', 100000000, 'VIP', NULL, 'Active', NULL),
(2, 2, '00002', 150000000, 'VIP', NULL, 'Active', NULL),
(3, 4, '00004', 200000000, 'VIP', NULL, 'Active', NULL),
(4, 4, '00004', 100000000, 'PRO', NULL, 'Active', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `Role_id` int(11) NOT NULL,
  `Role_Name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`Role_id`, `Role_Name`) VALUES
(1, 'Admin'),
(2, 'Employee'),
(3, 'Customer');

-- --------------------------------------------------------

--
-- Table structure for table `salarys`
--

CREATE TABLE `salarys` (
  `Salary_id` int(11) NOT NULL,
  `User_id` int(11) DEFAULT NULL,
  `Salary_money` float DEFAULT NULL,
  `Update_date` date DEFAULT NULL,
  `Create_date` date DEFAULT NULL,
  `Hr_date` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `salarys`
--

INSERT INTO `salarys` (`Salary_id`, `User_id`, `Salary_money`, `Update_date`, `Create_date`, `Hr_date`) VALUES
(1, 2, 7500000, NULL, NULL, '2022-12-22'),
(2, 1, 17500000, NULL, NULL, '2022-12-22');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `Transaction_id` int(11) NOT NULL,
  `Transaction_type_id` int(11) DEFAULT NULL,
  `card_id_request` int(11) DEFAULT NULL,
  `card_id_receiver` int(11) DEFAULT NULL,
  `acc_number_request` int(16) DEFAULT NULL,
  `acc_number_receiver` int(16) DEFAULT NULL,
  `transaction_amount` float DEFAULT NULL,
  `New_balance` float DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `Notice` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_types`
--

CREATE TABLE `transaction_types` (
  `Transaction_type_id` int(11) NOT NULL,
  `Transaction_type_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction_types`
--

INSERT INTO `transaction_types` (`Transaction_type_id`, `Transaction_type_name`) VALUES
(1, 'withdraw'),
(2, 'insert'),
(3, 'send');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `User_id` int(11) NOT NULL,
  `Role_id` int(11) DEFAULT NULL,
  `Account_number` varchar(255) NOT NULL,
  `User_name` varchar(50) NOT NULL,
  `Email` varchar(32) NOT NULL,
  `Password` varchar(10) NOT NULL,
  `Full_name` varchar(50) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `Phone_number` varchar(16) DEFAULT NULL,
  `CCCD` varchar(16) DEFAULT NULL,
  `Gender` varchar(6) DEFAULT NULL,
  `Create_date` date DEFAULT NULL,
  `DOB` varchar(25) DEFAULT NULL,
  `Pin` varchar(4) DEFAULT NULL,
  `Update_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`User_id`, `Role_id`, `Account_number`, `User_name`, `Email`, `Password`, `Full_name`, `Address`, `Phone_number`, `CCCD`, `Gender`, `Create_date`, `DOB`, `Pin`, `Update_date`) VALUES
(1, 1, '00001', 'tuan', 'admin@gmail.com', '12345', 'Dang Tuan', 'HN', '0965367815', NULL, 'Male', '2022-09-10', '1998-12-26', '2412', '2022-09-20'),
(2, 3, '00002', 'hoang', 'hoang@gmail.com', '12345', 'Nguyen Minh Hoang', 'HN', '0912345678', '123456789', 'male', NULL, '1999-24-12', '1234', NULL),
(3, 2, '00003', 'viet', 'viet@gmail.com', '12345', 'Nguyen Quoc Viet', 'HN', '0912345678', '123456789', 'male', NULL, '2001-24-12', '1234', NULL),
(4, 3, '00004', 'tuan', 'tuan@gmail.com', '12345', 'Cao Thai Tuan', 'HN', '0912345678', '123456789', 'male', NULL, '1991-24-12', '1234', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank_list`
--
ALTER TABLE `bank_list`
  ADD PRIMARY KEY (`Bank_list_id`),
  ADD KEY `Card_infor_id` (`Card_infor_id`);

--
-- Indexes for table `card_infor`
--
ALTER TABLE `card_infor`
  ADD PRIMARY KEY (`Card_infor_id`),
  ADD KEY `User_id` (`User_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`Role_id`);

--
-- Indexes for table `salarys`
--
ALTER TABLE `salarys`
  ADD PRIMARY KEY (`Salary_id`),
  ADD KEY `User_id` (`User_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`Transaction_id`),
  ADD KEY `card_id_request` (`card_id_request`),
  ADD KEY `card_id_receiver` (`card_id_receiver`),
  ADD KEY `Transaction_type_id` (`Transaction_type_id`);

--
-- Indexes for table `transaction_types`
--
ALTER TABLE `transaction_types`
  ADD PRIMARY KEY (`Transaction_type_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`User_id`),
  ADD KEY `Role_id` (`Role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bank_list`
--
ALTER TABLE `bank_list`
  MODIFY `Bank_list_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `card_infor`
--
ALTER TABLE `card_infor`
  MODIFY `Card_infor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `Role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `salarys`
--
ALTER TABLE `salarys`
  MODIFY `Salary_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `Transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction_types`
--
ALTER TABLE `transaction_types`
  MODIFY `Transaction_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `User_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bank_list`
--
ALTER TABLE `bank_list`
  ADD CONSTRAINT `bank_list_ibfk_1` FOREIGN KEY (`Card_infor_id`) REFERENCES `card_infor` (`Card_infor_id`);

--
-- Constraints for table `card_infor`
--
ALTER TABLE `card_infor`
  ADD CONSTRAINT `card_infor_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `users` (`User_id`);

--
-- Constraints for table `salarys`
--
ALTER TABLE `salarys`
  ADD CONSTRAINT `salarys_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `users` (`User_id`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`card_id_request`) REFERENCES `card_infor` (`Card_infor_id`),
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`card_id_receiver`) REFERENCES `card_infor` (`Card_infor_id`),
  ADD CONSTRAINT `transactions_ibfk_3` FOREIGN KEY (`Transaction_type_id`) REFERENCES `transaction_types` (`Transaction_type_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`Role_id`) REFERENCES `role` (`Role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
