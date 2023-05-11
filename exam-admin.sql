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

 Date: 11/05/2023 16:43:02
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
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '试卷库' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of exam_paper
-- ----------------------------

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
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '试卷大题表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of exam_paper_big
-- ----------------------------

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
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '试题分数关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of exam_paper_big_relation
-- ----------------------------

-- ----------------------------
-- Table structure for exam_paper_publish
-- ----------------------------
DROP TABLE IF EXISTS `exam_paper_publish`;
CREATE TABLE `exam_paper_publish`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `paper_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '试卷id',
  `class_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '班级id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '发布考试表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '试题分类表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '试题表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of exam_question
-- ----------------------------
INSERT INTO `exam_question` VALUES ('9bedb5b238562daf2143180298849ebf', 1, '80bf0db118f64744d374bbd3904fb9cd', '5', 1, '<p>马克思、恩格斯创立了唯物史观和剩余价值学说，揭示了人类历史发展的奥秘和资本主义剥削的实质，论证了无产阶级的历史使命，弥补了空想社会主义的缺陷，从而把社会主义从空想发展为科学。科学社会主义问世的标志是_____。</p>', '<p>《共产党宣言》的诞生标志着马克思主义的诞生，对全世界的无产阶级革命运动起推动作用。</p>', '72625e08bc4fae67dfe5d33f145f0588', '2023-05-11 15:13:12', '2023-05-11 15:13:12', 1);
INSERT INTO `exam_question` VALUES ('63876d1673e3bfce901ca83b981e0d2a', 1, '80bf0db118f64744d374bbd3904fb9cd', '5', 1, '<p>关于陶瓷，下列说法错误的是：</p>', '<p>唐三彩中最具代表性的造型是虎和骆驼</p>', 'e78cb3f5297f9a4055109578b0028eb3', '2023-05-11 15:14:34', '2023-05-11 15:14:34', 1);
INSERT INTO `exam_question` VALUES ('bbb635a0942dc27937ed68ce0895bac7', 1, '80bf0db118f64744d374bbd3904fb9cd', '5', 1, '<p>下列历史人物与其著名言论对应错误的是：</p>', '<p>王安石——天变不足畏，祖宗不足法，人言不足恤</p>', '17d8d189d45f2b423279c2e6cd44a663', '2023-05-11 15:16:09', '2023-05-11 15:16:09', 1);
INSERT INTO `exam_question` VALUES ('d4948f01ad1c45ab10d831d9dbd6cb62', 1, '80bf0db118f64744d374bbd3904fb9cd', '5', 1, '<p>下列作家与其作品中所展现的地域对应错误的是：</p>', '<p><span style=\"color: rgb(0, 0, 0); background-color: rgb(255, 255, 255); font-size: 16px;\">红高粱是莫言的作品，是以上世纪三四十年代山东省高密县东北乡一代的民间生活为背景，塑造的抗日英雄的故事。</span></p>', 'ad346684d0833577f00c2014270168a3', '2023-05-11 15:18:31', '2023-05-11 15:18:31', 1);
INSERT INTO `exam_question` VALUES ('398516c1ab0e86e7ee45854f17655497', 1, '80bf0db118f64744d374bbd3904fb9cd', '5', 1, '<p>关于儒释道三教异同，古人多有争论。对此，唐代僧人宗密曾在《圆觉经略疏钞》中说：“古来诸德皆判：儒宗__，道宗__，释宗___。”依次填入画横线部分最恰当的一项是：</p>', '<p>五常；自然；因缘</p>', '8b2bbd0b7a42054af6525d7776cca27a', '2023-05-11 15:19:26', '2023-05-11 15:19:26', 1);
INSERT INTO `exam_question` VALUES ('75b885bbe0eb8df256656d7fb08ed84f', 1, '80bf0db118f64744d374bbd3904fb9cd', '5', 1, '<p>关于诺贝尔文学奖，下列说法不正确的是：</p>', '<p>列夫·托尔斯泰没有得过诺贝尔文学奖</p>', '3ef54dabe1d28f42e3a2e9701c5a8925', '2023-05-11 15:21:31', '2023-05-11 15:21:31', 1);
INSERT INTO `exam_question` VALUES ('b8e4200f085214c55ac3055dadc943c4', 1, '80bf0db118f64744d374bbd3904fb9cd', '5', 1, '<p>下列影视剧情景设计符合历史常识的是：</p>', '<p>毛泽东与李宗仁幽默地说：德邻先生，你这次归国，是误上了贼船啊</p>', '73921dacda908fab9f246fe05dd8bfcd', '2023-05-11 15:22:20', '2023-05-11 15:22:20', 1);
INSERT INTO `exam_question` VALUES ('bc919abb73b2a030cb468e409fa97eba', 1, '80bf0db118f64744d374bbd3904fb9cd', '5', 1, '<p>关于能量与做功，下列说法正确的是：</p>', '<p>自由落体过程中物体的机械能保持不变</p>', '76ee3b248751132952cac6a67d1259b3', '2023-05-11 15:23:03', '2023-05-11 15:23:03', 1);
INSERT INTO `exam_question` VALUES ('5c77c8c11e8bcdf8fc6941b2bab06c94', 1, '80bf0db118f64744d374bbd3904fb9cd', '5', 1, '<p>具有社会行为的动物大多具有以下特征：①群体内部往往形成一定组织；②组织成员之间有明确的分工；③群体内有一定的等级。下列属于动物社会行为的是()。</p>', '<p>蜂王依靠工蜂喂养</p>', '74df6ce5c0bbb6ab003e534fd2e8e769', '2023-05-11 15:23:54', '2023-05-11 15:23:54', 1);
INSERT INTO `exam_question` VALUES ('4f51b313e3f8c0226aef0e0b26574d8c', 1, '80bf0db118f64744d374bbd3904fb9cd', '5', 1, '<p>下列与生物灾害有关的说法错误的是：</p>', '<p><span style=\"color: rgb(51, 51, 51); background-color: rgb(255, 255, 255); font-size: 16px;\">在我国蝗灾最严重的地区是河南、河北和山东三省，而不是两湖地区</span></p>', 'f399ad0e297bfc45e3c1e55039e47bf5', '2023-05-11 15:25:41', '2023-05-11 15:25:41', 1);
INSERT INTO `exam_question` VALUES ('1223752cce350f37efa01b7328d74e11', 1, '80bf0db118f64744d374bbd3904fb9cd', '5', 1, '<p>有四个同样大小、质量相等的空心球，他们分别由铁、铝、铜、铅制成。则四个球空心部分体积最大的是：</p>', '<p>铅球</p>', '2c2257a6216aa2c5b6cd1a635c751d71', '2023-05-11 15:26:37', '2023-05-11 15:26:37', 1);
INSERT INTO `exam_question` VALUES ('886d893d696089a22e8ed29ced779e58', 1, '80bf0db118f64744d374bbd3904fb9cd', '5', 1, '<p>光学树脂常用于制作镜片，它是一种有机材料，其分子间结构相对松弛，光线可通过率为84%-90%。下列关于光学树脂镜片的表达错误的是____。</p>', '<p>和普通玻璃镜片相比，树脂镜片更加耐磨</p>', 'd7454888a762aaaa9a57240321989082', '2023-05-11 15:27:48', '2023-05-11 15:27:48', 1);
INSERT INTO `exam_question` VALUES ('c8edfdb8a397ca33fc3602ee9f50227c', 1, '80bf0db118f64744d374bbd3904fb9cd', '5', 1, '<p>关于塑料大棚，下列说法正确的是：</p>', '<p>冬季在塑料大棚内熏烟有助于防御霜冻</p>', 'e3279ae96d8d9a997ce8f9be7764c0d9', '2023-05-11 15:28:31', '2023-05-11 15:28:31', 1);
INSERT INTO `exam_question` VALUES ('d2c1fec59bf024ba0b7aff502230d0cb', 1, '80bf0db118f64744d374bbd3904fb9cd', '5', 1, '<p>下面是一款路由器的参数规格说明，对此描述错误的是：</p><p><br></p><p><img src=\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20230511/image.png\" alt=\"\" data-href=\"\" style=\"\"/></p>', '<p>路由器的LAN口可以用来连接外网</p>', '4bb6e1dc56e6363a3ae08480c3ae4bdf', '2023-05-11 15:29:46', '2023-05-11 15:29:46', 1);
INSERT INTO `exam_question` VALUES ('62dfea90bbce44e4e724a63e353b263d', 1, '80bf0db118f64744d374bbd3904fb9cd', '5', 1, '<p>地球自转一圈的时间是一天，地球半径为6371千米。毛泽东诗词“坐地日行八万里”是有科学依据的，人可以随着地球的自转运动，那么与诗句最吻合的可能是哪个国家的人：</p>', '<p>新加坡</p>', 'e57efd9eb8d32feccd8ecff2e061ecf8', '2023-05-11 15:30:25', '2023-05-11 15:30:25', 1);
INSERT INTO `exam_question` VALUES ('d7d60f96dbe27a1907f4bc8d9fe41ca0', 1, '80bf0db118f64744d374bbd3904fb9cd', '5', 1, '<p>2013年7月6日我国与____正式签署了自由贸易协定，这是我国与欧洲大陆国家签署的首个自贸协定</p>', '<p>瑞士</p>', '163b78b2de4a65714283337675f1b643', '2023-05-11 15:31:13', '2023-05-11 15:31:13', 1);
INSERT INTO `exam_question` VALUES ('33b58d8626d376b1a84031f40dd8a22a', 1, '80bf0db118f64744d374bbd3904fb9cd', '5', 1, '<p>按照我国《民法典》的规定，财产继承的效力顺位为：</p>', '<p>遗赠扶养协议&gt;遗嘱继承&gt;法定继承</p>', 'f26e461584854793473d85ba60bc9aad', '2023-05-11 15:32:07', '2023-05-11 15:32:07', 1);
INSERT INTO `exam_question` VALUES ('8de8cd8ca99506f434fe8eece6100412', 1, '80bf0db118f64744d374bbd3904fb9cd', '5', 1, '<p>“正能量”指的是一种健康乐观、积极向上的动力和情感。当下中国社会涌现了许多富有正能量的人和事，这些催人奋进的、充满希望的人和事也带动和影响了周围一批人，从哲学角度看()。</p><p>①正能量具有指导作用，能够将人们的愿望变成现实</p><p>②正能量具有能动性，能够给人带来信心和力量</p><p>③正能量具有反作用，能对人体生理活动进行调节和控制</p><p>④正能量具有创造性，能直接转化为物质力量</p>', '<p>②③</p>', 'cd617ebdf80411e826b6477733a7bdf8', '2023-05-11 15:33:37', '2023-05-11 15:33:37', 1);
INSERT INTO `exam_question` VALUES ('0c719c0915505f6ed6910918d44c8745', 1, '80bf0db118f64744d374bbd3904fb9cd', '5', 1, '<p>社会信用体系的建立有利于提高全社会的诚信意识和信用水平。下列关于国家加快社会信用体系建设的说法错误的是：</p>', '<p>为惩戒失信被执行人，规定其不得以财产支付子女就读高等院校的费用</p>', 'b91722e892ed085b76ed045d738fe6b3', '2023-05-11 15:34:24', '2023-05-11 15:34:24', 1);
INSERT INTO `exam_question` VALUES ('0cc6ef0f08a84a665ec39760176bd878', 1, '80bf0db118f64744d374bbd3904fb9cd', '5', 1, '<p>中共中央、国务院于2019年12月4日印发了《关于营造更好发展环境支持民营企业改革发展的意见》，下列说法与之不符的是：</p>', '<p>在电力、电信、铁路、石油等行业和领域，向民营企业全面开放</p>', 'a394085966588f15117f5d079cfce874', '2023-05-11 15:35:04', '2023-05-11 15:35:04', 1);
INSERT INTO `exam_question` VALUES ('9b500f474fd6d62c25e57c89859c8dd4', 1, '317e751103f654a1631725d6e00355bd', '5', 1, '<p>在实际应用中，专网通常服务于政府、军队、公安、能源、消防、轨道交通等部门或领域，大部分情况下被用来进行应急通信、调度指挥。性能可靠、低成本、定制化的特点，使其在行业应用中具备____的优势。即便5G时代呼啸而来，专网依旧能够找到____。依次填入画横线部分最恰当的一项是：</p>', '<p>不可替代、用武之地</p>', '551f4c6578aad16d2a1349cef3a7f2cf', '2023-05-11 15:41:09', '2023-05-11 15:41:09', 1);
INSERT INTO `exam_question` VALUES ('1c3cb3d794fa37cfd5f8350cd0bfaa13', 1, '317e751103f654a1631725d6e00355bd', '5', 1, '<p>研究也显示，对外的控制一开始确实能增强幸福感，但越过一个临界点后，反而会开始降低幸福感。外部控制狂更容易倾向于做出____的高风险决策，他们身边往往只剩下少数顺从者，因此在做错决定时也得不到逆耳忠言。填入画横线部分最恰当的一项是：</p>', '<p>孤注一掷</p>', '8623e87015c5944de6f8c8d0fdf4911e', '2023-05-11 15:43:53', '2023-05-11 15:43:53', 1);
INSERT INTO `exam_question` VALUES ('e325299263c71e46805b43b4be8f6052', 1, '317e751103f654a1631725d6e00355bd', '5', 1, '<p>从陆地到天空，从恐龙到鸟类，生物的生态习性发生了巨大改变，身体结构也有了天壤之别。若非有一系列介于两者之间的过渡物种让人_____，即便熟读《物种起源》，笃信达尔文的演化理论，也仍然会对“恐龙是鸟类的祖先”的说法______。无可辩驳充耳不闻依次填入画横线部分最恰当的一项是：</p>', '<p>眼见为实、将信将疑</p>', '7a775b63b1e1c3b8d12f882c428cdfde', '2023-05-11 15:45:10', '2023-05-11 15:45:10', 1);
INSERT INTO `exam_question` VALUES ('d73dc1d56a674b720d66f428d6c5be67', 1, '317e751103f654a1631725d6e00355bd', '5', 1, '<p>“制作粗糙”，_____，某文艺评论家这样点评当下国内的许多多媒体舞蹈作品。把几段现成的图像符号式地投射在背景屏幕上充当画外音，充其量只是布景道具的升级版。多媒体效果太过目眩神迷，与舞蹈____，有一种独立于表达之外的野心。比如有一个多媒体舞蹈，投射在大屏幕上的图案随着演员的每个动作变幻：演员伸展双臂，身后便出现万丈光芒，演员抱住身体，灯光也随之黯淡，看上去是在配合表演，其实是在和演员争夺观众的眼球，舞蹈彻底沦为了配角。依次填入画横线部分最恰当的一项是：</p>', '<p>喧宾夺主、貌合神离</p>', '4372f294a4be90b790712fc2a9e6ee5c', '2023-05-11 15:46:32', '2023-05-11 15:46:32', 1);
INSERT INTO `exam_question` VALUES ('c3dbe6b3e685e47a0f37bbf324086632', 1, '317e751103f654a1631725d6e00355bd', '5', 1, '<p>看起来生活好像总是如此的不公平。但即便是这样，没有谁因此占了谁的便宜，每一个人都感觉自己是不公平的受难者。也就是说，刻薄的世界____，厚待的人生____。依次填入画横线处最恰当的一组是：</p>', '<p>比比皆是、遥遥无期</p>', '85258db09e11f6529f4b5df5ba2f6a4b', '2023-05-11 15:47:32', '2023-05-11 15:47:32', 1);
INSERT INTO `exam_question` VALUES ('82565650333f8bc7c3ba97f934572f21', 1, '317e751103f654a1631725d6e00355bd', '5', 1, '<p>当今世界，处于百年未有之大变局。世界多极化、经济全球化____人类的命运紧密相连，各国利益深度融合。但同时，各种挑战也日益严峻。变局之中，要合作还是要对立，要开放还是要封闭，要互利共赢还是要____，人类发展处在何去何从的十字路口。依次填人画横线部分最恰当的一项是：</p>', '<p>势不可挡、以邻为壑</p>', 'a532fea5654998e9d32cf790b597fd8f', '2023-05-11 15:48:38', '2023-05-11 15:48:38', 1);
INSERT INTO `exam_question` VALUES ('a9929f74ddf4af2377a9d7170df39aa0', 1, '317e751103f654a1631725d6e00355bd', '5', 1, '<p>测谎的基本原理是：欺骗的人会紧张，以致呼吸、脉搏加快和血压升高。测谎专家因而声称，只要操作、解析得当，测谎仪能够有效发现说谎者，结果是__的。反对者则认为，一个_____且擅长控制情绪的人是可以对付测谎仪的。在这个过程中，不是人与机器，而是测谎者与被测者的_____。依次填入画横线部分最恰当的一项是：</p>', '<p>可靠有备而来较量</p>', '2ffbde1236b5689a2086ba20f74e9cb3', '2023-05-11 15:50:31', '2023-05-11 15:50:31', 1);
INSERT INTO `exam_question` VALUES ('4e9efdb9dd2afd695abb6c36966d2beb', 1, '317e751103f654a1631725d6e00355bd', '5', 1, '<p>漆画有其他画种达不到的效果，同时也有它的____。它不能像油画、水粉画那样自由地运用冷暖色彩，不能像素描那样丰富地运用明暗层次，不善于逼真地、____地再现对象。事实上，在似与不似之间表现对象，才是漆画最______的地方。依次填入画横线部分最恰当的一项是：</p>', '<p>局限、栩栩如生、擅长</p>', 'e98fd8afdf208ebd5a4b768915027eea', '2023-05-11 15:51:55', '2023-05-11 15:51:56', 1);
INSERT INTO `exam_question` VALUES ('33e0a78f18ddcce6e0c71a62f466ab24', 1, '317e751103f654a1631725d6e00355bd', '5', 1, '<p>一些国家在实现自身现代化过程中选错了参照系，将发达国家有什么、做什么作为实现自身现代化的____，导致在向市场经济转型过程中经济停滞、崩溃，危机不断。而中国能够根据自己的要素禀赋条件，发挥政府在市场经济中_____的作用，把自己能做好的产业做大做强，将比较优势变成竞争优势，从而推动经济长期稳定快速发展。依次填入画横线部分最恰当的一项是：</p>', '<p>目标、因势利导</p>', 'e1453dcbf72bb350070e6379beb42e5a', '2023-05-11 15:53:11', '2023-05-11 15:53:11', 1);
INSERT INTO `exam_question` VALUES ('b26fb7227f131ba70c1c8b30c8d929d9', 1, '317e751103f654a1631725d6e00355bd', '5', 1, '<p>我们如今有铺天盖地的新信息需要去消化和记忆。互联网、移动电话、电视和其他电子产品里，都____地涌现出新鲜事物。当不同信息同时涌现在记忆中，人们会无法_____出与当前目标不相关的信息，甚至还会禁不住去思考那些尚未开始做的事情，于是会出现____。依次填人划横线部分最恰当的一项是：</p>', '<p>源源不断、筛选、顾此失彼</p>', '3868dd54f4b3a69a12683ee7220d11ab', '2023-05-11 15:55:14', '2023-05-11 15:55:14', 1);
INSERT INTO `exam_question` VALUES ('b1c090bed9224018b5d3ab350c19efd6', 1, '317e751103f654a1631725d6e00355bd', '5', 1, '<p>①比起秋天的枫林来，夏天的枫林没有那么撩人的红韵，但那生机盎然的绿，_____着的却是一股青春的朝气。</p><p>②推进黄河三角洲高效生态经济发展，有利于实现开发建设与生态保护的有机统一，有利于_____经济结构，创造高效生态经济发展新模式。</p><p>③我们相隔的不是几小时的车程，而是一个整块大陆，就像歌里所唱的，用我的晚安陪你吃早餐，但是_____也隔不断彼此的思念。</p><p>依次填入画横线部分最恰当的一项是：</p>', '<p>涌动、调整、山长水远</p>', 'a84d4f4402703cd98e50c7d7b6bec96a', '2023-05-11 16:01:01', '2023-05-11 16:01:01', 1);
INSERT INTO `exam_question` VALUES ('68d455306d030248e1047249dbf9d487', 1, '317e751103f654a1631725d6e00355bd', '5', 1, '<p>现代社会获取盐分轻而易举，以至于人们认为吃盐是____的事情。而事实上，由于盐在地理上的分布不均以及交通不畅等原因，其在古代一直都属于之物。在人类历史上的绝大部分时间里，人们都在寻找盐，甚至令盐业成为了历史上第一个由国家垄断的产业。可以说，盐贯穿着整个人类历史，并在人类文明的发展中起到了_____的作用。依次填入画横线部分最恰当的一项是：</p>', '<p>理所当然、稀缺、至关重要</p>', '82c0759c947d76c298f5b14f52d76778', '2023-05-11 16:02:13', '2023-05-11 16:02:13', 1);
INSERT INTO `exam_question` VALUES ('455a20f0ef73d83ffc9b10b9fd8d2e11', 1, '317e751103f654a1631725d6e00355bd', '5', 1, '<p>科学家网上科普，“高大上”的国家科研机构与轻松娱乐的网络文化场域相遇，不仅没有出现文化上的巨大冲突、碰撞，反倒形成了一种______、寓教于乐的可爱画风，受到很多年轻人的喜爱。这种意外，看似有很大的______，实则是一种科普方式的积极探索创新，预示了打通两个文化场域的可能性。依次填入画横线部分最恰当的一项是：</p>', '<p>亦庄亦谐、偶然性</p>', '6107e4e92ba62ac5012c07c840800c87', '2023-05-11 16:03:15', '2023-05-11 16:03:16', 1);
INSERT INTO `exam_question` VALUES ('77e80683596025314f1a58e4d07bd3cb', 1, '317e751103f654a1631725d6e00355bd', '5', 1, '<p>宇宙中最冷的地方是“回力棒星云”，那里的温度仅比绝对零度高1度。在绝对零度条件下，所有的原子都会____。_____到“回力棒星云”芳容的“阿尔玛”(望远镜)设在阿塔卡马沙漠中海拔5000米的高原上，那里几乎没有湿气或植被，能对天空_____。依次填入划横线部分最恰当的一项是：</p>', '<p>冻结、捕捉、一览无余</p>', '40567ad6efbf4622fce1cb697f990a0c', '2023-05-11 16:04:35', '2023-05-11 16:04:35', 1);
INSERT INTO `exam_question` VALUES ('5e643d5f617ebcb8d42a80c54a81a33a', 1, '317e751103f654a1631725d6e00355bd', '5', 1, '<p>以家为_____的家族文化传承，把家风、家教、家规、家德注人每代传承人心中，融入到企业文化中，形成部分老字号维系生存的_____。填入划横线部分最恰当的一项是：</p>', '<p>依托、根脉</p>', '8d872b0a70ca8600b51705641fc04f50', '2023-05-11 16:05:35', '2023-05-11 16:05:35', 1);
INSERT INTO `exam_question` VALUES ('13d62684758ed8fd9ed6b77dee26512a', 1, '317e751103f654a1631725d6e00355bd', '5', 1, '<p>准确、权威的信息不及时传播，虚假、歪曲的信息就会搞乱人心；积极、正确的思想舆论不发展壮大，消极、错误的言论观点就会肆虐_____。这方面，主流媒体守土有责，更要守土尽责，及时提供更多真实客观、观点鲜明的信息内容，牢牢______舆论场主动权和主导权。主流媒体要敢于引导、善于疏导，原则问题要旗帜鲜明、立场坚定，一点都不能_______。依次填入画横线部分最恰当的一项是：</p>', '<p>泛滥、堂握、含糊</p>', 'd076c4a1298f55db850bf573943969e7', '2023-05-11 16:07:18', '2023-05-11 16:07:18', 1);
INSERT INTO `exam_question` VALUES ('b601d86c47bfd16e7f328cae70be85ad', 1, '317e751103f654a1631725d6e00355bd', '5', 1, '<p>作为一种现代产权制度，知识产权制度的本质是通过保护产权形成______，“给天才之火添加利益之油”，使全社会创新活力______，创新成果涌流。依次填入画横线部分最恰当的一项是：</p>', '<p>激励、迸发</p>', '637d9194199f06a8f346006a7ed43cde', '2023-05-11 16:08:17', '2023-05-11 16:08:17', 1);
INSERT INTO `exam_question` VALUES ('7b51fbaaa00d78a3c0203be6c0fa8b77', 1, '317e751103f654a1631725d6e00355bd', '5', 1, '<p>生命，是一树花开，或热烈或寂寞。生命中，总有一些令人唏嘘的空白，有些人让你牵绊，却不是相守；有些东西让你_____，却不能拥有；有些错过让你留恋，却终生遗憾。总想寻一处山林，安静生活浅写岁月；总想借一些日子，_____向日葵的温暖，栽种阳光的花瓣。春花秋月，夏萤冬雪，怀一心宁淡，安然度日。经年流转，透过指尖的温度，_____岁月静好，这一路走来，你会发现，生活于我们，温暖，一直是一种_______；于生活的海洋中冲浪，云帆尽头，轻回眸，处处是别有洞天。依次填入画横线部分最恰当的一项是：</p>', '<p>羡慕、播种、期许、牵引</p>', '205b0ba53d2d2facc276f35d0993cd6c', '2023-05-11 16:09:41', '2023-05-11 16:09:41', 1);
INSERT INTO `exam_question` VALUES ('5d266904cdfd6b3327caf598d7fa076a', 1, '317e751103f654a1631725d6e00355bd', '5', 1, '<p>一根网线、一部手机，把偏远的贫困地区链接进了广阔的大市场。电商扶贫，不是______地把农产品搬到网上，更在深层次地倒逼农业产业转型升级，进而扩展到其他相关领域，创建出中国式扶贫的新_____。依次填入画横线部分最恰当的一项是：</p>', '<p>简单、范本</p>', '334bc78d185198c4eea23cbe79a79828', '2023-05-11 16:10:40', '2023-05-11 16:10:40', 1);
INSERT INTO `exam_question` VALUES ('7a488aa133bbe3365afc97ec3d874598', 1, '317e751103f654a1631725d6e00355bd', '5', 1, '<p>农村电网()升级，事关广大农村地区的长远发展。填入括号处最恰当的一项是：</p>', '<p>改造</p>', 'a1d184c87b28b6888fd41e3088fac8a0', '2023-05-11 16:11:16', '2023-05-11 16:11:16', 1);
INSERT INTO `exam_question` VALUES ('975406d76bd2e54fd1fd43ee1316c71e', 1, '317e751103f654a1631725d6e00355bd', '5', 1, '<p>传统工艺是在民间生活中创造的，无论是趋利避害、迎祥祈福的装饰还是家居日常的物件，传统工艺与日常生活融为一体，无处不在。如今，生活从传统走向现代，生活方式发生了不小的变化，但我们仍然需要传承这样的生活艺术和生活智慧，复兴工艺文化的创造力，创作生活之美。在现代经济全球一体化的背景下，文化更需要民族身份，不能因为生活方式的转变而放弃了文化的基因，丢失了民族的记忆，特别是传统工艺中所蕴含的“匠作精神”更是我们民族文化中宝贵的精神财富。</p><p><br></p><p>最适合做这段文字标题的是：</p>', '<p>“匠作精神”不能丢</p>', 'bc26a4f47c4b6fd0bccca581d1ec2960', '2023-05-11 16:12:43', '2023-05-11 16:12:43', 1);
INSERT INTO `exam_question` VALUES ('9fe0ad3a08e33003513655922380cde9', 1, '317e751103f654a1631725d6e00355bd', '5', 1, '<p>早在战争年代，毛泽东同志就强调，各级指挥员必须首先是军事技术专家。20多年前，钱学森同志在展望21世纪时大声疾呼：未来在挑战，军人比任何时候都需要科学，我们要有紧迫感。然而，由于受传统的“重道轻器”等思想的影响，部分指挥员“智谋”有余、“技谋”不足。我们应该清醒认识到，科技是问鼎世界一流军队的“强大引擎”，技术决定战术是制胜铁律，各级指挥员不重视“技谋”就无法有效形成实战能力。惟有那些科技知识的博学者、科学技术的领跑者，才能在未来战场上运筹帷幄、决胜千里。</p><p><br></p><p>最适合做这段文字标题的是：</p>', '<p>现代战场“技谋”不可弱</p>', '14d47592e414029b6c2996cb71c40c2c', '2023-05-11 16:13:25', '2023-05-11 16:13:25', 1);
INSERT INTO `exam_question` VALUES ('d47557421582146e460ce513e984386d', 1, '317e751103f654a1631725d6e00355bd', '5', 1, '<p>传统的纯文学杂志正在悄然地进行一场“时尚革命”。最近一段时间，陆续有著名纯文学杂志宣布“触网”，这些杂志都有几十年历史，从来都是“几十页纸走天下”，所以此番赶时髦引发了众多围观。不过本报记者在调查中了解到，这些文学期刊大多面临传统读者减少、年轻读者难寻的窘境。因此“触网”对它们而言固然是时尚，也是一种顺应时代的自我救赎。</p><p><br></p><p>这段文字没有论及的是：</p>', '<p>纯文学杂志走向数字化是摆脱目前困境的唯一救赎</p>', 'de17e3b9ce96d608b6823918d9f5ff38', '2023-05-11 16:14:57', '2023-05-11 16:14:57', 1);
INSERT INTO `exam_question` VALUES ('0550025c75c40c24912b203fed48aab0', 1, '317e751103f654a1631725d6e00355bd', '5', 1, '<p>“风筝不断线”是吴冠中上世纪80年代前后提出的艺术理念，在中国当代美术史上产生了重要的影响。看上去，这是关于“形式美”与“抽象美”之间内在联系的一种阐述，实则它强调的是：艺术创作再怎么创新，再怎么放飞自我，都不能远离现实生活。在吴冠中看来，抽象绘画就像放风筝，风筝是作品，是“从生活中来的素材和感受，被作者用减法、除法或别的法”抽象成的某一种艺术形式，而观众是天空。要让风筝飞上天空，艺术家手中“须有一线联系着作品与生活中的源头”。只有“风筝不断线”，艺术才有根基，才能保持与观众的交流。</p><p><br></p><p>下列观点符合“风筝不断线”理念的是：</p>', '<p>艺术创作应当以生活为基础</p>', '4824bced6cbf507cf52779565b395248', '2023-05-11 16:17:17', '2023-05-11 16:17:17', 1);
INSERT INTO `exam_question` VALUES ('086c044755e43c584f47e77e633dd108', 1, '317e751103f654a1631725d6e00355bd', '5', 1, '<p>在大家眼中“挣钱多， 说话少， 疯狂加班”的程序员们， 终于发声， 通过这场“996.ICU”运动表达了抵制姿态。“996”作为一句玩笑，迅速被互联网企业员工、即将踏人互联网行业的高校人才以及关注该领域的人们“吵”成话题，这本身就表明了问题的严重性和紧迫性。某些互联网企业如还不肯觉醒，及早调整，也许会失去更多宝贵的发展资源与进步良机。</p><p><br></p><p>这段文字意在强调：</p>', '<p>互联网企业应高度重视加班问题</p>', '78c22f94cc3f296afd5b7f1fb7d5d173', '2023-05-11 16:18:03', '2023-05-11 16:18:03', 1);
INSERT INTO `exam_question` VALUES ('c01bc5f831febd41733b5e454760c6ef', 1, '317e751103f654a1631725d6e00355bd', '5', 1, '<p>中国目前并没有主流的廉租住宅供给渠道，低成本租赁住房的很多功能，是由非正规的“城中村”来承担的。近些年，南方和北方的城市发展差距越来越大，在对这一现象进行解释的研究中，城中村占整个城市建成区面积的比例，应该是一个很有解释能力的变量。南方很多城市“半违章”的城中村，使得低成本可租赁住房的可获得性远远高于北方城市。正是这些低成本的住宅，使得利润微薄的制造业得以在地价昂贵的大城市生存下来。</p><p><br></p><p>这段文字重在说明：</p>', '<p>低成本可租赁住房的可获得性决定了制造业的发展</p>', 'e36531f7fcc94590830677740bc9a6df', '2023-05-11 16:18:54', '2023-05-11 16:18:54', 1);
INSERT INTO `exam_question` VALUES ('bbc861a67f1afaf4008fac7eb1eb8099', 1, '317e751103f654a1631725d6e00355bd', '5', 1, '<p>实施全面的急诊分级制度，技术层面的储备早已完成，关键还是靠患者的认同与服从。相对于“先到先得”的机械公平，按照病情轻重排序，显然是一种更复杂的公平规则。医护人员需要不断加以说服引导并进行医学常识科普，才能让患者理解其中的道理。就诊秩序、医疗效率，从来都与患者群体的科学素养和规则意识密切相关。倘若患者还是只信赖“先到先得”，急诊分级最终多半会不了了之。可以想见，急诊科所面临的许多问题，根源其实都在急诊科之外，这意味着急诊分级制度的推行难度比想象中还要大。</p><p><br></p><p>这段文字意在强调，急诊分级制度的全面实施：</p>', '<p>建立在患者理解认可的基础上</p>', 'e46af991816383b64ed646c21e64e56f', '2023-05-11 16:20:36', '2023-05-11 16:20:36', 1);
INSERT INTO `exam_question` VALUES ('9b7e5babc8b120cca7df281a3336fbb0', 1, '317e751103f654a1631725d6e00355bd', '5', 1, '<p>近年来，3D打印技术开始应用于食品、建筑、医疗卫生、航空航天等多个领域。随着3D打印技术在金属零部件制造上取得较大进展，各国开始探讨其在武器装备制造与维修中的应用。研究表明，3D打印对军用武器及设施维修效果显著，能直接在战场上把需要的零部件“打印”出来，及时、精准完成受损装备的维修，快速恢复其作战能力。然而，这种方式制造的军用设备有着不可避免的缺陷，对装备材料要求极高的军用设备来说，除了尺寸受限，其强度和质量也令人担忧。受技术、成本的限制，3D打印技术难以取代大规模流水线生产。</p><p><br></p><p>这段文字主要介绍了3D打印技术：</p>', '<p>在军事领域的应用情况</p>', 'e136867b2c1470aa755209d320527290', '2023-05-11 16:23:07', '2023-05-11 16:23:07', 1);
INSERT INTO `exam_question` VALUES ('80f28faf4772364901b164664e411ddf', 1, '317e751103f654a1631725d6e00355bd', '5', 1, '<p>艺术博物馆经过近200年的发展，已经从最初的“艺术家的机构”演变为今天“公众的艺术机构”。艺术博物馆的馆长、总监、策展人发现，他们现在面临的最大问题不是和捐赠人、收藏家、同行打交道，而是如何把没有受过艺术教育、缺乏艺术体验的普通人吸引到艺术博物馆里来。潜在的观众群不进博物馆是因为他们不懂艺术史，缺乏相关的艺术体验，一直认为博物馆不欢迎他们，里面没有让他们感兴趣的东西。消除“不舒服感”需要淡化艺术博物馆的精英色彩。艺术并不只关乎大人物，更关乎普通人。从社会学角度讲，后者更重要。</p><p><br></p><p>这段文字主要说明：</p>', '<p>艺术博物馆应该主动贴近普通大众</p>', '8f7a4162c84d116e16620029770f3c26', '2023-05-11 16:24:04', '2023-05-11 16:24:04', 1);
INSERT INTO `exam_question` VALUES ('427a75e275b21672c2821619b7672770', 1, '317e751103f654a1631725d6e00355bd', '5', 1, '<p>现代信息技术与高等教育教学的融合，衍生出大规模在线开放课程，打破了传统教育的时空界限和学校围墙。六年来，中国慕课从无到有，从小到大，在实践中总在向一个共识靠近，那就是高等教育作为高层次人才的主要供给者，知识创新的主要推动者，要回应时代需求，就必须创新发展，把慕课建设作为加快中国教育现代化、发展“互联网+教育”“智能+教育”的战略先手棋，推进这场深度融合信息技术与教育教学的课堂革命向纵深发展。这就意味着，慕课的建设与发展必然离不开高校的参与和支持、学校与社会的共同协力。</p><p><br></p><p>这段文字意在：</p>', '<p>强调高校应在慕课发展中发挥重要作用</p>', 'ad01f84973766164441eec1e008b0e58', '2023-05-11 16:25:24', '2023-05-11 16:25:24', 1);
INSERT INTO `exam_question` VALUES ('525e951501ff24f1b79f4b552d4519fc', 1, '317e751103f654a1631725d6e00355bd', '5', 1, '<p>在现代化进程中，城的比重上升，乡的比重下降，是客观规律，但在我国拥有近14亿人口的国情下，不管工业化、城镇化进展到哪一步，农业都要发展，乡村都不会消亡，城乡将长期共生并存，这也是客观规律。即便我国城镇化率达到70%，农村仍将有4亿多人口。如果在现代化进程中把农村4亿多人落下，到头来“一边是繁荣的城市、一边是凋敝的农村”，这不符合我们党的执政宗旨，也不符合社会主义的本质要求。这样的现代化是不可能取得成功的!40年前，我们通过农村改革拉开了改革开放大幕。40年后的今天，我们应该通过振兴乡村，开启城乡融合发展和现代化建设新局面。</p><p><br></p><p>这段文字主要谈的是：</p>', '<p>乡村振兴战略</p>', '8d288d1cb9494f37da73d0da803f46d2', '2023-05-11 16:32:23', '2023-05-11 16:32:23', 1);
INSERT INTO `exam_question` VALUES ('d3cad9a438a93b6b7943734a6fe274bc', 1, '317e751103f654a1631725d6e00355bd', '5', 1, '<p>罗尔斯曾有一段关于如何读书的自白，颇足发人深省。他说：“我读前人的著作，如休谟或康德，有一个视为当然的假定，即这些作者比我聪明得多。如果不然，我又何必浪费自己和学生的时间去研读他们的著作呢?如果我偶尔在他们的论证中见到了一点错误，我的第一个反应是：他们自己一定早已见到了这个错误，并且处理过了。总之，他们的著作中绝没有简单的一般错误，也没有关系重大的错误。”</p><p><br></p><p>这段文字意在表明：</p>', '<p>读书须持谦逊态度</p>', '32e598ea84699359837594ff1788b33d', '2023-05-11 16:33:27', '2023-05-11 16:33:27', 1);
INSERT INTO `exam_question` VALUES ('45cfb0e1d88384c0d59046035d9573ff', 1, '317e751103f654a1631725d6e00355bd', '5', 1, '<p>过去100多年来，围绕达尔文进化论是否正确的争论从未停歇。不断涌现的科学事实在弥补达尔文当年未曾发现的“缺失环节”的同时，也在检验着达尔文进化论的预测能力。例如，2004年在加拿大发现的“提克塔利克鱼”化石揭示了从鱼类(鳍)到陆生动物(腿)之间的过渡状态，被公认是“种系渐变论”的一个极好例证。当然，达尔文进化论并非完美无缺，它确实存在“可证伪”之处。以自然选择理论为例，它在孟德尔遗传学建立之初就受到了强烈挑战，但各种不能用自然选择理论简单解释的新证据最终还是拓展了人们对进化动力和机制的认识，而不是摒弃该理论。</p><p><br></p><p>这段文字以自然选择理论受到孟德尔遗传学挑战为例，目的是：</p>', '<p>说明达尔文进化论具有可证伪性</p>', '08e9ba886d496b6295cfdf611cdfe9e8', '2023-05-11 16:34:22', '2023-05-11 16:34:22', 1);
INSERT INTO `exam_question` VALUES ('3e814ccc79dcaba8600486c647498db3', 1, '317e751103f654a1631725d6e00355bd', '5', 1, '<p>当前，我国对互联网平台经济创新秉持“包容审慎”的监管原则，然而这并不意味着监管部门可以放任不管。“包容”意在鼓励创新，为各类企业特别是初创型中小企业在发展早期提供更加宽容的营商环境和法治环境，是尊重市场新业态发展规律的体现；“审慎”则是在法治框架和法治原则下开展监管，在触及法治底线和监管红线的问题上必须严格依法监管。因此，.，应合理界定有效创新与有为监管的边界，在鼓励创新与防范风险之间寻求法治框架下的动态平衡。</p><p><br></p><p>填入画横线部分最恰当的一项是：</p>', '<p>面对平台经济创新发展中的风险和挑战</p>', 'aab03434281661244ea7df0c1d9a7404', '2023-05-11 16:35:06', '2023-05-11 16:35:06', 1);
INSERT INTO `exam_question` VALUES ('6770a7836ee56b0e3d6435a888186a78', 1, '317e751103f654a1631725d6e00355bd', '5', 1, '<p>作为世界上最成功的室内栽培植物之一，绿萝几乎就是盆栽的代名词，_______。绿萝这个物种早在1880年就被确认了，但是你很难想象，直到2004年，它的原产地才被确定为法属波利尼西亚社会群岛的莫雷阿岛。更为神秘的是，绿萝是一种过分矜持的植物，虽然它已经扩散到了全世界的热带地区，却只在1962年有过一次确切的开花记录，直到2016年，人们才发现了它开花的秘密。填入画横线部分最恰当的一句是：</p>', '<p>但它却也是我们最熟悉的陌生人</p>', '3c5db2ee23b4ac27a95fb846bbf85613', '2023-05-11 16:36:21', '2023-05-11 16:36:21', 1);
INSERT INTO `exam_question` VALUES ('545e96ab4bd601b6a7c0a3d8fe6923cd', 1, '317e751103f654a1631725d6e00355bd', '5', 1, '<p>目前的全球治理体系是现代文明的产物，是经过长时间博弈和磨合后逐渐形成的。当前的全球治理体系存在两方面问题：一是这一体系仍存在许多合理性，对人类和平与发展有十分重要的作用，但随着时代的发展，这一治理体系及其体制机制未能适应新情况，出现了许多问题，亟需进行改革；二是现代化先发国家在这一体系中仍占据主导地位，长期把控国际外交话语权，将以资本为中心的逻辑贯穿于全球治理体系和治理体制机制。因此，要将构建人类命运共同体理念融人既有的全球治理体系及其相应体制机制，就必须正视上述两方面。</p><p><br></p><p>这段文字接下来最可能讲的是：</p>', '<p>我国参与全球治理体系改革的路径</p>', '93f4693d2ad1e186cbe11afeeec2cbc0', '2023-05-11 16:36:59', '2023-05-11 16:36:59', 1);
INSERT INTO `exam_question` VALUES ('122fb714d1bf3865eec2da3eec182041', 1, '317e751103f654a1631725d6e00355bd', '5', 1, '<p>远古时代，人类一天平均要移动16~22公里，他们走路、奔跑、冲刺、攀爬、游泳、跳跃、举重··他们不得不如此，否则就难以生存。在50万年的进化中，现代人所拥有的思考型的大脑，正是从运动技能的磨炼中进化而来的，人类渐渐有了梦想、计划以及创造的能力，从而创造了现代文明。但讽刺的是，文明的前进速度如此之快，人类的身体和基因却来不及跟上——就基因而言，我们仍然是50万年前的那些狩猎采集者，我们仍然渴望最高热量的食物，但却不再需要运动。最终，久坐不动的现代生活方式成了人类长期生存的重大威胁之一。</p><p><br></p><p>这段文字接下来最可能讲的是：</p>', '<p>运动量少对人类的危害</p>', '25a98216ff61fea544059c4ae779e848', '2023-05-11 16:37:39', '2023-05-11 16:37:39', 1);
INSERT INTO `exam_question` VALUES ('9c09d3095e288ba20a9b6f5335f1ae0a', 1, '317e751103f654a1631725d6e00355bd', '5', 1, '<p>在文字还不普及的时代，民间故事承担了培养人生观、道德观、伦理观的职能，听故事是人们学习传统文化、自然知识、人生哲学等的重要渠道。然而，飞速发展的现代科技正在深刻改变着人们的生活方式，也极大地影响着人们的接受习惯和审美趣味。当下的年轻人对传统文化的感知和了解，更多的是通过影视作品、网络小说、电子游戏等途径，年轻人对传统民间故事中的一些经典形象越来越陌生，不少专家学者表示，打捞“失落”的民间故事刻不容缓。</p><p><br></p><p>接下来最可能讲的是：</p>', '<p>让民间故事为现代人接受的途径</p>', 'e26ef79e370a745d6c72b655a22eb1f8', '2023-05-11 16:38:19', '2023-05-11 16:38:19', 1);
INSERT INTO `exam_question` VALUES ('5d98332d95ae0aa1cadf5f7f5215b1fd', 1, '317e751103f654a1631725d6e00355bd', '5', 1, '<p>①各国对于发动机的制造工艺是严格保密的，甚至对一些顶级的发动机严格控制出口</p><p>②发动机可以说是工业的心脏</p><p>③因此，自主研发成为治愈中国工业“心脏病”最为现实的选择</p><p>④发动机制造水平上不去，是中国工业的“心脏病”</p><p>⑤这使得进口高级发动机的生产线成为奢望</p><p>⑥从轮船、汽车、飞机到火箭，都离不开发动机</p><p><br></p><p>将以上6个句子重新排列，语序正确的是：</p>', '<p>②⑥④①⑤③</p>', 'b2e63c6ee7399dd216c338ff920a8d61', '2023-05-11 16:40:51', '2023-05-11 16:40:51', 1);
INSERT INTO `exam_question` VALUES ('62348a890afab4a530fada3086b257de', 1, '317e751103f654a1631725d6e00355bd', '5', 1, '<p>①中国企业若想出口稀土产品，必须向行业巨头缴纳高额的专利许可费，否则产品无法出口</p><p>②稀土永磁材料领域的研发重点包括提高材料性能、扩大高端领域应用等；稀土发光材料领域的技术创新点集中在光电材料、反光材料等</p><p>③经历了被人“扼住咽喉”的切肤之痛后，我国稀土企业的创新脚步愈加快速</p><p>④然而在很长一段时间内，我国的稀土企业在国际市场处于受制于人的局面</p><p>⑤多年来，在与世界各国的“稀土大战”中，我国凭借世界第一的稀土储量，逐步在开采、分离技术领域确立了全球领先的地位</p><p>⑥目前，我国稀土领域的创新主要集中于产业链上游的稀土材料领域，多家企业重点发展具有超高性能的稀土永磁材料、稀土发光材料等</p><p><br></p><p>将以上6个句子重新排列，语序正确的是：</p>', '<p>⑤④①③⑥②</p>', 'a94d22e2f6998f1e5a1917340d0e5812', '2023-05-11 16:42:13', '2023-05-11 16:42:13', 1);

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
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '试题选项' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of exam_question_item
-- ----------------------------
INSERT INTO `exam_question_item` VALUES ('72625e08bc4fae67dfe5d33f145f0588', '<p>《共产党宣言》的发表</p>', 1, '2023-05-11 15:13:12', '2023-05-11 15:13:12', 1);
INSERT INTO `exam_question_item` VALUES ('f8c94f213664851d7a742d343bc1a89e', '<p>《资本论》的出版</p>', 2, '2023-05-11 15:13:12', '2023-05-11 15:13:12', 1);
INSERT INTO `exam_question_item` VALUES ('66d14b5252da10b66d6682c43c21a061', '<p>巴黎公社的建立</p>', 3, '2023-05-11 15:13:12', '2023-05-11 15:13:12', 1);
INSERT INTO `exam_question_item` VALUES ('8c2bca7a65ed31d67a418cdd89a2b6d4', '<p>十月革命的胜利</p>', 4, '2023-05-11 15:13:12', '2023-05-11 15:13:12', 1);
INSERT INTO `exam_question_item` VALUES ('7f04b36deee4b2710e7fd0c5c6779153', '<p>“人窑一色，出窑万彩”是钧瓷的特点</p>', 1, '2023-05-11 15:14:34', '2023-05-11 15:14:34', 1);
INSERT INTO `exam_question_item` VALUES ('a58ba430c2bedb11438623f23adb4912', '<p>紫砂壶是用含铁量较高的黏土制成的</p>', 2, '2023-05-11 15:14:34', '2023-05-11 15:14:34', 1);
INSERT INTO `exam_question_item` VALUES ('d6bb44afa9c2cbc470929ed46ab1a99b', '<p>景德镇在宋代时期主要烧制青白瓷</p>', 3, '2023-05-11 15:14:34', '2023-05-11 15:14:34', 1);
INSERT INTO `exam_question_item` VALUES ('e78cb3f5297f9a4055109578b0028eb3', '<p>唐三彩中最具代表性的造型是虎和骆驼</p>', 4, '2023-05-11 15:14:34', '2023-05-11 15:14:34', 1);
INSERT INTO `exam_question_item` VALUES ('517d17364e66e4a00efdb6aa4645c90b', '<p>孟子——穷则独善其身，达则兼济天下</p>', 1, '2023-05-11 15:16:09', '2023-05-11 15:16:09', 1);
INSERT INTO `exam_question_item` VALUES ('7e64015c216b888ff854e392322e0365', '<p>林则徐——苟利国家生死以，岂因祸福避趋之</p>', 2, '2023-05-11 15:16:09', '2023-05-11 15:16:09', 1);
INSERT INTO `exam_question_item` VALUES ('070beab19ed2947bf125eab868f5b6a8', '<p>梁启超——国家之主人为谁?即一国之民是也</p>', 3, '2023-05-11 15:16:09', '2023-05-11 15:16:09', 1);
INSERT INTO `exam_question_item` VALUES ('17d8d189d45f2b423279c2e6cd44a663', '<p>曾国藩——天变不足畏，祖宗不足法，人言不足恤</p>', 4, '2023-05-11 15:16:09', '2023-05-11 15:16:09', 1);
INSERT INTO `exam_question_item` VALUES ('afa358b74a96521330a32c9a0f99d4f4', '<p>鲁迅一《阿Q正传》一绍兴</p>', 1, '2023-05-11 15:18:31', '2023-05-11 15:18:31', 1);
INSERT INTO `exam_question_item` VALUES ('a2a91243d1697e59364d9c49cc2694ab', '<p>沈从文一《边城》一湘西</p>', 2, '2023-05-11 15:18:31', '2023-05-11 15:18:31', 1);
INSERT INTO `exam_question_item` VALUES ('59d44a1585b3eeaf7967ab582376d765', '<p>汪曾祺一《受戒》一高邮</p>', 3, '2023-05-11 15:18:31', '2023-05-11 15:18:31', 1);
INSERT INTO `exam_question_item` VALUES ('ad346684d0833577f00c2014270168a3', '<p>莫言一《红高粱》一东北</p>', 4, '2023-05-11 15:18:31', '2023-05-11 15:18:31', 1);
INSERT INTO `exam_question_item` VALUES ('22756baf56e3ba7ec6d4b97fbac3e385', '<p>齐物；中庸；正名</p>', 1, '2023-05-11 15:19:26', '2023-05-11 15:19:26', 1);
INSERT INTO `exam_question_item` VALUES ('7b93ab0da1448524c2026d01dd8262b9', '<p>四谛；五行；三纲</p>', 2, '2023-05-11 15:19:26', '2023-05-11 15:19:26', 1);
INSERT INTO `exam_question_item` VALUES ('8b2bbd0b7a42054af6525d7776cca27a', '<p>五常；自然；因缘</p>', 3, '2023-05-11 15:19:26', '2023-05-11 15:19:26', 1);
INSERT INTO `exam_question_item` VALUES ('3993a6291cc3b1d8c9c3b4c8be1c6ce9', '<p>兼爱；良知；涅槃</p>', 4, '2023-05-11 15:19:26', '2023-05-11 15:19:26', 1);
INSERT INTO `exam_question_item` VALUES ('e46c9003b2f847ff379193c654aa9200', '<p>中国、印度都有人获得</p>', 1, '2023-05-11 15:21:31', '2023-05-11 15:21:31', 1);
INSERT INTO `exam_question_item` VALUES ('5740ab20c4e925a11a24f5a11372b233', '<p>雪国》是获奖作家川端康成的作品</p>', 2, '2023-05-11 15:21:31', '2023-05-11 15:21:31', 1);
INSERT INTO `exam_question_item` VALUES ('34121e0e0cf597ea6c49162ffd38c2af', '<p>《百年孤独》是获奖作品</p>', 3, '2023-05-11 15:21:31', '2023-05-11 15:21:31', 1);
INSERT INTO `exam_question_item` VALUES ('3ef54dabe1d28f42e3a2e9701c5a8925', '<p>列夫·托尔斯泰是获奖作家</p>', 4, '2023-05-11 15:21:31', '2023-05-11 15:21:31', 1);
INSERT INTO `exam_question_item` VALUES ('af80924b07fc8421eb834baa037fced5', '<p>.燕太子丹与荆轲分坐八仙桌两侧，秉烛夜谈，谋划赴咸阳刺杀秦王计划</p>', 1, '2023-05-11 15:22:20', '2023-05-11 15:22:20', 1);
INSERT INTO `exam_question_item` VALUES ('73921dacda908fab9f246fe05dd8bfcd', '<p>毛泽东与李宗仁幽默地说：德邻先生，你这次归国，是误上了贼船啊</p>', 2, '2023-05-11 15:22:20', '2023-05-11 15:22:20', 1);
INSERT INTO `exam_question_item` VALUES ('1eb8fe5d0250cbed8147e637d19d2fef', '<p>魏征劝谏李世民时，说道：陛下当先天下之忧而忧，后天下之乐而乐</p>', 3, '2023-05-11 15:22:20', '2023-05-11 15:22:20', 1);
INSERT INTO `exam_question_item` VALUES ('ffaefe8ede16840275e907eeb28926fe', '<p>越王勾践兵败后给吴王夫差当奴仆，以红薯充饥，每晚则睡在柴垛上</p><p><br></p>', 4, '2023-05-11 15:22:20', '2023-05-11 15:22:20', 1);
INSERT INTO `exam_question_item` VALUES ('92d88af560cc8a19bf83a1cb90bfdb0e', '<p>雨点从高空中匀速下落时只有重力做功</p>', 1, '2023-05-11 15:23:03', '2023-05-11 15:23:03', 1);
INSERT INTO `exam_question_item` VALUES ('43b33fad2c6874f1216cf294c88c3a42', '<p>匀速圆周运动的物体动能始终发生变化</p>', 2, '2023-05-11 15:23:03', '2023-05-11 15:23:03', 1);
INSERT INTO `exam_question_item` VALUES ('76ee3b248751132952cac6a67d1259b3', '<p>自由落体过程中物体的机械能保持不变</p>', 3, '2023-05-11 15:23:03', '2023-05-11 15:23:03', 1);
INSERT INTO `exam_question_item` VALUES ('63892d33ea1c48f75b88e2467a7b203e', '<p>向上飞的石子重力做负功导致势能减小</p>', 4, '2023-05-11 15:23:03', '2023-05-11 15:23:03', 1);
INSERT INTO `exam_question_item` VALUES ('bd282ded77e21f8dea65577a6ff3fab6', '<p>母猩猩哺育幼猩猩</p>', 1, '2023-05-11 15:23:54', '2023-05-11 15:23:54', 1);
INSERT INTO `exam_question_item` VALUES ('8331d758ed79c1b8729a4476a00cb955', '<p>乌贼遇敌喷出墨汁</p>', 2, '2023-05-11 15:23:54', '2023-05-11 15:23:54', 1);
INSERT INTO `exam_question_item` VALUES ('74df6ce5c0bbb6ab003e534fd2e8e769', '<p>蜂王依靠工蜂喂养</p>', 3, '2023-05-11 15:23:54', '2023-05-11 15:23:54', 1);
INSERT INTO `exam_question_item` VALUES ('0bf2cfc5c639d7e7662dcbd6b16dc5b7', '<p>狗为吃骨头而争斗</p><p><br></p>', 4, '2023-05-11 15:23:54', '2023-05-11 15:23:54', 1);
INSERT INTO `exam_question_item` VALUES ('f399ad0e297bfc45e3c1e55039e47bf5', '<p>中国蝗灾最严重的地区是两湖地区</p>', 1, '2023-05-11 15:25:41', '2023-05-11 15:25:41', 1);
INSERT INTO `exam_question_item` VALUES ('8234f537d9392e3fe8fc05bb834a044e', '<p>稻飞虱的天敌有蜘蛛、青蛙</p>', 2, '2023-05-11 15:25:41', '2023-05-11 15:25:41', 1);
INSERT INTO `exam_question_item` VALUES ('1ae6f1dbaf0fa099fde3c3632ea87ac9', '<p>松毛虫在高温干旱环境下更易繁殖</p>', 3, '2023-05-11 15:25:41', '2023-05-11 15:25:41', 1);
INSERT INTO `exam_question_item` VALUES ('f05e8b5a0a5689c531c311647fdee74b', '<p>鼠类会啃食庄稼的茎、叶、根和种子</p>', 4, '2023-05-11 15:25:41', '2023-05-11 15:25:41', 1);
INSERT INTO `exam_question_item` VALUES ('93a5827b2e932b21ee51a0f0cb21510a', '<p>铁球</p>', 1, '2023-05-11 15:26:37', '2023-05-11 15:26:37', 1);
INSERT INTO `exam_question_item` VALUES ('e07aed2a9b1fbca732e7bada42444177', '<p>铝球</p>', 2, '2023-05-11 15:26:37', '2023-05-11 15:26:37', 1);
INSERT INTO `exam_question_item` VALUES ('06888d7820eb25b1e023eae73310a1b4', '<p>铜球</p>', 3, '2023-05-11 15:26:37', '2023-05-11 15:26:37', 1);
INSERT INTO `exam_question_item` VALUES ('2c2257a6216aa2c5b6cd1a635c751d71', '<p>铅球</p>', 4, '2023-05-11 15:26:37', '2023-05-11 15:26:37', 1);
INSERT INTO `exam_question_item` VALUES ('b896e351d661e39e322faac30baa8086', '<p>树脂镜片和普通玻璃镜片的透光率不相上下</p>', 1, '2023-05-11 15:27:48', '2023-05-11 15:27:48', 1);
INSERT INTO `exam_question_item` VALUES ('5678d1512736825a441bbcdeb453ced2', '<p>树脂镜片的抗撞击力比普通玻璃镜片更强</p>', 2, '2023-05-11 15:27:48', '2023-05-11 15:27:48', 1);
INSERT INTO `exam_question_item` VALUES ('55bd535fddac99d6ad24bf1244f9e186', '<p>和同样大小的普通玻璃镜片相比，树脂镜片要轻得多</p>', 3, '2023-05-11 15:27:48', '2023-05-11 15:27:48', 1);
INSERT INTO `exam_question_item` VALUES ('d7454888a762aaaa9a57240321989082', '<p>和普通玻璃镜片相比，树脂镜片更加耐磨</p>', 4, '2023-05-11 15:27:48', '2023-05-11 15:27:48', 1);
INSERT INTO `exam_question_item` VALUES ('d3d0c52d16e253ac5ac69b8843aab38e', '<p>塑料大棚的薄膜能够提高光照强度</p>', 1, '2023-05-11 15:28:31', '2023-05-11 15:28:31', 1);
INSERT INTO `exam_question_item` VALUES ('26baaf0025916e153c39698b29fa740e', '<p>搭建塑料大棚能有效防御地质灾害</p>', 2, '2023-05-11 15:28:31', '2023-05-11 15:28:31', 1);
INSERT INTO `exam_question_item` VALUES ('e3279ae96d8d9a997ce8f9be7764c0d9', '<p>冬季在塑料大棚内熏烟有助于防御霜冻</p>', 3, '2023-05-11 15:28:31', '2023-05-11 15:28:31', 1);
INSERT INTO `exam_question_item` VALUES ('3c11a4b7640d3d5ab1531369a02393b3', '<p>无土栽培技术必须在塑料大棚中进行</p>', 4, '2023-05-11 15:28:31', '2023-05-11 15:28:31', 1);
INSERT INTO `exam_question_item` VALUES ('e6d5f2533048792d01ce69dbfd70e51b', '<p>主频是路由器中央处理器的时钟频率</p>', 1, '2023-05-11 15:29:46', '2023-05-11 15:29:46', 1);
INSERT INTO `exam_question_item` VALUES ('42073b6c1fadf881e2526b5b4f9d6a03', '<p>此款路由器属于千兆无线路由器</p>', 2, '2023-05-11 15:29:46', '2023-05-11 15:29:46', 1);
INSERT INTO `exam_question_item` VALUES ('4bb6e1dc56e6363a3ae08480c3ae4bdf', '<p>路由器的LAN口可以用来连接外网</p>', 3, '2023-05-11 15:29:46', '2023-05-11 15:29:46', 1);
INSERT INTO `exam_question_item` VALUES ('f2a956dbffeff78de5cf48f51338d8d3', '<p>5GHz频段比2.4GHz频段传输距离短</p>', 4, '2023-05-11 15:29:46', '2023-05-11 15:29:46', 1);
INSERT INTO `exam_question_item` VALUES ('ab50a1ea38954943f1d9c00587c1630a', '<p>阿富汗</p>', 1, '2023-05-11 15:30:25', '2023-05-11 15:30:25', 1);
INSERT INTO `exam_question_item` VALUES ('ef45d9fe0d844d6f7dc6f53baa7df1ce', '<p>南非</p>', 2, '2023-05-11 15:30:25', '2023-05-11 15:30:25', 1);
INSERT INTO `exam_question_item` VALUES ('e57efd9eb8d32feccd8ecff2e061ecf8', '<p>新加坡</p>', 3, '2023-05-11 15:30:25', '2023-05-11 15:30:25', 1);
INSERT INTO `exam_question_item` VALUES ('0445f8f1e4ca444966f0142db7ebe508', '<p>挪威</p>', 4, '2023-05-11 15:30:25', '2023-05-11 15:30:25', 1);
INSERT INTO `exam_question_item` VALUES ('4335d5c613b996d5fbb4e0835c60b5d7', '<p>英国</p>', 1, '2023-05-11 15:31:13', '2023-05-11 15:31:13', 1);
INSERT INTO `exam_question_item` VALUES ('da5424f1a128c5f389bdac7666aac3b3', '<p>德国</p>', 2, '2023-05-11 15:31:13', '2023-05-11 15:31:13', 1);
INSERT INTO `exam_question_item` VALUES ('8faa67e00cada101039f9f250cac3959', '<p>意大利</p>', 3, '2023-05-11 15:31:13', '2023-05-11 15:31:13', 1);
INSERT INTO `exam_question_item` VALUES ('163b78b2de4a65714283337675f1b643', '<p>瑞士</p>', 4, '2023-05-11 15:31:13', '2023-05-11 15:31:13', 1);
INSERT INTO `exam_question_item` VALUES ('65fa03128d6d9ba5484955872a6470ed', '<p>遗嘱继承&gt;遗赠扶养协议&gt;法定继承</p>', 1, '2023-05-11 15:32:07', '2023-05-11 15:32:07', 1);
INSERT INTO `exam_question_item` VALUES ('0ee16f58f145becd7eeb16df000578c9', '<p>法定继承&gt;遗赠扶养协议&gt;遗嘱继承</p>', 2, '2023-05-11 15:32:07', '2023-05-11 15:32:07', 1);
INSERT INTO `exam_question_item` VALUES ('f26e461584854793473d85ba60bc9aad', '<p>遗赠扶养协议&gt;遗嘱继承&gt;法定继承</p>', 3, '2023-05-11 15:32:07', '2023-05-11 15:32:07', 1);
INSERT INTO `exam_question_item` VALUES ('e6dd1d1889cca959cabd10d87a3276d8', '<p>遗赠扶养协议&gt;法定继承&gt;遗嘱继承</p>', 4, '2023-05-11 15:32:07', '2023-05-11 15:32:07', 1);
INSERT INTO `exam_question_item` VALUES ('ff6e780be3776eed19fb2ae22e9c949b', '<p>①②</p>', 1, '2023-05-11 15:33:37', '2023-05-11 15:33:37', 1);
INSERT INTO `exam_question_item` VALUES ('9085a7d1d913aa270789fcdb526ae309', '<p>①④</p>', 2, '2023-05-11 15:33:37', '2023-05-11 15:33:37', 1);
INSERT INTO `exam_question_item` VALUES ('cd617ebdf80411e826b6477733a7bdf8', '<p>②③</p>', 3, '2023-05-11 15:33:37', '2023-05-11 15:33:37', 1);
INSERT INTO `exam_question_item` VALUES ('36bd5fdf6c77e339c317dded73a4eb85', '<p>③④</p>', 4, '2023-05-11 15:33:37', '2023-05-11 15:33:37', 1);
INSERT INTO `exam_question_item` VALUES ('f5e7955898554f49982c075c6ea828bc', '<p>“重点突破，强化应用”是社会信用体系建设的主要原则之一</p>', 1, '2023-05-11 15:34:24', '2023-05-11 15:34:24', 1);
INSERT INTO `exam_question_item` VALUES ('b91722e892ed085b76ed045d738fe6b3', '<p>为惩戒失信被执行人，规定其不得以财产支付子女就读高等院校的费用</p>', 2, '2023-05-11 15:34:24', '2023-05-11 15:34:24', 1);
INSERT INTO `exam_question_item` VALUES ('1e741653dc3bf390d93926c2822c2741', '<p>推进青年信用体系建设，逐步应用到人学、就业、创业等领域</p>', 3, '2023-05-11 15:34:24', '2023-05-11 15:34:24', 1);
INSERT INTO `exam_question_item` VALUES ('de8ccbb857efb830f23e71253a228e6a', '<p>使统一社会信用代码成为企业的唯一身份代码</p>', 4, '2023-05-11 15:34:24', '2023-05-11 15:34:24', 1);
INSERT INTO `exam_question_item` VALUES ('50dbcced1930655c49c452996516e685', '<p>招投标时不得设置与业务能力无关的企业规模门槛</p>', 1, '2023-05-11 15:35:04', '2023-05-11 15:35:04', 1);
INSERT INTO `exam_question_item` VALUES ('d3aa34f74df27b50bfafa1d6712a9425', '<p>在人才引进支持政策方面对民营企业一视同仁，支持民营企业引进海外高层次人才</p>', 2, '2023-05-11 15:35:04', '2023-05-11 15:35:04', 1);
INSERT INTO `exam_question_item` VALUES ('881a839d6401bb4203d9b52bae96f0c4', '<p>鼓励民营企业积极参与社会公益、慈善事业</p>', 3, '2023-05-11 15:35:04', '2023-05-11 15:35:04', 1);
INSERT INTO `exam_question_item` VALUES ('a394085966588f15117f5d079cfce874', '<p>在电力、电信、铁路、石油等行业和领域，向民营企业全面开放</p>', 4, '2023-05-11 15:35:04', '2023-05-11 15:35:04', 1);
INSERT INTO `exam_question_item` VALUES ('2613c9b0ded3d1ca5f1f579db8fb619a', '<p>独具一格、立足之地</p>', 1, '2023-05-11 15:41:09', '2023-05-11 15:41:09', 1);
INSERT INTO `exam_question_item` VALUES ('aa0a3124fedb1193c74bd2169a48be24', '<p>众所周知、一席之地</p>', 2, '2023-05-11 15:41:09', '2023-05-11 15:41:09', 1);
INSERT INTO `exam_question_item` VALUES ('551f4c6578aad16d2a1349cef3a7f2cf', '<p>不可替代、用武之地</p>', 3, '2023-05-11 15:41:09', '2023-05-11 15:41:09', 1);
INSERT INTO `exam_question_item` VALUES ('cf19081e3027d56d1bbb8655dda2daa3', '<p>显而易见、立锥之地</p>', 4, '2023-05-11 15:41:09', '2023-05-11 15:41:09', 1);
INSERT INTO `exam_question_item` VALUES ('8623e87015c5944de6f8c8d0fdf4911e', '<p>孤注一掷</p>', 1, '2023-05-11 15:43:53', '2023-05-11 15:43:53', 1);
INSERT INTO `exam_question_item` VALUES ('33b321c65d0a9fbbf71e0360a8bc5dc8', '<p>歇斯底里</p>', 2, '2023-05-11 15:43:53', '2023-05-11 15:43:53', 1);
INSERT INTO `exam_question_item` VALUES ('28d19a2015ed3190993c466e14548cbd', '<p>困兽犹斗</p>', 3, '2023-05-11 15:43:53', '2023-05-11 15:43:53', 1);
INSERT INTO `exam_question_item` VALUES ('40ea4d62e412ccc9dfa27081af15973d', '<p>背水一战</p>', 4, '2023-05-11 15:43:53', '2023-05-11 15:43:53', 1);
INSERT INTO `exam_question_item` VALUES ('94e514b297b3304b8987820336084b38', '<p>无可辩驳、充耳不闻</p>', 1, '2023-05-11 15:45:10', '2023-05-11 15:45:10', 1);
INSERT INTO `exam_question_item` VALUES ('4b15a254022451f1b5000ebd5306d0ac', '<p>.心服口服、置之不理</p>', 2, '2023-05-11 15:45:10', '2023-05-11 15:45:10', 1);
INSERT INTO `exam_question_item` VALUES ('97c639cc9a335cce22629898b0355f6d', '<p>不置可否、不以为然</p>', 3, '2023-05-11 15:45:10', '2023-05-11 15:45:10', 1);
INSERT INTO `exam_question_item` VALUES ('7a775b63b1e1c3b8d12f882c428cdfde', '<p>眼见为实、将信将疑</p>', 4, '2023-05-11 15:45:10', '2023-05-11 15:45:10', 1);
INSERT INTO `exam_question_item` VALUES ('cae2f37a65ee9f8f7f784ae979368871', '<p>哗众取宠、失枝脱节</p>', 1, '2023-05-11 15:46:32', '2023-05-11 15:46:32', 1);
INSERT INTO `exam_question_item` VALUES ('4372f294a4be90b790712fc2a9e6ee5c', '<p>喧宾夺主、貌合神离</p>', 2, '2023-05-11 15:46:32', '2023-05-11 15:46:32', 1);
INSERT INTO `exam_question_item` VALUES ('411c9de21886b53348de3a24ca7edf90', '<p>主次颠倒、亦步亦趋</p>', 3, '2023-05-11 15:46:32', '2023-05-11 15:46:32', 1);
INSERT INTO `exam_question_item` VALUES ('2acaf23459971592befed145474c78af', '<p>避重就轻、格格不人</p>', 4, '2023-05-11 15:46:32', '2023-05-11 15:46:32', 1);
INSERT INTO `exam_question_item` VALUES ('61439d30ec90d117365b7c1ef8ea82a2', '<p>屈指可数、指日可待</p>', 1, '2023-05-11 15:47:32', '2023-05-11 15:47:32', 1);
INSERT INTO `exam_question_item` VALUES ('e129e9eb95548305359b72a5c4a94ba0', '<p>广阔无垠、回头是岸</p>', 2, '2023-05-11 15:47:32', '2023-05-11 15:47:32', 1);
INSERT INTO `exam_question_item` VALUES ('85258db09e11f6529f4b5df5ba2f6a4b', '<p>比比皆是、遥遥无期</p>', 3, '2023-05-11 15:47:32', '2023-05-11 15:47:32', 1);
INSERT INTO `exam_question_item` VALUES ('8eb04907a5d6ff8c5f841f04800d0701', '<p>寥寥无几、遥不可及</p>', 4, '2023-05-11 15:47:32', '2023-05-11 15:47:32', 1);
INSERT INTO `exam_question_item` VALUES ('4f2b60c4f670cce33b9afd97c28c04cb', '<p>有目共睹、各行其是</p>', 1, '2023-05-11 15:48:38', '2023-05-11 15:48:38', 1);
INSERT INTO `exam_question_item` VALUES ('539b9b3f3c2d2bba4e13a2773f93ea35', '<p>高歌猛进、独善其身</p>', 2, '2023-05-11 15:48:38', '2023-05-11 15:48:38', 1);
INSERT INTO `exam_question_item` VALUES ('5e8e729319a3030f5930e0a7f1120ff2', '<p>方兴未艾、两败俱伤</p>', 3, '2023-05-11 15:48:38', '2023-05-11 15:48:38', 1);
INSERT INTO `exam_question_item` VALUES ('a532fea5654998e9d32cf790b597fd8f', '<p>势不可挡、以邻为壑</p>', 4, '2023-05-11 15:48:38', '2023-05-11 15:48:38', 1);
INSERT INTO `exam_question_item` VALUES ('39b134db18d296099747c243fb15b7e1', '<p>合理见多识广博弈</p>', 1, '2023-05-11 15:50:31', '2023-05-11 15:50:31', 1);
INSERT INTO `exam_question_item` VALUES ('2ffbde1236b5689a2086ba20f74e9cb3', '<p>可靠有备而来较量</p>', 2, '2023-05-11 15:50:31', '2023-05-11 15:50:31', 1);
INSERT INTO `exam_question_item` VALUES ('9868846e4257d02c15c08b81135d885b', '<p>科学不露声色抗衡</p>', 3, '2023-05-11 15:50:31', '2023-05-11 15:50:31', 1);
INSERT INTO `exam_question_item` VALUES ('e1020d6720ac4d86a624b549e8381cdd', '<p>准确从容不迫对决</p>', 4, '2023-05-11 15:50:31', '2023-05-11 15:50:31', 1);
INSERT INTO `exam_question_item` VALUES ('18a7a4e7445d849dd7bbd2a547e42fb2', '<p>问题、出神人化、出色</p>', 1, '2023-05-11 15:51:55', '2023-05-11 15:51:55', 1);
INSERT INTO `exam_question_item` VALUES ('567bf8bd829c4bc389a95c58c85871fa', '<p>短板、惟妙惟肖、难得</p>', 2, '2023-05-11 15:51:56', '2023-05-11 15:51:56', 1);
INSERT INTO `exam_question_item` VALUES ('afb8f218e2d1ef1e79c98a9b0d09d8b6', '<p>缺陷、面面俱到、独到</p>', 3, '2023-05-11 15:51:56', '2023-05-11 15:51:56', 1);
INSERT INTO `exam_question_item` VALUES ('e98fd8afdf208ebd5a4b768915027eea', '<p>局限、栩栩如生、擅长</p>', 4, '2023-05-11 15:51:56', '2023-05-11 15:51:56', 1);
INSERT INTO `exam_question_item` VALUES ('e1453dcbf72bb350070e6379beb42e5a', '<p>目标、因势利导</p>', 1, '2023-05-11 15:53:11', '2023-05-11 15:53:11', 1);
INSERT INTO `exam_question_item` VALUES ('0fe8132a3f795e6b7ea17d59ea44fb1a', '<p>原则、总揽全局</p>', 2, '2023-05-11 15:53:11', '2023-05-11 15:53:11', 1);
INSERT INTO `exam_question_item` VALUES ('7967a94aca16d27d92500dbca31caa45', '<p>模本、穿针引线</p>', 3, '2023-05-11 15:53:11', '2023-05-11 15:53:11', 1);
INSERT INTO `exam_question_item` VALUES ('6fff7a545d12ef92b351c51270fad43a', '<p>途径、保驾护航</p>', 4, '2023-05-11 15:53:11', '2023-05-11 15:53:11', 1);
INSERT INTO `exam_question_item` VALUES ('3868dd54f4b3a69a12683ee7220d11ab', '<p>源源不断、筛选、顾此失彼</p>', 1, '2023-05-11 15:55:14', '2023-05-11 15:55:14', 1);
INSERT INTO `exam_question_item` VALUES ('3882fc34fffb98908b026f40ec934997', '<p>滔滔不竭、挑选、杞人忧天</p>', 2, '2023-05-11 15:55:14', '2023-05-11 15:55:14', 1);
INSERT INTO `exam_question_item` VALUES ('edfd2353c114b69d31158511af1d75c9', '<p>络绎不绝、遴选、应接不暇</p>', 3, '2023-05-11 15:55:14', '2023-05-11 15:55:14', 1);
INSERT INTO `exam_question_item` VALUES ('e421352b2133e628850d61a2c58d2d57', '<p>层出不穷、甄选、急于求成</p>', 4, '2023-05-11 15:55:14', '2023-05-11 15:55:14', 1);
INSERT INTO `exam_question_item` VALUES ('30b48107345f7866a4ae1a624fcf9162', '<p>萌动、调整、地久天长</p>', 1, '2023-05-11 16:01:01', '2023-05-11 16:01:01', 1);
INSERT INTO `exam_question_item` VALUES ('a84d4f4402703cd98e50c7d7b6bec96a', '<p>涌动、调整、山长水远</p>', 2, '2023-05-11 16:01:01', '2023-05-11 16:01:01', 1);
INSERT INTO `exam_question_item` VALUES ('729c8a0c2b898e167b742f46357b5104', '<p>萌动、调节、山长水远</p>', 3, '2023-05-11 16:01:01', '2023-05-11 16:01:01', 1);
INSERT INTO `exam_question_item` VALUES ('7e8a4345d300f7da88606922afa3bc76', '<p>涌动、调节、地久天长</p>', 4, '2023-05-11 16:01:01', '2023-05-11 16:01:01', 1);
INSERT INTO `exam_question_item` VALUES ('ae14fd4afbe3904b794fe044d0958e4d', '<p>稀松平常、必需、举足轻重</p>', 1, '2023-05-11 16:02:13', '2023-05-11 16:02:13', 1);
INSERT INTO `exam_question_item` VALUES ('82c0759c947d76c298f5b14f52d76778', '<p>理所当然、稀缺、至关重要</p>', 2, '2023-05-11 16:02:13', '2023-05-11 16:02:13', 1);
INSERT INTO `exam_question_item` VALUES ('eed6b08ba58029ce52de511217b15b76', '<p>天经地义、关键、承上启下</p>', 3, '2023-05-11 16:02:13', '2023-05-11 16:02:13', 1);
INSERT INTO `exam_question_item` VALUES ('bce334ffd0bc6eceb4cd576602c8f4b1', '<p>手到擒来、珍贵、一以贯之</p>', 4, '2023-05-11 16:02:13', '2023-05-11 16:02:13', 1);
INSERT INTO `exam_question_item` VALUES ('bf49341b5571b1cf80673e74b88c933d', '<p>别出心裁、随意性</p>', 1, '2023-05-11 16:03:16', '2023-05-11 16:03:16', 1);
INSERT INTO `exam_question_item` VALUES ('d68c44ac0736dea034a41c0e54a8f666', '<p>相映成趣、特殊性</p>', 2, '2023-05-11 16:03:16', '2023-05-11 16:03:16', 1);
INSERT INTO `exam_question_item` VALUES ('6107e4e92ba62ac5012c07c840800c87', '<p>亦庄亦谐、偶然性</p>', 3, '2023-05-11 16:03:16', '2023-05-11 16:03:16', 1);
INSERT INTO `exam_question_item` VALUES ('c7402dbee8e65dd651c2963f955ea449', '<p>妙趣横生、随机性</p>', 4, '2023-05-11 16:03:16', '2023-05-11 16:03:16', 1);
INSERT INTO `exam_question_item` VALUES ('75b2b9553b9b9b4089e6eedba8316f5d', '<p>凝结、眺望、一目了然</p>', 1, '2023-05-11 16:04:35', '2023-05-11 16:04:35', 1);
INSERT INTO `exam_question_item` VALUES ('b193e3f505505bfafa8083b7cbb75540', '<p>固结、目睹、一览而尽</p>', 2, '2023-05-11 16:04:35', '2023-05-11 16:04:35', 1);
INSERT INTO `exam_question_item` VALUES ('40567ad6efbf4622fce1cb697f990a0c', '<p>冻结、捕捉、一览无余</p>', 3, '2023-05-11 16:04:35', '2023-05-11 16:04:35', 1);
INSERT INTO `exam_question_item` VALUES ('7e1edbcc920fbac6fbc920b91c1ead91', '<p>凝固、观测、一目千里</p>', 4, '2023-05-11 16:04:35', '2023-05-11 16:04:35', 1);
INSERT INTO `exam_question_item` VALUES ('0478de2518e6eaae586bc1df03174c46', '<p>桥梁、动力</p>', 1, '2023-05-11 16:05:35', '2023-05-11 16:05:35', 1);
INSERT INTO `exam_question_item` VALUES ('67543e932919630c79ae8358e59e97c4', '<p>媒介、根底</p>', 2, '2023-05-11 16:05:35', '2023-05-11 16:05:35', 1);
INSERT INTO `exam_question_item` VALUES ('c6dd01bd7398b9bf9ce8a53dc5f63f7f', '<p>源头、基础</p>', 3, '2023-05-11 16:05:35', '2023-05-11 16:05:35', 1);
INSERT INTO `exam_question_item` VALUES ('8d872b0a70ca8600b51705641fc04f50', '<p>依托、根脉</p>', 4, '2023-05-11 16:05:35', '2023-05-11 16:05:35', 1);
INSERT INTO `exam_question_item` VALUES ('4c8fee2246fe42230ab2ed40a4664726', '<p>蔓延、守护、犹豫</p>', 1, '2023-05-11 16:07:18', '2023-05-11 16:07:18', 1);
INSERT INTO `exam_question_item` VALUES ('b3537efe52593d1782465b3d31596e3f', '<p>扩散、占据、退缩</p>', 2, '2023-05-11 16:07:18', '2023-05-11 16:07:18', 1);
INSERT INTO `exam_question_item` VALUES ('932f60a524a2e0eca9590dc1f3d39897', '<p>滋生、控制、识野</p>', 3, '2023-05-11 16:07:18', '2023-05-11 16:07:18', 1);
INSERT INTO `exam_question_item` VALUES ('d076c4a1298f55db850bf573943969e7', '<p>泛滥、堂握、含糊</p>', 4, '2023-05-11 16:07:18', '2023-05-11 16:07:18', 1);
INSERT INTO `exam_question_item` VALUES ('8ccc109afc2cdd48bd6c55b425d7236b', '<p>吸引、释放</p>', 1, '2023-05-11 16:08:17', '2023-05-11 16:08:17', 1);
INSERT INTO `exam_question_item` VALUES ('23bdc4c397302df7ceeed291cacfc0ad', '<p>刺激、膨胀</p>', 2, '2023-05-11 16:08:17', '2023-05-11 16:08:17', 1);
INSERT INTO `exam_question_item` VALUES ('637d9194199f06a8f346006a7ed43cde', '<p>激励、迸发</p>', 3, '2023-05-11 16:08:17', '2023-05-11 16:08:17', 1);
INSERT INTO `exam_question_item` VALUES ('2562a72265dc4b7d57631b5049f14bea', '<p>促进、凸显</p>', 4, '2023-05-11 16:08:17', '2023-05-11 16:08:17', 1);
INSERT INTO `exam_question_item` VALUES ('205b0ba53d2d2facc276f35d0993cd6c', '<p>羡慕、播种、期许、牵引</p>', 1, '2023-05-11 16:09:41', '2023-05-11 16:09:41', 1);
INSERT INTO `exam_question_item` VALUES ('a4347b6b5825d0dbd4558c1e522bfe2e', '<p>向往、播撒、期许、指引</p>', 2, '2023-05-11 16:09:41', '2023-05-11 16:09:41', 1);
INSERT INTO `exam_question_item` VALUES ('967ece8abfc481c21e60df7866f337c6', '<p>心动、播种、期待、指引</p>', 3, '2023-05-11 16:09:41', '2023-05-11 16:09:41', 1);
INSERT INTO `exam_question_item` VALUES ('4ed2b37a6bc51a1d8cd1d3baa8159b46', '<p>爱慕、播撒、期待、牵引</p>', 4, '2023-05-11 16:09:41', '2023-05-11 16:09:41', 1);
INSERT INTO `exam_question_item` VALUES ('334bc78d185198c4eea23cbe79a79828', '<p>简单、范本</p>', 1, '2023-05-11 16:10:40', '2023-05-11 16:10:40', 1);
INSERT INTO `exam_question_item` VALUES ('ae0fa3c96514b5eef27f481767dbf6af', '<p>盲目、方向</p>', 2, '2023-05-11 16:10:40', '2023-05-11 16:10:40', 1);
INSERT INTO `exam_question_item` VALUES ('0753d448da2c7f82b0b48c2c5dd8a831', '<p>机械、蓝图</p>', 3, '2023-05-11 16:10:40', '2023-05-11 16:10:40', 1);
INSERT INTO `exam_question_item` VALUES ('8e370b370f5718d3d9cae50f9528edd5', '<p>被动、模式</p>', 4, '2023-05-11 16:10:40', '2023-05-11 16:10:40', 1);
INSERT INTO `exam_question_item` VALUES ('a1d184c87b28b6888fd41e3088fac8a0', '<p>改造</p>', 1, '2023-05-11 16:11:16', '2023-05-11 16:11:16', 1);
INSERT INTO `exam_question_item` VALUES ('91d44d90e8dbe00137aad6118542f00e', '<p>改线</p>', 2, '2023-05-11 16:11:16', '2023-05-11 16:11:16', 1);
INSERT INTO `exam_question_item` VALUES ('9fcb705ff0fd11f8370b04875ce10220', '<p>改变</p>', 3, '2023-05-11 16:11:16', '2023-05-11 16:11:16', 1);
INSERT INTO `exam_question_item` VALUES ('a8b6d89affc30d1458026c7ec5e4ac80', '<p>改良</p>', 4, '2023-05-11 16:11:16', '2023-05-11 16:11:16', 1);
INSERT INTO `exam_question_item` VALUES ('aab04abfd7993cb563632bc702d7cae2', '<p>“生活之美”永流传</p>', 1, '2023-05-11 16:12:43', '2023-05-11 16:12:43', 1);
INSERT INTO `exam_question_item` VALUES ('bc26a4f47c4b6fd0bccca581d1ec2960', '<p>“匠作精神”不能丢</p>', 2, '2023-05-11 16:12:43', '2023-05-11 16:12:43', 1);
INSERT INTO `exam_question_item` VALUES ('aa830d44839faaf754425921ae30ad86', '<p>传统工艺的传承之路</p>', 3, '2023-05-11 16:12:43', '2023-05-11 16:12:43', 1);
INSERT INTO `exam_question_item` VALUES ('3c67f586ff884f642bc11f9fd2e1dd3e', '<p>传统工艺的生活美学</p>', 4, '2023-05-11 16:12:43', '2023-05-11 16:12:43', 1);
INSERT INTO `exam_question_item` VALUES ('f9fa833f3115d53de7789c1988ce1122', '<p>“重道轻器”可休矣</p>', 1, '2023-05-11 16:13:25', '2023-05-11 16:13:25', 1);
INSERT INTO `exam_question_item` VALUES ('14d47592e414029b6c2996cb71c40c2c', '<p>现代战场“技谋”不可弱</p>', 2, '2023-05-11 16:13:25', '2023-05-11 16:13:25', 1);
INSERT INTO `exam_question_item` VALUES ('edcf9a25e4e9d8b4f644c6fb314973e0', '<p>英雄当以“谋”为先</p>', 3, '2023-05-11 16:13:25', '2023-05-11 16:13:25', 1);
INSERT INTO `exam_question_item` VALUES ('171abc6db039cb6560cc858376fd876a', '<p>指挥员的“制胜密码”</p>', 4, '2023-05-11 16:13:25', '2023-05-11 16:13:25', 1);
INSERT INTO `exam_question_item` VALUES ('5bf0d844f5146327a2c216e0eeb50428', '<p>传统文学期刊面临着如何吸引年轻一代读者的问题</p>', 1, '2023-05-11 16:14:57', '2023-05-11 16:14:57', 1);
INSERT INTO `exam_question_item` VALUES ('d01e49540b8275b63bfbea6fa61a1c6e', '<p>传统文学期刊“触网”是顺应时代潮流，大势所趋</p>', 2, '2023-05-11 16:14:57', '2023-05-11 16:14:57', 1);
INSERT INTO `exam_question_item` VALUES ('de17e3b9ce96d608b6823918d9f5ff38', '<p>纯文学杂志走向数字化是摆脱目前困境的唯一救赎</p>', 3, '2023-05-11 16:14:57', '2023-05-11 16:14:57', 1);
INSERT INTO `exam_question_item` VALUES ('071b0921d9c2a8948af9bb923c365dac', '<p>过去的几十年，纯文学杂志保持着纸质媒介的传统</p>', 4, '2023-05-11 16:14:57', '2023-05-11 16:14:57', 1);
INSERT INTO `exam_question_item` VALUES ('f49f6e5849ef231782242eb976bb7e75', '<p>艺术来源于生活而高于生活</p>', 1, '2023-05-11 16:17:17', '2023-05-11 16:17:17', 1);
INSERT INTO `exam_question_item` VALUES ('d348b3da1efcb75297123f50b345e9d1', '<p>艺术的第一目的是再现现实</p>', 2, '2023-05-11 16:17:17', '2023-05-11 16:17:17', 1);
INSERT INTO `exam_question_item` VALUES ('4824bced6cbf507cf52779565b395248', '<p>艺术创作应当以生活为基础</p>', 3, '2023-05-11 16:17:17', '2023-05-11 16:17:17', 1);
INSERT INTO `exam_question_item` VALUES ('93257d782f3c1ebc446c012c52df5dba', '<p>艺术离开民众就失去了土壤</p>', 4, '2023-05-11 16:17:17', '2023-05-11 16:17:17', 1);
INSERT INTO `exam_question_item` VALUES ('89949832b6a8bf71b9887f111eb07dd6', '<p>加班成为程序员们无奈的选择</p>', 1, '2023-05-11 16:18:03', '2023-05-11 16:18:03', 1);
INSERT INTO `exam_question_item` VALUES ('326e159ecbf69ef7870502b5165dcd0d', '<p>互联网企业员工开始抵制加班</p>', 2, '2023-05-11 16:18:03', '2023-05-11 16:18:03', 1);
INSERT INTO `exam_question_item` VALUES ('78c22f94cc3f296afd5b7f1fb7d5d173', '<p>互联网企业应高度重视加班问题</p>', 3, '2023-05-11 16:18:03', '2023-05-11 16:18:03', 1);
INSERT INTO `exam_question_item` VALUES ('72770459a97ed2fe0b74b69cfbcf8056', '<p>“996”成为了当前的热门话题</p>', 4, '2023-05-11 16:18:03', '2023-05-11 16:18:03', 1);
INSERT INTO `exam_question_item` VALUES ('ea090a8e6174e8b4e26ac03eb1d2a6de', '<p>城市管理者不应对已有的城中村违章现象加以限制</p>', 1, '2023-05-11 16:18:54', '2023-05-11 16:18:54', 1);
INSERT INTO `exam_question_item` VALUES ('e8c8d27cf8d30333d02a56ed48c8137e', '<p>利润微薄的制造业很难在房价高昂的城市生存发展</p>', 2, '2023-05-11 16:18:54', '2023-05-11 16:18:54', 1);
INSERT INTO `exam_question_item` VALUES ('e36531f7fcc94590830677740bc9a6df', '<p>低成本可租赁住房的可获得性决定了制造业的发展</p>', 3, '2023-05-11 16:18:54', '2023-05-11 16:18:54', 1);
INSERT INTO `exam_question_item` VALUES ('2dbd1af75527204cd13eeb0d3847f8af', '<p>制造业在南方城市的发展与廉租房的供给密切相关</p>', 4, '2023-05-11 16:18:54', '2023-05-11 16:18:54', 1);
INSERT INTO `exam_question_item` VALUES ('e46af991816383b64ed646c21e64e56f', '<p>建立在患者理解认可的基础上</p>', 1, '2023-05-11 16:20:36', '2023-05-11 16:20:36', 1);
INSERT INTO `exam_question_item` VALUES ('29791277a519b86cd75f76b793957642', '<p>应以更公平规则的确立为前提</p>', 2, '2023-05-11 16:20:36', '2023-05-11 16:20:36', 1);
INSERT INTO `exam_question_item` VALUES ('a70878c549588d48fc407323c8018a45', '<p>有助于医疗效率的大幅提高</p>', 3, '2023-05-11 16:20:36', '2023-05-11 16:20:36', 1);
INSERT INTO `exam_question_item` VALUES ('f43dc9168435213dc99b78661530917a', '<p>有赖于医学常识的广泛普及</p>', 4, '2023-05-11 16:20:36', '2023-05-11 16:20:36', 1);
INSERT INTO `exam_question_item` VALUES ('17254a04bf454ad021258d8453e7729b', '<p>广阔的应用前景</p>', 1, '2023-05-11 16:23:07', '2023-05-11 16:23:07', 1);
INSERT INTO `exam_question_item` VALUES ('3d3edeb622528932770c789b6f92934f', '<p>取得的最新进展</p>', 2, '2023-05-11 16:23:07', '2023-05-11 16:23:07', 1);
INSERT INTO `exam_question_item` VALUES ('e136867b2c1470aa755209d320527290', '<p>在军事领域的应用情况</p>', 3, '2023-05-11 16:23:07', '2023-05-11 16:23:07', 1);
INSERT INTO `exam_question_item` VALUES ('280e8cb0bcfd930ce32a07acccbea65b', '<p>与大规模流水线生产的区别</p>', 4, '2023-05-11 16:23:07', '2023-05-11 16:23:07', 1);
INSERT INTO `exam_question_item` VALUES ('424c727e6dd563c1d284fc77dcdfc4c4', '<p>艺术教育的普及将大众引向博物馆</p>', 1, '2023-05-11 16:24:04', '2023-05-11 16:24:04', 1);
INSERT INTO `exam_question_item` VALUES ('5940080c13dfed03fa7583851f8a52fd', '<p>精英化是当下艺术发展的方向</p>', 2, '2023-05-11 16:24:04', '2023-05-11 16:24:04', 1);
INSERT INTO `exam_question_item` VALUES ('8f7a4162c84d116e16620029770f3c26', '<p>艺术博物馆应该主动贴近普通大众</p>', 3, '2023-05-11 16:24:04', '2023-05-11 16:24:04', 1);
INSERT INTO `exam_question_item` VALUES ('f48cd8554493813bc44f3b9af69029f9', '<p>公众的艺术欣赏水平和层次不断提高</p>', 4, '2023-05-11 16:24:04', '2023-05-11 16:24:04', 1);
INSERT INTO `exam_question_item` VALUES ('4a7a29157e984c8611f835d008933059', '<p>介绍中国慕课的发展理念和现状</p>', 1, '2023-05-11 16:25:24', '2023-05-11 16:25:24', 1);
INSERT INTO `exam_question_item` VALUES ('ad01f84973766164441eec1e008b0e58', '<p>强调高校应在慕课发展中发挥重要作用</p>', 2, '2023-05-11 16:25:24', '2023-05-11 16:25:24', 1);
INSERT INTO `exam_question_item` VALUES ('2a29db16ed6f8e664f32afaf2ec81a13', '<p>说明高校需重视高级人才的培养和储备</p>', 3, '2023-05-11 16:25:24', '2023-05-11 16:25:24', 1);
INSERT INTO `exam_question_item` VALUES ('09cfdf5714440ea72cf81bf02a341ba4', '<p>探讨中国慕课突破传统的新思路</p>', 4, '2023-05-11 16:25:24', '2023-05-11 16:25:24', 1);
INSERT INTO `exam_question_item` VALUES ('0e4c56f8dd58a67c5cbed4b0dd94699b', '<p>城镇化建设</p>', 1, '2023-05-11 16:32:23', '2023-05-11 16:32:23', 1);
INSERT INTO `exam_question_item` VALUES ('887860aa2c436d4c4f8be10091096972', '<p>全面建成小康社会</p>', 2, '2023-05-11 16:32:23', '2023-05-11 16:32:23', 1);
INSERT INTO `exam_question_item` VALUES ('8d288d1cb9494f37da73d0da803f46d2', '<p>乡村振兴战略</p>', 3, '2023-05-11 16:32:23', '2023-05-11 16:32:23', 1);
INSERT INTO `exam_question_item` VALUES ('fe14b2cb6104ac8266cad2942faa9534', '<p>脱贫攻坚</p>', 4, '2023-05-11 16:32:23', '2023-05-11 16:32:23', 1);
INSERT INTO `exam_question_item` VALUES ('cbfb8c5c761a968b54ed6974b8f527c0', '<p>读书要有怀疑精神</p>', 1, '2023-05-11 16:33:27', '2023-05-11 16:33:27', 1);
INSERT INTO `exam_question_item` VALUES ('32e598ea84699359837594ff1788b33d', '<p>读书须持谦逊态度</p>', 2, '2023-05-11 16:33:27', '2023-05-11 16:33:27', 1);
INSERT INTO `exam_question_item` VALUES ('edb528bd0b51c42906bd3995f8420b5d', '<p>读书最忌不求甚解</p>', 3, '2023-05-11 16:33:27', '2023-05-11 16:33:27', 1);
INSERT INTO `exam_question_item` VALUES ('56733e39c2692e1459df8e2dedf7fc2a', '<p>读书不能人云亦云</p>', 4, '2023-05-11 16:33:27', '2023-05-11 16:33:27', 1);
INSERT INTO `exam_question_item` VALUES ('08e9ba886d496b6295cfdf611cdfe9e8', '<p>说明达尔文进化论具有可证伪性</p>', 1, '2023-05-11 16:34:22', '2023-05-11 16:34:22', 1);
INSERT INTO `exam_question_item` VALUES ('e5b45732e6fecb42460afddb9aacb27c', '<p>证明达尔文进化论具有预测能力</p>', 2, '2023-05-11 16:34:22', '2023-05-11 16:34:22', 1);
INSERT INTO `exam_question_item` VALUES ('cbff849723dcaddf0db5234befc43ed4', '<p>提出“种系渐变论”的事实例证</p>', 3, '2023-05-11 16:34:22', '2023-05-11 16:34:22', 1);
INSERT INTO `exam_question_item` VALUES ('9b77beae4e1176d455806e9e6328fd1e', '<p>加深人们对生物进化机制的认识</p>', 4, '2023-05-11 16:34:22', '2023-05-11 16:34:22', 1);
INSERT INTO `exam_question_item` VALUES ('e60b90dd02599081d0a7e0f3d6e29674', '<p>保障平台经济在创新发展与监管内运行</p>', 1, '2023-05-11 16:35:06', '2023-05-11 16:35:06', 1);
INSERT INTO `exam_question_item` VALUES ('aab03434281661244ea7df0c1d9a7404', '<p>面对平台经济创新发展中的风险和挑战</p>', 2, '2023-05-11 16:35:06', '2023-05-11 16:35:06', 1);
INSERT INTO `exam_question_item` VALUES ('b31e66fa20162fca94f398fc96119ecf', '<p>平台风险控制和危机管理容易陷入困境</p>', 3, '2023-05-11 16:35:06', '2023-05-11 16:35:06', 1);
INSERT INTO `exam_question_item` VALUES ('39aff8eb39fc2fd423d77679b293d706', '<p>正确甄别平台的经济创新和发展的能力</p>', 4, '2023-05-11 16:35:06', '2023-05-11 16:35:06', 1);
INSERT INTO `exam_question_item` VALUES ('aaededc4612da4c61b6d34d5051ab9d8', '<p>唯一的遗憾就是绿萝从来不开花</p>', 1, '2023-05-11 16:36:21', '2023-05-11 16:36:21', 1);
INSERT INTO `exam_question_item` VALUES ('dfb599c27a5d6b13392c4125e8eb7234', '<p>因为它非常适合人类的居住环境</p>', 2, '2023-05-11 16:36:21', '2023-05-11 16:36:21', 1);
INSERT INTO `exam_question_item` VALUES ('3c5db2ee23b4ac27a95fb846bbf85613', '<p>但它却也是我们最熟悉的陌生人</p>', 3, '2023-05-11 16:36:21', '2023-05-11 16:36:21', 1);
INSERT INTO `exam_question_item` VALUES ('9b0d5e094a501cb44532009ad2f19e23', '<p>是一种不可多得的室内观叶植物</p>', 4, '2023-05-11 16:36:21', '2023-05-11 16:36:21', 1);
INSERT INTO `exam_question_item` VALUES ('93f4693d2ad1e186cbe11afeeec2cbc0', '<p>我国参与全球治理体系改革的路径</p>', 1, '2023-05-11 16:36:59', '2023-05-11 16:36:59', 1);
INSERT INTO `exam_question_item` VALUES ('1d408e1ceb1d97be000c6b623c5fef9f', '<p>人类命运共同体理念的形成与发展</p>', 2, '2023-05-11 16:36:59', '2023-05-11 16:36:59', 1);
INSERT INTO `exam_question_item` VALUES ('659d81440c3c8c92803cad0bfe0df492', '<p>全球治理体系所面临的机遇与挑战</p>', 3, '2023-05-11 16:36:59', '2023-05-11 16:36:59', 1);
INSERT INTO `exam_question_item` VALUES ('4b89a7dc93905470cc0b441182042560', '<p>当前全球治理体系存在的制度缺陷</p>', 4, '2023-05-11 16:36:59', '2023-05-11 16:36:59', 1);
INSERT INTO `exam_question_item` VALUES ('aca9fcd3d679d72aac374ff6b6a57812', '<p>热量对人体的重要意义</p>', 1, '2023-05-11 16:37:39', '2023-05-11 16:37:39', 1);
INSERT INTO `exam_question_item` VALUES ('c556e1ab22efd4f4e74778718e54eaaa', '<p>运动对人类进化的好处</p>', 2, '2023-05-11 16:37:39', '2023-05-11 16:37:39', 1);
INSERT INTO `exam_question_item` VALUES ('ef2141ce4e825074d3994a0931c6ca4d', '<p>基因与人类健康的关系</p>', 3, '2023-05-11 16:37:39', '2023-05-11 16:37:39', 1);
INSERT INTO `exam_question_item` VALUES ('25a98216ff61fea544059c4ae779e848', '<p>运动量少对人类的危害</p>', 4, '2023-05-11 16:37:39', '2023-05-11 16:37:39', 1);
INSERT INTO `exam_question_item` VALUES ('e26ef79e370a745d6c72b655a22eb1f8', '<p>让民间故事为现代人接受的途径</p>', 1, '2023-05-11 16:38:19', '2023-05-11 16:38:19', 1);
INSERT INTO `exam_question_item` VALUES ('ca36bc8ae3139829c1ab6f56b4788272', '<p>民间故事与传统文化之间的关系</p>', 2, '2023-05-11 16:38:19', '2023-05-11 16:38:19', 1);
INSERT INTO `exam_question_item` VALUES ('13fb42a98c644c949255374f64629556', '<p>年轻一代对民间故事的了解状况</p>', 3, '2023-05-11 16:38:19', '2023-05-11 16:38:19', 1);
INSERT INTO `exam_question_item` VALUES ('bc606281e22de51b8ce7197b51add06c', '<p>现代科技对民间故事传播的冲击</p>', 4, '2023-05-11 16:38:19', '2023-05-11 16:38:19', 1);
INSERT INTO `exam_question_item` VALUES ('b2e63c6ee7399dd216c338ff920a8d61', '<p>②⑥④①⑤③</p>', 1, '2023-05-11 16:40:51', '2023-05-11 16:40:51', 1);
INSERT INTO `exam_question_item` VALUES ('3783cb6ee8d83adae5474a25f44e46b4', '<p>⑥④②⑤①③</p>', 2, '2023-05-11 16:40:51', '2023-05-11 16:40:51', 1);
INSERT INTO `exam_question_item` VALUES ('f502e1b28dde521f0162f12a32b87e27', '<p>①③⑤④⑥②</p>', 3, '2023-05-11 16:40:51', '2023-05-11 16:40:51', 1);
INSERT INTO `exam_question_item` VALUES ('029c584139342d1118a04ced72cf7264', '<p>④②⑥③①⑤</p>', 4, '2023-05-11 16:40:51', '2023-05-11 16:40:51', 1);
INSERT INTO `exam_question_item` VALUES ('ae1b0f76271baeda966f249189d89e36', '<p>⑥④①③⑤②</p>', 1, '2023-05-11 16:42:13', '2023-05-11 16:42:13', 1);
INSERT INTO `exam_question_item` VALUES ('a94d22e2f6998f1e5a1917340d0e5812', '<p>⑤④①③⑥②</p>', 2, '2023-05-11 16:42:13', '2023-05-11 16:42:13', 1);
INSERT INTO `exam_question_item` VALUES ('ba4df8202255a53bfdca58dcd39c0118', '<p>⑤⑥②①④③</p>', 3, '2023-05-11 16:42:13', '2023-05-11 16:42:13', 1);
INSERT INTO `exam_question_item` VALUES ('79edef69f0f1b737c4502d43faced30b', '<p>⑥②⑤④①③</p>', 4, '2023-05-11 16:42:13', '2023-05-11 16:42:13', 1);

