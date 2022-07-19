/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : localhost:3306
 Source Schema         : toko-riski

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 19/07/2022 09:44:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for alamat_pengiriman
-- ----------------------------
DROP TABLE IF EXISTS `alamat_pengiriman`;
CREATE TABLE `alamat_pengiriman`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_penerima` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_tlp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `provinsi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kota` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kecamatan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kelurahan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kodepos` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `alamat_pengiriman_user_id_foreign`(`user_id`) USING BTREE,
  CONSTRAINT `alamat_pengiriman_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of alamat_pengiriman
-- ----------------------------
INSERT INTO `alamat_pengiriman` VALUES (1, 3, 'tidak', 'aletha', '1231241', 'kaliwiro', 'Jawa Tengah', 'Wonosobo', 'Kaliwiro', 'Kaliwiro', '873554', '2022-04-21 07:00:42', '2022-04-22 05:34:30');
INSERT INTO `alamat_pengiriman` VALUES (2, 2, 'utama', 'aletha', '1231241', 'kaliwiro', 'Jawa Tengah', 'Wonosobo', 'Kaliwiro', 'Kaliwiro', '873554', '2022-04-22 05:34:30', '2022-04-22 05:34:30');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `no_invoice` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_cart` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_pembayaran` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_pengiriman` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_resi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `ekspedisi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `subtotal` double(12, 2) NOT NULL DEFAULT 0.00,
  `ongkir` double(12, 2) NOT NULL DEFAULT 0.00,
  `diskon` double(12, 2) NOT NULL DEFAULT 0.00,
  `total` double(12, 2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cart_user_id_foreign`(`user_id`) USING BTREE,
  CONSTRAINT `cart_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (1, 3, 'INV 001', 'cart', 'belum', 'belum', NULL, NULL, 240300.00, 0.00, 0.00, 240300.00, '2022-04-21 06:24:52', '2022-04-21 06:58:35');
INSERT INTO `cart` VALUES (2, 2, 'INV 001', 'checkout', 'sudah', 'sudah', NULL, NULL, 160200.00, 0.00, 0.00, 160200.00, '2022-04-22 05:33:59', '2022-04-22 05:35:21');

-- ----------------------------
-- Table structure for cart_detail
-- ----------------------------
DROP TABLE IF EXISTS `cart_detail`;
CREATE TABLE `cart_detail`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `produk_id` int(10) UNSIGNED NOT NULL,
  `cart_id` int(10) UNSIGNED NOT NULL,
  `qty` double(12, 2) NOT NULL DEFAULT 0.00,
  `harga` double(12, 2) NOT NULL DEFAULT 0.00,
  `diskon` double(12, 2) NOT NULL DEFAULT 0.00,
  `subtotal` double(12, 2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cart_detail_cart_id_foreign`(`cart_id`) USING BTREE,
  INDEX `cart_detail_produk_id_foreign`(`produk_id`) USING BTREE,
  CONSTRAINT `cart_detail_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cart_detail_produk_id_foreign` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cart_detail
