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

 Date: 06/05/2023 17:22:24
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
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '试卷库' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of exam_paper
-- ----------------------------
INSERT INTO `exam_paper` VALUES ('fab2804b0df71cc5f36314a55ffd9aee', '2022年公务员考试模拟试卷', '35', '7', NULL, '1', '2023-05-06 16:05:53', '2023-05-06 16:33:20', 1);

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
INSERT INTO `exam_paper_big` VALUES ('bcbb1c811c99e49bf73a3dc349c09a1f', 'fab2804b0df71cc5f36314a55ffd9aee', '常识判断题', '35', '1', '2023-05-06 16:33:20', '2023-05-06 16:33:20', 1);

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
INSERT INTO `exam_paper_big_relation` VALUES ('4c45e22f0a8b1106fae904c75ba9a497', 'bcbb1c811c99e49bf73a3dc349c09a1f', 'fab2804b0df71cc5f36314a55ffd9aee', 'cd45b66035bf1ae28ce7e5505aae0d38', '5', 5);
INSERT INTO `exam_paper_big_relation` VALUES ('8a353599e189830a407eb74391ebb0df', 'bcbb1c811c99e49bf73a3dc349c09a1f', 'fab2804b0df71cc5f36314a55ffd9aee', 'f5f73700c3c3537c44a37c1a1ab7fe3d', '5', 4);
INSERT INTO `exam_paper_big_relation` VALUES ('29f950cf0ce0801e903578a4883c39a3', 'bcbb1c811c99e49bf73a3dc349c09a1f', 'fab2804b0df71cc5f36314a55ffd9aee', '54224b161e3ec581e397377faf422e86', '5', 3);
INSERT INTO `exam_paper_big_relation` VALUES ('002942f16b286f660cd2320fb75e9c87', 'bcbb1c811c99e49bf73a3dc349c09a1f', 'fab2804b0df71cc5f36314a55ffd9aee', '68431d85174d7cd868394adf1203b8ea', '5', 2);
INSERT INTO `exam_paper_big_relation` VALUES ('727519d9da17c90d2ac66138d7a744b9', 'bcbb1c811c99e49bf73a3dc349c09a1f', 'fab2804b0df71cc5f36314a55ffd9aee', '49bf31e8a379b3a5a278777ad55aed7d', '5', 1);
INSERT INTO `exam_paper_big_relation` VALUES ('014f7dbbd367f5ccd49962bd1adb67ac', 'bcbb1c811c99e49bf73a3dc349c09a1f', 'fab2804b0df71cc5f36314a55ffd9aee', 'a2aa279b8da232262198038397ca2bbb', '5', 6);
INSERT INTO `exam_paper_big_relation` VALUES ('ed35d3ae03b1fa1cb0a544435a78031a', 'bcbb1c811c99e49bf73a3dc349c09a1f', 'fab2804b0df71cc5f36314a55ffd9aee', '0b04d2714ea9549c562a9ff67dbdd7f5', '5', 7);

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
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '试题表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of exam_question
-- ----------------------------
INSERT INTO `exam_question` VALUES ('49bf31e8a379b3a5a278777ad55aed7d', 1, '80bf0db118f64744d374bbd3904fb9cd', '5', 1, '<p>关于陶瓷，下列说法错误的是：</p>', '<p>唐三彩中最具代表性的造型是虎和骆驼</p>', 'D', '2023-05-06 15:35:47', '2023-05-06 15:35:47', 1);
INSERT INTO `exam_question` VALUES ('68431d85174d7cd868394adf1203b8ea', 1, '80bf0db118f64744d374bbd3904fb9cd', '5', 1, '<p>马克思、恩格斯创立了唯物史观和剩余价值学说，揭示了人类历史发展的奥秘和资本主义剥削的实质，论证了无产阶级的历史使命，弥补了空想社会主义的缺陷，从而把社会主义从空想发展为科学。科学社会主义问世的标志是_______。</p>', '<p>《共产党宣言》的发表</p>', 'A', '2023-05-06 15:32:44', '2023-05-06 15:32:44', 1);
INSERT INTO `exam_question` VALUES ('54224b161e3ec581e397377faf422e86', 1, '80bf0db118f64744d374bbd3904fb9cd', '5', 1, '<p>下列历史人物与其著名言论对应错误的是：</p>', '<p>曾国藩---天变不足畏，祖宗不足法，人言不足恤</p>', 'D', '2023-05-06 15:38:52', '2023-05-06 16:10:01', 1);
INSERT INTO `exam_question` VALUES ('f5f73700c3c3537c44a37c1a1ab7fe3d', 1, '80bf0db118f64744d374bbd3904fb9cd', '5', 1, '<p>下列作家与其作品中所展现的地域对应错误的是：</p>', '<p>莫言---《红高粱》---东北</p>', 'D', '2023-05-06 15:41:00', '2023-05-06 15:41:00', 1);
INSERT INTO `exam_question` VALUES ('cd45b66035bf1ae28ce7e5505aae0d38', 1, '80bf0db118f64744d374bbd3904fb9cd', '5', 1, '<p>关于儒释道三教异同，古人多有争论。对此，唐代僧人宗密曾在《圆觉经略疏钞》中说：“古来诸德皆判：儒宗___，道宗___，释宗___。”依次填入画横线部分最巧当的一项是：</p>', '<p>五常；自然；因缘</p>', 'C', '2023-05-06 15:49:31', '2023-05-06 15:49:31', 1);
INSERT INTO `exam_question` VALUES ('2ffa6f9693a57dad0056653312d20cc6', 1, '80bf0db118f64744d374bbd3904fb9cd', '5', 1, '<p>关于诺贝尔文学奖，下列说法不正确的是：</p>', '<p>列夫托尔斯泰是获奖作家</p>', 'D', '2023-05-06 15:51:41', '2023-05-06 15:51:41', 1);
INSERT INTO `exam_question` VALUES ('a601a58f1d870c4cd443346a296a1dd3', 1, '80bf0db118f64744d374bbd3904fb9cd', '5', 1, '<p>下列影视剧情景设计符合历史常识的是：</p>', '<p>毛泽东与李宗仁幽默的说：德邻先生，你这次归国，是误上了贼船啊</p>', 'B', '2023-05-06 15:55:52', '2023-05-06 15:55:52', 1);
INSERT INTO `exam_question` VALUES ('773d538d80b3f61fa43809ef460026e2', 1, '80bf0db118f64744d374bbd3904fb9cd', '5', 1, '<p>关于能量和做功，下列说法正确的是：</p>', '<p>自由落体过程中物体的机械能保持不变</p>', 'C', '2023-05-06 15:57:57', '2023-05-06 15:57:57', 1);
INSERT INTO `exam_question` VALUES ('d3cd1bf295543547703556a09c5c0e3d', 1, '80bf0db118f64744d374bbd3904fb9cd', '5', 1, '<p>具有社会行为的动物大多具有以下特征：</p><p>①群体内部往往形成一定组织；</p><p>②组织成员之间有明确的分工；</p><p>③群体内具有一定的等级；</p><p>下列属于动物社会行为的是( &nbsp; &nbsp;)。</p>', '<p>蜂王依靠工蜂喂养</p>', 'C', '2023-05-06 16:01:23', '2023-05-06 16:01:23', 1);
INSERT INTO `exam_question` VALUES ('fb7bc3ce017f498f82d441f0b3297638', 1, '80bf0db118f64744d374bbd3904fb9cd', '5', 1, '<p>下列与生物灾害有关的说法错误的是：</p>', '<p><span style=\"color: rgb(0, 0, 0);\">中国发生蝗灾最严重的位于黄河下游的河南、河北和山东三省。 </span></p><p><span style=\"color: rgb(0, 0, 0);\">中蝗灾最严重的是华北平原 &nbsp;</span></p>', 'A', '2023-05-06 16:04:33', '2023-05-06 16:04:33', 1);
INSERT INTO `exam_question` VALUES ('c2f99cf8acc0dff755d35b18f28c2dc1', 1, '80bf0db118f64744d374bbd3904fb9cd', '5', 1, '<p>有四个同样大小、质量相等的空心球，他们分别有铁、铝、铜、铅制成。则四个球空心部分体积最大的是：</p>', '<p>铁球</p>', 'A', '2023-05-06 16:14:17', '2023-05-06 16:14:17', 1);
INSERT INTO `exam_question` VALUES ('8438fa82e93bbcec402c4691166d36a9', 1, '80bf0db118f64744d374bbd3904fb9cd', '5', 1, '<p>光学树脂常用于制作镜片，它是一种有机材料，其分子间结构相对松弛，光线可通过率为84%-90%。下列光宇光学树脂镜片的表达错误的是_____。</p>', '<p>和普通玻璃镜片相比，树脂镜片更加耐磨</p>', 'D', '2023-05-06 16:22:06', '2023-05-06 16:22:06', 1);
INSERT INTO `exam_question` VALUES ('1baa5b714f226ffd9e325dbbaab0888f', 1, '80bf0db118f64744d374bbd3904fb9cd', '5', 1, '<p>关于塑料大棚，下列说法正确的是：</p>', '<p>冬季在塑料大棚内熏烟有助于防御霜冻</p>', 'C', '2023-05-06 16:23:05', '2023-05-06 16:23:05', 1);
INSERT INTO `exam_question` VALUES ('0b04d2714ea9549c562a9ff67dbdd7f5', 1, '80bf0db118f64744d374bbd3904fb9cd', '5', 1, '<p>下面是一款路由器的参数规格说明，对此描述错误的是：</p><p><img src=\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20230506/image.png\" alt=\"\" data-href=\"\" style=\"\"/></p>', '<p>路由器的LAN口可以用来连接外网</p>', 'C', '2023-05-06 16:24:10', '2023-05-06 16:24:10', 1);
INSERT INTO `exam_question` VALUES ('93ad55b99458be8dcfb89ab2f38fd113', 1, '80bf0db118f64744d374bbd3904fb9cd', '5', 1, '<p>地球自转一圈的时间是一天，地球半径为6371千米。毛泽东诗词“坐地日行八万里”是有科学依据的，人可以随着地球的自转运动，那么与诗句最吻合的可能是哪个国家的人：</p>', '<p>新加坡</p>', 'C', '2023-05-06 16:25:29', '2023-05-06 16:25:29', 1);
INSERT INTO `exam_question` VALUES ('3253641cf7e0b30eaf60ef8e08314eeb', 1, '80bf0db118f64744d374bbd3904fb9cd', '5', 1, '<p>2013年7月6日我国与______正式签署了自由贸易协定，这是我国与欧洲大陆国家签署的首个自贸协定。</p>', '<p><span style=\"color: rgb(51, 51, 51); background-color: rgb(255, 255, 255); font-size: 14px;\">中瑞自贸协定是中国与欧洲大陆国家签署的首个自贸协定，充分体现了中国政府继续扩大对外开放的决心和信心，显示了中国与包括瑞士在内的欧洲国家进一步发展经贸关系的良好愿望</span></p>', 'D', '2023-05-06 16:27:34', '2023-05-06 16:27:34', 1);
INSERT INTO `exam_question` VALUES ('372d47b6d6b9044373ee7121072e086d', 1, '80bf0db118f64744d374bbd3904fb9cd', '5', 1, '<p>按照我国《民法典》的规定，财产继承的效力顺位为：</p>', '<p>遗赠扶养协议&gt;遗嘱继承&gt;法定继承</p>', 'C', '2023-05-06 16:29:09', '2023-05-06 16:29:09', 1);
INSERT INTO `exam_question` VALUES ('f2dc08d81583a6daa3b02937435ef352', 1, '80bf0db118f64744d374bbd3904fb9cd', '5', 1, '<p>“正能量”指的是一种健康乐观、积极向上的动力和情感。当下中国社会涌现了许多富有正能量的人和事，这些催人奋进的、充满希望的人和事也带动和影响了周围一批人，从哲学角度看( &nbsp; )。</p><p>①正能量具有指导作用，能够将人们的愿望变成现实</p><p>②正能量具有能动性，能够给人带来信心和力量</p><p>③正能量具有反作用，能对人体生理活动进行调节和控制</p><p>④正能量具有创造性，能直接转化为物质力量</p>', '<p>②③</p>', 'C', '2023-05-06 16:31:14', '2023-05-06 16:31:14', 1);
INSERT INTO `exam_question` VALUES ('a2aa279b8da232262198038397ca2bbb', 1, '80bf0db118f64744d374bbd3904fb9cd', '5', 1, '<p>社会信用体系的建立有利于提高全社会的诚信意识和信用水平。下列关于国家加快社会信用体系建设的说法错误的是：</p>', '<p>为惩戒失信被执行人，规定其不得以财产支付子女就读高等院校的费用</p>', 'B', '2023-05-06 16:32:31', '2023-05-06 16:32:31', 1);
INSERT INTO `exam_question` VALUES ('a5d9d52f3e2587a535f469f02ecffc94', 1, '80bf0db118f64744d374bbd3904fb9cd', '5', 1, '<p>中共中央、国务院于2019年12月4日印发了《关于营造更好发展环境支持民营企业改革发展的意见》，下列说法与之不符的是：</p>', '<p>在电力、电信、铁路、石油等行业和领域，向民营企业全面开放</p>', 'D', '2023-05-06 16:35:50', '2023-05-06 16:35:50', 1);
INSERT INTO `exam_question` VALUES ('7e078ae6e13329a33b38eb9d2020dbb1', 1, '317e751103f654a1631725d6e00355bd', '5', 1, '<p>在实际应用中，专网通常服务于政府、军队、公安、能源、消防、轨道交通等部门或领域，大部分情况下被用来进行应急通信、调度指挥。性能可靠、低成本、定制化的特点，使其在行业应用中具备_____的优势。即便5G时代呼啸而来，专网依旧能够找到______。依次填入画横线部分最恰当的一项是：</p>', '<p>不可替代、用武之地</p>', 'C', '2023-05-06 16:59:47', '2023-05-06 16:59:47', 1);
INSERT INTO `exam_question` VALUES ('c2ced61f2da13636fdfac0217ed5b30c', 1, '317e751103f654a1631725d6e00355bd', '5', 1, '<p>研究也显示，对外的控制一开始确实能增强幸福感，但越过一个临界点后，反而会开始降低幸福感。外部控制狂更容易倾向于做出____的高风险决策，他们身边往往只剩下少数顺从者，因此在做错决定时也得不到逆耳忠言。填入画横线部分最恰当的一项是：</p>', '<p>孤注一掷</p>', 'A', '2023-05-06 17:01:29', '2023-05-06 17:01:29', 1);
INSERT INTO `exam_question` VALUES ('e5d4ed43b5e6f4885bdfe4bb0b3e89dc', 1, '317e751103f654a1631725d6e00355bd', '5', 1, '<p>从陆地到天空，从恐龙到鸟类，生物的生态习性发生了巨大改变，身体结构也有了天壤之别。若非有一系列介于两者之间的过渡物种让人_____，即便熟读《物种起源》，笃信达尔文的演化理论，也仍然会对“恐龙是鸟类的祖先”的说法____。依次填人画横线部分最恰当的一项是：</p>', '<p>眼见为实、将信将疑</p>', 'D', '2023-05-06 17:11:47', '2023-05-06 17:11:47', 1);
INSERT INTO `exam_question` VALUES ('fcb4a860935e333ae1896a1d4684e873', 1, '317e751103f654a1631725d6e00355bd', '5', 1, '<p>“制作粗糙”，_____，某文艺评论家这样点评当下国内的许多多媒体舞蹈作品。把几段现成的图像符号式地投射在背景屏幕上充当画外音，充其量只是布景道具的升级版。多媒体效果太过目眩神迷，与舞蹈____，有一种独立于表达之外的野心。比如有一个多媒体舞蹈，投射在大屏幕上的图案随着演员的每个动作变幻：演员伸展双臂，身后便出现万丈光芒，演员抱住身体，灯光也随之黯淡，看上去是在配合表演，其实是在和演员争夺观众的眼球，舞蹈彻底沦为了配角。依次填入画横线部分最恰当的一项是：</p><p><br></p>', '<p>喧宾夺主、貌合神离</p>', 'B', '2023-05-06 17:13:23', '2023-05-06 17:13:23', 1);
INSERT INTO `exam_question` VALUES ('804829392a629d0a8f991ba0ae18e84e', 1, '317e751103f654a1631725d6e00355bd', '5', 1, '<p>看起来生活好像总是如此的不公平。但即便是这样，没有谁因此占了谁的便宜，每一个人都感觉自己是不公平的受难者。也就是说，刻薄的世界____，厚待的人生____。依次填入画横线处最恰当的一组是：</p>', '<p>比比皆是、遥遥无期</p>', 'C', '2023-05-06 17:15:01', '2023-05-06 17:15:01', 1);

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
INSERT INTO `exam_question_item` VALUES ('a133420c97ad053d28aee3981454f9bd', 'xxxx', 2, '2023-05-05 14:05:53', '2023-05-05 14:05:53', 1);
INSERT INTO `exam_question_item` VALUES ('9e7eba7c61e94eef02abab80b9216676', 'zzzz', 1, '2023-05-05 14:05:53', '2023-05-05 14:05:53', 1);
INSERT INTO `exam_question_item` VALUES ('8aa944b92c5480cf4a360a8f74bf4780', 'ffff', 4, '2023-05-05 14:05:09', '2023-05-05 14:05:09', 1);
INSERT INTO `exam_question_item` VALUES ('1ad58028f41fc777d7cdfa4a3ce9f634', 'aaaa', 1, '2023-05-05 14:05:09', '2023-05-05 14:05:09', 1);
INSERT INTO `exam_question_item` VALUES ('03edeabf538db100ae2b098a63227b3f', 'ssss', 2, '2023-05-05 14:05:09', '2023-05-05 14:05:09', 1);
INSERT INTO `exam_question_item` VALUES ('77688893f183e6ded9d2d1e89ac7fb81', 'dddd', 3, '2023-05-05 14:05:09', '2023-05-05 14:05:09', 1);
INSERT INTO `exam_question_item` VALUES ('e5a736fa638214e0db5716d10bd62e0f', 'cccc', 3, '2023-05-05 14:05:53', '2023-05-05 14:05:53', 1);
INSERT INTO `exam_question_item` VALUES ('a07f62694c989496158778bc2d974b2d', 'vvvv', 4, '2023-05-05 14:05:53', '2023-05-05 14:05:53', 1);
INSERT INTO `exam_question_item` VALUES ('b36bcd90f49ac6d7488dee3d4696a4c1', 'bbbb', 1, '2023-05-05 14:06:27', '2023-05-05 14:06:27', 1);
INSERT INTO `exam_question_item` VALUES ('91f39d6e9f0a1353e0d3be6999b58c7a', 'nnnn', 2, '2023-05-05 14:06:27', '2023-05-05 14:06:27', 1);
INSERT INTO `exam_question_item` VALUES ('c0c403a505c8bb076c600ab906f8b84b', 'rrrr', 4, '2023-05-05 14:04:23', '2023-05-05 14:04:23', 1);
INSERT INTO `exam_question_item` VALUES ('1b523714d14dc27f862d1434d056e663', 'eeee', 3, '2023-05-05 14:04:23', '2023-05-05 14:04:23', 1);
INSERT INTO `exam_question_item` VALUES ('0f3bd18a4bc54b351b1daf9589373e5c', 'wwww', 2, '2023-05-05 14:04:23', '2023-05-05 14:04:23', 1);
INSERT INTO `exam_question_item` VALUES ('d84d1a0aee194ac742a551e1894d33e9', 'qqqq', 1, '2023-05-05 14:04:23', '2023-05-05 14:04:23', 1);
INSERT INTO `exam_question_item` VALUES ('8aefd9d2bd84ac4f734f13c984c34800', 'mmmm', 3, '2023-05-05 14:06:27', '2023-05-05 14:06:27', 1);
INSERT INTO `exam_question_item` VALUES ('9ab7506e545aa6614d71d98b93e297c3', 'llll', 4, '2023-05-05 14:06:27', '2023-05-05 14:06:27', 1);
INSERT INTO `exam_question_item` VALUES ('caf22ce69b4182445e73df3eecca87bf', '<p>△三角形</p>', 1, '2023-05-06 14:32:54', '2023-05-06 14:32:54', 1);
INSERT INTO `exam_question_item` VALUES ('63890ad0b7071aacb5f1ac808a3d92c9', '<p><img src=\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20230506/00B0431B.png\" alt=\"\" data-href=\"\" style=\"\"/>笑哭</p>', 2, '2023-05-06 14:32:54', '2023-05-06 14:32:54', 1);
INSERT INTO `exam_question_item` VALUES ('96d626cf68531fb698cb6c45b7b88b9e', '<p><img src=\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20230506/00B053A6.png\" alt=\"\" data-href=\"\" style=\"\"/>大哭</p>', 3, '2023-05-06 14:32:54', '2023-05-06 14:32:54', 1);
INSERT INTO `exam_question_item` VALUES ('e674281a634d6eb54e3b0fee9e54fdf0', '<p><img src=\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20230506/00B05F3E.png\" alt=\"\" data-href=\"\" style=\"\"/>花</p>', 4, '2023-05-06 14:32:54', '2023-05-06 14:32:54', 1);
INSERT INTO `exam_question_item` VALUES ('80889b831728d012fd1a99d99ff5c834', '<p>《共产党宣言》的发表</p>', 1, '2023-05-06 15:32:44', '2023-05-06 15:32:44', 1);
INSERT INTO `exam_question_item` VALUES ('11b87fe698cd5748fd9f7059e17cd60f', '<p>《资本论》的出版</p>', 2, '2023-05-06 15:32:45', '2023-05-06 15:32:45', 1);
INSERT INTO `exam_question_item` VALUES ('fbceb571ef9a8238be519a8429414f36', '<p>巴黎公社的简历 </p>', 3, '2023-05-06 15:32:45', '2023-05-06 15:32:45', 1);
INSERT INTO `exam_question_item` VALUES ('3391df9b8edd49348a2ae9a6bfaaf936', '<p>十月革命的胜利</p>', 4, '2023-05-06 15:32:45', '2023-05-06 15:32:45', 1);
INSERT INTO `exam_question_item` VALUES ('1d8766b628606978060f37313e890eae', '<p>“入窑一色，出窑万彩”是钧瓷的特点</p>', 1, '2023-05-06 15:35:47', '2023-05-06 15:35:47', 1);
INSERT INTO `exam_question_item` VALUES ('f1099aed813ed57829ea19a013b515b0', '<p>紫砂壶是用含铁量较高的黏土制成的</p>', 2, '2023-05-06 15:35:47', '2023-05-06 15:35:47', 1);
INSERT INTO `exam_question_item` VALUES ('410c890d271fd89fb93e88c746a87a89', '<p>景德镇在宋代时期主要烧制青白瓷</p>', 3, '2023-05-06 15:35:47', '2023-05-06 15:35:47', 1);
INSERT INTO `exam_question_item` VALUES ('08dc9fbce19de01a4020f2611c493f52', '<p>唐三彩中最具代表性的造型是虎和骆驼</p>', 4, '2023-05-06 15:35:47', '2023-05-06 15:35:47', 1);
INSERT INTO `exam_question_item` VALUES ('0089008b94a295143c19142d5ed73822', '<p>林则徐---苟利国家生死以，岂因祸福避趋之</p>', 3, '2023-05-06 16:10:01', '2023-05-06 16:10:01', 1);
INSERT INTO `exam_question_item` VALUES ('6f54868b940b30b6e17339bb6a7f51ca', '<p>梁启超---国家之主人为谁？即一国之民是也</p>', 4, '2023-05-06 16:10:01', '2023-05-06 16:10:01', 1);
INSERT INTO `exam_question_item` VALUES ('f4f4be560e0971a0c1ca20aa324632e6', '<p>曾国藩---天变不足畏，祖宗不足法，人言不足恤</p>', 5, '2023-05-06 16:10:01', '2023-05-06 16:10:01', 1);
INSERT INTO `exam_question_item` VALUES ('e6fc9df9e656ee8e42ca2a4318f45b2c', '<p>孟子---穷则独善其身，达则兼济天下</p>', 2, '2023-05-06 16:10:01', '2023-05-06 16:10:01', 1);
INSERT INTO `exam_question_item` VALUES ('dd328665ced924071bcfb24d9fa1725e', '<p>鲁迅---《阿Q正传》---绍兴</p>', 1, '2023-05-06 15:41:00', '2023-05-06 15:41:00', 1);
INSERT INTO `exam_question_item` VALUES ('89cebb9c5c74946e963a4959358541b1', '<p>沈从文--《边城》---湘西</p>', 2, '2023-05-06 15:41:00', '2023-05-06 15:41:00', 1);
INSERT INTO `exam_question_item` VALUES ('4b75db34548b9586d54ee8e57b1667dd', '<p>汪曾祺--《受戒》---高邮</p>', 3, '2023-05-06 15:41:00', '2023-05-06 15:41:00', 1);
INSERT INTO `exam_question_item` VALUES ('9bf43fb4999bebdc0082d6265df40515', '<p>莫言---《红高粱》---东北</p>', 4, '2023-05-06 15:41:00', '2023-05-06 15:41:00', 1);
INSERT INTO `exam_question_item` VALUES ('cf6eb41b7bded8fb26853ac1fd1a2fca', '<p>齐物；中庸；正名</p>', 1, '2023-05-06 15:49:31', '2023-05-06 15:49:31', 1);
INSERT INTO `exam_question_item` VALUES ('14256b39737c434621c25457bd4614c9', '<p>四谛；五行；三纲</p>', 2, '2023-05-06 15:49:31', '2023-05-06 15:49:31', 1);
INSERT INTO `exam_question_item` VALUES ('233ad53c198809e6e0c74f4cadaad13f', '<p>五常；自然；因缘</p>', 3, '2023-05-06 15:49:31', '2023-05-06 15:49:31', 1);
INSERT INTO `exam_question_item` VALUES ('8e861e101716987d10986ba0b361d890', '<p>兼爱；良知；涅槃</p>', 4, '2023-05-06 15:49:31', '2023-05-06 15:49:31', 1);
INSERT INTO `exam_question_item` VALUES ('9516ca5ee0a208e7814177638a3d724d', '<p>中国、印度都有人获得</p>', 1, '2023-05-06 15:51:41', '2023-05-06 15:51:41', 1);
INSERT INTO `exam_question_item` VALUES ('38a3ea64bf7ee2726ac46a98f3b393a5', '<p>《雪国》是获奖作家川端康成的作品</p>', 2, '2023-05-06 15:51:41', '2023-05-06 15:51:41', 1);
INSERT INTO `exam_question_item` VALUES ('270ae018cd7b5be4d37cfd4ffd14ddc1', '<p>《百年孤独》是获奖作品</p>', 3, '2023-05-06 15:51:41', '2023-05-06 15:51:41', 1);
INSERT INTO `exam_question_item` VALUES ('7a7326aa2515f0ffe55671d7ca421b7e', '<p>列夫托尔斯泰是获奖作家</p>', 4, '2023-05-06 15:51:41', '2023-05-06 15:51:41', 1);
INSERT INTO `exam_question_item` VALUES ('8f2e03acef807df9683e610ccd0cd60f', '<p>燕太子丹与荆轲分坐八仙桌两侧，秉烛夜谈，谋划赴咸阳刺杀秦王计划</p>', 1, '2023-05-06 15:55:52', '2023-05-06 15:55:52', 1);
INSERT INTO `exam_question_item` VALUES ('daa81238abe300715cc3b11165816d22', '<p>毛泽东与李宗仁幽默的说：德邻先生，你这次归国，是误上了贼船啊</p>', 2, '2023-05-06 15:55:53', '2023-05-06 15:55:53', 1);
INSERT INTO `exam_question_item` VALUES ('a4cfea74834cd3bc18f72a5ee64aea2b', '<p>魏征劝谏李世民时，说道：陛下当先天下之忧而忧，后天下之乐而乐</p>', 3, '2023-05-06 15:55:53', '2023-05-06 15:55:53', 1);
INSERT INTO `exam_question_item` VALUES ('6df45676dadb8d9d4310a262c36f5e5f', '<p>越王勾践兵败后给吴王夫差当奴仆，以红薯充饥，每晚则睡在柴垛上</p>', 4, '2023-05-06 15:55:53', '2023-05-06 15:55:53', 1);
INSERT INTO `exam_question_item` VALUES ('b4d96b06f78475ede6734fba93b789ea', '<p>雨点从高空中匀速下落时只有重力做功</p>', 1, '2023-05-06 15:57:57', '2023-05-06 15:57:57', 1);
INSERT INTO `exam_question_item` VALUES ('0c5a0e8a8654840657a3e902e4d69020', '<p>匀速圆周运动的物体动能始终发生变化</p>', 2, '2023-05-06 15:57:57', '2023-05-06 15:57:57', 1);
INSERT INTO `exam_question_item` VALUES ('86e5e8f240a1a0acaf64e7794a5c844a', '<p>自由落体过程中物体的机械能保持不变</p>', 3, '2023-05-06 15:57:57', '2023-05-06 15:57:57', 1);
INSERT INTO `exam_question_item` VALUES ('239114c4eb5bc6ddb5d7014832a9c2fe', '<p>向上飞的石子重力做负功导致势能减小</p>', 4, '2023-05-06 15:57:57', '2023-05-06 15:57:57', 1);
INSERT INTO `exam_question_item` VALUES ('fea6dedc595241adae4935844db32ccf', '<p>母猩猩哺育幼猩猩</p>', 1, '2023-05-06 16:01:23', '2023-05-06 16:01:23', 1);
INSERT INTO `exam_question_item` VALUES ('e807c4e81d7d14e68ef21bc336f3df7c', '<p>乌贼遇敌喷出墨汁</p>', 2, '2023-05-06 16:01:23', '2023-05-06 16:01:23', 1);
INSERT INTO `exam_question_item` VALUES ('3b5b20e860826b1b619cf494d2f9b3c9', '<p>蜂王依靠工蜂喂养</p>', 3, '2023-05-06 16:01:23', '2023-05-06 16:01:23', 1);
INSERT INTO `exam_question_item` VALUES ('04e728ca57d78ce616d8a1e581f330e8', '<p>狗为吃骨头而斗争</p>', 4, '2023-05-06 16:01:23', '2023-05-06 16:01:23', 1);
INSERT INTO `exam_question_item` VALUES ('779cb2cdc2b01c96458de46c23f99ffa', '<p>中国蝗灾最严重的地区是两湖地区</p>', 1, '2023-05-06 16:04:33', '2023-05-06 16:04:33', 1);
INSERT INTO `exam_question_item` VALUES ('bf870e6ff549070893bf0ce7b7b19672', '<p>稻飞虱的天敌有蜘蛛、青蛙</p>', 2, '2023-05-06 16:04:33', '2023-05-06 16:04:33', 1);
INSERT INTO `exam_question_item` VALUES ('ebcd3c1592c12cb038a20b389329ed2b', '<p>松毛虫在高温干旱环境下更易繁殖</p>', 3, '2023-05-06 16:04:33', '2023-05-06 16:04:33', 1);
INSERT INTO `exam_question_item` VALUES ('0a6845f17d9f1e7bf52a4c61a30ce956', '<p>鼠类会啃食庄稼的根、茎、叶和种子</p>', 4, '2023-05-06 16:04:33', '2023-05-06 16:04:33', 1);
INSERT INTO `exam_question_item` VALUES ('613f8e39ed537278f3c1181b72896854', '<p>铁球</p>', 1, '2023-05-06 16:14:17', '2023-05-06 16:14:17', 1);
INSERT INTO `exam_question_item` VALUES ('69d73fac05c451a019cb511960ba6964', '<p>铝球</p>', 2, '2023-05-06 16:14:17', '2023-05-06 16:14:17', 1);
INSERT INTO `exam_question_item` VALUES ('cf3bcdf7b69787aafb4c0f8aadd269ad', '<p>铜球</p>', 3, '2023-05-06 16:14:17', '2023-05-06 16:14:17', 1);
INSERT INTO `exam_question_item` VALUES ('1b58977914cf9e93e5176596a21a4d15', '<p>铅球</p>', 4, '2023-05-06 16:14:17', '2023-05-06 16:14:17', 1);
INSERT INTO `exam_question_item` VALUES ('112c60d85b40192165114ef157b12187', '<p>树脂镜片和普通玻璃镜片的透光率不相上下</p>', 1, '2023-05-06 16:22:06', '2023-05-06 16:22:06', 1);
INSERT INTO `exam_question_item` VALUES ('7c1768fb0e8f565dbb7f95baaf59793a', '<p>树脂镜片的抗撞击力比普通玻璃镜片更强</p>', 2, '2023-05-06 16:22:06', '2023-05-06 16:22:06', 1);
INSERT INTO `exam_question_item` VALUES ('93b7a239e4241e1aa8ce85e33f654c45', '<p>和同样大小的普通玻璃镜片相比，树脂镜片要轻得多</p>', 3, '2023-05-06 16:22:06', '2023-05-06 16:22:06', 1);
INSERT INTO `exam_question_item` VALUES ('eabe28f71b0bd22771b49bc24c63a0ae', '<p>和普通玻璃镜片相比，树脂镜片更加耐磨</p>', 4, '2023-05-06 16:22:06', '2023-05-06 16:22:06', 1);
INSERT INTO `exam_question_item` VALUES ('bbd638071e36219a165605be195ad291', '<p>塑料大棚的薄膜能够提高光照强度</p>', 1, '2023-05-06 16:23:05', '2023-05-06 16:23:05', 1);
INSERT INTO `exam_question_item` VALUES ('40de87ba4228d9973ee43698d9b62135', '<p>搭建塑料大棚能有效防御地质灾害</p>', 2, '2023-05-06 16:23:05', '2023-05-06 16:23:05', 1);
INSERT INTO `exam_question_item` VALUES ('fd186fd28aa180442e455dbf7dfcb509', '<p>冬季在塑料大棚内熏烟有助于防御霜冻</p>', 3, '2023-05-06 16:23:05', '2023-05-06 16:23:05', 1);
INSERT INTO `exam_question_item` VALUES ('963d77ef1abf455976f414749f423bcd', '<p>无土栽培技术必须在塑料大棚中进行</p>', 4, '2023-05-06 16:23:05', '2023-05-06 16:23:05', 1);
INSERT INTO `exam_question_item` VALUES ('e2307bdcb55dff3da606c09404f4b8cb', '<p>主频是路由器中央处理器的时钟频率</p>', 1, '2023-05-06 16:24:10', '2023-05-06 16:24:10', 1);
INSERT INTO `exam_question_item` VALUES ('6a4f2cd8929f3c40d40aaf50f2bc6ad0', '<p>此款路由器属于千兆无线路由器</p>', 2, '2023-05-06 16:24:10', '2023-05-06 16:24:10', 1);
INSERT INTO `exam_question_item` VALUES ('2098c1890a9c996a5c3b2fe3ea02239a', '<p>路由器的LAN口可以用来连接外网</p>', 3, '2023-05-06 16:24:10', '2023-05-06 16:24:10', 1);
INSERT INTO `exam_question_item` VALUES ('79476c621421c001b6bb9d99e5ba1b37', '<p>5GHz频段比2.4GHz频段传输距离短</p>', 4, '2023-05-06 16:24:10', '2023-05-06 16:24:10', 1);
INSERT INTO `exam_question_item` VALUES ('c0b6d19da0a842d424456e00d38f645c', '<p>阿富汗</p>', 1, '2023-05-06 16:25:29', '2023-05-06 16:25:29', 1);
INSERT INTO `exam_question_item` VALUES ('6388a9844853da8339cb4f77642aff5c', '<p>南非</p>', 2, '2023-05-06 16:25:29', '2023-05-06 16:25:29', 1);
INSERT INTO `exam_question_item` VALUES ('13fa6e5dd10ad6de2d2bc7f094a93952', '<p>新加坡</p>', 3, '2023-05-06 16:25:29', '2023-05-06 16:25:29', 1);
INSERT INTO `exam_question_item` VALUES ('09c0efeee5d24370a51009284aef78e0', '<p>挪威</p>', 4, '2023-05-06 16:25:29', '2023-05-06 16:25:29', 1);
INSERT INTO `exam_question_item` VALUES ('91647a12099aadb7ff6ceb99df476ae1', '<p>英国</p>', 1, '2023-05-06 16:27:34', '2023-05-06 16:27:34', 1);
INSERT INTO `exam_question_item` VALUES ('48f957fa5bbd1bc386aae8323cfe004d', '<p>德国</p>', 2, '2023-05-06 16:27:34', '2023-05-06 16:27:34', 1);
INSERT INTO `exam_question_item` VALUES ('42f791521d475f74c65097e094fc0e05', '<p>意大利</p>', 3, '2023-05-06 16:27:34', '2023-05-06 16:27:34', 1);
INSERT INTO `exam_question_item` VALUES ('6a618de5b39433a5a28763b9725f3544', '<p>瑞士</p>', 4, '2023-05-06 16:27:34', '2023-05-06 16:27:34', 1);
INSERT INTO `exam_question_item` VALUES ('89f4cf1fb5dc9d6c9b2b398070a43769', '<p>遗嘱继承&gt;遗赠扶养协议&gt;法定继承</p>', 1, '2023-05-06 16:29:09', '2023-05-06 16:29:09', 1);
INSERT INTO `exam_question_item` VALUES ('00459a18cc229cc4cc0174c53575cc74', '<p>法定继承&gt;遗赠扶养协议&gt;遗嘱继承</p>', 2, '2023-05-06 16:29:09', '2023-05-06 16:29:09', 1);
INSERT INTO `exam_question_item` VALUES ('e14040b47f1bbb8816a523e985836e1b', '<p>遗赠扶养协议&gt;遗嘱继承&gt;法定继承</p>', 3, '2023-05-06 16:29:09', '2023-05-06 16:29:09', 1);
INSERT INTO `exam_question_item` VALUES ('2d0aebbd8de9c36e19dbbbd85070dc38', '<p>遗赠扶养协议&gt;法定继承&gt;遗嘱继承</p>', 4, '2023-05-06 16:29:09', '2023-05-06 16:29:09', 1);
INSERT INTO `exam_question_item` VALUES ('a81d90a10a94acbf3f3ef2e3eda413f2', '<p>①②</p>', 1, '2023-05-06 16:31:14', '2023-05-06 16:31:14', 1);
INSERT INTO `exam_question_item` VALUES ('048417c2c0b5dd6f40dce94d2543148b', '<p>①④</p>', 2, '2023-05-06 16:31:14', '2023-05-06 16:31:14', 1);
INSERT INTO `exam_question_item` VALUES ('c80eb23f419f6a4f038e197441100888', '<p>②③</p>', 3, '2023-05-06 16:31:14', '2023-05-06 16:31:14', 1);
INSERT INTO `exam_question_item` VALUES ('c50b1fce4a2f4bc5b12c07945ecf8c01', '<p>③④</p>', 4, '2023-05-06 16:31:14', '2023-05-06 16:31:14', 1);
INSERT INTO `exam_question_item` VALUES ('bf65f2261b713ac8036612a4710be5c2', '<p>“重点突破，强化应用”是社会信用体系建设的主要原则之一</p>', 1, '2023-05-06 16:32:31', '2023-05-06 16:32:31', 1);
INSERT INTO `exam_question_item` VALUES ('393d29bce1d2c6304eede89850dc91d6', '<p>为惩戒失信被执行人，规定其不得以财产支付子女就读高等院校的费用</p>', 2, '2023-05-06 16:32:31', '2023-05-06 16:32:31', 1);
INSERT INTO `exam_question_item` VALUES ('770b90e8b91a1086e3b681bcf7b81316', '<p>推进青年信用体系建设，逐步应用到人学、就业、创业等领域</p>', 3, '2023-05-06 16:32:31', '2023-05-06 16:32:31', 1);
INSERT INTO `exam_question_item` VALUES ('c2c7f45ee59ac45bc8d8d46737bfbfd9', '<p>使统一社会信用代码成为企业的唯一身份代码</p>', 4, '2023-05-06 16:32:31', '2023-05-06 16:32:31', 1);
INSERT INTO `exam_question_item` VALUES ('f9e2b514c532baa044ec02f973bfee3d', '<p>招投标时不得设置与业务能力无关的企业规模门槛</p>', 1, '2023-05-06 16:35:50', '2023-05-06 16:35:50', 1);
INSERT INTO `exam_question_item` VALUES ('a7f1d88191fa72dac8ce3940ac933d71', '<p>在人才引进支持政策方面对民营企业一视同仁，支持民营企业引进海外高层次人才C.鼓励民营企业积极参与社会公益、慈善事业</p>', 2, '2023-05-06 16:35:50', '2023-05-06 16:35:50', 1);
INSERT INTO `exam_question_item` VALUES ('8449e9b1cb2a7702735fddc471970c77', '<p>鼓励民营企业积极参与社会公益、慈善事业</p>', 3, '2023-05-06 16:35:50', '2023-05-06 16:35:50', 1);
INSERT INTO `exam_question_item` VALUES ('e5ae1fb50270f3e53838b0d483bcbd41', '<p>在电力、电信、铁路、石油等行业和领域，向民营企业全面开放</p>', 4, '2023-05-06 16:35:50', '2023-05-06 16:35:50', 1);
INSERT INTO `exam_question_item` VALUES ('fd05a84ec55b79c1586c9db30b3adf09', '<p>独具一格 、立足之地</p>', 1, '2023-05-06 16:59:47', '2023-05-06 16:59:47', 1);
INSERT INTO `exam_question_item` VALUES ('086c0ff1562b1dacc01e54465f34ab65', '<p>众所周知、一席之地</p>', 2, '2023-05-06 16:59:47', '2023-05-06 16:59:47', 1);
INSERT INTO `exam_question_item` VALUES ('6c0096f58d2ea32c99e7214426c9f4f0', '<p>不可替代、用武之地</p>', 3, '2023-05-06 16:59:47', '2023-05-06 16:59:47', 1);
INSERT INTO `exam_question_item` VALUES ('ac7f597f30ddad20f5efca3aa6e21da0', '<p>显而易见、立锥之地</p><p><br></p>', 4, '2023-05-06 16:59:47', '2023-05-06 16:59:47', 1);
INSERT INTO `exam_question_item` VALUES ('506bcf54bdb26c551ff89b219303b2dc', '<p>孤注一掷</p>', 1, '2023-05-06 17:01:29', '2023-05-06 17:01:29', 1);
INSERT INTO `exam_question_item` VALUES ('99703fa431c79291625e020d25981c08', '<p>歇斯底里</p>', 2, '2023-05-06 17:01:29', '2023-05-06 17:01:29', 1);
INSERT INTO `exam_question_item` VALUES ('0bd2ad8a586ba71964156032daaf5eb6', '<p>困兽犹斗</p>', 3, '2023-05-06 17:01:29', '2023-05-06 17:01:29', 1);
INSERT INTO `exam_question_item` VALUES ('44a6f2497e8bd13792f776541e1c2ed2', '<p>背水一战</p>', 4, '2023-05-06 17:01:29', '2023-05-06 17:01:29', 1);
INSERT INTO `exam_question_item` VALUES ('b48497c925d2ce6e40a47555f2a9af2c', '<p>无可辩驳、充耳不闻</p>', 1, '2023-05-06 17:11:47', '2023-05-06 17:11:47', 1);
INSERT INTO `exam_question_item` VALUES ('48fed97217a5e0e39840fcce81e973be', '<p>心服口服、置之不理</p>', 2, '2023-05-06 17:11:47', '2023-05-06 17:11:47', 1);
INSERT INTO `exam_question_item` VALUES ('b6ab8d22cc67cdde25c080cb4ed11e93', '<p>不置可否、不以为然</p>', 3, '2023-05-06 17:11:47', '2023-05-06 17:11:47', 1);
INSERT INTO `exam_question_item` VALUES ('185cf56e79b0b3ecd9e665a6c2ed13d3', '<p>眼见为实、将信将疑</p>', 4, '2023-05-06 17:11:47', '2023-05-06 17:11:47', 1);
INSERT INTO `exam_question_item` VALUES ('309c31b8638a40bccfdc89825315c8bb', '<p>哗众取宠、失枝脱节</p>', 1, '2023-05-06 17:13:23', '2023-05-06 17:13:23', 1);
INSERT INTO `exam_question_item` VALUES ('84c0798784ad5ac25df653da42912d8d', '<p>喧宾夺主、貌合神离</p>', 2, '2023-05-06 17:13:23', '2023-05-06 17:13:23', 1);
INSERT INTO `exam_question_item` VALUES ('544489132e1ae3ac31f23f8c596ee0c8', '<p>主次颠倒、亦步亦趋</p>', 3, '2023-05-06 17:13:23', '2023-05-06 17:13:23', 1);
INSERT INTO `exam_question_item` VALUES ('58bcac9f43f590d16af300893155d16f', '<p>避重就轻、格格不人</p>', 4, '2023-05-06 17:13:23', '2023-05-06 17:13:23', 1);
INSERT INTO `exam_question_item` VALUES ('01f750cb3f0c7a7a1aa63c9e3e022a89', '<p>屈指可数、指日可待</p>', 1, '2023-05-06 17:15:01', '2023-05-06 17:15:01', 1);
INSERT INTO `exam_question_item` VALUES ('2b399d7cdfb7355f19f890fdde4cbf3f', '<p>.广阔无垠、回头是岸</p>', 2, '2023-05-06 17:15:01', '2023-05-06 17:15:01', 1);
INSERT INTO `exam_question_item` VALUES ('67f0e298d3c156d4db7517993336f7f8', '<p>比比皆是、遥遥无期</p>', 3, '2023-05-06 17:15:01', '2023-05-06 17:15:01', 1);
INSERT INTO `exam_question_item` VALUES ('607d0094eacb2a06f040b7813f9602f9', '<p>寥寥无几、遥不可及</p>', 4, '2023-05-06 17:15:01', '2023-05-06 17:15:01', 1);

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
INSERT INTO `exam_question_relation_item` VALUES ('c4a58114d036a068f81b3b05b3d8ef6b', '7609b937bd7f089ab40ef3227240878b', '8aefd9d2bd84ac4f734f13c984c34800');
INSERT INTO `exam_question_relation_item` VALUES ('c8c29c1cfdc7704437cdb9d4559fdd30', '7609b937bd7f089ab40ef3227240878b', '91f39d6e9f0a1353e0d3be6999b58c7a');
INSERT INTO `exam_question_relation_item` VALUES ('c0343d630684d012f98fea9bf47c72c7', 'be256ac75c1678276eeca146daf68312', 'a07f62694c989496158778bc2d974b2d');
INSERT INTO `exam_question_relation_item` VALUES ('6e9a91b7a8b702b82dd034ce0baa314d', '7609b937bd7f089ab40ef3227240878b', 'b36bcd90f49ac6d7488dee3d4696a4c1');
INSERT INTO `exam_question_relation_item` VALUES ('e3d46369ca2356ef747d9f84e2898359', 'be256ac75c1678276eeca146daf68312', 'e5a736fa638214e0db5716d10bd62e0f');
INSERT INTO `exam_question_relation_item` VALUES ('56eefec8ae15237d2c2bb50e1c6f6aea', '5458c1ff422a15fbb1d1f0aa91e5585f', '1ad58028f41fc777d7cdfa4a3ce9f634');
INSERT INTO `exam_question_relation_item` VALUES ('a9c0adcbaebf6df73d273c6efa0496ed', '5458c1ff422a15fbb1d1f0aa91e5585f', '03edeabf538db100ae2b098a63227b3f');
INSERT INTO `exam_question_relation_item` VALUES ('52953384042ff4b317106aebfe9aea5f', '5458c1ff422a15fbb1d1f0aa91e5585f', '77688893f183e6ded9d2d1e89ac7fb81');
INSERT INTO `exam_question_relation_item` VALUES ('8160bbadd16252e304fb14e70c5254f1', '5458c1ff422a15fbb1d1f0aa91e5585f', '8aa944b92c5480cf4a360a8f74bf4780');
INSERT INTO `exam_question_relation_item` VALUES ('5013352d90685fa56b568a798d676172', 'be256ac75c1678276eeca146daf68312', '9e7eba7c61e94eef02abab80b9216676');
INSERT INTO `exam_question_relation_item` VALUES ('6b10430de610b079956937a53b3f1fb0', 'be256ac75c1678276eeca146daf68312', 'a133420c97ad053d28aee3981454f9bd');
INSERT INTO `exam_question_relation_item` VALUES ('ab3856e2a9f2dda6b73d2d60890c55f7', '3709038f4182a0557a4f052cd6fb752f', 'c0c403a505c8bb076c600ab906f8b84b');
INSERT INTO `exam_question_relation_item` VALUES ('cda2d5727a9eb1a1ddd4a8b51bcec711', '3709038f4182a0557a4f052cd6fb752f', '1b523714d14dc27f862d1434d056e663');
INSERT INTO `exam_question_relation_item` VALUES ('8cb0be606bddd0f94ad8f53258ec7517', '3709038f4182a0557a4f052cd6fb752f', '0f3bd18a4bc54b351b1daf9589373e5c');
INSERT INTO `exam_question_relation_item` VALUES ('f23651f90a5ebb1f223b8247f4721567', '3709038f4182a0557a4f052cd6fb752f', 'd84d1a0aee194ac742a551e1894d33e9');
INSERT INTO `exam_question_relation_item` VALUES ('01673a2e797adbbb88d3563e2fe6036a', '7609b937bd7f089ab40ef3227240878b', '9ab7506e545aa6614d71d98b93e297c3');
INSERT INTO `exam_question_relation_item` VALUES ('81ad50916b6aa297cfea4148c54b306c', '86645cd5db7901d5fe26275ac28cae45', 'caf22ce69b4182445e73df3eecca87bf');
INSERT INTO `exam_question_relation_item` VALUES ('53dcce9e708c02b70f1fac0969cc6e10', '86645cd5db7901d5fe26275ac28cae45', '63890ad0b7071aacb5f1ac808a3d92c9');
INSERT INTO `exam_question_relation_item` VALUES ('591180ef07f1b7a0abb76ebcf903642f', '86645cd5db7901d5fe26275ac28cae45', '96d626cf68531fb698cb6c45b7b88b9e');
INSERT INTO `exam_question_relation_item` VALUES ('94e875dc9b2858d0c863d59c202eeb1b', '86645cd5db7901d5fe26275ac28cae45', 'e674281a634d6eb54e3b0fee9e54fdf0');
INSERT INTO `exam_question_relation_item` VALUES ('b08aa61d48f4e876c712b964a9e23a3d', '68431d85174d7cd868394adf1203b8ea', '80889b831728d012fd1a99d99ff5c834');
INSERT INTO `exam_question_relation_item` VALUES ('b9d6ed0e8a2ddca6c04115fc51d6e0e5', '68431d85174d7cd868394adf1203b8ea', '11b87fe698cd5748fd9f7059e17cd60f');
INSERT INTO `exam_question_relation_item` VALUES ('5f81791aaea8302a7b937730ca54a956', '68431d85174d7cd868394adf1203b8ea', 'fbceb571ef9a8238be519a8429414f36');
INSERT INTO `exam_question_relation_item` VALUES ('241de86a529cc48debf445db131fd42e', '68431d85174d7cd868394adf1203b8ea', '3391df9b8edd49348a2ae9a6bfaaf936');
INSERT INTO `exam_question_relation_item` VALUES ('4c9764804875573804387f74f5382f9d', '49bf31e8a379b3a5a278777ad55aed7d', '1d8766b628606978060f37313e890eae');
INSERT INTO `exam_question_relation_item` VALUES ('73ebe684e8d38aa07e474a70da69d488', '49bf31e8a379b3a5a278777ad55aed7d', 'f1099aed813ed57829ea19a013b515b0');
INSERT INTO `exam_question_relation_item` VALUES ('843481bc95909db950041dc01656d713', '49bf31e8a379b3a5a278777ad55aed7d', '410c890d271fd89fb93e88c746a87a89');
INSERT INTO `exam_question_relation_item` VALUES ('a03a6ab72eb078cf92817a44e626f457', '49bf31e8a379b3a5a278777ad55aed7d', '08dc9fbce19de01a4020f2611c493f52');
INSERT INTO `exam_question_relation_item` VALUES ('3becffbe3458813be1f0e86fecf3559c', '54224b161e3ec581e397377faf422e86', 'e6fc9df9e656ee8e42ca2a4318f45b2c');
INSERT INTO `exam_question_relation_item` VALUES ('91fca199fb1029c5b6b9f5fe91b3cf6b', '54224b161e3ec581e397377faf422e86', '0089008b94a295143c19142d5ed73822');
INSERT INTO `exam_question_relation_item` VALUES ('baa85851b87121e898a72e0d60a58f53', '54224b161e3ec581e397377faf422e86', '6f54868b940b30b6e17339bb6a7f51ca');
INSERT INTO `exam_question_relation_item` VALUES ('19a3d9c1b7e4d982df337f45fd386ee4', '54224b161e3ec581e397377faf422e86', 'f4f4be560e0971a0c1ca20aa324632e6');
INSERT INTO `exam_question_relation_item` VALUES ('327fc37a7ce2e19b6a86021fb58563fb', 'f5f73700c3c3537c44a37c1a1ab7fe3d', 'dd328665ced924071bcfb24d9fa1725e');
INSERT INTO `exam_question_relation_item` VALUES ('0de6fa9ef129949b87d9b8990df53860', 'f5f73700c3c3537c44a37c1a1ab7fe3d', '89cebb9c5c74946e963a4959358541b1');
INSERT INTO `exam_question_relation_item` VALUES ('0abfbc5d4e809c5c944ff00c4281e635', 'f5f73700c3c3537c44a37c1a1ab7fe3d', '4b75db34548b9586d54ee8e57b1667dd');
INSERT INTO `exam_question_relation_item` VALUES ('62ec4524c565ccfc55ad0133a072b867', 'f5f73700c3c3537c44a37c1a1ab7fe3d', '9bf43fb4999bebdc0082d6265df40515');
INSERT INTO `exam_question_relation_item` VALUES ('f14f4dbe16efa3973d2849c1c187cda6', 'cd45b66035bf1ae28ce7e5505aae0d38', 'cf6eb41b7bded8fb26853ac1fd1a2fca');
INSERT INTO `exam_question_relation_item` VALUES ('c37624bf48c79a85c80e47cb0a7d2075', 'cd45b66035bf1ae28ce7e5505aae0d38', '14256b39737c434621c25457bd4614c9');
INSERT INTO `exam_question_relation_item` VALUES ('4d63c1529b3347670d416c70fb279ca8', 'cd45b66035bf1ae28ce7e5505aae0d38', '233ad53c198809e6e0c74f4cadaad13f');
INSERT INTO `exam_question_relation_item` VALUES ('fd9e020519d0a6e30145a3a95023807a', 'cd45b66035bf1ae28ce7e5505aae0d38', '8e861e101716987d10986ba0b361d890');
INSERT INTO `exam_question_relation_item` VALUES ('a1c89acac8053a671a157ef0f077935d', '2ffa6f9693a57dad0056653312d20cc6', '9516ca5ee0a208e7814177638a3d724d');
INSERT INTO `exam_question_relation_item` VALUES ('856f534e185b49f051f87ea98aa384dc', '2ffa6f9693a57dad0056653312d20cc6', '38a3ea64bf7ee2726ac46a98f3b393a5');
INSERT INTO `exam_question_relation_item` VALUES ('b1d2393527b8a2ae8256f4da1a1ce742', '2ffa6f9693a57dad0056653312d20cc6', '270ae018cd7b5be4d37cfd4ffd14ddc1');
INSERT INTO `exam_question_relation_item` VALUES ('1dad9c8856611179f8d0703a31a7ac26', '2ffa6f9693a57dad0056653312d20cc6', '7a7326aa2515f0ffe55671d7ca421b7e');
INSERT INTO `exam_question_relation_item` VALUES ('6a7c80b2d72404a2f5be518a3e9f9403', 'a601a58f1d870c4cd443346a296a1dd3', '8f2e03acef807df9683e610ccd0cd60f');
INSERT INTO `exam_question_relation_item` VALUES ('b8cf947688fb2c8b0a0911a20e4c3924', 'a601a58f1d870c4cd443346a296a1dd3', 'daa81238abe300715cc3b11165816d22');
INSERT INTO `exam_question_relation_item` VALUES ('5a6e19e3ccc17e8e172a8a4f139fa313', 'a601a58f1d870c4cd443346a296a1dd3', 'a4cfea74834cd3bc18f72a5ee64aea2b');
INSERT INTO `exam_question_relation_item` VALUES ('bfa497a9db67896a322ada705f98259d', 'a601a58f1d870c4cd443346a296a1dd3', '6df45676dadb8d9d4310a262c36f5e5f');
INSERT INTO `exam_question_relation_item` VALUES ('56baea7fb17d1eced0151cb6a8e19546', '773d538d80b3f61fa43809ef460026e2', 'b4d96b06f78475ede6734fba93b789ea');
INSERT INTO `exam_question_relation_item` VALUES ('630e068e121e5319d58db76dee724a4a', '773d538d80b3f61fa43809ef460026e2', '0c5a0e8a8654840657a3e902e4d69020');
INSERT INTO `exam_question_relation_item` VALUES ('ae97ea51bdd0f21f33b9ce05fabd4e62', '773d538d80b3f61fa43809ef460026e2', '86e5e8f240a1a0acaf64e7794a5c844a');
INSERT INTO `exam_question_relation_item` VALUES ('18389aed1628a5c9a8f607c8d463ba96', '773d538d80b3f61fa43809ef460026e2', '239114c4eb5bc6ddb5d7014832a9c2fe');
INSERT INTO `exam_question_relation_item` VALUES ('7f29b441e450a2fb4dfbfc413f072c04', 'd3cd1bf295543547703556a09c5c0e3d', 'fea6dedc595241adae4935844db32ccf');
INSERT INTO `exam_question_relation_item` VALUES ('99b01b0cf5640039831cd713b2b855d5', 'd3cd1bf295543547703556a09c5c0e3d', 'e807c4e81d7d14e68ef21bc336f3df7c');
INSERT INTO `exam_question_relation_item` VALUES ('d34e8e46b05011d5a213589d0461ebd0', 'd3cd1bf295543547703556a09c5c0e3d', '3b5b20e860826b1b619cf494d2f9b3c9');
INSERT INTO `exam_question_relation_item` VALUES ('721cba4fc22a1b5914b9c5cf6ff04a0d', 'd3cd1bf295543547703556a09c5c0e3d', '04e728ca57d78ce616d8a1e581f330e8');
INSERT INTO `exam_question_relation_item` VALUES ('7d43e1ace95ecfbefbe065e0afb4d5d1', 'fb7bc3ce017f498f82d441f0b3297638', '779cb2cdc2b01c96458de46c23f99ffa');
INSERT INTO `exam_question_relation_item` VALUES ('b2838c093cb019e5ece205e429c24ad7', 'fb7bc3ce017f498f82d441f0b3297638', 'bf870e6ff549070893bf0ce7b7b19672');
INSERT INTO `exam_question_relation_item` VALUES ('c0e7b7acbd1b221c8cb14ed05f1e358a', 'fb7bc3ce017f498f82d441f0b3297638', 'ebcd3c1592c12cb038a20b389329ed2b');
INSERT INTO `exam_question_relation_item` VALUES ('cd09539d9f26609f32d45a3791eef84d', 'fb7bc3ce017f498f82d441f0b3297638', '0a6845f17d9f1e7bf52a4c61a30ce956');
INSERT INTO `exam_question_relation_item` VALUES ('8310421eba7c52cfc3d21fa707f62d90', 'c2f99cf8acc0dff755d35b18f28c2dc1', '613f8e39ed537278f3c1181b72896854');
INSERT INTO `exam_question_relation_item` VALUES ('668739bc3fba521eb4a52b3592ce8cd9', 'c2f99cf8acc0dff755d35b18f28c2dc1', '69d73fac05c451a019cb511960ba6964');
INSERT INTO `exam_question_relation_item` VALUES ('d11d24861ae4a719ed9b00c9f1abdc41', 'c2f99cf8acc0dff755d35b18f28c2dc1', 'cf3bcdf7b69787aafb4c0f8aadd269ad');
INSERT INTO `exam_question_relation_item` VALUES ('dc4f550321ff87c295b006461b5cb133', 'c2f99cf8acc0dff755d35b18f28c2dc1', '1b58977914cf9e93e5176596a21a4d15');
INSERT INTO `exam_question_relation_item` VALUES ('a78b8b802746436d6a58f830b1ce2ce9', '8438fa82e93bbcec402c4691166d36a9', '112c60d85b40192165114ef157b12187');
INSERT INTO `exam_question_relation_item` VALUES ('a73d27140d3fa1d6c3a8f5ac425b372c', '8438fa82e93bbcec402c4691166d36a9', '7c1768fb0e8f565dbb7f95baaf59793a');
INSERT INTO `exam_question_relation_item` VALUES ('4cbff54f685b1c573b992409c02258a2', '8438fa82e93bbcec402c4691166d36a9', '93b7a239e4241e1aa8ce85e33f654c45');
INSERT INTO `exam_question_relation_item` VALUES ('f76fa702b2a8447ec020371739387a83', '8438fa82e93bbcec402c4691166d36a9', 'eabe28f71b0bd22771b49bc24c63a0ae');
INSERT INTO `exam_question_relation_item` VALUES ('055fa8cf3d941d2a6e7e12a47386d013', '1baa5b714f226ffd9e325dbbaab0888f', 'bbd638071e36219a165605be195ad291');
INSERT INTO `exam_question_relation_item` VALUES ('374ce59c843f3f3adf2f14e54f1c916e', '1baa5b714f226ffd9e325dbbaab0888f', '40de87ba4228d9973ee43698d9b62135');
INSERT INTO `exam_question_relation_item` VALUES ('11e1c48d146f5008fdd00d1fa0317008', '1baa5b714f226ffd9e325dbbaab0888f', 'fd186fd28aa180442e455dbf7dfcb509');
INSERT INTO `exam_question_relation_item` VALUES ('1d2f3fd1f7a6b92c0321b39a13f4228f', '1baa5b714f226ffd9e325dbbaab0888f', '963d77ef1abf455976f414749f423bcd');
INSERT INTO `exam_question_relation_item` VALUES ('bbd43db03d2e729229a4a601d80d38ed', '0b04d2714ea9549c562a9ff67dbdd7f5', 'e2307bdcb55dff3da606c09404f4b8cb');
INSERT INTO `exam_question_relation_item` VALUES ('8f8684fba7027989836cd1ca35a7bee9', '0b04d2714ea9549c562a9ff67dbdd7f5', '6a4f2cd8929f3c40d40aaf50f2bc6ad0');
INSERT INTO `exam_question_relation_item` VALUES ('ef8d9acebd15bd29e6fe916e73b42a4b', '0b04d2714ea9549c562a9ff67dbdd7f5', '2098c1890a9c996a5c3b2fe3ea02239a');
INSERT INTO `exam_question_relation_item` VALUES ('5aa935b02c69e3e22ee166404883cf7c', '0b04d2714ea9549c562a9ff67dbdd7f5', '79476c621421c001b6bb9d99e5ba1b37');
INSERT INTO `exam_question_relation_item` VALUES ('5f779f241c42a2bc614d2b8a60e3af68', '93ad55b99458be8dcfb89ab2f38fd113', 'c0b6d19da0a842d424456e00d38f645c');
INSERT INTO `exam_question_relation_item` VALUES ('5b7fb5a1ead86620835cd3da439c6ac2', '93ad55b99458be8dcfb89ab2f38fd113', '6388a9844853da8339cb4f77642aff5c');
INSERT INTO `exam_question_relation_item` VALUES ('90de346b25e0d20bd9d3f43f715ce8f6', '93ad55b99458be8dcfb89ab2f38fd113', '13fa6e5dd10ad6de2d2bc7f094a93952');
INSERT INTO `exam_question_relation_item` VALUES ('99375dc49113a8c2b141a16464f9d01e', '93ad55b99458be8dcfb89ab2f38fd113', '09c0efeee5d24370a51009284aef78e0');
INSERT INTO `exam_question_relation_item` VALUES ('e616f89824bc06afb0393e736d366d26', '3253641cf7e0b30eaf60ef8e08314eeb', '91647a12099aadb7ff6ceb99df476ae1');
INSERT INTO `exam_question_relation_item` VALUES ('c44bb5c22a64f6869cbddbdff1b076e0', '3253641cf7e0b30eaf60ef8e08314eeb', '48f957fa5bbd1bc386aae8323cfe004d');
INSERT INTO `exam_question_relation_item` VALUES ('bb2741869ba97cc07b0bf776b78a6f69', '3253641cf7e0b30eaf60ef8e08314eeb', '42f791521d475f74c65097e094fc0e05');
INSERT INTO `exam_question_relation_item` VALUES ('2a74102c1a09a1eec7f6899e253bb3ef', '3253641cf7e0b30eaf60ef8e08314eeb', '6a618de5b39433a5a28763b9725f3544');
INSERT INTO `exam_question_relation_item` VALUES ('373b68fc400b3ebe74509ca5cc4b7957', '372d47b6d6b9044373ee7121072e086d', '89f4cf1fb5dc9d6c9b2b398070a43769');
INSERT INTO `exam_question_relation_item` VALUES ('921aeb550bffca92d2a301ac6fdead86', '372d47b6d6b9044373ee7121072e086d', '00459a18cc229cc4cc0174c53575cc74');
INSERT INTO `exam_question_relation_item` VALUES ('406d492de710a0a416f2557ea8c89558', '372d47b6d6b9044373ee7121072e086d', 'e14040b47f1bbb8816a523e985836e1b');
INSERT INTO `exam_question_relation_item` VALUES ('8c2571c369d458ccce5e9e9a13503169', '372d47b6d6b9044373ee7121072e086d', '2d0aebbd8de9c36e19dbbbd85070dc38');
INSERT INTO `exam_question_relation_item` VALUES ('1589fbf3c9f2847d5b365d8627ac4732', 'f2dc08d81583a6daa3b02937435ef352', 'a81d90a10a94acbf3f3ef2e3eda413f2');
INSERT INTO `exam_question_relation_item` VALUES ('3068cf7455e2012df6b20214779e1c1b', 'f2dc08d81583a6daa3b02937435ef352', '048417c2c0b5dd6f40dce94d2543148b');
INSERT INTO `exam_question_relation_item` VALUES ('88db9ad81bbd5f2f06aed2a780e98cc9', 'f2dc08d81583a6daa3b02937435ef352', 'c80eb23f419f6a4f038e197441100888');
INSERT INTO `exam_question_relation_item` VALUES ('f183434268b4974fc4a61953c7ba1d32', 'f2dc08d81583a6daa3b02937435ef352', 'c50b1fce4a2f4bc5b12c07945ecf8c01');
INSERT INTO `exam_question_relation_item` VALUES ('5c23e2830bae43a825a75afdda0677d9', 'a2aa279b8da232262198038397ca2bbb', 'bf65f2261b713ac8036612a4710be5c2');
INSERT INTO `exam_question_relation_item` VALUES ('6143617561240ec847b51ad5799f190e', 'a2aa279b8da232262198038397ca2bbb', '393d29bce1d2c6304eede89850dc91d6');
INSERT INTO `exam_question_relation_item` VALUES ('344acdb5572610fe02fb49661ed4d079', 'a2aa279b8da232262198038397ca2bbb', '770b90e8b91a1086e3b681bcf7b81316');
INSERT INTO `exam_question_relation_item` VALUES ('d02fa945e37dbea6ae0f644dc7fe73af', 'a2aa279b8da232262198038397ca2bbb', 'c2c7f45ee59ac45bc8d8d46737bfbfd9');
INSERT INTO `exam_question_relation_item` VALUES ('37764bcf837591364a03011e23177768', 'a5d9d52f3e2587a535f469f02ecffc94', 'f9e2b514c532baa044ec02f973bfee3d');
INSERT INTO `exam_question_relation_item` VALUES ('3b1853f8d53a5818cf07c06358c75cfb', 'a5d9d52f3e2587a535f469f02ecffc94', 'a7f1d88191fa72dac8ce3940ac933d71');
INSERT INTO `exam_question_relation_item` VALUES ('eac413472819fb3096d1a195101b97fc', 'a5d9d52f3e2587a535f469f02ecffc94', '8449e9b1cb2a7702735fddc471970c77');
INSERT INTO `exam_question_relation_item` VALUES ('45609d4a00a289dd191484c54f40aeb5', 'a5d9d52f3e2587a535f469f02ecffc94', 'e5ae1fb50270f3e53838b0d483bcbd41');
INSERT INTO `exam_question_relation_item` VALUES ('73621f5a040271956a5e84520643c47b', '7e078ae6e13329a33b38eb9d2020dbb1', 'fd05a84ec55b79c1586c9db30b3adf09');
INSERT INTO `exam_question_relation_item` VALUES ('f092120c12ac34a6766228c68ab0d38c', '7e078ae6e13329a33b38eb9d2020dbb1', '086c0ff1562b1dacc01e54465f34ab65');
INSERT INTO `exam_question_relation_item` VALUES ('3393e8e1b0876fc411ae642c85091705', '7e078ae6e13329a33b38eb9d2020dbb1', '6c0096f58d2ea32c99e7214426c9f4f0');
INSERT INTO `exam_question_relation_item` VALUES ('4656dccf1336df51cdc70f688c58db63', '7e078ae6e13329a33b38eb9d2020dbb1', 'ac7f597f30ddad20f5efca3aa6e21da0');
INSERT INTO `exam_question_relation_item` VALUES ('b6c9788650b4ef10d7b50493c9e780e9', 'c2ced61f2da13636fdfac0217ed5b30c', '506bcf54bdb26c551ff89b219303b2dc');
INSERT INTO `exam_question_relation_item` VALUES ('15973c1796a38f77a49d9c01bea8a160', 'c2ced61f2da13636fdfac0217ed5b30c', '99703fa431c79291625e020d25981c08');
INSERT INTO `exam_question_relation_item` VALUES ('7d891e3c7659e6c3ebef84198a1e11fd', 'c2ced61f2da13636fdfac0217ed5b30c', '0bd2ad8a586ba71964156032daaf5eb6');
INSERT INTO `exam_question_relation_item` VALUES ('003f234087f2eb5da904f1e5866752e1', 'c2ced61f2da13636fdfac0217ed5b30c', '44a6f2497e8bd13792f776541e1c2ed2');
INSERT INTO `exam_question_relation_item` VALUES ('e6f26356d6b52dd27b82fdf781feb0dc', 'e5d4ed43b5e6f4885bdfe4bb0b3e89dc', 'b48497c925d2ce6e40a47555f2a9af2c');
INSERT INTO `exam_question_relation_item` VALUES ('0299c68d50a25e37839c967f0213e07e', 'e5d4ed43b5e6f4885bdfe4bb0b3e89dc', '48fed97217a5e0e39840fcce81e973be');
INSERT INTO `exam_question_relation_item` VALUES ('a835137d15488d9dc558872261677afe', 'e5d4ed43b5e6f4885bdfe4bb0b3e89dc', 'b6ab8d22cc67cdde25c080cb4ed11e93');
INSERT INTO `exam_question_relation_item` VALUES ('3b8cdbc330a46b00c4eb3f27c8632b8b', 'e5d4ed43b5e6f4885bdfe4bb0b3e89dc', '185cf56e79b0b3ecd9e665a6c2ed13d3');
INSERT INTO `exam_question_relation_item` VALUES ('b003f772cd4d1001e155beef083bdce9', 'fcb4a860935e333ae1896a1d4684e873', '309c31b8638a40bccfdc89825315c8bb');
INSERT INTO `exam_question_relation_item` VALUES ('eecd4ba2b55d43992bfbcf68d5d275e1', 'fcb4a860935e333ae1896a1d4684e873', '84c0798784ad5ac25df653da42912d8d');
INSERT INTO `exam_question_relation_item` VALUES ('e23632f9600a086572a2e4a38d317be5', 'fcb4a860935e333ae1896a1d4684e873', '544489132e1ae3ac31f23f8c596ee0c8');
INSERT INTO `exam_question_relation_item` VALUES ('c6a4af9fd8ffcee1ccf73d1700eeb307', 'fcb4a860935e333ae1896a1d4684e873', '58bcac9f43f590d16af300893155d16f');
INSERT INTO `exam_question_relation_item` VALUES ('f27a9c653e0615bc82df5514ad212302', '804829392a629d0a8f991ba0ae18e84e', '01f750cb3f0c7a7a1aa63c9e3e022a89');
INSERT INTO `exam_question_relation_item` VALUES ('b84d2dfb467a77ac3ecd9d0926a29538', '804829392a629d0a8f991ba0ae18e84e', '2b399d7cdfb7355f19f890fdde4cbf3f');
INSERT INTO `exam_question_relation_item` VALUES ('96e294d18f1bb33aa2fa74c4148c85de', '804829392a629d0a8f991ba0ae18e84e', '67f0e298d3c156d4db7517993336f7f8');
INSERT INTO `exam_question_relation_item` VALUES ('726dc641f1b11d3afd33b5465cf83013', '804829392a629d0a8f991ba0ae18e84e', '607d0094eacb2a06f040b7813f9602f9');

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '管理员表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_admin
-- ----------------------------
INSERT INTO `ums_admin` VALUES (3, 'admin', '123456', '0:0:0:0:0:0:0:1', '2023-05-06 14:19:37', 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220620/lihezong.webp', '2022-06-20 16:11:43', '2022-06-20 16:11:43', 1);

-- ----------------------------
-- Table structure for ums_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin_role`;
CREATE TABLE `ums_admin_role`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `admin_id` int(20) NULL DEFAULT NULL COMMENT '管理员id',
  `role_id` int(20) NULL DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户和角色关系表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '班级表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = MyISAM AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学院/专业表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = MyISAM AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 133 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_role_menu
-- ----------------------------
INSERT INTO `ums_role_menu` VALUES (121, 10, 1);
INSERT INTO `ums_role_menu` VALUES (122, 10, 2);
INSERT INTO `ums_role_menu` VALUES (123, 10, 4);
INSERT INTO `ums_role_menu` VALUES (124, 10, 5);
INSERT INTO `ums_role_menu` VALUES (125, 10, 6);
INSERT INTO `ums_role_menu` VALUES (126, 10, 9);
INSERT INTO `ums_role_menu` VALUES (127, 10, 8);
INSERT INTO `ums_role_menu` VALUES (128, 10, 10);
INSERT INTO `ums_role_menu` VALUES (129, 10, 11);
INSERT INTO `ums_role_menu` VALUES (130, 10, 12);
INSERT INTO `ums_role_menu` VALUES (131, 10, 14);
INSERT INTO `ums_role_menu` VALUES (132, 10, 13);

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
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '教师表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_teacher
-- ----------------------------
INSERT INTO `ums_teacher` VALUES ('8daa621c57a934669b9609bf83e0e5ff', '黄老师', '20230416', '637bfb9a8fab4117c09e946afcacf6ae', 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20230419/000.png', 0, '1224311695@qq.com', '18756492368', '2023-04-19 14:30:18', '2023-04-19 14:30:18', 1);

SET FOREIGN_KEY_CHECKS = 1;
