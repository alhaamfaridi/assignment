-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 20, 2022 at 05:46 AM
-- Server version: 10.5.16-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `visankat_Users`
--

-- --------------------------------------------------------

--
-- Table structure for table `add_money_request`
--

CREATE TABLE `add_money_request` (
  `reqId` int(10) NOT NULL,
  `userId` int(10) NOT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `currency` set('INR','BSR') NOT NULL DEFAULT 'INR',
  `wallet` set('wallet1','wallet2','wallet3','wallet4','wallet5') NOT NULL,
  `mode` set('BTC','SKRILL') NOT NULL,
  `image` longtext NOT NULL,
  `status` enum('0','1','2') NOT NULL DEFAULT '0' COMMENT '0 Paused, 1 accepted, 2 Rejected',
  `date` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `add_money_request`
--

INSERT INTO `add_money_request` (`reqId`, `userId`, `amount`, `currency`, `wallet`, `mode`, `image`, `status`, `date`) VALUES
(1, 3, 1100, '', 'wallet4', 'BTC', '3__-1643776481.jpg', '1', '2022-02-02'),
(2, 3, 123, 'INR', 'wallet3', 'BTC', '3_123_wallet3-1643779109.jpg', '2', '2022-02-02'),
(3, 3, 2000, 'INR', 'wallet1', 'BTC', '3_2000_wallet1-1644916573.jpg', '1', '2022-02-15'),
(4, 3, 100000, 'INR', 'wallet1', 'BTC', '3_100000_wallet1-1644952017.jpg', '1', '2022-02-15'),
(5, 3, 100000, 'INR', 'wallet1', 'BTC', '3_100000_wallet1-1645017409.jpg', '1', '2022-02-16'),
(6, 3, 1500000000, 'INR', 'wallet1', 'BTC', '3_1500000000_wallet1-1645018911.jpg', '1', '2022-02-16');

-- --------------------------------------------------------

--
-- Table structure for table `bond`
--

CREATE TABLE `bond` (
  `bondId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `bond_name` varchar(50) NOT NULL,
  `bond_amount` float NOT NULL,
  `bond_type` varchar(50) NOT NULL,
  `history` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bond`
--

INSERT INTO `bond` (`bondId`, `userId`, `bond_name`, `bond_amount`, `bond_type`, `history`) VALUES
(1, 2, 'Default Bond', 20, 'Wallet Coin Bond', '20,20,20'),
(7, 1, 'Fut Bond', 2000, 'Fut Bond', '2000,2000,2000'),
(8, 15, 'IT Bond', 2000, 'IT Bond', '2000,2000,2000'),
(9, 15, 'Fut Bond', 4000, 'Fut Bond', '4000,4000,4000'),
(10, 15, 'Fut Bond-2000Rs', 2000, 'Fut Bond-2000Rs', '2000'),
(11, 15, 'IT Bond-1500Rs', 1500, 'IT Bond-1500Rs', '1500'),
(12, 25, 'IT Bond-1500Rs', 1500, 'IT Bond-1500Rs', '1500'),
(13, 26, 'Elec Bond-3500Rs', 3500, 'Elec Bond-3500Rs', '3500'),
(14, 15, 'Fut Bond', 2000, 'Fut Bond', '2000');

-- --------------------------------------------------------

--
-- Table structure for table `bonds_buyed`
--

CREATE TABLE `bonds_buyed` (
  `bondId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bonds_buyed`
--

INSERT INTO `bonds_buyed` (`bondId`, `userId`, `quantity`, `amount`) VALUES
(4, 2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bond_data`
--

CREATE TABLE `bond_data` (
  `bondId` int(10) NOT NULL,
  `opening_Price` double NOT NULL,
  `closing_Price` double NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `bond_data`
--
DELIMITER $$
CREATE TRIGGER `add_date_bond` BEFORE INSERT ON `bond_data` FOR EACH ROW IF (New.date is NULL) THEN
	set New.date = now();
END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cheque`
--

CREATE TABLE `cheque` (
  `chequeId` int(10) NOT NULL,
  `from_userId` int(10) NOT NULL,
  `to_userId` int(10) NOT NULL,
  `date` date NOT NULL,
  `amount` double NOT NULL,
  `currency` varchar(3) NOT NULL,
  `from_wallet` varchar(8) NOT NULL,
  `to_wallet` varchar(8) NOT NULL,
  `status` enum('0','1','2') NOT NULL DEFAULT '0' COMMENT '0 for pending, 1 for acepted, 2 for return'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cheque`
--

INSERT INTO `cheque` (`chequeId`, `from_userId`, `to_userId`, `date`, `amount`, `currency`, `from_wallet`, `to_wallet`, `status`) VALUES
(1, 3, 5, '2022-01-15', 250, 'inr', 'wallet1', 'wallet5', '2'),
(2, 4, 3, '2022-01-26', 100, 'inr', 'wallet1', 'wallet5', '2'),
(3, 3, 13, '2022-01-31', 123, 'INR', 'wallet1', 'wallet5', '2');

-- --------------------------------------------------------

--
-- Table structure for table `coin`
--

CREATE TABLE `coin` (
  `coinId` int(11) NOT NULL,
  `coin_name` varchar(191) NOT NULL,
  `coin_inr_value` double NOT NULL DEFAULT 100,
  `coin_description` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `coin`
--

INSERT INTO `coin` (`coinId`, `coin_name`, `coin_inr_value`, `coin_description`) VALUES
(1, 'coin1', 100, '1000 INR Value'),
(2, 'coin2', 200, '200 inr'),
(3, 'coin3', 1000, '100 INR Value'),
(4, 'coin4', 550, '50 INR Value'),
(5, 'coin5', 150, '10 INR Value');

-- --------------------------------------------------------

--
-- Table structure for table `crypto_payments`
--

CREATE TABLE `crypto_payments` (
  `paymentID` int(11) UNSIGNED NOT NULL,
  `boxID` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `boxType` enum('paymentbox','captchabox') NOT NULL,
  `orderID` varchar(50) NOT NULL DEFAULT '',
  `userID` varchar(50) NOT NULL DEFAULT '',
  `countryID` varchar(3) NOT NULL DEFAULT '',
  `coinLabel` varchar(6) NOT NULL DEFAULT '',
  `amount` double(20,8) NOT NULL DEFAULT 0.00000000,
  `amountUSD` double(20,8) NOT NULL DEFAULT 0.00000000,
  `unrecognised` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `addr` varchar(34) NOT NULL DEFAULT '',
  `txID` char(64) NOT NULL DEFAULT '',
  `txDate` datetime DEFAULT NULL,
  `txConfirmed` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `txCheckDate` datetime DEFAULT NULL,
  `processed` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `processedDate` datetime DEFAULT NULL,
  `recordCreated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `crypto_payments`
--

INSERT INTO `crypto_payments` (`paymentID`, `boxID`, `boxType`, `orderID`, `userID`, `countryID`, `coinLabel`, `amount`, `amountUSD`, `unrecognised`, `addr`, `txID`, `txDate`, `txConfirmed`, `txCheckDate`, `processed`, `processedDate`, `recordCreated`) VALUES
(1, 62624, 'paymentbox', 'demo_order1', 'test_user1', 'AUS', 'BTC', 0.00000980, 0.37000000, 0, 'TESTuYyfC1Ptr1gLNc6WZMBiDm98WckAwi', 'TESTTtOc8cVbncChMy2IPq5eqiNbCwPf9jBM5VHwG4t1edyyuXnQKX9B1Zr0Sn1T', '2022-01-29 07:05:08', 0, '2022-01-29 07:05:22', 0, NULL, '2022-01-29 07:05:22');

-- --------------------------------------------------------

--
-- Table structure for table `deposit`
--

CREATE TABLE `deposit` (
  `depositId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `deposit_amount` float NOT NULL,
  `deposit_type` varchar(50) NOT NULL,
  `rate_of_Interest` float NOT NULL,
  `duration` varchar(50) NOT NULL,
  `lastDepositedOn` varchar(15) NOT NULL,
  `expiry` varchar(15) NOT NULL,
  `renewedOn` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `deposit`
--

INSERT INTO `deposit` (`depositId`, `userId`, `deposit_amount`, `deposit_type`, `rate_of_Interest`, `duration`, `lastDepositedOn`, `expiry`, `renewedOn`) VALUES
(1, 2, 40, 'Wallet Coin Deposit', 4, '12 Month', '', '', ''),
(2, 2, 200, 'jd', 12, '123', '', '', ''),
(3, 1, 200000, 'CL-Deposit', 12, '12 year', '', '', ''),
(4, 15, 30000, 'Fixed', 7, '3 year', '', '', ''),
(5, 15, 500002, 'LF-Deposit', 13, '20 year', '', '', ''),
(6, 25, 50000, 'Fixed', 7, '1 year', '', '', ''),
(7, 25, 50000, 'Fixed', 7, '1 year', '', '', ''),
(32, 3, 25001, 'Fixed', 7, '1 year', '', '15-02-23', ''),
(33, 3, 25001, 'Fixed', 7, '1 year', '', '', ''),
(34, 3, 25001, 'Fixed', 7, '1 year', '', '', ''),
(35, 3, 25001, 'Fixed', 7, '1 year', '', '', ''),
(36, 3, 25001, 'Fixed', 7, '1 year', '', '16-02-23', ''),
(37, 3, 25001, 'Fixed', 7, '1 month', '', '16-03-22', ''),
(38, 3, 25001, 'Fixed', 7, '1 year', '', '16-02-23', ''),
(39, 3, 4000, 'Recurring', 8, '6 month', '04-03-22', '01-03-22', '17-02-22'),
(40, 3, 150000000, 'Hf-Deposit', 14, 'Life Time', '', '', ''),
(41, 3, 25001, 'Recurring', 8, '6 month', '22-02-22', '16-08-22', ''),
(42, 3, 25001, 'Fixed', 7, '1 year', '', '19-02-23', '');

-- --------------------------------------------------------

--
-- Table structure for table `insurance`
--

CREATE TABLE `insurance` (
  `insuranceId` int(10) NOT NULL,
  `userId` int(11) NOT NULL,
  `insurance_status` enum('0','1','2','3') NOT NULL DEFAULT '0' COMMENT '0 for pending, 1 for accept by agent, 2 for final accept, 3 for reject',
  `insurance_amount` float NOT NULL,
  `insurance_type` varchar(50) NOT NULL,
  `agent_name` varchar(100) NOT NULL,
  `duration` varchar(50) NOT NULL,
  `i_update` enum('0','1') NOT NULL DEFAULT '0' COMMENT '1 for updated by agent after admin request',
  `image` varchar(5000) DEFAULT NULL,
  `wallet` set('wallet1','wallet5') NOT NULL DEFAULT 'wallet1',
  `currency` set('inr','bsr') NOT NULL DEFAULT 'inr'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `insurance`
--

INSERT INTO `insurance` (`insuranceId`, `userId`, `insurance_status`, `insurance_amount`, `insurance_type`, `agent_name`, `duration`, `i_update`, `image`, `wallet`, `currency`) VALUES
(1, 6, '0', 15, 'Wallet Coin Insurance', 'ram1 Nath', '12 Month', '0', NULL, 'wallet1', 'inr'),
(2, 3, '0', 53588, 'Term Insurance', 'ak', '1 year', '0', NULL, 'wallet1', 'inr'),
(3, 3, '3', 230000, 'Jewel Insurance', 'ak', '6 Year Year', '0', NULL, 'wallet1', 'inr'),
(4, 4, '3', 238, 'Device Insurance', 'ak', '1', '0', NULL, 'wallet1', 'inr'),
(6, 13, '1', 32, 'Jewel Insurance', 'ak', '1', '1', NULL, 'wallet1', 'inr'),
(7, 3, '2', 253, 'Jewel Insurance', 'ak', '1', '0', NULL, 'wallet1', 'inr'),
(8, 3, '3', 2350, 'House insurance', 'ak', '7', '0', NULL, 'wallet1', 'inr'),
(9, 3, '0', 2300, 'Device insurance', 'ak', '7 Years', '0', '3_Device insurance_ak-1643367836.jpg', 'wallet1', 'inr'),
(10, 3, '0', 230, 'Jewel insurance', 'Sunny Sonar', '7 Years', '0', '3_Jewel insurance_Sunny Sonar-1643367907.jpg', 'wallet1', 'inr'),
(11, 3, '2', 230, 'Life insurance', 'ak', '1 Years', '0', '3_Life insurance_ak-1643707697.jpg', 'wallet5', 'bsr'),
(12, 3, '0', 2500, 'Life insurance', 'ram1 Nath', '1 Years', '0', '3_Life insurance_ram1 Nath-1645691841.jpg', 'wallet1', 'inr');

-- --------------------------------------------------------

--
-- Table structure for table `loan`
--

CREATE TABLE `loan` (
  `loanId` int(10) NOT NULL,
  `userId` int(11) NOT NULL,
  `loan_status` enum('0','1','2','3') NOT NULL DEFAULT '0' COMMENT '0 for pending, 1 for accept by agent, 2 for final accept, 3 for reject',
  `loan_amount` float NOT NULL,
  `loan_type` varchar(50) NOT NULL,
  `agent_name` varchar(50) NOT NULL,
  `rate_of_Interest` float NOT NULL,
  `duration` varchar(50) NOT NULL,
  `l_update` enum('0','1') NOT NULL DEFAULT '0' COMMENT '1 for updated by agent after admin request',
  `image` varchar(5000) DEFAULT NULL,
  `reqinr` enum('0','1','2','3') NOT NULL DEFAULT '0' COMMENT '0 notrequested, 1 requested, 2 accepted, 3 rejected'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `loan`
--

INSERT INTO `loan` (`loanId`, `userId`, `loan_status`, `loan_amount`, `loan_type`, `agent_name`, `rate_of_Interest`, `duration`, `l_update`, `image`, `reqinr`) VALUES
(1, 3, '2', 25, 'Wallet Coin Loan', ' N V', 10, '3 Year', '1', NULL, '2'),
(2, 3, '2', 50000, '2 Days Loan', 'ak', 6, '2 Days', '1', NULL, '2'),
(3, 3, '3', 235000, 'Vehicle Loan', 'ak', 50, 'More than 5 years', '0', NULL, '0'),
(4, 3, '3', 23, 'House Loan', 'ak', 8, 'More than 5 years', '0', NULL, '0'),
(5, 3, '1', 23, 'Gold Loan', 'ram1 Nath', 8, '1 year', '0', NULL, '0'),
(6, 3, '3', 2360, 'Credit Loan', 'ak', 9, '6 Year', '0', NULL, '0'),
(7, 3, '1', 2300, 'Business loan', 'ak', 8, 'Upto 2 years', '0', NULL, '0'),
(8, 15, '1', 12500, 'Device loan', 'ak', 8, 'Upto 2 years', '0', NULL, '0'),
(9, 25, '3', 500, 'Jewel loan', 'ram1 Nath', 8, '1.5 years', '0', NULL, '0'),
(10, 25, '1', 5000, '2days loan', 'Sunny Sonar', 8, '2 days', '0', NULL, '0'),
(11, 13, '1', 23, 'Business loan', 'ak', 8, '3-5 years', '0', NULL, '0'),
(12, 26, '1', 5000, '2days loan', 'king87', 8, '2 days', '1', NULL, '0'),
(13, 3, '0', 32000, 'Jewel loan', 'ak', 8.8, '4 or more Years', '0', '3_Jewel loan_ak-1643363516.jpg', '0'),
(14, 3, '0', 320, '2days loan', 'ak', 8.8, '2 days', '0', '3_2days loan_ak-1643363581.jpg', '0'),
(15, 3, '0', 230, '2days loan', 'ak', 8.8, '2 days', '0', '', '0'),
(16, 3, '0', 2000, 'Jewel loan', 'Sunny Sonar', 8.8, '1 year', '0', '', '0'),
(17, 3, '0', 1200, 'Jewel loan', 'Sunny Sonar', 8.8, '1 year', '0', '3_Jewel loan_Sunny Sonar-1643913741.jpg', '0');

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission` (
  `fuser_id` int(10) NOT NULL,
  `tuser_id` int(10) NOT NULL,
  `from_wallet` set('wallet1','wallet2','wallet3','wallet4','wallet5') NOT NULL,
  `to_wallet` set('wallet1','wallet2','wallet3','wallet4','wallet5') NOT NULL,
  `amount` double NOT NULL,
  `status` enum('0','1','2') NOT NULL DEFAULT '0' COMMENT '0 for pending, 1 for accept , 3 for reject'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`fuser_id`, `tuser_id`, `from_wallet`, `to_wallet`, `amount`, `status`) VALUES
(3, 5, 'wallet3', 'wallet4', 1, '0'),
(3, 5, 'wallet3', 'wallet4', 1, '0'),
(3, 5, 'wallet3', 'wallet4', 1, '0'),
(3, 5, 'wallet3', 'wallet4', 2, '0'),
(3, 5, 'wallet3', 'wallet4', 2, '0'),
(3, 5, 'wallet3', 'wallet4', 2, '0'),
(3, 5, 'wallet3', 'wallet4', 1, '0'),
(3, 5, 'wallet3', 'wallet4', 2, '0'),
(3, 5, 'wallet3', 'wallet4', 2, '0'),
(3, 5, 'wallet3', 'wallet4', 2, '0'),
(3, 5, 'wallet3', 'wallet4', 2, '0'),
(3, 5, 'wallet3', 'wallet4', 2, '0'),
(3, 5, 'wallet3', 'wallet4', 2, '0'),
(3, 5, 'wallet3', 'wallet4', 2, '0'),
(3, 5, 'wallet3', 'wallet4', 5, '0'),
(3, 5, 'wallet3', 'wallet4', 2, '0'),
(3, 5, 'wallet3', 'wallet4', 2, '0'),
(3, 5, 'wallet3', 'wallet4', 2, '0'),
(3, 5, 'wallet3', 'wallet4', 2, '0'),
(3, 5, 'wallet1', 'wallet3', 2, '0');

-- --------------------------------------------------------

--
-- Table structure for table `rd`
--

CREATE TABLE `rd` (
  `rdId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `rd_amount` float NOT NULL,
  `rd_type` varchar(50) NOT NULL,
  `rate_of_Interest` float NOT NULL,
  `duration` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `share`
--

CREATE TABLE `share` (
  `shareId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `share_name` varchar(50) NOT NULL,
  `share_amount` float NOT NULL,
  `share_type` varchar(50) NOT NULL,
  `history` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `share`
--

INSERT INTO `share` (`shareId`, `userId`, `share_name`, `share_amount`, `share_type`, `history`) VALUES
(1, 3, 'Default Share', 25, 'Wallet Coin Share', '25'),
(3, 1, 'Elec Bond', 1001, 'Elec Bond', '1001'),
(4, 1, 'Orange', 8200, 'Orange', '8200'),
(5, 1, 'Tomato', 6500, 'Tomato', '6500'),
(6, 15, 'Apple', 22000, 'Apple', '22000'),
(7, 15, 'Orange-8200Rs', 8200, 'Orange-8200Rs', '8200'),
(8, 15, 'Scoin-15000Rs', 15000, 'Scoin-15000Rs', '15000'),
(9, 25, 'Dcoin-10000Rs', 10000, 'Dcoin-10000Rs', '10000'),
(10, 25, 'Dcart-5000Rs', 5000, 'Dcart-5000Rs', '5000');

-- --------------------------------------------------------

--
-- Table structure for table `shares_buyed`
--

CREATE TABLE `shares_buyed` (
  `shareId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `amount` double NOT NULL,
  `date` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `share_data`
--

CREATE TABLE `share_data` (
  `share_Id` int(10) NOT NULL,
  `date` date NOT NULL,
  `opening_Price` double NOT NULL,
  `closing_Price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `share_data`
--
DELIMITER $$
CREATE TRIGGER `add_date` BEFORE INSERT ON `share_data` FOR EACH ROW IF (New.date is NULL) THEN
	set New.date = now();
END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `transactionId` int(10) NOT NULL,
  `from_userId` int(11) NOT NULL DEFAULT 0,
  `to_userId` int(11) NOT NULL DEFAULT 0,
  `from_walletId` int(11) NOT NULL DEFAULT 0,
  `to_walletId` int(11) NOT NULL DEFAULT 0,
  `from_account` double NOT NULL DEFAULT 0,
  `to_account` double NOT NULL DEFAULT 0,
  `transaction_type` set('transfer','add','subtract','buy','sell') NOT NULL,
  `transaction_amount` double NOT NULL,
  `transaction_time` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`transactionId`, `from_userId`, `to_userId`, `from_walletId`, `to_walletId`, `from_account`, `to_account`, `transaction_type`, `transaction_amount`, `transaction_time`, `description`) VALUES
(1, 0, 3, 0, 13, 0, 0, 'add', 200, '2021-12-30 13:11:35', 'Coin add to user wallet'),
(2, 0, 3, 0, 13, 0, 0, 'subtract', 50, '2021-12-30 13:18:43', 'Coin subtract to user wallet'),
(3, 0, 3, 0, 13, 0, 0, 'subtract', 20, '2021-12-30 13:20:59', 'Coin subtract to user wallet'),
(4, 3, 4, 13, 18, 0, 0, 'subtract', 30, '2021-12-30 14:09:44', 'Coin subtract to user wallet'),
(5, 3, 4, 13, 18, 0, 0, 'add', 30, '2021-12-30 14:09:44', 'Coin add to user wallet'),
(6, 3, 3, 13, 14, 0, 0, 'subtract', 30, '2021-12-30 14:11:06', 'Coin subtract to user wallet'),
(7, 3, 3, 13, 14, 0, 0, 'add', 30, '2021-12-30 14:11:06', 'Coin add to user wallet'),
(8, 2, 1, 8, 3, 0, 0, 'buy', 20, '2021-12-30 17:48:12', 'Coin subtract to user wallet'),
(9, 2, 1, 8, 3, 0, 0, 'sell', 20, '2021-12-30 17:48:12', 'Coin add to user wallet'),
(10, 0, 2, 0, 8, 0, 0, 'add', 200, '2021-12-30 17:51:26', 'Coin add to user wallet'),
(11, 0, 5, 0, 23, 0, 0, 'add', 200, '2021-12-30 17:53:25', 'Coin add to user wallet'),
(12, 0, 6, 0, 28, 0, 0, 'add', 200, '2021-12-30 17:53:32', 'Coin add to user wallet'),
(13, 0, 4, 0, 18, 0, 0, 'add', 100, '2021-12-30 17:54:11', 'Coin add to user wallet'),
(14, 0, 3, 0, 14, 0, 0, 'add', 100, '2021-12-30 17:54:16', 'Coin add to user wallet'),
(15, 3, 5, 14, 23, 0, 0, 'buy', 25, '2021-12-30 17:56:57', 'Coin subtract to user wallet'),
(16, 3, 5, 14, 23, 0, 0, 'sell', 25, '2021-12-30 17:56:57', 'Coin add to user wallet'),
(17, 6, 1, 28, 3, 0, 0, 'buy', 15, '2021-12-30 17:58:54', 'Coin subtract to user wallet'),
(18, 6, 1, 28, 3, 0, 0, 'sell', 15, '2021-12-30 17:58:54', 'Coin add to user wallet'),
(30, 5, 1, 23, 3, 0, 0, 'transfer', 50, '2021-12-30 18:12:48', 'Coin add to user wallet'),
(31, 0, 0, 0, 0, 1234, 12345678, '', 1000, '14-Jan-2022 1:24:22 pm', ''),
(32, 0, 0, 0, 0, 1234, 12434, '', 102, '14-Jan-2022 1:27:54 pm', ''),
(33, 0, 0, 0, 0, 1234, 14526, '', 120, '21-Jan-2022 11:02:00 am', ''),
(34, 0, 0, 0, 0, 15, 125689, '', 1000, '21-Jan-2022 11:09:42 am', ''),
(35, 0, 13, 0, 51, 0, 0, 'add', 3, '2022-01-24 06:19:56', 'Coin add to user wallet'),
(36, 0, 13, 0, 51, 0, 0, 'add', 3, '2022-01-24 06:21:10', 'Coin add to user wallet'),
(37, 0, 13, 0, 51, 0, 0, 'add', 3, '2022-01-24 06:23:59', 'Coin add to user wallet'),
(38, 0, 13, 0, 51, 0, 0, 'add', 5, '2022-01-24 06:31:57', 'Coin add to user wallet'),
(39, 0, 13, 0, 51, 0, 0, 'add', 5, '2022-01-24 06:32:03', 'Coin add to user wallet'),
(40, 0, 13, 0, 51, 0, 0, 'add', 5, '2022-01-24 06:38:02', 'Coin add to user wallet'),
(41, 0, 13, 0, 51, 0, 0, 'add', 5, '2022-01-24 06:48:58', 'Coin add to user wallet'),
(42, 0, 13, 0, 51, 0, 0, 'add', 5, '2022-01-24 06:51:08', 'Coin add to user wallet'),
(43, 0, 13, 0, 52, 0, 0, 'add', 3, '2022-01-24 06:54:42', 'Coin add to user wallet'),
(44, 0, 13, 0, 52, 0, 0, 'add', 3, '2022-01-24 06:55:09', 'Coin add to user wallet'),
(45, 0, 13, 0, 52, 0, 0, 'add', 3, '2022-01-24 06:55:27', 'Coin add to user wallet'),
(46, 0, 13, 0, 52, 0, 0, 'add', 3, '2022-01-24 06:55:52', 'Coin add to user wallet'),
(47, 0, 13, 0, 52, 0, 0, 'add', 3, '2022-01-24 07:01:28', 'Coin add to user wallet'),
(48, 0, 13, 0, 52, 0, 0, 'add', 3, '2022-01-24 07:01:59', 'Coin add to user wallet'),
(49, 0, 13, 0, 52, 0, 0, 'add', 3, '2022-01-24 07:04:56', 'Coin add to user wallet'),
(50, 0, 14, 51, 57, 9999999999, 1223456789, '', 6, '2022-01-24 13:43:31', 'Semd Money to Wallet'),
(51, 0, 13, 51, 52, 9999999999, 9999999999, '', 1, '2022-01-24 13:44:42', 'Semd Money to Wallet'),
(52, 0, 13, 51, 51, 9999999999, 9999999999, '', 1, '2022-01-24 13:45:26', 'Semd Money to Wallet'),
(53, 0, 14, 26, 56, 9999999999, 1223456789, '', 1, '2022-01-24 13:59:21', 'Semd Money to Wallet'),
(54, 0, 14, 51, 56, 9999999999, 1223456789, '', 1, '2022-01-24 14:03:29', 'Semd Money to Wallet'),
(55, 0, 14, 51, 56, 9999999999, 1223456789, '', 1, '2022-01-24 14:05:32', 'Semd Money to Wallet'),
(56, 0, 1, 1, 2, 9098564230, 9098564230, '', 2, '2022-01-24 14:10:08', 'Semd Money to Wallet'),
(57, 0, 2, 1, 7, 9098564230, 9098564230, '', 2, '2022-01-24 14:10:08', 'Semd Money to Wallet'),
(58, 0, 3, 1, 12, 9098564230, 9098564230, '', 2, '2022-01-24 14:10:08', 'Semd Money to Wallet'),
(59, 0, 4, 1, 17, 9098564230, 9098564230, '', 2, '2022-01-24 14:10:08', 'Semd Money to Wallet'),
(60, 0, 14, 51, 56, 9999999999, 1223456789, '', 1, '2022-01-24 14:11:57', 'Semd Money to Wallet'),
(61, 0, 14, 51, 56, 9999999999, 1223456789, '', 20, '2022-01-24 14:12:32', 'Semd Money to Wallet'),
(62, 0, 14, 26, 56, 9999999999, 1223456789, '', 18, '2022-01-24 14:19:28', 'Semd Money to Wallet'),
(63, 0, 14, 26, 56, 9999999999, 1223456789, '', 18, '2022-01-24 14:21:19', 'Semd Money to Wallet'),
(64, 0, 1, 11, 2, 9098564230, 9098564230, '', 2, '2022-01-24 15:24:40', 'Semd Money to Wallet'),
(65, 0, 2, 11, 7, 9098564230, 9098564230, '', 2, '2022-01-24 15:24:40', 'Semd Money to Wallet'),
(66, 0, 3, 11, 12, 9098564230, 9098564230, '', 2, '2022-01-24 15:24:40', 'Semd Money to Wallet'),
(67, 0, 4, 11, 17, 9098564230, 9098564230, '', 2, '2022-01-24 15:24:40', 'Semd Money to Wallet'),
(68, 0, 5, 11, 22, 9098564230, 9098564230, '', 2, '2022-01-24 15:24:40', 'Semd Money to Wallet'),
(69, 0, 1, 11, 2, 9098564230, 9098564230, '', 2, '2022-01-24 16:31:22', 'Semd Money to Wallet'),
(70, 0, 2, 11, 7, 9098564230, 9098564230, '', 2, '2022-01-24 16:31:22', 'Semd Money to Wallet'),
(71, 0, 3, 11, 12, 9098564230, 9098564230, '', 2, '2022-01-24 16:31:22', 'Semd Money to Wallet'),
(72, 0, 4, 11, 17, 9098564230, 9098564230, '', 2, '2022-01-24 16:31:22', 'Semd Money to Wallet'),
(73, 0, 5, 11, 22, 9098564230, 9098564230, '', 2, '2022-01-24 16:31:22', 'Semd Money to Wallet'),
(74, 0, 1, 11, 2, 9098564230, 9098564230, '', 1, '2022-01-24 16:32:02', 'Semd Money to Wallet'),
(75, 0, 2, 11, 7, 9098564230, 9098564230, '', 1, '2022-01-24 16:32:02', 'Semd Money to Wallet'),
(76, 0, 3, 11, 12, 9098564230, 9098564230, '', 1, '2022-01-24 16:32:02', 'Semd Money to Wallet'),
(77, 0, 4, 11, 17, 9098564230, 9098564230, '', 1, '2022-01-24 16:32:02', 'Semd Money to Wallet'),
(78, 0, 5, 11, 22, 9098564230, 9098564230, '', 1, '2022-01-24 16:32:02', 'Semd Money to Wallet'),
(79, 0, 1, 11, 2, 9098564230, 9098564230, '', 1, '2022-01-25 04:30:36', 'Semd Money to Wallet'),
(80, 0, 2, 11, 7, 9098564230, 9098564230, '', 1, '2022-01-25 04:30:36', 'Semd Money to Wallet'),
(81, 0, 3, 11, 12, 9098564230, 9098564230, '', 1, '2022-01-25 04:30:36', 'Semd Money to Wallet'),
(82, 0, 4, 11, 17, 9098564230, 9098564230, '', 1, '2022-01-25 04:30:36', 'Semd Money to Wallet'),
(83, 0, 5, 11, 22, 9098564230, 9098564230, '', 1, '2022-01-25 04:30:36', 'Semd Money to Wallet'),
(84, 3, 1, 11, 2, 9098564230, 9098564230, '', 1, '2022-01-25 10:21:19', 'Semd Money to Wallet'),
(85, 3, 2, 11, 7, 9098564230, 9098564230, '', 1, '2022-01-25 10:21:19', 'Semd Money to Wallet'),
(86, 3, 3, 11, 12, 9098564230, 9098564230, '', 1, '2022-01-25 10:21:19', 'Semd Money to Wallet'),
(87, 3, 4, 11, 17, 9098564230, 9098564230, '', 1, '2022-01-25 10:21:19', 'Semd Money to Wallet'),
(88, 3, 5, 11, 22, 9098564230, 9098564230, '', 1, '2022-01-25 10:21:19', 'Semd Money to Wallet'),
(89, 3, 1, 11, 2, 9098564230, 9098564230, '', 1, '2022-01-25 10:32:38', 'Semd Money to Wallet'),
(90, 3, 2, 11, 7, 9098564230, 9098564230, '', 1, '2022-01-25 10:32:38', 'Semd Money to Wallet'),
(91, 3, 3, 11, 12, 9098564230, 9098564230, '', 1, '2022-01-25 10:32:38', 'Semd Money to Wallet'),
(92, 3, 4, 11, 17, 9098564230, 9098564230, '', 1, '2022-01-25 10:32:38', 'Semd Money to Wallet'),
(93, 3, 5, 11, 22, 9098564230, 9098564230, '', 1, '2022-01-25 10:32:38', 'Semd Money to Wallet'),
(94, 3, 1, 11, 2, 9098564230, 9098564230, '', 2, '2022-01-25 12:39:51', 'Semd Money to Wallet'),
(95, 3, 2, 11, 7, 9098564230, 9098564230, '', 2, '2022-01-25 12:39:51', 'Semd Money to Wallet'),
(96, 3, 3, 11, 12, 9098564230, 9098564230, '', 2, '2022-01-25 12:39:51', 'Semd Money to Wallet'),
(97, 3, 4, 11, 17, 9098564230, 9098564230, '', 2, '2022-01-25 12:39:51', 'Semd Money to Wallet'),
(98, 3, 5, 11, 22, 9098564230, 9098564230, '', 2, '2022-01-25 12:39:51', 'Semd Money to Wallet'),
(99, 3, 1, 11, 2, 9098564230, 9098564230, '', 2, '2022-01-25 12:40:28', 'Semd Money to Wallet'),
(100, 3, 2, 11, 7, 9098564230, 9098564230, '', 2, '2022-01-25 12:40:28', 'Semd Money to Wallet'),
(101, 3, 3, 11, 12, 9098564230, 9098564230, '', 2, '2022-01-25 12:40:28', 'Semd Money to Wallet'),
(102, 3, 4, 11, 17, 9098564230, 9098564230, '', 2, '2022-01-25 12:40:28', 'Semd Money to Wallet'),
(103, 3, 5, 11, 22, 9098564230, 9098564230, '', 2, '2022-01-25 12:40:28', 'Semd Money to Wallet'),
(104, 3, 1, 11, 2, 9098564230, 9098564230, '', 2, '2022-01-25 12:59:58', 'Semd Money to Wallet'),
(105, 3, 2, 11, 7, 9098564230, 9098564230, '', 2, '2022-01-25 12:59:58', 'Semd Money to Wallet'),
(106, 3, 3, 11, 12, 9098564230, 9098564230, '', 2, '2022-01-25 12:59:58', 'Semd Money to Wallet'),
(107, 3, 4, 11, 17, 9098564230, 9098564230, '', 2, '2022-01-25 12:59:58', 'Semd Money to Wallet'),
(108, 3, 5, 11, 22, 9098564230, 9098564230, '', 2, '2022-01-25 12:59:58', 'Semd Money to Wallet'),
(109, 3, 1, 11, 2, 9098564230, 9098564230, '', 2, '2022-01-25 13:14:18', 'Semd Money to Wallet'),
(110, 3, 2, 11, 7, 9098564230, 9098564230, '', 2, '2022-01-25 13:14:18', 'Semd Money to Wallet'),
(111, 3, 3, 11, 12, 9098564230, 9098564230, '', 2, '2022-01-25 13:14:18', 'Semd Money to Wallet'),
(112, 3, 4, 11, 17, 9098564230, 9098564230, '', 2, '2022-01-25 13:14:18', 'Semd Money to Wallet'),
(113, 3, 5, 11, 22, 9098564230, 9098564230, '', 2, '2022-01-25 13:14:18', 'Semd Money to Wallet'),
(114, 3, 1, 13, 3, 9098564230, 9098564230, '', 1, '2022-01-25 19:36:21', 'Semd Money to Wallet'),
(115, 3, 2, 13, 8, 9098564230, 9098564230, '', 1, '2022-01-25 19:36:21', 'Semd Money to Wallet'),
(116, 3, 3, 13, 13, 9098564230, 9098564230, '', 1, '2022-01-25 19:36:21', 'Semd Money to Wallet'),
(117, 3, 4, 13, 18, 9098564230, 9098564230, '', 1, '2022-01-25 19:36:21', 'Semd Money to Wallet'),
(118, 3, 5, 13, 23, 9098564230, 9098564230, '', 1, '2022-01-25 19:36:21', 'Semd Money to Wallet'),
(119, 0, 3, 0, 13, 0, 0, 'add', 15, '2022-01-26 11:44:39', 'Cheque add to user wallet'),
(120, 0, 3, 0, 13, 0, 0, 'add', 10, '2022-01-26 11:45:31', 'Cheque add to user wallet'),
(121, 0, 3, 0, 13, 0, 0, 'add', 5, '2022-01-26 11:47:22', 'Cheque add to user wallet'),
(122, 0, 3, 0, 13, 0, 0, 'add', 5, '2022-01-26 11:48:03', 'Cheque add to user wallet'),
(123, 4, 0, 16, 0, 9098564230, 0, '', 3, '2022-01-26 16:13:51', 'Cheque Not Accepted Due to Insufficient Balance so charge of 3% paid to admin'),
(124, 4, 0, 16, 0, 9098564230, 0, '', 3, '2022-01-26 16:23:25', 'Cheque Not Accepted Due to Insufficient Balance so charge of 3% paid to admin'),
(125, 4, 0, 16, 0, 9098564230, 0, '', 3, '2022-01-27 03:57:03', 'Cheque Not Accepted Due to Insufficient Balance so charge of 3% paid to admin'),
(126, 3, 0, 11, 0, 9098564230, 0, '', 2, '2022-01-27 04:10:55', 'Cheque Expired so charge of 1% paid to admin'),
(127, 5, 0, 25, 0, 9098564230, 0, '', 2, '2022-01-27 04:10:55', 'Cheque Expired so charge of 1% paid to admin'),
(128, 3, 0, 11, 0, 9098564230, 0, '', 2, '2022-01-27 04:16:20', 'Cheque Expired so charge of 1% paid to admin'),
(129, 5, 0, 25, 0, 9098564230, 0, '', 2, '2022-01-27 04:16:20', 'Cheque Expired so charge of 1% paid to admin'),
(130, 4, 0, 16, 0, 9098564230, 0, '', 3, '2022-01-27 04:16:25', 'Cheque Not Accepted Due to Insufficient Balance so charge of 3% paid to admin'),
(131, 3, 1, 12, 1, 9098564230, 9098564230, '', 2, '2022-01-27 07:32:14', 'Semd Money to Wallet'),
(132, 3, 2, 12, 6, 9098564230, 9098564230, '', 2, '2022-01-27 07:32:14', 'Semd Money to Wallet'),
(133, 3, 3, 12, 11, 9098564230, 9098564230, '', 2, '2022-01-27 07:32:14', 'Semd Money to Wallet'),
(134, 3, 4, 12, 16, 9098564230, 9098564230, '', 2, '2022-01-27 07:32:14', 'Semd Money to Wallet'),
(135, 3, 1, 11, 2, 9098564230, 9098564230, '', 2, '2022-01-27 07:37:22', 'Semd Money to Wallet'),
(136, 3, 2, 11, 7, 9098564230, 9098564230, '', 2, '2022-01-27 07:37:22', 'Semd Money to Wallet'),
(137, 3, 3, 11, 12, 9098564230, 9098564230, '', 2, '2022-01-27 07:37:22', 'Semd Money to Wallet'),
(138, 3, 4, 11, 17, 9098564230, 9098564230, '', 2, '2022-01-27 07:37:22', 'Semd Money to Wallet'),
(139, 3, 5, 11, 22, 9098564230, 9098564230, '', 2, '2022-01-27 07:37:22', 'Semd Money to Wallet'),
(140, 3, 1, 11, 2, 9098564230, 9098564230, '', 2, '2022-01-27 10:29:11', 'Send Money to Wallet'),
(141, 3, 2, 11, 7, 9098564230, 9098564230, '', 2, '2022-01-27 10:29:11', 'Send Money to Wallet'),
(142, 3, 3, 11, 12, 9098564230, 9098564230, '', 2, '2022-01-27 10:29:11', 'Send Money to Wallet'),
(143, 3, 4, 11, 17, 9098564230, 9098564230, '', 2, '2022-01-27 10:29:11', 'Send Money to Wallet'),
(144, 3, 5, 11, 22, 9098564230, 9098564230, '', 2, '2022-01-27 10:29:11', 'Send Money to Wallet'),
(145, 3, 5, 13, 24, 9098564230, 9098564230, '', 5, '2022-01-27 11:17:34', 'Pending for Admins Permission'),
(146, 3, 1, 11, 2, 9098564230, 9098564230, '', 5, '2022-01-28 06:47:49', 'Send Money to Wallet'),
(147, 3, 2, 11, 7, 9098564230, 9098564230, '', 5, '2022-01-28 06:47:49', 'Send Money to Wallet'),
(148, 3, 3, 11, 12, 9098564230, 9098564230, '', 5, '2022-01-28 06:47:49', 'Send Money to Wallet'),
(149, 3, 4, 11, 17, 9098564230, 9098564230, '', 5, '2022-01-28 06:47:49', 'Send Money to Wallet'),
(150, 3, 5, 11, 22, 9098564230, 9098564230, '', 5, '2022-01-28 06:47:49', 'Send Money to Wallet'),
(151, 3, 1, 11, 2, 9098564230, 9098564230, '', 5, '2022-01-28 06:48:31', 'Send Money to Wallet'),
(152, 3, 2, 11, 7, 9098564230, 9098564230, '', 5, '2022-01-28 06:48:31', 'Send Money to Wallet'),
(153, 3, 3, 11, 12, 9098564230, 9098564230, '', 5, '2022-01-28 06:48:31', 'Send Money to Wallet'),
(154, 3, 4, 11, 17, 9098564230, 9098564230, '', 5, '2022-01-28 06:48:31', 'Send Money to Wallet'),
(155, 3, 5, 11, 22, 9098564230, 9098564230, '', 5, '2022-01-28 06:48:31', 'Send Money to Wallet'),
(156, 13, 0, 52, 0, 0, 0, 'buy', 1, '2022-01-31 07:14:24', 'Buy Bond'),
(157, 13, 0, 52, 0, 0, 0, 'buy', 1, '2022-01-31 07:41:45', 'Buy Bond'),
(158, 3, 0, 15, 0, 0, 0, '', 0, '2022-02-01 09:35:34', 'Insurance buyed Successfully'),
(159, 3, 1, 11, 3, 9098564230, 9098564230, '', 2, '2022-02-08 13:08:21', 'Send Money to Wallet'),
(160, 3, 2, 11, 8, 9098564230, 9098564230, '', 2, '2022-02-08 13:08:21', 'Send Money to Wallet'),
(161, 3, 3, 11, 13, 9098564230, 9098564230, '', 2, '2022-02-08 13:08:21', 'Send Money to Wallet'),
(162, 3, 4, 11, 18, 9098564230, 9098564230, '', 2, '2022-02-08 13:08:21', 'Send Money to Wallet'),
(163, 3, 5, 11, 23, 9098564230, 9098564230, '', 2, '2022-02-08 13:08:21', 'Send Money to Wallet'),
(164, 3, 1, 12, 1, 9098564230, 9098564230, '', 2, '2022-02-08 13:20:40', 'Send Money to Wallet'),
(165, 3, 2, 12, 6, 9098564230, 9098564230, '', 2, '2022-02-08 13:20:40', 'Send Money to Wallet'),
(166, 3, 3, 12, 11, 9098564230, 9098564230, '', 2, '2022-02-08 13:20:40', 'Send Money to Wallet'),
(167, 3, 5, 13, 24, 9098564230, 9098564230, '', 2, '2022-02-08 13:34:14', 'Pending for Admins Permission'),
(168, 3, 5, 13, 24, 9098564230, 9098564230, '', 2, '2022-02-08 13:39:31', 'Pending for Admins Permission'),
(169, 3, 1, 11, 2, 9098564230, 9098564230, '', 2, '2022-02-08 13:51:35', 'Send Money to Wallet'),
(170, 3, 2, 11, 7, 9098564230, 9098564230, '', 2, '2022-02-08 13:51:35', 'Send Money to Wallet'),
(171, 3, 3, 11, 12, 9098564230, 9098564230, '', 2, '2022-02-08 13:51:35', 'Send Money to Wallet'),
(172, 3, 4, 11, 17, 9098564230, 9098564230, '', 2, '2022-02-08 13:51:35', 'Send Money to Wallet'),
(173, 3, 5, 11, 22, 9098564230, 9098564230, '', 2, '2022-02-08 13:51:35', 'Send Money to Wallet'),
(174, 3, 1, 11, 2, 9098564230, 9098564230, '', 2, '2022-02-09 06:57:40', 'Send Money to Wallet'),
(175, 3, 2, 11, 7, 9098564230, 9098564230, '', 2, '2022-02-09 06:57:40', 'Send Money to Wallet'),
(176, 3, 3, 11, 12, 9098564230, 9098564230, '', 2, '2022-02-09 06:57:40', 'Send Money to Wallet'),
(177, 3, 4, 11, 17, 9098564230, 9098564230, '', 2, '2022-02-09 06:57:40', 'Send Money to Wallet'),
(178, 3, 5, 11, 22, 9098564230, 9098564230, '', 2, '2022-02-09 06:57:40', 'Send Money to Wallet'),
(179, 3, 1, 11, 2, 9098564230, 9098564230, '', 2, '2022-02-09 07:05:38', 'Send Money to Wallet'),
(180, 3, 2, 11, 7, 9098564230, 9098564230, '', 2, '2022-02-09 07:05:38', 'Send Money to Wallet'),
(181, 3, 3, 11, 12, 9098564230, 9098564230, '', 2, '2022-02-09 07:05:38', 'Send Money to Wallet'),
(182, 3, 4, 11, 17, 9098564230, 9098564230, '', 2, '2022-02-09 07:05:38', 'Send Money to Wallet'),
(183, 3, 5, 11, 22, 9098564230, 9098564230, '', 2, '2022-02-09 07:05:38', 'Send Money to Wallet'),
(184, 3, 1, 11, 2, 9098564230, 9098564230, '', 2, '2022-02-09 07:15:24', 'Send Money to Wallet'),
(185, 3, 2, 11, 7, 9098564230, 9098564230, '', 2, '2022-02-09 07:15:24', 'Send Money to Wallet'),
(186, 3, 3, 11, 12, 9098564230, 9098564230, '', 2, '2022-02-09 07:15:24', 'Send Money to Wallet'),
(187, 3, 4, 11, 17, 9098564230, 9098564230, '', 2, '2022-02-09 07:15:24', 'Send Money to Wallet'),
(188, 3, 5, 11, 22, 9098564230, 9098564230, '', 2, '2022-02-09 07:15:24', 'Send Money to Wallet'),
(189, 3, 1, 11, 2, 9098564230, 9098564230, '', 2, '2022-02-09 07:18:49', 'Send Money to Wallet'),
(190, 3, 2, 11, 7, 9098564230, 9098564230, '', 2, '2022-02-09 07:18:49', 'Send Money to Wallet'),
(191, 3, 3, 11, 12, 9098564230, 9098564230, '', 2, '2022-02-09 07:18:49', 'Send Money to Wallet'),
(192, 3, 4, 11, 17, 9098564230, 9098564230, '', 2, '2022-02-09 07:18:49', 'Send Money to Wallet'),
(193, 3, 5, 11, 22, 9098564230, 9098564230, '', 2, '2022-02-09 07:18:49', 'Send Money to Wallet'),
(194, 3, 1, 12, 1, 9098564230, 9098564230, '', 2, '2022-02-09 07:22:58', 'Send Money to Wallet'),
(195, 3, 2, 12, 6, 9098564230, 9098564230, '', 2, '2022-02-09 07:22:58', 'Send Money to Wallet'),
(196, 3, 3, 12, 11, 9098564230, 9098564230, '', 2, '2022-02-09 07:22:58', 'Send Money to Wallet'),
(197, 3, 1, 11, 2, 9098564230, 9098564230, '', 2, '2022-02-09 07:27:08', 'Send Money to Wallet'),
(198, 3, 2, 11, 7, 9098564230, 9098564230, '', 2, '2022-02-09 07:27:08', 'Send Money to Wallet'),
(199, 3, 3, 11, 12, 9098564230, 9098564230, '', 2, '2022-02-09 07:27:08', 'Send Money to Wallet'),
(200, 3, 4, 11, 17, 9098564230, 9098564230, '', 2, '2022-02-09 07:27:08', 'Send Money to Wallet'),
(201, 3, 5, 11, 22, 9098564230, 9098564230, '', 2, '2022-02-09 07:27:08', 'Send Money to Wallet'),
(202, 3, 1, 11, 2, 9098564230, 9098564230, '', 2, '2022-02-09 07:29:36', 'Send Money to Wallet'),
(203, 3, 2, 11, 7, 9098564230, 9098564230, '', 2, '2022-02-09 07:29:36', 'Send Money to Wallet'),
(204, 3, 3, 11, 12, 9098564230, 9098564230, '', 2, '2022-02-09 07:29:36', 'Send Money to Wallet'),
(205, 3, 4, 11, 17, 9098564230, 9098564230, '', 2, '2022-02-09 07:29:36', 'Send Money to Wallet'),
(206, 3, 5, 11, 22, 9098564230, 9098564230, '', 2, '2022-02-09 07:29:36', 'Send Money to Wallet'),
(207, 3, 5, 13, 24, 9098564230, 9098564230, '', 2, '2022-02-09 07:54:49', 'Pending for Admins Permission'),
(208, 3, 5, 13, 24, 9098564230, 9098564230, '', 2, '2022-02-09 07:55:13', 'Pending for Admins Permission'),
(209, 3, 1, 11, 2, 9098564230, 9098564230, '', 2, '2022-02-09 09:05:02', 'Send Money to Wallet'),
(210, 3, 2, 11, 7, 9098564230, 9098564230, '', 2, '2022-02-09 09:05:02', 'Send Money to Wallet'),
(211, 3, 3, 11, 12, 9098564230, 9098564230, '', 2, '2022-02-09 09:05:02', 'Send Money to Wallet'),
(212, 3, 4, 11, 17, 9098564230, 9098564230, '', 2, '2022-02-09 09:05:02', 'Send Money to Wallet'),
(213, 3, 5, 11, 22, 9098564230, 9098564230, '', 2, '2022-02-09 09:05:02', 'Send Money to Wallet'),
(214, 3, 1, 11, 2, 9098564230, 9098564230, '', 2, '2022-02-09 09:11:27', 'Send Money to Wallet'),
(215, 3, 2, 11, 7, 9098564230, 9098564230, '', 2, '2022-02-09 09:11:27', 'Send Money to Wallet'),
(216, 3, 3, 11, 12, 9098564230, 9098564230, '', 2, '2022-02-09 09:11:27', 'Send Money to Wallet'),
(217, 3, 4, 11, 17, 9098564230, 9098564230, '', 2, '2022-02-09 09:11:27', 'Send Money to Wallet'),
(218, 3, 5, 11, 22, 9098564230, 9098564230, '', 2, '2022-02-09 09:11:27', 'Send Money to Wallet'),
(219, 3, 14, 11, 57, 9098564230, 1223456789, '', 2, '2022-02-09 09:15:07', 'Send Money to Wallet'),
(220, 3, 1, 11, 2, 9098564230, 9098564230, '', 2, '2022-02-09 09:25:28', 'Send Money to Wallet'),
(221, 3, 2, 11, 7, 9098564230, 9098564230, '', 2, '2022-02-09 09:25:28', 'Send Money to Wallet'),
(222, 3, 3, 11, 12, 9098564230, 9098564230, '', 2, '2022-02-09 09:25:28', 'Send Money to Wallet'),
(223, 3, 4, 11, 17, 9098564230, 9098564230, '', 2, '2022-02-09 09:25:28', 'Send Money to Wallet'),
(224, 3, 5, 11, 22, 9098564230, 9098564230, '', 2, '2022-02-09 09:25:28', 'Send Money to Wallet'),
(225, 3, 1, 11, 2, 9098564230, 9098564230, '', 1, '2022-02-09 09:52:52', 'Send Money to Wallet'),
(226, 3, 2, 11, 7, 9098564230, 9098564230, '', 1, '2022-02-09 09:52:52', 'Send Money to Wallet'),
(227, 3, 3, 11, 12, 9098564230, 9098564230, '', 1, '2022-02-09 09:52:52', 'Send Money to Wallet'),
(228, 3, 4, 11, 17, 9098564230, 9098564230, '', 1, '2022-02-09 09:52:52', 'Send Money to Wallet'),
(229, 3, 5, 11, 22, 9098564230, 9098564230, '', 1, '2022-02-09 09:52:52', 'Send Money to Wallet'),
(230, 3, 1, 11, 2, 9098564230, 9098564230, '', 2, '2022-02-09 10:10:12', 'Send Money to Wallet'),
(231, 3, 2, 11, 7, 9098564230, 9098564230, '', 2, '2022-02-09 10:10:12', 'Send Money to Wallet'),
(232, 3, 3, 11, 12, 9098564230, 9098564230, '', 2, '2022-02-09 10:10:12', 'Send Money to Wallet'),
(233, 3, 4, 11, 17, 9098564230, 9098564230, '', 2, '2022-02-09 10:10:12', 'Send Money to Wallet'),
(234, 3, 5, 11, 22, 9098564230, 9098564230, '', 2, '2022-02-09 10:10:12', 'Send Money to Wallet'),
(235, 3, 1, 11, 2, 9098564230, 9098564230, '', 2, '2022-02-09 10:11:52', 'Send Money to Wallet'),
(236, 3, 2, 11, 7, 9098564230, 9098564230, '', 2, '2022-02-09 10:11:52', 'Send Money to Wallet'),
(237, 3, 3, 11, 12, 9098564230, 9098564230, '', 2, '2022-02-09 10:11:52', 'Send Money to Wallet'),
(238, 3, 4, 11, 17, 9098564230, 9098564230, '', 2, '2022-02-09 10:11:52', 'Send Money to Wallet'),
(239, 3, 5, 11, 22, 9098564230, 9098564230, '', 2, '2022-02-09 10:11:52', 'Send Money to Wallet'),
(240, 3, 1, 11, 2, 9098564230, 9098564230, '', 2, '2022-02-09 10:12:41', 'Send Money to Wallet'),
(241, 3, 2, 11, 7, 9098564230, 9098564230, '', 2, '2022-02-09 10:12:41', 'Send Money to Wallet'),
(242, 3, 3, 11, 12, 9098564230, 9098564230, '', 2, '2022-02-09 10:12:41', 'Send Money to Wallet'),
(243, 3, 4, 11, 17, 9098564230, 9098564230, '', 2, '2022-02-09 10:12:41', 'Send Money to Wallet'),
(244, 3, 5, 11, 22, 9098564230, 9098564230, '', 2, '2022-02-09 10:12:41', 'Send Money to Wallet'),
(245, 3, 1, 11, 2, 9098564230, 9098564230, '', 2, '2022-02-09 10:12:50', 'Send Money to Wallet'),
(246, 3, 2, 11, 7, 9098564230, 9098564230, '', 2, '2022-02-09 10:12:50', 'Send Money to Wallet'),
(247, 3, 3, 11, 12, 9098564230, 9098564230, '', 2, '2022-02-09 10:12:50', 'Send Money to Wallet'),
(248, 3, 4, 11, 17, 9098564230, 9098564230, '', 2, '2022-02-09 10:12:50', 'Send Money to Wallet'),
(249, 3, 5, 11, 22, 9098564230, 9098564230, '', 2, '2022-02-09 10:12:50', 'Send Money to Wallet'),
(250, 3, 1, 11, 2, 9098564230, 9098564230, '', 2, '2022-02-09 10:13:12', 'Send Money to Wallet'),
(251, 3, 2, 11, 7, 9098564230, 9098564230, '', 2, '2022-02-09 10:13:12', 'Send Money to Wallet'),
(252, 3, 3, 11, 12, 9098564230, 9098564230, '', 2, '2022-02-09 10:13:12', 'Send Money to Wallet'),
(253, 3, 4, 11, 17, 9098564230, 9098564230, '', 2, '2022-02-09 10:13:12', 'Send Money to Wallet'),
(254, 3, 5, 11, 22, 9098564230, 9098564230, '', 2, '2022-02-09 10:13:12', 'Send Money to Wallet'),
(255, 3, 1, 11, 2, 9098564230, 9098564230, '', 2, '2022-02-09 10:16:39', 'Send Money to Wallet'),
(256, 3, 2, 11, 7, 9098564230, 9098564230, '', 2, '2022-02-09 10:16:39', 'Send Money to Wallet'),
(257, 3, 3, 11, 12, 9098564230, 9098564230, '', 2, '2022-02-09 10:16:39', 'Send Money to Wallet'),
(258, 3, 4, 11, 17, 9098564230, 9098564230, '', 2, '2022-02-09 10:16:39', 'Send Money to Wallet'),
(259, 3, 5, 11, 22, 9098564230, 9098564230, '', 2, '2022-02-09 10:16:39', 'Send Money to Wallet'),
(260, 3, 1, 11, 2, 9098564230, 9098564230, '', 1, '2022-02-09 10:17:20', 'Send Money to Wallet'),
(261, 3, 2, 11, 7, 9098564230, 9098564230, '', 1, '2022-02-09 10:17:20', 'Send Money to Wallet'),
(262, 3, 3, 11, 12, 9098564230, 9098564230, '', 1, '2022-02-09 10:17:20', 'Send Money to Wallet'),
(263, 3, 4, 11, 17, 9098564230, 9098564230, '', 1, '2022-02-09 10:17:20', 'Send Money to Wallet'),
(264, 3, 5, 11, 22, 9098564230, 9098564230, '', 1, '2022-02-09 10:17:20', 'Send Money to Wallet'),
(265, 3, 1, 11, 2, 9098564230, 9098564230, '', 1, '2022-02-09 10:41:44', 'Send Money to Wallet'),
(266, 3, 2, 11, 7, 9098564230, 9098564230, '', 1, '2022-02-09 10:41:44', 'Send Money to Wallet'),
(267, 3, 3, 11, 12, 9098564230, 9098564230, '', 1, '2022-02-09 10:41:44', 'Send Money to Wallet'),
(268, 3, 4, 11, 17, 9098564230, 9098564230, '', 1, '2022-02-09 10:41:44', 'Send Money to Wallet'),
(269, 3, 5, 11, 22, 9098564230, 9098564230, '', 1, '2022-02-09 10:41:44', 'Send Money to Wallet'),
(270, 3, 1, 11, 2, 9098564230, 9098564230, '', 1, '2022-02-09 10:54:10', 'Send Money to Wallet'),
(271, 3, 2, 11, 7, 9098564230, 9098564230, '', 1, '2022-02-09 10:54:10', 'Send Money to Wallet'),
(272, 3, 3, 11, 12, 9098564230, 9098564230, '', 1, '2022-02-09 10:54:10', 'Send Money to Wallet'),
(273, 3, 4, 11, 17, 9098564230, 9098564230, '', 1, '2022-02-09 10:54:10', 'Send Money to Wallet'),
(274, 3, 5, 11, 22, 9098564230, 9098564230, '', 1, '2022-02-09 10:54:10', 'Send Money to Wallet'),
(275, 3, 1, 11, 2, 9098564230, 9098564230, '', 1, '2022-02-09 10:56:12', 'Send Money to Wallet'),
(276, 3, 2, 11, 7, 9098564230, 9098564230, '', 1, '2022-02-09 10:56:12', 'Send Money to Wallet'),
(277, 3, 3, 11, 12, 9098564230, 9098564230, '', 1, '2022-02-09 10:56:12', 'Send Money to Wallet'),
(278, 3, 4, 11, 17, 9098564230, 9098564230, '', 1, '2022-02-09 10:56:12', 'Send Money to Wallet'),
(279, 3, 5, 11, 22, 9098564230, 9098564230, '', 1, '2022-02-09 10:56:12', 'Send Money to Wallet'),
(280, 3, 1, 11, 2, 9098564230, 9098564230, '', 1, '2022-02-09 10:57:28', 'Send Money to Wallet'),
(281, 3, 2, 11, 7, 9098564230, 9098564230, '', 1, '2022-02-09 10:57:28', 'Send Money to Wallet'),
(282, 3, 3, 11, 12, 9098564230, 9098564230, '', 1, '2022-02-09 10:57:28', 'Send Money to Wallet'),
(283, 3, 4, 11, 17, 9098564230, 9098564230, '', 1, '2022-02-09 10:57:28', 'Send Money to Wallet'),
(284, 3, 1, 11, 2, 9098564230, 9098564230, '', 1, '2022-02-09 11:00:41', 'Send Money to Wallet'),
(285, 3, 2, 11, 7, 9098564230, 9098564230, '', 1, '2022-02-09 11:00:41', 'Send Money to Wallet'),
(286, 3, 3, 11, 12, 9098564230, 9098564230, '', 1, '2022-02-09 11:00:41', 'Send Money to Wallet'),
(287, 3, 4, 11, 17, 9098564230, 9098564230, '', 1, '2022-02-09 11:00:41', 'Send Money to Wallet'),
(288, 3, 5, 11, 22, 9098564230, 9098564230, '', 1, '2022-02-09 11:00:41', 'Send Money to Wallet'),
(289, 3, 1, 11, 2, 9098564230, 9098564230, '', 1, '2022-02-09 11:03:57', 'Send Money to Wallet'),
(290, 3, 2, 11, 7, 9098564230, 9098564230, '', 1, '2022-02-09 11:03:57', 'Send Money to Wallet'),
(291, 3, 3, 11, 12, 9098564230, 9098564230, '', 1, '2022-02-09 11:03:57', 'Send Money to Wallet'),
(292, 3, 4, 11, 17, 9098564230, 9098564230, '', 1, '2022-02-09 11:03:57', 'Send Money to Wallet'),
(293, 3, 5, 11, 22, 9098564230, 9098564230, '', 1, '2022-02-09 11:03:57', 'Send Money to Wallet'),
(294, 3, 1, 11, 2, 9098564230, 9098564230, '', 1, '2022-02-09 11:05:46', 'Send Money to Wallet'),
(295, 3, 2, 11, 7, 9098564230, 9098564230, '', 1, '2022-02-09 11:05:46', 'Send Money to Wallet'),
(296, 3, 3, 11, 12, 9098564230, 9098564230, '', 1, '2022-02-09 11:05:46', 'Send Money to Wallet'),
(297, 3, 4, 11, 17, 9098564230, 9098564230, '', 1, '2022-02-09 11:05:46', 'Send Money to Wallet'),
(298, 3, 5, 11, 22, 9098564230, 9098564230, '', 1, '2022-02-09 11:05:46', 'Send Money to Wallet'),
(299, 3, 1, 11, 2, 9098564230, 9098564230, '', 1, '2022-02-09 11:13:43', 'Send Money to Wallet'),
(300, 3, 2, 11, 7, 9098564230, 9098564230, '', 1, '2022-02-09 11:13:43', 'Send Money to Wallet'),
(301, 3, 3, 11, 12, 9098564230, 9098564230, '', 1, '2022-02-09 11:13:43', 'Send Money to Wallet'),
(302, 3, 4, 11, 17, 9098564230, 9098564230, '', 1, '2022-02-09 11:13:43', 'Send Money to Wallet'),
(303, 3, 5, 11, 22, 9098564230, 9098564230, '', 1, '2022-02-09 11:13:43', 'Send Money to Wallet'),
(304, 3, 1, 11, 2, 9098564230, 9098564230, '', 1, '2022-02-09 11:15:11', 'Send Money to Wallet'),
(305, 3, 2, 11, 7, 9098564230, 9098564230, '', 1, '2022-02-09 11:15:11', 'Send Money to Wallet'),
(306, 3, 3, 11, 12, 9098564230, 9098564230, '', 1, '2022-02-09 11:15:11', 'Send Money to Wallet'),
(307, 3, 4, 11, 17, 9098564230, 9098564230, '', 1, '2022-02-09 11:15:11', 'Send Money to Wallet'),
(308, 3, 5, 11, 22, 9098564230, 9098564230, '', 1, '2022-02-09 11:15:11', 'Send Money to Wallet'),
(309, 3, 1, 11, 2, 9098564230, 9098564230, '', 1, '2022-02-09 11:16:50', 'Send Money to Wallet'),
(310, 3, 2, 11, 7, 9098564230, 9098564230, '', 1, '2022-02-09 11:16:50', 'Send Money to Wallet'),
(311, 3, 3, 11, 12, 9098564230, 9098564230, '', 1, '2022-02-09 11:16:50', 'Send Money to Wallet'),
(312, 3, 4, 11, 17, 9098564230, 9098564230, '', 1, '2022-02-09 11:16:50', 'Send Money to Wallet'),
(313, 3, 5, 11, 22, 9098564230, 9098564230, '', 1, '2022-02-09 11:16:50', 'Send Money to Wallet'),
(314, 3, 1, 11, 2, 9098564230, 9098564230, '', 1, '2022-02-09 11:17:54', 'Send Money to Wallet'),
(315, 3, 2, 11, 7, 9098564230, 9098564230, '', 1, '2022-02-09 11:17:54', 'Send Money to Wallet'),
(316, 3, 3, 11, 12, 9098564230, 9098564230, '', 1, '2022-02-09 11:17:54', 'Send Money to Wallet'),
(317, 3, 4, 11, 17, 9098564230, 9098564230, '', 1, '2022-02-09 11:17:54', 'Send Money to Wallet'),
(318, 3, 5, 11, 22, 9098564230, 9098564230, '', 1, '2022-02-09 11:17:54', 'Send Money to Wallet'),
(319, 3, 1, 11, 2, 9098564230, 9098564230, '', 1, '2022-02-09 11:22:39', 'Send Money to Wallet'),
(320, 3, 2, 11, 7, 9098564230, 9098564230, '', 1, '2022-02-09 11:22:39', 'Send Money to Wallet'),
(321, 3, 3, 11, 12, 9098564230, 9098564230, '', 1, '2022-02-09 11:22:39', 'Send Money to Wallet'),
(322, 3, 4, 11, 17, 9098564230, 9098564230, '', 1, '2022-02-09 11:22:39', 'Send Money to Wallet'),
(323, 3, 5, 11, 22, 9098564230, 9098564230, '', 1, '2022-02-09 11:22:39', 'Send Money to Wallet'),
(324, 3, 1, 11, 2, 9098564230, 9098564230, '', 1, '2022-02-09 11:23:16', 'Send Money to Wallet'),
(325, 3, 2, 11, 7, 9098564230, 9098564230, '', 1, '2022-02-09 11:23:16', 'Send Money to Wallet'),
(326, 3, 3, 11, 12, 9098564230, 9098564230, '', 1, '2022-02-09 11:23:16', 'Send Money to Wallet'),
(327, 3, 4, 11, 17, 9098564230, 9098564230, '', 1, '2022-02-09 11:23:16', 'Send Money to Wallet'),
(328, 3, 5, 11, 22, 9098564230, 9098564230, '', 1, '2022-02-09 11:23:16', 'Send Money to Wallet'),
(329, 3, 1, 11, 2, 9098564230, 9098564230, '', 1, '2022-02-09 12:44:54', 'Send Money to Wallet'),
(330, 3, 2, 11, 7, 9098564230, 9098564230, '', 1, '2022-02-09 12:44:54', 'Send Money to Wallet'),
(331, 3, 3, 11, 12, 9098564230, 9098564230, '', 1, '2022-02-09 12:44:54', 'Send Money to Wallet'),
(332, 3, 4, 11, 17, 9098564230, 9098564230, '', 1, '2022-02-09 12:44:54', 'Send Money to Wallet'),
(333, 3, 5, 11, 22, 9098564230, 9098564230, '', 1, '2022-02-09 12:44:54', 'Send Money to Wallet'),
(334, 3, 1, 11, 2, 9098564230, 9098564230, '', 1, '2022-02-09 12:46:33', 'Send Money to Wallet'),
(335, 3, 2, 11, 7, 9098564230, 9098564230, '', 1, '2022-02-09 12:46:33', 'Send Money to Wallet'),
(336, 3, 3, 11, 12, 9098564230, 9098564230, '', 1, '2022-02-09 12:46:33', 'Send Money to Wallet'),
(337, 3, 4, 11, 17, 9098564230, 9098564230, '', 1, '2022-02-09 12:46:33', 'Send Money to Wallet'),
(338, 3, 5, 11, 22, 9098564230, 9098564230, '', 1, '2022-02-09 12:46:33', 'Send Money to Wallet'),
(339, 3, 1, 12, 1, 9098564230, 9098564230, '', 10, '2022-02-09 12:55:03', 'Send Money to Wallet'),
(340, 3, 1, 11, 2, 9098564230, 9098564230, '', 10, '2022-02-09 12:56:00', 'Send Money to Wallet'),
(341, 3, 2, 11, 7, 9098564230, 9098564230, '', 10, '2022-02-09 12:56:00', 'Send Money to Wallet'),
(342, 3, 3, 11, 12, 9098564230, 9098564230, '', 10, '2022-02-09 12:56:00', 'Send Money to Wallet'),
(343, 3, 4, 11, 17, 9098564230, 9098564230, '', 10, '2022-02-09 12:56:00', 'Send Money to Wallet'),
(344, 3, 5, 11, 22, 9098564230, 9098564230, '', 10, '2022-02-09 12:56:00', 'Send Money to Wallet'),
(345, 3, 1, 12, 1, 9098564230, 9098564230, '', 10, '2022-02-09 12:58:02', 'Send Money to Wallet'),
(346, 3, 1, 11, 2, 9098564230, 9098564230, '', 2, '2022-02-10 10:03:14', 'Send Money to Wallet'),
(347, 3, 2, 11, 7, 9098564230, 9098564230, '', 2, '2022-02-10 10:03:14', 'Send Money to Wallet'),
(348, 3, 3, 11, 12, 9098564230, 9098564230, '', 2, '2022-02-10 10:03:14', 'Send Money to Wallet'),
(349, 3, 4, 11, 17, 9098564230, 9098564230, '', 2, '2022-02-10 10:03:14', 'Send Money to Wallet'),
(350, 3, 5, 11, 22, 9098564230, 9098564230, '', 2, '2022-02-10 10:03:14', 'Send Money to Wallet'),
(10994, 6, 1, 28, 3, 0, 0, 'buy', 15, '2021-12-30 18:02:28', 'Coin subtract to user wallet'),
(10995, 6, 1, 28, 3, 0, 0, 'sell', 15, '2021-12-30 18:02:28', 'Coin add to user wallet'),
(10996, 2, 1, 8, 3, 0, 0, 'buy', 40, '2021-12-30 18:05:00', 'Coin subtract to user wallet'),
(10997, 3, 5, 14, 23, 0, 0, 'sell', 25, '2021-12-30 18:09:06', 'Coin add to user wallet'),
(10998, 3, 5, 14, 23, 0, 0, 'buy', 25, '2021-12-30 18:10:30', 'Coin subtract to user wallet'),
(10999, 3, 5, 14, 23, 0, 0, 'sell', 25, '2021-12-30 18:10:30', 'Coin add to user wallet'),
(11000, 5, 1, 23, 3, 0, 0, 'transfer', 50, '2021-12-30 18:12:48', 'Coin subtract to user wallet'),
(11097, 2, 1, 8, 3, 0, 0, 'sell', 40, '2021-12-30 18:05:00', 'Coin add to user wallet'),
(11098, 6, 5, 28, 23, 0, 0, 'buy', 10, '2021-12-30 18:06:25', 'Coin subtract to user wallet'),
(11099, 6, 5, 28, 23, 0, 0, 'sell', 10, '2021-12-30 18:06:25', 'Coin add to user wallet'),
(11100, 3, 5, 14, 23, 0, 0, 'buy', 25, '2021-12-30 18:09:06', 'Coin subtract to user wallet'),
(11101, 3, 0, 11, 0, 9098564230, 0, '', 1, '2022-02-15 07:54:52', 'Cheque Expired so charge of 1% paid to admin'),
(11102, 13, 0, 55, 0, 9999999999, 0, '', 1, '2022-02-15 07:54:52', 'Cheque Expired so charge of 1% paid to admin'),
(11103, 3, 5, 11, 23, 9098564230, 9098564230, '', 2, '2022-02-16 11:51:27', 'Pending for Admins Permission'),
(11104, 3, 1, 11, 2, 9098564230, 9098564230, '', 2, '2022-02-16 12:13:01', 'Send Money to Wallet'),
(11105, 3, 2, 11, 7, 9098564230, 9098564230, '', 2, '2022-02-16 12:13:01', 'Send Money to Wallet'),
(11106, 3, 3, 11, 12, 9098564230, 9098564230, '', 2, '2022-02-16 12:13:01', 'Send Money to Wallet'),
(11107, 3, 4, 11, 17, 9098564230, 9098564230, '', 2, '2022-02-16 12:13:01', 'Send Money to Wallet'),
(11108, 3, 5, 11, 22, 9098564230, 9098564230, '', 2, '2022-02-16 12:13:01', 'Send Money to Wallet'),
(11109, 3, 30, 11, 167, 9098564230, 9808790890, '', 2, '2022-02-19 09:09:21', 'Send Money to Wallet'),
(11110, 3, 30, 11, 167, 9098564230, 9808790890, '', 2, '2022-02-19 09:10:30', 'Send Money to Wallet'),
(11111, 3, 30, 11, 167, 9098564230, 9808790890, '', 2, '2022-02-19 10:13:07', 'Send Money to Wallet'),
(11112, 3, 30, 11, 167, 9098564230, 9808790890, '', 2, '2022-02-19 10:16:30', 'Send Money to Wallet'),
(11113, 3, 30, 11, 167, 9098564230, 9808790890, '', 2, '2022-02-19 10:19:57', 'Send Money to Wallet'),
(11114, 3, 30, 11, 167, 9098564230, 9808790890, '', 2, '2022-02-19 10:24:58', 'Send Money to Wallet'),
(11115, 3, 30, 11, 167, 9098564230, 9808790890, '', 2, '2022-02-19 10:28:00', 'Send Money to Wallet'),
(11116, 3, 30, 11, 167, 9098564230, 9808790890, '', 2, '2022-02-19 10:31:23', 'Send Money to Wallet'),
(11117, 3, 30, 11, 167, 9098564230, 9808790890, '', 2, '2022-02-19 10:36:38', 'Send Money to Wallet'),
(11118, 3, 30, 11, 167, 9098564230, 9808790890, '', 2, '2022-02-19 10:42:46', 'Send Money to Wallet'),
(11119, 3, 30, 11, 167, 9098564230, 9808790890, '', 2, '2022-02-19 10:47:15', 'Send Money to Wallet'),
(11120, 3, 30, 11, 167, 9098564230, 9808790890, '', 2, '2022-02-19 10:51:43', 'Send Money to Wallet'),
(11121, 3, 30, 11, 167, 9098564230, 9808790890, '', 2, '2022-02-19 10:57:18', 'Send Money to Wallet'),
(11122, 3, 30, 11, 167, 9098564230, 9808790890, '', 2, '2022-02-19 11:05:15', 'Send Money to Wallet'),
(11123, 3, 30, 11, 167, 9098564230, 9808790890, '', 2, '2022-02-19 11:07:31', 'Send Money to Wallet');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userId` int(255) NOT NULL,
  `lastLogin` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone_num` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `occupation` varchar(100) NOT NULL,
  `adhar_number` varchar(20) NOT NULL,
  `annual_Income` varchar(12) NOT NULL,
  `agent` enum('yes','no') NOT NULL,
  `dob` varchar(15) NOT NULL,
  `address` varchar(255) NOT NULL,
  `wallet1` double NOT NULL DEFAULT 0,
  `wallet2` double NOT NULL DEFAULT 0,
  `wallet3` double NOT NULL DEFAULT 0,
  `wallet4` double NOT NULL DEFAULT 0,
  `wallet5` double NOT NULL DEFAULT 0,
  `referal_code` varchar(10) DEFAULT NULL,
  `refered_by` int(10) DEFAULT NULL,
  `admin` varchar(3) NOT NULL DEFAULT 'no',
  `cheque` int(11) NOT NULL DEFAULT 5,
  `token` longtext NOT NULL,
  `aadharf` longtext NOT NULL,
  `aadharb` longtext NOT NULL,
  `licensef` longtext NOT NULL,
  `licenseb` longtext NOT NULL,
  `pan` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userId`, `lastLogin`, `email`, `name`, `phone_num`, `password`, `occupation`, `adhar_number`, `annual_Income`, `agent`, `dob`, `address`, `wallet1`, `wallet2`, `wallet3`, `wallet4`, `wallet5`, `referal_code`, `refered_by`, `admin`, `cheque`, `token`, `aadharf`, `aadharb`, `licensef`, `licenseb`, `pan`) VALUES
(1, '', 'ram1@gmail.com', 'ram1 Nath', '9098564230', '81dc9bdb52d04dc20036dbd8313ed055', 'Pro Manager', '123456789054', '937890', 'yes', '1978-06-28', 'Testd dsksd ds', 1.999999999999998, 1.999, 139.99975999999992, 0, 0, NULL, NULL, 'no', 5, '', '', '', '', '', ''),
(2, '', 'ram2@gmail.com', 'ram2 Nath', '9098564230', '81dc9bdb52d04dc20036dbd8313ed055', 'Pro Tech Manager', '123456789054', '937890', 'no', '1978-06-28', 'Testd dsksd ds', 0, 1.9989800100000001, 140, 0, 0, NULL, NULL, 'no', 5, '', '', '', '', '', ''),
(3, '4 Mar 2022 12:43:24 pm', 'abc@gmail.com', 'abc Nath', '9098564230', '81dc9bdb52d04dc20036dbd8313ed055', 'Pro Tech Manager', '123456789054', '937890', 'no', '1978-06-28', 'Testd dsksd ds', 125600, 1.9989800100000001, 100460, 55, 0, NULL, NULL, 'no', 11, 'ffBXa66SRBW9u8e1mWEy3h:APA91bF9BKAx_oa8XTCeqLrdOQGOosKesj8PiqVNVAGYVJ1Cp8RyL-U3Oc8XVtYDGoWy7PXOSSK5hSnPudLKpVPcbdMnYNX_cHmaJIs3FxHsp7VYQYfrJzbjr1QD6qs3PshzrWyxCOjI', '3_aadharf-1644074692.jpg', '3_aadharb-1644074692.jpg', '3_licensef-1644074692.jpg', '3_licenseb-1644074692.jpg', '3_pan-1644074692.jpg'),
(4, '', 'abc@nn.vv', 'abc N V', '9098564230', '81dc9bdb52d04dc20036dbd8313ed055', 'Pro Tech Manager', '123456789054', '937890', 'no', '1978-06-28', 'Testd dsksd ds', -12, 1.9989800100000001, 130, 0, 0, NULL, NULL, 'no', 5, '', '', '', '', '', ''),
(5, '', 'abcnv123@nn.vv', ' N V', '9098564230', '81dc9bdb52d04dc20036dbd8313ed055', 'Lead', '123456789054', '937890', 'yes', '1978-06-28', 'Testd dsksd ds', 0, 0, 235, 0, -5, NULL, NULL, 'no', 5, '', '', '', '', '', ''),
(13, '', 'a@gmail.com', 'ak', '9999999999', '202cb962ac59075b964b07152d234b70', 'st', '123456789098', '54666', 'yes', '13/1/2016', '2, fg, gg, 424001', 0.9995000000000017, 4.9995, 5, 0, -1.23, '123abc', NULL, 'no', 5, '', '', '', '', '', ''),
(14, '', 'ss@gmail.com', 'Sunny Sonar', '1223456789', '202cb962ac59075b964b07152d234b70', 'student', '768987098765', '450000', 'yes', '6/1/2000', '2, 605 Bd Jules Durand, Le Havre, androidx.appcompat.widget.AppCompatEditText{fd59256 VFED..CL. ........ 33,677-959,787 #7f0801a1 app:id/pincode aid=1073741833}', 0.9994900050000001, 5.996940029999999, 0, 0, 0, NULL, NULL, 'no', 5, '', '', '', '', '', ''),
(15, '', '1234567891@gmail.com', 'a', '1234567891', '0cc175b9c0f1b6a831c399e269772661', 'a', '1', '1', 'no', '20/1/2022', '14, 43, Rd Number 43, New Delhi, androidx.appcompat.widget.AppCompatEditText{db5c90 VFED..CL. ........ 33,653-959,763 #7f0801a3 app:id/pincode aid=1073741833}', 0, 0, 0, 0, 0, NULL, NULL, 'no', 5, '', '', '', '', '', ''),
(16, '', 'aaa@gmail.com', 'sunny', '7676768987', '81dc9bdb52d04dc20036dbd8313ed055', 'student', '123456789876', '467', 'no', '20/8/2000', '2, 605 Bd Jules Durand, Le Havre, 76600', 0, 0, 125, 0, 0, '123ab', 13, 'no', 5, '', '', '', '', '', ''),
(17, '', 'aaat@gmail.com', 'tttt', '1234567654', '202cb962ac59075b964b07152d234b70', 'student', '4568766098', '575555', 'no', '20/1/2004', '6, 605 Bd Jules Durand, Le Havre, 76600', 0, 0, 0, 0, 0, '12345_tt45', 0, 'no', 5, '', '', '', '', '', ''),
(18, '', 'yy@gmail.com', 'yyy', '7777777777', '202cb962ac59075b964b07152d234b70', 'student', '888888888888', '77', 'no', '20/1/2016', '2, 605 Bd Jules Durand, Le Havre, 76600', 0, 0, 25, 0, 0, '77777_yy88', 16, 'no', 5, '', '', '', '', '', ''),
(20, '', 'kk@gmail.com', 'yyyu', '46464464646', '202cb962ac59075b964b07152d234b70', 'doctor', '123454321568', '5000000', 'no', '21/8/1996', '3, 605 Bd Jules Durand, Le Havre, 76600', 0, 0, 25, 0, 0, '46464_yy12', 16, 'no', 5, '', '', '', '', '', ''),
(21, '', 'b11s@gmail.com', 'Bhavesh', '0', '202cb962ac59075b964b07152d234b70', 'student', '980887643679', '23000', 'no', '14/6/2005', '3, 605 Bd Jules Durand, Le Havre, 76600', 0, 0, 25, 0, 0, 'Sonar_Bh98', 16, 'no', 5, '', '', '', '', '', ''),
(22, '', 'bkk@gmail.com', 'bhavesh kk', '7777777777', '202cb962ac59075b964b07152d234b70', 'doctoe', '987878980987', '560', 'no', '22/1/2005', '2, 605 Bd Jules Durand, Le Havre, 76600', 0, 0, 0, 0, 0, '77777_bh98', 0, 'no', 5, '', '', '', '', '', ''),
(23, '', 'cak@gmail.com', 'abck', '1234576890', '202cb962ac59075b964b07152d234b70', 'iiio', '1234567890', '5789', 'yes', '22/1/2007', '2, 605 Bd Jules Durand, Le Havre, 76600', 0, 0, 0, 0, 0, '12345_ab12', 0, 'no', 5, '', '', '', '', '', ''),
(24, '17 Feb 2022 11:59:27 am', 'admin@gmail.com', 'Admin', '1234567896', '0192023a7bbd73250516f069df18b500', 'Admin', '123456789658', '500000', 'no', '20/12/2000', '2,abc Dept 424001', 150676431, 0, 37.000370000000004, -100425, 29.46, 'admin123', NULL, 'yes', 5, 'ffBXa66SRBW9u8e1mWEy3h:APA91bF9BKAx_oa8XTCeqLrdOQGOosKesj8PiqVNVAGYVJ1Cp8RyL-U3Oc8XVtYDGoWy7PXOSSK5hSnPudLKpVPcbdMnYNX_cHmaJIs3FxHsp7VYQYfrJzbjr1QD6qs3PshzrWyxCOjI', '', '', '', '', ''),
(25, '12 Feb 2022 3:45:22 pm', 'king88@gmail.com', 'king', '9876543210', '509032ed818d4fd1c22f797ba4d41df0', 'n', '37929', '600', 'no', '27/1/2022', '6, f, 6, 001', 5000, 299, 100, 500, 6666, '98765_ki37', 0, 'No', 5, '', '', '', '', '', ''),
(26, '', 'king87@gmail.com', 'king87', '987666432', '509032ed818d4fd1c22f797ba4d41df0', 'huij', '77654578', '69', 'yes', '28/8/2011', '5, t, g, 00998', 0, 0, 0, 0, 0, '09876_ki77', 0, 'no', 5, '', '', '', '', '', ''),
(27, '21-Feb-2022 11:41:35 PM', 'himj@gmail.com', 'himanshu', '9374849300', '81dc9bdb52d04dc20036dbd8313ed055', 'agent', '7484939307', '1000000', 'yes', '10/2/1994', '2, bhola mandir, mumbai, 4001001', 0, 0, 0, 0, 0, '93748_hi74', 0, 'no', 5, 'd-muqdChTSqyYMD50TxG-X:APA91bE2rPU3sEc-tOWsGtjKe1f09BIIrW27dQLrYjj2ORVC_iAcTsx46__5fRo3P8XZcKin4G5lKItXT7RXqG9WnHqPjql5l229FSQWnnxZH9Y_UrTMaLzvmZzZT2RwuMn3E5HFxmv-', '', '', '', '', ''),
(28, '10 Feb 2022 6:15:50 pm', 'test@gmail.com', 'test', '74849400', '81dc9bdb52d04dc20036dbd8313ed055', 'student', '74949390', '74949', 'no', '10/2/2004', '98, hd mandir, mumbai, 400101', 0, 0, 0, 0, 0, '74849_te74', 0, 'no', 5, 'ciaT2NEdQ8-IR0qAeh38Bw:APA91bF0wNF8m0Io2AiPIaCvq4Y3gbIFVJ4LdfP1Ji4d6Ptv-UtTX_iVPTdydlafyQxPN_jevrUeJVNS3gN9MVROiWtcm9AFGowb48qKw5KDd465qj7HY1pFtIUXjXCZtZ08nHs5bhP4', '', '', '', '', ''),
(29, '17-Feb-2022 9:09:03 AM', 'raj716980@gmail.com', 'MOHIT RAJ', '9097644568', '8cd07419a06b26a6473d35e78186be8a', 'Student', '745803912995', '0', 'yes', '27/11/2000', '6, Bagbera Colony, Jamshedpur, 831002', 0, 0, 0, 0, 0, '90976_MO74', 0, 'no', 5, 'd-muqdChTSqyYMD50TxG-X:APA91bE2rPU3sEc-tOWsGtjKe1f09BIIrW27dQLrYjj2ORVC_iAcTsx46__5fRo3P8XZcKin4G5lKItXT7RXqG9WnHqPjql5l229FSQWnnxZH9Y_UrTMaLzvmZzZT2RwuMn3E5HFxmv-', '', '', '', '', ''),
(30, '19 Feb 2022 2:40:09 pm', 'hello@world.com', 'user1', '9808790890', '81dc9bdb52d04dc20036dbd8313ed055', 'student', '1234456789', '4849', 'no', '17/2/2000', '12, hello world, mumbai, 400101', 0, 0, 0, 0, 0, '98087_us12', 0, 'no', 5, 'ffBXa66SRBW9u8e1mWEy3h:APA91bF9BKAx_oa8XTCeqLrdOQGOosKesj8PiqVNVAGYVJ1Cp8RyL-U3Oc8XVtYDGoWy7PXOSSK5hSnPudLKpVPcbdMnYNX_cHmaJIs3FxHsp7VYQYfrJzbjr1QD6qs3PshzrWyxCOjI', '', '', '', '', ''),
(31, '', 'king89@gmail.com', 'king', '3452178690', '509032ed818d4fd1c22f797ba4d41df0', 'hfn', '0', '5000', 'no', '19/2/1999', '9, gb, b, 89067', 0, 0, 0, 0, 0, '34521_kifh', 0, 'no', 5, '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `wallet`
--

CREATE TABLE `wallet` (
  `walletId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `coinId` int(11) NOT NULL,
  `wallet_name` set('wallet1','wallet2','wallet3','wallet4','wallet5') NOT NULL,
  `coin` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wallet`
--

INSERT INTO `wallet` (`walletId`, `userId`, `coinId`, `wallet_name`, `coin`) VALUES
(1, 1, 1, 'wallet1', 52),
(2, 1, 2, 'wallet2', 55.4969),
(3, 1, 3, 'wallet3', 141.2),
(4, 1, 4, 'wallet4', 0),
(5, 1, 5, 'wallet5', 0),
(6, 2, 1, 'wallet1', 12),
(7, 2, 2, 'wallet2', 55.4969),
(8, 2, 3, 'wallet3', 141.2),
(9, 2, 4, 'wallet4', 0),
(10, 2, 5, 'wallet5', 0),
(11, 3, 1, 'wallet1', 1638.44),
(12, 3, 2, 'wallet2', 7.7),
(13, 3, 3, 'wallet3', 10.101),
(14, 3, 4, 'wallet4', 55),
(15, 3, 5, 'wallet5', -230),
(16, 4, 1, 'wallet1', 4),
(17, 4, 2, 'wallet2', 55.4969),
(18, 4, 3, 'wallet3', 131.2),
(19, 4, 4, 'wallet4', 0),
(20, 4, 5, 'wallet5', 0),
(21, 5, 1, 'wallet1', 0),
(22, 5, 2, 'wallet2', 54.9969),
(23, 5, 3, 'wallet3', 236.2),
(24, 5, 4, 'wallet4', 0),
(25, 5, 5, 'wallet5', 0),
(26, 6, 1, 'wallet1', 1.99031),
(27, 6, 2, 'wallet2', 0),
(28, 6, 3, 'wallet3', 160),
(29, 6, 4, 'wallet4', 0),
(30, 6, 5, 'wallet5', 0),
(31, 9, 1, 'wallet1', 0),
(32, 9, 2, 'wallet2', 0),
(33, 9, 3, 'wallet3', 0),
(34, 9, 4, 'wallet4', 0),
(35, 9, 5, 'wallet5', 0),
(36, 10, 1, 'wallet1', 0),
(37, 10, 2, 'wallet2', 0),
(38, 10, 3, 'wallet3', 0),
(39, 10, 4, 'wallet4', 0),
(40, 10, 5, 'wallet5', 0),
(41, 11, 1, 'wallet1', 0),
(42, 11, 2, 'wallet2', 0),
(43, 11, 3, 'wallet3', 0),
(44, 11, 4, 'wallet4', 0),
(45, 11, 5, 'wallet5', 0),
(46, 12, 1, 'wallet1', 0),
(47, 12, 2, 'wallet2', 0),
(48, 12, 3, 'wallet3', 0),
(49, 12, 4, 'wallet4', 0),
(50, 12, 5, 'wallet5', 0),
(51, 13, 1, 'wallet1', 20.2886),
(52, 13, 2, 'wallet2', 0),
(53, 13, 3, 'wallet3', 0),
(54, 13, 4, 'wallet4', 0),
(55, 13, 5, 'wallet5', 0),
(56, 14, 1, 'wallet1', 17.9908),
(57, 14, 2, 'wallet2', 1),
(58, 14, 3, 'wallet3', 0),
(59, 14, 4, 'wallet4', 0),
(60, 14, 5, 'wallet5', 0),
(61, 15, 1, 'wallet1', 0),
(62, 15, 2, 'wallet2', 0),
(63, 15, 3, 'wallet3', 0),
(64, 15, 4, 'wallet4', 0),
(65, 15, 5, 'wallet5', 0),
(66, 16, 1, 'wallet1', 0),
(67, 16, 2, 'wallet2', 0),
(68, 16, 3, 'wallet3', 0),
(69, 16, 4, 'wallet4', 0),
(70, 16, 5, 'wallet5', 0),
(71, 17, 1, 'wallet1', 0),
(72, 17, 2, 'wallet2', 0),
(73, 17, 3, 'wallet3', 0),
(74, 17, 4, 'wallet4', 0),
(75, 17, 5, 'wallet5', 0),
(76, 18, 1, 'wallet1', 0),
(77, 18, 2, 'wallet2', 0),
(78, 18, 3, 'wallet3', 0),
(79, 18, 4, 'wallet4', 0),
(80, 18, 5, 'wallet5', 0),
(81, 19, 1, 'wallet1', 0),
(82, 19, 2, 'wallet2', 0),
(83, 19, 3, 'wallet3', 0),
(84, 19, 4, 'wallet4', 0),
(85, 19, 5, 'wallet5', 0),
(86, 20, 1, 'wallet1', 0),
(87, 20, 2, 'wallet2', 0),
(88, 20, 3, 'wallet3', 0),
(89, 20, 4, 'wallet4', 0),
(90, 20, 5, 'wallet5', 0),
(91, 21, 1, 'wallet1', 0),
(92, 21, 2, 'wallet2', 0),
(93, 21, 3, 'wallet3', 0),
(94, 21, 4, 'wallet4', 0),
(95, 21, 5, 'wallet5', 0),
(96, 22, 1, 'wallet1', 0),
(97, 22, 2, 'wallet2', 0),
(98, 22, 3, 'wallet3', 0),
(99, 22, 4, 'wallet4', 0),
(100, 22, 5, 'wallet5', 0),
(106, 23, 1, 'wallet1', 0),
(107, 23, 2, 'wallet2', 0),
(108, 23, 3, 'wallet3', 0),
(109, 23, 4, 'wallet4', 0),
(110, 23, 5, 'wallet5', 0),
(116, 24, 1, 'wallet1', 0.0446496),
(117, 24, 2, 'wallet2', 0),
(118, 24, 3, 'wallet3', 0.200993),
(119, 24, 4, 'wallet4', -90.9841),
(120, 24, 5, 'wallet5', 234.407),
(121, 25, 1, 'wallet1', 0),
(122, 25, 2, 'wallet2', 0),
(123, 25, 3, 'wallet3', 0),
(124, 25, 4, 'wallet4', 0),
(125, 25, 5, 'wallet5', 0),
(131, 26, 1, 'wallet1', 0),
(132, 26, 2, 'wallet2', 0),
(133, 26, 3, 'wallet3', 0),
(134, 26, 4, 'wallet4', 0),
(135, 26, 5, 'wallet5', 0),
(141, 27, 1, 'wallet1', 0),
(142, 27, 2, 'wallet2', 0),
(143, 27, 3, 'wallet3', 0),
(144, 27, 4, 'wallet4', 0),
(145, 27, 5, 'wallet5', 0),
(151, 28, 1, 'wallet1', 0),
(152, 28, 2, 'wallet2', 0),
(153, 28, 3, 'wallet3', 0),
(154, 28, 4, 'wallet4', 0),
(155, 28, 5, 'wallet5', 0),
(156, 29, 1, 'wallet1', 0),
(157, 29, 2, 'wallet2', 0),
(158, 29, 3, 'wallet3', 0),
(159, 29, 4, 'wallet4', 0),
(160, 29, 5, 'wallet5', 0),
(166, 30, 1, 'wallet1', 0),
(167, 30, 2, 'wallet2', 15),
(168, 30, 3, 'wallet3', 0),
(169, 30, 4, 'wallet4', 0),
(170, 30, 5, 'wallet5', 0),
(176, 31, 1, 'wallet1', 0),
(177, 31, 2, 'wallet2', 0),
(178, 31, 3, 'wallet3', 0),
(179, 31, 4, 'wallet4', 0),
(180, 31, 5, 'wallet5', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `add_money_request`
--
ALTER TABLE `add_money_request`
  ADD PRIMARY KEY (`reqId`);

--
-- Indexes for table `bond`
--
ALTER TABLE `bond`
  ADD PRIMARY KEY (`bondId`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `bond_data`
--
ALTER TABLE `bond_data`
  ADD KEY `bondId` (`bondId`);

--
-- Indexes for table `cheque`
--
ALTER TABLE `cheque`
  ADD PRIMARY KEY (`chequeId`),
  ADD KEY `from_userId` (`from_userId`),
  ADD KEY `to_userId` (`to_userId`);

--
-- Indexes for table `coin`
--
ALTER TABLE `coin`
  ADD PRIMARY KEY (`coinId`),
  ADD UNIQUE KEY `coin_name` (`coin_name`);

--
-- Indexes for table `crypto_payments`
--
ALTER TABLE `crypto_payments`
  ADD PRIMARY KEY (`paymentID`),
  ADD UNIQUE KEY `key3` (`boxID`,`orderID`,`userID`,`txID`,`amount`,`addr`),
  ADD KEY `boxID` (`boxID`),
  ADD KEY `boxType` (`boxType`),
  ADD KEY `userID` (`userID`),
  ADD KEY `countryID` (`countryID`),
  ADD KEY `orderID` (`orderID`),
  ADD KEY `amount` (`amount`),
  ADD KEY `amountUSD` (`amountUSD`),
  ADD KEY `coinLabel` (`coinLabel`),
  ADD KEY `unrecognised` (`unrecognised`),
  ADD KEY `addr` (`addr`),
  ADD KEY `txID` (`txID`),
  ADD KEY `txDate` (`txDate`),
  ADD KEY `txConfirmed` (`txConfirmed`),
  ADD KEY `txCheckDate` (`txCheckDate`),
  ADD KEY `processed` (`processed`),
  ADD KEY `processedDate` (`processedDate`),
  ADD KEY `recordCreated` (`recordCreated`),
  ADD KEY `key1` (`boxID`,`orderID`),
  ADD KEY `key2` (`boxID`,`orderID`,`userID`);

--
-- Indexes for table `deposit`
--
ALTER TABLE `deposit`
  ADD PRIMARY KEY (`depositId`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `insurance`
--
ALTER TABLE `insurance`
  ADD PRIMARY KEY (`insuranceId`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `loan`
--
ALTER TABLE `loan`
  ADD PRIMARY KEY (`loanId`),
  ADD KEY `userId` (`userId`) USING BTREE;

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD KEY `fuser_id` (`fuser_id`),
  ADD KEY `tuser_id` (`tuser_id`);

--
-- Indexes for table `rd`
--
ALTER TABLE `rd`
  ADD PRIMARY KEY (`rdId`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `share`
--
ALTER TABLE `share`
  ADD PRIMARY KEY (`shareId`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `share_data`
--
ALTER TABLE `share_data`
  ADD KEY `share_Id` (`share_Id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`transactionId`),
  ADD KEY `from_userId` (`from_userId`),
  ADD KEY `to_userId` (`to_userId`),
  ADD KEY `from_account` (`from_account`),
  ADD KEY `to_account` (`to_account`),
  ADD KEY `from_walletId` (`from_walletId`),
  ADD KEY `to_walletId` (`to_walletId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `wallet`
--
ALTER TABLE `wallet`
  ADD PRIMARY KEY (`walletId`),
  ADD UNIQUE KEY `user_wallet` (`userId`,`coinId`),
  ADD KEY `userId` (`userId`),
  ADD KEY `coinId` (`coinId`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `add_money_request`
--
ALTER TABLE `add_money_request`
  MODIFY `reqId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bond`
--
ALTER TABLE `bond`
  MODIFY `bondId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `cheque`
--
ALTER TABLE `cheque`
  MODIFY `chequeId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `coin`
--
ALTER TABLE `coin`
  MODIFY `coinId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `crypto_payments`
--
ALTER TABLE `crypto_payments`
  MODIFY `paymentID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `deposit`
--
ALTER TABLE `deposit`
  MODIFY `depositId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `insurance`
--
ALTER TABLE `insurance`
  MODIFY `insuranceId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `loan`
--
ALTER TABLE `loan`
  MODIFY `loanId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `rd`
--
ALTER TABLE `rd`
  MODIFY `rdId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `share`
--
ALTER TABLE `share`
  MODIFY `shareId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `transactionId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11124;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `wallet`
--
ALTER TABLE `wallet`
  MODIFY `walletId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bond_data`
--
ALTER TABLE `bond_data`
  ADD CONSTRAINT `bond_data_ibfk_1` FOREIGN KEY (`bondId`) REFERENCES `bond` (`bondId`);

--
-- Constraints for table `cheque`
--
ALTER TABLE `cheque`
  ADD CONSTRAINT `cheque_ibfk_1` FOREIGN KEY (`from_userId`) REFERENCES `user` (`userId`),
  ADD CONSTRAINT `cheque_ibfk_2` FOREIGN KEY (`to_userId`) REFERENCES `user` (`userId`);

--
-- Constraints for table `permission`
--
ALTER TABLE `permission`
  ADD CONSTRAINT `permission_ibfk_1` FOREIGN KEY (`fuser_id`) REFERENCES `user` (`userId`),
  ADD CONSTRAINT `permission_ibfk_2` FOREIGN KEY (`tuser_id`) REFERENCES `user` (`userId`);

--
-- Constraints for table `rd`
--
ALTER TABLE `rd`
  ADD CONSTRAINT `rd_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `share`
--
ALTER TABLE `share`
  ADD CONSTRAINT `share_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `share_data`
--
ALTER TABLE `share_data`
  ADD CONSTRAINT `share_data_ibfk_1` FOREIGN KEY (`share_Id`) REFERENCES `share` (`shareId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