-- ----------------------------
INSERT INTO `cart_detail` VALUES (2, 1, 1, 3.00, 89000.00, 8900.00, 240300.00, '2022-04-21 06:58:31', '2022-04-21 06:58:35');
INSERT INTO `cart_detail` VALUES (3, 1, 2, 2.00, 89000.00, 8900.00, 160200.00, '2022-04-22 05:33:59', '2022-04-22 05:34:03');

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for images
-- ----------------------------
DROP TABLE IF EXISTS `images`;
CREATE TABLE `images`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `images_user_id_foreign`(`user_id`) USING BTREE,
  CONSTRAINT `images_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of images
-- ----------------------------
INSERT INTO `images` VALUES (23, 2, 'images/ah1BxbIqkZV3GnZ3j6soJ97IZSClxdKgzbW5Hzp5.jpg', '2022-04-18 02:25:38', '2022-04-18 02:25:38');
INSERT INTO `images` VALUES (24, 2, 'images/iTX6SRThkc79vl8FDX935Eo10IOEvmQUN3U43EaC.jpg', '2022-04-18 02:26:39', '2022-04-18 02:26:39');
INSERT INTO `images` VALUES (25, 2, 'images/1Te4anGwI6iRGiSFqkZVhcsD6g6fRb7uDHCz9Hjz.jpg', '2022-04-19 02:07:56', '2022-04-19 02:07:56');
INSERT INTO `images` VALUES (26, 2, 'images/5EGFgYpoktxSoGCyoevAKXhdubdvFa6G9iA4GEUG.jpg', '2022-04-19 02:09:40', '2022-04-19 02:09:40');
INSERT INTO `images` VALUES (27, 2, 'images/XM5CnSDfDX4F8m3tzZNfTXPH4yQI9OacNKdCz9QH.jpg', '2022-04-19 02:56:09', '2022-04-19 02:56:09');
INSERT INTO `images` VALUES (29, 2, 'images/cFZcLlLnUL9npKkgg5pECSut0d3aFNk06tA8uiqn.jpg', '2022-04-19 06:09:53', '2022-04-19 06:09:53');
INSERT INTO `images` VALUES (30, 2, 'images/RaYoYU1yc43xYyRdsIS2ejRBBxa3sxyFIZnwjKd6.jpg', '2022-04-19 06:10:07', '2022-04-19 06:10:07');
INSERT INTO `images` VALUES (31, 2, 'images/ORxDBeIX3URjD9N9iRxFHelsxKdkyKVLnI9eYQ9t.jpg', '2022-04-19 06:10:15', '2022-04-19 06:10:15');
INSERT INTO `images` VALUES (32, 2, 'images/GQJNnaFdMnxEuu7zJKWgnCjZEenZ8hLPGPGp2jvK.jpg', '2022-04-19 06:20:25', '2022-04-19 06:20:25');
INSERT INTO `images` VALUES (33, 2, 'images/nr17xoHR0fRPxXtW5LRJ3DwekTuBP4FF8wjNi3ay.jpg', '2022-04-19 07:06:42', '2022-04-19 07:06:42');
INSERT INTO `images` VALUES (34, 2, 'images/atwhfIIjkpkwA1t4fmezzBRXknHmLh639f5Wt73e.jpg', '2022-04-19 07:06:58', '2022-04-19 07:06:58');
INSERT INTO `images` VALUES (35, 2, 'images/KRfEQaJdRJBLFmkaQN3fEzbKRGF3DlIu8wYFH4Z0.jpg', '2022-04-19 07:07:06', '2022-04-19 07:07:06');

-- ----------------------------
-- Table structure for kategori
-- ----------------------------
DROP TABLE IF EXISTS `kategori`;
CREATE TABLE `kategori`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `kode_kategori` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_kategori` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug_kategori` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi_kategori` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `kategori_user_id_foreign`(`user_id`) USING BTREE,
  CONSTRAINT `kategori_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of kategori
-- ----------------------------
INSERT INTO `kategori` VALUES (2, 'Skincare', 'Skincare', 'Skincare', 'Skincare', 'publish', 'images/1Te4anGwI6iRGiSFqkZVhcsD6g6fRb7uDHCz9Hjz.jpg', 2, '2022-04-12 04:59:17', '2022-04-19 02:07:56');
INSERT INTO `kategori` VALUES (3, 'Makeup', 'Makeup', 'Makeup', 'Makeup', 'publish', 'images/5EGFgYpoktxSoGCyoevAKXhdubdvFa6G9iA4GEUG.jpg', 2, '2022-04-19 02:08:17', '2022-04-19 02:09:40');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (5, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (6, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (7, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (8, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (9, '2022_04_06_012442_create_kategoris_table', 2);
INSERT INTO `migrations` VALUES (10, '2022_04_06_013311_create_produks_table', 3);
INSERT INTO `migrations` VALUES (11, '2022_04_12_044528_create_images_table', 4);
INSERT INTO `migrations` VALUES (12, '2022_04_19_023945_create_produk_images_table', 5);
INSERT INTO `migrations` VALUES (13, '2022_04_19_044715_create_slideshows_table', 6);
INSERT INTO `migrations` VALUES (14, '2022_04_19_062309_create_produk_promos_table', 7);
INSERT INTO `migrations` VALUES (15, '2022_04_21_051010_create_wishlists_table', 8);
INSERT INTO `migrations` VALUES (16, '2022_04_21_055551_create_carts_table', 9);
INSERT INTO `migrations` VALUES (17, '2022_04_21_061404_create_cart_details_table', 9);
INSERT INTO `migrations` VALUES (18, '2022_04_21_063728_create_alamat_pengirimen_table', 10);
INSERT INTO `migrations` VALUES (19, '2022_04_21_064313_create_orders_table', 10);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cart_id` int(10) UNSIGNED NOT NULL,
  `nama_penerima` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_tlp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `provinsi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kota` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kecamatan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kelurahan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kodepos` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_cart_id_foreign`(`cart_id`) USING BTREE,
  CONSTRAINT `order_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (1, 2, 'aletha', '1231241', 'kaliwiro', 'Jawa Tengah', 'Wonosobo', 'Kaliwiro', 'Kaliwiro', '873554', '2022-04-22 05:34:42', '2022-04-22 05:34:42');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token`) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type`, `tokenable_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for produk
