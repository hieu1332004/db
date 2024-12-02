-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th9 24, 2024 lúc 03:33 PM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `hotel_db`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `uuid` char(36) NOT NULL DEFAULT uuid(),
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `hotel_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `employee_role`
--

CREATE TABLE `employee_role` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `floor`
--

CREATE TABLE `floor` (
  `id` int(11) NOT NULL,
  `uuid` char(36) NOT NULL DEFAULT uuid(),
  `hotel_id` int(11) DEFAULT NULL,
  `floor_number` int(11) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `guest`
--

CREATE TABLE `guest` (
  `id` int(11) NOT NULL,
  `uuid` char(36) NOT NULL DEFAULT uuid(),
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contact_details` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `passport_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hotel`
--

CREATE TABLE `hotel` (
  `id` int(11) NOT NULL,
  `uuid` char(36) NOT NULL DEFAULT uuid(),
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `star_rating` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `hotel`
--

INSERT INTO `hotel` (`id`, `uuid`, `name`, `address`, `star_rating`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, '7c266139-7a79-11ef-9cee-d8bbc1b33f98', 'Khách VNeID', 'Hà Nội', NULL, '2024-09-24 13:32:46', '2024-09-24 13:32:46', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `uuid` char(36) NOT NULL DEFAULT uuid(),
  `role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `room`
--

CREATE TABLE `room` (
  `id` int(11) NOT NULL,
  `uuid` char(36) NOT NULL DEFAULT uuid(),
  `hotel_id` int(11) DEFAULT NULL,
  `floor_id` int(11) DEFAULT NULL,
  `room_type_id` int(11) DEFAULT NULL,
  `room_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `max_capacity` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `room_type`
--

CREATE TABLE `room_type` (
  `id` int(11) NOT NULL,
  `uuid` char(36) NOT NULL DEFAULT uuid(),
  `hotel_id` int(11) DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_price` decimal(10,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `room_using`
--

CREATE TABLE `room_using` (
  `id` int(11) NOT NULL,
  `uuid` char(36) NOT NULL DEFAULT uuid(),
  `trans_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `is_deleted` bit(1) DEFAULT b'0',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `room_using_guest`
--

CREATE TABLE `room_using_guest` (
  `id` int(11) NOT NULL,
  `uuid` char(36) NOT NULL DEFAULT uuid(),
  `guest_id` int(11) DEFAULT NULL,
  `room_using_id` int(11) DEFAULT NULL,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `room_using_service`
--

CREATE TABLE `room_using_service` (
  `id` int(11) NOT NULL,
  `uuid` char(36) NOT NULL DEFAULT uuid(),
  `room_using_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `service_using_date` date NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `service`
--

CREATE TABLE `service` (
  `id` int(11) NOT NULL,
  `uuid` char(36) NOT NULL DEFAULT uuid(),
  `service_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `service_price` decimal(10,2) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `transition`
--

CREATE TABLE `transition` (
  `id` int(11) NOT NULL,
  `uuid` char(36) NOT NULL DEFAULT uuid(),
  `guest_id` int(11) DEFAULT NULL,
  `transition_date` date NOT NULL,
  `payment_status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `hotel_id` (`hotel_id`);

--
-- Chỉ mục cho bảng `employee_role`
--
ALTER TABLE `employee_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Chỉ mục cho bảng `floor`
--
ALTER TABLE `floor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hotel_id` (`hotel_id`);

--
-- Chỉ mục cho bảng `guest`
--
ALTER TABLE `guest`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hotel_id` (`hotel_id`),
  ADD KEY `floor_id` (`floor_id`),
  ADD KEY `room_type_id` (`room_type_id`);

--
-- Chỉ mục cho bảng `room_type`
--
ALTER TABLE `room_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hotel_id` (`hotel_id`);

--
-- Chỉ mục cho bảng `room_using`
--
ALTER TABLE `room_using`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trans_id` (`trans_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Chỉ mục cho bảng `room_using_guest`
--
ALTER TABLE `room_using_guest`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guest_id` (`guest_id`),
  ADD KEY `room_using_id` (`room_using_id`);

--
-- Chỉ mục cho bảng `room_using_service`
--
ALTER TABLE `room_using_service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_using_id` (`room_using_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Chỉ mục cho bảng `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `transition`
--
ALTER TABLE `transition`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guest_id` (`guest_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `employee_role`
--
ALTER TABLE `employee_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `floor`
--
ALTER TABLE `floor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `guest`
--
ALTER TABLE `guest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `hotel`
--
ALTER TABLE `hotel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `room`
--
ALTER TABLE `room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `room_type`
--
ALTER TABLE `room_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `room_using`
--
ALTER TABLE `room_using`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `room_using_guest`
--
ALTER TABLE `room_using_guest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `room_using_service`
--
ALTER TABLE `room_using_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `service`
--
ALTER TABLE `service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `transition`
--
ALTER TABLE `transition`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `employee_role`
--
ALTER TABLE `employee_role`
  ADD CONSTRAINT `employee_role_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employee_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `floor`
--
ALTER TABLE `floor`
  ADD CONSTRAINT `floor_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `room_ibfk_2` FOREIGN KEY (`floor_id`) REFERENCES `floor` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `room_ibfk_3` FOREIGN KEY (`room_type_id`) REFERENCES `room_type` (`id`) ON DELETE NO ACTION;

--
-- Các ràng buộc cho bảng `room_type`
--
ALTER TABLE `room_type`
  ADD CONSTRAINT `room_type_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `room_using`
--
ALTER TABLE `room_using`
  ADD CONSTRAINT `room_using_ibfk_1` FOREIGN KEY (`trans_id`) REFERENCES `transition` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `room_using_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `room_using_guest`
--
ALTER TABLE `room_using_guest`
  ADD CONSTRAINT `room_using_guest_ibfk_1` FOREIGN KEY (`guest_id`) REFERENCES `guest` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `room_using_guest_ibfk_2` FOREIGN KEY (`room_using_id`) REFERENCES `room_using` (`id`) ON DELETE NO ACTION;

--
-- Các ràng buộc cho bảng `room_using_service`
--
ALTER TABLE `room_using_service`
  ADD CONSTRAINT `room_using_service_ibfk_1` FOREIGN KEY (`room_using_id`) REFERENCES `room_using` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `room_using_service_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `transition`
--
ALTER TABLE `transition`
  ADD CONSTRAINT `transition_ibfk_1` FOREIGN KEY (`guest_id`) REFERENCES `guest` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
