/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : exam-admin

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 03/05/2023 22:42:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for exam_paper
-- ----------------------------
DROP TABLE IF EXISTS `exam_paper`;
CREATE TABLE `exam_paper`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '试卷名称',
  `score` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '试卷总分',
  `question_count` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '试题总数',
  `question_duration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '答题时间',
  `time_limit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否限时  1 不限时  2 限时',
  `add_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NULL DEFAULT 1 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '试卷库' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam_paper
-- ----------------------------
INSERT INTO `exam_paper` VALUES ('7bf23a5a1e881c768c6483b68df8e884', '考公试卷', '8', '2', NULL, '1', '2023-05-03 17:06:54', '2023-05-03 17:06:54', 1);
INSERT INTO `exam_paper` VALUES ('928a3dd0f74de0c73d21af18efafb77a', '测试试卷', '6', '1', NULL, '1', '2023-05-03 17:20:44', '2023-05-03 17:20:44', 1);
INSERT INTO `exam_paper` VALUES ('fc94a9dba6610cc72af465ffdc3e29e9', '两个大题', '10', '2', NULL, '1', '2023-05-03 17:21:58', '2023-05-03 17:21:58', 1);

-- ----------------------------
-- Table structure for exam_paper_big
-- ----------------------------
DROP TABLE IF EXISTS `exam_paper_big`;
CREATE TABLE `exam_paper_big`  (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `paper_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '试卷id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '大题名称',
  `question_score` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '大题总分',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '大题类型  1 单选题  2 多选题  3 判断题',
  `add_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NULL DEFAULT 1 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '试卷大题表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam_paper_big
-- ----------------------------
INSERT INTO `exam_paper_big` VALUES ('e6b1a592366d3fe662f92d119bd942de', '7bf23a5a1e881c768c6483b68df8e884', '一、单选题', '8', '1', '2023-05-03 17:06:54', '2023-05-03 17:06:54', 1);
INSERT INTO `exam_paper_big` VALUES ('57e2f2a359182836a7ce6954c9c422b5', '928a3dd0f74de0c73d21af18efafb77a', '一、单选题', '6', '1', '2023-05-03 17:20:44', '2023-05-03 17:20:44', 1);
INSERT INTO `exam_paper_big` VALUES ('ab00fb60db1d44460d53b16d069f2385', 'fc94a9dba6610cc72af465ffdc3e29e9', '一、单选题', '5', '1', '2023-05-03 17:21:58', '2023-05-03 17:21:58', 1);
INSERT INTO `exam_paper_big` VALUES ('2d538bfcbc050427323b0a16acff51a4', 'fc94a9dba6610cc72af465ffdc3e29e9', '二、单选题', '5', '1', '2023-05-03 17:21:58', '2023-05-03 17:21:58', 1);

-- ----------------------------
-- Table structure for exam_paper_big_relation
-- ----------------------------
DROP TABLE IF EXISTS `exam_paper_big_relation`;
CREATE TABLE `exam_paper_big_relation`  (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `big_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '大题id',
  `question_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '试题id',
  `score` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '当前题的分数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '试题分数关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam_paper_big_relation
-- ----------------------------
INSERT INTO `exam_paper_big_relation` VALUES ('9370c392b002a5d6fabed1e15fe54987', 'e6b1a592366d3fe662f92d119bd942de', 'faac4b8b1befa28c4ff480460e19da58', '4');
INSERT INTO `exam_paper_big_relation` VALUES ('2dfade7292c8a173601af929df639338', 'e6b1a592366d3fe662f92d119bd942de', '64f536a224147ccd76afdfcb7ecbdebc', '4');
INSERT INTO `exam_paper_big_relation` VALUES ('da5f33036657b0a9f3f064316bcbe637', '57e2f2a359182836a7ce6954c9c422b5', '3be2836222c1a0e6c5b9a658f681199a', '6');
INSERT INTO `exam_paper_big_relation` VALUES ('9fc3147a0b69f6da077a9de862dfc5d7', 'ab00fb60db1d44460d53b16d069f2385', 'faac4b8b1befa28c4ff480460e19da58', '5');
INSERT INTO `exam_paper_big_relation` VALUES ('a7f3fdff43e53fb07470bafd50fad9e7', '2d538bfcbc050427323b0a16acff51a4', '64f536a224147ccd76afdfcb7ecbdebc', '5');

-- ----------------------------
-- Table structure for exam_question
-- ----------------------------
DROP TABLE IF EXISTS `exam_question`;
CREATE TABLE `exam_question`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` tinyint(10) NULL DEFAULT NULL COMMENT '试题类型 1 单选题 2 多选题 3 判断题 4 简答题',
  `question_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '试题分类',
  `score` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分数',
  `difficulty` tinyint(10) NULL DEFAULT NULL COMMENT '难度 1 简单  2 一般   3 困难',
  `question` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '题目',
  `analysis` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '解析',
  `answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '答案',
  `add_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NULL DEFAULT 1 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '试题表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam_question
-- ----------------------------
INSERT INTO `exam_question` VALUES ('faac4b8b1befa28c4ff480460e19da58', 1, 'c187b7c3f61b283117b3bc702908d57f', '5', 1, '<p>单选题？</p>', '<p>选C</p>', 'C', '2023-04-28 15:33:03', '2023-04-28 15:33:03', 1);
INSERT INTO `exam_question` VALUES ('aa95541e36638de896f079bfcfa2baf7', 2, 'c187b7c3f61b283117b3bc702908d57f', '5', 1, '<p>多选题？</p>', '<p>选B和C</p>', 'B,C', '2023-04-28 16:07:14', '2023-04-28 16:07:14', 1);
INSERT INTO `exam_question` VALUES ('64f536a224147ccd76afdfcb7ecbdebc', 1, 'c187b7c3f61b283117b3bc702908d57f', '5', 1, '<p>单选题1？</p>', '<p>选B</p>', 'B', '2023-04-30 23:39:37', '2023-04-30 23:39:37', 1);
INSERT INTO `exam_question` VALUES ('3be2836222c1a0e6c5b9a658f681199a', 1, 'c187b7c3f61b283117b3bc702908d57f', '5', 2, '<p>测试试题?</p>', '<p>选D</p>', 'D', '2023-05-03 17:19:51', '2023-05-03 17:19:51', 1);

-- ----------------------------
-- Table structure for exam_question_item
-- ----------------------------
DROP TABLE IF EXISTS `exam_question_item`;
CREATE TABLE `exam_question_item`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '选项名称',
  `sort_index` int(255) NULL DEFAULT NULL COMMENT '排序字段',
  `add_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NULL DEFAULT 1 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '试题选项' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam_question_item