-- ----------------------------
DROP TABLE IF EXISTS `produk`;
CREATE TABLE `produk`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `kategori_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `kode_produk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_produk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug_produk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi_produk` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `qty` double(12, 2) NOT NULL DEFAULT 0.00,
  `satuan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` double(12, 2) NOT NULL DEFAULT 0.00,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `produk_user_id_foreign`(`user_id`) USING BTREE,
  INDEX `produk_kategori_id_foreign`(`kategori_id`) USING BTREE,
  CONSTRAINT `produk_kategori_id_foreign` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `produk_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of produk
-- ----------------------------
INSERT INTO `produk` VALUES (1, 3, 2, 'BJ-01', 'Lipstick', 'Lipstick', 'Lipstick', 'images/XM5CnSDfDX4F8m3tzZNfTXPH4yQI9OacNKdCz9QH.jpg', 10.00, '34', 89000.00, 'publish', '2022-04-19 02:21:37', '2022-07-14 04:33:38');
INSERT INTO `produk` VALUES (2, 2, 1, 'BJ-02', 'krim', 'krim', 'krim', NULL, 1.00, '3', 80.00, 'publish', '2022-07-06 15:10:32', '2022-07-06 15:10:32');
INSERT INTO `produk` VALUES (3, 3, 1, 'CL-01', 'Toner', 'Toner', 'Toner', NULL, 3.00, '2', 423100.00, 'publish', '2022-07-06 15:10:55', '2022-07-06 15:10:55');

-- ----------------------------
-- Table structure for produk_images
-- ----------------------------
DROP TABLE IF EXISTS `produk_images`;
CREATE TABLE `produk_images`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `produk_id` int(10) UNSIGNED NOT NULL,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `produk_images_produk_id_foreign`(`produk_id`) USING BTREE,
  CONSTRAINT `produk_images_produk_id_foreign` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of produk_images
-- ----------------------------
INSERT INTO `produk_images` VALUES (1, 1, 'images/XM5CnSDfDX4F8m3tzZNfTXPH4yQI9OacNKdCz9QH.jpg', '2022-04-19 02:56:09', '2022-04-19 02:56:09');

