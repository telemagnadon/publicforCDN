-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 06, 2025 at 07:50 AM
-- Server version: 10.11.10-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u943309104_bukid`
--

-- --------------------------------------------------------

--
-- Table structure for table `file_content`
--

CREATE TABLE `file_content` (
  `uid` int(11) NOT NULL,
  `hashkey` varchar(300) NOT NULL,
  `titlename` varchar(2000) DEFAULT '',
  `size_in_bytes` bigint(20) NOT NULL DEFAULT 0,
  `content` longblob NOT NULL,
  `filelocation` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `file_list`
--

CREATE TABLE `file_list` (
  `uid` int(11) NOT NULL,
  `useruid_access_list` text NOT NULL,
  `hashkey` varchar(300) NOT NULL,
  `contentuid` int(11) NOT NULL,
  `filename` varchar(300) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `tags` varchar(600) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `modified` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `hidden` int(11) NOT NULL DEFAULT 0,
  `addedby` int(11) NOT NULL,
  `categories` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logins`
--

CREATE TABLE `logins` (
  `user_id` int(11) NOT NULL,
  `Username` text NOT NULL,
  `Password` text NOT NULL,
  `Fullname` text NOT NULL,
  `user_level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `uid` int(11) NOT NULL,
  `useruid` int(11) NOT NULL,
  `log_type` varchar(150) NOT NULL,
  `log_category` varchar(150) NOT NULL,
  `log_time` datetime NOT NULL DEFAULT current_timestamp(),
  `description` text NOT NULL,
  `server_data` text NOT NULL,
  `session_data` text NOT NULL,
  `modified` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pos_transactions`
--

CREATE TABLE `pos_transactions` (
  `uid` bigint(20) NOT NULL,
  `hashkey` varchar(150) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `modified` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `initiatedby` bigint(20) NOT NULL,
  `storeuid` bigint(20) NOT NULL,
  `products` longtext NOT NULL,
  `createdby` bigint(20) NOT NULL,
  `status` varchar(50) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `transactioncode` varchar(150) DEFAULT NULL,
  `totalprice` int(11) DEFAULT NULL,
  `completedon` datetime DEFAULT NULL,
  `logs` longtext DEFAULT NULL,
  `remarks` longtext DEFAULT NULL,
  `additionaldata` int(11) DEFAULT NULL,
  `specs` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pos_transactions_sessions`
--

CREATE TABLE `pos_transactions_sessions` (
  `uid` bigint(20) NOT NULL,
  `hashkey` varchar(150) NOT NULL,
  `created` datetime DEFAULT current_timestamp(),
  `modified` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `name` varchar(300) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `logs` longtext DEFAULT NULL,
  `remarks` varchar(300) DEFAULT NULL,
  `createdby` bigint(20) DEFAULT NULL,
  `createdfor` bigint(20) DEFAULT NULL,
  `subtype` varchar(50) DEFAULT NULL,
  `additionaldata` longtext DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `storeuid` bigint(20) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `uid` bigint(20) NOT NULL,
  `hashkey` varchar(150) NOT NULL,
  `created` datetime DEFAULT current_timestamp(),
  `modified` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `createdby` bigint(20) DEFAULT NULL,
  `createdfor` bigint(20) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `subcategory` varchar(50) DEFAULT NULL,
  `logs` longtext DEFAULT NULL,
  `specs` longtext DEFAULT NULL,
  `photourl` longtext DEFAULT NULL,
  `available` int(11) DEFAULT NULL,
  `sold` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `storeuid` bigint(20) DEFAULT NULL,
  `owneruid` bigint(20) DEFAULT NULL,
  `views` bigint(20) DEFAULT NULL,
  `name` varchar(300) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `reviews` longtext DEFAULT NULL,
  `barcode` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `remarks` varchar(150) DEFAULT NULL,
  `unitname` varchar(300) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `sku` varchar(50) DEFAULT NULL,
  `qrcode` varchar(50) DEFAULT NULL,
  `shortcode` varchar(50) DEFAULT NULL,
  `shortname` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `productshistory`
--

CREATE TABLE `productshistory` (
  `uid` bigint(20) NOT NULL,
  `hashkey` varchar(150) DEFAULT NULL,
  `productUID` bigint(20) DEFAULT NULL,
  `created` datetime DEFAULT current_timestamp(),
  `modified` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `createdby` bigint(20) DEFAULT NULL,
  `createdfor` bigint(20) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `subcategory` varchar(50) DEFAULT NULL,
  `logs` longtext DEFAULT NULL,
  `specs` longtext DEFAULT NULL,
  `photourl` longtext DEFAULT NULL,
  `available` int(11) DEFAULT NULL,
  `sold` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `storeuid` bigint(20) DEFAULT NULL,
  `owneruid` bigint(20) DEFAULT NULL,
  `views` bigint(20) DEFAULT NULL,
  `name` varchar(300) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `reviews` longtext DEFAULT NULL,
  `barcode` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `remarks` varchar(150) DEFAULT NULL,
  `unitname` varchar(300) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `sku` varchar(50) DEFAULT NULL,
  `qrcode` varchar(50) DEFAULT NULL,
  `shortcode` varchar(50) DEFAULT NULL,
  `shortname` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products_transactions`
--

CREATE TABLE `products_transactions` (
  `uid` bigint(20) NOT NULL DEFAULT 0,
  `hashkey` varchar(150) NOT NULL,
  `created` datetime DEFAULT current_timestamp(),
  `modfied` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `createdby` bigint(20) DEFAULT NULL,
  `createdfor` bigint(20) DEFAULT NULL,
  `storeuid` bigint(20) DEFAULT NULL,
  `transactiontype` varchar(50) DEFAULT NULL,
  `productuid` bigint(20) DEFAULT NULL,
  `transactiondata` longtext DEFAULT NULL,
  `description` text DEFAULT NULL,
  `subtype` varchar(50) DEFAULT NULL,
  `name` varchar(300) DEFAULT NULL,
  `owneruid` bigint(20) DEFAULT NULL,
  `transactionsessionhash` varchar(150) DEFAULT NULL,
  `quantity` bigint(20) DEFAULT NULL,
  `logs` longtext DEFAULT NULL,
  `remarks` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products_transactions_sessions`
--

CREATE TABLE `products_transactions_sessions` (
  `uid` bigint(20) NOT NULL,
  `hashkey` varchar(150) NOT NULL,
  `created` datetime DEFAULT current_timestamp(),
  `modified` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `name` varchar(300) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `logs` longtext DEFAULT NULL,
  `remarks` varchar(300) DEFAULT NULL,
  `createdby` bigint(20) DEFAULT NULL,
  `createdfor` bigint(20) DEFAULT NULL,
  `subtype` varchar(50) DEFAULT NULL,
  `additionaldata` longtext DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `storeuid` bigint(20) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `uid` int(11) NOT NULL,
  `createdby` bigint(20) NOT NULL DEFAULT 0,
  `hashkey` varchar(150) DEFAULT NULL,
  `created` datetime DEFAULT current_timestamp(),
  `modified` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `name` varchar(600) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `remarks` text DEFAULT NULL,
  `location` varchar(150) DEFAULT NULL,
  `referral_id` bigint(20) DEFAULT NULL,
  `category` varchar(300) DEFAULT NULL,
  `subcategory` varchar(300) DEFAULT NULL,
  `photourl` text DEFAULT NULL,
  `logs` longtext DEFAULT NULL,
  `price` bigint(20) NOT NULL DEFAULT 0,
  `sqm` bigint(20) DEFAULT NULL,
  `bedrooms` bigint(20) DEFAULT NULL,
  `rooms` bigint(20) DEFAULT NULL,
  `toilet` bigint(20) DEFAULT NULL,
  `kitchen` bigint(20) DEFAULT NULL,
  `floors` bigint(20) DEFAULT NULL,
  `specs` varchar(50) DEFAULT NULL,
  `forbiddenuids` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `referrals`
--

CREATE TABLE `referrals` (
  `uid` bigint(20) NOT NULL,
  `hashkey` varchar(150) DEFAULT NULL,
  `created` datetime DEFAULT current_timestamp(),
  `modified` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `referral_key` varchar(50) DEFAULT NULL,
  `property_location` varchar(600) DEFAULT NULL,
  `target_property` bigint(20) DEFAULT NULL,
  `target_viewing_date` date DEFAULT NULL,
  `fullname` varchar(300) DEFAULT NULL,
  `firstname` varchar(300) DEFAULT NULL,
  `middlename` varchar(300) DEFAULT NULL,
  `lastname` varchar(300) DEFAULT NULL,
  `photo` text DEFAULT NULL,
  `email` varchar(300) DEFAULT NULL,
  `facebookurl` text DEFAULT NULL,
  `mobile` varchar(400) DEFAULT NULL,
  `landline` varchar(400) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `remarks` text DEFAULT NULL,
  `logs` longtext DEFAULT NULL,
  `alt_contact_details` text DEFAULT NULL,
  `sold_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `referral_keys`
--

CREATE TABLE `referral_keys` (
  `uid` bigint(20) NOT NULL,
  `hashkey` varchar(150) NOT NULL,
  `created` datetime DEFAULT current_timestamp(),
  `modified` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `referral_code` varchar(100) NOT NULL,
  `useruid` bigint(20) DEFAULT NULL,
  `propertyuid` bigint(20) DEFAULT NULL,
  `referral_hits` bigint(20) DEFAULT NULL,
  `referral_submit` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `form_id` int(11) NOT NULL,
  `req_id` int(11) NOT NULL,
  `control_no` text NOT NULL,
  `upo_control_id` int(11) NOT NULL,
  `upo_id` text NOT NULL,
  `form_type` text NOT NULL,
  `contents` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `hashkey` varchar(300) NOT NULL,
  `userdata` text NOT NULL,
  `accesslist` text NOT NULL,
  `userid` bigint(20) NOT NULL,
  `active` int(11) NOT NULL,
  `expiry` datetime NOT NULL,
  `created` datetime DEFAULT current_timestamp(),
  `modified` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `session_history`
--

CREATE TABLE `session_history` (
  `uid` int(11) NOT NULL,
  `hashkey` varchar(300) NOT NULL,
  `old_hashkey` varchar(300) NOT NULL,
  `login_time` datetime NOT NULL,
  `ip_address` varchar(100) NOT NULL,
  `serverdata` text NOT NULL,
  `userid` bigint(20) NOT NULL,
  `userdata` text NOT NULL,
  `accesslist` text NOT NULL,
  `active` int(11) NOT NULL,
  `expiry` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `uid` bigint(20) NOT NULL,
  `hashkey` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL DEFAULT '',
  `storecode` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(150) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `createdby` bigint(20) DEFAULT NULL,
  `remarks` varchar(50) DEFAULT NULL,
  `logs` longtext DEFAULT NULL,
  `specs` longtext DEFAULT NULL,
  `additionaldata` longtext DEFAULT NULL,
  `owneruid` bigint(20) DEFAULT NULL,
  `manageruid` bigint(20) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `subcategory` varchar(50) DEFAULT NULL,
  `photourl` longtext DEFAULT NULL,
  `address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userinfo`
--

CREATE TABLE `userinfo` (
  `uid` int(11) NOT NULL,
  `hashkey` varchar(300) DEFAULT NULL,
  `targetuserlogin` int(11) DEFAULT NULL,
  `created` datetime DEFAULT current_timestamp(),
  `modified` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fullname` varchar(200) DEFAULT NULL,
  `firstname` varchar(200) DEFAULT NULL,
  `middlename` varchar(200) DEFAULT NULL,
  `lastname` varchar(200) DEFAULT NULL,
  `landline` varchar(200) DEFAULT NULL,
  `mobile` varchar(200) DEFAULT NULL,
  `email` varbinary(200) DEFAULT NULL,
  `altemail` text DEFAULT NULL,
  `altlandline` text DEFAULT NULL,
  `altmobile` text DEFAULT NULL,
  `credit_card` varchar(50) DEFAULT NULL,
  `bankdetails` text DEFAULT NULL,
  `facebookurl` text DEFAULT NULL,
  `photourl` text DEFAULT NULL,
  `otherdetails` text DEFAULT NULL,
  `addresses` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `uid` int(11) NOT NULL,
  `hashkey` varchar(300) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `nickname` varchar(300) DEFAULT '',
  `password` varchar(300) NOT NULL,
  `acct_type` varchar(25) NOT NULL,
  `mnumber` varchar(20) NOT NULL,
  `total_balance` bigint(20) DEFAULT 0,
  `total_credit` bigint(20) DEFAULT 0,
  `created` datetime DEFAULT current_timestamp(),
  `modified` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `active` int(11) NOT NULL,
  `parentuid` varchar(20) NOT NULL,
  `targetuids` text NOT NULL,
  `notes` text DEFAULT NULL,
  `exec_command` text DEFAULT NULL,
  `settings` text NOT NULL,
  `multiple_logins` int(11) NOT NULL DEFAULT 0,
  `referralcode` varchar(150) DEFAULT NULL,
  `photourl` text DEFAULT NULL,
  `logs` longtext DEFAULT NULL,
  `cart` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `file_content`
--
ALTER TABLE `file_content`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `hashkey` (`hashkey`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `file_list`
--
ALTER TABLE `file_list`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `hashkey` (`hashkey`),
  ADD KEY `uid` (`uid`),
  ADD KEY `addedby` (`addedby`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `pos_transactions`
--
ALTER TABLE `pos_transactions`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `hashkey` (`hashkey`);

--
-- Indexes for table `pos_transactions_sessions`
--
ALTER TABLE `pos_transactions_sessions`
  ADD PRIMARY KEY (`uid`) USING BTREE,
  ADD KEY `hashkey` (`hashkey`) USING BTREE;

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `createdby` (`createdby`),
  ADD KEY `storeuid` (`storeuid`),
  ADD KEY `owneruid` (`owneruid`),
  ADD KEY `modified` (`modified`),
  ADD KEY `category` (`category`),
  ADD KEY `subcategory` (`subcategory`),
  ADD KEY `createdfor` (`createdfor`);

--
-- Indexes for table `productshistory`
--
ALTER TABLE `productshistory`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `hashkey` (`hashkey`),
  ADD KEY `productUID` (`productUID`);

--
-- Indexes for table `products_transactions`
--
ALTER TABLE `products_transactions`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `hashkey` (`hashkey`),
  ADD KEY `createdby` (`createdby`),
  ADD KEY `name` (`name`),
  ADD KEY `transactionsessionhash` (`transactionsessionhash`),
  ADD KEY `createdfor` (`createdfor`);

--
-- Indexes for table `products_transactions_sessions`
--
ALTER TABLE `products_transactions_sessions`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `hashkey` (`hashkey`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `hashkey` (`hashkey`),
  ADD KEY `referral_id` (`referral_id`),
  ADD KEY `createdby` (`createdby`);

--
-- Indexes for table `referrals`
--
ALTER TABLE `referrals`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `hashkey` (`hashkey`);

--
-- Indexes for table `referral_keys`
--
ALTER TABLE `referral_keys`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `hashkey` (`hashkey`),
  ADD UNIQUE KEY `referral_code` (`referral_code`),
  ADD KEY `useruid` (`useruid`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`form_id`),
  ADD KEY `req_id` (`req_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`hashkey`),
  ADD UNIQUE KEY `hashkey` (`hashkey`);

--
-- Indexes for table `session_history`
--
ALTER TABLE `session_history`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `hashkey` (`hashkey`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `hashkey` (`hashkey`),
  ADD KEY `storecode` (`storecode`),
  ADD KEY `name` (`name`),
  ADD KEY `created` (`created`),
  ADD KEY `modified` (`modified`),
  ADD KEY `status` (`status`),
  ADD KEY `createdby` (`createdby`);

--
-- Indexes for table `userinfo`
--
ALTER TABLE `userinfo`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `hashkey` (`hashkey`),
  ADD UNIQUE KEY `targetuserlogin` (`targetuserlogin`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uid`) USING BTREE,
  ADD UNIQUE KEY `hashkey` (`hashkey`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `file_content`
--
ALTER TABLE `file_content`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `file_list`
--
ALTER TABLE `file_list`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pos_transactions`
--
ALTER TABLE `pos_transactions`
  MODIFY `uid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pos_transactions_sessions`
--
ALTER TABLE `pos_transactions_sessions`
  MODIFY `uid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `uid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `productshistory`
--
ALTER TABLE `productshistory`
  MODIFY `uid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products_transactions_sessions`
--
ALTER TABLE `products_transactions_sessions`
  MODIFY `uid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `referrals`
--
ALTER TABLE `referrals`
  MODIFY `uid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `referral_keys`
--
ALTER TABLE `referral_keys`
  MODIFY `uid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `form_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `session_history`
--
ALTER TABLE `session_history`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `uid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userinfo`
--
ALTER TABLE `userinfo`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
