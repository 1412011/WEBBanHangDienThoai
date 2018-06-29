/*
 Navicat MySQL Data Transfer

 Source Server         : ffgf
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : quanlybanhang

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 29/06/2018 07:34:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `idAdmin` int(11) NOT NULL AUTO_INCREMENT,
  `tenAdmin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `gioiTinh` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sdt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ngaySinh` date NULL DEFAULT NULL,
  `diaChi` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `matKhau` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`idAdmin`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'Nguyễn Hoàng Anh', 'Nam', '0976646622', '1996-06-13', 'Quận 10, Tp. Hồ Chí Minh', 'anhhoang_96@gmail.com', '6B86B273FF34FCE19D6B804EFF5A3F5747ADA4EAA22F1D49C01E52DDB7875B4B');
INSERT INTO `admin` VALUES (2, 'Nguyễn Thanh Hậu', 'Nam', '0972750387', '1995-02-01', 'Quận Thủ Đức, Tp. Hồ Chí Minh', 'nguyenthanhhau.khtn@gmail.com', 'D4735E3A265E16EEE03F59718B9B5D03019C07D8B6C51F90DA3A666EEC13AB35');

-- ----------------------------
-- Table structure for chitietdonhang
-- ----------------------------
DROP TABLE IF EXISTS `chitietdonhang`;
CREATE TABLE `chitietdonhang`  (
  `idChiTietDonHang` int(11) NOT NULL AUTO_INCREMENT,
  `idDonHang` int(11) NULL DEFAULT NULL,
  `idSanPham` int(11) NULL DEFAULT NULL,
  `soLuong` int(11) NULL DEFAULT 1,
  `giaTien` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`idChiTietDonHang`) USING BTREE,
  INDEX `fk_SanPham_idx`(`idSanPham`) USING BTREE,
  INDEX `fk_DonHang_idx`(`idDonHang`) USING BTREE,
  INDEX `fk_CTHD_SanPham_idx`(`idSanPham`) USING BTREE,
  INDEX `fk_CTHD_DonHang_idx`(`idDonHang`) USING BTREE,
  CONSTRAINT `fk_CTHD_DonHang` FOREIGN KEY (`idDonHang`) REFERENCES `donhang` (`iddonhang`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_CTHD_SanPham` FOREIGN KEY (`idSanPham`) REFERENCES `sanpham` (`idsanpham`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for danhgia
-- ----------------------------
DROP TABLE IF EXISTS `danhgia`;
CREATE TABLE `danhgia`  (
  `idDanhGia` int(11) NOT NULL AUTO_INCREMENT,
  `idSanPham` int(11) NULL DEFAULT NULL,
  `1Sao` int(11) NULL DEFAULT 0,
  `2Sao` int(11) NULL DEFAULT 0,
  `3Sao` int(11) NULL DEFAULT 0,
  `4Sao` int(11) NULL DEFAULT 0,
  `5Sao` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`idDanhGia`) USING BTREE,
  INDEX `fk_SanPham_idx`(`idSanPham`) USING BTREE,
  CONSTRAINT `fk_DanhGia_SanPham` FOREIGN KEY (`idSanPham`) REFERENCES `sanpham` (`idsanpham`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for donhang
-- ----------------------------
DROP TABLE IF EXISTS `donhang`;
CREATE TABLE `donhang`  (
  `idDonHang` int(11) NOT NULL AUTO_INCREMENT,
  `ngayDat` date NULL DEFAULT NULL,
  `tongTien` bigint(20) NULL DEFAULT NULL,
  `tinhTrang` int(11) NULL DEFAULT 1,
  `idKhachHang` int(11) NULL DEFAULT NULL,
  `idThanhToan` int(11) NULL DEFAULT NULL,
  `idGiaoHang` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idDonHang`) USING BTREE,
  INDEX `fk_DonHang_ThanhToan_idx`(`idThanhToan`) USING BTREE,
  INDEX `fk_DonHang_KhachHang_idx`(`idKhachHang`) USING BTREE,
  INDEX `fk_DonHang_GiaoHang_idx`(`idGiaoHang`) USING BTREE,
  INDEX `fk_DH_KhachHang_idx`(`idKhachHang`) USING BTREE,
  INDEX `fk_DH_ThanhToan_idx`(`idThanhToan`) USING BTREE,
  INDEX `fk_DH_GiaoHang_idx`(`idGiaoHang`) USING BTREE,
  CONSTRAINT `fk_DH_GiaoHang` FOREIGN KEY (`idGiaoHang`) REFERENCES `thongtingiaohang` (`idthongtingiaohang`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_DH_KhachHang` FOREIGN KEY (`idKhachHang`) REFERENCES `nguoidung` (`idnguoidung`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_DH_ThanhToan` FOREIGN KEY (`idThanhToan`) REFERENCES `thanhtoan` (`idthanhtoan`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hinhanh
-- ----------------------------
DROP TABLE IF EXISTS `hinhanh`;
CREATE TABLE `hinhanh`  (
  `idHinhAnh` int(11) NOT NULL AUTO_INCREMENT,
  `idSanPham` int(11) NULL DEFAULT NULL,
  `loaiHinhAnh` int(11) NULL DEFAULT NULL,
  `duongDan` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`idHinhAnh`) USING BTREE,
  INDEX `fk_HA_SanPham_idx`(`idSanPham`) USING BTREE,
  CONSTRAINT `fk_HA_SanPham` FOREIGN KEY (`idSanPham`) REFERENCES `sanpham` (`idsanpham`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 650 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hinhanh
-- ----------------------------
INSERT INTO `hinhanh` VALUES (1, 1, 0, '/images/1-iphone-x/main.png');
INSERT INTO `hinhanh` VALUES (2, 1, 1, '/images/1-iphone-x/1.jpg');
INSERT INTO `hinhanh` VALUES (3, 1, 1, '/images/1-iphone-x/2.jpg');
INSERT INTO `hinhanh` VALUES (4, 1, 1, '/images/1-iphone-x/3.jpg');
INSERT INTO `hinhanh` VALUES (5, 1, 1, '/images/1-iphone-x/4.jpg');
INSERT INTO `hinhanh` VALUES (6, 1, 1, '/images/1-iphone-x/5.jpg');
INSERT INTO `hinhanh` VALUES (7, 1, 2, '/images/1-iphone-x/6.jpg');
INSERT INTO `hinhanh` VALUES (8, 1, 2, '/images/1-iphone-x/7.jpg');
INSERT INTO `hinhanh` VALUES (9, 1, 2, '/images/1-iphone-x/8.jpg');
INSERT INTO `hinhanh` VALUES (10, 1, 2, '/images/1-iphone-x/9.jpg');
INSERT INTO `hinhanh` VALUES (11, 1, 2, '/images/1-iphone-x/10.jpg');
INSERT INTO `hinhanh` VALUES (12, 2, 0, '/images/2-iphone-8plus/main.png');
INSERT INTO `hinhanh` VALUES (13, 2, 1, '/images/2-iphone-8plus/1.jpg');
INSERT INTO `hinhanh` VALUES (14, 2, 1, '/images/2-iphone-8plus/2.jpg');
INSERT INTO `hinhanh` VALUES (15, 2, 1, '/images/2-iphone-8plus/3.jpg');
INSERT INTO `hinhanh` VALUES (16, 2, 1, '/images/2-iphone-8plus/4.jpg');
INSERT INTO `hinhanh` VALUES (17, 2, 1, '/images/2-iphone-8plus/5.jpg');
INSERT INTO `hinhanh` VALUES (18, 2, 2, '/images/2-iphone-8plus/6.jpg');
INSERT INTO `hinhanh` VALUES (19, 2, 2, '/images/2-iphone-8plus/7.jpg');
INSERT INTO `hinhanh` VALUES (20, 2, 2, '/images/2-iphone-8plus/8.jpg');
INSERT INTO `hinhanh` VALUES (21, 2, 2, '/images/2-iphone-8plus/9.jpg');
INSERT INTO `hinhanh` VALUES (22, 2, 2, '/images/2-iphone-8plus/10.jpg');
INSERT INTO `hinhanh` VALUES (23, 3, 0, '/images/3-iphone-7plus/main.png');
INSERT INTO `hinhanh` VALUES (24, 3, 1, '/images/3-iphone-7plus/1.jpg');
INSERT INTO `hinhanh` VALUES (25, 3, 1, '/images/3-iphone-7plus/2.jpg');
INSERT INTO `hinhanh` VALUES (26, 3, 1, '/images/3-iphone-7plus/3.jpg');
INSERT INTO `hinhanh` VALUES (27, 3, 1, '/images/3-iphone-7plus/4.jpg');
INSERT INTO `hinhanh` VALUES (28, 3, 1, '/images/3-iphone-7plus/5.jpg');
INSERT INTO `hinhanh` VALUES (29, 3, 2, '/images/3-iphone-7plus/6.jpg');
INSERT INTO `hinhanh` VALUES (30, 3, 2, '/images/3-iphone-7plus/7.jpg');
INSERT INTO `hinhanh` VALUES (31, 3, 2, '/images/3-iphone-7plus/8.jpg');
INSERT INTO `hinhanh` VALUES (32, 3, 2, '/images/3-iphone-7plus/9.jpg');
INSERT INTO `hinhanh` VALUES (33, 3, 2, '/images/3-iphone-7plus/10.jpg');
INSERT INTO `hinhanh` VALUES (34, 4, 0, '/images/4-iphone-6splus/main.png');
INSERT INTO `hinhanh` VALUES (35, 4, 1, '/images/4-iphone-6splus/1.jpg');
INSERT INTO `hinhanh` VALUES (36, 4, 1, '/images/4-iphone-6splus/2.jpg');
INSERT INTO `hinhanh` VALUES (37, 4, 1, '/images/4-iphone-6splus/3.jpg');
INSERT INTO `hinhanh` VALUES (38, 4, 1, '/images/4-iphone-6splus/4.jpg');
INSERT INTO `hinhanh` VALUES (39, 4, 1, '/images/4-iphone-6splus/5.jpg');
INSERT INTO `hinhanh` VALUES (40, 4, 2, '/images/4-iphone-6splus/6.jpg');
INSERT INTO `hinhanh` VALUES (41, 4, 2, '/images/4-iphone-6splus/7.jpg');
INSERT INTO `hinhanh` VALUES (42, 4, 2, '/images/4-iphone-6splus/8.jpg');
INSERT INTO `hinhanh` VALUES (43, 4, 2, '/images/4-iphone-6splus/9.jpg');
INSERT INTO `hinhanh` VALUES (44, 4, 2, '/images/4-iphone-6splus/10.jpg');
INSERT INTO `hinhanh` VALUES (45, 5, 0, '/images/5-ss-s9plus/main.png');
INSERT INTO `hinhanh` VALUES (46, 5, 1, '/images/5-ss-s9plus/1.jpg');
INSERT INTO `hinhanh` VALUES (47, 5, 1, '/images/5-ss-s9plus/2.jpg');
INSERT INTO `hinhanh` VALUES (48, 5, 1, '/images/5-ss-s9plus/3.jpg');
INSERT INTO `hinhanh` VALUES (49, 5, 1, '/images/5-ss-s9plus/4.jpg');
INSERT INTO `hinhanh` VALUES (50, 5, 1, '/images/5-ss-s9plus/5.jpg');
INSERT INTO `hinhanh` VALUES (51, 5, 2, '/images/5-ss-s9plus/6.jpg');
INSERT INTO `hinhanh` VALUES (52, 5, 2, '/images/5-ss-s9plus/7.jpg');
INSERT INTO `hinhanh` VALUES (53, 5, 2, '/images/5-ss-s9plus/8.jpg');
INSERT INTO `hinhanh` VALUES (54, 5, 2, '/images/5-ss-s9plus/9.jpg');
INSERT INTO `hinhanh` VALUES (55, 5, 2, '/images/5-ss-s9plus/10.jpg');
INSERT INTO `hinhanh` VALUES (56, 6, 0, '/images/6-ss-note8/main.png');
INSERT INTO `hinhanh` VALUES (57, 6, 1, '/images/6-ss-note8/1.jpg');
INSERT INTO `hinhanh` VALUES (58, 6, 1, '/images/6-ss-note8/2.jpg');
INSERT INTO `hinhanh` VALUES (59, 6, 1, '/images/6-ss-note8/3.jpg');
INSERT INTO `hinhanh` VALUES (60, 6, 1, '/images/6-ss-note8/4.jpg');
INSERT INTO `hinhanh` VALUES (61, 6, 1, '/images/6-ss-note8/5.jpg');
INSERT INTO `hinhanh` VALUES (62, 6, 2, '/images/6-ss-note8/6.jpg');
INSERT INTO `hinhanh` VALUES (63, 6, 2, '/images/6-ss-note8/7.jpg');
INSERT INTO `hinhanh` VALUES (64, 6, 2, '/images/6-ss-note8/8.jpg');
INSERT INTO `hinhanh` VALUES (65, 6, 2, '/images/6-ss-note8/9.jpg');
INSERT INTO `hinhanh` VALUES (66, 6, 2, '/images/6-ss-note8/10.jpg');
INSERT INTO `hinhanh` VALUES (67, 7, 0, '/images/7-ss-s9/main.png');
INSERT INTO `hinhanh` VALUES (68, 7, 1, '/images/7-ss-s9/1.jpg');
INSERT INTO `hinhanh` VALUES (69, 7, 1, '/images/7-ss-s9/2.jpg');
INSERT INTO `hinhanh` VALUES (70, 7, 1, '/images/7-ss-s9/3.jpg');
INSERT INTO `hinhanh` VALUES (71, 7, 1, '/images/7-ss-s9/4.jpg');
INSERT INTO `hinhanh` VALUES (72, 7, 1, '/images/7-ss-s9/5.jpg');
INSERT INTO `hinhanh` VALUES (73, 7, 2, '/images/7-ss-s9/6.jpg');
INSERT INTO `hinhanh` VALUES (74, 7, 2, '/images/7-ss-s9/7.jpg');
INSERT INTO `hinhanh` VALUES (75, 7, 2, '/images/7-ss-s9/8.jpg');
INSERT INTO `hinhanh` VALUES (76, 7, 2, '/images/7-ss-s9/9.jpg');
INSERT INTO `hinhanh` VALUES (77, 7, 2, '/images/7-ss-s9/10.jpg');
INSERT INTO `hinhanh` VALUES (78, 8, 0, '/images/8-ss-s8plus/main.png');
INSERT INTO `hinhanh` VALUES (79, 8, 1, '/images/8-ss-s8plus/1.jpg');
INSERT INTO `hinhanh` VALUES (80, 8, 1, '/images/8-ss-s8plus/2.jpg');
INSERT INTO `hinhanh` VALUES (81, 8, 1, '/images/8-ss-s8plus/3.jpg');
INSERT INTO `hinhanh` VALUES (82, 8, 1, '/images/8-ss-s8plus/4.jpg');
INSERT INTO `hinhanh` VALUES (83, 8, 1, '/images/8-ss-s8plus/5.jpg');
INSERT INTO `hinhanh` VALUES (84, 8, 2, '/images/8-ss-s8plus/6.jpg');
INSERT INTO `hinhanh` VALUES (85, 8, 2, '/images/8-ss-s8plus/7.jpg');
INSERT INTO `hinhanh` VALUES (86, 8, 2, '/images/8-ss-s8plus/8.jpg');
INSERT INTO `hinhanh` VALUES (87, 8, 2, '/images/8-ss-s8plus/9.jpg');
INSERT INTO `hinhanh` VALUES (88, 8, 2, '/images/8-ss-s8plus/10.jpg');
INSERT INTO `hinhanh` VALUES (89, 9, 0, '/images/9-ss-s8/main.png');
INSERT INTO `hinhanh` VALUES (90, 9, 1, '/images/9-ss-s8/1.jpg');
INSERT INTO `hinhanh` VALUES (91, 9, 1, '/images/9-ss-s8/2.jpg');
INSERT INTO `hinhanh` VALUES (92, 9, 1, '/images/9-ss-s8/3.jpg');
INSERT INTO `hinhanh` VALUES (93, 9, 1, '/images/9-ss-s8/4.jpg');
INSERT INTO `hinhanh` VALUES (94, 9, 1, '/images/9-ss-s8/5.jpg');
INSERT INTO `hinhanh` VALUES (95, 9, 2, '/images/9-ss-s8/6.jpg');
INSERT INTO `hinhanh` VALUES (96, 9, 2, '/images/9-ss-s8/7.jpg');
INSERT INTO `hinhanh` VALUES (97, 9, 2, '/images/9-ss-s8/8.jpg');
INSERT INTO `hinhanh` VALUES (98, 9, 2, '/images/9-ss-s8/9.jpg');
INSERT INTO `hinhanh` VALUES (99, 9, 2, '/images/9-ss-s8/10.jpg');
INSERT INTO `hinhanh` VALUES (100, 10, 0, '/images/10-ss-a8plus/main.png');
INSERT INTO `hinhanh` VALUES (101, 10, 1, '/images/10-ss-a8plus/1.jpg');
INSERT INTO `hinhanh` VALUES (102, 10, 1, '/images/10-ss-a8plus/2.jpg');
INSERT INTO `hinhanh` VALUES (103, 10, 1, '/images/10-ss-a8plus/3.jpg');
INSERT INTO `hinhanh` VALUES (104, 10, 1, '/images/10-ss-a8plus/4.jpg');
INSERT INTO `hinhanh` VALUES (105, 10, 1, '/images/10-ss-a8plus/5.jpg');
INSERT INTO `hinhanh` VALUES (106, 10, 2, '/images/10-ss-a8plus/6.png');
INSERT INTO `hinhanh` VALUES (107, 10, 2, '/images/10-ss-a8plus/7.png');
INSERT INTO `hinhanh` VALUES (108, 10, 2, '/images/10-ss-a8plus/8.png');
INSERT INTO `hinhanh` VALUES (109, 10, 2, '/images/10-ss-a8plus/9.png');
INSERT INTO `hinhanh` VALUES (110, 10, 2, '/images/10-ss-a8plus/10.png');
INSERT INTO `hinhanh` VALUES (111, 11, 0, '/images/11-ss-j7pro/main.png');
INSERT INTO `hinhanh` VALUES (112, 11, 1, '/images/11-ss-j7pro/1.jpg');
INSERT INTO `hinhanh` VALUES (113, 11, 1, '/images/11-ss-j7pro/2.jpg');
INSERT INTO `hinhanh` VALUES (114, 11, 1, '/images/11-ss-j7pro/3.jpg');
INSERT INTO `hinhanh` VALUES (115, 11, 1, '/images/11-ss-j7pro/4.jpg');
INSERT INTO `hinhanh` VALUES (116, 11, 1, '/images/11-ss-j7pro/5.jpg');
INSERT INTO `hinhanh` VALUES (117, 11, 2, '/images/11-ss-j7pro/6.jpg');
INSERT INTO `hinhanh` VALUES (118, 11, 2, '/images/11-ss-j7pro/7.jpg');
INSERT INTO `hinhanh` VALUES (119, 11, 2, '/images/11-ss-j7pro/8.jpg');
INSERT INTO `hinhanh` VALUES (120, 11, 2, '/images/11-ss-j7pro/9.jpg');
INSERT INTO `hinhanh` VALUES (121, 11, 2, '/images/11-ss-j7pro/10.jpg');
INSERT INTO `hinhanh` VALUES (122, 12, 0, '/images/12-ss-a6plus/main.png');
INSERT INTO `hinhanh` VALUES (123, 12, 1, '/images/12-ss-a6plus/1.jpg');
INSERT INTO `hinhanh` VALUES (124, 12, 1, '/images/12-ss-a6plus/2.jpg');
INSERT INTO `hinhanh` VALUES (125, 12, 1, '/images/12-ss-a6plus/3.jpg');
INSERT INTO `hinhanh` VALUES (126, 12, 1, '/images/12-ss-a6plus/4.jpg');
INSERT INTO `hinhanh` VALUES (127, 12, 1, '/images/12-ss-a6plus/5.jpg');
INSERT INTO `hinhanh` VALUES (128, 12, 2, '/images/12-ss-a6plus/6.jpg');
INSERT INTO `hinhanh` VALUES (129, 12, 2, '/images/12-ss-a6plus/7.jpg');
INSERT INTO `hinhanh` VALUES (130, 12, 2, '/images/12-ss-a6plus/8.jpg');
INSERT INTO `hinhanh` VALUES (131, 12, 2, '/images/12-ss-a6plus/9.jpg');
INSERT INTO `hinhanh` VALUES (132, 12, 2, '/images/12-ss-a6plus/10.jpg');
INSERT INTO `hinhanh` VALUES (133, 13, 0, '/images/13-ss-c9pro/main.png');
INSERT INTO `hinhanh` VALUES (134, 13, 1, '/images/13-ss-c9pro/1.jpg');
INSERT INTO `hinhanh` VALUES (135, 13, 1, '/images/13-ss-c9pro/2.jpg');
INSERT INTO `hinhanh` VALUES (136, 13, 1, '/images/13-ss-c9pro/3.jpg');
INSERT INTO `hinhanh` VALUES (137, 13, 1, '/images/13-ss-c9pro/4.jpg');
INSERT INTO `hinhanh` VALUES (138, 13, 1, '/images/13-ss-c9pro/5.jpg');
INSERT INTO `hinhanh` VALUES (139, 13, 2, '/images/13-ss-c9pro/6.jpg');
INSERT INTO `hinhanh` VALUES (140, 13, 2, '/images/13-ss-c9pro/7.jpg');
INSERT INTO `hinhanh` VALUES (141, 13, 2, '/images/13-ss-c9pro/8.jpg');
INSERT INTO `hinhanh` VALUES (142, 13, 2, '/images/13-ss-c9pro/9.jpg');
INSERT INTO `hinhanh` VALUES (143, 13, 2, '/images/13-ss-c9pro/10.jpg');
INSERT INTO `hinhanh` VALUES (144, 14, 0, '/images/14-ss-j6/main.png');
INSERT INTO `hinhanh` VALUES (145, 14, 1, '/images/14-ss-j6/1.jpg');
INSERT INTO `hinhanh` VALUES (146, 14, 1, '/images/14-ss-j6/2.jpg');
INSERT INTO `hinhanh` VALUES (147, 14, 1, '/images/14-ss-j6/3.jpg');
INSERT INTO `hinhanh` VALUES (148, 14, 1, '/images/14-ss-j6/4.jpg');
INSERT INTO `hinhanh` VALUES (149, 14, 1, '/images/14-ss-j6/5.jpg');
INSERT INTO `hinhanh` VALUES (150, 14, 2, '/images/14-ss-j6/6.jpg');
INSERT INTO `hinhanh` VALUES (151, 14, 2, '/images/14-ss-j6/7.jpg');
INSERT INTO `hinhanh` VALUES (152, 14, 2, '/images/14-ss-j6/8.jpg');
INSERT INTO `hinhanh` VALUES (153, 14, 2, '/images/14-ss-j6/9.jpg');
INSERT INTO `hinhanh` VALUES (154, 14, 2, '/images/14-ss-j6/10.jpg');
INSERT INTO `hinhanh` VALUES (155, 15, 0, '/images/15-ss-a8/main.png');
INSERT INTO `hinhanh` VALUES (156, 15, 1, '/images/15-ss-a8/1.jpg');
INSERT INTO `hinhanh` VALUES (157, 15, 1, '/images/15-ss-a8/2.jpg');
INSERT INTO `hinhanh` VALUES (158, 15, 1, '/images/15-ss-a8/3.jpg');
INSERT INTO `hinhanh` VALUES (159, 15, 1, '/images/15-ss-a8/4.jpg');
INSERT INTO `hinhanh` VALUES (160, 15, 1, '/images/15-ss-a8/5.jpg');
INSERT INTO `hinhanh` VALUES (161, 15, 2, '/images/15-ss-a8/6.jpg');
INSERT INTO `hinhanh` VALUES (162, 15, 2, '/images/15-ss-a8/7.jpg');
INSERT INTO `hinhanh` VALUES (163, 15, 2, '/images/15-ss-a8/8.jpg');
INSERT INTO `hinhanh` VALUES (164, 15, 2, '/images/15-ss-a8/9.jpg');
INSERT INTO `hinhanh` VALUES (165, 15, 2, '/images/15-ss-a8/10.jpg');
INSERT INTO `hinhanh` VALUES (166, 16, 0, '/images/16-ss-j3/main.png');
INSERT INTO `hinhanh` VALUES (167, 16, 1, '/images/16-ss-j3/1.jpg');
INSERT INTO `hinhanh` VALUES (168, 16, 1, '/images/16-ss-j3/2.jpg');
INSERT INTO `hinhanh` VALUES (169, 16, 1, '/images/16-ss-j3/3.jpg');
INSERT INTO `hinhanh` VALUES (170, 16, 1, '/images/16-ss-j3/4.jpg');
INSERT INTO `hinhanh` VALUES (171, 16, 1, '/images/16-ss-j3/5.jpg');
INSERT INTO `hinhanh` VALUES (172, 16, 2, '/images/16-ss-j3/6.jpg');
INSERT INTO `hinhanh` VALUES (173, 16, 2, '/images/16-ss-j3/7.jpg');
INSERT INTO `hinhanh` VALUES (174, 16, 2, '/images/16-ss-j3/8.jpg');
INSERT INTO `hinhanh` VALUES (175, 16, 2, '/images/16-ss-j3/9.jpg');
INSERT INTO `hinhanh` VALUES (176, 16, 2, '/images/16-ss-j3/10.jpg');
INSERT INTO `hinhanh` VALUES (177, 17, 0, '/images/17-ss-j4/main.png');
INSERT INTO `hinhanh` VALUES (178, 17, 1, '/images/17-ss-j4/1.jpg');
INSERT INTO `hinhanh` VALUES (179, 17, 1, '/images/17-ss-j4/2.jpg');
INSERT INTO `hinhanh` VALUES (180, 17, 1, '/images/17-ss-j4/3.jpg');
INSERT INTO `hinhanh` VALUES (181, 17, 1, '/images/17-ss-j4/4.jpg');
INSERT INTO `hinhanh` VALUES (182, 17, 1, '/images/17-ss-j4/5.jpg');
INSERT INTO `hinhanh` VALUES (183, 17, 2, '/images/17-ss-j4/6.jpg');
INSERT INTO `hinhanh` VALUES (184, 17, 2, '/images/17-ss-j4/7.jpg');
INSERT INTO `hinhanh` VALUES (185, 17, 2, '/images/17-ss-j4/8.jpg');
INSERT INTO `hinhanh` VALUES (186, 17, 2, '/images/17-ss-j4/9.jpg');
INSERT INTO `hinhanh` VALUES (187, 17, 2, '/images/17-ss-j4/10.jpg');
INSERT INTO `hinhanh` VALUES (188, 18, 0, '/images/18-htc-u-ultra/main.png');
INSERT INTO `hinhanh` VALUES (189, 18, 1, '/images/18-htc-u-ultra/1.jpg');
INSERT INTO `hinhanh` VALUES (190, 18, 1, '/images/18-htc-u-ultra/2.jpg');
INSERT INTO `hinhanh` VALUES (191, 18, 1, '/images/18-htc-u-ultra/3.jpg');
INSERT INTO `hinhanh` VALUES (192, 18, 1, '/images/18-htc-u-ultra/4.jpg');
INSERT INTO `hinhanh` VALUES (193, 18, 1, '/images/18-htc-u-ultra/5.jpg');
INSERT INTO `hinhanh` VALUES (194, 18, 2, '/images/18-htc-u-ultra/6.jpg');
INSERT INTO `hinhanh` VALUES (195, 18, 2, '/images/18-htc-u-ultra/7.jpg');
INSERT INTO `hinhanh` VALUES (196, 18, 2, '/images/18-htc-u-ultra/8.jpg');
INSERT INTO `hinhanh` VALUES (197, 18, 2, '/images/18-htc-u-ultra/9.jpg');
INSERT INTO `hinhanh` VALUES (198, 18, 2, '/images/18-htc-u-ultra/10.jpg');
INSERT INTO `hinhanh` VALUES (199, 19, 0, '/images/19-htc-10evo/main.png');
INSERT INTO `hinhanh` VALUES (200, 19, 1, '/images/19-htc-10evo/1.jpg');
INSERT INTO `hinhanh` VALUES (201, 19, 1, '/images/19-htc-10evo/2.jpg');
INSERT INTO `hinhanh` VALUES (202, 19, 1, '/images/19-htc-10evo/3.jpg');
INSERT INTO `hinhanh` VALUES (203, 19, 1, '/images/19-htc-10evo/4.jpg');
INSERT INTO `hinhanh` VALUES (204, 19, 1, '/images/19-htc-10evo/5.jpg');
INSERT INTO `hinhanh` VALUES (205, 19, 2, '/images/19-htc-10evo/6.jpg');
INSERT INTO `hinhanh` VALUES (206, 19, 2, '/images/19-htc-10evo/7.jpg');
INSERT INTO `hinhanh` VALUES (207, 19, 2, '/images/19-htc-10evo/8.jpg');
INSERT INTO `hinhanh` VALUES (208, 19, 2, '/images/19-htc-10evo/9.jpg');
INSERT INTO `hinhanh` VALUES (209, 19, 2, '/images/19-htc-10evo/10.jpg');
INSERT INTO `hinhanh` VALUES (210, 22, 0, '/images/22-htc-desire12/main.png');
INSERT INTO `hinhanh` VALUES (211, 22, 1, '/images/19-htc-10evo/1.jpg');
INSERT INTO `hinhanh` VALUES (212, 22, 1, '/images/19-htc-10evo/2.jpg');
INSERT INTO `hinhanh` VALUES (213, 22, 1, '/images/19-htc-10evo/3.jpg');
INSERT INTO `hinhanh` VALUES (214, 22, 1, '/images/19-htc-10evo/4.jpg');
INSERT INTO `hinhanh` VALUES (215, 22, 1, '/images/19-htc-10evo/5.jpg');
INSERT INTO `hinhanh` VALUES (216, 22, 2, '/images/19-htc-10evo/6.jpg');
INSERT INTO `hinhanh` VALUES (217, 22, 2, '/images/19-htc-10evo/7.jpg');
INSERT INTO `hinhanh` VALUES (218, 22, 2, '/images/19-htc-10evo/8.jpg');
INSERT INTO `hinhanh` VALUES (219, 22, 2, '/images/19-htc-10evo/9.jpg');
INSERT INTO `hinhanh` VALUES (220, 22, 2, '/images/19-htc-10evo/10.jpg');
INSERT INTO `hinhanh` VALUES (221, 21, 0, '/images/21-htc-u11/main.png');
INSERT INTO `hinhanh` VALUES (222, 21, 1, '/images/18-htc-u-ultra/1.jpg');
INSERT INTO `hinhanh` VALUES (223, 21, 1, '/images/18-htc-u-ultra/2.jpg');
INSERT INTO `hinhanh` VALUES (224, 21, 1, '/images/18-htc-u-ultra/3.jpg');
INSERT INTO `hinhanh` VALUES (225, 21, 1, '/images/18-htc-u-ultra/4.jpg');
INSERT INTO `hinhanh` VALUES (226, 21, 1, '/images/18-htc-u-ultra/5.jpg');
INSERT INTO `hinhanh` VALUES (227, 21, 2, '/images/18-htc-u-ultra/6.jpg');
INSERT INTO `hinhanh` VALUES (228, 21, 2, '/images/18-htc-u-ultra/7.jpg');
INSERT INTO `hinhanh` VALUES (229, 21, 2, '/images/18-htc-u-ultra/8.jpg');
INSERT INTO `hinhanh` VALUES (230, 21, 2, '/images/18-htc-u-ultra/9.jpg');
INSERT INTO `hinhanh` VALUES (231, 21, 2, '/images/18-htc-u-ultra/10.jpg');
INSERT INTO `hinhanh` VALUES (232, 23, 0, '/images/23-htc-m9/main.png');
INSERT INTO `hinhanh` VALUES (233, 23, 1, '/images/20-htc-uplay/1.jpg');
INSERT INTO `hinhanh` VALUES (234, 23, 1, '/images/20-htc-uplay/2.jpg');
INSERT INTO `hinhanh` VALUES (235, 23, 1, '/images/20-htc-uplay/3.jpg');
INSERT INTO `hinhanh` VALUES (236, 23, 1, '/images/20-htc-uplay/4.jpg');
INSERT INTO `hinhanh` VALUES (237, 23, 1, '/images/20-htc-uplay/5.jpg');
INSERT INTO `hinhanh` VALUES (238, 23, 2, '/images/20-htc-uplay/6.jpg');
INSERT INTO `hinhanh` VALUES (239, 23, 2, '/images/20-htc-uplay/7.jpg');
INSERT INTO `hinhanh` VALUES (240, 23, 2, '/images/20-htc-uplay/8.jpg');
INSERT INTO `hinhanh` VALUES (241, 23, 2, '/images/20-htc-uplay/9.jpg');
INSERT INTO `hinhanh` VALUES (242, 23, 2, '/images/20-htc-uplay/10.jpg');
INSERT INTO `hinhanh` VALUES (243, 24, 0, '/images/24-sony-xz2/main.png');
INSERT INTO `hinhanh` VALUES (244, 24, 1, '/images/24-sony-xz2/1.jpg');
INSERT INTO `hinhanh` VALUES (245, 24, 1, '/images/24-sony-xz2/2.jpg');
INSERT INTO `hinhanh` VALUES (246, 24, 1, '/images/24-sony-xz2/3.jpg');
INSERT INTO `hinhanh` VALUES (247, 24, 1, '/images/24-sony-xz2/4.jpg');
INSERT INTO `hinhanh` VALUES (248, 24, 1, '/images/24-sony-xz2/5.jpg');
INSERT INTO `hinhanh` VALUES (249, 24, 2, '/images/24-sony-xz2/6.jpg');
INSERT INTO `hinhanh` VALUES (250, 24, 2, '/images/24-sony-xz2/7.jpg');
INSERT INTO `hinhanh` VALUES (251, 24, 2, '/images/24-sony-xz2/8.jpg');
INSERT INTO `hinhanh` VALUES (252, 24, 2, '/images/24-sony-xz2/9.jpg');
INSERT INTO `hinhanh` VALUES (253, 24, 2, '/images/24-sony-xz2/10.jpg');
INSERT INTO `hinhanh` VALUES (254, 25, 0, '/images/25-sony-xz1/main.png');
INSERT INTO `hinhanh` VALUES (255, 25, 1, '/images/25-sony-xz1/1.jpg');
INSERT INTO `hinhanh` VALUES (256, 25, 1, '/images/25-sony-xz1/2.jpg');
INSERT INTO `hinhanh` VALUES (257, 25, 1, '/images/25-sony-xz1/3.jpg');
INSERT INTO `hinhanh` VALUES (258, 25, 1, '/images/25-sony-xz1/4.jpg');
INSERT INTO `hinhanh` VALUES (259, 25, 1, '/images/25-sony-xz1/5.jpg');
INSERT INTO `hinhanh` VALUES (260, 25, 2, '/images/25-sony-xz1/6.jpg');
INSERT INTO `hinhanh` VALUES (261, 25, 2, '/images/25-sony-xz1/7.jpg');
INSERT INTO `hinhanh` VALUES (262, 25, 2, '/images/25-sony-xz1/8.jpg');
INSERT INTO `hinhanh` VALUES (263, 25, 2, '/images/25-sony-xz1/9.jpg');
INSERT INTO `hinhanh` VALUES (264, 25, 2, '/images/25-sony-xz1/10.jpg');
INSERT INTO `hinhanh` VALUES (265, 26, 0, '/images/26-sony-xzdual/main.png');
INSERT INTO `hinhanh` VALUES (266, 26, 1, '/images/26-sony-xzdual/1.jpg');
INSERT INTO `hinhanh` VALUES (267, 26, 1, '/images/26-sony-xzdual/2.jpg');
INSERT INTO `hinhanh` VALUES (268, 26, 1, '/images/26-sony-xzdual/3.jpg');
INSERT INTO `hinhanh` VALUES (269, 26, 1, '/images/26-sony-xzdual/4.jpg');
INSERT INTO `hinhanh` VALUES (270, 26, 1, '/images/26-sony-xzdual/5.jpg');
INSERT INTO `hinhanh` VALUES (271, 26, 2, '/images/26-sony-xzdual/6.jpg');
INSERT INTO `hinhanh` VALUES (272, 26, 2, '/images/26-sony-xzdual/7.jpg');
INSERT INTO `hinhanh` VALUES (273, 26, 2, '/images/26-sony-xzdual/8.jpg');
INSERT INTO `hinhanh` VALUES (274, 26, 2, '/images/26-sony-xzdual/9.jpg');
INSERT INTO `hinhanh` VALUES (275, 26, 2, '/images/26-sony-xzdual/10.jpg');
INSERT INTO `hinhanh` VALUES (276, 27, 0, '/images/27-sony-xa1utra/main.png');
INSERT INTO `hinhanh` VALUES (277, 27, 1, '/images/26-sony-xzdual/1.jpg');
INSERT INTO `hinhanh` VALUES (278, 27, 1, '/images/26-sony-xzdual/2.jpg');
INSERT INTO `hinhanh` VALUES (279, 27, 1, '/images/26-sony-xzdual/3.jpg');
INSERT INTO `hinhanh` VALUES (280, 27, 1, '/images/26-sony-xzdual/4.jpg');
INSERT INTO `hinhanh` VALUES (281, 27, 1, '/images/26-sony-xzdual/5.jpg');
INSERT INTO `hinhanh` VALUES (282, 27, 2, '/images/26-sony-xzdual/6.jpg');
INSERT INTO `hinhanh` VALUES (283, 27, 2, '/images/26-sony-xzdual/7.jpg');
INSERT INTO `hinhanh` VALUES (284, 27, 2, '/images/26-sony-xzdual/8.jpg');
INSERT INTO `hinhanh` VALUES (285, 27, 2, '/images/26-sony-xzdual/9.jpg');
INSERT INTO `hinhanh` VALUES (286, 27, 2, '/images/26-sony-xzdual/10.jpg');
INSERT INTO `hinhanh` VALUES (287, 28, 0, '/images/28-sony-x/main.png');
INSERT INTO `hinhanh` VALUES (288, 28, 1, '/images/28-sony-x/1.jpg');
INSERT INTO `hinhanh` VALUES (289, 28, 1, '/images/28-sony-x/2.jpg');
INSERT INTO `hinhanh` VALUES (290, 28, 1, '/images/28-sony-x/3.jpg');
INSERT INTO `hinhanh` VALUES (291, 28, 1, '/images/28-sony-x/4.jpg');
INSERT INTO `hinhanh` VALUES (292, 28, 1, '/images/28-sony-x/5.jpg');
INSERT INTO `hinhanh` VALUES (293, 28, 2, '/images/28-sony-x/6.jpg');
INSERT INTO `hinhanh` VALUES (294, 28, 2, '/images/28-sony-x/7.jpg');
INSERT INTO `hinhanh` VALUES (295, 28, 2, '/images/28-sony-x/8.jpg');
INSERT INTO `hinhanh` VALUES (296, 28, 2, '/images/28-sony-x/9.jpg');
INSERT INTO `hinhanh` VALUES (297, 28, 2, '/images/28-sony-x/10.jpg');
INSERT INTO `hinhanh` VALUES (298, 31, 0, '/images/31-sony-xa1/main.png');
INSERT INTO `hinhanh` VALUES (299, 31, 1, '/images/28-sony-x/1.jpg');
INSERT INTO `hinhanh` VALUES (300, 31, 1, '/images/28-sony-x/2.jpg');
INSERT INTO `hinhanh` VALUES (301, 31, 1, '/images/28-sony-x/3.jpg');
INSERT INTO `hinhanh` VALUES (302, 31, 1, '/images/28-sony-x/4.jpg');
INSERT INTO `hinhanh` VALUES (303, 31, 1, '/images/28-sony-x/5.jpg');
INSERT INTO `hinhanh` VALUES (304, 31, 2, '/images/28-sony-x/6.jpg');
INSERT INTO `hinhanh` VALUES (305, 31, 2, '/images/28-sony-x/7.jpg');
INSERT INTO `hinhanh` VALUES (306, 31, 2, '/images/28-sony-x/8.jpg');
INSERT INTO `hinhanh` VALUES (307, 31, 2, '/images/28-sony-x/9.jpg');
INSERT INTO `hinhanh` VALUES (308, 31, 2, '/images/28-sony-x/10.jpg');
INSERT INTO `hinhanh` VALUES (309, 29, 0, '/images/29-sony-l2/main.png');
INSERT INTO `hinhanh` VALUES (310, 29, 1, '/images/29-sony-l2/1.jpg');
INSERT INTO `hinhanh` VALUES (311, 29, 1, '/images/29-sony-l2/2.jpg');
INSERT INTO `hinhanh` VALUES (312, 29, 1, '/images/29-sony-l2/3.jpg');
INSERT INTO `hinhanh` VALUES (313, 29, 1, '/images/29-sony-l2/4.jpg');
INSERT INTO `hinhanh` VALUES (314, 29, 1, '/images/29-sony-l2/5.jpg');
INSERT INTO `hinhanh` VALUES (315, 29, 2, '/images/29-sony-l2/6.jpg');
INSERT INTO `hinhanh` VALUES (316, 29, 2, '/images/29-sony-l2/7.jpg');
INSERT INTO `hinhanh` VALUES (317, 29, 2, '/images/29-sony-l2/8.jpg');
INSERT INTO `hinhanh` VALUES (318, 29, 2, '/images/29-sony-l2/9.jpg');
INSERT INTO `hinhanh` VALUES (319, 29, 2, '/images/29-sony-l2/10.jpg');
INSERT INTO `hinhanh` VALUES (320, 30, 0, '/images/30-sony-l1/main.png');
INSERT INTO `hinhanh` VALUES (321, 30, 1, '/images/29-sony-l2/1.jpg');
INSERT INTO `hinhanh` VALUES (322, 30, 1, '/images/29-sony-l2/2.jpg');
INSERT INTO `hinhanh` VALUES (323, 30, 1, '/images/29-sony-l2/3.jpg');
INSERT INTO `hinhanh` VALUES (324, 30, 1, '/images/29-sony-l2/4.jpg');
INSERT INTO `hinhanh` VALUES (325, 30, 1, '/images/29-sony-l2/5.jpg');
INSERT INTO `hinhanh` VALUES (326, 30, 2, '/images/29-sony-l2/6.jpg');
INSERT INTO `hinhanh` VALUES (327, 30, 2, '/images/29-sony-l2/7.jpg');
INSERT INTO `hinhanh` VALUES (328, 30, 2, '/images/29-sony-l2/8.jpg');
INSERT INTO `hinhanh` VALUES (329, 30, 2, '/images/29-sony-l2/9.jpg');
INSERT INTO `hinhanh` VALUES (330, 30, 2, '/images/29-sony-l2/10.jpg');
INSERT INTO `hinhanh` VALUES (331, 45, 0, '/images/45-nokia8/main.png');
INSERT INTO `hinhanh` VALUES (332, 45, 1, '/images/45-nokia8/1.jpg');
INSERT INTO `hinhanh` VALUES (333, 45, 1, '/images/45-nokia8/2.jpg');
INSERT INTO `hinhanh` VALUES (334, 45, 1, '/images/45-nokia8/3.jpg');
INSERT INTO `hinhanh` VALUES (335, 45, 1, '/images/45-nokia8/4.jpg');
INSERT INTO `hinhanh` VALUES (336, 45, 1, '/images/45-nokia8/5.jpg');
INSERT INTO `hinhanh` VALUES (337, 45, 2, '/images/45-nokia8/6.jpg');
INSERT INTO `hinhanh` VALUES (338, 45, 2, '/images/45-nokia8/7.jpg');
INSERT INTO `hinhanh` VALUES (339, 45, 2, '/images/45-nokia8/8.jpg');
INSERT INTO `hinhanh` VALUES (340, 45, 2, '/images/45-nokia8/9.jpg');
INSERT INTO `hinhanh` VALUES (341, 45, 2, '/images/45-nokia8/10.jpg');
INSERT INTO `hinhanh` VALUES (342, 46, 0, '/images/46-nokia7/main.png');
INSERT INTO `hinhanh` VALUES (343, 46, 1, '/images/46-nokia7/1.jpg');
INSERT INTO `hinhanh` VALUES (344, 46, 1, '/images/46-nokia7/2.jpg');
INSERT INTO `hinhanh` VALUES (345, 46, 1, '/images/46-nokia7/3.jpg');
INSERT INTO `hinhanh` VALUES (346, 46, 1, '/images/46-nokia7/4.jpg');
INSERT INTO `hinhanh` VALUES (347, 46, 1, '/images/46-nokia7/5.jpg');
INSERT INTO `hinhanh` VALUES (348, 46, 2, '/images/46-nokia7/6.jpg');
INSERT INTO `hinhanh` VALUES (349, 46, 2, '/images/46-nokia7/7.jpg');
INSERT INTO `hinhanh` VALUES (350, 46, 2, '/images/46-nokia7/8.jpg');
INSERT INTO `hinhanh` VALUES (351, 46, 2, '/images/46-nokia7/9.jpg');
INSERT INTO `hinhanh` VALUES (352, 46, 2, '/images/46-nokia7/10.jpg');
INSERT INTO `hinhanh` VALUES (353, 47, 0, '/images/47-nokia6/main.png');
INSERT INTO `hinhanh` VALUES (354, 47, 1, '/images/47-nokia6/1.jpg');
INSERT INTO `hinhanh` VALUES (355, 47, 1, '/images/47-nokia6/2.jpg');
INSERT INTO `hinhanh` VALUES (356, 47, 1, '/images/47-nokia6/3.jpg');
INSERT INTO `hinhanh` VALUES (357, 47, 1, '/images/47-nokia6/4.jpg');
INSERT INTO `hinhanh` VALUES (358, 47, 1, '/images/47-nokia6/5.jpg');
INSERT INTO `hinhanh` VALUES (359, 47, 2, '/images/47-nokia6/6.jpg');
INSERT INTO `hinhanh` VALUES (360, 47, 2, '/images/47-nokia6/7.jpg');
INSERT INTO `hinhanh` VALUES (361, 47, 2, '/images/47-nokia6/8.jpg');
INSERT INTO `hinhanh` VALUES (362, 47, 2, '/images/47-nokia6/9.jpg');
INSERT INTO `hinhanh` VALUES (363, 47, 2, '/images/47-nokia6/10.jpg');
INSERT INTO `hinhanh` VALUES (364, 48, 0, '/images/48-nokia5/main.png');
INSERT INTO `hinhanh` VALUES (365, 48, 1, '/images/47-nokia6/1.jpg');
INSERT INTO `hinhanh` VALUES (366, 48, 1, '/images/47-nokia6/2.jpg');
INSERT INTO `hinhanh` VALUES (367, 48, 1, '/images/47-nokia6/3.jpg');
INSERT INTO `hinhanh` VALUES (368, 48, 1, '/images/47-nokia6/4.jpg');
INSERT INTO `hinhanh` VALUES (369, 48, 1, '/images/47-nokia6/5.jpg');
INSERT INTO `hinhanh` VALUES (370, 48, 2, '/images/47-nokia6/6.jpg');
INSERT INTO `hinhanh` VALUES (371, 48, 2, '/images/47-nokia6/7.jpg');
INSERT INTO `hinhanh` VALUES (372, 48, 2, '/images/47-nokia6/8.jpg');
INSERT INTO `hinhanh` VALUES (373, 48, 2, '/images/47-nokia6/9.jpg');
INSERT INTO `hinhanh` VALUES (374, 48, 2, '/images/47-nokia6/10.jpg');
INSERT INTO `hinhanh` VALUES (375, 49, 0, '/images/49-nokia3/main.png');
INSERT INTO `hinhanh` VALUES (376, 49, 1, '/images/49-nokia3/1.jpg');
INSERT INTO `hinhanh` VALUES (377, 49, 1, '/images/49-nokia3/2.jpg');
INSERT INTO `hinhanh` VALUES (378, 49, 1, '/images/49-nokia3/3.jpg');
INSERT INTO `hinhanh` VALUES (379, 49, 1, '/images/49-nokia3/4.jpg');
INSERT INTO `hinhanh` VALUES (380, 49, 1, '/images/49-nokia3/5.jpg');
INSERT INTO `hinhanh` VALUES (381, 49, 2, '/images/49-nokia3/6.jpg');
INSERT INTO `hinhanh` VALUES (382, 49, 2, '/images/49-nokia3/7.jpg');
INSERT INTO `hinhanh` VALUES (383, 49, 2, '/images/49-nokia3/8.jpg');
INSERT INTO `hinhanh` VALUES (384, 49, 2, '/images/49-nokia3/9.jpg');
INSERT INTO `hinhanh` VALUES (385, 49, 2, '/images/49-nokia3/10.jpg');
INSERT INTO `hinhanh` VALUES (386, 50, 0, '/images/50-nokia2/main.png');
INSERT INTO `hinhanh` VALUES (387, 50, 1, '/images/49-nokia3/1.jpg');
INSERT INTO `hinhanh` VALUES (388, 50, 1, '/images/49-nokia3/2.jpg');
INSERT INTO `hinhanh` VALUES (389, 50, 1, '/images/49-nokia3/3.jpg');
INSERT INTO `hinhanh` VALUES (390, 50, 1, '/images/49-nokia3/4.jpg');
INSERT INTO `hinhanh` VALUES (391, 50, 1, '/images/49-nokia3/5.jpg');
INSERT INTO `hinhanh` VALUES (392, 50, 2, '/images/49-nokia3/6.jpg');
INSERT INTO `hinhanh` VALUES (393, 50, 2, '/images/49-nokia3/7.jpg');
INSERT INTO `hinhanh` VALUES (394, 50, 2, '/images/49-nokia3/8.jpg');
INSERT INTO `hinhanh` VALUES (395, 50, 2, '/images/49-nokia3/9.jpg');
INSERT INTO `hinhanh` VALUES (396, 50, 2, '/images/49-nokia3/10.jpg');
INSERT INTO `hinhanh` VALUES (397, 51, 0, '/images/51-oppo-f7-128/main.png');
INSERT INTO `hinhanh` VALUES (398, 51, 1, '/images/51-oppo-f7-128/1.jpg');
INSERT INTO `hinhanh` VALUES (399, 51, 1, '/images/51-oppo-f7-128/2.jpg');
INSERT INTO `hinhanh` VALUES (400, 51, 1, '/images/51-oppo-f7-128/3.jpg');
INSERT INTO `hinhanh` VALUES (401, 51, 1, '/images/51-oppo-f7-128/4.jpg');
INSERT INTO `hinhanh` VALUES (402, 51, 1, '/images/51-oppo-f7-128/5.jpg');
INSERT INTO `hinhanh` VALUES (403, 51, 2, '/images/51-oppo-f7-128/6.jpg');
INSERT INTO `hinhanh` VALUES (404, 51, 2, '/images/51-oppo-f7-128/7.jpg');
INSERT INTO `hinhanh` VALUES (405, 51, 2, '/images/51-oppo-f7-128/8.jpg');
INSERT INTO `hinhanh` VALUES (406, 51, 2, '/images/51-oppo-f7-128/9.jpg');
INSERT INTO `hinhanh` VALUES (407, 51, 2, '/images/51-oppo-f7-128/10.jpg');
INSERT INTO `hinhanh` VALUES (408, 52, 0, '/images/52-oppo-f7/main.png');
INSERT INTO `hinhanh` VALUES (409, 52, 1, '/images/51-oppo-f7-128/1.jpg');
INSERT INTO `hinhanh` VALUES (410, 52, 1, '/images/51-oppo-f7-128/2.jpg');
INSERT INTO `hinhanh` VALUES (411, 52, 1, '/images/51-oppo-f7-128/3.jpg');
INSERT INTO `hinhanh` VALUES (412, 52, 1, '/images/51-oppo-f7-128/4.jpg');
INSERT INTO `hinhanh` VALUES (413, 52, 1, '/images/51-oppo-f7-128/5.jpg');
INSERT INTO `hinhanh` VALUES (414, 52, 2, '/images/51-oppo-f7-128/6.jpg');
INSERT INTO `hinhanh` VALUES (415, 52, 2, '/images/51-oppo-f7-128/7.jpg');
INSERT INTO `hinhanh` VALUES (416, 52, 2, '/images/51-oppo-f7-128/8.jpg');
INSERT INTO `hinhanh` VALUES (417, 52, 2, '/images/51-oppo-f7-128/9.jpg');
INSERT INTO `hinhanh` VALUES (418, 52, 2, '/images/51-oppo-f7-128/10.jpg');
INSERT INTO `hinhanh` VALUES (419, 53, 0, '/images/53-oppo-f5/main.png');
INSERT INTO `hinhanh` VALUES (420, 53, 1, '/images/51-oppo-f7-128/1.jpg');
INSERT INTO `hinhanh` VALUES (421, 53, 1, '/images/51-oppo-f7-128/2.jpg');
INSERT INTO `hinhanh` VALUES (422, 53, 1, '/images/51-oppo-f7-128/3.jpg');
INSERT INTO `hinhanh` VALUES (423, 53, 1, '/images/51-oppo-f7-128/4.jpg');
INSERT INTO `hinhanh` VALUES (424, 53, 1, '/images/51-oppo-f7-128/5.jpg');
INSERT INTO `hinhanh` VALUES (425, 53, 2, '/images/51-oppo-f7-128/6.jpg');
INSERT INTO `hinhanh` VALUES (426, 53, 2, '/images/51-oppo-f7-128/7.jpg');
INSERT INTO `hinhanh` VALUES (427, 53, 2, '/images/51-oppo-f7-128/8.jpg');
INSERT INTO `hinhanh` VALUES (428, 53, 2, '/images/51-oppo-f7-128/9.jpg');
INSERT INTO `hinhanh` VALUES (429, 53, 2, '/images/51-oppo-f7-128/10.jpg');
INSERT INTO `hinhanh` VALUES (430, 54, 0, '/images/54-oppo-f3/main.png');
INSERT INTO `hinhanh` VALUES (431, 54, 1, '/images/54-oppo-f3/1.jpg');
INSERT INTO `hinhanh` VALUES (432, 54, 1, '/images/54-oppo-f3/2.jpg');
INSERT INTO `hinhanh` VALUES (433, 54, 1, '/images/54-oppo-f3/3.jpg');
INSERT INTO `hinhanh` VALUES (434, 54, 1, '/images/54-oppo-f3/4.jpg');
INSERT INTO `hinhanh` VALUES (435, 54, 1, '/images/54-oppo-f3/5.jpg');
INSERT INTO `hinhanh` VALUES (436, 54, 2, '/images/54-oppo-f3/6.jpg');
INSERT INTO `hinhanh` VALUES (437, 54, 2, '/images/54-oppo-f3/7.jpg');
INSERT INTO `hinhanh` VALUES (438, 54, 2, '/images/54-oppo-f3/8.jpg');
INSERT INTO `hinhanh` VALUES (439, 54, 2, '/images/54-oppo-f3/9.jpg');
INSERT INTO `hinhanh` VALUES (440, 54, 2, '/images/54-oppo-f3/10.jpg');
INSERT INTO `hinhanh` VALUES (441, 55, 0, '/images/55-oppo-a83/main.png');
INSERT INTO `hinhanh` VALUES (442, 55, 1, '/images/55-oppo-a83/1.jpg');
INSERT INTO `hinhanh` VALUES (443, 55, 1, '/images/55-oppo-a83/2.jpg');
INSERT INTO `hinhanh` VALUES (444, 55, 1, '/images/55-oppo-a83/3.jpg');
INSERT INTO `hinhanh` VALUES (445, 55, 1, '/images/55-oppo-a83/4.jpg');
INSERT INTO `hinhanh` VALUES (446, 55, 1, '/images/55-oppo-a83/5.jpg');
INSERT INTO `hinhanh` VALUES (447, 55, 2, '/images/55-oppo-a83/6.jpg');
INSERT INTO `hinhanh` VALUES (448, 55, 2, '/images/55-oppo-a83/7.jpg');
INSERT INTO `hinhanh` VALUES (449, 55, 2, '/images/55-oppo-a83/8.jpg');
INSERT INTO `hinhanh` VALUES (450, 55, 2, '/images/55-oppo-a83/9.jpg');
INSERT INTO `hinhanh` VALUES (451, 55, 2, '/images/55-oppo-a83/10.jpg');
INSERT INTO `hinhanh` VALUES (452, 56, 0, '/images/56-ipad-pro/main.png');
INSERT INTO `hinhanh` VALUES (453, 56, 1, '/images/56-ipad-pro/1.jpg');
INSERT INTO `hinhanh` VALUES (454, 56, 1, '/images/56-ipad-pro/2.jpg');
INSERT INTO `hinhanh` VALUES (455, 56, 1, '/images/56-ipad-pro/3.jpg');
INSERT INTO `hinhanh` VALUES (456, 56, 1, '/images/56-ipad-pro/4.jpg');
INSERT INTO `hinhanh` VALUES (457, 56, 1, '/images/56-ipad-pro/5.jpg');
INSERT INTO `hinhanh` VALUES (458, 56, 2, '/images/56-ipad-pro/6.jpg');
INSERT INTO `hinhanh` VALUES (459, 56, 2, '/images/56-ipad-pro/7.jpg');
INSERT INTO `hinhanh` VALUES (460, 56, 2, '/images/56-ipad-pro/8.jpg');
INSERT INTO `hinhanh` VALUES (461, 56, 2, '/images/56-ipad-pro/9.jpg');
INSERT INTO `hinhanh` VALUES (462, 56, 2, '/images/56-ipad-pro/10.jpg');
INSERT INTO `hinhanh` VALUES (463, 57, 0, '/images/57-ipad-air/main.png');
INSERT INTO `hinhanh` VALUES (464, 57, 1, '/images/56-ipad-pro/1.jpg');
INSERT INTO `hinhanh` VALUES (465, 57, 1, '/images/56-ipad-pro/2.jpg');
INSERT INTO `hinhanh` VALUES (466, 57, 1, '/images/56-ipad-pro/3.jpg');
INSERT INTO `hinhanh` VALUES (467, 57, 1, '/images/56-ipad-pro/4.jpg');
INSERT INTO `hinhanh` VALUES (468, 57, 1, '/images/56-ipad-pro/5.jpg');
INSERT INTO `hinhanh` VALUES (469, 57, 2, '/images/56-ipad-pro/6.jpg');
INSERT INTO `hinhanh` VALUES (470, 57, 2, '/images/56-ipad-pro/7.jpg');
INSERT INTO `hinhanh` VALUES (471, 57, 2, '/images/56-ipad-pro/8.jpg');
INSERT INTO `hinhanh` VALUES (472, 57, 2, '/images/56-ipad-pro/9.jpg');
INSERT INTO `hinhanh` VALUES (473, 57, 2, '/images/56-ipad-pro/10.jpg');
INSERT INTO `hinhanh` VALUES (474, 58, 0, '/images/58-ipad-wificell/main.png');
INSERT INTO `hinhanh` VALUES (475, 58, 1, '/images/58-ipad-wificell/1.jpg');
INSERT INTO `hinhanh` VALUES (476, 58, 1, '/images/58-ipad-wificell/2.jpg');
INSERT INTO `hinhanh` VALUES (477, 58, 1, '/images/58-ipad-wificell/3.jpg');
INSERT INTO `hinhanh` VALUES (478, 58, 1, '/images/58-ipad-wificell/4.jpg');
INSERT INTO `hinhanh` VALUES (479, 58, 1, '/images/58-ipad-wificell/5.jpg');
INSERT INTO `hinhanh` VALUES (480, 58, 2, '/images/58-ipad-wificell/6.jpg');
INSERT INTO `hinhanh` VALUES (481, 58, 2, '/images/58-ipad-wificell/7.jpg');
INSERT INTO `hinhanh` VALUES (482, 58, 2, '/images/58-ipad-wificell/8.jpg');
INSERT INTO `hinhanh` VALUES (483, 58, 2, '/images/58-ipad-wificell/9.jpg');
INSERT INTO `hinhanh` VALUES (484, 58, 2, '/images/58-ipad-wificell/10.jpg');
INSERT INTO `hinhanh` VALUES (485, 60, 0, '/images/60-ipad-wifi/main.png');
INSERT INTO `hinhanh` VALUES (486, 60, 1, '/images/58-ipad-wificell/1.jpg');
INSERT INTO `hinhanh` VALUES (487, 60, 1, '/images/58-ipad-wificell/2.jpg');
INSERT INTO `hinhanh` VALUES (488, 60, 1, '/images/58-ipad-wificell/3.jpg');
INSERT INTO `hinhanh` VALUES (489, 60, 1, '/images/58-ipad-wificell/4.jpg');
INSERT INTO `hinhanh` VALUES (490, 60, 1, '/images/58-ipad-wificell/5.jpg');
INSERT INTO `hinhanh` VALUES (491, 60, 2, '/images/58-ipad-wificell/6.jpg');
INSERT INTO `hinhanh` VALUES (492, 60, 2, '/images/58-ipad-wificell/7.jpg');
INSERT INTO `hinhanh` VALUES (493, 60, 2, '/images/58-ipad-wificell/8.jpg');
INSERT INTO `hinhanh` VALUES (494, 60, 2, '/images/58-ipad-wificell/9.jpg');
INSERT INTO `hinhanh` VALUES (495, 60, 2, '/images/58-ipad-wificell/10.jpg');
INSERT INTO `hinhanh` VALUES (496, 59, 0, '/images/59-ipad-mini/main.png');
INSERT INTO `hinhanh` VALUES (497, 59, 1, '/images/59-ipad-mini/1.jpg');
INSERT INTO `hinhanh` VALUES (498, 59, 1, '/images/59-ipad-mini/2.jpg');
INSERT INTO `hinhanh` VALUES (499, 59, 1, '/images/59-ipad-mini/3.jpg');
INSERT INTO `hinhanh` VALUES (500, 59, 1, '/images/59-ipad-mini/4.jpg');
INSERT INTO `hinhanh` VALUES (501, 59, 1, '/images/59-ipad-mini/5.jpg');
INSERT INTO `hinhanh` VALUES (502, 59, 2, '/images/59-ipad-mini/6.jpg');
INSERT INTO `hinhanh` VALUES (503, 59, 2, '/images/59-ipad-mini/7.jpg');
INSERT INTO `hinhanh` VALUES (504, 59, 2, '/images/59-ipad-mini/8.jpg');
INSERT INTO `hinhanh` VALUES (505, 59, 2, '/images/59-ipad-mini/9.jpg');
INSERT INTO `hinhanh` VALUES (506, 59, 2, '/images/59-ipad-mini/10.jpg');
INSERT INTO `hinhanh` VALUES (507, 61, 0, '/images/61-ss-tab-a6/main.png');
INSERT INTO `hinhanh` VALUES (508, 61, 1, '/images/61-ss-tab-a6/1.jpg');
INSERT INTO `hinhanh` VALUES (509, 61, 1, '/images/61-ss-tab-a6/2.jpg');
INSERT INTO `hinhanh` VALUES (510, 61, 1, '/images/61-ss-tab-a6/3.jpg');
INSERT INTO `hinhanh` VALUES (511, 61, 1, '/images/61-ss-tab-a6/4.jpg');
INSERT INTO `hinhanh` VALUES (512, 61, 1, '/images/61-ss-tab-a6/5.jpg');
INSERT INTO `hinhanh` VALUES (513, 61, 2, '/images/61-ss-tab-a6/6.jpg');
INSERT INTO `hinhanh` VALUES (514, 61, 2, '/images/61-ss-tab-a6/7.jpg');
INSERT INTO `hinhanh` VALUES (515, 61, 2, '/images/61-ss-tab-a6/8.jpg');
INSERT INTO `hinhanh` VALUES (516, 61, 2, '/images/61-ss-tab-a6/9.jpg');
INSERT INTO `hinhanh` VALUES (517, 61, 2, '/images/61-ss-tab-a6/10.jpg');
INSERT INTO `hinhanh` VALUES (518, 62, 0, '/images/62-ss-tab-a8/main.png');
INSERT INTO `hinhanh` VALUES (519, 62, 1, '/images/62-ss-tab-a8/1.jpg');
INSERT INTO `hinhanh` VALUES (520, 62, 1, '/images/62-ss-tab-a8/2.jpg');
INSERT INTO `hinhanh` VALUES (521, 62, 1, '/images/62-ss-tab-a8/3.jpg');
INSERT INTO `hinhanh` VALUES (522, 62, 1, '/images/62-ss-tab-a8/4.jpg');
INSERT INTO `hinhanh` VALUES (523, 62, 1, '/images/62-ss-tab-a8/5.jpg');
INSERT INTO `hinhanh` VALUES (524, 62, 2, '/images/62-ss-tab-a8/6.jpg');
INSERT INTO `hinhanh` VALUES (525, 62, 2, '/images/62-ss-tab-a8/7.jpg');
INSERT INTO `hinhanh` VALUES (526, 62, 2, '/images/62-ss-tab-a8/8.jpg');
INSERT INTO `hinhanh` VALUES (527, 62, 2, '/images/62-ss-tab-a8/9.jpg');
INSERT INTO `hinhanh` VALUES (528, 62, 2, '/images/62-ss-tab-a8/10.jpg');
INSERT INTO `hinhanh` VALUES (529, 63, 0, '/images/63-ss-tab-e/main.png');
INSERT INTO `hinhanh` VALUES (530, 63, 1, '/images/63-ss-tab-e/1.jpg');
INSERT INTO `hinhanh` VALUES (531, 63, 1, '/images/63-ss-tab-e/2.jpg');
INSERT INTO `hinhanh` VALUES (532, 63, 1, '/images/63-ss-tab-e/3.jpg');
INSERT INTO `hinhanh` VALUES (533, 63, 1, '/images/63-ss-tab-e/4.jpg');
INSERT INTO `hinhanh` VALUES (534, 63, 1, '/images/63-ss-tab-e/5.jpg');
INSERT INTO `hinhanh` VALUES (535, 63, 2, '/images/63-ss-tab-e/6.jpg');
INSERT INTO `hinhanh` VALUES (536, 63, 2, '/images/63-ss-tab-e/7.jpg');
INSERT INTO `hinhanh` VALUES (537, 63, 2, '/images/63-ss-tab-e/8.jpg');
INSERT INTO `hinhanh` VALUES (538, 63, 2, '/images/63-ss-tab-e/9.jpg');
INSERT INTO `hinhanh` VALUES (539, 63, 2, '/images/63-ss-tab-e/10.jpg');
INSERT INTO `hinhanh` VALUES (540, 64, 0, '/images/64-ss-tab-a67/main.png');
INSERT INTO `hinhanh` VALUES (541, 64, 1, '/images/63-ss-tab-e/1.jpg');
INSERT INTO `hinhanh` VALUES (542, 64, 1, '/images/63-ss-tab-e/2.jpg');
INSERT INTO `hinhanh` VALUES (543, 64, 1, '/images/63-ss-tab-e/3.jpg');
INSERT INTO `hinhanh` VALUES (544, 64, 1, '/images/63-ss-tab-e/4.jpg');
INSERT INTO `hinhanh` VALUES (545, 64, 1, '/images/63-ss-tab-e/5.jpg');
INSERT INTO `hinhanh` VALUES (546, 64, 2, '/images/63-ss-tab-e/6.jpg');
INSERT INTO `hinhanh` VALUES (547, 64, 2, '/images/63-ss-tab-e/7.jpg');
INSERT INTO `hinhanh` VALUES (548, 64, 2, '/images/63-ss-tab-e/8.jpg');
INSERT INTO `hinhanh` VALUES (549, 64, 2, '/images/63-ss-tab-e/9.jpg');
INSERT INTO `hinhanh` VALUES (550, 64, 2, '/images/63-ss-tab-e/10.jpg');
INSERT INTO `hinhanh` VALUES (551, 20, 0, '/images/20-htc-uplay/main.png');
INSERT INTO `hinhanh` VALUES (552, 20, 1, '/images/20-htc-uplay/1.jpg');
INSERT INTO `hinhanh` VALUES (553, 20, 1, '/images/20-htc-uplay/2.jpg');
INSERT INTO `hinhanh` VALUES (554, 20, 1, '/images/20-htc-uplay/3.jpg');
INSERT INTO `hinhanh` VALUES (555, 20, 1, '/images/20-htc-uplay/4.jpg');
INSERT INTO `hinhanh` VALUES (556, 20, 1, '/images/20-htc-uplay/5.jpg');
INSERT INTO `hinhanh` VALUES (557, 20, 2, '/images/20-htc-uplay/6.jpg');
INSERT INTO `hinhanh` VALUES (558, 20, 2, '/images/20-htc-uplay/7.jpg');
INSERT INTO `hinhanh` VALUES (559, 20, 2, '/images/20-htc-uplay/8.jpg');
INSERT INTO `hinhanh` VALUES (560, 20, 2, '/images/20-htc-uplay/9.jpg');
INSERT INTO `hinhanh` VALUES (561, 20, 2, '/images/20-htc-uplay/10.jpg');
INSERT INTO `hinhanh` VALUES (562, 65, 0, '/images/65-hw-m3/main.png');
INSERT INTO `hinhanh` VALUES (563, 65, 1, '/images/65-hw-m3/1.jpg');
INSERT INTO `hinhanh` VALUES (564, 65, 1, '/images/65-hw-m3/2.jpg');
INSERT INTO `hinhanh` VALUES (565, 65, 1, '/images/65-hw-m3/3.jpg');
INSERT INTO `hinhanh` VALUES (566, 65, 1, '/images/65-hw-m3/4.jpg');
INSERT INTO `hinhanh` VALUES (567, 65, 1, '/images/65-hw-m3/5.jpg');
INSERT INTO `hinhanh` VALUES (568, 65, 2, '/images/65-hw-m3/6.jpg');
INSERT INTO `hinhanh` VALUES (569, 65, 2, '/images/65-hw-m3/7.jpg');
INSERT INTO `hinhanh` VALUES (570, 65, 2, '/images/65-hw-m3/8.jpg');
INSERT INTO `hinhanh` VALUES (571, 65, 2, '/images/65-hw-m3/9.jpg');
INSERT INTO `hinhanh` VALUES (572, 65, 2, '/images/65-hw-m3/10.jpg');
INSERT INTO `hinhanh` VALUES (573, 66, 0, '/images/66-hw-t3-10/main.png');
INSERT INTO `hinhanh` VALUES (574, 66, 1, '/images/66-hw-t3-10/1.jpg');
INSERT INTO `hinhanh` VALUES (575, 66, 1, '/images/66-hw-t3-10/2.jpg');
INSERT INTO `hinhanh` VALUES (576, 66, 1, '/images/66-hw-t3-10/3.jpg');
INSERT INTO `hinhanh` VALUES (577, 66, 1, '/images/66-hw-t3-10/4.jpg');
INSERT INTO `hinhanh` VALUES (578, 66, 1, '/images/66-hw-t3-10/5.jpg');
INSERT INTO `hinhanh` VALUES (579, 66, 2, '/images/66-hw-t3-10/6.jpg');
INSERT INTO `hinhanh` VALUES (580, 66, 2, '/images/66-hw-t3-10/7.jpg');
INSERT INTO `hinhanh` VALUES (581, 66, 2, '/images/66-hw-t3-10/8.jpg');
INSERT INTO `hinhanh` VALUES (582, 66, 2, '/images/66-hw-t3-10/9.jpg');
INSERT INTO `hinhanh` VALUES (583, 66, 2, '/images/66-hw-t3-10/10.jpg');
INSERT INTO `hinhanh` VALUES (584, 67, 0, '/images/67-hw-t3-7/main.png');
INSERT INTO `hinhanh` VALUES (585, 67, 1, '/images/67-hw-t3-7/1.jpg');
INSERT INTO `hinhanh` VALUES (586, 67, 1, '/images/67-hw-t3-7/2.jpg');
INSERT INTO `hinhanh` VALUES (587, 67, 1, '/images/67-hw-t3-7/3.jpg');
INSERT INTO `hinhanh` VALUES (588, 67, 1, '/images/67-hw-t3-7/4.jpg');
INSERT INTO `hinhanh` VALUES (589, 67, 1, '/images/67-hw-t3-7/5.jpg');
INSERT INTO `hinhanh` VALUES (590, 67, 2, '/images/67-hw-t3-7/6.jpg');
INSERT INTO `hinhanh` VALUES (591, 67, 2, '/images/67-hw-t3-7/7.jpg');
INSERT INTO `hinhanh` VALUES (592, 67, 2, '/images/67-hw-t3-7/8.jpg');
INSERT INTO `hinhanh` VALUES (593, 67, 2, '/images/67-hw-t3-7/9.jpg');
INSERT INTO `hinhanh` VALUES (594, 67, 2, '/images/67-hw-t3-7/10.jpg');
INSERT INTO `hinhanh` VALUES (595, 68, 0, '/images/68-hw-t1/main.png');
INSERT INTO `hinhanh` VALUES (596, 68, 1, '/images/67-hw-t3-7/1.jpg');
INSERT INTO `hinhanh` VALUES (597, 68, 1, '/images/67-hw-t3-7/2.jpg');
INSERT INTO `hinhanh` VALUES (598, 68, 1, '/images/67-hw-t3-7/3.jpg');
INSERT INTO `hinhanh` VALUES (599, 68, 1, '/images/67-hw-t3-7/4.jpg');
INSERT INTO `hinhanh` VALUES (600, 68, 1, '/images/67-hw-t3-7/5.jpg');
INSERT INTO `hinhanh` VALUES (601, 68, 2, '/images/67-hw-t3-7/6.jpg');
INSERT INTO `hinhanh` VALUES (602, 68, 2, '/images/67-hw-t3-7/7.jpg');
INSERT INTO `hinhanh` VALUES (603, 68, 2, '/images/67-hw-t3-7/8.jpg');
INSERT INTO `hinhanh` VALUES (604, 68, 2, '/images/67-hw-t3-7/9.jpg');
INSERT INTO `hinhanh` VALUES (605, 68, 2, '/images/67-hw-t3-7/10.jpg');
INSERT INTO `hinhanh` VALUES (606, 69, 0, '/images/69-lnv-2/main.png');
INSERT INTO `hinhanh` VALUES (607, 69, 1, '/images/69-lnv-2/1.jpg');
INSERT INTO `hinhanh` VALUES (608, 69, 1, '/images/69-lnv-2/2.jpg');
INSERT INTO `hinhanh` VALUES (609, 69, 1, '/images/69-lnv-2/3.jpg');
INSERT INTO `hinhanh` VALUES (610, 69, 1, '/images/69-lnv-2/4.jpg');
INSERT INTO `hinhanh` VALUES (611, 69, 1, '/images/69-lnv-2/5.jpg');
INSERT INTO `hinhanh` VALUES (612, 69, 2, '/images/69-lnv-2/6.jpg');
INSERT INTO `hinhanh` VALUES (613, 69, 2, '/images/69-lnv-2/7.jpg');
INSERT INTO `hinhanh` VALUES (614, 69, 2, '/images/69-lnv-2/8.jpg');
INSERT INTO `hinhanh` VALUES (615, 69, 2, '/images/69-lnv-2/9.jpg');
INSERT INTO `hinhanh` VALUES (616, 69, 2, '/images/69-lnv-2/10.jpg');
INSERT INTO `hinhanh` VALUES (617, 70, 0, '/images/70-lnv-4/main.png');
INSERT INTO `hinhanh` VALUES (618, 70, 1, '/images/69-lnv-2/1.jpg');
INSERT INTO `hinhanh` VALUES (619, 70, 1, '/images/69-lnv-2/2.jpg');
INSERT INTO `hinhanh` VALUES (620, 70, 1, '/images/69-lnv-2/3.jpg');
INSERT INTO `hinhanh` VALUES (621, 70, 1, '/images/69-lnv-2/4.jpg');
INSERT INTO `hinhanh` VALUES (622, 70, 1, '/images/69-lnv-2/5.jpg');
INSERT INTO `hinhanh` VALUES (623, 70, 2, '/images/69-lnv-2/6.jpg');
INSERT INTO `hinhanh` VALUES (624, 70, 2, '/images/69-lnv-2/7.jpg');
INSERT INTO `hinhanh` VALUES (625, 70, 2, '/images/69-lnv-2/8.jpg');
INSERT INTO `hinhanh` VALUES (626, 70, 2, '/images/69-lnv-2/9.jpg');
INSERT INTO `hinhanh` VALUES (627, 70, 2, '/images/69-lnv-2/10.jpg');
INSERT INTO `hinhanh` VALUES (628, 71, 0, '/images/71-lnv-7/main.png');
INSERT INTO `hinhanh` VALUES (629, 71, 1, '/images/71-lnv-7/1.jpg');
INSERT INTO `hinhanh` VALUES (630, 71, 1, '/images/71-lnv-7/2.jpg');
INSERT INTO `hinhanh` VALUES (631, 71, 1, '/images/71-lnv-7/3.jpg');
INSERT INTO `hinhanh` VALUES (632, 71, 1, '/images/71-lnv-7/4.jpg');
INSERT INTO `hinhanh` VALUES (633, 71, 1, '/images/71-lnv-7/5.jpg');
INSERT INTO `hinhanh` VALUES (634, 71, 2, '/images/71-lnv-7/6.jpg');
INSERT INTO `hinhanh` VALUES (635, 71, 2, '/images/71-lnv-7/7.jpg');
INSERT INTO `hinhanh` VALUES (636, 71, 2, '/images/71-lnv-7/8.jpg');
INSERT INTO `hinhanh` VALUES (637, 71, 2, '/images/71-lnv-7/9.jpg');
INSERT INTO `hinhanh` VALUES (638, 71, 2, '/images/71-lnv-7/10.jpg');
INSERT INTO `hinhanh` VALUES (639, 72, 0, '/images/72-lnv-3/main.png');
INSERT INTO `hinhanh` VALUES (640, 72, 1, '/images/71-lnv-7/1.jpg');
INSERT INTO `hinhanh` VALUES (641, 72, 1, '/images/71-lnv-7/2.jpg');
INSERT INTO `hinhanh` VALUES (642, 72, 1, '/images/71-lnv-7/3.jpg');
INSERT INTO `hinhanh` VALUES (643, 72, 1, '/images/71-lnv-7/4.jpg');
INSERT INTO `hinhanh` VALUES (644, 72, 1, '/images/71-lnv-7/5.jpg');
INSERT INTO `hinhanh` VALUES (645, 72, 2, '/images/71-lnv-7/6.jpg');
INSERT INTO `hinhanh` VALUES (646, 72, 2, '/images/71-lnv-7/7.jpg');
INSERT INTO `hinhanh` VALUES (647, 72, 2, '/images/71-lnv-7/8.jpg');
INSERT INTO `hinhanh` VALUES (648, 72, 2, '/images/71-lnv-7/9.jpg');
INSERT INTO `hinhanh` VALUES (649, 72, 2, '/images/71-lnv-7/10.jpg');

-- ----------------------------
-- Table structure for loaisanpham
-- ----------------------------
DROP TABLE IF EXISTS `loaisanpham`;
CREATE TABLE `loaisanpham`  (
  `idLoaiSanPham` int(11) NOT NULL AUTO_INCREMENT,
  `tenLoaiSanPham` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `alias` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`idLoaiSanPham`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of loaisanpham
-- ----------------------------
INSERT INTO `loaisanpham` VALUES (1, 'Điện thoại', 'dien-thoai');
INSERT INTO `loaisanpham` VALUES (2, 'Máy tính bảng', 'may-tinh-bang');

-- ----------------------------
-- Table structure for nguoidung
-- ----------------------------
DROP TABLE IF EXISTS `nguoidung`;
CREATE TABLE `nguoidung`  (
  `idNguoiDung` int(11) NOT NULL AUTO_INCREMENT,
  `tenNguoiDung` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gioiTinh` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sdt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ngaySinh` date NULL DEFAULT NULL,
  `diaChi` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `matKhau` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `f_Permission` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idNguoiDung`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nguoidung
-- ----------------------------
INSERT INTO `nguoidung` VALUES (1, 'Nguyễn Trần An', 'Nam', '0984555785', '1994-06-15', '28 Tân Định, Định An, Đồng Nai', 'tranan488@gmail.com', NULL, NULL);
INSERT INTO `nguoidung` VALUES (2, 'Hoàng Thùy Trâm', 'Nữ', '01255896553', '1996-02-08', '126 Nghi Lâm, Tân Hòa, Tân Phú, TP HCM', 'thuytram@gmail.com', NULL, NULL);
INSERT INTO `nguoidung` VALUES (3, 'Nguyễn Trung Mạnh', 'Nam', '09563324478', '1995-12-27', '85 hai bà Trưng, Đông Khánh, Cầu Giấy, Hà Nội', 'trungmanh@gmail.com', NULL, NULL);
INSERT INTO `nguoidung` VALUES (4, 'nguyen thanh hau', 'Nam', '098375757', '1995-02-01', NULL, 'thegreenglobe.zzz@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0);

-- ----------------------------
-- Table structure for nhasanxuat
-- ----------------------------
DROP TABLE IF EXISTS `nhasanxuat`;
CREATE TABLE `nhasanxuat`  (
  `idNhaSanXuat` int(11) NOT NULL AUTO_INCREMENT,
  `tenNhaSanXuat` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `quocGia` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `alias` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`idNhaSanXuat`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nhasanxuat
-- ----------------------------
INSERT INTO `nhasanxuat` VALUES (1, 'SamSung', 'Hàn Quốc', 'samsung');
INSERT INTO `nhasanxuat` VALUES (2, 'Apple', 'Mỹ', 'apple');
INSERT INTO `nhasanxuat` VALUES (3, 'Sony', 'Nhật Bản', 'sony');
INSERT INTO `nhasanxuat` VALUES (4, 'HTC', 'Đài Loan', 'htc');
INSERT INTO `nhasanxuat` VALUES (5, 'OPPO', 'Trung Quốc', 'oppo');
INSERT INTO `nhasanxuat` VALUES (6, 'Huawei', 'Trung Quốc', 'huawei');
INSERT INTO `nhasanxuat` VALUES (7, 'Lenovo', 'Trung Quốc', 'lenovo');
INSERT INTO `nhasanxuat` VALUES (8, 'Nokia', 'Phần Lan', 'nokia');

-- ----------------------------
-- Table structure for sanpham
-- ----------------------------
DROP TABLE IF EXISTS `sanpham`;
CREATE TABLE `sanpham`  (
  `idSanPham` int(11) NOT NULL AUTO_INCREMENT,
  `tenSanPham` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gia` int(11) NULL DEFAULT 0,
  `giaGiam` int(11) NULL DEFAULT 0,
  `soLuongTon` int(11) NULL DEFAULT 0,
  `soLuongBan` int(11) NULL DEFAULT 0,
  `soLuotXem` int(11) NULL DEFAULT 0,
  `ngayNhapHang` date NULL DEFAULT NULL,
  `danhGia` float NULL DEFAULT 0,
  `moTa` varchar(10000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `idNhaSanXuat` int(11) NULL DEFAULT NULL,
  `idLoaiSanPham` int(11) NULL DEFAULT NULL,
  `idThongSoKyThuat` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idSanPham`) USING BTREE,
  INDEX `fk_NSX_idx`(`idNhaSanXuat`) USING BTREE,
  INDEX `fk_LoaiSP_idx`(`idLoaiSanPham`) USING BTREE,
  INDEX `fk_ThongSoKT_idx`(`idThongSoKyThuat`) USING BTREE,
  CONSTRAINT `fk_LoaiSP` FOREIGN KEY (`idLoaiSanPham`) REFERENCES `loaisanpham` (`idloaisanpham`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_NSX` FOREIGN KEY (`idNhaSanXuat`) REFERENCES `nhasanxuat` (`idnhasanxuat`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_ThongSoKT` FOREIGN KEY (`idThongSoKyThuat`) REFERENCES `thongsokythuat` (`idthongsokythuat`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sanpham
-- ----------------------------
INSERT INTO `sanpham` VALUES (1, 'IPhone X', 34790000, 0, 120, 355, 1145, '2018-06-01', 0, 'iPhone X được Apple ra mắt ngày 12/9 vừa rồi đánh dấu chặng đường 10 năm lần đầu tiên iPhone ra đời. Sau một thời gian, giá iPhone X cũng được công bố. iPhone X mang trên mình thiết kế hoàn toàn mới với màn hình Super Retina viền cực mỏng và trang bị nhiều công nghệ hiện đại như nhận diện khuôn mặt Face ID, sạc pin nhanh và sạc không dây cùng khả năng chống nước bụi cao cấp.', 2, 1, 1);
INSERT INTO `sanpham` VALUES (2, 'iPhone 8 Plus Red 256GB (Đỏ)', 28490000, 0, 225, 560, 2144, '2018-01-26', 0, 'iPhone 8 Plus đỏ bản 256GB là bản nâng cấp nhẹ của chiếc iPhone 7 Plus đỏ đã ra mắt trước đó với cấu hình mạnh mẽ cùng camera có nhiều cải tiến cũng như màu sắc nổi bật, cá tính.Thiết kế quen thuộc Về ngoại hình iPhone 8 Plus không có quá nhiều khác biệt so với người đàn anh đi trước', 2, 1, 3);
INSERT INTO `sanpham` VALUES (3, 'iPhone 7 Plus 32GB', 19990000, 0, 250, 452, 1855, '2018-05-01', 0, 'Với thiết kế không quá nhiều thay đổi, vẫn bảo tồn vẻ đẹp truyền thống từ thời iPhone 6 Plus,  iPhone 7 Plus 32GB được trang bị nhiều nâng cấp đáng giá như camera kép, đạt chuẩn chống nước chống bụi cùng cấu hình cực mạnh.', 2, 1, 4);
INSERT INTO `sanpham` VALUES (4, 'iPhone 6s Plus 32GB', 12890000, 0, 158, 396, 2022, '2018-04-13', 0, 'iPhone 6s Plus 32 GB là phiên bản nâng cấp hoàn hảo từ iPhone 6 Plus với nhiều tính năng mới hấp dẫn.iPhone 6s Plus 32 GB được nâng cấp độ phân giải camera sau lên 12 MP (thay vì 8 MP như trên iPhone 6 Plus), camera cho tốc độ lấy nét và chụp nhanh, thao tác chạm để chụp nhẹ nhàng. Chất lượng ảnh trong các điều kiện chụp khác nhau tốt.', 2, 1, 5);
INSERT INTO `sanpham` VALUES (5, 'Samsung Galaxy S9+ 128GB', 24490000, 0, 362, 156, 1208, '2018-05-16', 0, 'Samsung Galaxy S9 Plus 128GB Hoàng Kim, siêu phẩm smartphone hàng đầu trong thế giới Android đã ra mắt với màn hình vô cực, camera chuyên nghiệp như máy ảnh và hàng loạt những tính năng cao cấp đầy hấp dẫn.', 1, 1, 10);
INSERT INTO `sanpham` VALUES (6, 'SamSung Galaxy Note 8', 22490000, 0, 58, 566, 3569, '2018-05-20', 0, 'Galaxy Note 8 là niềm hy vọng vực lại dòng Note danh tiếng của Samsung với diện mạo nam tính, sang trọng. Trang bị camera kép xóa phông thời thượng, màn hình vô cực như trên S8 Plus, bút Spen với nhiều tính năng mới và nhiều công nghệ được Samsung ưu ái đem lên Note 8', 1, 1, 11);
INSERT INTO `sanpham` VALUES (7, 'Samsung Galaxy S9', 19990000, 0, 89, 245, 989, '2018-05-12', 0, 'Siêu phẩm Samsung Galaxy S9 chính thức ra mắt mang theo hàng loạt cải tiến, tính năng cao cấp như camera thay đổi khẩu độ, quay phim siêu chậm 960 fps, AR Emoji... nhanh chóng gây sốt làng công nghệ.', 1, 1, 12);
INSERT INTO `sanpham` VALUES (8, 'Samsung Galaxy S8 Plus', 17890000, 0, 214, 452, 5201, '2018-03-25', 0, 'Galaxy S8 và S8 Plus hiện đang là chuẩn mực smartphone về thiết kế trong tương lai. Sau nhiều ngày được sử dụng, mình xin chia sẻ những cảm nhận chi tiết nhất về chiếc Galaxy S8 Plus - thiết bị đang có doanh số đặt hàng khủng nhất hiện tại.', 1, 1, 13);
INSERT INTO `sanpham` VALUES (9, 'Samsung Galaxy S8', 15990000, 0, 158, 289, 2856, '2018-04-09', 0, 'Galaxy S8 là siêu phẩm mới nhất được Samsung ra mắt vào ngày 29/3 với thiết kế nhỏ gọn hoàn toàn mới, màn hình vô cực viền siêu mỏng', 1, 1, 14);
INSERT INTO `sanpham` VALUES (10, 'Samsung Galaxy A8+', 13490000, 0, 250, 147, 789, '2018-03-10', 0, 'Samsung Galaxy A8+ (2018) là phiên bản lớn hơn của chiếc Samsung Galaxy A8 (2018) phù hợp với những bạn yêu thích một thiết bị có màn hình lớn và thời lượng pin bền bỉ', 1, 1, 15);
INSERT INTO `sanpham` VALUES (11, 'Samsung Galaxy J7 Pro', 7890000, 0, 302, 240, 1785, '2018-05-07', 0, 'Nếu bạn cần một chiếc điện thoại chơi game hay lướt web nhanh chóng, thiết kế đẹp và chắc chắn mà không phải lo lắng về pin hay mức giá, cũng như yên tâm về thương hiệu thì Samsung Galaxy J7 Pro chính là sự lựa chọn tốt nhất.', 1, 1, 16);
INSERT INTO `sanpham` VALUES (12, 'Samsung Galaxy A6+', 8990000, 0, 157, 360, 3478, '2018-04-30', 0, 'Sau nhiều đồn đoán thì cuối cùng Samsung Galaxy A6+ (2018) đã chính thức được Samsung giới thiệu với một chút đổi mới trong thiết kế cũng như về camera của máy.', 1, 1, 17);
INSERT INTO `sanpham` VALUES (13, 'Samsung Galaxy C9 Pro', 8490000, 0, 360, 188, 478, '2018-05-08', 0, 'Samsung Galaxy C9 Pro gây được sự chú ý cho người dùng bởi nó sở hữu mức RAM lên tới 6 GB, lần đầu tiên có một chiếc Galaxy đến từ Samsung sở hữu mức RAM đó.', 1, 1, 18);
INSERT INTO `sanpham` VALUES (14, 'Samsung Galaxy J6', 5290000, 0, 263, 220, 1589, '2018-03-19', 0, 'Trong phân khúc smartphone tầm trung, Samsung Galaxy J6 là cái tên tiếp theo được nhắc đến với một thiết kế đẹp, hiệu năng tốt và có màn hình 18.5:9 thời thượng.', 1, 1, 19);
INSERT INTO `sanpham` VALUES (15, 'Samsung Galaxy A8 Star', 13990000, 0, 350, 145, 4025, '2018-06-02', 0, 'Samsung Galaxy A8 Star là một biến thể mới của dòng A trong gia đình Samsung với sự nâng cấp vượt trội về camera cũng như có một chút thay đổi trong thiết kế', 1, 1, 20);
INSERT INTO `sanpham` VALUES (16, 'Samsung Galaxy J3 Pro', 3990000, 0, 89, 250, 1544, '2018-03-03', 0, 'Samsung Galaxy J3 Pro là bản nâng cấp mạnh mẽ về cả ngoại hình và cấu hình so với chiếc Samsung Galaxy J3 tiền nhiệm, hứa hẹn sẽ đem đến cho người dùng một Smartphone xứng đáng với giá tiền bỏ ra', 1, 1, 21);
INSERT INTO `sanpham` VALUES (17, 'Samsung Galaxy J4', 3790000, 0, 105, 520, 789, '2018-02-20', 0, 'amsung Galaxy J4 là cái tên tiếp theo thuộc dòng J mà Samsung mới ra mắt với một số tính năng nổi bật nhằm cạnh tranh với các đối thủ trong phân khúc smartphone giá rẻ', 1, 1, 22);
INSERT INTO `sanpham` VALUES (18, 'HTC U Ultra', 8990000, 0, 452, 201, 2560, '2018-03-18', 0, 'HTC U Ultra đánh dấu sự trở lại của HTC với triết lý thiết kế mới, đẹp hơn - sang trọng - bóng bẩy hơn và đặc biệt gắn bó với người dùng hơn thông qua trợ lý ảo HTC Sense Companion', 4, 1, 23);
INSERT INTO `sanpham` VALUES (19, 'HTC 10 evo', 3990000, 0, 269, 458, 1478, '2018-05-19', 0, 'TC 10 evo mang lại cho bạn trải nghiệm về thiết kế, những trang bị cao cấp của một chiếc flagship đến từ HTC nhưng với mức giá chưa tới một nửa.', 4, 1, 24);
INSERT INTO `sanpham` VALUES (20, 'HTC U Play', 3790000, 0, 56, 745, 3560, '2018-06-17', 0, 'HTC U Play đánh dấu sự trở lại của HTC ở phân khúc tầm trung với triết lý thiết kế mới: đẹp hơn - sang trọng hơn - bóng bẩy hơn, ngoài ra trải nghiệm người dùng được nâng cấp thông qua trợ lý ảo HTC Sense Companion', 4, 1, 25);
INSERT INTO `sanpham` VALUES (21, 'HTC U11', 11890000, 0, 269, 459, 5214, '2018-05-01', 0, 'HTC U11 là smartphone cao cấp nhất của HTC trong năm 2017 với nhiều nâng cấp tập trung vào trải nghiệm người dùng thú vị so với model tiền nhiệm', 4, 1, 26);
INSERT INTO `sanpham` VALUES (22, 'HTC Desire 12+', 4590000, 0, 39, 278, 885, '2018-02-11', 0, 'HTC Desire 12+ là phiên bản lớn hơn của chiếc HTC Desire 12 với cải tiến về màn hình cũng như camera kép chất lượng', 4, 1, 27);
INSERT INTO `sanpham` VALUES (23, 'HTC One M9', 5590000, 0, 109, 452, 1895, '2018-03-27', 0, 'Tại MWC 2015 diễn ra tại barcelona, HTC tiếp tục trình bày sản phẩm tiếp theo thuộc dòng ONE của hãng: HTC One M9, sản phẩm được kỳ vọng mang lại nhiều thay đổi cho HTC. M9 được trang bị màn hình Full HD 5 inch, bộ vi xử lý Snapdragon 810, GPU Adreno 430, RAM 3GB, hệ điều hành Android 5.0, camera sau 20.7MP, camera trước 4 Ultra Pixel.', 4, 1, 28);
INSERT INTO `sanpham` VALUES (24, 'Sony Xperia XZ2', 19990000, 0, 500, 354, 1698, '2018-05-28', 0, 'Xperia XZ2 là chiếc flagship mới được Sony giới thiệu tại MWC 2018 với sự thay đổi lớn về thiết kế so với những người tiền nhiệm.', 3, 1, 29);
INSERT INTO `sanpham` VALUES (25, 'Sony Xperia XZ1', 10890000, 0, 236, 450, 2782, '2018-04-12', 0, 'Sony Xperia XZ1 là mẫu flagship kế tiếp của Sony tiếp nối sự thành công của chiếc Xperia XZs đã ra mắt trước đó với những nâng cấp nhẹ về mặt cấu hình và thiết kế', 3, 1, 30);
INSERT INTO `sanpham` VALUES (26, 'Sony Xperia XZ Dual', 9990000, 0, 123, 400, 3452, '2018-03-11', 0, 'Sony Xperia XZ với thiết kế cực đẹp, cùng camera chất lượng hơn, nhiều tính năng tiện ích hơn. Cải tiến hơn so với thiết kế truyền thống của dòng Xperia, Sony Xperia XZ mang trên mình diện mạo mới - đẹp hơn, sang trọng hơn', 3, 1, 31);
INSERT INTO `sanpham` VALUES (27, 'Sony Xperia XA1 Ultra', 6490000, 0, 205, 310, 2478, '2018-04-03', 0, 'Kế nhiệm sự thành công của phablet không viền Sony Xperia XA Ultra thì Sony giới thiệu phiên bản XA1 Ultra với nhiều cải tiến đáng giá. Sony XA1 Ultra vẫn sở hữu cho mình phong cách thiết kế edge-to-edge với viền bezel siêu mỏng và \"sexy\"', 3, 1, 32);
INSERT INTO `sanpham` VALUES (28, 'Sony Xperia X', 4990000, 0, 500, 125, 478, '2018-05-28', 0, 'Sony vừa giới thiệu dòng sản phẩm X Serie mới của hãng trong năm 2016 tại triển lãm MWC. Xperia X là chiếc smartphone tầm trung mới với nhiều điểm nhấn đáng chú ý.', 3, 1, 33);
INSERT INTO `sanpham` VALUES (29, 'Sony Xperia L2', 3590000, 0, 89, 423, 2568, '2018-02-16', 0, 'Sony Xperia L1 với mức giá phù hợp với nhiều người dùng cùng thiết kế đẹp mắt không thua kém các sản phẩm cao cấp. Xperia L1 có khung vỏ bằng nhựa, các cạnh bo tròn trong khi cạnh trên và dưới phẳng. Nhìn chung thiết kế khá thanh mảnh và lịch lãm, mặt sau của máy được gia công toàn bộ bằng nhựa polycarbonate.', 3, 1, 34);
INSERT INTO `sanpham` VALUES (30, 'Sony Xperia L1', 4990000, 0, 123, 325, 1520, '2018-04-04', 0, 'Sony Xperia L2 là phiên bản nâng cấp của Xperia L1 với dung lượng pin cao, bộ nhớ trong lớn và bảo mật vân tay tiện dụng. Máy cho cảm giác cầm vuông vức và \"mập\" hơn chứ không thon dài như chiếc Xperia L1 trước đây.', 3, 1, 35);
INSERT INTO `sanpham` VALUES (31, 'Sony Xperia XA1', 3490000, 0, 200, 200, 1020, '2018-03-10', 0, 'Xperia XA1 là bản nâng cấp của chiếc Xperia XA đã khá thành công ở thị trường nước ta, với thiết kế khá tương đồng siêu phẩm Xperia XZ, cấu hình được trang bị cao hơn và camera có chất lượng tốt hơn.', 3, 1, 36);
INSERT INTO `sanpham` VALUES (45, 'Nokia 8', 12990000, 0, 356, 112, 895, '2018-06-01', 0, 'Nokia 8 là chiếc flagship cao cấp nhất của Nokia trong năm 2017 mới được giới thiệu vào giữa tháng 8 với thiết kế khá giống với Nokia 6, nhưng đã được trang bị thêm camera kép Carl Zeiss danh tiếng', 8, 1, 37);
INSERT INTO `sanpham` VALUES (46, 'Nokia 7 plus', 8900000, 0, 450, 235, 2785, '2018-05-24', 0, 'Nokia 7 Plus là chiếc smartphone đầu tiên đánh dấu bước đi đầu tiên của HMD vào thế giới màn hình tỉ lệ 18:9. Nokia 7 Plus mang trong mình thiết kế mới mẻ nhưng vẫn có những thứ rất quen thuộc với người dùng đã quen với thương hiệu Nokia', 8, 1, 38);
INSERT INTO `sanpham` VALUES (47, 'Nokia 6', 6990000, 0, 311, 98, 567, '2018-06-11', 0, 'Sau nhiều rò rỉ thì cuối cùng chiếc Nokia 6 bản 4/64GB (2018)  cũng đã chính thức ra mắt với một thiết kế sang trọng nhưng vẫn có gì đó đáng tiếc cho một chiếc smartphone ra mắt vào năm 2018', 8, 1, 39);
INSERT INTO `sanpham` VALUES (48, 'Nokia 5', 3590000, 0, 147, 366, 1785, '2018-03-09', 0, 'Nokia 5 là một điện thoại mới được trình làng đánh dấu sự trở lại ở sự kiện MWC 2017. Máy mang trong mình nhiều thay đổi cùng mức giá bán hấp dẫn. Máy có thiết kế nguyên khối với thân máy kim loại, các góc cạnh cùng phần mặt lưng được làm cong giúp bạn dễ cầm gọn trong tay. Các chi tiết trên máy được gia công tỉ mỉ và chắc chắn tạo sự cứng cáp cho thiết bị.', 8, 1, 40);
INSERT INTO `sanpham` VALUES (49, 'Nokia 3', 2790000, 0, 278, 278, 950, '2018-03-18', 0, 'Thương hiệu Nokia vẫn rất được người dùng tin tưởng và đón chờ, năm nay hãng cũng đã đánh dấu sự trở lại với 3 mẫu điện thoại, Nokia 3 là một trong số đó. Nokia 3 vẫn có một phần nào đó thiết kế của hãng Nokia. Với thân máy polycarbonate điêu khắc và chế tác tỉ mỉ, khung nhôm mang lại cảm giác chắc chắn, từng chi tiết được hoàn thiện rất tốt tối ưu rất tốt cho việc sử dụng của người dùng.', 8, 1, 41);
INSERT INTO `sanpham` VALUES (50, 'Nokia 2', 2190000, 0, 52, 362, 1102, '2018-03-29', 0, 'Nokia 2 là mẫu smartphone rẻ nhất của Nokia tại thời điểm hiện tại từ khi trở lại thị trường với dung lượng pin khủng, thiết kế kim loại chắc chắn và khả năng kháng nước.', 8, 1, 42);
INSERT INTO `sanpham` VALUES (51, 'OPPO F7 128GB', 9990000, 0, 230, 452, 2475, '2018-04-01', 0, 'Tiếp nối sự thành công của OPPO F5 thì OPPO tiếp tục giới thiệu OPPO F7 128GB với mức giá tương đương nhưng mang trong mình thiết kế hoàn toàn mới cũng nhiều cải tiến đáng giá.', 5, 1, 43);
INSERT INTO `sanpham` VALUES (52, 'OPPO F7', 7990000, 0, 210, 253, 1560, '2018-05-17', 0, 'Tiếp nối sự thành công của OPPO F5 thì OPPO tiếp tục tung ra OPPO F7 với điểm nhấn vẫn là camera selfie và thiết kế \"tai thỏ độc đáo\".', 5, 1, 44);
INSERT INTO `sanpham` VALUES (53, 'OPPO F5', 7490000, 0, 388, 122, 892, '2018-06-08', 0, 'OPPO F5 6GB là phiên bản nâng cấp cấu hình của chiếc OPPO F5, chuyên gia selfie làm đẹp thông minh và màn hình tràn viền tuyệt đẹp.', 5, 1, 45);
INSERT INTO `sanpham` VALUES (54, 'OPPO F3 Plus', 6490000, 0, 75, 588, 3489, '2018-02-20', 0, 'Sau sự thành công của OPPO F1 Plus, OPPO F3 Plus đang được người dùng quan tâm yêu thích với cụm camera selfie kép, công nghệ chụp thiếu sáng đỉnh cao, cấu hình mạnh mẽ và tất nhiên đó là thiết kế nguyên khối quá ư là sang trọng.', 5, 1, 46);
INSERT INTO `sanpham` VALUES (55, 'OPPO A83', 4990000, 0, 120, 125, 452, '2018-04-16', 0, 'OPPO A83 là chiếc smartphone dòng A đầu tiên sở hữu cho mình màn hình tràn viền và cùng với đó là camera với khả năng làm đẹp bằng AI nổi tiếng của OPPO.', 5, 1, 46);
INSERT INTO `sanpham` VALUES (56, 'iPad Pro 10.5 inch Wifi Cellular 64GB', 19990000, 0, 200, 652, 4589, '2018-05-14', 0, 'Apple vẫn giữ ngôn ngữ thiết kế từ xa xưa tới nay, nên phiên bản 10.5 inch cũng không có gì khác lắm với những người tiền nhiệm còn lại. Tuy không mới nhưng đây vẫn là một thiết kế vượt thời gian và rất sang trọng. iPad Pro mới có màn hình 10.5 inch True Tone HDR chất lượng cao với tần số quét 120Hz, viền siêu mỏng. Máy chỉ nặng 453 gram mang lại cảm giác cầm khi sử dụng rất thoải mái.', 2, 2, 47);
INSERT INTO `sanpham` VALUES (57, 'iPad Air 2 Cellular 128GB', 14590000, 0, 450, 520, 3360, '2018-05-05', 0, 'iPad Air 2 Cellular 128GB mang trong mình thiết kế sang trọng, bộ nhớ trong lớn cùng kết nối 3G/4G tiện lợi sẽ đáp ứng tốt cho bạn trong mọi nhu cầu sử dụng.', 2, 2, 48);
INSERT INTO `sanpham` VALUES (58, 'iPad Wifi Cellular', 14990000, 0, 210, 236, 1589, '2018-04-23', 0, 'Máy tính bảng iPad 6th Wifi Cellular 128 GB là phiên bản với bộ nhớ trong cực kỳ lớn, đáp ứng mọi nhu cầu lưu trữ và luôn mạnh mẽ trong mọi tác vụ.', 2, 2, 49);
INSERT INTO `sanpham` VALUES (59, 'iPad Mini 4 Wifi ', 9990000, 0, 189, 312, 2000, '2018-02-28', 0, 'iPad Mini 4 Wifi 128GB cho bạn thêm sự lựa chọn với bộ nhớ trong dung lượng lớn thoải mái cài đặt game và ứng dụng. Được gia công tỉ mỉ và thiết kế gọn gàng, iPad Mini 4 nổi bật nét sang chảnh với hợp kim nhôm mát tay, chắc chắn.', 2, 2, 50);
INSERT INTO `sanpham` VALUES (60, 'iPad Wifi 32GB ', 8890000, 0, 89, 412, 3785, '2018-02-15', 0, 'iPad 6th Wifi 32GB với nhiều nâng cấp về phần cứng, đặc biệt hơn giá của sản phẩm này được định hình ở phân khúc giá rẻ, sinh viên sẽ là sự lựa chọn “không quá xa tầm tay” người dùng.', 2, 2, 51);
INSERT INTO `sanpham` VALUES (61, 'Samsung Galaxy Tab A6 10.1 Spen', 7990000, 0, 210, 125, 589, '2018-04-16', 0, 'Tiếp nối sự thành công của chiếc Samsung Galaxy Tab A thì mới đây Samsung đã giới thiệu phiên bản cải tiến là chiếc Galaxy Tab A6 10.1 với nhiều nâng cấp đáng giá về cấu hình và thiết kế.', 1, 2, 52);
INSERT INTO `sanpham` VALUES (62, 'Samsung Galaxy Tab A 8.0', 5490000, 0, 89, 90, 785, '2018-06-22', 0, 'Samsung Galaxy Tab A 8.0 (2017) mới có màn hình tỉ lệ 4:3 với không gian hiển thị rộng thông minh cho người dùng. Với cách bố trí chiều ngang và dọc theo tỉ lệ 4:3 thông minh, những thông tin bạn đọc trên một trang web hay tài liệu được hiển thị nhiều và trọn vẹn trong một khung hình hơn.', 1, 2, 53);
INSERT INTO `sanpham` VALUES (63, 'Samsung Galaxy Tab E 9.6', 4490000, 0, 199, 256, 1205, '2018-03-18', 0, 'Samsung Galaxy Tab E 9.6 là một sự lựa chọn cho bạn thích một chiếc máy có màn hình lớn để giải trí thoải mái hơn nhưng cấu hình không quá thấp. Màn hình 9,6” rộng rãi khiến cho thân máy khá to, không thể cầm thoải mái với 1 tay khi sử dụng. Thân máy mỏng chỉ 8.5mm cá tính.', 1, 2, 54);
INSERT INTO `sanpham` VALUES (64, 'Samsung Galaxy Tab A6 7.0\"', 3490000, 0, 52, 100, 745, '2018-05-07', 0, 'Samsung Galaxy Tab A6 7.0 với thiết kế vẫn mang vẻ truyền thống và cấu hình tốt, khả năng hiển thị cải thiện, cùng kết nối 4G. Chiếc tablet này được thay đổi đôi chút so với người tiền nhiệm là Tab A 8.0 với cạnh viền được bo thêm 1 đường cong nhô lên, tạo điểm nhấn khác biệt.', 1, 2, 55);
INSERT INTO `sanpham` VALUES (65, 'Huawei MediaPad M3 8.0', 5990000, 0, 250, 114, 896, '2018-04-13', 0, 'Huawei MediaPad M3 8.0 là mẫu máy tính bảng chủ lực của Huawei trong năm 2017 với điểm nhấn là cấu hình mạnh mẽ cùng hệ thống âm thanh được đầu tư kỹ lưỡng. Huawei MediaPad M3 có một thiết kế khá đẹp, nguyên khối cứng cáp và cực kì chắc chắn.', 6, 2, 56);
INSERT INTO `sanpham` VALUES (66, 'Huawei MediaPad T3 10', 4490000, 0, 60, 320, 1520, '2018-02-15', 0, 'Huawei MediaPad T3 10 (2017) là chiếc máy tính bảng với màn hình kích thước lớn cùng khe cắm sim tiện lợi giúp người dùng có thể nghe gọi như một chiếc smartphone. Về tổng thể, máy nổi bật với phần khung viền kim loại sang trọng, kết hợp màu sắc hiện đại cho cảm giác khá thanh lịch, nhẹ nhàng.', 6, 2, 57);
INSERT INTO `sanpham` VALUES (67, 'Huawei MediaPad T3 8.0', 3990000, 0, 120, 145, 789, '2018-05-19', 0, 'Huawei MediaPad T3 8.0 là một chiếc máy tính bảng giá rẻ đến từ Huawei sở hữu rất nhiều ưu điểm đáng giá, nổi trội nhất là cấu hình rất tốt trong phân khúc. Huawei MediaPad T3 8.0 là một thiết bị hiếm hoi trong phân khúc máy tính bảng giá 4 triệu sở hữu cho mình thiết kế khung viền kim loại chắc chắn và đẹp mắt', 6, 2, 58);
INSERT INTO `sanpham` VALUES (68, 'Huawei MediaPad T1 8.0', 2990000, 0, 50, 85, 654, '2018-05-29', 0, 'Huawei MediaPad T1 8.0 mang lại không gian giải trí với màn hình lớn, cấu hình khá ổn trong tầm giá. Với màn hình to 8 inch, không gian được mở rộng hơn để bạn sử dụng thoải mái, máy sử dụng thêm tấm nền IPS nhằm giúp tăng góc nhìn rộng xung quanh.', 6, 2, 59);
INSERT INTO `sanpham` VALUES (69, 'Lenovo Phab 2', 3990000, 0, 150, 250, 2450, '2018-06-15', 0, 'enovo Phab 2 là mẫu tablet với kích thước vừa phải, phù hợp với nhiều đối tượng người dùng khác nhau. Lenovo Phab 2 lại có kích thước khá nặng cho người dùng cảm giác cầm nắm chắc chắn và cứng cáp. Máy được thiết kế từ nhôm, mặt lưng được bo cong về các cạnh cho máy ôm tay hơn khi sử dụng.', 7, 2, 60);
INSERT INTO `sanpham` VALUES (70, 'Lenovo Tab 4 8\"', 3690000, 0, 200, 350, 2785, '2018-03-10', 0, 'Máy tính bảng Lenovo Tab 4 8\" 16 GB (TB-8504X) mang trong mình cấu hình mạnh, màn hình lớn hơn, kết nối 4G cùng với mức giá thành vô cùng hợp lý. Lenovo Tab 4 8\" được hoàn thiện bằng chất liệu nhựa polycarbonate tạo cảm giác cầm nắm chắc chắn và cứng cáp, vỏ được phủ 1 lớp nhung chống bám bẩn, tránh sự trơn trượt khi cầm, nhất là với những người dùng hay ra mồ hôi ở tay.', 7, 2, 61);
INSERT INTO `sanpham` VALUES (71, 'Lenovo Tab 7 Essential', 2390000, 0, 78, 150, 1500, '2018-02-24', 0, 'Lenovo Tab 7 Essential 16GB (TB-7304X) là phiên bản nâng cấp với thiết kế mỏng hơn và đặc biệt có tích hợp 4G rất tiện ích. Mạng 4G hiện đang phủ sóng rất rộng trên toàn quốc cho phép người dùng truy cập mạng nhanh mọi lúc mọi nơi và nhanh gấp nhiều lần so với 3G truyền thống. Thỏa thích xem phim hay đọc tin mà bạn yêu thích.', 7, 2, 62);
INSERT INTO `sanpham` VALUES (72, 'Lenovo Tab 3 Essential', 2190000, 0, 150, 110, 478, '2018-04-12', 0, 'Lenovo Tab 3 Essential sở hữu cho mình mức giá bán phải chăng nhưng vẫn đáp ứng tốt cho người dùng các nhu cầu cơ bản sẽ là sự lựa chọn hàng đầu cho người dùng là học sinh sinh viên. Lenovo Tab 3 Essential sở hữu thiết kế khá đơn giản với chất liệu nhựa cùng mặt lưng bo cong về 2 cạnh bên giúp máy dễ dàng cầm nắm và sử dụng.', 7, 2, 63);

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions`  (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  PRIMARY KEY (`session_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sessions
-- ----------------------------
INSERT INTO `sessions` VALUES ('-xt1eC4NEa-zh_1NtxHJ2mzntwgTQGke', 1530318578, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isLogged\":false}');
INSERT INTO `sessions` VALUES ('kEhzT32v4cW775pAcZMd2oGqD0FfOnmm', 1530295721, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isLogged\":false,\"user\":null,\"cart\":[]}');
INSERT INTO `sessions` VALUES ('rHtJYoG4kRH5toYGf5q5UcyTyPt4N0lo', 1530268740, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isLogged\":false}');

-- ----------------------------
-- Table structure for thanhtoan
-- ----------------------------
DROP TABLE IF EXISTS `thanhtoan`;
CREATE TABLE `thanhtoan`  (
  `idThanhToan` int(11) NOT NULL AUTO_INCREMENT,
  `tenChuThe` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `soThe` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cvv` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ngayHethan` date NULL DEFAULT NULL,
  `soTienThanhToan` bigint(20) NULL DEFAULT 0,
  PRIMARY KEY (`idThanhToan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for thongsokythuat
-- ----------------------------
DROP TABLE IF EXISTS `thongsokythuat`;
CREATE TABLE `thongsokythuat`  (
  `idThongSoKyThuat` int(11) NOT NULL AUTO_INCREMENT,
  `heDieuHanh` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `manHinh` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cameraTruoc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cameraSau` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CPU` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ram` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rom` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sim` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pin` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`idThongSoKyThuat`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of thongsokythuat
-- ----------------------------
INSERT INTO `thongsokythuat` VALUES (1, 'iOS 11', 'OLED, 5.8\", Super Retina', '7 MP', '2 camera 12 MP', '	Apple A11 Bionic 6 nhân', '	3 GB', '	256 GB', '	1 Nano SIM, Hỗ trợ 4G', '2716 mAh, có sạc nhanh');
INSERT INTO `thongsokythuat` VALUES (2, 'iOS 11', 'LED-backlit IPS LCD, 5.5\", Retina HD', '7 MP', '2 camera 12 MP', 'Apple A11 Bionic 6 nhân', '3 GB', '256 GB', '1 Nano SIM, Hỗ trợ 4G', '2691 mAh, có sạc nhanh');
INSERT INTO `thongsokythuat` VALUES (3, 'iOS 11', 'LED-backlit IPS LCD, 5.5\", Retina HD', '7 MP', '2 camera 12 MP', 'Apple A11 Bionic 6 nhân', '3 GB', '64 GB', '1 Nano SIM, Hỗ trợ 4G', '2691 mAh, có sạc nhanh');
INSERT INTO `thongsokythuat` VALUES (4, 'iOS 11', 'LED-backlit IPS LCD, 5.5\", Retina HD', '7 MP', '2 camera 12 MP', 'Apple A10 Fusion 4 nhân 64-bit', '3 GB', '128 GB', '1 Nano SIM, Hỗ trợ 4G', '2900 mAh');
INSERT INTO `thongsokythuat` VALUES (5, 'iOS 11', 'LED-backlit IPS LCD, 5.5\", Retina HD', '5 MP', '12 MP', 'Apple A9 2 nhân 64-bit', '2 GB', '32 GB', '1 Nano SIM, Hỗ trợ 4G', '2750 mAh');
INSERT INTO `thongsokythuat` VALUES (10, 'Android 8.0 (Oreo)', 'Super AMOLED, 6.2\", Quad HD+ (2K+)', '8 MP', '2 camera 12 MP', 'Exynos 9810 8 nhân 64 bit', '6 GB', '128 GB', '2 SIM Nano (SIM 2 chung khe thẻ nhớ), Hỗ trợ 4G', '3500 mAh, có sạc nhanh');
INSERT INTO `thongsokythuat` VALUES (11, 'Android 7.1 (Nougat)', 'Super AMOLED, 6.3\", Quad HD+ (2K+)', '8 MP', '2 camera 12 MP', 'Exynos 8895 8 nhân 64-bit', '6 GB', '64 GB', '2 Nano SIM, Hỗ trợ 4G', '3300 mAh, có sạc nhanh');
INSERT INTO `thongsokythuat` VALUES (12, 'Android 8.0 (Oreo)', 'Super AMOLED, 5.8\", Quad HD+ (2K+)', '8 MP', '12 MP', 'Exynos 9810 8 nhân 64 bit', '4 GB', '64 GB', '2 SIM Nano (SIM 2 chung khe thẻ nhớ), Hỗ trợ 4G', '3000 mAh, có sạc nhanh');
INSERT INTO `thongsokythuat` VALUES (13, 'Android 7.1 (Nougat)', 'Super AMOLED, 6.2\", Quad HD+ (2K+)', '8 MP', '12 MP', 'Exynos 8895 8 nhân 64-bit', '4 GB', '64 GB', '2 SIM Nano (SIM 2 chung khe thẻ nhớ), Hỗ trợ 4G', '3500 mAh, có sạc nhanh');
INSERT INTO `thongsokythuat` VALUES (14, 'Android 7.1 (Nougat)', 'Super AMOLED, 5.8\", Quad HD+ (2K+)', '8 MP', '12 MP', 'Exynos 8895 8 nhân 64-bit', '4 GB', '64 GB', '2 SIM Nano (SIM 2 chung khe thẻ nhớ), Hỗ trợ 4G', '3000 mAh, có sạc nhanh');
INSERT INTO `thongsokythuat` VALUES (15, 'Android 7.1 (Nougat)', 'Super AMOLED, 6\", Full HD+', '16 MP', '16 MP và 8 MP', 'Exynos 7885 8 nhân 64-bit', '6 GB', '64 GB', '2 Nano SIM, Hỗ trợ 4G', '3500 mAh, có sạc nhanh');
INSERT INTO `thongsokythuat` VALUES (16, 'Android 7.1 (Nougat)', '	Super AMOLED, 5.5\", Full HD', '13 MP', '13 MP', '	Exynos 7870 8 nhân 64-bit', '3 GB', '32 GB', '2 Nano SIM, Hỗ trợ 4G', '3600 mAh');
INSERT INTO `thongsokythuat` VALUES (17, 'Android 8.0 (Oreo)', 'Super AMOLED, 6\", Full HD+', '24 MP', '16 MP và 5 MP (2 camera)', 'Qualcomm Snapdragon 450 8 nhân 64-bit', '4 GB', '32 GB', '2 Nano SIM, Hỗ trợ 4G', '3500 mAh');
INSERT INTO `thongsokythuat` VALUES (18, 'Android 6.0 (Marshmallow)', 'Super AMOLED, 6.0\", Full HD', '16 MP', '16 MP', 'Snapdragon 653 8 nhân 64-bit', '6 GB', '64 GB', '2 Nano SIM, Hỗ trợ 4G', '4000 mAh, có sạc nhanh');
INSERT INTO `thongsokythuat` VALUES (19, 'Android 8.0 (Oreo)', 'Super AMOLED, 5.6\", HD+', '8 MP', '13 MP', 'Exynos 7870 8 nhân 64-bit', '3 GB', '64 GB', '2 Nano SIM, Hỗ trợ 4G', '3000 mAh');
INSERT INTO `thongsokythuat` VALUES (20, 'Android 8.0 (Oreo)', 'Super AMOLED, 6.3\", Full HD+', '24 MP', '24 MP và 16 MP (2 camera)', 'Qualcomm Snapdragon 660 8 nhân', '4 GB', '64 GB', '2 Nano SIM, Hỗ trợ 4G', '3700 mAh');
INSERT INTO `thongsokythuat` VALUES (21, 'Android 7.0 (Nougat)', 'PLS TFT LCD, 5\", HD', '5 MP', '13 MP', 'Exynos 7570 4 nhân 64-bit', '2 GB', '16 GB', '2 Nano SIM, Hỗ trợ 4G', '2400 mAh');
INSERT INTO `thongsokythuat` VALUES (22, 'Android 8.0 (Oreo)', 'Super AMOLED, 5.5\", HD', '5 MP', '13 MP', 'Exynos 7570 4 nhân 64-bit', '2 GB', '16 GB', '2 Nano SIM, Hỗ trợ 4G', '3000 mAh');
INSERT INTO `thongsokythuat` VALUES (23, 'Android 7.0 (Nougat)', 'Super LCD, Chính: 5.7\", phụ: 2.05\", Quad HD (2K)', '12 MP', '16 MP', 'Qualcomm Snapdragon 821 4 nhân 64-bit', '4 GB', '64 GB', '2 Nano SIM, Hỗ trợ 4G', '3000 mAh, có sạc nhanh');
INSERT INTO `thongsokythuat` VALUES (24, 'Android 7.0 (Nougat)', 'Super LCD 3, 5.5\", Quad HD (2K)', '8 MP', '16 MP', 'Snapdragon 810 8 nhân 64-bit', '3 GB', '64 GB', '1 Nano SIM, Hỗ trợ 4G', '3200 mAh, có sạc nhanh');
INSERT INTO `thongsokythuat` VALUES (25, 'Android 6.0 (Marshmallow)', 'Super LCD, 5.2\", Full HD', '16 MP', '16 MP', 'MTK Helio P10 8 nhân 64-bit', '3 GB', '32 GB', '2 Nano SIM, Hỗ trợ 4G', '2500 mAh');
INSERT INTO `thongsokythuat` VALUES (26, 'Android 8.0 (Oreo)', '	Super LCD, 5.5\", Quad HD (2K)', '12 MP', '16 MP', 'Snapdragon 835 8 nhân 64-bit', '6 GB', '128 GB', '2 Nano SIM, Hỗ trợ 4G', '3000 mAh, có sạc nhanh');
INSERT INTO `thongsokythuat` VALUES (27, 'Android 8.0 (Oreo)', 'IPS LCD, 6\", HD+', '8 MP', '13 MP và 2 MP (2 camera)', 'Qualcomm Snapdragon 450', '3 GB', '32 GB', '2 Nano SIM, Hỗ trợ 4G', '2965 mAh');
INSERT INTO `thongsokythuat` VALUES (28, 'Android 5.0 (Lollipop)', 'Super LCD 3, 5\", Full HD', '4 Ultra pixel', '20.7 MP', 'Snapdragon 810 8 nhân 64-bit', '3 GB', '32 GB', '1 Nano SIM, Hỗ trợ 4G', '2840 mAh');
INSERT INTO `thongsokythuat` VALUES (29, 'Android 8.0 (Oreo)', 'IPS HDR LCD, 5.7\", Full HD+', '5 MP', '19 MP', 'Snapdragon 845 8 nhân', '4 GB', '64 GB', '2 Nano SIM, Hỗ trợ 4G', '3180 mAh, có sạc nhanh');
INSERT INTO `thongsokythuat` VALUES (30, 'Android 8.0 (Oreo)', 'IPS HDR LCD, 5.2\", Full HD', '13 MP', '19 MP', 'Snapdragon 835 8 nhân 64-bit', '4 GB', '64 GB', '2 Nano SIM, Hỗ trợ 4G', '2700 mAh, có sạc nhanh');
INSERT INTO `thongsokythuat` VALUES (31, 'Android 7.0 (Nougat)', 'TRILUMINOS™, 5.2\", Full HD', '13 MP', '23 Mp', '	Snapdragon 820 4 nhân 64-bit', '3 GB', '64 GB', '2 SIM Nano (SIM 2 chung khe thẻ nhớ), Hỗ trợ 4G', '2900 mAh, có sạc nhanh');
INSERT INTO `thongsokythuat` VALUES (32, 'Android 7.0 (Nougat)', 'IPS LCD, 6.0\", Full HD', '16 MP', '23 MP', 'Mediatek Helio P20', '4 GB', '64 GB', '2 Nano SIM, Hỗ trợ 4G', '2700 mAh, có sạc nhanh');
INSERT INTO `thongsokythuat` VALUES (33, 'Android 6.0 (Marshmallow)', 'IPS LCD, 5\", Full HD', '13 MP', '23 MP', 'Snapdragon 650 6 nhân 64-bit', '3 GB', '64 GB', '2 Nano SIM, Hỗ trợ 4G', '2620 mAh, có sạc nhanh');
INSERT INTO `thongsokythuat` VALUES (34, 'Android 7.0 (Nougat)', 'IPS LCD, 5.5\", HD', '5 MP', '13 MP', 'MT6737T, 4 nhân', '2 GB', '16 GB', '2 Nano SIM, Hỗ trợ 4G', '2620 mAh');
INSERT INTO `thongsokythuat` VALUES (35, 'Android 7.1 (Nougat)', 'IPS LCD, 5.5\", HD', '8 MP', '13 MP', 'MT6737T, 4 nhân', '3 GB', '32 GB', '2 Nano SIM, Hỗ trợ 4G', '3300 mAh');
INSERT INTO `thongsokythuat` VALUES (36, 'Android 7.0 (Nougat)', 'IPS LCD, 5\", HD', '8 MP', '23 MP', 'Mediatek Helio P20', '3 GB', '64 GB', '2 Nano SIM', '2300 mAh');
INSERT INTO `thongsokythuat` VALUES (37, 'Android 7.1 (Nougat)', 'IPS LCD, 5.3\", Quad HD (2K)', '13 MP', '	2 camera 13 MP', 'Snapdragon 835 8 nhân 64-bit', '4 GB', '64 GB', '2 Nano SIM, Hỗ trợ 4G', '3090 mAh, có sạc nhanh');
INSERT INTO `thongsokythuat` VALUES (38, 'Android 8.0 (Oreo)', 'IPS LCD, 6\", Full HD+', '16 MP', '	12 MP và 13 MP (2 camera)', 'Qualcomm Snapdragon 660 8 nhân', '4 GB', '64 GB', '2 SIM Nano (SIM 2 chung khe thẻ nhớ), Hỗ trợ 4G', '3800 mAh');
INSERT INTO `thongsokythuat` VALUES (39, 'Android 8.0 (Oreo)', 'IPS LCD, 5.5\", Full HD', '8 MP', '16 MP', 'Qualcomm Snapdragon 630 8 nhân', '4 GB', '64 GB', '2 SIM Nano (SIM 2 chung khe thẻ nhớ), Hỗ trợ 4G', '3000 mAh');
INSERT INTO `thongsokythuat` VALUES (40, 'Android 7.1 (Nougat)', 'IPS LCD, 5.2\", HD', '8 MP', '13 MP', 'Qualcomm Snapdragon 430 8 nhân 64 bit', '2 GB', '16 GB', '2 Nano SIM, Hỗ trợ 4G', '3000 mAh');
INSERT INTO `thongsokythuat` VALUES (41, 'Android 7.0 (Nougat)', 'IPS LCD, 5\", HD', '8 MP', '8 MP', 'MT6737 4 nhân', '2 GB', '16 GB', '2 Nano SIM, Hỗ trợ 4G', '2630 mAh');
INSERT INTO `thongsokythuat` VALUES (42, 'Android 7.1 (Nougat)', 'LTPS LCD, 5\", HD', '5 MP', '8 MP', 'Snapdragon 212 4 nhân 32-bit', '1 GB', '8 GB', '2 Nano SIM, Hỗ trợ 4G', '4100 mAh');
INSERT INTO `thongsokythuat` VALUES (43, 'ColorOS 5.0 (Android 8.1)', 'LTPS LCD, 6.23\", Full HD+', '25 MP', '16 MP', 'MediaTek Helio P60 8 nhân 64-bit', '6 GB', '128 GB', '2 Nano SIM, Hỗ trợ 4G', '3400 mAh');
INSERT INTO `thongsokythuat` VALUES (44, '	ColorOS 3.2 (Android 7.1)', 'IPS LCD, 6.0\", Full HD+', '16 MP', '20 MP', 'Mediatek Helio P23 8 nhân 64-bit', '6 GB', '64 GB', '2 Nano SIM, Hỗ trợ 4G', '3200 mAh');
INSERT INTO `thongsokythuat` VALUES (45, '	Android 6.0 (Marshmallow)', 'IPS LCD, 6.0\", Full HD', '16 MP và 8 MP', '16 MP', 'Snapdragon 653 8 nhân 64-bit', '4 GB', '64 GB', '2 Nano SIM, Hỗ trợ 4G', '4000 mAh, có sạc nhanh');
INSERT INTO `thongsokythuat` VALUES (46, 'Android 7.1 (Nougat)', 'IPS LCD, 5.7\", HD+', '8 MP', '13 MP', 'Mediatek Helio P23 8 nhân 64-bit', '3 GB', '32 GB', '2 Nano SIM, Hỗ trợ 4G', '3180 mAh');
INSERT INTO `thongsokythuat` VALUES (47, 'iOS 11', 'IPS LCD, 10.5\"', '7 MP', '12 MP', 'Apple A10X 6 nhân 64-bit', '4 GB', '64 GB', 'Nano Sim', '4100 mAh');
INSERT INTO `thongsokythuat` VALUES (48, 'iOS 11', 'IPS LCD, 10.5\"', '8 MP', '15 MP', 'Apple A10X 6 nhân 64-bit', '3 GB', '64 GB', 'Nano Sim', '4500 mAh');
INSERT INTO `thongsokythuat` VALUES (49, 'iOS 11.3', 'LED backlit LCD, 9.7\"', '1.2 MP', '8 MP', 'Apple A10 Fusion, 2.34 GHz', '2 GB', '128 GB', 'Nano Sim', '3800 mAh');
INSERT INTO `thongsokythuat` VALUES (50, 'iOS 10', 'LED backlit LCD, 7.9\"', '1.2 MP', '8 MP', 'Apple A8, 1.5 GHz', '2 GB', '128 GB', 'Nano Sim', '4500 mAh');
INSERT INTO `thongsokythuat` VALUES (51, 'iOS 11.3', 'LED backlit LCD, 9.7\"', '1.2 MP', '8 MP', '	Apple A10 Fusion, 2.34 GHz', '2 GB', '32 GB', 'Nano Sim', '4250 mAh');
INSERT INTO `thongsokythuat` VALUES (52, '	Android 6.0 (Marshmallow)', 'PLS LCD, 10.1\"', '2 MP', '8 MP', 'Exynos 7870 8 nhân, 1.6 GHz', '3 GB', '16 GB', 'Nano Sim, WiFi, 3G, 4G LTE', '4350 mAh');
INSERT INTO `thongsokythuat` VALUES (53, 'Android 7.0 (Nougat)', 'PLS TFT, 8\"', '5 MP', '8 MP', 'Qualcomm MSM8917, 1.4 GHz', '2 GB', '16 GB', 'Nano Sim, WiFi, 3G, 4G LTE', '4500 mAh');
INSERT INTO `thongsokythuat` VALUES (54, 'Android 4.4', 'TFT, 9.6\"', '2 MP', '5 MP', 'Spreadtrum 4 nhân, 1.3 GHz', '1.5 GB', '8 GB', 'Micro sim, WiFi, 3G, Không hỗ trợ 4G', '4000 mAh');
INSERT INTO `thongsokythuat` VALUES (55, 'Android 5.1', 'TFT LCD, 7\"', '2 MP', '5 MP', 'CPU 4 nhân, 1.3 GHz', '1.5 GB', '8 GB', 'Micro sim, WiFi, 3G, 4G LTE', '4120 mAh');
INSERT INTO `thongsokythuat` VALUES (56, 'Android 7.0', 'IPS LCD, 8\"', '8 MP', '8 MP', 'Qualcomm MSM8940, 1.4 GHz', '3 GB', '32 GB', 'Nano Sim, WiFi, 3G, 4G LTE', '4750 mAh');
INSERT INTO `thongsokythuat` VALUES (57, 'Android 7.0', 'PLS LCD, 10\"', '2 MP', '5 MP', 'Qualcomm MSM8917, 1.4 GHz', '2 GB', '16 GB', 'Nano Sim, WiFi, 3G, 4G LTE', '4200 mAh');
INSERT INTO `thongsokythuat` VALUES (58, 'Android 7.0', 'IPS LCD, 8\"', '2 MP', '5 MP', 'Qualcomm MSM8917, 1.4 GHz', '2 GB', '16 GB', 'Nano Sim, WiFi, 3G, 4G LTE', '4100 mAh');
INSERT INTO `thongsokythuat` VALUES (59, 'Android 4.3', 'IPS WXGA, 8\"', '0.3 MP', '5 MP', 'ARM Cortex A7 (MSM 8210) 4 nhân, 1.2 GHz', '1 GB', '8 GB', 'Micro sim, WiFi, 3G, Không hỗ trợ 4G', '3980 mAh');
INSERT INTO `thongsokythuat` VALUES (60, 'Android 6.0 (Marshmallow)', 'IPS LCD, 6.4\"', '5 MP', '13 MP', 'MediaTek MT 8735 4 nhân, 1.3 GHz', '3 GB', '32 GB', 'Micro sim, WiFi, 3G, 4G LTE', '4600 mAh');
INSERT INTO `thongsokythuat` VALUES (61, 'Android 7.0', 'IPS LCD, 8\"', '2 MP', '5 MP', 'Qualcomm MSM8917, 1.4 GHz', '2 GB', '16 GB', 'Nano SIM, SIM 2 chung khe thẻ nhớ', '3600 mAh');
INSERT INTO `thongsokythuat` VALUES (62, 'Android 7.0', 'IPS LCD, 7\"', '2 MP', '2 MP', '	MediaTek MT 8735D 4 nhân, 1.1 GHz', '1 GB', '16 GB', 'Micro sim, WiFi, 3G, 4G LTE', '4125 mAh');
INSERT INTO `thongsokythuat` VALUES (63, 'Android 5.1', 'IPS LCD, 7\"', '0.3 MP', '2 MP', 'CPU 4 nhân, 1.3 GHz', '1 GB', '16 GB', 'Micro sim, WiFi, 3G, Không hỗ trợ 4G', '4350 mAh');

-- ----------------------------
-- Table structure for thongtingiaohang
-- ----------------------------
DROP TABLE IF EXISTS `thongtingiaohang`;
CREATE TABLE `thongtingiaohang`  (
  `idThongTinGiaoHang` int(11) NOT NULL AUTO_INCREMENT,
  `tenNguoiNhan` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `diaChiNhan` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sdtNhan` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`idThongTinGiaoHang`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