-- ----------------------------
-- Table structure for produk_promo
-- ----------------------------
DROP TABLE IF EXISTS `produk_promo`;
CREATE TABLE `produk_promo`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `produk_id` int(10) UNSIGNED NOT NULL,
  `harga_awal` decimal(16, 2) NOT NULL DEFAULT 0.00,
  `harga_akhir` decimal(16, 2) NOT NULL DEFAULT 0.00,
  `diskon_persen` int(11) NOT NULL DEFAULT 0,
  `diskon_nominal` decimal(16, 2) NOT NULL DEFAULT 0.00,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `produk_promo_user_id_foreign`(`user_id`) USING BTREE,
  INDEX `produk_promo_produk_id_foreign`(`produk_id`) USING BTREE,
  CONSTRAINT `produk_promo_produk_id_foreign` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `produk_promo_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of produk_promo
-- ----------------------------
INSERT INTO `produk_promo` VALUES (1, 1, 89000.00, 80100.00, 10, 8900.00, 2, '2022-04-19 06:48:34', '2022-04-19 06:48:34');

-- ----------------------------
-- Table structure for slideshow
-- ----------------------------
DROP TABLE IF EXISTS `slideshow`;
CREATE TABLE `slideshow`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `caption_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `caption_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `slideshow_user_id_foreign`(`user_id`) USING BTREE,
  CONSTRAINT `slideshow_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of slideshow
-- ----------------------------
INSERT INTO `slideshow` VALUES (5, 'images/nr17xoHR0fRPxXtW5LRJ3DwekTuBP4FF8wjNi3ay.jpg', '1', '1', 2, '2022-04-19 07:06:42', '2022-04-19 07:06:42');
INSERT INTO `slideshow` VALUES (6, 'images/atwhfIIjkpkwA1t4fmezzBRXknHmLh639f5Wt73e.jpg', '1', '1', 2, '2022-04-19 07:06:58', '2022-04-19 07:06:58');
INSERT INTO `slideshow` VALUES (7, 'images/KRfEQaJdRJBLFmkaQN3fEzbKRGF3DlIu8wYFH4Z0.jpg', '3', '3', 2, '2022-04-19 07:07:07', '2022-04-19 07:07:07');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'member',
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'aktif',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Jor Klowor', 'jorkloworbanget@gmail.com', NULL, '$2y$10$PsXiaX.skv40DOo0ukkpUeBYsWiEvn59f5jLxZKBiFkCNNUrJhyqC', '085852527575', 'Kalibeber Rt 03 Rw 05', 'admin', NULL, 'aktif', NULL, '2022-04-02 04:48:20', '2022-04-02 04:48:20');
INSERT INTO `users` VALUES (2, 'Pandu Aji', 'panduaji@gmail.com', NULL, '$2y$10$PsXiaX.skv40DOo0ukkpUeBYsWiEvn59f5jLxZKBiFkCNNUrJhyqC', '081722623678', NULL, 'member', NULL, 'aktif', NULL, '2022-04-06 01:14:22', '2022-04-06 01:14:22');
INSERT INTO `users` VALUES (3, 'pembeli', 'pembeli@gmail.com', NULL, '$2y$10$iL8qxFUaFMX/Ys9EDNzst.OBTwsa09nDYJtLPpt7WERrsxFJow.Mu', '12312142', NULL, 'member', NULL, 'aktif', NULL, '2022-04-21 05:30:19', '2022-04-21 05:30:19');
INSERT INTO `users` VALUES (4, 'Riski Setiyani', 'riskisetiyani7@gmail.com', NULL, '$2y$10$AZtSUDCrhwa1tKUeKZhG0Opa4qti6pG6iQ/R6SLP4UNw420sv9boy', '082327079989', NULL, 'member', NULL, 'aktif', NULL, '2022-07-08 06:53:15', '2022-07-08 06:53:15');

-- ----------------------------
-- Table structure for wishlist
-- ----------------------------
DROP TABLE IF EXISTS `wishlist`;
CREATE TABLE `wishlist`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `produk_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `wishlist_user_id_foreign`(`user_id`) USING BTREE,
  INDEX `wishlist_produk_id_foreign`(`produk_id`) USING BTREE,
  CONSTRAINT `wishlist_produk_id_foreign` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `wishlist_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wishlist
-- ----------------------------
INSERT INTO `wishlist` VALUES (2, 1, 3, '2022-04-21 05:35:00', '2022-04-21 05:35:00');

SET FOREIGN_KEY_CHECKS = 1;