-- ----------------------------
-- Table structure for exam_question_relation_item
-- ----------------------------
DROP TABLE IF EXISTS `exam_question_relation_item`;
CREATE TABLE `exam_question_relation_item`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `q_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '试题id',
  `i_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '选项id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '试题和试题选项关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of exam_question_relation_item
-- ----------------------------
INSERT INTO `exam_question_relation_item` VALUES ('95ddb93eca73276eb83cc612472eab34', '9bedb5b238562daf2143180298849ebf', '72625e08bc4fae67dfe5d33f145f0588');
INSERT INTO `exam_question_relation_item` VALUES ('f6dbafca1582fb5d8f8ce9aa5e200916', '9bedb5b238562daf2143180298849ebf', 'f8c94f213664851d7a742d343bc1a89e');
INSERT INTO `exam_question_relation_item` VALUES ('1dcb94862cfbb9393688edc10d5f3d42', '9bedb5b238562daf2143180298849ebf', '66d14b5252da10b66d6682c43c21a061');
INSERT INTO `exam_question_relation_item` VALUES ('0de79b65f66e987b4e6f1068f33b4675', '9bedb5b238562daf2143180298849ebf', '8c2bca7a65ed31d67a418cdd89a2b6d4');
INSERT INTO `exam_question_relation_item` VALUES ('a7ed3ba4b4aa8ba9ccc7c4827d75e3c4', '63876d1673e3bfce901ca83b981e0d2a', '7f04b36deee4b2710e7fd0c5c6779153');
INSERT INTO `exam_question_relation_item` VALUES ('0ee53ff5f6cd313ac3a0fb9775d678e9', '63876d1673e3bfce901ca83b981e0d2a', 'a58ba430c2bedb11438623f23adb4912');
INSERT INTO `exam_question_relation_item` VALUES ('b843a12ad45dd09222003f9419e89902', '63876d1673e3bfce901ca83b981e0d2a', 'd6bb44afa9c2cbc470929ed46ab1a99b');
INSERT INTO `exam_question_relation_item` VALUES ('581c3b59a6af557839c4141b80f4b124', '63876d1673e3bfce901ca83b981e0d2a', 'e78cb3f5297f9a4055109578b0028eb3');
INSERT INTO `exam_question_relation_item` VALUES ('2ce3a3baf6e9fe43f46eff3dfed82bf3', 'bbb635a0942dc27937ed68ce0895bac7', '517d17364e66e4a00efdb6aa4645c90b');
INSERT INTO `exam_question_relation_item` VALUES ('3bf0e44a44f14b9834a0bc4a89901212', 'bbb635a0942dc27937ed68ce0895bac7', '7e64015c216b888ff854e392322e0365');
INSERT INTO `exam_question_relation_item` VALUES ('b9d00231a255a0c99356759f221ae784', 'bbb635a0942dc27937ed68ce0895bac7', '070beab19ed2947bf125eab868f5b6a8');
INSERT INTO `exam_question_relation_item` VALUES ('3275542075c4059fdca6d643f31eb639', 'bbb635a0942dc27937ed68ce0895bac7', '17d8d189d45f2b423279c2e6cd44a663');
INSERT INTO `exam_question_relation_item` VALUES ('b5b2e58f44891b5935dd2a0d79d4e129', 'd4948f01ad1c45ab10d831d9dbd6cb62', 'afa358b74a96521330a32c9a0f99d4f4');
INSERT INTO `exam_question_relation_item` VALUES ('15aee0f859154191de3db4a9b4464f5b', 'd4948f01ad1c45ab10d831d9dbd6cb62', 'a2a91243d1697e59364d9c49cc2694ab');
INSERT INTO `exam_question_relation_item` VALUES ('41fb012372721431dc0af12b50ff9514', 'd4948f01ad1c45ab10d831d9dbd6cb62', '59d44a1585b3eeaf7967ab582376d765');
INSERT INTO `exam_question_relation_item` VALUES ('dd9ad9c8e706191843c2cef4b8073e30', 'd4948f01ad1c45ab10d831d9dbd6cb62', 'ad346684d0833577f00c2014270168a3');
INSERT INTO `exam_question_relation_item` VALUES ('31d054f08293930373686f58da615f64', '398516c1ab0e86e7ee45854f17655497', '22756baf56e3ba7ec6d4b97fbac3e385');
INSERT INTO `exam_question_relation_item` VALUES ('70683ee7e25d25592a9d17d20f87cd09', '398516c1ab0e86e7ee45854f17655497', '7b93ab0da1448524c2026d01dd8262b9');
INSERT INTO `exam_question_relation_item` VALUES ('2d79d555737132bcb4a9b362d0dcad4c', '398516c1ab0e86e7ee45854f17655497', '8b2bbd0b7a42054af6525d7776cca27a');
INSERT INTO `exam_question_relation_item` VALUES ('53ff090ac5c38ae0fdd8bb62e6d75527', '398516c1ab0e86e7ee45854f17655497', '3993a6291cc3b1d8c9c3b4c8be1c6ce9');
INSERT INTO `exam_question_relation_item` VALUES ('b2067379998a9b34968195c2f0f3bb47', '75b885bbe0eb8df256656d7fb08ed84f', 'e46c9003b2f847ff379193c654aa9200');
INSERT INTO `exam_question_relation_item` VALUES ('2ed7efc154d18234608115be94fae321', '75b885bbe0eb8df256656d7fb08ed84f', '5740ab20c4e925a11a24f5a11372b233');
INSERT INTO `exam_question_relation_item` VALUES ('73f8e986579bbed7223a8e794b2db003', '75b885bbe0eb8df256656d7fb08ed84f', '34121e0e0cf597ea6c49162ffd38c2af');
INSERT INTO `exam_question_relation_item` VALUES ('39ea7b829dea83457cf3aa25b67062b9', '75b885bbe0eb8df256656d7fb08ed84f', '3ef54dabe1d28f42e3a2e9701c5a8925');
INSERT INTO `exam_question_relation_item` VALUES ('1bb2b2ade74b2a984450778c291f695d', 'b8e4200f085214c55ac3055dadc943c4', 'af80924b07fc8421eb834baa037fced5');
INSERT INTO `exam_question_relation_item` VALUES ('8375f55928bb608955f6ed09655aa9c4', 'b8e4200f085214c55ac3055dadc943c4', '73921dacda908fab9f246fe05dd8bfcd');
INSERT INTO `exam_question_relation_item` VALUES ('44a9f97e5f0bd3c7135798d42eec5b1a', 'b8e4200f085214c55ac3055dadc943c4', '1eb8fe5d0250cbed8147e637d19d2fef');
INSERT INTO `exam_question_relation_item` VALUES ('90947ac80a55486ef6115dcc677b68b1', 'b8e4200f085214c55ac3055dadc943c4', 'ffaefe8ede16840275e907eeb28926fe');
INSERT INTO `exam_question_relation_item` VALUES ('bc31fa5c7a0bf4910dcdb3d0dd3f6f3b', 'bc919abb73b2a030cb468e409fa97eba', '92d88af560cc8a19bf83a1cb90bfdb0e');
INSERT INTO `exam_question_relation_item` VALUES ('e5450c2ca361bb46bd4d1ed6d381ce46', 'bc919abb73b2a030cb468e409fa97eba', '43b33fad2c6874f1216cf294c88c3a42');
INSERT INTO `exam_question_relation_item` VALUES ('1796348c557b99f87b8306489318ae42', 'bc919abb73b2a030cb468e409fa97eba', '76ee3b248751132952cac6a67d1259b3');
INSERT INTO `exam_question_relation_item` VALUES ('552a8d7b4e31ef8d2223c678833817af', 'bc919abb73b2a030cb468e409fa97eba', '63892d33ea1c48f75b88e2467a7b203e');
INSERT INTO `exam_question_relation_item` VALUES ('3ff95dd9226abd2faa5db2fce6d7a1c4', '5c77c8c11e8bcdf8fc6941b2bab06c94', 'bd282ded77e21f8dea65577a6ff3fab6');
INSERT INTO `exam_question_relation_item` VALUES ('faeaa0089f068a3e7dd26dc5e865e38e', '5c77c8c11e8bcdf8fc6941b2bab06c94', '8331d758ed79c1b8729a4476a00cb955');
INSERT INTO `exam_question_relation_item` VALUES ('e716e7f669d8f55c1f48b56ef579ef8a', '5c77c8c11e8bcdf8fc6941b2bab06c94', '74df6ce5c0bbb6ab003e534fd2e8e769');
INSERT INTO `exam_question_relation_item` VALUES ('9580eddceb342fda2ac0769d95cd52ff', '5c77c8c11e8bcdf8fc6941b2bab06c94', '0bf2cfc5c639d7e7662dcbd6b16dc5b7');
INSERT INTO `exam_question_relation_item` VALUES ('603ae254c1b84725dd178bd226f01f76', '4f51b313e3f8c0226aef0e0b26574d8c', 'f399ad0e297bfc45e3c1e55039e47bf5');
INSERT INTO `exam_question_relation_item` VALUES ('08513a11518e1f70454bea6d6e526cf5', '4f51b313e3f8c0226aef0e0b26574d8c', '8234f537d9392e3fe8fc05bb834a044e');
INSERT INTO `exam_question_relation_item` VALUES ('00295c4ddd61934418a4e1edc4b7fbe6', '4f51b313e3f8c0226aef0e0b26574d8c', '1ae6f1dbaf0fa099fde3c3632ea87ac9');
INSERT INTO `exam_question_relation_item` VALUES ('6ddf75d36eee5c24dc10716bc8e5aa14', '4f51b313e3f8c0226aef0e0b26574d8c', 'f05e8b5a0a5689c531c311647fdee74b');
INSERT INTO `exam_question_relation_item` VALUES ('526d62a51bd539490d825223f0e2c690', '1223752cce350f37efa01b7328d74e11', '93a5827b2e932b21ee51a0f0cb21510a');
INSERT INTO `exam_question_relation_item` VALUES ('bd424f8da4512c9a9a10f8236a0cdd08', '1223752cce350f37efa01b7328d74e11', 'e07aed2a9b1fbca732e7bada42444177');
INSERT INTO `exam_question_relation_item` VALUES ('7777973737aca16866f1ae54690cad96', '1223752cce350f37efa01b7328d74e11', '06888d7820eb25b1e023eae73310a1b4');
INSERT INTO `exam_question_relation_item` VALUES ('03f5f1a7bc64d178c929f676d7122b41', '1223752cce350f37efa01b7328d74e11', '2c2257a6216aa2c5b6cd1a635c751d71');
INSERT INTO `exam_question_relation_item` VALUES ('2fca105b160269456239d3cd9394b640', '886d893d696089a22e8ed29ced779e58', 'b896e351d661e39e322faac30baa8086');
INSERT INTO `exam_question_relation_item` VALUES ('d090dcc851415d50c19235e1a89db7f2', '886d893d696089a22e8ed29ced779e58', '5678d1512736825a441bbcdeb453ced2');
INSERT INTO `exam_question_relation_item` VALUES ('95da0bfa89e65ad57947562f2b486944', '886d893d696089a22e8ed29ced779e58', '55bd535fddac99d6ad24bf1244f9e186');
INSERT INTO `exam_question_relation_item` VALUES ('225b065b0034360f57c55b65ec546cee', '886d893d696089a22e8ed29ced779e58', 'd7454888a762aaaa9a57240321989082');
INSERT INTO `exam_question_relation_item` VALUES ('16d0acecc11c033bc821642cccabc44d', 'c8edfdb8a397ca33fc3602ee9f50227c', 'd3d0c52d16e253ac5ac69b8843aab38e');
INSERT INTO `exam_question_relation_item` VALUES ('3fd3412d570a8d045bfc72f14693c2e4', 'c8edfdb8a397ca33fc3602ee9f50227c', '26baaf0025916e153c39698b29fa740e');
INSERT INTO `exam_question_relation_item` VALUES ('4a7d9d73941321ee9bfb2d8921cf83d5', 'c8edfdb8a397ca33fc3602ee9f50227c', 'e3279ae96d8d9a997ce8f9be7764c0d9');
INSERT INTO `exam_question_relation_item` VALUES ('76a8db58648f3b72744edfd518a40ee0', 'c8edfdb8a397ca33fc3602ee9f50227c', '3c11a4b7640d3d5ab1531369a02393b3');
INSERT INTO `exam_question_relation_item` VALUES ('a92ea622396164b0befbcdb6da9abbb5', 'd2c1fec59bf024ba0b7aff502230d0cb', 'e6d5f2533048792d01ce69dbfd70e51b');
INSERT INTO `exam_question_relation_item` VALUES ('979949df0382dff63b1318b474e0b226', 'd2c1fec59bf024ba0b7aff502230d0cb', '42073b6c1fadf881e2526b5b4f9d6a03');
INSERT INTO `exam_question_relation_item` VALUES ('bb15af3efa1640fe2767b5afe3b392df', 'd2c1fec59bf024ba0b7aff502230d0cb', '4bb6e1dc56e6363a3ae08480c3ae4bdf');
INSERT INTO `exam_question_relation_item` VALUES ('e99c519e991751f4d49b97ee03844ca3', 'd2c1fec59bf024ba0b7aff502230d0cb', 'f2a956dbffeff78de5cf48f51338d8d3');
INSERT INTO `exam_question_relation_item` VALUES ('0a44d0b98c821291647501ad33ace574', '62dfea90bbce44e4e724a63e353b263d', 'ab50a1ea38954943f1d9c00587c1630a');
INSERT INTO `exam_question_relation_item` VALUES ('3ae3dab65f2410a4bfa23c7dac3c4254', '62dfea90bbce44e4e724a63e353b263d', 'ef45d9fe0d844d6f7dc6f53baa7df1ce');
INSERT INTO `exam_question_relation_item` VALUES ('d65114d5673b24d30eac2e2570f63830', '62dfea90bbce44e4e724a63e353b263d', 'e57efd9eb8d32feccd8ecff2e061ecf8');
INSERT INTO `exam_question_relation_item` VALUES ('a96375270782d53397893822c28d99b7', '62dfea90bbce44e4e724a63e353b263d', '0445f8f1e4ca444966f0142db7ebe508');
INSERT INTO `exam_question_relation_item` VALUES ('f2a7287b1fa15666948a1d6991e6eb1e', 'd7d60f96dbe27a1907f4bc8d9fe41ca0', '4335d5c613b996d5fbb4e0835c60b5d7');
INSERT INTO `exam_question_relation_item` VALUES ('10343090e3e68e816e753ecd48e30c6a', 'd7d60f96dbe27a1907f4bc8d9fe41ca0', 'da5424f1a128c5f389bdac7666aac3b3');
INSERT INTO `exam_question_relation_item` VALUES ('b82de93329f3249d45ca36e807c1ad35', 'd7d60f96dbe27a1907f4bc8d9fe41ca0', '8faa67e00cada101039f9f250cac3959');
INSERT INTO `exam_question_relation_item` VALUES ('e618f3b455804e1758c96c5b90b10fa4', 'd7d60f96dbe27a1907f4bc8d9fe41ca0', '163b78b2de4a65714283337675f1b643');
INSERT INTO `exam_question_relation_item` VALUES ('2d4e5ef258a46e546bb725ba58f5e6b3', '33b58d8626d376b1a84031f40dd8a22a', '65fa03128d6d9ba5484955872a6470ed');
INSERT INTO `exam_question_relation_item` VALUES ('388a5dba5cfdbfc9f55925d0d80bb039', '33b58d8626d376b1a84031f40dd8a22a', '0ee16f58f145becd7eeb16df000578c9');
INSERT INTO `exam_question_relation_item` VALUES ('7c34409ffd0fc9646a9be08db46afb51', '33b58d8626d376b1a84031f40dd8a22a', 'f26e461584854793473d85ba60bc9aad');
INSERT INTO `exam_question_relation_item` VALUES ('6c0535ce36b91da45839823da901e0f4', '33b58d8626d376b1a84031f40dd8a22a', 'e6dd1d1889cca959cabd10d87a3276d8');
INSERT INTO `exam_question_relation_item` VALUES ('4139d1275f1291b91da2bdfe3d6ab4fb', '8de8cd8ca99506f434fe8eece6100412', 'ff6e780be3776eed19fb2ae22e9c949b');
INSERT INTO `exam_question_relation_item` VALUES ('bfd264437cbcb6d0a1dcf96360c964ba', '8de8cd8ca99506f434fe8eece6100412', '9085a7d1d913aa270789fcdb526ae309');
INSERT INTO `exam_question_relation_item` VALUES ('8c11480f89e850f4c2741611ee264991', '8de8cd8ca99506f434fe8eece6100412', 'cd617ebdf80411e826b6477733a7bdf8');
INSERT INTO `exam_question_relation_item` VALUES ('06c03cc875febae7a97072a78853e9ea', '8de8cd8ca99506f434fe8eece6100412', '36bd5fdf6c77e339c317dded73a4eb85');
INSERT INTO `exam_question_relation_item` VALUES ('13fae1280e112c0e832e23f0ad139cf6', '0c719c0915505f6ed6910918d44c8745', 'f5e7955898554f49982c075c6ea828bc');
INSERT INTO `exam_question_relation_item` VALUES ('8b6368f28e9e416f071eee8e60422641', '0c719c0915505f6ed6910918d44c8745', 'b91722e892ed085b76ed045d738fe6b3');
INSERT INTO `exam_question_relation_item` VALUES ('44892aa2af4bc681c405c8820d9881c9', '0c719c0915505f6ed6910918d44c8745', '1e741653dc3bf390d93926c2822c2741');
INSERT INTO `exam_question_relation_item` VALUES ('dd559ac278841a46fbe33527a4eb3b8d', '0c719c0915505f6ed6910918d44c8745', 'de8ccbb857efb830f23e71253a228e6a');
INSERT INTO `exam_question_relation_item` VALUES ('cc7926bcf314dbbad564f643fa54e4e0', '0cc6ef0f08a84a665ec39760176bd878', '50dbcced1930655c49c452996516e685');
INSERT INTO `exam_question_relation_item` VALUES ('66b653335d5a019f8547439349bea604', '0cc6ef0f08a84a665ec39760176bd878', 'd3aa34f74df27b50bfafa1d6712a9425');
INSERT INTO `exam_question_relation_item` VALUES ('322c437b3eb90b5487a42941b178bfc1', '0cc6ef0f08a84a665ec39760176bd878', '881a839d6401bb4203d9b52bae96f0c4');
INSERT INTO `exam_question_relation_item` VALUES ('e696894893c267c8bca1d8468a28bb44', '0cc6ef0f08a84a665ec39760176bd878', 'a394085966588f15117f5d079cfce874');
INSERT INTO `exam_question_relation_item` VALUES ('4d8d4651d7183bb9963a83869e82778d', '9b500f474fd6d62c25e57c89859c8dd4', '2613c9b0ded3d1ca5f1f579db8fb619a');
INSERT INTO `exam_question_relation_item` VALUES ('eb09326f81bdc36e67a9d25e30ff7d30', '9b500f474fd6d62c25e57c89859c8dd4', 'aa0a3124fedb1193c74bd2169a48be24');
INSERT INTO `exam_question_relation_item` VALUES ('898b2c0cf00d4f587415a3f18ea35869', '9b500f474fd6d62c25e57c89859c8dd4', '551f4c6578aad16d2a1349cef3a7f2cf');
INSERT INTO `exam_question_relation_item` VALUES ('2edb4224c8de8acbea73fb852e62eba9', '9b500f474fd6d62c25e57c89859c8dd4', 'cf19081e3027d56d1bbb8655dda2daa3');
INSERT INTO `exam_question_relation_item` VALUES ('1cb0fef078f8bcedca1509a22f68ffea', '1c3cb3d794fa37cfd5f8350cd0bfaa13', '8623e87015c5944de6f8c8d0fdf4911e');
INSERT INTO `exam_question_relation_item` VALUES ('2081980b3670cc5e74e6f77743cb57d2', '1c3cb3d794fa37cfd5f8350cd0bfaa13', '33b321c65d0a9fbbf71e0360a8bc5dc8');
INSERT INTO `exam_question_relation_item` VALUES ('13e4c5944cdb184e4e2bd529da3c87f3', '1c3cb3d794fa37cfd5f8350cd0bfaa13', '28d19a2015ed3190993c466e14548cbd');
INSERT INTO `exam_question_relation_item` VALUES ('4be09cadb6e72bdd6c7fb95f76aec547', '1c3cb3d794fa37cfd5f8350cd0bfaa13', '40ea4d62e412ccc9dfa27081af15973d');
INSERT INTO `exam_question_relation_item` VALUES ('e3895c76532cc4b1acad58c96fdd7db8', 'e325299263c71e46805b43b4be8f6052', '94e514b297b3304b8987820336084b38');
INSERT INTO `exam_question_relation_item` VALUES ('b2b5824b7e21b5f3b063349359065e2c', 'e325299263c71e46805b43b4be8f6052', '4b15a254022451f1b5000ebd5306d0ac');
INSERT INTO `exam_question_relation_item` VALUES ('d49600f107aa881173191984514b504f', 'e325299263c71e46805b43b4be8f6052', '97c639cc9a335cce22629898b0355f6d');
INSERT INTO `exam_question_relation_item` VALUES ('7e12d6a79554fd9f2cf0697676c74c2f', 'e325299263c71e46805b43b4be8f6052', '7a775b63b1e1c3b8d12f882c428cdfde');
INSERT INTO `exam_question_relation_item` VALUES ('ca94dc32de60aae993521e31d160f0af', 'd73dc1d56a674b720d66f428d6c5be67', 'cae2f37a65ee9f8f7f784ae979368871');
INSERT INTO `exam_question_relation_item` VALUES ('58faa782ea4f3b73ef4891c21a522193', 'd73dc1d56a674b720d66f428d6c5be67', '4372f294a4be90b790712fc2a9e6ee5c');
INSERT INTO `exam_question_relation_item` VALUES ('e4b1ba3afbc181e7846cc0b7369dd62b', 'd73dc1d56a674b720d66f428d6c5be67', '411c9de21886b53348de3a24ca7edf90');
INSERT INTO `exam_question_relation_item` VALUES ('4541cd9348aed2e648af19424346eefb', 'd73dc1d56a674b720d66f428d6c5be67', '2acaf23459971592befed145474c78af');
INSERT INTO `exam_question_relation_item` VALUES ('0d7d24339a0dabeab7a9e1001344096b', 'c3dbe6b3e685e47a0f37bbf324086632', '61439d30ec90d117365b7c1ef8ea82a2');
INSERT INTO `exam_question_relation_item` VALUES ('36060c45861a96ec27c92e3df915602b', 'c3dbe6b3e685e47a0f37bbf324086632', 'e129e9eb95548305359b72a5c4a94ba0');
INSERT INTO `exam_question_relation_item` VALUES ('2d8c69ccf6c78a69520a55d4d2ce7f02', 'c3dbe6b3e685e47a0f37bbf324086632', '85258db09e11f6529f4b5df5ba2f6a4b');
INSERT INTO `exam_question_relation_item` VALUES ('5f8de6836f1da6c8d15164225bb16d88', 'c3dbe6b3e685e47a0f37bbf324086632', '8eb04907a5d6ff8c5f841f04800d0701');
INSERT INTO `exam_question_relation_item` VALUES ('100b6ddd06f589db3ed98c458b5555b3', '82565650333f8bc7c3ba97f934572f21', '4f2b60c4f670cce33b9afd97c28c04cb');
INSERT INTO `exam_question_relation_item` VALUES ('7766d68ed7c3854e7e1e187aabf89541', '82565650333f8bc7c3ba97f934572f21', '539b9b3f3c2d2bba4e13a2773f93ea35');
INSERT INTO `exam_question_relation_item` VALUES ('8e6c72c177dfb4b0b66c7cd826c18e0c', '82565650333f8bc7c3ba97f934572f21', '5e8e729319a3030f5930e0a7f1120ff2');
INSERT INTO `exam_question_relation_item` VALUES ('2365324a50d9b98ab37e787bea3c55a8', '82565650333f8bc7c3ba97f934572f21', 'a532fea5654998e9d32cf790b597fd8f');
INSERT INTO `exam_question_relation_item` VALUES ('d6d5654651431b3fe25f543291e69ade', 'a9929f74ddf4af2377a9d7170df39aa0', '39b134db18d296099747c243fb15b7e1');
INSERT INTO `exam_question_relation_item` VALUES ('d2742761048193d69a95f0a27a8922be', 'a9929f74ddf4af2377a9d7170df39aa0', '2ffbde1236b5689a2086ba20f74e9cb3');
INSERT INTO `exam_question_relation_item` VALUES ('b85a2d1fd59ec126ec5f0feff1ef8c9a', 'a9929f74ddf4af2377a9d7170df39aa0', '9868846e4257d02c15c08b81135d885b');
INSERT INTO `exam_question_relation_item` VALUES ('3e04034c41f6db4f50af6d2824fb0da5', 'a9929f74ddf4af2377a9d7170df39aa0', 'e1020d6720ac4d86a624b549e8381cdd');
INSERT INTO `exam_question_relation_item` VALUES ('59fbdd7564eb05746fd27c5b407607b7', '4e9efdb9dd2afd695abb6c36966d2beb', '18a7a4e7445d849dd7bbd2a547e42fb2');
INSERT INTO `exam_question_relation_item` VALUES ('3d9e92472f0ae810054b49459b881b1e', '4e9efdb9dd2afd695abb6c36966d2beb', '567bf8bd829c4bc389a95c58c85871fa');
INSERT INTO `exam_question_relation_item` VALUES ('a661cc69e225fc8b60b93d81c4623b36', '4e9efdb9dd2afd695abb6c36966d2beb', 'afb8f218e2d1ef1e79c98a9b0d09d8b6');
INSERT INTO `exam_question_relation_item` VALUES ('e3e9d7d296a0ad36bb730eddfa152955', '4e9efdb9dd2afd695abb6c36966d2beb', 'e98fd8afdf208ebd5a4b768915027eea');
INSERT INTO `exam_question_relation_item` VALUES ('f30df0cda67be090520ccc4c16827d85', '33e0a78f18ddcce6e0c71a62f466ab24', 'e1453dcbf72bb350070e6379beb42e5a');
INSERT INTO `exam_question_relation_item` VALUES ('e5662e79c49040cc340a5cb7e8d5ca4a', '33e0a78f18ddcce6e0c71a62f466ab24', '0fe8132a3f795e6b7ea17d59ea44fb1a');
INSERT INTO `exam_question_relation_item` VALUES ('54d04b110ac6b7f72c7ae530f88b2c9b', '33e0a78f18ddcce6e0c71a62f466ab24', '7967a94aca16d27d92500dbca31caa45');
INSERT INTO `exam_question_relation_item` VALUES ('dbfa62c9ece3849362c77bf3a1685428', '33e0a78f18ddcce6e0c71a62f466ab24', '6fff7a545d12ef92b351c51270fad43a');
INSERT INTO `exam_question_relation_item` VALUES ('ef67ed3e7efb9ddbcf92565c53c5b68d', 'b26fb7227f131ba70c1c8b30c8d929d9', '3868dd54f4b3a69a12683ee7220d11ab');
INSERT INTO `exam_question_relation_item` VALUES ('66d05d05933c02ead10db2b65b3b0414', 'b26fb7227f131ba70c1c8b30c8d929d9', '3882fc34fffb98908b026f40ec934997');
INSERT INTO `exam_question_relation_item` VALUES ('056d26e73741af1681723c9a22d485ce', 'b26fb7227f131ba70c1c8b30c8d929d9', 'edfd2353c114b69d31158511af1d75c9');
INSERT INTO `exam_question_relation_item` VALUES ('e4f21cc47d1dce4b0ec906fdf059ce21', 'b26fb7227f131ba70c1c8b30c8d929d9', 'e421352b2133e628850d61a2c58d2d57');
INSERT INTO `exam_question_relation_item` VALUES ('235cb9e94a1224caf36c483f5c51e7f5', 'b1c090bed9224018b5d3ab350c19efd6', '30b48107345f7866a4ae1a624fcf9162');
INSERT INTO `exam_question_relation_item` VALUES ('c6108435339bab5bd2a262ef711ddf31', 'b1c090bed9224018b5d3ab350c19efd6', 'a84d4f4402703cd98e50c7d7b6bec96a');
INSERT INTO `exam_question_relation_item` VALUES ('2a1f9c7ff57795074111e936c95f22a7', 'b1c090bed9224018b5d3ab350c19efd6', '729c8a0c2b898e167b742f46357b5104');
INSERT INTO `exam_question_relation_item` VALUES ('70cc9c4c96c8e4136c14838f5dcaf0cb', 'b1c090bed9224018b5d3ab350c19efd6', '7e8a4345d300f7da88606922afa3bc76');
INSERT INTO `exam_question_relation_item` VALUES ('1f40ca9dd7b62fdd7d91a05026b78e89', '68d455306d030248e1047249dbf9d487', 'ae14fd4afbe3904b794fe044d0958e4d');
INSERT INTO `exam_question_relation_item` VALUES ('b8cf4867f845ba57b03d2d3f0191ff58', '68d455306d030248e1047249dbf9d487', '82c0759c947d76c298f5b14f52d76778');
INSERT INTO `exam_question_relation_item` VALUES ('a516806be58f88764b02045f0de9765f', '68d455306d030248e1047249dbf9d487', 'eed6b08ba58029ce52de511217b15b76');
INSERT INTO `exam_question_relation_item` VALUES ('4221010fdc712446461842c96a55dca9', '68d455306d030248e1047249dbf9d487', 'bce334ffd0bc6eceb4cd576602c8f4b1');
INSERT INTO `exam_question_relation_item` VALUES ('d9a0c3352a3b12bb306402657ed45308', '455a20f0ef73d83ffc9b10b9fd8d2e11', 'bf49341b5571b1cf80673e74b88c933d');
INSERT INTO `exam_question_relation_item` VALUES ('6c2f54504ff3079256180a69946d34b9', '455a20f0ef73d83ffc9b10b9fd8d2e11', 'd68c44ac0736dea034a41c0e54a8f666');
INSERT INTO `exam_question_relation_item` VALUES ('29f76b904c8f0fff2e88d2e6da52dc65', '455a20f0ef73d83ffc9b10b9fd8d2e11', '6107e4e92ba62ac5012c07c840800c87');
INSERT INTO `exam_question_relation_item` VALUES ('cb7caf82185cc1e89b8aa0f8949d9183', '455a20f0ef73d83ffc9b10b9fd8d2e11', 'c7402dbee8e65dd651c2963f955ea449');
INSERT INTO `exam_question_relation_item` VALUES ('3cb113bf86b60d658fa8b10179faf983', '77e80683596025314f1a58e4d07bd3cb', '75b2b9553b9b9b4089e6eedba8316f5d');
INSERT INTO `exam_question_relation_item` VALUES ('90da5b88db5a8d0fef4b3e608157e57f', '77e80683596025314f1a58e4d07bd3cb', 'b193e3f505505bfafa8083b7cbb75540');
INSERT INTO `exam_question_relation_item` VALUES ('55e7daf6831c71217bbbb1ca62d0a8aa', '77e80683596025314f1a58e4d07bd3cb', '40567ad6efbf4622fce1cb697f990a0c');
INSERT INTO `exam_question_relation_item` VALUES ('6f21af8dfd4e915d350135bf1f7fb127', '77e80683596025314f1a58e4d07bd3cb', '7e1edbcc920fbac6fbc920b91c1ead91');
INSERT INTO `exam_question_relation_item` VALUES ('760a299fe1979c84a297e7ae5e3337f2', '5e643d5f617ebcb8d42a80c54a81a33a', '0478de2518e6eaae586bc1df03174c46');
INSERT INTO `exam_question_relation_item` VALUES ('2a77f423d73659a1a343a02038118ed1', '5e643d5f617ebcb8d42a80c54a81a33a', '67543e932919630c79ae8358e59e97c4');
INSERT INTO `exam_question_relation_item` VALUES ('277684993d5c24a776d4b0952af7a816', '5e643d5f617ebcb8d42a80c54a81a33a', 'c6dd01bd7398b9bf9ce8a53dc5f63f7f');
INSERT INTO `exam_question_relation_item` VALUES ('63ded1e21cac432c40c5c146d07d9c83', '5e643d5f617ebcb8d42a80c54a81a33a', '8d872b0a70ca8600b51705641fc04f50');
INSERT INTO `exam_question_relation_item` VALUES ('393f8c0619fceb5fe6d3e9b1e71a5cd5', '13d62684758ed8fd9ed6b77dee26512a', '4c8fee2246fe42230ab2ed40a4664726');
INSERT INTO `exam_question_relation_item` VALUES ('fe73bbaf3a1ae1e7d856002fa135e2d1', '13d62684758ed8fd9ed6b77dee26512a', 'b3537efe52593d1782465b3d31596e3f');
INSERT INTO `exam_question_relation_item` VALUES ('b430a86b8092a680154aef1814444acb', '13d62684758ed8fd9ed6b77dee26512a', '932f60a524a2e0eca9590dc1f3d39897');
INSERT INTO `exam_question_relation_item` VALUES ('c609e10b11526af46a6117e950bb7def', '13d62684758ed8fd9ed6b77dee26512a', 'd076c4a1298f55db850bf573943969e7');
INSERT INTO `exam_question_relation_item` VALUES ('1ee3faa4e7dbd0b2fc84a781b6f56026', 'b601d86c47bfd16e7f328cae70be85ad', '8ccc109afc2cdd48bd6c55b425d7236b');
INSERT INTO `exam_question_relation_item` VALUES ('fac30807c0629373c63024d8f56d81f6', 'b601d86c47bfd16e7f328cae70be85ad', '23bdc4c397302df7ceeed291cacfc0ad');
INSERT INTO `exam_question_relation_item` VALUES ('2322d5c8e1b96ee6b731cc184c807ae7', 'b601d86c47bfd16e7f328cae70be85ad', '637d9194199f06a8f346006a7ed43cde');
INSERT INTO `exam_question_relation_item` VALUES ('854940c7c157139995a5b21a0ca10b72', 'b601d86c47bfd16e7f328cae70be85ad', '2562a72265dc4b7d57631b5049f14bea');
INSERT INTO `exam_question_relation_item` VALUES ('3bf89839d2e045f61c1b221f697221d1', '7b51fbaaa00d78a3c0203be6c0fa8b77', '205b0ba53d2d2facc276f35d0993cd6c');
INSERT INTO `exam_question_relation_item` VALUES ('d718352d47addf2110057f1af8ad9d4d', '7b51fbaaa00d78a3c0203be6c0fa8b77', 'a4347b6b5825d0dbd4558c1e522bfe2e');
INSERT INTO `exam_question_relation_item` VALUES ('b3b33d4814485d66f673936083d2cb22', '7b51fbaaa00d78a3c0203be6c0fa8b77', '967ece8abfc481c21e60df7866f337c6');
INSERT INTO `exam_question_relation_item` VALUES ('dd5bb3606fbf3da709020c31c13386c3', '7b51fbaaa00d78a3c0203be6c0fa8b77', '4ed2b37a6bc51a1d8cd1d3baa8159b46');
INSERT INTO `exam_question_relation_item` VALUES ('837347b9a6cf6ec81c84e93a2d1778fe', '5d266904cdfd6b3327caf598d7fa076a', '334bc78d185198c4eea23cbe79a79828');
INSERT INTO `exam_question_relation_item` VALUES ('364ba0c66887ef17ae6f3dbf53f0e83f', '5d266904cdfd6b3327caf598d7fa076a', 'ae0fa3c96514b5eef27f481767dbf6af');
INSERT INTO `exam_question_relation_item` VALUES ('1298968d736582a9601beb1557d2dc31', '5d266904cdfd6b3327caf598d7fa076a', '0753d448da2c7f82b0b48c2c5dd8a831');
INSERT INTO `exam_question_relation_item` VALUES ('eccd3c12f92cbfc23ec4270440abfb23', '5d266904cdfd6b3327caf598d7fa076a', '8e370b370f5718d3d9cae50f9528edd5');
INSERT INTO `exam_question_relation_item` VALUES ('704eaa2d97f30b2d5312509f943e9122', '7a488aa133bbe3365afc97ec3d874598', 'a1d184c87b28b6888fd41e3088fac8a0');
INSERT INTO `exam_question_relation_item` VALUES ('381adda6d1e5dd9051908964ea639227', '7a488aa133bbe3365afc97ec3d874598', '91d44d90e8dbe00137aad6118542f00e');
INSERT INTO `exam_question_relation_item` VALUES ('0549bc01f43d8defbffe8f8b8d058827', '7a488aa133bbe3365afc97ec3d874598', '9fcb705ff0fd11f8370b04875ce10220');
INSERT INTO `exam_question_relation_item` VALUES ('32aaa04f3fa3e55951fa4e3ddcb78a91', '7a488aa133bbe3365afc97ec3d874598', 'a8b6d89affc30d1458026c7ec5e4ac80');
INSERT INTO `exam_question_relation_item` VALUES ('8350193abbf0c17eed20b60f623083ae', '975406d76bd2e54fd1fd43ee1316c71e', 'aab04abfd7993cb563632bc702d7cae2');
INSERT INTO `exam_question_relation_item` VALUES ('858fe7c02c8329a4da4cb7d235ac0c64', '975406d76bd2e54fd1fd43ee1316c71e', 'bc26a4f47c4b6fd0bccca581d1ec2960');
INSERT INTO `exam_question_relation_item` VALUES ('895577c5e495380b4b8b2ac207eb35a1', '975406d76bd2e54fd1fd43ee1316c71e', 'aa830d44839faaf754425921ae30ad86');
INSERT INTO `exam_question_relation_item` VALUES ('a4c2ae235922538dda15d8126cefc934', '975406d76bd2e54fd1fd43ee1316c71e', '3c67f586ff884f642bc11f9fd2e1dd3e');
INSERT INTO `exam_question_relation_item` VALUES ('85b69cf8daf482e0378edead5e38466e', '9fe0ad3a08e33003513655922380cde9', 'f9fa833f3115d53de7789c1988ce1122');
INSERT INTO `exam_question_relation_item` VALUES ('4fa83e99d647c6013f26f37706817dd7', '9fe0ad3a08e33003513655922380cde9', '14d47592e414029b6c2996cb71c40c2c');
INSERT INTO `exam_question_relation_item` VALUES ('1a97b9237ba966385770eab428d21f31', '9fe0ad3a08e33003513655922380cde9', 'edcf9a25e4e9d8b4f644c6fb314973e0');
INSERT INTO `exam_question_relation_item` VALUES ('ff2775ea848bdf7e9c24f11656cf8197', '9fe0ad3a08e33003513655922380cde9', '171abc6db039cb6560cc858376fd876a');
INSERT INTO `exam_question_relation_item` VALUES ('5d1bbb776fdfd7920b3d8abf21d249ec', 'd47557421582146e460ce513e984386d', '5bf0d844f5146327a2c216e0eeb50428');
INSERT INTO `exam_question_relation_item` VALUES ('f2089993788469753173b6b8bd17cbf2', 'd47557421582146e460ce513e984386d', 'd01e49540b8275b63bfbea6fa61a1c6e');
INSERT INTO `exam_question_relation_item` VALUES ('ed0bb50663b6e8061c0d3f38bd3c0f97', 'd47557421582146e460ce513e984386d', 'de17e3b9ce96d608b6823918d9f5ff38');
INSERT INTO `exam_question_relation_item` VALUES ('e3563ff89228a402515cae04f24129df', 'd47557421582146e460ce513e984386d', '071b0921d9c2a8948af9bb923c365dac');
INSERT INTO `exam_question_relation_item` VALUES ('7fd5dd09b3f702a41258332e7eea9d39', '0550025c75c40c24912b203fed48aab0', 'f49f6e5849ef231782242eb976bb7e75');
INSERT INTO `exam_question_relation_item` VALUES ('4fb1e35ede67abbd959a79dbe2bb682a', '0550025c75c40c24912b203fed48aab0', 'd348b3da1efcb75297123f50b345e9d1');
INSERT INTO `exam_question_relation_item` VALUES ('ee290eb64b584a1f97ff9115a92e5c61', '0550025c75c40c24912b203fed48aab0', '4824bced6cbf507cf52779565b395248');
INSERT INTO `exam_question_relation_item` VALUES ('63986af212b35660b5ff884440ea45f5', '0550025c75c40c24912b203fed48aab0', '93257d782f3c1ebc446c012c52df5dba');
INSERT INTO `exam_question_relation_item` VALUES ('16cc05474084a067188d9d96fff019b8', '086c044755e43c584f47e77e633dd108', '89949832b6a8bf71b9887f111eb07dd6');
INSERT INTO `exam_question_relation_item` VALUES ('3e9930496842198671f2ffa84a0c27f5', '086c044755e43c584f47e77e633dd108', '326e159ecbf69ef7870502b5165dcd0d');
INSERT INTO `exam_question_relation_item` VALUES ('c7d9ba097e61ee82df17df221a6144bb', '086c044755e43c584f47e77e633dd108', '78c22f94cc3f296afd5b7f1fb7d5d173');
INSERT INTO `exam_question_relation_item` VALUES ('409c524a6c69972f3b790f92f2efa46c', '086c044755e43c584f47e77e633dd108', '72770459a97ed2fe0b74b69cfbcf8056');
INSERT INTO `exam_question_relation_item` VALUES ('9fab9dcc1d88c7ba6a5278d1014d2e59', 'c01bc5f831febd41733b5e454760c6ef', 'ea090a8e6174e8b4e26ac03eb1d2a6de');
INSERT INTO `exam_question_relation_item` VALUES ('b67d599c5707498901c690ca5ad18c0d', 'c01bc5f831febd41733b5e454760c6ef', 'e8c8d27cf8d30333d02a56ed48c8137e');
INSERT INTO `exam_question_relation_item` VALUES ('b23f2774854d6bd3cf572502e69989ce', 'c01bc5f831febd41733b5e454760c6ef', 'e36531f7fcc94590830677740bc9a6df');
INSERT INTO `exam_question_relation_item` VALUES ('84d53e34e5049b57d55bc762dffc4827', 'c01bc5f831febd41733b5e454760c6ef', '2dbd1af75527204cd13eeb0d3847f8af');
INSERT INTO `exam_question_relation_item` VALUES ('33708d6a40b7e984d2d0cb27d5be2460', 'bbc861a67f1afaf4008fac7eb1eb8099', 'e46af991816383b64ed646c21e64e56f');
INSERT INTO `exam_question_relation_item` VALUES ('06403a365767c81f044621288343d8a3', 'bbc861a67f1afaf4008fac7eb1eb8099', '29791277a519b86cd75f76b793957642');
INSERT INTO `exam_question_relation_item` VALUES ('537169012553d665c5f2381859043e60', 'bbc861a67f1afaf4008fac7eb1eb8099', 'a70878c549588d48fc407323c8018a45');
INSERT INTO `exam_question_relation_item` VALUES ('16632645768bd96cc5da6173e413ba15', 'bbc861a67f1afaf4008fac7eb1eb8099', 'f43dc9168435213dc99b78661530917a');
INSERT INTO `exam_question_relation_item` VALUES ('d6f783e2683739abd1b7eb12f0de16f8', '9b7e5babc8b120cca7df281a3336fbb0', '17254a04bf454ad021258d8453e7729b');
INSERT INTO `exam_question_relation_item` VALUES ('2db7f2935a68dd349fefba09c2271109', '9b7e5babc8b120cca7df281a3336fbb0', '3d3edeb622528932770c789b6f92934f');
INSERT INTO `exam_question_relation_item` VALUES ('3f2cf952a8dc52b8acfd3c351f996650', '9b7e5babc8b120cca7df281a3336fbb0', 'e136867b2c1470aa755209d320527290');
INSERT INTO `exam_question_relation_item` VALUES ('42fa699549ee9dbc755819e2c767c458', '9b7e5babc8b120cca7df281a3336fbb0', '280e8cb0bcfd930ce32a07acccbea65b');
INSERT INTO `exam_question_relation_item` VALUES ('898f720f5afcf74e5aee5690cc75276b', '80f28faf4772364901b164664e411ddf', '424c727e6dd563c1d284fc77dcdfc4c4');
INSERT INTO `exam_question_relation_item` VALUES ('9a3604aaa9c73927a4b7c415cc75db7c', '80f28faf4772364901b164664e411ddf', '5940080c13dfed03fa7583851f8a52fd');
INSERT INTO `exam_question_relation_item` VALUES ('9db2b63938223c1a2bf97afb257ad7ad', '80f28faf4772364901b164664e411ddf', '8f7a4162c84d116e16620029770f3c26');
INSERT INTO `exam_question_relation_item` VALUES ('363ab7ec4e5dd70a8bd9e73231dca6b2', '80f28faf4772364901b164664e411ddf', 'f48cd8554493813bc44f3b9af69029f9');
INSERT INTO `exam_question_relation_item` VALUES ('f816867b26ba0b7b6547ab0ff7b87c97', '427a75e275b21672c2821619b7672770', '4a7a29157e984c8611f835d008933059');
INSERT INTO `exam_question_relation_item` VALUES ('44fd2a1386debdb07961a5f575a64ff4', '427a75e275b21672c2821619b7672770', 'ad01f84973766164441eec1e008b0e58');
INSERT INTO `exam_question_relation_item` VALUES ('0fe43452ec5b43b8d2f98d293575212e', '427a75e275b21672c2821619b7672770', '2a29db16ed6f8e664f32afaf2ec81a13');
INSERT INTO `exam_question_relation_item` VALUES ('70df16f7b95a99dd2636167f7006e646', '427a75e275b21672c2821619b7672770', '09cfdf5714440ea72cf81bf02a341ba4');
INSERT INTO `exam_question_relation_item` VALUES ('330d5dee2e58da7a6b8e155b1e7f0324', '525e951501ff24f1b79f4b552d4519fc', '0e4c56f8dd58a67c5cbed4b0dd94699b');
INSERT INTO `exam_question_relation_item` VALUES ('b242fac470b9f362bf5a8ecb379f3ae2', '525e951501ff24f1b79f4b552d4519fc', '887860aa2c436d4c4f8be10091096972');
INSERT INTO `exam_question_relation_item` VALUES ('1a9d3e7e9a02e3b8a17fdb2d6473f118', '525e951501ff24f1b79f4b552d4519fc', '8d288d1cb9494f37da73d0da803f46d2');
INSERT INTO `exam_question_relation_item` VALUES ('29f16c6bcbb85f6f7a070fca4162e751', '525e951501ff24f1b79f4b552d4519fc', 'fe14b2cb6104ac8266cad2942faa9534');
INSERT INTO `exam_question_relation_item` VALUES ('0daf8ab51a208e52afd1a544f07ba5d5', 'd3cad9a438a93b6b7943734a6fe274bc', 'cbfb8c5c761a968b54ed6974b8f527c0');
INSERT INTO `exam_question_relation_item` VALUES ('9fe1f6f05066b85a513f9972d2931a31', 'd3cad9a438a93b6b7943734a6fe274bc', '32e598ea84699359837594ff1788b33d');
INSERT INTO `exam_question_relation_item` VALUES ('f9f13c8045fec96eb12ec5153540412f', 'd3cad9a438a93b6b7943734a6fe274bc', 'edb528bd0b51c42906bd3995f8420b5d');
INSERT INTO `exam_question_relation_item` VALUES ('9a98eb8b45d2cca68c78a6d5c6a00451', 'd3cad9a438a93b6b7943734a6fe274bc', '56733e39c2692e1459df8e2dedf7fc2a');
INSERT INTO `exam_question_relation_item` VALUES ('46ae4b81207a11372f7bb7cd30b9d75a', '45cfb0e1d88384c0d59046035d9573ff', '08e9ba886d496b6295cfdf611cdfe9e8');
INSERT INTO `exam_question_relation_item` VALUES ('c5af90664b509b2fd0f1127a395a89cb', '45cfb0e1d88384c0d59046035d9573ff', 'e5b45732e6fecb42460afddb9aacb27c');
INSERT INTO `exam_question_relation_item` VALUES ('80b3457882113be59bab77e28b79f2be', '45cfb0e1d88384c0d59046035d9573ff', 'cbff849723dcaddf0db5234befc43ed4');
INSERT INTO `exam_question_relation_item` VALUES ('002da5c87564d06657c2abb5dff30fd7', '45cfb0e1d88384c0d59046035d9573ff', '9b77beae4e1176d455806e9e6328fd1e');
INSERT INTO `exam_question_relation_item` VALUES ('37d938e41cd0c6d73b53a99043893ad9', '3e814ccc79dcaba8600486c647498db3', 'e60b90dd02599081d0a7e0f3d6e29674');
INSERT INTO `exam_question_relation_item` VALUES ('99ea40104767472ffbbf408cd4a7d4e9', '3e814ccc79dcaba8600486c647498db3', 'aab03434281661244ea7df0c1d9a7404');
INSERT INTO `exam_question_relation_item` VALUES ('1cc52a265bcf580634f659cd4e1430b6', '3e814ccc79dcaba8600486c647498db3', 'b31e66fa20162fca94f398fc96119ecf');
INSERT INTO `exam_question_relation_item` VALUES ('3fbda0f79ba374e8ed1ba8334d6f6e5d', '3e814ccc79dcaba8600486c647498db3', '39aff8eb39fc2fd423d77679b293d706');
INSERT INTO `exam_question_relation_item` VALUES ('5609d4f11a0ea6259c36913335f13249', '6770a7836ee56b0e3d6435a888186a78', 'aaededc4612da4c61b6d34d5051ab9d8');
INSERT INTO `exam_question_relation_item` VALUES ('92ab143982ed2cd6ace79e623f33ac53', '6770a7836ee56b0e3d6435a888186a78', 'dfb599c27a5d6b13392c4125e8eb7234');
INSERT INTO `exam_question_relation_item` VALUES ('5591f44f35afe43e28703f7fae7ab85b', '6770a7836ee56b0e3d6435a888186a78', '3c5db2ee23b4ac27a95fb846bbf85613');
INSERT INTO `exam_question_relation_item` VALUES ('2b2e6de332f8da77484bc42587be9dbb', '6770a7836ee56b0e3d6435a888186a78', '9b0d5e094a501cb44532009ad2f19e23');
INSERT INTO `exam_question_relation_item` VALUES ('61317e8cca8f2a4c6dd908b702d1f3c5', '545e96ab4bd601b6a7c0a3d8fe6923cd', '93f4693d2ad1e186cbe11afeeec2cbc0');
INSERT INTO `exam_question_relation_item` VALUES ('4532b61182a4eafad674a223710d2e6e', '545e96ab4bd601b6a7c0a3d8fe6923cd', '1d408e1ceb1d97be000c6b623c5fef9f');
INSERT INTO `exam_question_relation_item` VALUES ('9fb3589c6904c5fd69aea83882249a31', '545e96ab4bd601b6a7c0a3d8fe6923cd', '659d81440c3c8c92803cad0bfe0df492');
INSERT INTO `exam_question_relation_item` VALUES ('af64eb5722c8d51d7629258d2583c40c', '545e96ab4bd601b6a7c0a3d8fe6923cd', '4b89a7dc93905470cc0b441182042560');
INSERT INTO `exam_question_relation_item` VALUES ('fbb9555053f662edcc346f66f8852569', '122fb714d1bf3865eec2da3eec182041', 'aca9fcd3d679d72aac374ff6b6a57812');
INSERT INTO `exam_question_relation_item` VALUES ('ca9bdd9706d0b512f2bc60517b315c2c', '122fb714d1bf3865eec2da3eec182041', 'c556e1ab22efd4f4e74778718e54eaaa');
INSERT INTO `exam_question_relation_item` VALUES ('6e35dd5633ad7c7ef39a1bb3f45b5688', '122fb714d1bf3865eec2da3eec182041', 'ef2141ce4e825074d3994a0931c6ca4d');
INSERT INTO `exam_question_relation_item` VALUES ('44569e5a67f22f9a18f278d2647c1a0e', '122fb714d1bf3865eec2da3eec182041', '25a98216ff61fea544059c4ae779e848');
INSERT INTO `exam_question_relation_item` VALUES ('b007d94c93fc6fabf5db8e71b202cc8d', '9c09d3095e288ba20a9b6f5335f1ae0a', 'e26ef79e370a745d6c72b655a22eb1f8');
INSERT INTO `exam_question_relation_item` VALUES ('f5d37fbebf64cc4f9f935fa6ee26c3a6', '9c09d3095e288ba20a9b6f5335f1ae0a', 'ca36bc8ae3139829c1ab6f56b4788272');
INSERT INTO `exam_question_relation_item` VALUES ('039f4cc916c9d8f63be198c3a96fdd36', '9c09d3095e288ba20a9b6f5335f1ae0a', '13fb42a98c644c949255374f64629556');
INSERT INTO `exam_question_relation_item` VALUES ('e27f434e6198e97cf8a7636092b28725', '9c09d3095e288ba20a9b6f5335f1ae0a', 'bc606281e22de51b8ce7197b51add06c');
INSERT INTO `exam_question_relation_item` VALUES ('2e55e3057640550000ec63dfcd59eb8a', '5d98332d95ae0aa1cadf5f7f5215b1fd', 'b2e63c6ee7399dd216c338ff920a8d61');
INSERT INTO `exam_question_relation_item` VALUES ('737aa9e3bad0d852daede24f2ebe15d5', '5d98332d95ae0aa1cadf5f7f5215b1fd', '3783cb6ee8d83adae5474a25f44e46b4');
INSERT INTO `exam_question_relation_item` VALUES ('057b988145a2e02440ba182a5b8b899d', '5d98332d95ae0aa1cadf5f7f5215b1fd', 'f502e1b28dde521f0162f12a32b87e27');
INSERT INTO `exam_question_relation_item` VALUES ('a6dcc3345c825d377cd88917f475fd5e', '5d98332d95ae0aa1cadf5f7f5215b1fd', '029c584139342d1118a04ced72cf7264');
INSERT INTO `exam_question_relation_item` VALUES ('500c325b1d60d66ce93b295986b4739d', '62348a890afab4a530fada3086b257de', 'ae1b0f76271baeda966f249189d89e36');
INSERT INTO `exam_question_relation_item` VALUES ('c0eb0de9607a02a1f02a3a7b523b1b31', '62348a890afab4a530fada3086b257de', 'a94d22e2f6998f1e5a1917340d0e5812');
INSERT INTO `exam_question_relation_item` VALUES ('ec6305ce8a112d8ac9a8b777f5e2ace3', '62348a890afab4a530fada3086b257de', 'ba4df8202255a53bfdca58dcd39c0118');
INSERT INTO `exam_question_relation_item` VALUES ('f7aa9fcbf679cfe88dcafd7728bfedf5', '62348a890afab4a530fada3086b257de', '79edef69f0f1b737c4502d43faced30b');

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
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '试题分类表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '考试记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of exam_record
-- ----------------------------

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
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '试卷答题答案关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of exam_sub_answer_relation
-- ----------------------------

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
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '错题表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of exam_wrong_book
-- ----------------------------

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '管理员表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_admin
-- ----------------------------
INSERT INTO `ums_admin` VALUES ('0965c32d75268459f76ee34a734fb461', 'admin', 1, '123456', 'admin', '', '', '', '', 0, NULL, '0:0:0:0:0:0:0:1', '2023-05-11 15:38:24', 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20230508/lihezong.webp', '2023-05-08 14:52:41', '2023-05-08 14:52:41', 1);
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
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户和角色关系表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '班级表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学院/专业表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '表单配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_form
-- ----------------------------

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
) ENGINE = MyISAM AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 216 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关系表' ROW_FORMAT = DYNAMIC;

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