-- ----------------------------
INSERT INTO `exam_question_item` VALUES ('ace5cd43facf7ded1b91059d70eb8f7f', '22222222', 2, '2023-04-28 15:33:03', '2023-04-28 15:33:03', 1);
INSERT INTO `exam_question_item` VALUES ('3168fd256a1a9cce680325372bef7941', '1111111', 1, '2023-04-28 15:33:03', '2023-04-28 15:33:03', 1);
INSERT INTO `exam_question_item` VALUES ('ea1ddd6637f652fb0c2639cdc4ed584c', '33333333', 3, '2023-04-28 15:33:03', '2023-04-28 15:33:03', 1);
INSERT INTO `exam_question_item` VALUES ('25d7b8e444b8c114c0c1b69c8f497d08', '44444', 4, '2023-04-28 15:33:03', '2023-04-28 15:33:03', 1);
INSERT INTO `exam_question_item` VALUES ('12b933e74ba9daa633fcdaa50ac7463f', 'QQQQQ', 1, '2023-04-28 16:07:14', '2023-04-28 16:07:14', 1);
INSERT INTO `exam_question_item` VALUES ('fb09a8bf730e32b8eb75810ba135478b', 'WWWW', 2, '2023-04-28 16:07:14', '2023-04-28 16:07:14', 1);
INSERT INTO `exam_question_item` VALUES ('dc9febab16f4030aec841e4c458b1502', 'EEEEE', 3, '2023-04-28 16:07:14', '2023-04-28 16:07:14', 1);
INSERT INTO `exam_question_item` VALUES ('a81dd5f8806b5106676cc8c1d152a3de', 'RRRRR', 4, '2023-04-28 16:07:14', '2023-04-28 16:07:14', 1);
INSERT INTO `exam_question_item` VALUES ('e887b999f12ff282de322937428a5501', 'aaa', 1, '2023-04-30 23:39:37', '2023-04-30 23:39:37', 1);
INSERT INTO `exam_question_item` VALUES ('4b608213531f31ff22b67a721d5c6bb9', 'bbb', 2, '2023-04-30 23:39:37', '2023-04-30 23:39:37', 1);
INSERT INTO `exam_question_item` VALUES ('36a3b8d5a27418f282cbe1dc7bcbfdad', 'ccc', 3, '2023-04-30 23:39:37', '2023-04-30 23:39:37', 1);
INSERT INTO `exam_question_item` VALUES ('55e215a1ecf29bf36f503e35c6484d3f', 'ddd', 4, '2023-04-30 23:39:37', '2023-04-30 23:39:37', 1);
INSERT INTO `exam_question_item` VALUES ('72205b51dd5fe9c75a162f063226bc51', '1111', 1, '2023-05-03 17:19:51', '2023-05-03 17:19:51', 1);
INSERT INTO `exam_question_item` VALUES ('7755a2bd24cb644751737d24adafcfee', '2222222223', 2, '2023-05-03 17:19:51', '2023-05-03 17:19:51', 1);
INSERT INTO `exam_question_item` VALUES ('6091a1b8fb331fb6971b0c77c85a4ee5', '3333333', 3, '2023-05-03 17:19:51', '2023-05-03 17:19:51', 1);
INSERT INTO `exam_question_item` VALUES ('28b7e5e5e96edc343366ee5ededb1b72', '44444', 4, '2023-05-03 17:19:51', '2023-05-03 17:19:51', 1);

