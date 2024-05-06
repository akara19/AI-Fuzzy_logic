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

 Date: 06/05/2024 14:08:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Procedure structure for cari_gaji
-- ----------------------------
DROP PROCEDURE IF EXISTS `cari_gaji`;
delimiter ;;
CREATE PROCEDURE `cari_gaji`()
BEGIN
SELECT a.Nama,a.Gaji
FROM karyawan a
WHERE a.Gaji > 1000000;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for cari_masa_kerja_gaji
-- ----------------------------
DROP PROCEDURE IF EXISTS `cari_masa_kerja_gaji`;
delimiter ;;
CREATE PROCEDURE `cari_masa_kerja_gaji`()
BEGIN
SELECT a.Nip,a.Nama,a.Thn_masuk,(YEAR(CURRENT_DATE)-a.Thn_masuk) AS Masa_kerja, a.Gaji
FROM karyawan a
WHERE (YEAR(CURRENT_DATE)-a.Thn_masuk) <=5 AND a.Gaji > 1000000;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for cari_umur
-- ----------------------------
DROP PROCEDURE IF EXISTS `cari_umur`;
delimiter ;;
CREATE PROCEDURE `cari_umur`()
BEGIN
SELECT a.Nama,a.Tgl_lahir,
(YEAR(CURRENT_DATE)-YEAR(a.Tgl_lahir)) AS Umur
FROM karyawan a
WHERE (YEAR(CURRENT_DATE)-YEAR(a.Tgl_lahir)) < 50;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for cari_umur_masa_kerj
-- ----------------------------
DROP PROCEDURE IF EXISTS `cari_umur_masa_kerj`;
delimiter ;;
CREATE PROCEDURE `cari_umur_masa_kerj`()
BEGIN
SELECT a.Nip,a.Nama,a.Tgl_lahir,
(YEAR(CURRENT_DATE)-YEAR(a.Tgl_lahir)) AS Umur,
a.Thn_masuk,(YEAR(CURRENT_DATE)-a.Thn_masuk) AS Masa_kerja, a.Gaji
FROM karyawan a;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for fc_muda
-- ----------------------------
DROP FUNCTION IF EXISTS `fc_muda`;
delimiter ;;
CREATE FUNCTION `fc_muda`(fNilai FLOAT)
 RETURNS float
BEGIN
SET @fNilai_min = 30;
SET @fNilai_max = 40;


IF (fNilai <= @fNilai_min) THEN
    RETURN (1);
ELSEIF ((fNilai > @fNilai_min) and (fNilai < @fNilai_max )) THEN
    RETURN ((@fNilai_max- fNilai)/(@fNilai_max-@fNilai_min));
ELSE 
    RETURN (0);
END IF;

END
;;
delimiter ;

-- ----------------------------
-- Function structure for fc_parobaya
-- ----------------------------
DROP FUNCTION IF EXISTS `fc_parobaya`;
delimiter ;;
CREATE FUNCTION `fc_parobaya`(fNilai FLOAT)
 RETURNS float
BEGIN

SET @fNilai_min = 35;
SET @fNilai_penuh = 45;
SET @fNilai_max = 50;

IF (fNilai <= @fNilai_min) THEN
    RETURN (0);
ELSEIF ((fNilai >= @fNilai_min) and (fNilai <= @fNilai_penuh) ) THEN
		RETURN ((fNilai - @fNilai_min)/(@fNilai_penuh-@fNilai_min));
ELSEIF ((fNilai >= @fNilai_penuh) AND (fNilai <=@fNilai_max) ) THEN
		RETURN ((@fNilai_max-fNilai)/(@fNilai_max-@fNilai_penuh));
ELSE 
    RETURN (0);
END IF;

END
;;
delimiter ;

-- ----------------------------
-- Function structure for fc_tua
-- ----------------------------
DROP FUNCTION IF EXISTS `fc_tua`;
delimiter ;;
CREATE FUNCTION `fc_tua`(fNilai FLOAT)
 RETURNS float
BEGIN
SET @fNilai_min = 40;
SET @fNilai_max = 50;

IF (fNilai <= @fNilai_min) THEN
    RETURN (0);
ELSEIF ((fNilai >= @fNilai_min ) AND (fNilai <= @fNilai_max)) THEN
    RETURN ((fNilai - @fNilai_min)/(@fNilai_max-@fNilai_min));
ELSE 
    RETURN (1);
END IF;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for hasil_umur
-- ----------------------------
DROP PROCEDURE IF EXISTS `hasil_umur`;
delimiter ;;
CREATE PROCEDURE `hasil_umur`()
BEGIN
SELECT a.Nama,a.Tgl_lahir,
(YEAR(CURRENT_DATE)-YEAR(a.Tgl_lahir)) AS Umur,
fc_muda( (YEAR(CURRENT_DATE)-YEAR(a.Tgl_lahir)) ) AS Muda,
fc_parobaya( (YEAR(CURRENT_DATE)-YEAR(a.Tgl_lahir)) ) AS Parobaya,
fc_tua( (YEAR(CURRENT_DATE)-YEAR(a.Tgl_lahir)) ) AS Tua
FROM karyawan a;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
