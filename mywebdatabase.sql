/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : localhost:3306
 Source Schema         : mywebdatabase

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 21/12/2018 15:12:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (9, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (10, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (11, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 4, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 4, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can view content type', 4, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (17, 'Can add session', 5, 'add_session');
INSERT INTO `auth_permission` VALUES (18, 'Can change session', 5, 'change_session');
INSERT INTO `auth_permission` VALUES (19, 'Can delete session', 5, 'delete_session');
INSERT INTO `auth_permission` VALUES (20, 'Can view session', 5, 'view_session');
INSERT INTO `auth_permission` VALUES (21, 'Can add 用户信息', 6, 'add_userinfo');
INSERT INTO `auth_permission` VALUES (22, 'Can change 用户信息', 6, 'change_userinfo');
INSERT INTO `auth_permission` VALUES (23, 'Can delete 用户信息', 6, 'delete_userinfo');
INSERT INTO `auth_permission` VALUES (24, 'Can add 用户验证码', 7, 'add_verifycode');
INSERT INTO `auth_permission` VALUES (25, 'Can change 用户验证码', 7, 'change_verifycode');
INSERT INTO `auth_permission` VALUES (26, 'Can delete 用户验证码', 7, 'delete_verifycode');
INSERT INTO `auth_permission` VALUES (27, 'Can view 用户信息', 6, 'view_userinfo');
INSERT INTO `auth_permission` VALUES (28, 'Can view 用户验证码', 7, 'view_verifycode');
INSERT INTO `auth_permission` VALUES (29, 'Can add 轮播图', 8, 'add_bannerimage');
INSERT INTO `auth_permission` VALUES (30, 'Can change 轮播图', 8, 'change_bannerimage');
INSERT INTO `auth_permission` VALUES (31, 'Can delete 轮播图', 8, 'delete_bannerimage');
INSERT INTO `auth_permission` VALUES (32, 'Can add 商品', 9, 'add_product');
INSERT INTO `auth_permission` VALUES (33, 'Can change 商品', 9, 'change_product');
INSERT INTO `auth_permission` VALUES (34, 'Can delete 商品', 9, 'delete_product');
INSERT INTO `auth_permission` VALUES (35, 'Can view 轮播图', 8, 'view_bannerimage');
INSERT INTO `auth_permission` VALUES (36, 'Can view 商品', 9, 'view_product');
INSERT INTO `auth_permission` VALUES (37, 'Can add 城市', 10, 'add_city');
INSERT INTO `auth_permission` VALUES (38, 'Can change 城市', 10, 'change_city');
INSERT INTO `auth_permission` VALUES (39, 'Can delete 城市', 10, 'delete_city');
INSERT INTO `auth_permission` VALUES (40, 'Can add 品牌店铺关系', 11, 'add_brandtoshop');
INSERT INTO `auth_permission` VALUES (41, 'Can change 品牌店铺关系', 11, 'change_brandtoshop');
INSERT INTO `auth_permission` VALUES (42, 'Can delete 品牌店铺关系', 11, 'delete_brandtoshop');
INSERT INTO `auth_permission` VALUES (43, 'Can add 店铺', 12, 'add_shop');
INSERT INTO `auth_permission` VALUES (44, 'Can change 店铺', 12, 'change_shop');
INSERT INTO `auth_permission` VALUES (45, 'Can delete 店铺', 12, 'delete_shop');
INSERT INTO `auth_permission` VALUES (46, 'Can add 品牌', 13, 'add_brand');
INSERT INTO `auth_permission` VALUES (47, 'Can change 品牌', 13, 'change_brand');
INSERT INTO `auth_permission` VALUES (48, 'Can delete 品牌', 13, 'delete_brand');
INSERT INTO `auth_permission` VALUES (49, 'Can add 商品种类', 14, 'add_salekind');
INSERT INTO `auth_permission` VALUES (50, 'Can change 商品种类', 14, 'change_salekind');
INSERT INTO `auth_permission` VALUES (51, 'Can delete 商品种类', 14, 'delete_salekind');
INSERT INTO `auth_permission` VALUES (52, 'Can add 商品种类店铺关系', 15, 'add_kindtoshop');
INSERT INTO `auth_permission` VALUES (53, 'Can change 商品种类店铺关系', 15, 'change_kindtoshop');
INSERT INTO `auth_permission` VALUES (54, 'Can delete 商品种类店铺关系', 15, 'delete_kindtoshop');
INSERT INTO `auth_permission` VALUES (55, 'Can view 品牌', 13, 'view_brand');
INSERT INTO `auth_permission` VALUES (56, 'Can view 品牌店铺关系', 11, 'view_brandtoshop');
INSERT INTO `auth_permission` VALUES (57, 'Can view 城市', 10, 'view_city');
INSERT INTO `auth_permission` VALUES (58, 'Can view 商品种类店铺关系', 15, 'view_kindtoshop');
INSERT INTO `auth_permission` VALUES (59, 'Can view 商品种类', 14, 'view_salekind');
INSERT INTO `auth_permission` VALUES (60, 'Can view 店铺', 12, 'view_shop');
INSERT INTO `auth_permission` VALUES (61, 'Can add 用户购买', 16, 'add_userbuy');
INSERT INTO `auth_permission` VALUES (62, 'Can change 用户购买', 16, 'change_userbuy');
INSERT INTO `auth_permission` VALUES (63, 'Can delete 用户购买', 16, 'delete_userbuy');
INSERT INTO `auth_permission` VALUES (64, 'Can add 用户消息', 17, 'add_usermessage');
INSERT INTO `auth_permission` VALUES (65, 'Can change 用户消息', 17, 'change_usermessage');
INSERT INTO `auth_permission` VALUES (66, 'Can delete 用户消息', 17, 'delete_usermessage');
INSERT INTO `auth_permission` VALUES (67, 'Can add 用户收藏', 18, 'add_userlove');
INSERT INTO `auth_permission` VALUES (68, 'Can change 用户收藏', 18, 'change_userlove');
INSERT INTO `auth_permission` VALUES (69, 'Can delete 用户收藏', 18, 'delete_userlove');
INSERT INTO `auth_permission` VALUES (70, 'Can add 商品评论', 19, 'add_usercomments');
INSERT INTO `auth_permission` VALUES (71, 'Can change 商品评论', 19, 'change_usercomments');
INSERT INTO `auth_permission` VALUES (72, 'Can delete 商品评论', 19, 'delete_usercomments');
INSERT INTO `auth_permission` VALUES (73, 'Can add 用户需求', 20, 'add_userask');
INSERT INTO `auth_permission` VALUES (74, 'Can change 用户需求', 20, 'change_userask');
INSERT INTO `auth_permission` VALUES (75, 'Can delete 用户需求', 20, 'delete_userask');
INSERT INTO `auth_permission` VALUES (76, 'Can view 用户需求', 20, 'view_userask');
INSERT INTO `auth_permission` VALUES (77, 'Can view 用户购买', 16, 'view_userbuy');
INSERT INTO `auth_permission` VALUES (78, 'Can view 商品评论', 19, 'view_usercomments');
INSERT INTO `auth_permission` VALUES (79, 'Can view 用户收藏', 18, 'view_userlove');
INSERT INTO `auth_permission` VALUES (80, 'Can view 用户消息', 17, 'view_usermessage');
INSERT INTO `auth_permission` VALUES (81, 'Can add User Widget', 21, 'add_userwidget');
INSERT INTO `auth_permission` VALUES (82, 'Can change User Widget', 21, 'change_userwidget');
INSERT INTO `auth_permission` VALUES (83, 'Can delete User Widget', 21, 'delete_userwidget');
INSERT INTO `auth_permission` VALUES (84, 'Can add Bookmark', 22, 'add_bookmark');
INSERT INTO `auth_permission` VALUES (85, 'Can change Bookmark', 22, 'change_bookmark');
INSERT INTO `auth_permission` VALUES (86, 'Can delete Bookmark', 22, 'delete_bookmark');
INSERT INTO `auth_permission` VALUES (87, 'Can add User Setting', 23, 'add_usersettings');
INSERT INTO `auth_permission` VALUES (88, 'Can change User Setting', 23, 'change_usersettings');
INSERT INTO `auth_permission` VALUES (89, 'Can delete User Setting', 23, 'delete_usersettings');
INSERT INTO `auth_permission` VALUES (90, 'Can add log entry', 24, 'add_log');
INSERT INTO `auth_permission` VALUES (91, 'Can change log entry', 24, 'change_log');
INSERT INTO `auth_permission` VALUES (92, 'Can delete log entry', 24, 'delete_log');
INSERT INTO `auth_permission` VALUES (93, 'Can view Bookmark', 22, 'view_bookmark');
INSERT INTO `auth_permission` VALUES (94, 'Can view log entry', 24, 'view_log');
INSERT INTO `auth_permission` VALUES (95, 'Can view User Setting', 23, 'view_usersettings');
INSERT INTO `auth_permission` VALUES (96, 'Can view User Widget', 21, 'view_userwidget');
INSERT INTO `auth_permission` VALUES (97, 'Can add captcha store', 25, 'add_captchastore');
INSERT INTO `auth_permission` VALUES (98, 'Can change captcha store', 25, 'change_captchastore');
INSERT INTO `auth_permission` VALUES (99, 'Can delete captcha store', 25, 'delete_captchastore');
INSERT INTO `auth_permission` VALUES (100, 'Can view captcha store', 25, 'view_captchastore');

-- ----------------------------
-- Table structure for captcha_captchastore
-- ----------------------------
DROP TABLE IF EXISTS `captcha_captchastore`;
CREATE TABLE `captcha_captchastore`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `response` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `hashkey` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expiration` datetime(6) NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `hashkey`(`hashkey`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of captcha_captchastore
-- ----------------------------
INSERT INTO `captcha_captchastore` VALUES (21, 'MGEY', 'mgey', 'c839bb1be4daf9333e31da2910aaf1bb7401d731', '2018-12-21 12:57:32.540028');
INSERT INTO `captcha_captchastore` VALUES (22, 'VCGF', 'vcgf', '80c8b59815341c293ecf51c6b69d47b47b3eefd4', '2018-12-21 15:09:41.017018');

-- ----------------------------
-- Table structure for commodity_bannerimage
-- ----------------------------
DROP TABLE IF EXISTS `commodity_bannerimage`;
CREATE TABLE `commodity_bannerimage`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ImageTitle` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of commodity_bannerimage
-- ----------------------------
INSERT INTO `commodity_bannerimage` VALUES (2, '1', 'banner/2018/12/TB1X5gol5rpK1RjSZFhSutSdXXa_pnkHozu.jpg', 'https://www.tmall.com/', 100, '2018-12-11 01:55:00.000000');
INSERT INTO `commodity_bannerimage` VALUES (3, '2', 'banner/2018/12/TB1wuZzQpXXXXcmXXXXSutbFXXX.jpg', 'https://www.tmall.com/', 100, '2018-12-11 01:58:00.000000');
INSERT INTO `commodity_bannerimage` VALUES (4, '3', 'banner/2018/12/TB1m7_vtHvpK1RjSZFqSuwXUVXa.jpg', 'https://www.tmall.com/', 100, '2018-12-11 01:59:00.000000');
INSERT INTO `commodity_bannerimage` VALUES (5, '4', 'banner/2018/12/TB1W4nPJFXXXXbSXpXXSutbFXXX.jpg', 'https://www.tmall.com/', 100, '2018-12-11 01:59:00.000000');

-- ----------------------------
-- Table structure for commodity_product
-- ----------------------------
DROP TABLE IF EXISTS `commodity_product`;
CREATE TABLE `commodity_product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ProductInfo` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` int(11) NOT NULL,
  `Category_id` int(11) NOT NULL,
  `DealNum` int(11) NOT NULL,
  `LikeNum` int(11) NOT NULL,
  `you_must_know` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ProductImage` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ClickNum` int(11) NOT NULL,
  `tag` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ProductDate` datetime(6) NULL,
  `RemainNum` int(11) NOT NULL,
  `IfBanner` tinyint(1) NOT NULL,
  `product_brand_id` int(11) NULL DEFAULT NULL,
  `product_shop_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `commodity_product_product_brand_id_56dca0f6_fk_shop_brand_id`(`product_brand_id`) USING BTREE,
  INDEX `commodity_product_product_shop_id_52fd4d68_fk_shop_shop_id`(`product_shop_id`) USING BTREE,
  INDEX `commodity_product_Category_id_4b90307a`(`Category_id`) USING BTREE,
  CONSTRAINT `commodity_product_Category_id_4b90307a_fk_shop_salekind_id` FOREIGN KEY (`Category_id`) REFERENCES `shop_salekind` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `commodity_product_product_brand_id_56dca0f6_fk_shop_brand_id` FOREIGN KEY (`product_brand_id`) REFERENCES `shop_brand` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `commodity_product_product_shop_id_52fd4d68_fk_shop_shop_id` FOREIGN KEY (`product_shop_id`) REFERENCES `shop_shop` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of commodity_product
-- ----------------------------
INSERT INTO `commodity_product` VALUES (1, '小米8 屏幕指纹版', '<p><img src=\"/media/commodity/ueditor/TB2XMI2miCYBuNkSnaVXXcMsVXa_!!1714128138_20181219044820_130.jpg\" style=\"\"/> </p><p><img src=\"/media/commodity/ueditor/TB2SGdxmyOYBuNjSsD4XXbSkFXa_!!1714128138_20181219044820_652.jpg\" style=\"\"/> </p><p><img src=\"/media/commodity/ueditor/TB2fUSDuKySBuNjy1zdXXXPxFXa_!!1714128138_20181219044936_126.jpg\" title=\"\" alt=\"TB2fUSDuKySBuNjy1zdXXXPxFXa_!!1714128138.jpg\"/></p><p><img src=\"/media/commodity/ueditor/TB246aEuL5TBuNjSspmXXaDRVXa_!!1714128138_20181219045040_286.jpg\" title=\"\" alt=\"TB246aEuL5TBuNjSspmXXaDRVXa_!!1714128138.jpg\"/></p><p><img src=\"/media/commodity/ueditor/TB2yXiAuKOSBuNjy0FdXXbDnVXa_!!1714128138_20181219045117_367.jpg\" title=\"\" alt=\"TB2yXiAuKOSBuNjy0FdXXbDnVXa_!!1714128138.jpg\"/></p>', 3399, 1, 7, 2, '无', 'commodity/2018/12/pms_1538019355.46916163560x560.jpg', 135, '全面屏手机', '2018-12-10 20:02:00.000000', 7, 0, 1, 1);
INSERT INTO `commodity_product` VALUES (2, '进口柔滑亮泽焕颜面膜', '<p><img src=\"/media/commodity/ueditor/O1CN011sM0ENtNUwhZsZD_!!2781365751_20181218015124_441.jpg\" title=\"\" alt=\"O1CN011sM0ENtNUwhZsZD_!!2781365751.jpg\"/><br/></p><p><img src=\"/media/commodity/ueditor/O1CN011sM0EOFzXWPm29D_!!2781365751_20181218015020_892.jpg\" title=\"\" alt=\"O1CN011sM0EOFzXWPm29D_!!2781365751.jpg\"/> </p>', 319, 2, 4, 0, '无', 'commodity/2018/12/TB2TY3ch_nI8KJjSszbXXb4KFXa_2549841410-0-sm.jpg_430x430q90.jpg', 41, '滋养 补水', '2018-12-11 02:17:00.000000', 99, 0, 2, 2);
INSERT INTO `commodity_product` VALUES (3, '小米MIX 3', '<p><img src=\"/media/commodity/ueditor/O1CN0129zFeWA2056Zoe3_!!1714128138_20181219045615_765.jpg\" style=\"\"/></p><p><img src=\"/media/commodity/ueditor/O1CN0129zFeWainjvwaDW_!!1714128138_20181219045615_451.jpg\" style=\"\"/></p><p><img src=\"/media/commodity/ueditor/O1CN0129zFeXwSRIs07Bh_!!1714128138_20181219045615_101.jpg\" style=\"\"/></p><p><img src=\"/media/commodity/ueditor/O1CN0129zFeY5IfjQZY9S_!!1714128138_20181219045615_287.jpg\" style=\"\"/></p><p><img src=\"/media/commodity/ueditor/O1CN0129zFeXxEXDZcxrw_!!1714128138_20181219045615_287.jpg\" style=\"\"/></p><p><br/></p>', 3599, 1, 0, 0, '无', 'commodity/2018/12/pms_1540429668.71024551560x560.jpg', 4, '全面屏', '2018-12-19 04:53:00.000000', 20, 0, 1, 1);
INSERT INTO `commodity_product` VALUES (4, '东北红松子', '<p><img src=\"/media/commodity/ueditor/O1CN011YvuzJMc5ttJ4uc_!!619123122_20181219050953_635.jpg\" style=\"\"/></p><p><img src=\"/media/commodity/ueditor/O1CN011YvuzNcFN2a6QZB_!!619123122_20181219050953_822.png\" style=\"\"/></p><p><img src=\"/media/commodity/ueditor/O1CN011YvuzPU457yLjIN_!!619123122_20181219050953_496.png\" style=\"\"/></p><p><img src=\"/media/commodity/ueditor/O1CN011YvuzQ3Ij0hJmyv_!!619123122_20181219050953_507.png\" style=\"\"/></p><p><img src=\"/media/commodity/ueditor/O1CN01TAIWui1YvuzRHIQVb_!!619123122_20181219050953_161.png\" style=\"\"/></p><p><br/></p>', 49, 3, 1, 0, '老少皆宜', 'commodity/2018/12/DCA43ZB4J0EWKI6TAX.png', 3, '松子', '2018-12-19 05:06:00.000000', 999, 0, 3, 3);
INSERT INTO `commodity_product` VALUES (5, '爱得堡马丁靴男短靴', '<p><img src=\"/media/commodity/ueditor/O1CN01UQ212A1K85HJhHaaz_!!1770991118_20181219051833_441.jpg\" style=\"\"/></p><p><img src=\"/media/commodity/ueditor/O1CN01UFqQi61K85HQrlo36_!!1770991118_20181219051833_462.jpg\" style=\"\"/></p><p><img src=\"/media/commodity/ueditor/O1CN01JcPXqd1K85HRYUX3s_!!1770991118_20181219051833_816.jpg\" style=\"\"/></p><p><br/></p>', 649, 4, 1, 1, '无', 'commodity/2018/12/XKIDZC3MFG7ZAANBQDA.png', 4, '男鞋', '2018-12-19 05:14:00.000000', 49, 0, 4, 4);
INSERT INTO `commodity_product` VALUES (6, '专研紧塑精华素', '<p><br/></p><p><img src=\"/media/commodity/ueditor/A(8H`(JDY4$Q]4]FBZZ]HG4_20181221010257_455.png\" style=\"\"/></p><p><br/></p>', 680, 2, 0, 0, '无', 'commodity/2018/12/9DYR3H5WG0XF1YBR2TOL4.png', 1, '年轻上扬	雕琢立体轮廓', '2018-12-21 00:57:00.000000', 20, 1, 2, 2);

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_users_userinfo_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `users_userinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (25, 'captcha', 'captchastore');
INSERT INTO `django_content_type` VALUES (8, 'commodity', 'bannerimage');
INSERT INTO `django_content_type` VALUES (9, 'commodity', 'product');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (13, 'shop', 'brand');
INSERT INTO `django_content_type` VALUES (11, 'shop', 'brandtoshop');
INSERT INTO `django_content_type` VALUES (10, 'shop', 'city');
INSERT INTO `django_content_type` VALUES (15, 'shop', 'kindtoshop');
INSERT INTO `django_content_type` VALUES (14, 'shop', 'salekind');
INSERT INTO `django_content_type` VALUES (12, 'shop', 'shop');
INSERT INTO `django_content_type` VALUES (20, 'userOperate', 'userask');
INSERT INTO `django_content_type` VALUES (16, 'userOperate', 'userbuy');
INSERT INTO `django_content_type` VALUES (19, 'userOperate', 'usercomments');
INSERT INTO `django_content_type` VALUES (18, 'userOperate', 'userlove');
INSERT INTO `django_content_type` VALUES (17, 'userOperate', 'usermessage');
INSERT INTO `django_content_type` VALUES (6, 'users', 'userinfo');
INSERT INTO `django_content_type` VALUES (7, 'users', 'verifycode');
INSERT INTO `django_content_type` VALUES (22, 'xadmin', 'bookmark');
INSERT INTO `django_content_type` VALUES (24, 'xadmin', 'log');
INSERT INTO `django_content_type` VALUES (23, 'xadmin', 'usersettings');
INSERT INTO `django_content_type` VALUES (21, 'xadmin', 'userwidget');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2018-12-10 19:40:39.610128');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2018-12-10 19:40:41.393362');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2018-12-10 19:40:47.422275');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2018-12-10 19:40:48.470445');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2018-12-10 19:40:48.545245');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2018-12-10 19:40:48.610081');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2018-12-10 19:40:48.689859');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2018-12-10 19:40:48.771640');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2018-12-10 19:40:48.842450');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2018-12-10 19:40:48.942184');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2018-12-10 19:40:49.032942');
INSERT INTO `django_migrations` VALUES (12, 'users', '0001_initial', '2018-12-10 19:40:54.651923');
INSERT INTO `django_migrations` VALUES (13, 'admin', '0001_initial', '2018-12-10 19:40:56.822122');
INSERT INTO `django_migrations` VALUES (14, 'admin', '0002_logentry_remove_auto_add', '2018-12-10 19:40:56.871989');
INSERT INTO `django_migrations` VALUES (15, 'captcha', '0001_initial', '2018-12-10 19:40:57.333755');
INSERT INTO `django_migrations` VALUES (16, 'shop', '0001_initial', '2018-12-10 19:41:11.952546');
INSERT INTO `django_migrations` VALUES (17, 'commodity', '0001_initial', '2018-12-10 19:41:15.153989');
INSERT INTO `django_migrations` VALUES (18, 'sessions', '0001_initial', '2018-12-10 19:41:15.769344');
INSERT INTO `django_migrations` VALUES (19, 'userOperate', '0001_initial', '2018-12-10 19:41:17.502710');
INSERT INTO `django_migrations` VALUES (20, 'userOperate', '0002_auto_20181210_1940', '2018-12-10 19:41:24.950440');
INSERT INTO `django_migrations` VALUES (21, 'xadmin', '0001_initial', '2018-12-10 19:41:30.486812');
INSERT INTO `django_migrations` VALUES (22, 'xadmin', '0002_log', '2018-12-10 19:41:33.174626');
INSERT INTO `django_migrations` VALUES (23, 'xadmin', '0003_auto_20160715_0100', '2018-12-10 19:41:34.452303');
INSERT INTO `django_migrations` VALUES (24, 'shop', '0002_brand_shop', '2018-12-10 20:38:19.726951');
INSERT INTO `django_migrations` VALUES (25, 'commodity', '0002_auto_20181218_0248', '2018-12-18 02:48:15.918805');
INSERT INTO `django_migrations` VALUES (26, 'userOperate', '0003_auto_20181218_0248', '2018-12-18 02:48:16.026504');
INSERT INTO `django_migrations` VALUES (27, 'commodity', '0003_remove_product_productdesc', '2018-12-18 03:14:14.953271');
INSERT INTO `django_migrations` VALUES (28, 'commodity', '0004_remove_product_apply', '2018-12-18 03:38:24.051682');
INSERT INTO `django_migrations` VALUES (29, 'userOperate', '0004_delete_userask', '2018-12-18 04:01:12.284098');
INSERT INTO `django_migrations` VALUES (30, 'shop', '0003_auto_20181219_0406', '2018-12-19 04:07:05.945810');
INSERT INTO `django_migrations` VALUES (31, 'shop', '0004_remove_shop_productnum', '2018-12-19 04:13:41.912511');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('3opwdxraqvbgpmmbnb66tsofjw4g79t5', 'Y2I2M2ZlNWRlMmMyMTU1OGMxM2M5Y2I1ZWQ3MjQ4OGYxYmU5ZjIwNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWE0YmRkMzgzYTVhNzI0OWM4Zjg4NDhlNzAzZGMwNDgzMTg2ZmNiZCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbmQifQ==', '2018-12-31 17:46:31.667811');
INSERT INTO `django_session` VALUES ('f5th1k43q4v1sog073u8dr5714wj97o6', 'MmNjYzdhOWU1NjI4MjRkYmM5ZmM5ZDMxYjI5YjY3YzFkOGZiODJhMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjhkNjA5ZDIzMWYwYWQzZTU3NzBmMTRmYzBkMmMyMTY1MjFlZDlmNGMiLCJMSVNUX1FVRVJZIjpbWyJjb21tb2RpdHkiLCJiYW5uZXJpbWFnZSJdLCIiXSwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2019-01-04 15:07:52.752629');
INSERT INTO `django_session` VALUES ('k5w92wr1iqgsoausg2cklv3ivpjuf3bs', 'NTE2YTA0ZmZlMDdjNmZmZWFkOWMxNzdjYzk4YzA4Y2I4M2ZmMzE5Mzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxYTRiZGQzODNhNWE3MjQ5YzhmODg0OGU3MDNkYzA0ODMxODZmY2JkIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJMSVNUX1FVRVJZIjpbWyJhdXRoIiwicGVybWlzc2lvbiJdLCIiXX0=', '2019-01-01 00:31:01.399911');
INSERT INTO `django_session` VALUES ('p273ut6mkiag53lehu7pg07vdb6heuhh', 'YTQ4MTQ3NTI0YjE1MGU2MTc5MzRiZDQ0ZGViMzA5MTk5YjE0OWEyZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjFhNGJkZDM4M2E1YTcyNDljOGY4ODQ4ZTcwM2RjMDQ4MzE4NmZjYmQiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbmQifQ==', '2018-12-25 02:38:23.316955');
INSERT INTO `django_session` VALUES ('x65ibsyqsvtw7fssldss1wrdwz5ncj12', 'ZGYyNThmZTA4OTJkOWNmYjQ5YjQ2MjFhNGIwMDRlNjQxZTcwYzViMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbmQiLCJMSVNUX1FVRVJZIjpbWyJjb21tb2RpdHkiLCJwcm9kdWN0Il0sIiJdLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfaGFzaCI6IjFhNGJkZDM4M2E1YTcyNDljOGY4ODQ4ZTcwM2RjMDQ4MzE4NmZjYmQifQ==', '2018-12-24 20:31:29.264141');

-- ----------------------------
-- Table structure for shop_brand
-- ----------------------------
DROP TABLE IF EXISTS `shop_brand`;
CREATE TABLE `shop_brand`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `BrandName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BrandDesc` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ClickNum` int(11) NOT NULL,
  `LikeNum` int(11) NOT NULL,
  `BrandImage` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NULL,
  `feature` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Category_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `shop_brand_Category_id_ccc79521_fk_shop_salekind_id`(`Category_id`) USING BTREE,
  INDEX `shop_brand_shop_id_01b44833_fk_shop_shop_id`(`shop_id`) USING BTREE,
  CONSTRAINT `shop_brand_Category_id_ccc79521_fk_shop_salekind_id` FOREIGN KEY (`Category_id`) REFERENCES `shop_salekind` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `shop_brand_shop_id_01b44833_fk_shop_shop_id` FOREIGN KEY (`shop_id`) REFERENCES `shop_shop` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shop_brand
-- ----------------------------
INSERT INTO `shop_brand` VALUES (1, '小米', '小米公司正式成立于2010年4月，是一家专注于高端智能手机、互联网电视以及智能家居生态链建设的创新型科技企业。', 42, 0, 'brand/2018/12/TB1r23ZRXXXXXaxXXXXXXXXXXXX.png', '2018-12-10 19:58:00.000000', '性价比高', 1, 1);
INSERT INTO `shop_brand` VALUES (2, 'Filorga/菲洛嘉', 'FILORGA菲洛嘉采用“更好的自己”作为其品牌哲学，使女性自然和谐的表情洋溢在脸上。', 17, 1, 'brand/2018/12/a1ec08fa513d269712a7e69f59fbb2fb4216d8f8.jpg', '2018-12-11 02:14:00.000000', '进口 奢华', 2, 2);
INSERT INTO `shop_brand` VALUES (3, '良品铺子', '坚果网店', 1, 0, 'brand/2018/12/4G23CP86MYMKHQCLJD4.png', '2018-12-19 05:03:00.000000', '好吃', 3, 3);
INSERT INTO `shop_brand` VALUES (4, '爱德堡', '高档鞋子专卖', 0, 0, 'brand/2018/12/9UD1015V5FUQD2FL3K.png', '2018-12-19 05:13:00.000000', '专业皮鞋', 4, 4);

-- ----------------------------
-- Table structure for shop_brandtoshop
-- ----------------------------
DROP TABLE IF EXISTS `shop_brandtoshop`;
CREATE TABLE `shop_brandtoshop`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `BrandName_id` int(11) NOT NULL,
  `ShopName_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `shop_brandtoshop_BrandName_id_baff74ba_fk_shop_brand_id`(`BrandName_id`) USING BTREE,
  INDEX `shop_brandtoshop_ShopName_id_8e545910_fk_shop_shop_id`(`ShopName_id`) USING BTREE,
  CONSTRAINT `shop_brandtoshop_BrandName_id_baff74ba_fk_shop_brand_id` FOREIGN KEY (`BrandName_id`) REFERENCES `shop_brand` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `shop_brandtoshop_ShopName_id_8e545910_fk_shop_shop_id` FOREIGN KEY (`ShopName_id`) REFERENCES `shop_shop` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shop_brandtoshop
-- ----------------------------
INSERT INTO `shop_brandtoshop` VALUES (1, 1, 1);
INSERT INTO `shop_brandtoshop` VALUES (2, 2, 2);
INSERT INTO `shop_brandtoshop` VALUES (3, 3, 3);
INSERT INTO `shop_brandtoshop` VALUES (4, 4, 4);

-- ----------------------------
-- Table structure for shop_city
-- ----------------------------
DROP TABLE IF EXISTS `shop_city`;
CREATE TABLE `shop_city`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CityName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shop_city
-- ----------------------------
INSERT INTO `shop_city` VALUES (1, '北京');
INSERT INTO `shop_city` VALUES (2, '杭州');
INSERT INTO `shop_city` VALUES (3, '西安');

-- ----------------------------
-- Table structure for shop_kindtoshop
-- ----------------------------
DROP TABLE IF EXISTS `shop_kindtoshop`;
CREATE TABLE `shop_kindtoshop`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `KindName_id` int(11) NOT NULL,
  `ShopName_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `shop_kindtoshop_KindName_id_1167bc5d_fk_shop_salekind_id`(`KindName_id`) USING BTREE,
  INDEX `shop_kindtoshop_ShopName_id_41dadc76_fk_shop_shop_id`(`ShopName_id`) USING BTREE,
  CONSTRAINT `shop_kindtoshop_KindName_id_1167bc5d_fk_shop_salekind_id` FOREIGN KEY (`KindName_id`) REFERENCES `shop_salekind` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `shop_kindtoshop_ShopName_id_41dadc76_fk_shop_shop_id` FOREIGN KEY (`ShopName_id`) REFERENCES `shop_shop` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shop_kindtoshop
-- ----------------------------
INSERT INTO `shop_kindtoshop` VALUES (1, 1, 1);
INSERT INTO `shop_kindtoshop` VALUES (2, 2, 2);
INSERT INTO `shop_kindtoshop` VALUES (3, 3, 3);
INSERT INTO `shop_kindtoshop` VALUES (4, 4, 4);

-- ----------------------------
-- Table structure for shop_salekind
-- ----------------------------
DROP TABLE IF EXISTS `shop_salekind`;
CREATE TABLE `shop_salekind`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `KindName` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shop_salekind
-- ----------------------------
INSERT INTO `shop_salekind` VALUES (1, '手机');
INSERT INTO `shop_salekind` VALUES (2, '化妆品');
INSERT INTO `shop_salekind` VALUES (3, '食品');
INSERT INTO `shop_salekind` VALUES (4, '服饰');

-- ----------------------------
-- Table structure for shop_shop
-- ----------------------------
DROP TABLE IF EXISTS `shop_shop`;
CREATE TABLE `shop_shop`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ShopName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ShopDesc` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ShopKind` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ShopTag` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ClickNum` int(11) NOT NULL,
  `LikeNum` int(11) NOT NULL,
  `ShopImage` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ShopDate` datetime(6) NULL,
  `DealNum` int(11) NOT NULL,
  `Location_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `shop_shop_Location_id_960fc1ee_fk_shop_city_id`(`Location_id`) USING BTREE,
  CONSTRAINT `shop_shop_Location_id_960fc1ee_fk_shop_city_id` FOREIGN KEY (`Location_id`) REFERENCES `shop_city` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shop_shop
-- ----------------------------
INSERT INTO `shop_shop` VALUES (1, '小米官方旗舰店', '<p>&nbsp; &nbsp;<img src=\"/media/shop/ueditor/ZIAHTGYQ_OX2})J{U2FWM{1_20181219043455_791.png\" title=\"\" alt=\"ZIAHTGYQ_OX2})J{U2FWM{1.png\" width=\"774\" height=\"435\" style=\"width: 774px; height: 435px;\"/> </p><p><img src=\"/media/shop/ueditor/ZRA`_)_I%RFF)2)1H$[JM$6_20181219044227_715.png\" title=\"\" alt=\"ZRA`_)_I%RFF)2)1H$[JM$6.png\" width=\"808\" height=\"340\" style=\"width: 808px; height: 340px;\"/></p>', 'BrandShop', '性价比高', 71, 2, 'shop/2018/12/TB1r23ZRXXXXXaxXXXXXXXXXXXX.png', '北京市中关村', '2018-12-10 19:53:00.000000', 0, 1);
INSERT INTO `shop_shop` VALUES (2, '天猫国际', '<p><img src=\"/media/shop/ueditor/BJ0X83)F33@3CH[E)HM2AN1_20181219044606_739.png\" title=\"\" alt=\"BJ0X83)F33@3CH[E)HM2AN1.png\" width=\"1318\" height=\"726\" style=\"width: 1318px; height: 726px;\"/></p>', 'official', '正品保障', 14, 1, 'shop/2018/12/9c16fdfaaf51f3de4ea7074398eef01f3a297984.jpg', '杭州阿里园区', '2018-12-11 02:08:00.000000', 0, 2);
INSERT INTO `shop_shop` VALUES (3, '良品铺子官方直营店', '<p><img src=\"/media/shop/ueditor/7_Y8TL_F51VH9)3{V`Q6BCO_20181219050331_545.png\" title=\"\" alt=\"7_Y8TL_F51VH9)3{V`Q6BCO.png\"/></p>', 'BrandShop', '好吃 实惠', 1, 0, 'shop/2018/12/4G23CP86MYMKHQCLJD4.png', '西安市雁塔区', '2018-12-19 05:01:00.000000', 0, 3);
INSERT INTO `shop_shop` VALUES (4, '爱德堡旗舰店', '<p><img src=\"/media/shop/ueditor/63M%2ZIG(S8]`0B3GK1JRFV_20181219051226_373.png\" title=\"\" alt=\"63M%2ZIG(S8]`0B3GK1JRFV.png\"/></p>', 'BrandShop', '专业鞋店', 0, 0, 'shop/2018/12/9UD1015V5FUQD2FL3K.png', '北京市西单', '2018-12-19 05:11:00.000000', 0, 1);

-- ----------------------------
-- Table structure for useroperate_userbuy
-- ----------------------------
DROP TABLE IF EXISTS `useroperate_userbuy`;
CREATE TABLE `useroperate_userbuy`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `BuyTime` datetime(6) NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userOperate_userbuy_product_id_7a516d98_fk_commodity_product_id`(`product_id`) USING BTREE,
  INDEX `userOperate_userbuy_user_id_8b1a75a9_fk_users_userinfo_id`(`user_id`) USING BTREE,
  CONSTRAINT `userOperate_userbuy_product_id_7a516d98_fk_commodity_product_id` FOREIGN KEY (`product_id`) REFERENCES `commodity_product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `userOperate_userbuy_user_id_8b1a75a9_fk_users_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `users_userinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of useroperate_userbuy
-- ----------------------------
INSERT INTO `useroperate_userbuy` VALUES (1, '2018-12-10 20:34:21.502931', 1, 1);
INSERT INTO `useroperate_userbuy` VALUES (2, '2018-12-10 21:21:36.868614', 1, 2);
INSERT INTO `useroperate_userbuy` VALUES (3, '2018-12-11 02:19:53.238133', 2, 1);
INSERT INTO `useroperate_userbuy` VALUES (4, '2018-12-11 02:36:50.555563', 2, 2);
INSERT INTO `useroperate_userbuy` VALUES (8, '2018-12-12 01:19:44.694530', 1, 1);
INSERT INTO `useroperate_userbuy` VALUES (9, '2018-12-17 16:57:38.322890', 2, 1);
INSERT INTO `useroperate_userbuy` VALUES (10, '2018-12-17 16:57:59.180300', 1, 1);
INSERT INTO `useroperate_userbuy` VALUES (13, '2018-12-19 04:24:00.338580', 2, 1);
INSERT INTO `useroperate_userbuy` VALUES (14, '2018-12-21 00:52:40.596825', 4, 1);
INSERT INTO `useroperate_userbuy` VALUES (15, '2018-12-21 15:06:02.748320', 5, 1);
INSERT INTO `useroperate_userbuy` VALUES (16, '2018-12-21 15:06:42.997565', 1, 1);

-- ----------------------------
-- Table structure for useroperate_usercomments
-- ----------------------------
DROP TABLE IF EXISTS `useroperate_usercomments`;
CREATE TABLE `useroperate_usercomments`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CommentTime` datetime(6) NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userOperate_usercomm_product_id_378c2132_fk_commodity`(`product_id`) USING BTREE,
  INDEX `userOperate_usercomments_user_id_44fce86f_fk_users_userinfo_id`(`user_id`) USING BTREE,
  CONSTRAINT `userOperate_usercomm_product_id_378c2132_fk_commodity` FOREIGN KEY (`product_id`) REFERENCES `commodity_product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `userOperate_usercomments_user_id_44fce86f_fk_users_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `users_userinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of useroperate_usercomments
-- ----------------------------
INSERT INTO `useroperate_usercomments` VALUES (1, 'iahsih', '2018-12-11 00:15:37.065290', 1, 2);
INSERT INTO `useroperate_usercomments` VALUES (2, '真的好好用啊！！！！', '2018-12-11 02:37:02.977881', 2, 2);
INSERT INTO `useroperate_usercomments` VALUES (3, '不怎么样啊！', '2018-12-11 02:39:07.838166', 1, 1);
INSERT INTO `useroperate_usercomments` VALUES (4, 'asd', '2018-12-17 17:47:28.933134', 1, 1);
INSERT INTO `useroperate_usercomments` VALUES (5, '还不错哟', '2018-12-17 17:51:10.109991', 2, 1);
INSERT INTO `useroperate_usercomments` VALUES (6, '哎呦不错哦', '2018-12-18 03:10:08.442335', 1, 1);
INSERT INTO `useroperate_usercomments` VALUES (7, '很好的手机！！！', '2018-12-21 00:53:35.018195', 3, 1);
INSERT INTO `useroperate_usercomments` VALUES (8, 'dfgdfgd', '2018-12-21 15:06:59.602686', 1, 1);

-- ----------------------------
-- Table structure for useroperate_userlove
-- ----------------------------
DROP TABLE IF EXISTS `useroperate_userlove`;
CREATE TABLE `useroperate_userlove`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `LoveId` int(11) NOT NULL,
  `LoveType` int(11) NOT NULL,
  `LoveTime` datetime(6) NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userOperate_userlove_user_id_4c792ace_fk_users_userinfo_id`(`user_id`) USING BTREE,
  CONSTRAINT `userOperate_userlove_user_id_4c792ace_fk_users_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `users_userinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of useroperate_userlove
-- ----------------------------
INSERT INTO `useroperate_userlove` VALUES (1, 1, 1, '2018-12-11 00:23:33.421896', 2);
INSERT INTO `useroperate_userlove` VALUES (2, 1, 2, '2018-12-11 00:23:38.778441', 2);
INSERT INTO `useroperate_userlove` VALUES (8, 2, 3, '2018-12-11 02:30:21.561024', 1);
INSERT INTO `useroperate_userlove` VALUES (11, 2, 2, '2018-12-17 18:04:03.671874', 1);
INSERT INTO `useroperate_userlove` VALUES (12, 1, 1, '2018-12-18 03:09:42.505493', 1);
INSERT INTO `useroperate_userlove` VALUES (13, 1, 2, '2018-12-19 04:17:19.418468', 1);
INSERT INTO `useroperate_userlove` VALUES (14, 5, 1, '2018-12-21 15:06:00.933577', 1);

-- ----------------------------
-- Table structure for useroperate_usermessage
-- ----------------------------
DROP TABLE IF EXISTS `useroperate_usermessage`;
CREATE TABLE `useroperate_usermessage`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `message` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `haveRead` tinyint(1) NOT NULL,
  `SendTime` datetime(6) NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of useroperate_usermessage
-- ----------------------------
INSERT INTO `useroperate_usermessage` VALUES (1, 2, '欢迎注册成为淘淘乐用户! --系统自动消息', 1, '2018-12-10 20:21:35.400395');
INSERT INTO `useroperate_usermessage` VALUES (2, 3, '欢迎注册成为淘淘乐用户! --系统自动消息', 0, '2018-12-21 00:39:28.081752');

-- ----------------------------
-- Table structure for users_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `users_userinfo`;
CREATE TABLE `users_userinfo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NULL,
  `nick_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Age` int(11) NOT NULL,
  `gender` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mobileNumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userImage` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_userinfo
-- ----------------------------
INSERT INTO `users_userinfo` VALUES (1, 'pbkdf2_sha256$100000$i9J7hrjQ5ilm$GJCFy+vlMOunQTiDREEmgbHhTacMhr+Cy6KMSPWYP5Y=', '2018-12-21 15:05:36.346137', 1, 'jy0205', '', '', '15652579915@163.com', 1, 1, '2018-12-10 19:49:10.263554', 'OhMyGakki', 20, 'male', '15652579915', 'ChangPing', 'image/2018/12/15144398193808_aeHsUSP.jpg');
INSERT INTO `users_userinfo` VALUES (2, 'pbkdf2_sha256$100000$RB48nB8ZSGg6$7jgiFikfTZD6UC43ds7b6P2aDKA7JRLl33xsMX3HGv8=', '2018-12-11 02:35:17.497167', 0, '1254365614@qq.com', '', '', '1254365614@qq.com', 0, 1, '2018-12-10 20:21:35.233840', '一颗小白菜', 21, 'female', '13891418580', '北京航空航天大学', 'image/2018/12/20151015222835_Sntkv.jpeg');

-- ----------------------------
-- Table structure for users_userinfo_groups
-- ----------------------------
DROP TABLE IF EXISTS `users_userinfo_groups`;
CREATE TABLE `users_userinfo_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userinfo_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_userinfo_groups_userinfo_id_group_id_cea24743_uniq`(`userinfo_id`, `group_id`) USING BTREE,
  INDEX `users_userinfo_groups_group_id_8666291f_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `users_userinfo_groups_group_id_8666291f_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_userinfo_groups_userinfo_id_0564c3d4_fk_users_userinfo_id` FOREIGN KEY (`userinfo_id`) REFERENCES `users_userinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users_userinfo_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `users_userinfo_user_permissions`;
CREATE TABLE `users_userinfo_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userinfo_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_userinfo_user_perm_userinfo_id_permission_i_65ffd654_uniq`(`userinfo_id`, `permission_id`) USING BTREE,
  INDEX `users_userinfo_user__permission_id_c4a43efe_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `users_userinfo_user__permission_id_c4a43efe_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_userinfo_user__userinfo_id_255c933e_fk_users_use` FOREIGN KEY (`userinfo_id`) REFERENCES `users_userinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users_verifycode
-- ----------------------------
DROP TABLE IF EXISTS `users_verifycode`;
CREATE TABLE `users_verifycode`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sendTime` datetime(6) NULL,
  `emailType` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_verifycode
-- ----------------------------
INSERT INTO `users_verifycode` VALUES (1, 'GItFu9kaOJFOmkQ', '1254365614@qq.com', '2018-12-10 20:21:35.434305', '');
INSERT INTO `users_verifycode` VALUES (2, 'UYJr7NxAUCF37VG', '15652579915@163.com', '2018-12-20 23:54:41.169678', '');
INSERT INTO `users_verifycode` VALUES (3, 'p2WWOvp1jsMJuNS', '15652579915@163.com', '2018-12-21 00:03:57.085578', '');
INSERT INTO `users_verifycode` VALUES (4, '6LXmo9c7SvL2AbL', '15652579915@163.com', '2018-12-21 00:09:54.677595', '');
INSERT INTO `users_verifycode` VALUES (5, 'q9LoldvdvcEhnAt', 'jy0205@buaa.edu.cn', '2018-12-21 00:39:28.115662', '');
INSERT INTO `users_verifycode` VALUES (6, 'dFeRhoXvmBMK2zc', 'jy0205@buaa.edu.cn', '2018-12-21 00:42:58.711311', '');

-- ----------------------------
-- Table structure for xadmin_bookmark
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_bookmark`;
CREATE TABLE `xadmin_bookmark`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `query` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_bookmark_content_type_id_60941679_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `xadmin_bookmark_user_id_42d307fc_fk_users_userinfo_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `users_userinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for xadmin_log
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_log`;
CREATE TABLE `xadmin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NULL,
  `ip_addr` char(39) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id`(`content_type_id`) USING BTREE,
  INDEX `xadmin_log_user_id_bb16a176_fk_users_userinfo_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `users_userinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xadmin_log
-- ----------------------------
INSERT INTO `xadmin_log` VALUES (1, '2018-12-10 19:53:24.210821', '127.0.0.1', '1', '北京', 'create', '已添加。', 10, 1);
INSERT INTO `xadmin_log` VALUES (2, '2018-12-10 19:53:30.007568', '127.0.0.1', '1', '手机', 'create', '已添加。', 14, 1);
INSERT INTO `xadmin_log` VALUES (3, '2018-12-10 19:58:06.024117', '127.0.0.1', '1', '店铺: 小米官方旗舰店', 'create', '已添加。', 12, 1);
INSERT INTO `xadmin_log` VALUES (4, '2018-12-10 20:00:03.379758', '127.0.0.1', '1', '小米', 'create', '已添加。', 13, 1);
INSERT INTO `xadmin_log` VALUES (5, '2018-12-10 20:00:12.607977', '127.0.0.1', '1', '店铺店铺: 小米官方旗舰店售卖品牌小米', 'create', '已添加。', 11, 1);
INSERT INTO `xadmin_log` VALUES (6, '2018-12-10 20:00:20.084183', '127.0.0.1', '1', '店铺店铺: 小米官方旗舰店售卖产品种类手机', 'create', '已添加。', 15, 1);
INSERT INTO `xadmin_log` VALUES (7, '2018-12-10 20:04:02.439320', '127.0.0.1', '1', '小米8 屏幕指纹版', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (8, '2018-12-10 20:31:29.001843', '127.0.0.1', '1', '小米8 屏幕指纹版', 'change', '修改 product_shop', 9, 1);
INSERT INTO `xadmin_log` VALUES (9, '2018-12-11 01:58:49.013755', '127.0.0.1', '2', '1(位于第100位)', 'create', '已添加。', 8, 1);
INSERT INTO `xadmin_log` VALUES (10, '2018-12-11 01:59:10.978538', '127.0.0.1', '3', '2(位于第100位)', 'create', '已添加。', 8, 1);
INSERT INTO `xadmin_log` VALUES (11, '2018-12-11 01:59:26.169368', '127.0.0.1', '4', '3(位于第100位)', 'create', '已添加。', 8, 1);
INSERT INTO `xadmin_log` VALUES (12, '2018-12-11 01:59:41.713017', '127.0.0.1', '5', '4(位于第100位)', 'create', '已添加。', 8, 1);
INSERT INTO `xadmin_log` VALUES (13, '2018-12-11 02:08:28.393855', '127.0.0.1', '2', '化妆品', 'create', '已添加。', 14, 1);
INSERT INTO `xadmin_log` VALUES (14, '2018-12-11 02:13:49.352746', '127.0.0.1', '2', '店铺: 天猫国际', 'create', '已添加。', 12, 1);
INSERT INTO `xadmin_log` VALUES (15, '2018-12-11 02:13:58.506386', '127.0.0.1', '2', '杭州', 'create', '已添加。', 10, 1);
INSERT INTO `xadmin_log` VALUES (16, '2018-12-11 02:14:20.395546', '127.0.0.1', '2', '店铺: 天猫国际', 'change', '修改 Location 和 address', 12, 1);
INSERT INTO `xadmin_log` VALUES (17, '2018-12-11 02:16:20.381471', '127.0.0.1', '2', 'Filorga/菲洛嘉', 'create', '已添加。', 13, 1);
INSERT INTO `xadmin_log` VALUES (18, '2018-12-11 02:16:31.889702', '127.0.0.1', '2', '店铺店铺: 天猫国际售卖品牌Filorga/菲洛嘉', 'create', '已添加。', 11, 1);
INSERT INTO `xadmin_log` VALUES (19, '2018-12-11 02:16:40.530466', '127.0.0.1', '2', '店铺店铺: 天猫国际售卖产品种类化妆品', 'create', '已添加。', 15, 1);
INSERT INTO `xadmin_log` VALUES (20, '2018-12-11 02:19:17.685772', '127.0.0.1', '2', '进口柔滑亮泽焕颜面膜', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (21, '2018-12-18 01:42:56.508064', '127.0.0.1', '2', '进口柔滑亮泽焕颜面膜', 'change', '修改 ProductInfo', 9, 1);
INSERT INTO `xadmin_log` VALUES (22, '2018-12-18 01:45:12.937208', '127.0.0.1', '2', '进口柔滑亮泽焕颜面膜', 'change', '修改 ProductInfo', 9, 1);
INSERT INTO `xadmin_log` VALUES (23, '2018-12-18 01:50:29.100471', '127.0.0.1', '2', '进口柔滑亮泽焕颜面膜', 'change', '修改 ProductInfo', 9, 1);
INSERT INTO `xadmin_log` VALUES (24, '2018-12-18 01:51:27.081211', '127.0.0.1', '2', '进口柔滑亮泽焕颜面膜', 'change', '修改 ProductInfo', 9, 1);
INSERT INTO `xadmin_log` VALUES (25, '2018-12-18 01:52:55.388165', '127.0.0.1', '2', '进口柔滑亮泽焕颜面膜', 'change', '修改 ProductInfo', 9, 1);
INSERT INTO `xadmin_log` VALUES (26, '2018-12-19 04:34:58.670258', '127.0.0.1', '1', '店铺: 小米官方旗舰店', 'change', '修改 ShopDesc', 12, 1);
INSERT INTO `xadmin_log` VALUES (27, '2018-12-19 04:36:29.970397', '127.0.0.1', '1', '店铺: 小米官方旗舰店', 'change', '修改 ShopDesc', 12, 1);
INSERT INTO `xadmin_log` VALUES (28, '2018-12-19 04:41:08.251703', '127.0.0.1', '1', '店铺: 小米官方旗舰店', 'change', '修改 ShopDesc', 12, 1);
INSERT INTO `xadmin_log` VALUES (29, '2018-12-19 04:43:22.859128', '127.0.0.1', '1', '店铺: 小米官方旗舰店', 'change', '修改 ShopDesc', 12, 1);
INSERT INTO `xadmin_log` VALUES (30, '2018-12-19 04:46:27.178903', '127.0.0.1', '2', '店铺: 天猫国际', 'change', '修改 ShopDesc', 12, 1);
INSERT INTO `xadmin_log` VALUES (31, '2018-12-19 04:48:30.723518', '127.0.0.1', '1', '小米8 屏幕指纹版', 'change', '修改 ProductInfo', 9, 1);
INSERT INTO `xadmin_log` VALUES (32, '2018-12-19 04:51:22.368279', '127.0.0.1', '1', '小米8 屏幕指纹版', 'change', '修改 ProductInfo', 9, 1);
INSERT INTO `xadmin_log` VALUES (33, '2018-12-19 04:56:46.497265', '127.0.0.1', '3', '小米MIX 3', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (34, '2018-12-19 05:00:39.799562', '127.0.0.1', '3', '西安', 'create', '已添加。', 10, 1);
INSERT INTO `xadmin_log` VALUES (35, '2018-12-19 05:00:53.932575', '127.0.0.1', '3', '食品', 'create', '已添加。', 14, 1);
INSERT INTO `xadmin_log` VALUES (36, '2018-12-19 05:03:38.055314', '127.0.0.1', '3', '店铺: 良品铺子官方直营店', 'create', '已添加。', 12, 1);
INSERT INTO `xadmin_log` VALUES (37, '2018-12-19 05:04:45.124631', '127.0.0.1', '3', '良品铺子', 'create', '已添加。', 13, 1);
INSERT INTO `xadmin_log` VALUES (38, '2018-12-19 05:04:55.831328', '127.0.0.1', '3', '店铺店铺: 良品铺子官方直营店售卖品牌良品铺子', 'create', '已添加。', 11, 1);
INSERT INTO `xadmin_log` VALUES (39, '2018-12-19 05:05:04.680644', '127.0.0.1', '3', '店铺店铺: 良品铺子官方直营店售卖产品种类食品', 'create', '已添加。', 15, 1);
INSERT INTO `xadmin_log` VALUES (40, '2018-12-19 05:10:03.048164', '127.0.0.1', '4', '东北红松子', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (41, '2018-12-19 05:11:42.932590', '127.0.0.1', '4', '服饰', 'create', '已添加。', 14, 1);
INSERT INTO `xadmin_log` VALUES (42, '2018-12-19 05:13:26.758109', '127.0.0.1', '4', '店铺: 爱德堡旗舰店', 'create', '已添加。', 12, 1);
INSERT INTO `xadmin_log` VALUES (43, '2018-12-19 05:14:27.427179', '127.0.0.1', '4', '爱德堡', 'create', '已添加。', 13, 1);
INSERT INTO `xadmin_log` VALUES (44, '2018-12-19 05:14:40.054266', '127.0.0.1', '4', '店铺店铺: 爱德堡旗舰店售卖品牌爱德堡', 'create', '已添加。', 11, 1);
INSERT INTO `xadmin_log` VALUES (45, '2018-12-19 05:14:49.522707', '127.0.0.1', '4', '店铺店铺: 爱德堡旗舰店售卖产品种类服饰', 'create', '已添加。', 15, 1);
INSERT INTO `xadmin_log` VALUES (46, '2018-12-19 05:18:37.106987', '127.0.0.1', '5', '爱得堡马丁靴男短靴', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (47, '2018-12-21 01:03:07.412324', '127.0.0.1', '6', '专研紧塑精华素', 'create', '已添加。', 9, 1);

-- ----------------------------
-- Table structure for xadmin_usersettings
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_usersettings`;
CREATE TABLE `xadmin_usersettings`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_usersettings_user_id_edeabe4a_fk_users_userinfo_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `users_userinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
INSERT INTO `xadmin_usersettings` VALUES (1, 'dashboard:home:pos', '', 1);
INSERT INTO `xadmin_usersettings` VALUES (2, 'site-theme', '/static/xadmin/css/themes/bootstrap-xadmin.css', 1);

-- ----------------------------
-- Table structure for xadmin_userwidget
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_userwidget`;
CREATE TABLE `xadmin_userwidget`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `widget_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_userwidget_user_id_c159233a_fk_users_userinfo_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `users_userinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Procedure structure for find_all_product
-- ----------------------------
DROP PROCEDURE IF EXISTS `find_all_product`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `find_all_product`()
begin
select * from commodity_product;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for find_product_detail
-- ----------------------------
DROP PROCEDURE IF EXISTS `find_product_detail`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `find_product_detail`(in newid int)
begin
select tag from commodity_product where id = newid;
select comments from useroperate_usercomments where product_id = newid;
update commodity_product set ClickNum = ClickNum + 1 where id = newid;
end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