-- ----------------------------
-- Table structure for exam_question_relation_item
-- ----------------------------
DROP TABLE IF EXISTS `exam_question_relation_item`;
CREATE TABLE `exam_question_relation_item`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `q_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '试题id',
  `i_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '选项id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '试题和试题选项关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam_question_relation_item
-- ----------------------------
INSERT INTO `exam_question_relation_item` VALUES ('a6bc1fe6013f54079246b6391bf7b089', 'aa95541e36638de896f079bfcfa2baf7', 'fb09a8bf730e32b8eb75810ba135478b');
INSERT INTO `exam_question_relation_item` VALUES ('354078f66c6e946af6d3c257573f5f13', 'faac4b8b1befa28c4ff480460e19da58', 'ea1ddd6637f652fb0c2639cdc4ed584c');
INSERT INTO `exam_question_relation_item` VALUES ('fda3ade777a207834621c82f0a3b1c66', 'faac4b8b1befa28c4ff480460e19da58', '25d7b8e444b8c114c0c1b69c8f497d08');
INSERT INTO `exam_question_relation_item` VALUES ('ecf3ed539246741e59dc00a3294ebf10', 'aa95541e36638de896f079bfcfa2baf7', '12b933e74ba9daa633fcdaa50ac7463f');
INSERT INTO `exam_question_relation_item` VALUES ('f2e0e56656c0ee561d59f5112a3254a5', 'faac4b8b1befa28c4ff480460e19da58', 'ace5cd43facf7ded1b91059d70eb8f7f');
INSERT INTO `exam_question_relation_item` VALUES ('ea56d8eb5710b8ebe6faf415a0744af3', 'faac4b8b1befa28c4ff480460e19da58', '3168fd256a1a9cce680325372bef7941');
INSERT INTO `exam_question_relation_item` VALUES ('6b720bf1fcc03f6f00750d8232342cbe', 'aa95541e36638de896f079bfcfa2baf7', 'dc9febab16f4030aec841e4c458b1502');
INSERT INTO `exam_question_relation_item` VALUES ('851f9bcbdfae244c4390486425399439', 'aa95541e36638de896f079bfcfa2baf7', 'a81dd5f8806b5106676cc8c1d152a3de');
INSERT INTO `exam_question_relation_item` VALUES ('7f33bfe49562012ff8351e17677e271d', '64f536a224147ccd76afdfcb7ecbdebc', 'e887b999f12ff282de322937428a5501');
INSERT INTO `exam_question_relation_item` VALUES ('f54f2d82c936aac4972cda0e00fbc038', '64f536a224147ccd76afdfcb7ecbdebc', '4b608213531f31ff22b67a721d5c6bb9');
INSERT INTO `exam_question_relation_item` VALUES ('63a0d4e09390eec3292e0c61802502ab', '64f536a224147ccd76afdfcb7ecbdebc', '36a3b8d5a27418f282cbe1dc7bcbfdad');
INSERT INTO `exam_question_relation_item` VALUES ('0ce2ac6952aebd40d3adaf464915f396', '64f536a224147ccd76afdfcb7ecbdebc', '55e215a1ecf29bf36f503e35c6484d3f');
INSERT INTO `exam_question_relation_item` VALUES ('fc9e6927f4935f8469fadbd38fa1d756', '3be2836222c1a0e6c5b9a658f681199a', '72205b51dd5fe9c75a162f063226bc51');
INSERT INTO `exam_question_relation_item` VALUES ('340369975a718269e602a85d9088df34', '3be2836222c1a0e6c5b9a658f681199a', '7755a2bd24cb644751737d24adafcfee');
INSERT INTO `exam_question_relation_item` VALUES ('7144a9d623b7d6b83827e72df3812205', '3be2836222c1a0e6c5b9a658f681199a', '6091a1b8fb331fb6971b0c77c85a4ee5');
INSERT INTO `exam_question_relation_item` VALUES ('22b25e9ae67c6f5fd4bf8f719a6e7ad3', '3be2836222c1a0e6c5b9a658f681199a', '28b7e5e5e96edc343366ee5ededb1b72');

