/*
 Navicat Premium Data Transfer

 Source Server         : win7
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : localhost:3306
 Source Schema         : bighousework

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 27/11/2022 19:36:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for app01_admin
-- ----------------------------
DROP TABLE IF EXISTS `app01_admin`;
CREATE TABLE `app01_admin`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app01_admin
-- ----------------------------
INSERT INTO `app01_admin` VALUES (1, 'admin', '17662f3ec687247a1ec6e2cbf8388280');
INSERT INTO `app01_admin` VALUES (2, 'gp0516', '0ef934721f0a2af6977c02c640371a57');

-- ----------------------------
-- Table structure for app01_department
-- ----------------------------
DROP TABLE IF EXISTS `app01_department`;
CREATE TABLE `app01_department`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app01_department
-- ----------------------------
INSERT INTO `app01_department` VALUES (1, '人事');
INSERT INTO `app01_department` VALUES (2, '采购');

-- ----------------------------
-- Table structure for app01_equipment
-- ----------------------------
DROP TABLE IF EXISTS `app01_equipment`;
CREATE TABLE `app01_equipment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `MAC` int NOT NULL,
  `title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `detail` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` smallint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app01_equipment
-- ----------------------------
INSERT INTO `app01_equipment` VALUES (1, 111, '11', '111', 2);

-- ----------------------------
-- Table structure for app01_iot01
-- ----------------------------
DROP TABLE IF EXISTS `app01_iot01`;
CREATE TABLE `app01_iot01`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `Temp` decimal(10, 2) NOT NULL,
  `Hum` decimal(10, 2) NOT NULL,
  `PM` decimal(10, 2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app01_iot01
-- ----------------------------

-- ----------------------------
-- Table structure for app01_iot02
-- ----------------------------
DROP TABLE IF EXISTS `app01_iot02`;
CREATE TABLE `app01_iot02`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `CO` decimal(10, 2) NOT NULL,
  `CO2` decimal(10, 2) NOT NULL,
  `SO2` decimal(10, 2) NOT NULL,
  `NO2` decimal(10, 2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app01_iot02
-- ----------------------------

-- ----------------------------
-- Table structure for app01_iot03
-- ----------------------------
DROP TABLE IF EXISTS `app01_iot03`;
CREATE TABLE `app01_iot03`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `WS` decimal(10, 2) NOT NULL,
  `WD` decimal(10, 2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app01_iot03
-- ----------------------------

-- ----------------------------
-- Table structure for app01_order
-- ----------------------------
DROP TABLE IF EXISTS `app01_order`;
CREATE TABLE `app01_order`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `oid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `price` int NOT NULL,
  `status` smallint NOT NULL,
  `admin_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `app01_order_admin_id_06590413_fk_app01_admin_id`(`admin_id` ASC) USING BTREE,
  CONSTRAINT `app01_order_admin_id_06590413_fk_app01_admin_id` FOREIGN KEY (`admin_id`) REFERENCES `app01_admin` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app01_order
-- ----------------------------
INSERT INTO `app01_order` VALUES (1, '202211271141553493', '李文', 30, 1, 1);

-- ----------------------------
-- Table structure for app01_prettynum
-- ----------------------------
DROP TABLE IF EXISTS `app01_prettynum`;
CREATE TABLE `app01_prettynum`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `price` int NOT NULL,
  `level` smallint NOT NULL,
  `status` smallint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app01_prettynum
-- ----------------------------
INSERT INTO `app01_prettynum` VALUES (1, '17770000000', 200, 1, 2);

-- ----------------------------
-- Table structure for app01_task
-- ----------------------------
DROP TABLE IF EXISTS `app01_task`;
CREATE TABLE `app01_task`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `level` smallint NOT NULL,
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `detail` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `app01_task_user_id_93daa16a_fk_app01_admin_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `app01_task_user_id_93daa16a_fk_app01_admin_id` FOREIGN KEY (`user_id`) REFERENCES `app01_admin` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app01_task
-- ----------------------------
INSERT INTO `app01_task` VALUES (1, 2, '缴费20', '无', 1);

-- ----------------------------
-- Table structure for app01_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `app01_userinfo`;
CREATE TABLE `app01_userinfo`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `age` int NOT NULL,
  `account` decimal(10, 2) NOT NULL,
  `create_time` date NOT NULL,
  `gender` smallint NOT NULL,
  `depart_id_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `app01_userinfo_depart_id_id_bdf724cb_fk_app01_department_id`(`depart_id_id` ASC) USING BTREE,
  CONSTRAINT `app01_userinfo_depart_id_id_bdf724cb_fk_app01_department_id` FOREIGN KEY (`depart_id_id`) REFERENCES `app01_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app01_userinfo
-- ----------------------------
INSERT INTO `app01_userinfo` VALUES (3, '李文豪', '123456', 31, 1000.00, '2022-11-10', 1, 1);
INSERT INTO `app01_userinfo` VALUES (4, '高辉会', '123456', 30, 300.00, '2022-11-10', 1, 2);

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id` ASC, `codename` ASC) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add admin', 7, 'add_admin');
INSERT INTO `auth_permission` VALUES (26, 'Can change admin', 7, 'change_admin');
INSERT INTO `auth_permission` VALUES (27, 'Can delete admin', 7, 'delete_admin');
INSERT INTO `auth_permission` VALUES (28, 'Can view admin', 7, 'view_admin');
INSERT INTO `auth_permission` VALUES (29, 'Can add department', 8, 'add_department');
INSERT INTO `auth_permission` VALUES (30, 'Can change department', 8, 'change_department');
INSERT INTO `auth_permission` VALUES (31, 'Can delete department', 8, 'delete_department');
INSERT INTO `auth_permission` VALUES (32, 'Can view department', 8, 'view_department');
INSERT INTO `auth_permission` VALUES (33, 'Can add equipment', 9, 'add_equipment');
INSERT INTO `auth_permission` VALUES (34, 'Can change equipment', 9, 'change_equipment');
INSERT INTO `auth_permission` VALUES (35, 'Can delete equipment', 9, 'delete_equipment');
INSERT INTO `auth_permission` VALUES (36, 'Can view equipment', 9, 'view_equipment');
INSERT INTO `auth_permission` VALUES (37, 'Can add iot01', 10, 'add_iot01');
INSERT INTO `auth_permission` VALUES (38, 'Can change iot01', 10, 'change_iot01');
INSERT INTO `auth_permission` VALUES (39, 'Can delete iot01', 10, 'delete_iot01');
INSERT INTO `auth_permission` VALUES (40, 'Can view iot01', 10, 'view_iot01');
INSERT INTO `auth_permission` VALUES (41, 'Can add iot02', 11, 'add_iot02');
INSERT INTO `auth_permission` VALUES (42, 'Can change iot02', 11, 'change_iot02');
INSERT INTO `auth_permission` VALUES (43, 'Can delete iot02', 11, 'delete_iot02');
INSERT INTO `auth_permission` VALUES (44, 'Can view iot02', 11, 'view_iot02');
INSERT INTO `auth_permission` VALUES (45, 'Can add iot03', 12, 'add_iot03');
INSERT INTO `auth_permission` VALUES (46, 'Can change iot03', 12, 'change_iot03');
INSERT INTO `auth_permission` VALUES (47, 'Can delete iot03', 12, 'delete_iot03');
INSERT INTO `auth_permission` VALUES (48, 'Can view iot03', 12, 'view_iot03');
INSERT INTO `auth_permission` VALUES (49, 'Can add pretty num', 13, 'add_prettynum');
INSERT INTO `auth_permission` VALUES (50, 'Can change pretty num', 13, 'change_prettynum');
INSERT INTO `auth_permission` VALUES (51, 'Can delete pretty num', 13, 'delete_prettynum');
INSERT INTO `auth_permission` VALUES (52, 'Can view pretty num', 13, 'view_prettynum');
INSERT INTO `auth_permission` VALUES (53, 'Can add user info', 14, 'add_userinfo');
INSERT INTO `auth_permission` VALUES (54, 'Can change user info', 14, 'change_userinfo');
INSERT INTO `auth_permission` VALUES (55, 'Can delete user info', 14, 'delete_userinfo');
INSERT INTO `auth_permission` VALUES (56, 'Can view user info', 14, 'view_userinfo');
INSERT INTO `auth_permission` VALUES (57, 'Can add task', 15, 'add_task');
INSERT INTO `auth_permission` VALUES (58, 'Can change task', 15, 'change_task');
INSERT INTO `auth_permission` VALUES (59, 'Can delete task', 15, 'delete_task');
INSERT INTO `auth_permission` VALUES (60, 'Can view task', 15, 'view_task');
INSERT INTO `auth_permission` VALUES (61, 'Can add order', 16, 'add_order');
INSERT INTO `auth_permission` VALUES (62, 'Can change order', 16, 'change_order');
INSERT INTO `auth_permission` VALUES (63, 'Can delete order', 16, 'delete_order');
INSERT INTO `auth_permission` VALUES (64, 'Can view order', 16, 'view_order');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id` ASC, `group_id` ASC) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id` ASC) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int NULL DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id` ASC) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_chk_1` CHECK (`action_flag` >= 0)
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label` ASC, `model` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (7, 'app01', 'admin');
INSERT INTO `django_content_type` VALUES (8, 'app01', 'department');
INSERT INTO `django_content_type` VALUES (9, 'app01', 'equipment');
INSERT INTO `django_content_type` VALUES (10, 'app01', 'iot01');
INSERT INTO `django_content_type` VALUES (11, 'app01', 'iot02');
INSERT INTO `django_content_type` VALUES (12, 'app01', 'iot03');
INSERT INTO `django_content_type` VALUES (16, 'app01', 'order');
INSERT INTO `django_content_type` VALUES (13, 'app01', 'prettynum');
INSERT INTO `django_content_type` VALUES (15, 'app01', 'task');
INSERT INTO `django_content_type` VALUES (14, 'app01', 'userinfo');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2022-11-26 07:27:36.464000');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2022-11-26 07:27:36.625000');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2022-11-26 07:27:37.109000');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2022-11-26 07:27:37.214000');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2022-11-26 07:27:37.224000');
INSERT INTO `django_migrations` VALUES (6, 'app01', '0001_initial', '2022-11-26 07:27:38.702000');
INSERT INTO `django_migrations` VALUES (7, 'contenttypes', '0002_remove_content_type_name', '2022-11-26 07:27:41.797000');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0002_alter_permission_name_max_length', '2022-11-26 07:27:42.326000');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0003_alter_user_email_max_length', '2022-11-26 07:27:42.431000');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0004_alter_user_username_opts', '2022-11-26 07:27:42.454000');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0005_alter_user_last_login_null', '2022-11-26 07:27:42.725000');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0006_require_contenttypes_0002', '2022-11-26 07:27:42.745000');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0007_alter_validators_add_error_messages', '2022-11-26 07:27:42.795000');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0008_alter_user_username_max_length', '2022-11-26 07:27:43.112000');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0009_alter_user_last_name_max_length', '2022-11-26 07:27:43.453000');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0010_alter_group_name_max_length', '2022-11-26 07:27:43.507000');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0011_update_proxy_permissions', '2022-11-26 07:27:43.531000');
INSERT INTO `django_migrations` VALUES (18, 'auth', '0012_alter_user_first_name_max_length', '2022-11-26 07:27:43.837000');
INSERT INTO `django_migrations` VALUES (19, 'sessions', '0001_initial', '2022-11-26 07:27:44.086000');
INSERT INTO `django_migrations` VALUES (20, 'app01', '0002_auto_20221126_2129', '2022-11-26 13:30:16.233000');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('23hbtso161yt2fm5ede4gncbwh98rq4q', 'eyJpbWFnZV9jb2RlIjoiQ1hSTkgiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1oysRq:MTNSC0vgmn04U3N55d8m7-v4qRjEZjJ6CfYX9aHQll0', '2022-11-26 10:31:14.796000');
INSERT INTO `django_session` VALUES ('3nyl63xsez38ygwonl0784hjqi653pit', 'eyJpbWFnZV9jb2RlIjoiVkhIVFUiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1oyuQS:tYPjrTlE75KUlKNOFB5LA2xT2LyqeJPqsdSl4j3Ne9U', '2022-11-26 12:37:56.845000');
INSERT INTO `django_session` VALUES ('45p36zijrq023k331et3qvad6sa6xp5m', 'eyJpbWFnZV9jb2RlIjoiQ1pES08iLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1oyqiA:Bonu-dVurMfrSxUhU53tf2PI4v4kxAAqVccSsTEzTd4', '2022-11-26 08:39:58.635000');
INSERT INTO `django_session` VALUES ('6uc9omtxlvmse6unr3nu0dscl80afx2c', 'eyJpbWFnZV9jb2RlIjoiVU5WVEEiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1oytM8:c7YC-zTEdyBwgOXLo3j0IaSRl3cScUSQDgJryvSAjGw', '2022-11-26 11:29:24.003000');
INSERT INTO `django_session` VALUES ('7oe305n8segpjj6wvivz32ub8razo81i', 'eyJpbWFnZV9jb2RlIjoiT1hCR0kiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1oyu2H:tkuG40UCLlesV97wGjbFJLvynVh0noqZcXbiAsFZGx8', '2022-11-26 12:12:57.227000');
INSERT INTO `django_session` VALUES ('91r9oh1pggasu8ftximtims47ni9fkkb', 'eyJpbWFnZV9jb2RlIjoiTUpNTVIiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1oyuvy:Hy5SIEoc96MdsCeZ_Ihrv2JOWZtEvkI1JEjQU9WBrRA', '2022-11-26 13:10:30.648000');
INSERT INTO `django_session` VALUES ('92xniepz7q2jdrca43ucks5lmzl4u5ry', 'eyJpbWFnZV9jb2RlIjoiUUtRT0IiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1oyqwV:TvLVI5AK2V9_gUuMhIQaqjK9iYzUdf0P8vhz_Twnfdc', '2022-11-26 08:54:47.943000');
INSERT INTO `django_session` VALUES ('9508aub8siejshhu3rq43ghu6nwuhbr1', 'eyJpbWFnZV9jb2RlIjoiTktFWlUiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1oyuNF:dTs00A-SXanDnj62jcNjGIX-nlOx2lXB413zpIibWmw', '2022-11-26 12:34:37.331000');
INSERT INTO `django_session` VALUES ('aag360a3pknm71si8n5e3sqy5fas8ffw', 'eyJpbWFnZV9jb2RlIjoiQVBXSlAiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1oyuyb:XQnSG74QA5UvfFB7zp6iwMLN22I1u0zxLjQEKBufvxk', '2022-11-26 13:13:13.280000');
INSERT INTO `django_session` VALUES ('bmr66fj1djo2xi46rb0xb07jay03sb2j', 'eyJpbWFnZV9jb2RlIjoiTlhNTk4iLCJfc2Vzc2lvbl9leHBpcnkiOjYwLCJpbmZvIjp7ImlkIjoxLCJuYW1lIjoiYWRtaW4ifX0:1oz8el:GFKpiIGlC-iHle3iYw9ez2qMqpbxVUA69LYsw_QaznI', '2022-11-27 03:49:39.146000');
INSERT INTO `django_session` VALUES ('c033844w0hs55rcwducown790cs4mv7x', 'eyJpbWFnZV9jb2RlIjoiSklLQU0iLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1oyuHS:ULHS1AHPA_KTfTF1RWECi3keZUkq74NfSnRK0G7itwQ', '2022-11-26 12:28:38.228000');
INSERT INTO `django_session` VALUES ('cynfwbf10bp573q8n9uhqq78vp8jbz08', 'eyJpbWFnZV9jb2RlIjoiUUxTREEiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1oyuRj:wOFrv1I0c7WbBZTqxpIszq3ZILdEpNHUCHEtM5-E9wA', '2022-11-26 12:39:15.258000');
INSERT INTO `django_session` VALUES ('dzwdxmf9pyo1elqfzlai2hg7156m19p0', 'eyJpbWFnZV9jb2RlIjoiSVFBVkkiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1oyvRk:BVfWuHLarisIqVqW8hqnaSBAsaBId2tvpOdYZBsMGvI', '2022-11-26 13:43:20.169000');
INSERT INTO `django_session` VALUES ('iomz4tqsv8ffczut5hot4tqx1zow94r7', 'eyJpbWFnZV9jb2RlIjoiVUpKT1giLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1oytxI:mfDosBMHq8_BnyQCRNA3rD4z21K3sAq7Lsu-mtOdvpc', '2022-11-26 12:07:48.091000');
INSERT INTO `django_session` VALUES ('jgh1b6x1xcbwcd0ixqezdrntp8lzgp8e', 'eyJpbWFnZV9jb2RlIjoiSERWSEkiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1oys2l:brNszMaLlZSnExJAUQYv_SVBSMOGjuP5oKF2y90VZxE', '2022-11-26 10:05:19.110000');
INSERT INTO `django_session` VALUES ('juzsfdvz2cb6xcce9n9d7i3tsit4unky', 'eyJpbWFnZV9jb2RlIjoiVEVHTlciLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1oyrE7:bA8xftW_Vt1Mo98WP0piZYl8ZsUYQ71-TEC-PIvzcXE', '2022-11-26 09:12:59.690000');
INSERT INTO `django_session` VALUES ('kwey29a2ciwvdxwyji0kn7nlumg8rtnm', 'eyJpbWFnZV9jb2RlIjoiUFRWQlciLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1oyvZE:U2KEw-Ktkdg1n-xglOqcRyY_khD5ChqBFXB5u_Fmv3I', '2022-11-26 13:51:04.337000');
INSERT INTO `django_session` VALUES ('m74cr6rau8ewklyk4miwwuz23gd6cnk7', 'eyJpbWFnZV9jb2RlIjoiV0pIS08iLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1oytyv:Ckeyxds8jxVaCyvCu3nPCihIaQp7Xlk8-FWaD3NHaV0', '2022-11-26 12:09:29.110000');
INSERT INTO `django_session` VALUES ('ne237k9jdkpd43yw8g8utc723w9kfpm5', 'eyJpbWFnZV9jb2RlIjoiWEVGT1QiLCJfc2Vzc2lvbl9leHBpcnkiOjYwNDgwMCwiaW5mbyI6eyJpZCI6MSwibmFtZSI6ImFkbWluIn19:1oz8i4:UKput-emuODYSy5qA_YmAmFyz1hVSr097iloF0vNO7g', '2022-12-04 03:52:04.704000');
INSERT INTO `django_session` VALUES ('nfvr5zx9v7i9npqswkn514cpu11m9hku', 'eyJpbWFnZV9jb2RlIjoiRkpXWlQiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1oyuep:MWOVT0QPMqhgloKh9HMpaa57ICa-lxhUfSZMEXVcMLM', '2022-11-26 12:52:47.597000');
INSERT INTO `django_session` VALUES ('o1463uqa2l2zjqtws5xfogawt91osssc', 'eyJpbWFnZV9jb2RlIjoiRUhaV00iLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1oyuPT:EOmp5KZhSsFX09p9cPBHBEdsScZkmPSO161ah2h3Sjc', '2022-11-26 12:36:55.982000');
INSERT INTO `django_session` VALUES ('o3yturrege9j6ig20u6ebxum9nuqrcu3', 'eyJpbWFnZV9jb2RlIjoiWFJUSksiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1oyuJQ:5xa-CVxMLRSh_OOYWabcWVVaj3AGkkv2gGa15Hpu3BE', '2022-11-26 12:30:40.083000');
INSERT INTO `django_session` VALUES ('od7ob9krk38qieorhwux75ny1ryusy0w', 'eyJpbWFnZV9jb2RlIjoiRU1TTVoiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1oyuMC:wTWuv1zWRvVk7xGWh6lv59ydo2wKw3yGqLyIAGxqWBQ', '2022-11-26 12:33:32.267000');
INSERT INTO `django_session` VALUES ('pfj4pkdhz4h9i1rk7kqoo83mkvd1jgeq', 'eyJpbWFnZV9jb2RlIjoiVlhJTlMiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1oyrya:NtV--sInC9XjuaThrP9o326P0hi-vSFjk4mvwfcKLOs', '2022-11-26 10:01:00.527000');
INSERT INTO `django_session` VALUES ('q2p5pl2kge4qjzfxghin5515e8ey1e32', 'eyJpbWFnZV9jb2RlIjoiTU5MWkEiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1oyuqH:UHa2JAlR2jDUYVfv0NKwexgBYy2K0C6ApmiChX3GVew', '2022-11-26 13:04:37.473000');
INSERT INTO `django_session` VALUES ('qjyi3tsoe8fp4tb2jlc80cmtunw92vgt', 'eyJpbWFnZV9jb2RlIjoiUVNHT08iLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1oysOv:gI6xWN5mV9415kP9N1zSG4qUaApDq1KRbamI8MFmAxU', '2022-11-26 10:28:13.485000');
INSERT INTO `django_session` VALUES ('r4hyamj8isc29v32b7dsyxfgr16sevfd', 'eyJpbWFnZV9jb2RlIjoiV0RTWk8iLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1oyqvG:xSiCiSTJXb-p1S1w7W7DWahAom0RZjk2HkZ6zwHlGKo', '2022-11-26 08:53:30.721000');
INSERT INTO `django_session` VALUES ('ralwkvyuvevt26bv6795xoqw327inbdj', 'eyJpbWFnZV9jb2RlIjoiQk5MSUoiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1oyutZ:qQzMh-4p2HpLKDg34K4tloWke13HLp8CzC_MUNwHaRs', '2022-11-26 13:08:01.669000');
INSERT INTO `django_session` VALUES ('rx0x5z6ja4bjhabloup7xn4nyu0x7ddx', 'eyJpbWFnZV9jb2RlIjoiR1daRE4iLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1oysZN:2Tucg420WWHmbAJNN7BeMd-8W91RI0v-bV3Yx1Q2atI', '2022-11-26 10:39:01.240000');
INSERT INTO `django_session` VALUES ('s05xsok54m1h8z025agg7hc9iylm7udx', 'eyJpbWFnZV9jb2RlIjoiU1pGSEYiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1oyu4u:rC5NZCHykV-a_SXhyuHXDd4Krnro4Z0a5gYEMUsktNc', '2022-11-26 12:15:40.270000');
INSERT INTO `django_session` VALUES ('tchnhbjnsxv8htk9pcre3ocg0bzh1jxu', 'eyJpbWFnZV9jb2RlIjoiVVpBTVkiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1oyr4B:vsrSs09R_WT9jgaOc1NpLaz_eioruN9HS85dEYezZnk', '2022-11-26 09:02:43.462000');
INSERT INTO `django_session` VALUES ('tjp6a1lpo8w7det6eq2udulqrdpjfpkb', 'eyJpbWFnZV9jb2RlIjoiR0pVV1AiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1oyubY:bT6x0YJqEUUXVPnbTrRDAcAKi70CU6W5qRzSUmoP8hA', '2022-11-26 12:49:24.092000');
INSERT INTO `django_session` VALUES ('tor40l7dqjag94ngfpd0k0ft62z8zeq8', 'eyJpbWFnZV9jb2RlIjoiS0ZJUkoiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1oyv0D:p73c6jpyHtdPwxtCaXHuC6zm_N3nQrTJ5S5c9fdGtxs', '2022-11-26 13:14:53.431000');
INSERT INTO `django_session` VALUES ('ubkw7zxcbily32uamv19j29nl3kcl4le', 'eyJpbWFnZV9jb2RlIjoiR0JETVQiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1oyqdT:R_QCkVX3ZZZvVP4Unk6qPXSZWMdLXAj-TTUPOZ9B4z4', '2022-11-26 08:35:07.340000');
INSERT INTO `django_session` VALUES ('uc44dkenqp7mz7w4vzs1638hephk9rk1', 'eyJpbWFnZV9jb2RlIjoiWlZDVEwiLCJfc2Vzc2lvbl9leHBpcnkiOjYwLCJpbmZvIjp7ImlkIjoxLCJuYW1lIjoiYWRtaW4ifX0:1oz8Qx:XGeSANJRDPHPE7ez1qXdIyNTqCRf09u2QCQUDkzM3gQ', '2022-11-27 03:35:23.028000');
INSERT INTO `django_session` VALUES ('wc136iugohwe5h0ptqo7b3b603uwwv8g', 'eyJpbWFnZV9jb2RlIjoiVFpXQVoiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1oyr2d:DLVFYxDb1YnX5wl4k5aHQFNzF5-Fu00tqScnhuxSjEE', '2022-11-26 09:01:07.746000');
INSERT INTO `django_session` VALUES ('xfymnxv77fsjnsu2wlmpvpt58x2a779x', 'eyJpbWFnZV9jb2RlIjoiSFBaWEMiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1oytqq:MlvViWuLi6u9vLBFLCn1Ur9k4ENOFnTxlLeDJ8EANzo', '2022-11-26 12:01:08.246000');
INSERT INTO `django_session` VALUES ('yvtyd46zh2u6gw6j3m5378mvfe7khy5q', 'eyJpbWFnZV9jb2RlIjoiT0pZSEIiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1oyvH4:uziaBcT8B4FXre26Xb607mZym4gIeE7QxBWwXzVw93Q', '2022-11-26 13:32:18.998000');
INSERT INTO `django_session` VALUES ('z2wlbu94wcdwt174dd00302w1h3u72xd', 'eyJpbWFnZV9jb2RlIjoiV1ZDWEMiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1oytJe:BSD_o9U0lOBAfwXUssWtCGjJJndzrQNYnHIefbGXoqo', '2022-11-26 11:26:50.575000');
INSERT INTO `django_session` VALUES ('zcl4ps14ll6t4qj5etw109r0vw6sp9z0', 'eyJpbWFnZV9jb2RlIjoiWEJOWVAiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1oysNb:Ksah8Arx8hj24uqhOYLBHLtfFCO8TkSz9chbkO-z8SE', '2022-11-26 10:26:51.343000');
INSERT INTO `django_session` VALUES ('zymi2pdizk690jgb03u815nwd9xokj8a', 'eyJpbWFnZV9jb2RlIjoiVlZOVFoiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1oytsy:y2Hc1TltpiKaBX02n1QIBbf4wwn9joUx8tie2loglCM', '2022-11-26 12:03:20.128000');

SET FOREIGN_KEY_CHECKS = 1;
