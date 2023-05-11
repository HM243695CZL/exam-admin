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

 Date: 11/05/2023 14:14:53
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
  `publish_time` datetime(0) NULL DEFAULT NULL COMMENT '发布时间',
  `add_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NULL DEFAULT 1 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '试卷库' ROW_FORMAT = Dynamic;

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
-- Table structure for exam_paper_big_relation
-- ----------------------------
DROP TABLE IF EXISTS `exam_paper_big_relation`;
CREATE TABLE `exam_paper_big_relation`  (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `big_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '大题id',
  `paper_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '试卷id',
  `question_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '试题id',
  `score` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '当前题的分数',
  `sort_index` int(255) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '试题分数关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for exam_paper_publish
-- ----------------------------
DROP TABLE IF EXISTS `exam_paper_publish`;
CREATE TABLE `exam_paper_publish`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `paper_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '试卷id',
  `class_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '班级id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '发布考试表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam_paper_publish
-- ----------------------------
INSERT INTO `exam_paper_publish` VALUES ('94991210c27740fae72b1aa4ee2d12b9', 'fab2804b0df71cc5f36314a55ffd9aee', '1');
INSERT INTO `exam_paper_publish` VALUES ('ed7f25cdffb8f6f8ada16e5e6a40fabb', '9ecdacbd9bbe9295a947ef8e1d72024f', 'f91c97e26871278cd69e28461190d16a');
INSERT INTO `exam_paper_publish` VALUES ('e33c2eafbfc4cb43cecd1aee580a23bc', '9ecdacbd9bbe9295a947ef8e1d72024f', '23dc2e3d2c8bfdf98e2b413c1d9659e5');
INSERT INTO `exam_paper_publish` VALUES ('42ab4a4176b89a438635277153cafd57', 'c44fa5f770c1be9006fa80ac100d4dde', '23dc2e3d2c8bfdf98e2b413c1d9659e5');
INSERT INTO `exam_paper_publish` VALUES ('144410be4707640cad14d47ba6e2126e', 'c44fa5f770c1be9006fa80ac100d4dde', 'f91c97e26871278cd69e28461190d16a');
INSERT INTO `exam_paper_publish` VALUES ('d9ff8be947ed36909766afe458304c68', 'c44fa5f770c1be9006fa80ac100d4dde', '3b7e8e3c3adb6bb38474eb57fc1a8c9e');
INSERT INTO `exam_paper_publish` VALUES ('53169e0aa006973f8cbc115f13fc0325', 'fc7f46760f62044ea6e3153e5742298e', '23dc2e3d2c8bfdf98e2b413c1d9659e5');

-- ----------------------------
-- Table structure for exam_paper_type
-- ----------------------------
DROP TABLE IF EXISTS `exam_paper_type`;
CREATE TABLE `exam_paper_type`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '试题分类',
  `parent_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父级分类',
  `add_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NULL DEFAULT 1 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '试题分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam_paper_type
-- ----------------------------
INSERT INTO `exam_paper_type` VALUES ('c187b7c3f61b283117b3bc702908d57f', '语文分类', '', '2023-04-19 17:03:05', '2023-04-19 17:03:05', 1);

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
INSERT INTO `exam_question_type` VALUES ('80bf0db118f64744d374bbd3904fb9cd', '常识判断', '', '2023-05-06 14:57:07', '2023-05-06 16:36:46', 1);
INSERT INTO `exam_question_type` VALUES ('317e751103f654a1631725d6e00355bd', '语言理解与表达', '', '2023-05-06 16:37:08', '2023-05-06 16:37:08', 1);