-- ----------------------------
-- Table structure for exam_question_type
-- ----------------------------
DROP TABLE IF EXISTS `exam_question_type`;
CREATE TABLE `exam_question_type`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '试题分类',
  `parent_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父级分类',
  `add_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NULL DEFAULT 1 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '试题分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam_question_type
-- ----------------------------
INSERT INTO `exam_question_type` VALUES ('c187b7c3f61b283117b3bc702908d57f', '语文分类', '', '2023-04-19 17:03:05', '2023-04-19 17:03:05', 1);

-- ----------------------------
-- Table structure for ums_admin
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin`;
CREATE TABLE `ums_admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '管理员名称',
  `password` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '管理员密码',
  `last_login_ip` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最近一次登录IP地址',
  `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '最近一次登录时间',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '\'' COMMENT '头像图片',
  `add_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NULL DEFAULT 1 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '管理员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_admin
-- ----------------------------
INSERT INTO `ums_admin` VALUES (3, 'admin', '123456', '0:0:0:0:0:0:0:1', '2023-04-28 21:53:50', 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220620/lihezong.webp', '2022-06-20 16:11:43', '2022-06-20 16:11:43', 1);

-- ----------------------------
-- Table structure for ums_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin_role`;
CREATE TABLE `ums_admin_role`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `admin_id` int(20) NULL DEFAULT NULL COMMENT '管理员id',
  `role_id` int(20) NULL DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户和角色关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_admin_role
-- ----------------------------
INSERT INTO `ums_admin_role` VALUES (41, 3, 10);
INSERT INTO `ums_admin_role` VALUES (44, 5, 10);

-- ----------------------------
-- Table structure for ums_class
-- ----------------------------
DROP TABLE IF EXISTS `ums_class`;
CREATE TABLE `ums_class`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '班级名称',
  `college_id` int(11) NULL DEFAULT NULL COMMENT '学院id',
  `major_id` int(11) NULL DEFAULT NULL COMMENT '专业id',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `add_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(255) NULL DEFAULT 1 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '班级表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_class
-- ----------------------------
INSERT INTO `ums_class` VALUES (1, '141', 12, 13, '', '2023-04-13 09:52:01', '2023-04-13 09:52:01', 1);
INSERT INTO `ums_class` VALUES (2, '142', 12, 13, '', '2023-04-13 09:52:50', '2023-04-13 09:52:50', 1);
INSERT INTO `ums_class` VALUES (3, '美声141', 16, 17, '', '2023-04-13 09:53:13', '2023-04-13 09:53:13', 1);
INSERT INTO `ums_class` VALUES (4, '乐器141', 16, 18, '', '2023-04-13 09:53:28', '2023-04-13 09:53:28', 1);
INSERT INTO `ums_class` VALUES (5, '舞蹈141', 16, 19, '', '2023-04-13 09:53:38', '2023-04-13 09:53:38', 1);

-- ----------------------------
-- Table structure for ums_college_major
-- ----------------------------
DROP TABLE IF EXISTS `ums_college_major`;
CREATE TABLE `ums_college_major`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学院/专业名称',
  `type` tinyint(1) NULL DEFAULT NULL COMMENT '0：学院   1：专业',
  `add_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NULL DEFAULT 1 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学院/专业表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_college_major
-- ----------------------------
INSERT INTO `ums_college_major` VALUES (13, 12, '电子信息工程', 1, '2023-04-11 14:11:48', '2023-04-11 14:11:48', 1);
INSERT INTO `ums_college_major` VALUES (14, 12, '通信工程', 1, '2023-04-11 19:16:16', '2023-04-11 19:16:16', 1);
INSERT INTO `ums_college_major` VALUES (12, NULL, '电气信息工程学院', 0, '2023-04-11 14:11:39', '2023-04-11 14:11:39', 1);
INSERT INTO `ums_college_major` VALUES (15, 12, '自动化', 1, '2023-04-11 19:16:39', '2023-04-11 19:16:39', 1);
INSERT INTO `ums_college_major` VALUES (16, NULL, '音乐舞蹈学院', 0, '2023-04-11 19:16:52', '2023-04-11 19:16:52', 1);
INSERT INTO `ums_college_major` VALUES (17, 16, '美声', 1, '2023-04-11 19:17:10', '2023-04-11 19:17:10', 1);
INSERT INTO `ums_college_major` VALUES (18, 16, '乐器', 1, '2023-04-11 19:17:16', '2023-04-11 19:17:16', 1);
INSERT INTO `ums_college_major` VALUES (19, 16, '舞蹈', 1, '2023-04-11 19:17:20', '2023-04-11 19:17:20', 1);

-- ----------------------------
-- Table structure for ums_dept
-- ----------------------------
DROP TABLE IF EXISTS `ums_dept`;
CREATE TABLE `ums_dept`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `parent_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上级部门',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `add_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NULL DEFAULT 1 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_dept
-- ----------------------------
INSERT INTO `ums_dept` VALUES ('a31d3b275416230b334f481ef04ce957', '总部门', '', '', '2023-04-19 13:26:38', '2023-04-19 13:26:38', 1);
INSERT INTO `ums_dept` VALUES ('634beaa3a60b07034605fb43ad224a6f', '电气学院', 'a31d3b275416230b334f481ef04ce957', '', '2023-04-19 13:26:56', '2023-04-19 13:26:56', 1);
INSERT INTO `ums_dept` VALUES ('637bfb9a8fab4117c09e946afcacf6ae', '电气办公室', '634beaa3a60b07034605fb43ad224a6f', '', '2023-04-19 13:29:07', '2023-04-19 13:29:07', 1);
INSERT INTO `ums_dept` VALUES ('2d97be4460e7b7774b149d2f3f50002e', '音乐舞蹈学院', 'a31d3b275416230b334f481ef04ce957', '', '2023-04-19 13:29:32', '2023-04-19 13:29:32', 1);
INSERT INTO `ums_dept` VALUES ('58f4027b5ed69e0d4760d3c1e5fb803a', '美声室', '2d97be4460e7b7774b149d2f3f50002e', '', '2023-04-19 13:29:48', '2023-04-19 13:29:48', 1);
INSERT INTO `ums_dept` VALUES ('d39f3f4e7eafe299dcb9adbb04ed771e', '舞蹈室', '2d97be4460e7b7774b149d2f3f50002e', '', '2023-04-19 13:30:01', '2023-04-19 13:30:01', 1);

-- ----------------------------
-- Table structure for ums_form
-- ----------------------------
DROP TABLE IF EXISTS `ums_form`;
CREATE TABLE `ums_form`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表单名称',
  `form_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表单key',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表单备注',
  `config` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '表单配置',
  `add_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NULL DEFAULT 1 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '表单配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ums_menu
-- ----------------------------
DROP TABLE IF EXISTS `ums_menu`;
CREATE TABLE `ums_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NULL DEFAULT NULL COMMENT '父级id',
  `path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单地址',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组件名称',
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组件地址',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `is_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '超链接地址',
  `is_hide` tinyint(1) NULL DEFAULT NULL COMMENT '是否隐藏',
  `is_keep_alive` tinyint(1) NULL DEFAULT NULL COMMENT '是否缓存组件',
  `is_affix` tinyint(1) NULL DEFAULT NULL COMMENT '是否固定',
  `is_iframe` tinyint(1) NULL DEFAULT NULL COMMENT '是否内嵌窗口',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `sort` int(10) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_menu
-- ----------------------------
INSERT INTO `ums_menu` VALUES (1, NULL, '/system', 'system', 'layout', '系统管理', '', 0, 1, 0, 0, 'iconfont icon-bolangneng', 0);
INSERT INTO `ums_menu` VALUES (2, 1, '/system/meun', 'systemMenu', '/system/menu', '菜单管理', '', 0, 1, 0, 0, 'iconfont icon--chaifenhang', 1);
INSERT INTO `ums_menu` VALUES (4, 1, '/system/user', 'systemUser', '/system/user', '用户管理', '', 0, 1, 0, 0, 'ele-Avatar', 2);
INSERT INTO `ums_menu` VALUES (5, 1, '/system/role', 'systemRole', '/system/role', '角色管理', '', 0, 1, 0, 0, 'ele-Briefcase', 3);
INSERT INTO `ums_menu` VALUES (6, 1, '/system/form-designer', 'form-designer', '/system/form-designer', '表单设计', NULL, 0, 1, 0, NULL, 'fa fa-microchip', 4);
INSERT INTO `ums_menu` VALUES (8, 1, '/system/student', 'student', '/system/student', '学生管理', NULL, 0, 1, 0, NULL, 'iconfont icon-dongtai', 6);
INSERT INTO `ums_menu` VALUES (9, 1, '/system/class-mng', 'class-mng', '/system/class-mng', '班级管理', NULL, 0, 1, 0, NULL, 'iconfont icon-zhongduancanshuchaxun', 5);
INSERT INTO `ums_menu` VALUES (10, 1, '/system/dept', 'dept', '/system/dept', '部门管理', NULL, 0, 1, 0, NULL, 'iconfont icon-putong', 7);
INSERT INTO `ums_menu` VALUES (11, 1, '/system/teacher', 'teacher', '/system/teacher', '教师管理', NULL, 0, 1, 0, NULL, 'iconfont icon-zhongduancanshuchaxun', 8);
INSERT INTO `ums_menu` VALUES (12, NULL, '/exam', 'exam', 'layout', '考试管理', NULL, 0, 1, 0, NULL, 'iconfont icon-zhongduancanshuchaxun', 1);
INSERT INTO `ums_menu` VALUES (13, 12, '/exam/paper', 'paper', '/exam/paper', '试卷库', NULL, 0, 1, 0, NULL, 'iconfont icon-shouye_dongtaihui', 2);
INSERT INTO `ums_menu` VALUES (14, 12, '/exam/question', 'question', '/exam/question', '试题库', NULL, 0, 1, 0, NULL, 'iconfont icon-putong', 1);

-- ----------------------------
-- Table structure for ums_role
-- ----------------------------
DROP TABLE IF EXISTS `ums_role`;
CREATE TABLE `ums_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色key',
  `desc` varchar(1023) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  `enabled` tinyint(1) NULL DEFAULT 1 COMMENT '是否启用',
  `add_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NULL DEFAULT 1 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name_UNIQUE`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_role
-- ----------------------------
INSERT INTO `ums_role` VALUES (10, '超级管理员', 'admin', '拥有所有权限', 1, '2022-06-20 11:13:09', '2022-06-21 11:49:57', 1);

-- ----------------------------
-- Table structure for ums_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `ums_role_menu`;
CREATE TABLE `ums_role_menu`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `role_id` int(20) NULL DEFAULT NULL COMMENT '角色id',
  `menu_id` int(20) NULL DEFAULT NULL COMMENT '菜单id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 121 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_role_menu
-- ----------------------------
INSERT INTO `ums_role_menu` VALUES (109, 10, 1);
INSERT INTO `ums_role_menu` VALUES (110, 10, 2);
INSERT INTO `ums_role_menu` VALUES (111, 10, 4);
INSERT INTO `ums_role_menu` VALUES (112, 10, 5);
INSERT INTO `ums_role_menu` VALUES (113, 10, 6);
INSERT INTO `ums_role_menu` VALUES (114, 10, 9);
INSERT INTO `ums_role_menu` VALUES (115, 10, 8);
INSERT INTO `ums_role_menu` VALUES (116, 10, 10);
INSERT INTO `ums_role_menu` VALUES (117, 10, 11);
INSERT INTO `ums_role_menu` VALUES (118, 10, 12);
INSERT INTO `ums_role_menu` VALUES (119, 10, 14);
INSERT INTO `ums_role_menu` VALUES (120, 10, 13);

-- ----------------------------
-- Table structure for ums_student
-- ----------------------------
DROP TABLE IF EXISTS `ums_student`;
CREATE TABLE `ums_student`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学号',
  `college` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学院',
  `major` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '专业',
  `class_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '班级',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `birthday` date NULL DEFAULT NULL COMMENT '出生日期',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `sex` int(255) NULL DEFAULT NULL COMMENT '0：男 1：女',
  `status` int(255) NULL DEFAULT NULL COMMENT '0：禁用 1：启用',
  `wx_open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'wxopenid',
  `add_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NULL DEFAULT 1 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_student
-- ----------------------------
INSERT INTO `ums_student` VALUES ('38bd2100d22419811b6ffd596d372619', '陆某某', '20230419', '16', '18', '4', 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20230419/2018e9ac91ec37d9aaf437a1fd5d7070.png', '2023-04-18', '19865315987', 0, 1, NULL, '2023-04-19 11:01:45', '2023-04-19 11:01:45', 1);

-- ----------------------------
-- Table structure for ums_teacher
-- ----------------------------
DROP TABLE IF EXISTS `ums_teacher`;
CREATE TABLE `ums_teacher`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工号',
  `dept_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门id',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `sex` tinyint(10) NULL DEFAULT NULL COMMENT '0: 男 1：女',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电话',
  `add_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(255) NULL DEFAULT 1 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '教师表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_teacher
-- ----------------------------
INSERT INTO `ums_teacher` VALUES ('8daa621c57a934669b9609bf83e0e5ff', '黄老师', '20230416', '637bfb9a8fab4117c09e946afcacf6ae', 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20230419/000.png', 0, '1224311695@qq.com', '18756492368', '2023-04-19 14:30:18', '2023-04-19 14:30:18', 1);

SET FOREIGN_KEY_CHECKS = 1;
