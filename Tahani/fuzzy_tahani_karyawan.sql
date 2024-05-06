/*
 Navicat Premium Data Transfer

 Source Server         : Local
 Source Server Type    : MySQL
 Source Server Version : 50716 (5.7.16-log)
 Source Host           : 127.0.0.1:3306
 Source Schema         : fuzzy_tahani_karyawan

 Target Server Type    : MySQL
 Target Server Version : 50716 (5.7.16-log)
 File Encoding         : 65001

 Date: 06/05/2024 14:07:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for karyawan
-- ----------------------------
DROP TABLE IF EXISTS `karyawan`;
CREATE TABLE `karyawan`  (
  `Nip` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Nama` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Tgl_lahir` date NULL DEFAULT NULL,
  `Thn_masuk` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Gaji` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Nip`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of karyawan
-- ----------------------------
BEGIN;
INSERT INTO `karyawan` (`Nip`, `Nama`, `Tgl_lahir`, `Thn_masuk`, `Gaji`) VALUES ('01', 'LIA', '1972-03-06', '1996', 750000), ('02', 'IWAN', '1954-09-23', '1985', 1500000), ('03', 'SARI', '1966-12-12', '1988', 1255000), ('04', 'ADI', '1965-03-06', '1988', 1040000), ('05', 'BUDI', '1960-12-04', '1990', 950000), ('06', 'AMIR', '1963-11-18', '1989', 1600000), ('07', 'RIAN', '1965-05-28', '1997', 1250000), ('08', 'KIKI', '1971-07-09', '2001', 550000), ('09', 'ALDA', '1967-08-14', '1999', 735000), ('10', 'YOGA', '1977-09-17', '2000', 860000);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