-- ----------------------------
-- Table structure for exam_record
-- ----------------------------
DROP TABLE IF EXISTS `exam_record`;
CREATE TABLE `exam_record`  (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `paper_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '试卷id',
  `record_status` smallint(6) NULL DEFAULT NULL COMMENT '试卷状态',
  `user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户id',
  `submit_time` datetime(0) NULL DEFAULT NULL COMMENT '交卷时间',
  `score` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '得分',
  `add_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(255) NULL DEFAULT 1 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '考试记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for exam_sub_answer_relation
-- ----------------------------
DROP TABLE IF EXISTS `exam_sub_answer_relation`;
CREATE TABLE `exam_sub_answer_relation`  (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户id',
  `paper_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '试卷id',
  `question_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '试题id',
  `answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '答案',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '试卷答题答案关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for exam_wrong_book
-- ----------------------------
DROP TABLE IF EXISTS `exam_wrong_book`;
CREATE TABLE `exam_wrong_book`  (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'id',
  `question_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '试题id',
  `user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户id',
  `wrong_count` int(100) NULL DEFAULT 1 COMMENT '出错次数',
  `correct_answer_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '正确答案id',
  `self_answer_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户答案id',
  `add_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NULL DEFAULT 1 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '错题表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ums_admin
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin`;
CREATE TABLE `ums_admin`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '管理员名称',
  `user_type` tinyint(255) NULL DEFAULT NULL COMMENT '1：教师    2：学生',
  `password` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '管理员密码',
  `number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学号',
  `college_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学院id',
  `major_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '专业id',
  `class_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '班级id',
  `dept_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门id',
  `sex` tinyint(10) NULL DEFAULT NULL COMMENT '0：男 1：女',
  `wx_open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'wxopenid',
  `last_login_ip` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最近一次登录IP地址',
  `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '最近一次登录时间',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '\'' COMMENT '头像图片',
  `add_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NULL DEFAULT 1 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '管理员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_admin
-- ----------------------------
INSERT INTO `ums_admin` VALUES ('0965c32d75268459f76ee34a734fb461', 'admin', 1, '123456', 'admin', '', '', '', '', 0, NULL, '0:0:0:0:0:0:0:1', '2023-05-11 11:50:59', 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20230508/lihezong.webp', '2023-05-08 14:52:41', '2023-05-08 14:52:41', 1);
INSERT INTO `ums_admin` VALUES ('48eaba1fe0744f1ba7b656538b37bc8f', '陆老师', 1, '123456', '20230508', '', '', '', '', 1, NULL, '0:0:0:0:0:0:0:1', '2023-05-08 13:41:41', 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20230508/2.png', '2023-05-08 13:38:58', '2023-05-08 13:38:58', 1);
INSERT INTO `ums_admin` VALUES ('89fbb441cd41555aa86359c17219e4c3', '黄学生', 2, '123456', '20230509', '2f3c2ad0a0cb2792cfba14cd8f3cde41', 'e19df72d1409dec6e3166dd014af81ed', '23dc2e3d2c8bfdf98e2b413c1d9659e5', '', 0, NULL, '0:0:0:0:0:0:0:1', '2023-05-11 11:51:26', 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20230508/hw-logo.png', '2023-05-08 13:40:35', '2023-05-08 16:53:39', 1);

-- ----------------------------
-- Table structure for ums_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin_role`;
CREATE TABLE `ums_admin_role`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `admin_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员id',
  `role_id` int(20) NULL DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户和角色关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_admin_role
-- ----------------------------
INSERT INTO `ums_admin_role` VALUES (44, '5', 10);
INSERT INTO `ums_admin_role` VALUES (45, '48eaba1fe0744f1ba7b656538b37bc8f', 10);
INSERT INTO `ums_admin_role` VALUES (46, '0965c32d75268459f76ee34a734fb461', 10);
INSERT INTO `ums_admin_role` VALUES (47, '89fbb441cd41555aa86359c17219e4c3', 10);

-- ----------------------------
-- Table structure for ums_class
-- ----------------------------
DROP TABLE IF EXISTS `ums_class`;
CREATE TABLE `ums_class`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '班级名称',
  `college_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学院id',
  `major_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '专业id',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `add_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(255) NULL DEFAULT 1 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '班级表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_class
-- ----------------------------
INSERT INTO `ums_class` VALUES ('23dc2e3d2c8bfdf98e2b413c1d9659e5', '电子141', '2f3c2ad0a0cb2792cfba14cd8f3cde41', 'e19df72d1409dec6e3166dd014af81ed', '', '2023-05-08 16:15:40', '2023-05-08 16:15:40', 1);
INSERT INTO `ums_class` VALUES ('f91c97e26871278cd69e28461190d16a', '通信工程141', '2f3c2ad0a0cb2792cfba14cd8f3cde41', '23984acca2dddd035abe8366ab3a1908', '', '2023-05-08 16:33:46', '2023-05-08 16:40:47', 1);
INSERT INTO `ums_class` VALUES ('3b7e8e3c3adb6bb38474eb57fc1a8c9e', '美声141', '6e53dc0d1d2e57fb97917d7d8841f32c', 'f6a553ec7ef94ed98b0dd27b7ae12bda', '', '2023-05-08 16:42:47', '2023-05-08 16:42:47', 1);

-- ----------------------------
-- Table structure for ums_college_major
-- ----------------------------
DROP TABLE IF EXISTS `ums_college_major`;
CREATE TABLE `ums_college_major`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学院/专业名称',
  `type` tinyint(1) NULL DEFAULT NULL COMMENT '0：学院   1：专业',
  `add_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NULL DEFAULT 1 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学院/专业表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_college_major
-- ----------------------------
INSERT INTO `ums_college_major` VALUES ('e19df72d1409dec6e3166dd014af81ed', '2f3c2ad0a0cb2792cfba14cd8f3cde41', '电子信息工程', 0, '2023-05-08 16:12:44', '2023-05-08 16:12:44', 1);
INSERT INTO `ums_college_major` VALUES ('2f3c2ad0a0cb2792cfba14cd8f3cde41', '', '电气信息工程学院', 1, '2023-05-08 16:12:34', '2023-05-08 16:12:34', 1);
INSERT INTO `ums_college_major` VALUES ('23984acca2dddd035abe8366ab3a1908', '2f3c2ad0a0cb2792cfba14cd8f3cde41', '通信工程', 0, '2023-05-08 16:12:52', '2023-05-08 16:12:52', 1);
INSERT INTO `ums_college_major` VALUES ('6e53dc0d1d2e57fb97917d7d8841f32c', '', '音乐舞蹈学院', 1, '2023-05-08 16:13:01', '2023-05-08 16:13:01', 1);
INSERT INTO `ums_college_major` VALUES ('f6a553ec7ef94ed98b0dd27b7ae12bda', '6e53dc0d1d2e57fb97917d7d8841f32c', '美声', 0, '2023-05-08 16:13:07', '2023-05-08 16:13:07', 1);
INSERT INTO `ums_college_major` VALUES ('36e6d8a8811de69ffd24d1d90fa19fbf', '6e53dc0d1d2e57fb97917d7d8841f32c', '乐器', 0, '2023-05-08 16:13:13', '2023-05-08 16:13:13', 1);

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
INSERT INTO `ums_dept` VALUES ('d324207b0c8e06a5d20fa6ee9bfc805a', '美声室', '0ccd31bb945ac34370ff75fef5538e6a', '', '2023-05-08 16:11:40', '2023-05-08 16:12:09', 1);
INSERT INTO `ums_dept` VALUES ('0ccd31bb945ac34370ff75fef5538e6a', '音乐舞蹈学院', 'aa18f4cdff12ac690a52a7755ebcf801', '', '2023-05-08 16:11:19', '2023-05-08 16:11:19', 1);
INSERT INTO `ums_dept` VALUES ('87ac52d76ace2ba5381515d3a6dd3e0c', '电气办公室', 'fd2945871b191a06464081f80a13bb55', '', '2023-05-08 16:11:04', '2023-05-08 16:11:04', 1);
INSERT INTO `ums_dept` VALUES ('fd2945871b191a06464081f80a13bb55', '电气学院', 'aa18f4cdff12ac690a52a7755ebcf801', '', '2023-05-08 16:10:54', '2023-05-08 16:10:54', 1);
INSERT INTO `ums_dept` VALUES ('aa18f4cdff12ac690a52a7755ebcf801', '总部门', '', '', '2023-05-08 16:10:41', '2023-05-08 16:10:41', 1);
INSERT INTO `ums_dept` VALUES ('faa0fa0d3a4136344ecf36ccf5ad2228', '舞蹈室', '0ccd31bb945ac34370ff75fef5538e6a', '', '2023-05-08 16:11:51', '2023-05-08 16:11:51', 1);

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
) ENGINE = MyISAM AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_menu
-- ----------------------------
INSERT INTO `ums_menu` VALUES (1, NULL, '/system', 'system', 'layout', '系统管理', '', 0, 1, 0, 0, 'iconfont icon-bolangneng', 0);
INSERT INTO `ums_menu` VALUES (2, 1, '/system/meun', 'systemMenu', '/system/menu', '菜单管理', '', 0, 1, 0, 0, 'iconfont icon--chaifenhang', 1);
INSERT INTO `ums_menu` VALUES (4, 1, '/system/user', 'systemUser', '/system/user', '用户管理', '', 0, 1, 0, 0, 'ele-Avatar', 2);
INSERT INTO `ums_menu` VALUES (5, 1, '/system/role', 'systemRole', '/system/role', '角色管理', '', 0, 1, 0, 0, 'ele-Briefcase', 3);
INSERT INTO `ums_menu` VALUES (6, 1, '/system/form-designer', 'form-designer', '/system/form-designer', '表单设计', NULL, 0, 1, 0, NULL, 'fa fa-microchip', 4);
INSERT INTO `ums_menu` VALUES (9, 1, '/system/class-mng', 'class-mng', '/system/class-mng', '班级管理', NULL, 0, 1, 0, NULL, 'iconfont icon-zhongduancanshuchaxun', 5);
INSERT INTO `ums_menu` VALUES (10, 1, '/system/dept', 'dept', '/system/dept', '部门管理', NULL, 0, 1, 0, NULL, 'iconfont icon-putong', 7);
INSERT INTO `ums_menu` VALUES (12, NULL, '/exam', 'exam', 'layout', '考试管理', NULL, 0, 1, 0, NULL, 'iconfont icon-zhongduancanshuchaxun', 1);
INSERT INTO `ums_menu` VALUES (13, 12, '/exam/paper', 'paper', '/exam/paper', '试卷库', NULL, 0, 1, 0, NULL, 'iconfont icon-shouye_dongtaihui', 2);
INSERT INTO `ums_menu` VALUES (14, 12, '/exam/question', 'question', '/exam/question', '试题库', NULL, 0, 1, 0, NULL, 'iconfont icon-putong', 1);
INSERT INTO `ums_menu` VALUES (18, NULL, '/myExam', 'layout', '/myExam', '我的考试', NULL, 0, 1, 0, NULL, 'iconfont icon-tongzhi4', 2);
INSERT INTO `ums_menu` VALUES (19, 18, '/myExam/examList', 'examList', '/myExam/examList', '考试列表', NULL, 0, 1, 0, NULL, 'iconfont icon-tongzhi3', 1);
INSERT INTO `ums_menu` VALUES (21, 18, '/myExam/wrongBook', 'wrongBook', '/myExam/wrongBook', '我的错题本', NULL, 0, 1, 0, NULL, 'iconfont icon-tongzhi4', 3);

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
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_role
-- ----------------------------
INSERT INTO `ums_role` VALUES (10, '超级管理员', 'admin', '拥有所有权限', 1, '2022-06-20 11:13:09', '2022-06-21 11:49:57', 1);
INSERT INTO `ums_role` VALUES (11, '学生', 'student', '学生角色', 1, '2023-05-08 16:59:59', '2023-05-08 16:59:59', 1);

-- ----------------------------
-- Table structure for ums_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `ums_role_menu`;
CREATE TABLE `ums_role_menu`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `role_id` int(20) NULL DEFAULT NULL COMMENT '角色id',
  `menu_id` int(20) NULL DEFAULT NULL COMMENT '菜单id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 216 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_role_menu
-- ----------------------------
INSERT INTO `ums_role_menu` VALUES (195, 11, 12);
INSERT INTO `ums_role_menu` VALUES (196, 11, 14);
INSERT INTO `ums_role_menu` VALUES (197, 11, 13);
INSERT INTO `ums_role_menu` VALUES (198, 11, 18);
INSERT INTO `ums_role_menu` VALUES (199, 11, 19);
INSERT INTO `ums_role_menu` VALUES (201, 11, 21);
INSERT INTO `ums_role_menu` VALUES (202, 10, 1);
INSERT INTO `ums_role_menu` VALUES (203, 10, 2);
INSERT INTO `ums_role_menu` VALUES (204, 10, 4);
INSERT INTO `ums_role_menu` VALUES (205, 10, 5);
INSERT INTO `ums_role_menu` VALUES (206, 10, 6);
INSERT INTO `ums_role_menu` VALUES (207, 10, 9);
INSERT INTO `ums_role_menu` VALUES (208, 10, 10);
INSERT INTO `ums_role_menu` VALUES (209, 10, 12);
INSERT INTO `ums_role_menu` VALUES (210, 10, 14);
INSERT INTO `ums_role_menu` VALUES (211, 10, 13);
INSERT INTO `ums_role_menu` VALUES (212, 10, 18);
INSERT INTO `ums_role_menu` VALUES (213, 10, 19);
INSERT INTO `ums_role_menu` VALUES (215, 10, 21);

SET FOREIGN_KEY_CHECKS = 1;
