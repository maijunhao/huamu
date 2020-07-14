/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : cms

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 14/07/2020 12:03:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dr_1_bbs
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_bbs`;
CREATE TABLE `dr_1_bbs`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) UNSIGNED NOT NULL COMMENT '栏目id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主题',
  `thumb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '缩略图',
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关键字',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '描述',
  `hits` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '浏览数',
  `uid` int(10) UNSIGNED NOT NULL COMMENT '作者id',
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '作者名称',
  `status` tinyint(2) NOT NULL COMMENT '状态',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `link_id` int(10) NOT NULL DEFAULT 0 COMMENT '同步id',
  `tableid` smallint(5) UNSIGNED NOT NULL COMMENT '附表id',
  `inputip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '录入时间',
  `updatetime` int(10) UNSIGNED NOT NULL COMMENT '更新时间',
  `comments` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '评论数量',
  `avgsort` decimal(10, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '平均点评分数',
  `displayorder` int(10) NULL DEFAULT 0 COMMENT '排序值',
  `color` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '颜色',
  `isflag` int(10) NULL DEFAULT 0 COMMENT '置顶',
  `reply_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`, `updatetime`) USING BTREE,
  INDEX `link_id`(`link_id`) USING BTREE,
  INDEX `comments`(`comments`) USING BTREE,
  INDEX `avgsort`(`avgsort`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `updatetime`(`updatetime`) USING BTREE,
  INDEX `hits`(`hits`) USING BTREE,
  INDEX `displayorder`(`displayorder`, `updatetime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '内容主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_bbs_cat_count
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_bbs_cat_count`;
CREATE TABLE `dr_1_bbs_cat_count`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `catid` int(10) NOT NULL,
  `today_subjects` int(10) NOT NULL,
  `today_replys` int(10) NOT NULL,
  `subjects` int(10) NOT NULL,
  `replys` int(10) NOT NULL,
  `last_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_cid` int(10) NOT NULL,
  `last_username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_uid` int(10) NOT NULL,
  `last_time` int(10) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '板块统计' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_bbs_category
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_bbs_category`;
CREATE TABLE `dr_1_bbs_category`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级id',
  `pids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所有上级id',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '栏目名称',
  `dirname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '上级目录',
  `child` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否有下级',
  `childids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '下级所有id',
  `thumb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '栏目图片',
  `show` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否显示',
  `setting` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '属性配置',
  `displayorder` mediumint(8) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `show`(`show`) USING BTREE,
  INDEX `module`(`pid`, `displayorder`, `id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '栏目表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_bbs_category_data
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_bbs_category_data`;
CREATE TABLE `dr_1_bbs_category_data`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` int(3) UNSIGNED NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '栏目模型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_bbs_category_data_0
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_bbs_category_data_0`;
CREATE TABLE `dr_1_bbs_category_data_0`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '栏目模型表的附表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_bbs_comment
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_bbs_comment`;
CREATE TABLE `dr_1_bbs_comment`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `cid` int(10) UNSIGNED NOT NULL COMMENT '关联id',
  `cuid` int(10) UNSIGNED NOT NULL COMMENT '关联uid',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `orderid` bigint(18) UNSIGNED NOT NULL COMMENT '订单id',
  `uid` mediumint(8) UNSIGNED NULL DEFAULT 0 COMMENT '评论者ID',
  `author` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评论者账号',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '评论内容',
  `support` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '支持数',
  `oppose` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '反对数',
  `avgsort` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '平均分',
  `sort1` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort2` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort3` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort4` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort5` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort6` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort7` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort8` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort9` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `reply` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '回复id',
  `in_reply` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否存在回复',
  `status` smallint(1) UNSIGNED NULL DEFAULT 0 COMMENT '审核状态',
  `inputip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '录入时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `orderid`(`orderid`) USING BTREE,
  INDEX `reply`(`reply`) USING BTREE,
  INDEX `support`(`support`) USING BTREE,
  INDEX `oppose`(`oppose`) USING BTREE,
  INDEX `avgsort`(`avgsort`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `aa`(`cid`, `status`, `inputtime`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '评论内容表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_bbs_comment_index
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_bbs_comment_index`;
CREATE TABLE `dr_1_bbs_comment_index`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) UNSIGNED NOT NULL COMMENT '内容id',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `support` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '支持数',
  `oppose` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '反对数',
  `comments` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '评论数',
  `avgsort` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '平均分',
  `sort1` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort2` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort3` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort4` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort5` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort6` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort7` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort8` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort9` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `tableid` smallint(5) UNSIGNED NULL DEFAULT 0 COMMENT '附表id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `support`(`support`) USING BTREE,
  INDEX `oppose`(`oppose`) USING BTREE,
  INDEX `comments`(`comments`) USING BTREE,
  INDEX `avgsort`(`avgsort`) USING BTREE,
  INDEX `tableid`(`tableid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '评论索引表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_bbs_data_0
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_bbs_data_0`;
CREATE TABLE `dr_1_bbs_data_0`  (
  `id` int(10) UNSIGNED NOT NULL,
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` smallint(5) UNSIGNED NOT NULL COMMENT '栏目id',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '内容附表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_bbs_draft
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_bbs_draft`;
CREATE TABLE `dr_1_bbs_draft`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cid` int(10) UNSIGNED NOT NULL COMMENT '内容id',
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '具体内容',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '内容草稿表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_bbs_flag
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_bbs_flag`;
CREATE TABLE `dr_1_bbs_flag`  (
  `flag` tinyint(2) UNSIGNED NOT NULL DEFAULT 1 COMMENT '文档标记id',
  `id` int(10) UNSIGNED NOT NULL COMMENT '文档内容id',
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  INDEX `flag`(`flag`, `id`, `uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '标记表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_bbs_hits
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_bbs_hits`;
CREATE TABLE `dr_1_bbs_hits`  (
  `id` int(10) UNSIGNED NOT NULL COMMENT '文章id',
  `hits` int(10) UNSIGNED NOT NULL COMMENT '总点击数',
  `day_hits` int(10) UNSIGNED NOT NULL COMMENT '本日点击',
  `week_hits` int(10) UNSIGNED NOT NULL COMMENT '本周点击',
  `month_hits` int(10) UNSIGNED NOT NULL COMMENT '本月点击',
  `year_hits` int(10) UNSIGNED NOT NULL COMMENT '年点击量',
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `day_hits`(`day_hits`) USING BTREE,
  INDEX `week_hits`(`week_hits`) USING BTREE,
  INDEX `month_hits`(`month_hits`) USING BTREE,
  INDEX `year_hits`(`year_hits`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '时段点击量统计' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_bbs_index
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_bbs_index`;
CREATE TABLE `dr_1_bbs_index`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '内容索引表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_bbs_recycle
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_bbs_recycle`;
CREATE TABLE `dr_1_bbs_recycle`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cid` int(10) UNSIGNED NOT NULL COMMENT '内容id',
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) UNSIGNED NOT NULL COMMENT '栏目id',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '具体内容',
  `result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '删除理由',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '内容回收站表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_bbs_search
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_bbs_search`;
CREATE TABLE `dr_1_bbs_search`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '参数数组',
  `keyword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '关键字',
  `contentid` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'id集合',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '搜索时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `keyword`(`keyword`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '搜索表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_bbs_time
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_bbs_time`;
CREATE TABLE `dr_1_bbs_time`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '具体内容',
  `result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '处理结果',
  `posttime` int(10) UNSIGNED NOT NULL COMMENT '定时发布时间',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `posttime`(`posttime`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '内容定时发布表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_bbs_verify
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_bbs_verify`;
CREATE TABLE `dr_1_bbs_verify`  (
  `id` int(10) UNSIGNED NOT NULL,
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `vid` tinyint(2) NOT NULL COMMENT '审核id号',
  `isnew` tinyint(1) UNSIGNED NOT NULL COMMENT '是否新增',
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '作者',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '具体内容',
  `backuid` mediumint(8) UNSIGNED NOT NULL COMMENT '操作人uid',
  `backinfo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作退回信息',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '录入时间',
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `vid`(`vid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE,
  INDEX `backuid`(`backuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '内容审核表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_block
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_block`;
CREATE TABLE `dr_1_block`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '别名',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `code`(`code`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '资料块表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dr_1_block
-- ----------------------------
INSERT INTO `dr_1_block` VALUES (1, '集团全称', 'jtqc', '{i-0}:某某集团有限公司');
INSERT INTO `dr_1_block` VALUES (2, '电话', 'phone', '{i-0}:000-88888888');
INSERT INTO `dr_1_block` VALUES (3, '简历投递邮箱', 'email', '{i-0}:admin@admin.com');
INSERT INTO `dr_1_block` VALUES (4, '地址', 'address', '{i-0}:北京市天桥区****************');
INSERT INTO `dr_1_block` VALUES (5, '电话', 'tel', '{i-0}:000-88888888');
INSERT INTO `dr_1_block` VALUES (6, '百度地图ip', 'bd-ip', '{i-0}:116.516952,39.994247');
INSERT INTO `dr_1_block` VALUES (7, '微信号', 'weixin', '{i-0}:wx123456');
INSERT INTO `dr_1_block` VALUES (8, '图片模块背景图片', 'photo_pic', '{i-3}:19');
INSERT INTO `dr_1_block` VALUES (9, '新闻模块背景图片	', 'news_pic', '{i-3}:20');
INSERT INTO `dr_1_block` VALUES (10, '单页模块背景图片', 'page_pic', '{i-3}:21');
INSERT INTO `dr_1_block` VALUES (11, '下载模块背景图片	', 'down_pic', '{i-3}:22');
INSERT INTO `dr_1_block` VALUES (12, '常见问题模块背景图片', 'question_pic', '{i-3}:23');
INSERT INTO `dr_1_block` VALUES (13, '人才招聘模块背景图片', 'join_pic', '{i-3}:24');

-- ----------------------------
-- Table structure for dr_1_demo
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_demo`;
CREATE TABLE `dr_1_demo`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) UNSIGNED NOT NULL COMMENT '栏目id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主题',
  `thumb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '缩略图',
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关键字',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '描述',
  `hits` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '浏览数',
  `uid` int(10) UNSIGNED NOT NULL COMMENT '作者id',
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '作者名称',
  `status` tinyint(2) NOT NULL COMMENT '状态',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `link_id` int(10) NOT NULL DEFAULT 0 COMMENT '同步id',
  `tableid` smallint(5) UNSIGNED NOT NULL COMMENT '附表id',
  `inputip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '录入时间',
  `updatetime` int(10) UNSIGNED NOT NULL COMMENT '更新时间',
  `comments` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '评论数量',
  `favorites` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '收藏数量',
  `avgsort` decimal(10, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '平均点评分数',
  `support` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '支持数',
  `oppose` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '反对数',
  `donation` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '捐赠总额',
  `displayorder` int(10) NULL DEFAULT 0 COMMENT '排序值',
  `fkbd_total` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '表单反馈表单统计',
  `wbsj` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dxwb` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `baiduditu_lng` decimal(9, 6) NULL DEFAULT NULL,
  `baiduditu_lat` decimal(9, 6) NULL DEFAULT NULL,
  `danxuananniu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fuxuankuang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `rqsjgs` int(10) UNSIGNED NULL DEFAULT NULL,
  `nyrgs` int(10) UNSIGNED NULL DEFAULT NULL,
  `xialaxuanze` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dgwjsc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dgtpsc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `csxz` mediumint(8) UNSIGNED NULL DEFAULT NULL,
  `cssx` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `glxzxwnr` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ysfyb` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dydgm` decimal(10, 2) NULL DEFAULT NULL,
  `zhxgm` decimal(9, 2) NULL DEFAULT NULL,
  `zhxgm_sku` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `zhxgm_quantity` int(10) NULL DEFAULT NULL,
  `zhxgm_sn` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `wenben1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `wenben2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`, `updatetime`) USING BTREE,
  INDEX `link_id`(`link_id`) USING BTREE,
  INDEX `comments`(`comments`) USING BTREE,
  INDEX `avgsort`(`avgsort`) USING BTREE,
  INDEX `support`(`support`) USING BTREE,
  INDEX `oppose`(`oppose`) USING BTREE,
  INDEX `donation`(`donation`) USING BTREE,
  INDEX `favorites`(`favorites`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `updatetime`(`updatetime`) USING BTREE,
  INDEX `hits`(`hits`) USING BTREE,
  INDEX `displayorder`(`displayorder`, `updatetime`) USING BTREE,
  INDEX `fkbd_total`(`fkbd_total`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 160 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '内容主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_demo_category
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_demo_category`;
CREATE TABLE `dr_1_demo_category`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级id',
  `pids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所有上级id',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '栏目名称',
  `dirname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '上级目录',
  `child` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否有下级',
  `childids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '下级所有id',
  `thumb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '栏目图片',
  `show` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否显示',
  `setting` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '属性配置',
  `displayorder` mediumint(8) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `show`(`show`) USING BTREE,
  INDEX `module`(`pid`, `displayorder`, `id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '栏目表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_demo_category_data
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_demo_category_data`;
CREATE TABLE `dr_1_demo_category_data`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` int(3) UNSIGNED NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '栏目模型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_demo_category_data_0
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_demo_category_data_0`;
CREATE TABLE `dr_1_demo_category_data_0`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '栏目模型表的附表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_demo_comment
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_demo_comment`;
CREATE TABLE `dr_1_demo_comment`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `cid` int(10) UNSIGNED NOT NULL COMMENT '关联id',
  `cuid` int(10) UNSIGNED NOT NULL COMMENT '关联uid',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `orderid` bigint(18) UNSIGNED NOT NULL COMMENT '订单id',
  `uid` mediumint(8) UNSIGNED NULL DEFAULT 0 COMMENT '评论者ID',
  `author` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评论者账号',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '评论内容',
  `support` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '支持数',
  `oppose` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '反对数',
  `avgsort` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '平均分',
  `sort1` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort2` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort3` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort4` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort5` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort6` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort7` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort8` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort9` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `reply` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '回复id',
  `in_reply` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否存在回复',
  `status` smallint(1) UNSIGNED NULL DEFAULT 0 COMMENT '审核状态',
  `inputip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '录入时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `orderid`(`orderid`) USING BTREE,
  INDEX `reply`(`reply`) USING BTREE,
  INDEX `support`(`support`) USING BTREE,
  INDEX `oppose`(`oppose`) USING BTREE,
  INDEX `avgsort`(`avgsort`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `aa`(`cid`, `status`, `inputtime`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '评论内容表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_demo_comment_index
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_demo_comment_index`;
CREATE TABLE `dr_1_demo_comment_index`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) UNSIGNED NOT NULL COMMENT '内容id',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `support` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '支持数',
  `oppose` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '反对数',
  `comments` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '评论数',
  `avgsort` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '平均分',
  `sort1` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort2` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort3` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort4` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort5` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort6` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort7` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort8` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort9` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `tableid` smallint(5) UNSIGNED NULL DEFAULT 0 COMMENT '附表id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `support`(`support`) USING BTREE,
  INDEX `oppose`(`oppose`) USING BTREE,
  INDEX `comments`(`comments`) USING BTREE,
  INDEX `avgsort`(`avgsort`) USING BTREE,
  INDEX `tableid`(`tableid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '评论索引表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_demo_data_0
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_demo_data_0`;
CREATE TABLE `dr_1_demo_data_0`  (
  `id` int(10) UNSIGNED NOT NULL,
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` smallint(5) UNSIGNED NOT NULL COMMENT '栏目id',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '内容附表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_demo_draft
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_demo_draft`;
CREATE TABLE `dr_1_demo_draft`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cid` int(10) UNSIGNED NOT NULL COMMENT '内容id',
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '具体内容',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '内容草稿表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_demo_flag
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_demo_flag`;
CREATE TABLE `dr_1_demo_flag`  (
  `flag` tinyint(2) UNSIGNED NOT NULL DEFAULT 1 COMMENT '文档标记id',
  `id` int(10) UNSIGNED NOT NULL COMMENT '文档内容id',
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  INDEX `flag`(`flag`, `id`, `uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '标记表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_demo_hits
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_demo_hits`;
CREATE TABLE `dr_1_demo_hits`  (
  `id` int(10) UNSIGNED NOT NULL COMMENT '文章id',
  `hits` int(10) UNSIGNED NOT NULL COMMENT '总点击数',
  `day_hits` int(10) UNSIGNED NOT NULL COMMENT '本日点击',
  `week_hits` int(10) UNSIGNED NOT NULL COMMENT '本周点击',
  `month_hits` int(10) UNSIGNED NOT NULL COMMENT '本月点击',
  `year_hits` int(10) UNSIGNED NOT NULL COMMENT '年点击量',
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `day_hits`(`day_hits`) USING BTREE,
  INDEX `week_hits`(`week_hits`) USING BTREE,
  INDEX `month_hits`(`month_hits`) USING BTREE,
  INDEX `year_hits`(`year_hits`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '时段点击量统计' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_demo_index
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_demo_index`;
CREATE TABLE `dr_1_demo_index`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '内容索引表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_demo_recycle
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_demo_recycle`;
CREATE TABLE `dr_1_demo_recycle`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cid` int(10) UNSIGNED NOT NULL COMMENT '内容id',
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) UNSIGNED NOT NULL COMMENT '栏目id',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '具体内容',
  `result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '删除理由',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '内容回收站表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_demo_search
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_demo_search`;
CREATE TABLE `dr_1_demo_search`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '参数数组',
  `keyword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '关键字',
  `contentid` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'id集合',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '搜索时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `keyword`(`keyword`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '搜索表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_demo_time
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_demo_time`;
CREATE TABLE `dr_1_demo_time`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '具体内容',
  `result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '处理结果',
  `posttime` int(10) UNSIGNED NOT NULL COMMENT '定时发布时间',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `posttime`(`posttime`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '内容定时发布表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_demo_verify
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_demo_verify`;
CREATE TABLE `dr_1_demo_verify`  (
  `id` int(10) UNSIGNED NOT NULL,
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `vid` tinyint(2) NOT NULL COMMENT '审核id号',
  `isnew` tinyint(1) UNSIGNED NOT NULL COMMENT '是否新增',
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '作者',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '具体内容',
  `backuid` mediumint(8) UNSIGNED NOT NULL COMMENT '操作人uid',
  `backinfo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作退回信息',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '录入时间',
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `vid`(`vid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE,
  INDEX `backuid`(`backuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '内容审核表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_down
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_down`;
CREATE TABLE `dr_1_down`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) UNSIGNED NOT NULL COMMENT '栏目id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主题',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩略图',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键字',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
  `hits` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '浏览数',
  `uid` int(10) UNSIGNED NOT NULL COMMENT '作者id',
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者名称',
  `status` tinyint(2) NOT NULL COMMENT '状态',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `link_id` int(10) NOT NULL DEFAULT 0 COMMENT '同步id',
  `tableid` smallint(5) UNSIGNED NOT NULL COMMENT '附表id',
  `inputip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) NOT NULL COMMENT '更新时间',
  `updatetime` int(10) NOT NULL COMMENT '更新时间',
  `comments` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '评论数量',
  `avgsort` decimal(10, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '平均点评分数',
  `displayorder` int(10) NULL DEFAULT 0 COMMENT '排序值',
  `file` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上传文件',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`, `updatetime`) USING BTREE,
  INDEX `link_id`(`link_id`) USING BTREE,
  INDEX `comments`(`comments`) USING BTREE,
  INDEX `avgsort`(`avgsort`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `updatetime`(`updatetime`) USING BTREE,
  INDEX `hits`(`hits`) USING BTREE,
  INDEX `displayorder`(`displayorder`, `updatetime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内容主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_down_category
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_down_category`;
CREATE TABLE `dr_1_down_category`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级id',
  `pids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所有上级id',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '栏目名称',
  `dirname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '上级目录',
  `child` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否有下级',
  `childids` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '下级所有id',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '栏目图片',
  `show` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否显示',
  `setting` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性配置',
  `displayorder` mediumint(8) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `show`(`show`) USING BTREE,
  INDEX `module`(`pid`, `displayorder`, `id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '栏目表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_down_category_data
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_down_category_data`;
CREATE TABLE `dr_1_down_category_data`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` int(3) UNSIGNED NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '栏目模型表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for dr_1_down_category_data_0
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_down_category_data_0`;
CREATE TABLE `dr_1_down_category_data_0`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '栏目模型表的附表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for dr_1_down_comment
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_down_comment`;
CREATE TABLE `dr_1_down_comment`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `cid` int(10) UNSIGNED NOT NULL COMMENT '关联id',
  `cuid` int(10) UNSIGNED NOT NULL COMMENT '关联uid',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `orderid` bigint(18) UNSIGNED NOT NULL COMMENT '订单id',
  `uid` mediumint(8) UNSIGNED NULL DEFAULT 0 COMMENT '评论者ID',
  `author` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论者账号',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '评论内容',
  `support` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '支持数',
  `oppose` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '反对数',
  `avgsort` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '平均分',
  `sort1` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort2` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort3` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort4` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort5` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort6` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort7` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort8` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort9` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `reply` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '回复id',
  `in_reply` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否存在回复',
  `status` smallint(1) UNSIGNED NULL DEFAULT 0 COMMENT '审核状态',
  `inputip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '录入时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `orderid`(`orderid`) USING BTREE,
  INDEX `reply`(`reply`) USING BTREE,
  INDEX `support`(`support`) USING BTREE,
  INDEX `oppose`(`oppose`) USING BTREE,
  INDEX `avgsort`(`avgsort`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `aa`(`cid`, `status`, `inputtime`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '评论内容表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_down_comment_index
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_down_comment_index`;
CREATE TABLE `dr_1_down_comment_index`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) UNSIGNED NOT NULL COMMENT '内容id',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `support` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '支持数',
  `oppose` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '反对数',
  `comments` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '评论数',
  `avgsort` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '平均分',
  `sort1` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort2` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort3` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort4` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort5` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort6` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort7` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort8` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort9` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `tableid` smallint(5) UNSIGNED NULL DEFAULT 0 COMMENT '附表id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `support`(`support`) USING BTREE,
  INDEX `oppose`(`oppose`) USING BTREE,
  INDEX `comments`(`comments`) USING BTREE,
  INDEX `avgsort`(`avgsort`) USING BTREE,
  INDEX `tableid`(`tableid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '评论索引表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for dr_1_down_data_0
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_down_data_0`;
CREATE TABLE `dr_1_down_data_0`  (
  `id` int(10) UNSIGNED NOT NULL,
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` smallint(5) UNSIGNED NOT NULL COMMENT '栏目id',
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内容附表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_down_draft
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_down_draft`;
CREATE TABLE `dr_1_down_draft`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cid` int(10) UNSIGNED NOT NULL COMMENT '内容id',
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '具体内容',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内容草稿表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_down_flag
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_down_flag`;
CREATE TABLE `dr_1_down_flag`  (
  `flag` tinyint(2) UNSIGNED NOT NULL DEFAULT 1 COMMENT '文档标记id',
  `id` int(10) UNSIGNED NOT NULL COMMENT '文档内容id',
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  INDEX `flag`(`flag`, `id`, `uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '标记表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for dr_1_down_hits
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_down_hits`;
CREATE TABLE `dr_1_down_hits`  (
  `id` int(10) UNSIGNED NOT NULL COMMENT '文章id',
  `hits` int(10) UNSIGNED NOT NULL COMMENT '总点击数',
  `day_hits` int(10) UNSIGNED NOT NULL COMMENT '本日点击',
  `week_hits` int(10) UNSIGNED NOT NULL COMMENT '本周点击',
  `month_hits` int(10) UNSIGNED NOT NULL COMMENT '本月点击',
  `year_hits` int(10) UNSIGNED NOT NULL COMMENT '年点击量',
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `day_hits`(`day_hits`) USING BTREE,
  INDEX `week_hits`(`week_hits`) USING BTREE,
  INDEX `month_hits`(`month_hits`) USING BTREE,
  INDEX `year_hits`(`year_hits`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '时段点击量统计' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for dr_1_down_index
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_down_index`;
CREATE TABLE `dr_1_down_index`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内容索引表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for dr_1_down_recycle
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_down_recycle`;
CREATE TABLE `dr_1_down_recycle`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cid` int(10) UNSIGNED NOT NULL COMMENT '内容id',
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) UNSIGNED NOT NULL COMMENT '栏目id',
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '具体内容',
  `result` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '删除理由',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内容回收站表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_down_search
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_down_search`;
CREATE TABLE `dr_1_down_search`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `params` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '参数数组',
  `keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关键字',
  `contentid` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id集合',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '搜索时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `keyword`(`keyword`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '搜索表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_down_time
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_down_time`;
CREATE TABLE `dr_1_down_time`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '具体内容',
  `result` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '处理结果',
  `posttime` int(10) UNSIGNED NOT NULL COMMENT '定时发布时间',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `posttime`(`posttime`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内容定时发布表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_down_verify
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_down_verify`;
CREATE TABLE `dr_1_down_verify`  (
  `id` int(10) UNSIGNED NOT NULL,
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `isnew` tinyint(1) UNSIGNED NOT NULL COMMENT '是否新增',
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '具体内容',
  `backuid` mediumint(8) UNSIGNED NOT NULL COMMENT '操作人uid',
  `backinfo` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作退回信息',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '录入时间',
  `vid` int(10) NULL DEFAULT NULL,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE,
  INDEX `backuid`(`backuid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内容审核表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_fang
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_fang`;
CREATE TABLE `dr_1_fang`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) UNSIGNED NOT NULL COMMENT '栏目id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主题',
  `thumb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '缩略图',
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关键字',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '描述',
  `hits` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '浏览数',
  `uid` int(10) UNSIGNED NOT NULL COMMENT '作者id',
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '作者名称',
  `status` tinyint(2) NOT NULL COMMENT '状态',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `link_id` int(10) NOT NULL DEFAULT 0 COMMENT '同步id',
  `tableid` smallint(5) UNSIGNED NOT NULL COMMENT '附表id',
  `inputip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '录入时间',
  `updatetime` int(10) UNSIGNED NOT NULL COMMENT '更新时间',
  `comments` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '评论数量',
  `avgsort` decimal(10, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '平均点评分数',
  `displayorder` int(10) NULL DEFAULT 0 COMMENT '排序值',
  `area` mediumint(8) UNSIGNED NULL DEFAULT NULL COMMENT '所在地',
  `xiaoqumingcheng` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '小区名称',
  `dizhi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `weizhi_lng` decimal(9, 6) NULL DEFAULT NULL COMMENT '位置',
  `weizhi_lat` decimal(9, 6) NULL DEFAULT NULL COMMENT '位置',
  `zujinleixing` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租金类型',
  `zujin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租金',
  `suozaiceng` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在层',
  `zongceng` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '总层',
  `chaoxiang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '朝向',
  `zhuangxiu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '装修',
  `mianji` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '面积',
  `wei` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卫',
  `ting` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '厅',
  `shi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '室',
  `huxing` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '户型',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`, `updatetime`) USING BTREE,
  INDEX `link_id`(`link_id`) USING BTREE,
  INDEX `comments`(`comments`) USING BTREE,
  INDEX `avgsort`(`avgsort`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `updatetime`(`updatetime`) USING BTREE,
  INDEX `hits`(`hits`) USING BTREE,
  INDEX `displayorder`(`displayorder`, `updatetime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '内容主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_fang_category
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_fang_category`;
CREATE TABLE `dr_1_fang_category`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级id',
  `pids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所有上级id',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '栏目名称',
  `dirname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '上级目录',
  `child` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否有下级',
  `childids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '下级所有id',
  `thumb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '栏目图片',
  `show` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否显示',
  `setting` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '属性配置',
  `displayorder` mediumint(8) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `show`(`show`) USING BTREE,
  INDEX `module`(`pid`, `displayorder`, `id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '栏目表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_fang_category_data
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_fang_category_data`;
CREATE TABLE `dr_1_fang_category_data`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` int(3) UNSIGNED NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '栏目模型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_fang_category_data_0
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_fang_category_data_0`;
CREATE TABLE `dr_1_fang_category_data_0`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '栏目模型表的附表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_fang_comment
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_fang_comment`;
CREATE TABLE `dr_1_fang_comment`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `cid` int(10) UNSIGNED NOT NULL COMMENT '关联id',
  `cuid` int(10) UNSIGNED NOT NULL COMMENT '关联uid',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `orderid` bigint(18) UNSIGNED NOT NULL COMMENT '订单id',
  `uid` mediumint(8) UNSIGNED NULL DEFAULT 0 COMMENT '评论者ID',
  `author` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评论者账号',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '评论内容',
  `support` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '支持数',
  `oppose` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '反对数',
  `avgsort` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '平均分',
  `sort1` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort2` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort3` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort4` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort5` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort6` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort7` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort8` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort9` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `reply` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '回复id',
  `in_reply` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否存在回复',
  `status` smallint(1) UNSIGNED NULL DEFAULT 0 COMMENT '审核状态',
  `inputip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '录入时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `orderid`(`orderid`) USING BTREE,
  INDEX `reply`(`reply`) USING BTREE,
  INDEX `support`(`support`) USING BTREE,
  INDEX `oppose`(`oppose`) USING BTREE,
  INDEX `avgsort`(`avgsort`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `aa`(`cid`, `status`, `inputtime`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '评论内容表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_fang_comment_index
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_fang_comment_index`;
CREATE TABLE `dr_1_fang_comment_index`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) UNSIGNED NOT NULL COMMENT '内容id',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `support` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '支持数',
  `oppose` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '反对数',
  `comments` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '评论数',
  `avgsort` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '平均分',
  `sort1` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort2` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort3` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort4` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort5` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort6` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort7` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort8` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort9` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `tableid` smallint(5) UNSIGNED NULL DEFAULT 0 COMMENT '附表id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `support`(`support`) USING BTREE,
  INDEX `oppose`(`oppose`) USING BTREE,
  INDEX `comments`(`comments`) USING BTREE,
  INDEX `avgsort`(`avgsort`) USING BTREE,
  INDEX `tableid`(`tableid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '评论索引表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_fang_data_0
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_fang_data_0`;
CREATE TABLE `dr_1_fang_data_0`  (
  `id` int(10) UNSIGNED NOT NULL,
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` smallint(5) UNSIGNED NOT NULL COMMENT '栏目id',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '房屋图片',
  `peitao` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '配套',
  `lianxiren` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `lianxidianhua` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '内容附表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_fang_draft
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_fang_draft`;
CREATE TABLE `dr_1_fang_draft`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cid` int(10) UNSIGNED NOT NULL COMMENT '内容id',
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '具体内容',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '内容草稿表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_fang_flag
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_fang_flag`;
CREATE TABLE `dr_1_fang_flag`  (
  `flag` tinyint(2) UNSIGNED NOT NULL DEFAULT 1 COMMENT '文档标记id',
  `id` int(10) UNSIGNED NOT NULL COMMENT '文档内容id',
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  INDEX `flag`(`flag`, `id`, `uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '标记表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_fang_hits
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_fang_hits`;
CREATE TABLE `dr_1_fang_hits`  (
  `id` int(10) UNSIGNED NOT NULL COMMENT '文章id',
  `hits` int(10) UNSIGNED NOT NULL COMMENT '总点击数',
  `day_hits` int(10) UNSIGNED NOT NULL COMMENT '本日点击',
  `week_hits` int(10) UNSIGNED NOT NULL COMMENT '本周点击',
  `month_hits` int(10) UNSIGNED NOT NULL COMMENT '本月点击',
  `year_hits` int(10) UNSIGNED NOT NULL COMMENT '年点击量',
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `day_hits`(`day_hits`) USING BTREE,
  INDEX `week_hits`(`week_hits`) USING BTREE,
  INDEX `month_hits`(`month_hits`) USING BTREE,
  INDEX `year_hits`(`year_hits`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '时段点击量统计' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_fang_index
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_fang_index`;
CREATE TABLE `dr_1_fang_index`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '内容索引表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_fang_recycle
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_fang_recycle`;
CREATE TABLE `dr_1_fang_recycle`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cid` int(10) UNSIGNED NOT NULL COMMENT '内容id',
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) UNSIGNED NOT NULL COMMENT '栏目id',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '具体内容',
  `result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '删除理由',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '内容回收站表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_fang_search
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_fang_search`;
CREATE TABLE `dr_1_fang_search`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '参数数组',
  `keyword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '关键字',
  `contentid` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'id集合',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '搜索时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `keyword`(`keyword`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '搜索表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_fang_time
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_fang_time`;
CREATE TABLE `dr_1_fang_time`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '具体内容',
  `result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '处理结果',
  `posttime` int(10) UNSIGNED NOT NULL COMMENT '定时发布时间',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `posttime`(`posttime`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '内容定时发布表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_fang_verify
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_fang_verify`;
CREATE TABLE `dr_1_fang_verify`  (
  `id` int(10) UNSIGNED NOT NULL,
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `vid` tinyint(2) NOT NULL COMMENT '审核id号',
  `isnew` tinyint(1) UNSIGNED NOT NULL COMMENT '是否新增',
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '作者',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '具体内容',
  `backuid` mediumint(8) UNSIGNED NOT NULL COMMENT '操作人uid',
  `backinfo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作退回信息',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '录入时间',
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `vid`(`vid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE,
  INDEX `backuid`(`backuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '内容审核表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_form
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_form`;
CREATE TABLE `dr_1_form`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `table` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表名',
  `setting` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '配置信息',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `table`(`table`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '表单模型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dr_1_form
-- ----------------------------
INSERT INTO `dr_1_form` VALUES (1, '投诉及维修', 'complaint', '');

-- ----------------------------
-- Table structure for dr_1_form_complaint
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_form_complaint`;
CREATE TABLE `dr_1_form_complaint`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '录入者uid',
  `author` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '录入者账号',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主题',
  `inputip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '录入时间',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '状态值',
  `displayorder` int(10) NOT NULL DEFAULT 0 COMMENT '排序值',
  `tableid` smallint(5) UNSIGNED NOT NULL COMMENT '附表id',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '您的电话',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '您的地址',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系邮箱',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '留言内容',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE,
  INDEX `displayorder`(`displayorder`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '投诉及维修表单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dr_1_form_complaint
-- ----------------------------
INSERT INTO `dr_1_form_complaint` VALUES (1, 1, 'admin', '昵称', '127.0.0.1', 1573366884, 0, 0, 0, '1515151515', '1515151111111111111111', '111111111111111@q.com', '内容内容内容内容内容内容内容内容内容内容');
INSERT INTO `dr_1_form_complaint` VALUES (2, 1, 'admin', '昵称', '127.0.0.1', 1573367164, 0, 0, 0, '1515151515', '1515151111111111111111', '111111111111111@q.com', '内容内容内容内容内容内容内容内容内容内容');
INSERT INTO `dr_1_form_complaint` VALUES (3, 1, 'admin', '11111111111', '127.0.0.1', 1573783060, 0, 0, 0, '2222222222222', '333333333333333', '34444444444444@qq.com', '4445555555555555');

-- ----------------------------
-- Table structure for dr_1_form_complaint_data_0
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_form_complaint_data_0`;
CREATE TABLE `dr_1_form_complaint_data_0`  (
  `id` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '录入者uid',
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '投诉及维修表单附表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of dr_1_form_complaint_data_0
-- ----------------------------
INSERT INTO `dr_1_form_complaint_data_0` VALUES (1, 1);
INSERT INTO `dr_1_form_complaint_data_0` VALUES (2, 1);
INSERT INTO `dr_1_form_complaint_data_0` VALUES (3, 1);

-- ----------------------------
-- Table structure for dr_1_join
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_join`;
CREATE TABLE `dr_1_join`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) UNSIGNED NOT NULL COMMENT '栏目id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主题',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩略图',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键字',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
  `hits` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '浏览数',
  `uid` int(10) UNSIGNED NOT NULL COMMENT '作者id',
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者名称',
  `status` tinyint(2) NOT NULL COMMENT '状态',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `link_id` int(10) NOT NULL DEFAULT 0 COMMENT '同步id',
  `tableid` smallint(5) UNSIGNED NOT NULL COMMENT '附表id',
  `inputip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) NOT NULL COMMENT '更新时间',
  `updatetime` int(10) NOT NULL COMMENT '更新时间',
  `comments` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '评论数量',
  `avgsort` decimal(10, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '平均点评分数',
  `displayorder` int(10) NULL DEFAULT 0 COMMENT '排序值',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位类型',
  `experience` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工作经验',
  `requirement` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学历要求',
  `num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '招聘人数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`, `updatetime`) USING BTREE,
  INDEX `link_id`(`link_id`) USING BTREE,
  INDEX `comments`(`comments`) USING BTREE,
  INDEX `avgsort`(`avgsort`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `updatetime`(`updatetime`) USING BTREE,
  INDEX `hits`(`hits`) USING BTREE,
  INDEX `displayorder`(`displayorder`, `updatetime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内容主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_join_category
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_join_category`;
CREATE TABLE `dr_1_join_category`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级id',
  `pids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所有上级id',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '栏目名称',
  `dirname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '上级目录',
  `child` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否有下级',
  `childids` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '下级所有id',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '栏目图片',
  `show` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否显示',
  `setting` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性配置',
  `displayorder` mediumint(8) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `show`(`show`) USING BTREE,
  INDEX `module`(`pid`, `displayorder`, `id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '栏目表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_join_category_data
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_join_category_data`;
CREATE TABLE `dr_1_join_category_data`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` int(3) UNSIGNED NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '栏目模型表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for dr_1_join_category_data_0
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_join_category_data_0`;
CREATE TABLE `dr_1_join_category_data_0`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '栏目模型表的附表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for dr_1_join_comment
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_join_comment`;
CREATE TABLE `dr_1_join_comment`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `cid` int(10) UNSIGNED NOT NULL COMMENT '关联id',
  `cuid` int(10) UNSIGNED NOT NULL COMMENT '关联uid',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `orderid` bigint(18) UNSIGNED NOT NULL COMMENT '订单id',
  `uid` mediumint(8) UNSIGNED NULL DEFAULT 0 COMMENT '评论者ID',
  `author` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论者账号',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '评论内容',
  `support` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '支持数',
  `oppose` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '反对数',
  `avgsort` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '平均分',
  `sort1` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort2` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort3` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort4` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort5` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort6` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort7` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort8` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort9` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `reply` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '回复id',
  `in_reply` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否存在回复',
  `status` smallint(1) UNSIGNED NULL DEFAULT 0 COMMENT '审核状态',
  `inputip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '录入时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `orderid`(`orderid`) USING BTREE,
  INDEX `reply`(`reply`) USING BTREE,
  INDEX `support`(`support`) USING BTREE,
  INDEX `oppose`(`oppose`) USING BTREE,
  INDEX `avgsort`(`avgsort`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `aa`(`cid`, `status`, `inputtime`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '评论内容表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_join_comment_index
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_join_comment_index`;
CREATE TABLE `dr_1_join_comment_index`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) UNSIGNED NOT NULL COMMENT '内容id',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `support` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '支持数',
  `oppose` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '反对数',
  `comments` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '评论数',
  `avgsort` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '平均分',
  `sort1` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort2` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort3` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort4` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort5` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort6` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort7` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort8` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort9` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `tableid` smallint(5) UNSIGNED NULL DEFAULT 0 COMMENT '附表id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `support`(`support`) USING BTREE,
  INDEX `oppose`(`oppose`) USING BTREE,
  INDEX `comments`(`comments`) USING BTREE,
  INDEX `avgsort`(`avgsort`) USING BTREE,
  INDEX `tableid`(`tableid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '评论索引表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for dr_1_join_copy1
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_join_copy1`;
CREATE TABLE `dr_1_join_copy1`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) UNSIGNED NOT NULL COMMENT '栏目id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主题',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩略图',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键字',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
  `hits` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '浏览数',
  `uid` int(10) UNSIGNED NOT NULL COMMENT '作者id',
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者名称',
  `status` tinyint(2) NOT NULL COMMENT '状态',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `link_id` int(10) NOT NULL DEFAULT 0 COMMENT '同步id',
  `tableid` smallint(5) UNSIGNED NOT NULL COMMENT '附表id',
  `inputip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) NOT NULL COMMENT '更新时间',
  `updatetime` int(10) NOT NULL COMMENT '更新时间',
  `comments` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '评论数量',
  `avgsort` decimal(10, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '平均点评分数',
  `displayorder` int(10) NULL DEFAULT 0 COMMENT '排序值',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位类型',
  `experience` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工作经验',
  `requirement` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学历要求',
  `num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '招聘人数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`, `updatetime`) USING BTREE,
  INDEX `link_id`(`link_id`) USING BTREE,
  INDEX `comments`(`comments`) USING BTREE,
  INDEX `avgsort`(`avgsort`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `updatetime`(`updatetime`) USING BTREE,
  INDEX `hits`(`hits`) USING BTREE,
  INDEX `displayorder`(`displayorder`, `updatetime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内容主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_join_data_0
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_join_data_0`;
CREATE TABLE `dr_1_join_data_0`  (
  `id` int(10) UNSIGNED NOT NULL,
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` smallint(5) UNSIGNED NOT NULL COMMENT '栏目id',
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内容附表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_join_draft
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_join_draft`;
CREATE TABLE `dr_1_join_draft`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cid` int(10) UNSIGNED NOT NULL COMMENT '内容id',
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '具体内容',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内容草稿表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_join_flag
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_join_flag`;
CREATE TABLE `dr_1_join_flag`  (
  `flag` tinyint(2) UNSIGNED NOT NULL DEFAULT 1 COMMENT '文档标记id',
  `id` int(10) UNSIGNED NOT NULL COMMENT '文档内容id',
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  INDEX `flag`(`flag`, `id`, `uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '标记表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for dr_1_join_hits
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_join_hits`;
CREATE TABLE `dr_1_join_hits`  (
  `id` int(10) UNSIGNED NOT NULL COMMENT '文章id',
  `hits` int(10) UNSIGNED NOT NULL COMMENT '总点击数',
  `day_hits` int(10) UNSIGNED NOT NULL COMMENT '本日点击',
  `week_hits` int(10) UNSIGNED NOT NULL COMMENT '本周点击',
  `month_hits` int(10) UNSIGNED NOT NULL COMMENT '本月点击',
  `year_hits` int(10) UNSIGNED NOT NULL COMMENT '年点击量',
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `day_hits`(`day_hits`) USING BTREE,
  INDEX `week_hits`(`week_hits`) USING BTREE,
  INDEX `month_hits`(`month_hits`) USING BTREE,
  INDEX `year_hits`(`year_hits`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '时段点击量统计' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for dr_1_join_index
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_join_index`;
CREATE TABLE `dr_1_join_index`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内容索引表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for dr_1_join_recycle
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_join_recycle`;
CREATE TABLE `dr_1_join_recycle`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cid` int(10) UNSIGNED NOT NULL COMMENT '内容id',
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) UNSIGNED NOT NULL COMMENT '栏目id',
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '具体内容',
  `result` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '删除理由',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内容回收站表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_join_search
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_join_search`;
CREATE TABLE `dr_1_join_search`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `params` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '参数数组',
  `keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关键字',
  `contentid` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id集合',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '搜索时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `keyword`(`keyword`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '搜索表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_join_time
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_join_time`;
CREATE TABLE `dr_1_join_time`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '具体内容',
  `result` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '处理结果',
  `posttime` int(10) UNSIGNED NOT NULL COMMENT '定时发布时间',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `posttime`(`posttime`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内容定时发布表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_join_verify
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_join_verify`;
CREATE TABLE `dr_1_join_verify`  (
  `id` int(10) UNSIGNED NOT NULL,
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `isnew` tinyint(1) UNSIGNED NOT NULL COMMENT '是否新增',
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '具体内容',
  `backuid` mediumint(8) UNSIGNED NOT NULL COMMENT '操作人uid',
  `backinfo` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作退回信息',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '录入时间',
  `vid` int(10) NULL DEFAULT NULL,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE,
  INDEX `backuid`(`backuid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内容审核表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_navigator
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_navigator`;
CREATE TABLE `dr_1_navigator`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` smallint(5) UNSIGNED NOT NULL COMMENT '上级id',
  `pids` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '所有上级id数据项',
  `type` tinyint(1) UNSIGNED NOT NULL COMMENT '导航类型',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '导航名称',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'seo标题',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '导航地址',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片标示',
  `show` tinyint(1) UNSIGNED NOT NULL COMMENT '显示',
  `mark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型标示',
  `extend` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '是否继承下级',
  `child` tinyint(1) UNSIGNED NOT NULL COMMENT '是否有下级',
  `childids` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '所有下级数据项',
  `target` tinyint(1) UNSIGNED NOT NULL COMMENT '是否站外链接',
  `displayorder` smallint(5) NOT NULL COMMENT '显示顺序',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `list`(`id`, `type`, `show`, `displayorder`) USING BTREE,
  INDEX `mark`(`mark`) USING BTREE,
  INDEX `extend`(`extend`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '网站自定义链接表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dr_1_navigator
-- ----------------------------
INSERT INTO `dr_1_navigator` VALUES (1, 0, '0', 0, '友情链接', '友情链接', '1', '', 1, 'active', 0, 1, '1,2', 1, 0);
INSERT INTO `dr_1_navigator` VALUES (2, 1, '0,1', 0, '百度', '百度', 'http://www.baidu.com', '', 1, 'baidu', 0, 0, '2', 1, 0);
INSERT INTO `dr_1_navigator` VALUES (3, 0, '0', 0, '旗下公司', '旗下公司', '1', '', 1, 'qixia', 0, 1, '3,4,5', 1, 0);
INSERT INTO `dr_1_navigator` VALUES (4, 3, '0,3', 0, '百度一', '百度一', 'http://www.baidu.com', '', 1, 'baidu1', 0, 0, '4', 1, 0);
INSERT INTO `dr_1_navigator` VALUES (5, 3, '0,3', 0, '百度二', '百度二', 'http://www.baidu.com', '', 1, 'baidu2', 0, 0, '5', 1, 0);

-- ----------------------------
-- Table structure for dr_1_news
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_news`;
CREATE TABLE `dr_1_news`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) UNSIGNED NOT NULL COMMENT '栏目id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主题',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩略图',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键字',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
  `hits` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '浏览数',
  `uid` int(10) UNSIGNED NOT NULL COMMENT '作者id',
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者名称',
  `status` tinyint(2) NOT NULL COMMENT '状态',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `link_id` int(10) NOT NULL DEFAULT 0 COMMENT '同步id',
  `tableid` smallint(5) UNSIGNED NOT NULL COMMENT '附表id',
  `inputip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) NOT NULL COMMENT '更新时间',
  `updatetime` int(10) NOT NULL COMMENT '更新时间',
  `comments` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '评论数量',
  `avgsort` decimal(10, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '平均点评分数',
  `displayorder` int(10) NULL DEFAULT 0 COMMENT '排序值',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`, `updatetime`) USING BTREE,
  INDEX `link_id`(`link_id`) USING BTREE,
  INDEX `comments`(`comments`) USING BTREE,
  INDEX `avgsort`(`avgsort`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `updatetime`(`updatetime`) USING BTREE,
  INDEX `hits`(`hits`) USING BTREE,
  INDEX `displayorder`(`displayorder`, `updatetime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 127 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内容主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dr_1_news
-- ----------------------------
INSERT INTO `dr_1_news` VALUES (89, 56, '广州市花木公司党务公开制度', '279', '广州市花木公司党务公开制度', '广州市花木公司党务公开制度', 1, 1, 'admin', 9, '/index.php?c=show&id=89', 0, 0, '10.50.0.40', 1594376569, 1594445770, 0, 0.00, 0);
INSERT INTO `dr_1_news` VALUES (88, 56, '广州市花木公司党支部“三会一课”制度', '280', '广州市花木公司党支部“三会一课”制度', '广州市花木公司党支部“三会一课”制度', 1, 1, 'admin', 9, '/index.php?c=show&id=88', 0, 0, '10.50.0.40', 1594376546, 1594445782, 0, 0.00, 0);
INSERT INTO `dr_1_news` VALUES (87, 56, '花木公司“三重一大”事项决策实施细则', '278', '花木公司“三重一大”事项决策实施细则', '花木公司“三重一大”事项决策实施细则', 1, 1, 'admin', 9, '/index.php?c=show&id=87', 0, 0, '10.50.0.40', 1594376491, 1594445756, 0, 0.00, 0);
INSERT INTO `dr_1_news` VALUES (86, 56, '广州市花木公司内部审计工作暂行规定', '281', '广州市花木公司内部审计工作暂行规定', '广州市花木公司内部审计工作暂行规定', 1, 1, 'admin', 9, '/index.php?c=show&id=86', 0, 0, '10.50.0.40', 1594376421, 1594445794, 0, 0.00, 0);
INSERT INTO `dr_1_news` VALUES (85, 56, ' 广州市花木公司管理干部出国（境）请假及证照管理规定', '282', ' 广州市花木公司管理干部出国（境）请假及证照管理规定', '广州市花木公司管理干部出国（境）请假及证照管理规定', 1, 1, 'admin', 9, '/index.php?c=show&id=85', 0, 0, '10.50.0.40', 1594376402, 1594445815, 0, 0.00, 0);
INSERT INTO `dr_1_news` VALUES (84, 56, '广州市花木公司廉政谈话制度', '283', '广州市花木公司廉政谈话制度', '广州市花木公司廉政谈话制度', 1, 1, 'admin', 9, '/index.php?c=show&id=84', 0, 0, '10.50.0.40', 1594376351, 1594445839, 0, 0.00, 0);
INSERT INTO `dr_1_news` VALUES (82, 56, '广州市花木公司员工奖惩制度', '285', '广州市花木公司员工奖惩制度', '广州市花木公司员工奖惩制度', 1, 1, 'admin', 9, '/index.php?c=show&id=82', 0, 0, '10.50.0.40', 1594376170, 1594445879, 0, 0.00, 0);
INSERT INTO `dr_1_news` VALUES (83, 56, '广州市花木公司招聘管理制度', '284', '广州市花木公司招聘管理制度', '广州市花木公司招聘管理制度', 1, 1, 'admin', 9, '/index.php?c=show&id=83', 0, 0, '10.50.0.40', 1594376321, 1594445867, 0, 0.00, 0);
INSERT INTO `dr_1_news` VALUES (81, 53, '开展绿化工程档案管理内部培训', '273', '开展绿化工程档案管理内部培训', '开展绿化工程档案管理内部培训', 1, 1, 'admin', 9, '/index.php?c=show&id=81', 0, 0, '10.50.0.40', 1594375914, 1594445645, 0, 0.00, 0);
INSERT INTO `dr_1_news` VALUES (79, 53, '公司召开2017年党风廉政建设工作会议', '275', '公司召开2017年党风廉政建设工作会议', '公司召开2017年党风廉政建设工作会议', 1, 1, 'admin', 9, '/index.php?c=show&id=79', 0, 0, '10.50.0.40', 1594375868, 1594445710, 0, 0.00, 0);
INSERT INTO `dr_1_news` VALUES (80, 53, '开展园建工程的设计与施工内部培训', '274', '开展园建工程的设计与施工内部培训', '开展园建工程的设计与施工内部培训', 1, 1, 'admin', 9, '/index.php?c=show&id=80', 0, 0, '10.50.0.40', 1594375882, 1594445695, 0, 0.00, 0);
INSERT INTO `dr_1_news` VALUES (78, 53, '公司两委换届选举党员大会顺利召开', '276', '公司两委换届选举党员大会顺利召开', '公司两委换届选举党员大会顺利召开', 1, 1, 'admin', 9, '/index.php?c=show&id=78', 0, 0, '10.50.0.40', 1594375847, 1594445722, 0, 0.00, 0);
INSERT INTO `dr_1_news` VALUES (77, 53, '公司开展公开招聘新员工', '277', '公司开展公开招聘新员工', '公司开展公开招聘新员工', 1, 1, 'admin', 9, '/index.php?c=show&id=77', 0, 0, '10.50.0.40', 1594375829, 1594445736, 0, 0.00, 0);
INSERT INTO `dr_1_news` VALUES (76, 53, '公司开展2016年度先进工作者表彰工作', '272', '公司开展2016年度先进工作者表彰工作', '公司开展2016年度先进工作者表彰工作', 1, 1, 'admin', 9, '/index.php?c=show&id=76', 0, 0, '10.50.0.40', 1594375795, 1594445624, 0, 0.00, 0);
INSERT INTO `dr_1_news` VALUES (75, 53, '公司党委组织全体中层干部学习“两会”精神', '271', '公司党委组织全体中层干部学习“两会”精神', '公司党委组织全体中层干部学习“两会”精神', 1, 1, 'admin', 9, '/index.php?c=show&id=75', 0, 0, '10.50.0.40', 1594375775, 1594445612, 0, 0.00, 0);
INSERT INTO `dr_1_news` VALUES (74, 53, '公司安排2017年春节期间作风建设和廉洁自律工作', '270', '公司安排2017年春节期间作风建设和廉洁自律工作', '公司安排2017年春节期间作风建设和廉洁自律工作', 1, 1, 'admin', 9, '/index.php?c=show&id=74', 0, 0, '10.50.0.40', 1594375753, 1594445578, 0, 0.00, 0);
INSERT INTO `dr_1_news` VALUES (71, 54, '广州市花木公司党风廉政建设责任制考评表（2017年度）广州市花木公司党风廉政建设责任制考评表（2017年度）', '268', '广州市花木公司党风廉政建设责任制考评表（2017年度）', '广州市花木公司党风廉政建设责任制考评表（2017年度）', 1, 1, 'admin', 9, '/index.php?c=show&id=71', 0, 0, '10.50.0.40', 1594375027, 1594445387, 0, 0.00, 0);
INSERT INTO `dr_1_news` VALUES (73, 55, '关于公司领导成员党风廉政建设责任制分工情况的通知', '269', '关于公司领导成员党风廉政建设责任制分工情况的通知', '关于公司领导成员党风廉政建设责任制分工情况的通知', 1, 1, 'admin', 9, '/index.php?c=show&id=73', 0, 0, '10.50.0.40', 1594375392, 1594445476, 0, 0.00, 0);
INSERT INTO `dr_1_news` VALUES (116, 64, '销售采购', '247', '销售采购', '销售采购', 1, 1, 'admin', 9, '/index.php?c=show&id=116', 0, 0, '10.50.0.40', 1594440166, 1594442480, 0, 0.00, 0);
INSERT INTO `dr_1_news` VALUES (117, 70, '招聘信息', '248', '招聘信息', '招聘信息', 1, 1, 'admin', 9, '/index.php?c=show&id=117', 0, 0, '10.50.0.40', 1594443661, 1594443720, 0, 0.00, 0);
INSERT INTO `dr_1_news` VALUES (118, 68, '人才理念', '249', '人才理念', '人才理念', 1, 1, 'admin', 9, '/index.php?c=show&id=118', 0, 0, '10.50.0.40', 1594443722, 1594443784, 0, 0.00, 0);
INSERT INTO `dr_1_news` VALUES (119, 69, '组织公司全体职工参观学习', '260', '组织公司全体职工参观学习', '组织公司全体职工参观学习', 1, 1, 'admin', 9, '/index.php?c=show&id=119', 0, 0, '10.50.0.40', 1594443786, 1594444490, 0, 0.00, 0);
INSERT INTO `dr_1_news` VALUES (120, 69, '公司工会前往施工一线慰问职工', '261', '公司工会前往施工一线慰问职工', '公司工会前往施工一线慰问职工', 1, 1, 'admin', 9, '/index.php?c=show&id=120', 0, 0, '10.50.0.40', 1594444250, 1594444528, 0, 0.00, 0);
INSERT INTO `dr_1_news` VALUES (121, 69, '参加无偿献血活动', '252', '参加无偿献血活动', '参加无偿献血活动', 1, 1, 'admin', 9, '/index.php?c=show&id=121', 0, 0, '10.50.0.40', 1594444272, 1594444599, 0, 0.00, 0);
INSERT INTO `dr_1_news` VALUES (122, 69, '参加市林业和园林局职工乒乓参加市林业和园林局职工乒乓球比赛球比赛', '254', '参加市林业和园林局职工乒乓球比赛', '参加市林业和园林局职工乒乓球比赛', 1, 1, 'admin', 9, '/index.php?c=show&id=122', 0, 0, '10.50.0.40', 1594444321, 1594444616, 0, 0.00, 0);
INSERT INTO `dr_1_news` VALUES (123, 69, '参加市林业和园林局系统“两学一做”学习教育文艺汇报', '266', '参加市林业和园林局系统“两学一做”学习教育文艺汇报', '参加市林业和园林局系统“两学一做”学习教育文艺汇报', 1, 1, 'admin', 9, '/index.php?c=show&id=123', 0, 0, '10.50.0.40', 1594444348, 1594444684, 0, 0.00, 0);
INSERT INTO `dr_1_news` VALUES (124, 69, ' 参加白云山“郑仙诞—云山鳌头杯拔河比赛”', '265', ' 参加白云山“郑仙诞—云山鳌头杯拔河比赛”', '参加白云山“郑仙诞—云山鳌头杯拔河比赛”', 1, 1, 'admin', 9, '/index.php?c=show&id=124', 0, 0, '10.50.0.40', 1594444369, 1594444646, 0, 0.00, 0);
INSERT INTO `dr_1_news` VALUES (125, 69, '参加2016年广州市塑质地掷球锦标赛', '263', '参加2016年广州市塑质地掷球锦标赛', '参加2016年广州市塑质地掷球锦标赛', 1, 1, 'admin', 9, '/index.php?c=show&id=125', 0, 0, '10.50.0.40', 1594444394, 1594444578, 0, 0.00, 0);
INSERT INTO `dr_1_news` VALUES (126, 69, '参加“中国梦 劳动美”市林业和园林局庆“五一”职工岗位技能竞赛活动', '262', '参加“中国梦 劳动美”市林业和园林局庆“五一”职工岗位技能竞赛活动', '参加“中国梦 劳动美”市林业和园林局庆“五一”职工岗位技能竞赛活动', 1, 1, 'admin', 9, '/index.php?c=show&id=126', 0, 0, '10.50.0.40', 1594444412, 1594444735, 0, 0.00, 0);

-- ----------------------------
-- Table structure for dr_1_news_category
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_news_category`;
CREATE TABLE `dr_1_news_category`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级id',
  `pids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所有上级id',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '栏目名称',
  `dirname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '上级目录',
  `child` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否有下级',
  `childids` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '下级所有id',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '栏目图片',
  `show` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否显示',
  `setting` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性配置',
  `displayorder` mediumint(8) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `show`(`show`) USING BTREE,
  INDEX `module`(`pid`, `displayorder`, `id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '栏目表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_news_category_data
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_news_category_data`;
CREATE TABLE `dr_1_news_category_data`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` int(3) UNSIGNED NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '栏目模型表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for dr_1_news_category_data_0
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_news_category_data_0`;
CREATE TABLE `dr_1_news_category_data_0`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '栏目模型表的附表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for dr_1_news_comment
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_news_comment`;
CREATE TABLE `dr_1_news_comment`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `cid` int(10) UNSIGNED NOT NULL COMMENT '关联id',
  `cuid` int(10) UNSIGNED NOT NULL COMMENT '关联uid',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `orderid` bigint(18) UNSIGNED NOT NULL COMMENT '订单id',
  `uid` mediumint(8) UNSIGNED NULL DEFAULT 0 COMMENT '评论者ID',
  `author` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论者账号',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '评论内容',
  `support` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '支持数',
  `oppose` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '反对数',
  `avgsort` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '平均分',
  `sort1` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort2` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort3` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort4` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort5` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort6` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort7` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort8` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort9` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `reply` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '回复id',
  `in_reply` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否存在回复',
  `status` smallint(1) UNSIGNED NULL DEFAULT 0 COMMENT '审核状态',
  `inputip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '录入时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `orderid`(`orderid`) USING BTREE,
  INDEX `reply`(`reply`) USING BTREE,
  INDEX `support`(`support`) USING BTREE,
  INDEX `oppose`(`oppose`) USING BTREE,
  INDEX `avgsort`(`avgsort`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `aa`(`cid`, `status`, `inputtime`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '评论内容表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_news_comment_index
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_news_comment_index`;
CREATE TABLE `dr_1_news_comment_index`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) UNSIGNED NOT NULL COMMENT '内容id',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `support` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '支持数',
  `oppose` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '反对数',
  `comments` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '评论数',
  `avgsort` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '平均分',
  `sort1` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort2` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort3` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort4` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort5` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort6` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort7` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort8` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort9` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `tableid` smallint(5) UNSIGNED NULL DEFAULT 0 COMMENT '附表id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `support`(`support`) USING BTREE,
  INDEX `oppose`(`oppose`) USING BTREE,
  INDEX `comments`(`comments`) USING BTREE,
  INDEX `avgsort`(`avgsort`) USING BTREE,
  INDEX `tableid`(`tableid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '评论索引表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for dr_1_news_data_0
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_news_data_0`;
CREATE TABLE `dr_1_news_data_0`  (
  `id` int(10) UNSIGNED NOT NULL,
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` smallint(5) UNSIGNED NOT NULL COMMENT '栏目id',
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内容附表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dr_1_news_data_0
-- ----------------------------
INSERT INTO `dr_1_news_data_0` VALUES (71, 1, 54, '&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; text-indent: 0em; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-align: center;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;广州市花木公司党风&lt;/span&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; line-height: 2em; text-indent: 2em;&quot;&gt;廉政建设责任书&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; line-height: 2em; text-indent: 2em;&quot;&gt;二O一七年一月&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; text-indent: 0em; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-align: center;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;广州市花木公司党风廉政建设责任书&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;为进一步加强公司党风廉政建设，认真贯彻落实中共中央、国务院颁布实施的《关于实行党风廉政建设责任制的规定》，根据公司《广州市花木公司党风廉政建设责任制实施办法》及其《考核工作实施细则》的要求，明确各级领导干部对党风廉政建设中应负的责任，特订立本责任书。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;一、责任范围&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（一）公司党政领导班子对职责范围内的党风廉政建设负全面领导责任。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（二）领导班子的正职对公司党风廉政建设负总责。对公司党政领导班子成员及分管基层单位、科室（部门）的领导班子和领导干部的党风廉政建设负直接领导责任。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（三）领导班子其他成员对分管基层单位、科室（部门）的领导班子和领导干部的党风廉政建设负直接领导责任。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（四）科室及基层单位主要负责人对本科室和单位的党风廉政建设负直接领导责任。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;二、责任目标&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（一）认真贯彻落实中共中央、国务院关于廉政建设的部署和要求，执行《党风廉政建设责任制的实施办法》，做到党风廉政建设同经济工作和其它业务工作统一部署，一起检查、一起落实、一起考核。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（二）科室和基层单位主要负责人以身作则，带头廉政自律，本人没有因违纪违法而受到党纪政纪处分。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（三）能经常组织本单位或本科室（部门）党员、干部开展党性党风党纪和廉洁从政教育，学习党风廉政建设理论和法规制度，并能按公司党委、纪委的统一部署，抓好党风廉政建设各项工作的落实。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; line-height: 2em; text-indent: 2em;&quot;&gt;（四）认真落实公司和本单位、科室（部门）制定的各项廉政制度，防范工作成效明显，科室内或本单位人员中没有发生以权谋私、权钱交易和违反财务制度等违纪违法行为。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（五）每半年对党风廉政建设工作进行自查自纠，针对本单位党性党风和廉政方面存在的突出问题及时整改，做到群众满意。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（六）加强对重大事项的监督、监察，依法支持执纪执法机关履行职责，认真协助查办信访举报线索和违纪违法案件。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;三、责任考核和奖惩&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（一）考核依据：中共中央、国务院颁布的《关于实行党风廉政建设责任制的规定》和公司《党风廉政建设责任考核评分标准》（附后）。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（二）考核办法：科室和基层单位党风廉政建设工作的考核，采取自查和公司检查的办法，年终由公司党风廉政建设工作考核小组进行考核。对考核不及格或出现《关于实行党风廉政建设责任制的规定》第十九条情况之一的，视情节轻重，给予相应的处理和追究。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（三）考核等次：按优秀、达标、基本达标、不达标四个等级考核。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;1、优秀等级（90分及以上）。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;2、达标等级（85-89分以上）。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;3、基本达标等级（75-84分）。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;4、不达标等级（75分以下）：将由公司党委或分管领导对责任人进行诫免谈话，责令限期改正；对主管或分管范围内发生严重违纪违法行为的，除按《实施办法》第十九条规定追究当事人责任外，不得参与本年度公司评先和提拔晋升。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;四、责任时间&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;本责任书一式二份，公司党委和各科室、各基层各执一份，有效期自签订之日起至2017年12月31日止。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;考核单位：广州市花木公司 &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;公司负责人： &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;责任单位：&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;直接领导责任人： &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;责任人： &amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;二O一七年一月&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; text-indent: 0em; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;广州市花木公司党风廉政建设责任制考评表&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; text-indent: 0em; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;责任科室： &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;2017年1月&lt;/span&gt;&lt;/p&gt;&lt;table width=&quot;720&quot; class=&quot;ueditorTableStyle&quot;&gt;&lt;tbody&gt;&lt;tr class=&quot;firstRow&quot;&gt;&lt;td width=&quot;72&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;主要内容&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;427&quot; valign=&quot;center&quot; colspan=&quot;5&quot; style=&quot;margin: 0px; padding: 0px 7px; border-left: 0px none rgb(0, 0, 0); border-top-color: rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;量 &amp;nbsp;&amp;nbsp;化 &amp;nbsp;&amp;nbsp;项 &amp;nbsp;&amp;nbsp;目&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;72&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-left: 0px none rgb(0, 0, 0); border-top-color: rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;科室自评&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;77&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-left: 0px none rgb(0, 0, 0); border-top-color: rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;纪委考核&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;71&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-left: 0px none rgb(0, 0, 0); border-top-color: rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;党委考核&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr style=&quot;break-inside: avoid;&quot;&gt;&lt;td width=&quot;72&quot; valign=&quot;center&quot; rowspan=&quot;3&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); border-left-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;工作部署&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 2em; text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（20分）&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;427&quot; valign=&quot;center&quot; colspan=&quot;5&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;将党风廉政建设纳入科内年度工作中，做到同部署、同检查、同总结（10分）&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;72&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;77&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;71&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr style=&quot;break-inside: avoid;&quot;&gt;&lt;td width=&quot;427&quot; valign=&quot;center&quot; colspan=&quot;5&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;科内负责人和工作人员能按党风廉政建设责任制分工分别抓好落实（5分）&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;72&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;77&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;71&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr style=&quot;break-inside: avoid;&quot;&gt;&lt;td width=&quot;427&quot; valign=&quot;center&quot; colspan=&quot;5&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;科室负责人能按要求每半年向分管领导汇报“一岗双责”落实情况（5分）&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;72&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;77&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;71&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr style=&quot;break-inside: avoid;&quot;&gt;&lt;td width=&quot;72&quot; valign=&quot;center&quot; rowspan=&quot;3&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); border-left-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;宣传教育&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 2em; text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（20分）&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;427&quot; valign=&quot;center&quot; colspan=&quot;5&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;学习教育有创新、有实效（5分）&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;72&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;77&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;71&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr style=&quot;break-inside: avoid;&quot;&gt;&lt;td width=&quot;427&quot; valign=&quot;center&quot; colspan=&quot;5&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;能积极开展反腐倡廉大宣教格局，认真开展纪律教育学习月活动，有计划地组织干部职工学习廉政法规文件，加强党纪国法教育、廉政法规教育和从政从业道德教育。（8分）&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;72&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;77&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;71&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr style=&quot;break-inside: avoid;&quot;&gt;&lt;td width=&quot;427&quot; valign=&quot;center&quot; colspan=&quot;5&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;能对科内潜在的问题和风险开展内部分析教育，制定整改措施并落实（7分）&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;72&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;77&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;71&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr style=&quot;height: 33px; break-inside: avoid;&quot;&gt;&lt;td width=&quot;72&quot; valign=&quot;center&quot; rowspan=&quot;3&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); border-left-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;制度建设&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 2em; text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（20分）&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;427&quot; valign=&quot;center&quot; colspan=&quot;5&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;科室各项工作制度健全规范（5分）&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;72&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;77&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;71&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr style=&quot;break-inside: avoid;&quot;&gt;&lt;td width=&quot;427&quot; valign=&quot;center&quot; colspan=&quot;5&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;科室成员廉洁自律，模范执行公司规章制度和各项廉政制度，没有发生违法违纪行为，没有受到公司领导班子和分管领导批评（7分）&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;72&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;77&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;71&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr style=&quot;height: 30px; break-inside: avoid;&quot;&gt;&lt;td width=&quot;427&quot; valign=&quot;center&quot; colspan=&quot;5&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;科内重大业务工作能做到有立项、有跟踪、有成效（8分）&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;72&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;77&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;71&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr style=&quot;height: 29px; break-inside: avoid;&quot;&gt;&lt;td width=&quot;72&quot; valign=&quot;center&quot; rowspan=&quot;5&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); border-left-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;作风建设&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 2em; text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（30分）&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;427&quot; valign=&quot;center&quot; colspan=&quot;5&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;党组织生活会、科务会、中心组学习和科室学习制度能落实好（5分）&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;72&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;77&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;71&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr style=&quot;height: 31px; break-inside: avoid;&quot;&gt;&lt;td width=&quot;427&quot; valign=&quot;center&quot; colspan=&quot;5&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;科室氛围好，廉洁自律，民主作风好，团结和谐（6分）&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;72&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;77&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;71&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr style=&quot;break-inside: avoid;&quot;&gt;&lt;td width=&quot;427&quot; valign=&quot;center&quot; colspan=&quot;5&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;自觉维护公司的良好风气，自觉遵守公司的各项规章制度和劳动纪律，模范带头作用好（6分）&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;72&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;77&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;71&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr style=&quot;height: 29px; break-inside: avoid;&quot;&gt;&lt;td width=&quot;427&quot; valign=&quot;center&quot; colspan=&quot;5&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;能经常深入业务点密切联系群众，工作深入扎实（8分）&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;72&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;77&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;71&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr style=&quot;height: 30px; break-inside: avoid;&quot;&gt;&lt;td width=&quot;427&quot; valign=&quot;center&quot; colspan=&quot;5&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;落实司（科）务公开制度，办事公开透明（5分）&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;72&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;77&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;71&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr style=&quot;height: 31px; break-inside: avoid;&quot;&gt;&lt;td width=&quot;72&quot; valign=&quot;center&quot; rowspan=&quot;4&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); border-left-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;其他工作&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 2em; text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（10分）&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;427&quot; valign=&quot;center&quot; colspan=&quot;5&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;积极协助上级开展审计、询问、巡查等相关工作（2分）&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;72&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;77&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;71&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr style=&quot;height: 30px; break-inside: avoid;&quot;&gt;&lt;td width=&quot;427&quot; valign=&quot;center&quot; colspan=&quot;5&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;及时对相关问题和检查意见开展整改并回复（3分）&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;72&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;77&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;71&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr style=&quot;height: 30px; break-inside: avoid;&quot;&gt;&lt;td width=&quot;427&quot; valign=&quot;center&quot; colspan=&quot;5&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;科内没有发生违规违纪问题的属实投诉（2分）&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;72&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;77&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;71&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr style=&quot;height: 30px; break-inside: avoid;&quot;&gt;&lt;td width=&quot;427&quot; valign=&quot;center&quot; colspan=&quot;5&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;能妥善做好化解与本科室有关的各类矛盾工作（3分）&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;72&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;77&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;71&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr style=&quot;height: 30px; break-inside: avoid;&quot;&gt;&lt;td width=&quot;499&quot; valign=&quot;center&quot; colspan=&quot;6&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); border-left-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;合 &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;计&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;72&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;77&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;71&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr style=&quot;height: 31px; break-inside: avoid;&quot;&gt;&lt;td width=&quot;271&quot; valign=&quot;center&quot; colspan=&quot;3&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); border-left-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;综合评定党风廉政建设状况&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;48&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: windowtext; border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;评分&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;108&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: windowtext; border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;72&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;等级&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;221&quot; valign=&quot;center&quot; colspan=&quot;3&quot; style=&quot;margin: 0px; padding: 0px 7px; border-left: 0px none rgb(0, 0, 0); border-top-color: rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr style=&quot;height: 120px; break-inside: avoid;&quot;&gt;&lt;td width=&quot;127&quot; valign=&quot;center&quot; colspan=&quot;2&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-right-color: windowtext; border-bottom-color: rgb(0, 0, 0); border-left-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 2em; text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 2em; text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;说&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 2em; text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;明&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 2em; text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;593&quot; valign=&quot;center&quot; colspan=&quot;7&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;1、对“科室自评、纪委考评、党委考评”从工作部署、宣传教育、制度建设、作风建设、其他工作等五个主要方面进行量化打分；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 2em; text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;2、综合评定时，科室自评占20%、公司纪委考评占30%、党委考评占50%。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 2em; text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;3、综合评定分为四个等级：即优秀、达标、基本达标、不达标。其中：优秀90分以上、达标85-89分、基本达标75-84分以上、不达标75分以下或有一起严重的违规违纪问题。&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; text-indent: 0em; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; text-indent: 0em; white-space: normal; background-color: rgb(245, 245, 245);&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES (73, 1, 55, '&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; text-indent: 0em; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-align: center;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;关于调整公司领导班子成员党风廉政建设责任制分工的通知&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;公司各科室（部门）：&lt;br/&gt;　　按照党风廉政建设责任制的总体要求，经公司党委研究，并结合公司领导分工情况，2017年公司领导班子成员党风廉政建设责任制作如下分工：&lt;br/&gt;　　党委书记黄乃聪同志：对公司党风廉政建设工作负总责。具体负责公司领导班子成员、公司各党支部书记和公司政工科、团总支等部门的党风廉政建设工作。&lt;br/&gt;　　经理康毅全同志：负责公司财务科、业务科、物业经营科、广州汇景园林工程有限公司的廉洁从政工作。&lt;br/&gt;　　副经理黄国涛同志：负责园林科、保养部、产业开发部、广州市逸兴农业发展有限公司的党风廉政建设工作。&lt;br/&gt;　　总工程师房晓峰同志：负责总工室、工程科、设计部、保卫科、广州市得景园林工程公司、广州市粤卉园林公司的党风廉政建设工作。&lt;br/&gt;　　纪委书记周慧颖同志：协助党委书记抓好公司党风廉政建设工作。负责工会、办公室、纪检监察室的党风廉政建设工作。&lt;br/&gt;　　党风廉政建设责任制分工后，各责任人必须按照党风廉政建设责任制要求，切实担负起一岗双责，按照分工内容，认真抓好工作落实。各科室负责人，在抓好业务工作的同时，认真抓好本科室的党风廉政建设工作。&lt;br/&gt;　　特此通知。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;中共广州市花木公司委员会&lt;br/&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; 2017年3月1日&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES (74, 1, 53, '&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; text-indent: 0em; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-align: center;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;广州市花木公司安排2017年春节期间作风建设和廉洁自律工作&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;1月13日，为贯彻落实好国务院、中纪委关于做好2017年元旦春节期间有关工作的通知精神，切实加强2017年春节期间公司作风建设和廉洁自律工作，营造文明节俭、风清气正的节日气氛，广州市花木公司纪委书记周慧颖同志宣读了《关于加强2017年春节期间作风建设和廉洁自律工作的通知》，并着重强调了以下几点：一是加强教育，增强廉洁自律意识。二是严明纪律，严格执行各项规定。三是落实责任，切实加强监督管理。&lt;/span&gt;&lt;/p&gt;&lt;div&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/div&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES (75, 1, 53, '&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; text-indent: 0em; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-align: center;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;广州市花木公司党委组织全体中层干部学习“两会”精神&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;4月6日，花木公司党委组织全体中层干部集中学习了“两会”精神，并将资料下发至各个党支部，由各党支部书记组织全体党员学习领会“两会”精神。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES (76, 1, 53, '&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; text-indent: 0em; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-align: center;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;广州市花木公司开展2016年度先进工作者表彰工作&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;1月13日上午，广州市花木公司对2016年度先进工作人员进行表彰。会上，党委书记黄乃聪作了广州市花木公司关于表彰2016年度先进工作者、优秀新进员工的通报，希望受表彰的同志能珍惜荣誉，在新的一年里，继续奋发努力，取得更大的成绩。同时希望公司其他员工，以他们为榜样，脚踏实地的做好本职工作，勇于开拓创新，不断拼搏进取，为公司的可持续发展而努力奋斗。随后与局产业发展处处长申志强、公司经理康毅全一起为获得表彰的先进工作者颁发荣誉证书。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES (77, 1, 53, '&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; text-indent: 0em; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-align: center;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;广州市花木公司开展公开招聘新员工&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;3月27日，公司政工科组织了招聘温室花卉生产科研管理人员的笔试面试工作。四名来自华南农业大学的应届研究生参加了考试，公司领导及园林科负责人综合考量应聘人员的专业知识水平和综合素质能力，进行了严格筛选，为公司的科研和技术人员队伍的壮大储备新生力量。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES (78, 1, 53, '&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; text-indent: 0em; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-align: center;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&lt;strong&gt;中国共产党广州市花木公司两委换届选举党员大会顺利召开&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;中共广州市花木公司两委换届选举党员大会于2017年5月5日上午在公司大会议室召开，公司在职、退休83名党员参加了会议。会上，黄乃聪同志代表公司党委作《中国共产党广州市花木公司委员会工作报告》，周慧颖同志代表公司纪委作《中国共产党广州市花木公司纪律检查委员会工作报告》，黄国涛同志作《关于党费收缴使用情况报告》并宣读了《广州市花木公司党员大会选举办法》，全体党员依次举手表决，全体通过了上述各项《报告》及总监票人和监票人人选，房晓峰同志向全体党员介绍了新一届两委候选人简历。&lt;br/&gt;　　根据《选举办法》，大会选举产生了中共广州市花木公司新一届党委委员和纪委委员，会后，新一届党委委员、纪委委员第一次全体会议分别选举产生了新一届党委、纪委书记，黄乃聪同志当选为党委书记，周慧颖同志当选为纪委书记。公司全体党员干部职工将以更加饱满的热情、更加昂扬的斗志、更加务实的作风，在新一届党委的领导下，坚定信心，努力奋斗，为花木公司创造新的辉煌贡献力量！&lt;/span&gt;&lt;/p&gt;&lt;div&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/div&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES (79, 1, 53, '&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; text-indent: 0em; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-align: center;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;花木公司召开2017年党风廉政建设工作会议&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;2017年2月28日上午，花木公司召开2017年党风廉政建设工作会议，传达学习了中纪委十八届七次全会和市纪委十一届二次全会精神，公司各科室（部门）负责人向公司党委递交了2017年度党风廉政建设责任书，党委书记黄乃聪同志就如何做好今年公司党风廉政建设工作，提出了四点意见：一是要准确把握公司工作面临的形势任务，进一步增强推进党风廉政建设的责任感和紧迫感；二是要深入学习领会习近平总书记重要讲话精神，自觉用中央、省委和市委的决策部署统一思想和行动；三是要紧密结合公司实际，坚定不移推进党风廉政建设；四是要落实管党治党责任，推动全面从严治党向纵深发展。公司全体在职党员、中层以上干部以及财务、采购、物业管理、投标、工程管理等重点岗位人员近70人参加会议。（政工科&amp;nbsp; 黄煊）&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES (80, 1, 53, '&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; text-indent: 0em; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-align: center;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;开展园建工程的设计与施工内部培训&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;4月27日，公司政工科、工会联合举办了今年第二期内部培训，邀请工程科科长罗毅恒为员工做了“园建工程的设计与施工”专题讲座，从园路、平台、水池的设计与施工，亭廊构筑物的设计与施工，园林工程的施工质量和管理等三个方面进行授课，分享了自己在近年一线施工管理过程中累积的经验和心得，进一步加深了公司各科室对工程设计与施工的认识。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES (81, 1, 53, '&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; text-indent: 0em; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-align: center;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;开展绿化工程档案管理内部培训&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;3月29日，公司政工科、工会联合举办了一期内部培训，邀请工程科陈鸿斌为大家做了“绿化工程档案管理”专题讲座，从工程档案管理的意义、建设工程档案管理简介、绿化工程档案管理、档案管理在本企业的应用及建议等四个方面进行授课，分享了自己多年来的经验和心得，为公司下一步提高工程档案管理水平提供了理论基础和实践经验。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES (82, 1, 56, '&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; text-indent: 0em; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-align: center;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;广州市花木公司员工奖惩制度&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;第一章 总 则&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;一、根据《中华人民共和国劳动法》、《劳动合同法》及有关规定，为增强公司员工的主人翁责任感，鼓励工作积极性和创造性，维护正常的生产秩序和工作秩序，提高劳动生产率和工作效率，特制定本制度。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;二、公司员工必须遵守国家的政策、法律、法令，遵守劳动纪律，遵守企业的各项规章制度，爱护公共财产，学习和掌握本职工作所需要的文化技术业务知识和技能，团结协作，完成生产任务和工作任务。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;三、公司的奖惩制度，是把思想政治工作同经济手段结合起来。在奖励上，坚持精神鼓励和物质鼓励相结合，以精神鼓励为主的原则；对违反纪律的员工，遵循以思想教育为主、惩罚为辅的原则。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;第二章 工作纪律要求&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;一、员工应按规定时间上下班，不迟到，不早退，工作时间不得擅离职守。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;二、工作时间内，员工不得接待私人探访，如确有必要须报主管领导同意后到指定地点接待。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;三、员工使用电话时，说话须简洁明快，不要言辞不清或长时间占用电话。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;四、工作时间内，因公务外出，须向本部门负责人报告，如本部门负责人不在，则告知同科室人员。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;五、员工不得在工作时间内从事与工作无关的事项。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;六、员工不得在办公范围内出现大声喧哗，粗言秽语或打架等不良行为。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;七、员工应爱护公司设施、设备，如有破坏或挪用者视其情节轻重、损坏程度和价格大小予以索赔,情节严重的视情予以纪律处分或外移送司法部门处理。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;八、员工不得利用职权营私舞弊，假公济私。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;九、员工不得在公司范围内或工作时间内买卖私人物品。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;十、员工不得有损害公司财产、声誉、贪污受贿等行为，知情员工应立即上报。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;十一、员工不得违反公司保密规定，未经许可或授权，严禁将公司的商业秘密和内部资料泄露给公司以外的任何三方。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;十二、员工不得在工作时间内擅自进入其他员工工作区域逗留、窥探，翻看不属于自己岗位的资料。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;十三、员工不得随意拷贝、删除、篡改、泄露公司电脑资料和电脑软件。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;十四、办公场所应保持安静，接待公务应在指定的洽谈区进行。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;十五、不得以公司名义或利用公司资质从事谋取个人私利的行为。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;十六、员工必须服从工作安排，按时完成工作任务，不得无故拖延,拒绝或终止工作。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;十七、各科室、部门负责人对员工的考核应做到公平、公开和公正。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;第三章 奖励措施&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;一、对于有下列表现之一的员工，给予奖励：&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（一）忠于职守，积极负责，廉洁奉公，舍己为人，事迹突出的；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（二）维护财经纪律、抵制歪风邪气，事迹突出的；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（三）在改进公司经营管理，提高经济效益方面做出显著成绩的；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（四）在生产、技术、园林绿化、施工管理等方面，有发明、技术改进或者提出合理化建议被采纳，取得重大成果或者显著成绩的；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（五）保护公共财产，防止事故发生或者控制事态发展有功，使公司免受重大损失的；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（六）同坏人坏事作斗争，对维持正常的生产秩序和工作秩序、维持社会治安，有显著功绩的；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（七）在完成公司生产任务或者工作任务、提高产品质量或者服务质量做出显著成绩，受到上级通报表扬的；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（八）代表公司参加社会活动，成绩显著，为公司取得荣誉的。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;二、奖励标准&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;员工有上述表现之一者，经公司班子会议研究，给予通报表扬，并根据实际情况给与当月绩效奖励加分20-100分；如无绩效工资员工，则按照公司当月绩效工资分值与加分分数的乘积给予奖励。在年度考核中优先推选为优秀员工或先进员工。对员工的其他奖励，按照公司已有的各种奖励的评选办法执行。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;第四章 &amp;nbsp;员工违纪过失分类及处罚规定&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;一、员工违纪过失分类&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;员工违纪过失分为甲、乙、丙三类。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;(一)甲类过失。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;1．工作时间擅离职守；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;2．工作时间内未经同意接待私人探访；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;3．长时间因私占用工作电话；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;4．工作时间内从事与工作无关的事项；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;5．在办公范围内出现大声喧哗，粗言秽语或打架等不良行为；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;6．恶意中伤、诽谤、漫骂同事。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（二）乙类过失。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;1．损坏公司公用设施、设备但情节较轻的；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;2．擅自进入其他员工工作区域逗留、窥探，翻看不属于自己岗位的资料；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;3．随意拷贝、删除、篡改、泄露公司电脑资料和电脑软件；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;4．不服从工作安排，不按时完成工作任务，无故拖延、拒绝或终止工作；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;5. 正常工作日或其他已安排轮值工作的时间，职工不请假或请假未批准而缺勤或超过批准假期未回来工作的旷工行为。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（三）丙类过失。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;1．利用职权贪污受贿、营私舞弊,假公济私；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;2．盗窃或故意破坏公司财产、设施设备，恶意损害公司声誉；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;3．干扰公司正常工作秩序；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;4．违反公司保密规定，未经许可或授权,将公司的商业秘密和内部资料泄露给公司以外的任何第三方；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;5．以公司名义或利用公司资质从事谋取个人私利的行为。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;二、处罚程序&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（一）对员工的过失以教育批评为主；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（二）对员工的处罚，由员工所属部门、分管领导汇同政工科提出处罚意见，征询工会意见后，再报公司领导班子研究决定；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（三）对员工的处罚决定，应书面告知被处罚者及其所属部门，并记入其人事档案。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;三、处罚分类&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（一）员工犯甲类过失，经核实后，给予通报批评，视情节严重，给予本人当月绩效工资5-20分的扣分；如无绩效工资员工，则按照公司当月绩效工资分值与扣分分数的乘积进行相应处罚。员工犯甲类过失之一累计满三次，解除劳动关系。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（二）员工犯乙类过失第1-4点，经核实后，给予通报批评，视情节严重，给予本人当月绩效工资10-50分的扣分；如无绩效工资员工，则按照公司当月绩效工资分值与扣分分数的乘积进行相应处罚。若发放金额低于广州市最低工资标准的，则按最低标准发放。因员工过错造成公司直接经济损失的，员工还需承担相应的赔偿责任。员工犯乙类过失第1-4点累计满三次，解除劳动关系。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;员工犯乙类过失第5点，经核实后，给予通报批评。旷工期间的工资发放按照《广州市花木公司员工考勤请假制度》规定执行。员工连续旷工5天，或全年旷工累计满10天，解除劳动关系。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（三）员工犯丙类过失，经核实后，给予通报批评，并解除劳动关系，因员工过错造成公司直接经济损失的，员工需承担相应的赔偿责任。如发现有违纪违法行为，要按照有关规定移送纪检监察机构或司法部门处理。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;四、处罚申诉&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（一）被处罚员工接到书面处罚决定后，可以在十个工作日内向政工科提出书面申诉，也可以同时请求工会协助；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（二）政工科在接到书面申诉后，三个工作日内向公司领导报告并告知工会；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（三）政工科汇同工会进行复核调查，调查结果书面报告公司领导，公司领导班子审议结果为公司最终决定；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（四）政工科接到书面申诉材料后三十个工作日内将申诉复核结果书面告知申诉人。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（五）本规定适用公司所有在职员工（含试用期、见习期员工），自公布之日起执行，如以前相关制度有抵触的，以本制度为准。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES (83, 1, 56, '&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; text-indent: 0em; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-align: center;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&lt;strong&gt;广州市花木公司招聘管理制度&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;一、招聘目的&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;为合理配置人力资源，优化公司人员结构，加强人才队伍建设，规范人员招聘工作，建立公平竞争的用人机制，充分发挥人才市场的作用，更好地适应公司改革、发展和稳定的需求，结合公司实际情况，制定本制度。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;二、招聘原则&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;结合公司发展战略，遵循“工作需要”、“专业对口”、“质量优先”、“结构匹配”、“双向选择”的原则，以“公开、平等、竞争、择优”的方式开展招聘。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;三、招聘对象&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（一）应届毕业生。应届毕业生指全日制普通高等院校毕业生。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（二）社会人员。社会人员是指除应届毕业生以外的符合公司招聘条件的急需人才。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;四、招聘事宜&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（一）招聘计划。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;1、应届毕业生拟每两年开展一次对口招聘工作，根据其求职情况，一般安排在11-12月份和第二年的2-4月份；社会人员根据公司紧缺岗位状况及时启动招聘，不定时开展招聘工作。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;招收名额根据公司上年度离职或退休人员的岗位缺口进行配备，严格控制招收人数。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;2、每年10月公司政工科向各科室（部门）发放《公司招聘需求调查表》，摸查公司急需聘请的人才和应届毕业生的需求情况。公司政工科根据各科室（部门）反馈的情况进行汇总分析和综合平衡后，提出招聘计划和方案报公司领导班子审批。公司政工科根据经审批的招聘计划和方案及时启动招聘工作。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（二）招聘条件。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;1、遵纪守法，品行端正，具有良好的职业道德。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;2、应届毕业生：（1）全日制大、中专以上学历毕业生，其中，优先考虑公司业务发展需要的硕士研究生和重点院校毕业生；（2）所学专业与招聘专业相同或相近；（3）按时毕业，能提供学历和学位证书等相关招聘岗位要求的证明材料。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;3、社会人员：（1）符合公司招聘岗位基本要求；（2）年龄45周岁以下，大专以上学历，具备应聘岗位所需资格条件和实际工作能力。管理人员：具有3年以上相关工作经验或与公司资质、招投标需求相关专业中级以上专业技术资格；专业技术人员：具与公司资质、招投标需求相关专业中级/二级以上专业技术/执业资格。（3）能提供学历、学位、职称/技能/职业资格证书等相关招聘岗位要求的证明材料。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;4、符合计划生育政策规定。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;5、身体健康，入职体检结果正常。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（三）招聘程序。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;1、应届毕业生。实行笔试、面试的形式。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（1）通过校园招聘会、招聘网、学校推荐等途径收集毕业生简历，并对照招聘计划和本制度的招聘条件进行初审筛选。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（2）组织通过初审的应聘人员参加笔试。笔试不指定任何参考书和资料，将根据该岗位所需专业知识和实操技能拟制试卷，试卷由公司政工科联合公司相关用人部门拟制，经公司领导班子同意后实施。笔试采取闭卷考试，满分100分，合格分数线为60分。笔试成绩合格才具备面试资格。笔试成绩合格的考生，依笔试成绩由高到低的顺序，按招考岗位拟录用人数1：3的名额确定面试对象。招考岗位面试人数如达不到设定的比例，按实际符合面试条件的人数进行。笔试成绩及面试通知将于笔试结束后10个工作日内，由公司政工科电话通知考生。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（3）面试前对面试对象进行资格条件审查，面试人员须提供以下证件的原件：身份证、学历证书、学位证书，如有户口簿、毕业生就业推荐表、就业协议书（暂缓就业的毕业生提供暂缓就业协议书）、广东省教育厅学历认证中心出具的学历、学位鉴定证明、相关技能资格证书等招聘岗位要求的证明材料也一并提供。经审查，凡与报考条件不符的，或不能按时提供规定证明材料的，取消面试资格。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;应聘人员若尚未正式毕业或未取得学历、学位证书，其他条件符合招聘岗位要求的可报公司领导班子研究，经同意可到公司实习，待正式毕业或取得学历、学位证书后再进行资格审查和面试。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（4）通过资格审查的可参加面试。由公司面试评委小组进行面试，主要考察面试者的口头表达能力、综合分析能力及相关知识掌握的情况，面试内容由公司政工科联合公司相关用人部门拟制，经公司领导班子同意后实施。根据招聘岗位情况开展实操性考核。面试满分为100分，合格分数线为60分。面试结束后，面试评委小组将面试评分和统分结果报公司政工科汇总，公司政工科将汇总情况报公司领导班子研究确定拟聘人员。于笔试结束后10个工作日内，公司政工科将面试成绩和聘用结果电话通知拟聘人员，同时通知其于指定时间到指定医院进行体检。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（5）体检结果正常的人员确认为聘用人员，按公司《新进员工和实习生薪酬待遇标准》等相关规定办理入职手续，并按《新进人员到一线岗位实践锻炼工作制度》统一安排实践锻炼。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;2、社会人员。采取直接面试的形式，特殊岗位视情况增加笔试或实操环节。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（1）通过报刊、网络、推荐等途径发布招聘信息，并对照招聘计划和本制度的招聘条件进行初审筛选。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（2）对通过初审的应聘人员进行资格条件审查，应聘人员须同时提供以下证件的原件：身份证、户口簿、学历证书、学位证书及由广东省教育厅学历认证中心出具的学历、学位鉴定证明、计划生育证，以及相关职称/技能/职业资格证书等招聘岗位要求的证明材料。凡与报考条件不符的，或不能按时提供规定证明材料的，取消面试资格。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（3）组织通过初审的应聘人员参加面试。由公司面试评委小组进行面试，主要考察面试者的口头表达能力、综合分析能力、相关专业知识掌握情况及实操技能，面试内容由公司政工科联合公司相关用人部门拟制，经公司领导班子同意后实施。视岗位特殊情况开展笔试或实操性考核。面试结束后，面试评委小组将面试评分和统分结果报公司政工科汇总，公司政工科将汇总情况报公司领导班子研究确定拟聘人员。公司政工科于面试结束后10个工作日内，将面试成绩和聘用结果电话通知拟聘人员，同时通知其于指定时间到指定医院进行体检。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（4）体检结果正常的人员确认为聘用人员，按公司《新进员工和实习生薪酬待遇标准》等相关规定办理入职手续。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;五、领导小组&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;为加强对招聘工作的领导，公司成立面试评委工作领导小组：&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;组 &amp;nbsp;长：公司经理&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;副组长：党委书记&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;组 &amp;nbsp;员：领导班子成员、公司各科室（部门）负责人&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES (84, 1, 56, '&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; text-indent: 0em; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-align: center;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; line-height: 2em; text-indent: 2em;&quot;&gt;广州市花木公司廉政谈话制度&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;为进一步加强公司党风廉政建设工作，拟在公司内部实行三级廉政谈话，特制定本制度。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;一、谈话对象&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（一）公司党委书记每半年要与分管领导开展一次廉政谈话，各分管领导同时要向公司党委书记汇报“一岗双责”落实情况；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（二）班子成员每半年要与分管科室（部门）的科长、副科长开展一次廉政谈话，强调提醒工作中把好廉政关，各科负责人要向分管领导汇报“一岗双责”落实情况；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（三）各科室负责人每半年要与本科内人员进行一次廉政谈话，学习相关党纪法规，强调工作中易发生问题的地方，加强提醒教育。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;二、谈话内容&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（二）强调廉政责任，按照党风廉政建设主体责任的要求切实落实好“一岗双责”，做到业务工作和党风廉政建设同布置、同安排、同检查、同落实。加强学习，带头清正廉洁，落实领导责任，管好身边人。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（二）指出廉政风险，针对各自岗位职责和廉政风险，加强提醒教育，有群众反映的问题要及时提醒，做到抓早抓小。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;（三）督促认真履职，对工作表现、完成工作情况及今后要求提出意见或建议，强调按照党纪法规及公司规章制度执行。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;广州市花木公司党风廉政建设谈话记录表&lt;/span&gt;&lt;/p&gt;&lt;table width=&quot;636&quot; class=&quot;ueditorTableStyle&quot;&gt;&lt;tbody&gt;&lt;tr class=&quot;firstRow&quot; style=&quot;height: 40px;&quot;&gt;&lt;td width=&quot;138&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-color: windowtext; background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;谈话对象姓名&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;169&quot; valign=&quot;top&quot; style=&quot;margin: 0px; padding: 0px 7px; border-left: 0px none rgb(0, 0, 0); border-top-color: windowtext; border-right-color: windowtext; border-bottom-color: windowtext; background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;142&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-left: 0px none rgb(0, 0, 0); border-top-color: windowtext; border-right-color: windowtext; border-bottom-color: windowtext; background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;谈话对象职务&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;187&quot; valign=&quot;top&quot; style=&quot;margin: 0px; padding: 0px 7px; border-left: 0px none rgb(0, 0, 0); border-top-color: windowtext; border-right-color: windowtext; border-bottom-color: windowtext; background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr style=&quot;height: 40px;&quot;&gt;&lt;td width=&quot;138&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-right-color: windowtext; border-bottom-color: windowtext; border-left-color: windowtext; background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;谈话人姓名&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;169&quot; valign=&quot;top&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: windowtext; border-bottom-color: windowtext; background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;142&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: windowtext; border-bottom-color: windowtext; background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;谈话人职务&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;187&quot; valign=&quot;top&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: windowtext; border-bottom-color: windowtext; background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr style=&quot;height: 41px;&quot;&gt;&lt;td width=&quot;138&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-right-color: windowtext; border-bottom-color: windowtext; border-left-color: windowtext; background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;谈话时间&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;169&quot; valign=&quot;top&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: windowtext; border-bottom-color: windowtext; background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;142&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: windowtext; border-bottom-color: windowtext; background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;谈话地点&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;187&quot; valign=&quot;top&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: windowtext; border-bottom-color: windowtext; background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr style=&quot;height: 371px;&quot;&gt;&lt;td width=&quot;138&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-right-color: windowtext; border-bottom-color: windowtext; border-left-color: windowtext; background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;主要谈话内容&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;498&quot; valign=&quot;top&quot; colspan=&quot;3&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: windowtext; border-bottom-color: windowtext; background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr style=&quot;height: 113px;&quot;&gt;&lt;td width=&quot;138&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-right-color: windowtext; border-bottom-color: windowtext; border-left-color: windowtext; background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;谈话对象意见&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;498&quot; valign=&quot;bottom&quot; colspan=&quot;3&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: windowtext; border-bottom-color: windowtext; background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;签名： &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;年 &amp;nbsp;&amp;nbsp;月 &amp;nbsp;&amp;nbsp;日&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr style=&quot;height: 113px;&quot;&gt;&lt;td width=&quot;138&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-right-color: windowtext; border-bottom-color: windowtext; border-left-color: windowtext; background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;谈话人意见&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;498&quot; valign=&quot;bottom&quot; colspan=&quot;3&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: windowtext; border-bottom-color: windowtext; background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;签名： &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;年 &amp;nbsp;&amp;nbsp;月 &amp;nbsp;&amp;nbsp;日&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr style=&quot;height: 83px;&quot;&gt;&lt;td width=&quot;138&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-right-color: windowtext; border-bottom-color: windowtext; border-left-color: windowtext; background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;备注&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;498&quot; valign=&quot;top&quot; colspan=&quot;3&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: windowtext; border-bottom-color: windowtext; background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;1、&amp;nbsp;此表用于公司各层级落实党风廉政建设“两个责任”开展廉政谈话时记录使用，每半年开展一次，请谈话人提前告知纪检监察室，由该部门负责派人作谈话记录；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;2、&amp;nbsp;谈话结束后，该记录表由公司政工科（纪检监察室）收回并汇总。&lt;/span&gt;&lt;/p&gt;&lt;div&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/div&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES (85, 1, 56, '&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; text-indent: 0em; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-align: center;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;strong&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; line-height: 2em; text-indent: 2em;&quot;&gt;广州市花木公司管理干部出国（境）请假及证照管理规定&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;为加强公司管理干部出国（境）请假及证照管理，进一步严肃组织纪律，根据《广州市林业和园林局局管干部外出请假及出国（境）管理暂行规定（试行）》的有关规定，结合我公司工作实际，现制订本规定。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;一、本规定所指管理干部，是指按照干部管理权限，公司下属单位领导班子成员和各科室（部门）副科级以上的干部。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;二、公司在广州市公安局出入境管理支队对上述管理干部实施动态报备管理，管理干部退休半年后，或因辞职、辞退或其他原因离开公司的管理干部在办理辞职、辞退等手续半年之后，按照干部管理权限撤销报备。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;三、管理干部的出国（境）证照（含因私护照、港澳通行证、台湾通行证，下同）必须交由公司政工科统一保管。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;四、管理干部办理因私出国（境）的（含办理证照、签注、出国出境审批，下同）审批手续的，原则上应提前5个工作日提出，并填写《广州市花木公司管理干部因私出国（境）审批表》，其中，科室（部门）主要负责人需经公司纪委、分管领导、主管领导审批同意，科室（部门）副职需经公司纪委、分管领导审批同意并交政工科备案后，方可办理或领取证照。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;管理干部请假期间因私出国（境）的，按照上述规定一并办理审批手续。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;五、管理干部因私出国（境）原则上1年不超过两次，每次申请一次有效签证（注），不得办理多次签证（注）；出国（境）探亲的，一般不超过20天；出国旅游的，一般不超过15天；出境旅游的，一般不超过7天。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;六、管理干部参加公司组织的因公出国（境）学习考察、会议的，由牵头单位（科室）书面办理呈批手续；参加外单位组织的因公出国（境）学习考察、会议的，除呈批手续外，须附学习考察（会议）的通知、批文、邀请函等材料。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;七、管理干部出国（境）返回单位后，应在5个工作日内将出国（境）证照交回政工科集中保管、登记，一律不得私自保存；再次出国（境）时，经批准后凭有关批文或通知，到政工科领取证照。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;八、本规定由政工科负责监督检查。管理干部外出有违反以下7类问题：（一）违规办理因私出国（境）证件的；（二）违规持有因私出国（境）证件的；（三）瞒报持有因私出国（境）证件的；（四）未经组织批准擅自因私出国（境）的；（五）未按审批要求擅自变更因私出国（境）行程日期等的；（六）瞒报因私出国（境）情况的；（七）审批因私出国（境）事项把关不严的。一经发现要给予严肃批评教育，一律不纳入年终评先评优范围；造成不良影响的，要给予通报批评；情节严重的，要按照干部管理权限及时进行诫勉谈话或给予党纪政纪处分。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; 广州市花木公司管理干部因私出国（境）审批表&lt;/span&gt;&lt;/p&gt;&lt;table width=&quot;600&quot; class=&quot;ueditorTableStyle&quot;&gt;&lt;tbody&gt;&lt;tr class=&quot;firstRow&quot; style=&quot;height: 31px;&quot;&gt;&lt;td width=&quot;159&quot; valign=&quot;center&quot; colspan=&quot;3&quot; style=&quot;margin: 0px; padding: 0px 7px; border-color: windowtext; background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;申 请 人 姓 名&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;305&quot; valign=&quot;center&quot; colspan=&quot;4&quot; style=&quot;margin: 0px; padding: 0px 7px; border-left: 0px none rgb(0, 0, 0); border-top-color: windowtext; border-right-color: windowtext; border-bottom-color: windowtext; background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;所在科室（部门）&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;136&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-left: 0px none rgb(0, 0, 0); border-top-color: windowtext; border-right-color: windowtext; border-bottom-color: windowtext; background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;职 &amp;nbsp;&amp;nbsp;&amp;nbsp;务&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr style=&quot;height: 41px;&quot;&gt;&lt;td width=&quot;159&quot; valign=&quot;center&quot; colspan=&quot;3&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-right-color: windowtext; border-bottom-color: windowtext; border-left-color: windowtext; background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;305&quot; valign=&quot;center&quot; colspan=&quot;4&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: windowtext; border-bottom-color: windowtext; background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;136&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: windowtext; border-bottom-color: windowtext; background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td width=&quot;338&quot; valign=&quot;center&quot; colspan=&quot;5&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-right-color: windowtext; border-bottom-color: windowtext; border-left-color: windowtext; background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;本年度第一次出国(境)时间、地点（前往国家、城市）&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;262&quot; valign=&quot;top&quot; colspan=&quot;3&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: windowtext; border-bottom-color: windowtext; background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td width=&quot;338&quot; valign=&quot;center&quot; colspan=&quot;5&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-right-color: windowtext; border-bottom-color: windowtext; border-left-color: windowtext; background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;本年度第二次出国(境)时间、地点（前往国家、城市）&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;262&quot; valign=&quot;top&quot; colspan=&quot;3&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: windowtext; border-bottom-color: windowtext; background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr style=&quot;height: 39px;&quot;&gt;&lt;td width=&quot;95&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-right-color: windowtext; border-bottom-color: windowtext; border-left-color: windowtext; background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;请假时间&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;243&quot; valign=&quot;center&quot; colspan=&quot;4&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: windowtext; border-bottom-color: windowtext; background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;122&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-left: 0px none rgb(0, 0, 0); border-top-color: windowtext; border-right-color: windowtext; border-bottom-color: windowtext; background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;假期类别&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;141&quot; valign=&quot;center&quot; colspan=&quot;2&quot; style=&quot;margin: 0px; padding: 0px 7px; border-left: 0px none rgb(0, 0, 0); border-top-color: windowtext; border-right-color: windowtext; border-bottom-color: windowtext; background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr style=&quot;height: 36px;&quot;&gt;&lt;td width=&quot;95&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-right-color: windowtext; border-bottom-color: windowtext; border-left-color: windowtext; background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;其中：本次出国（境）时间&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;505&quot; valign=&quot;center&quot; colspan=&quot;7&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: windowtext; border-bottom-color: windowtext; background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;自 &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;年 &amp;nbsp;&amp;nbsp;月 &amp;nbsp;&amp;nbsp;日至 &amp;nbsp;&amp;nbsp;&amp;nbsp;年 &amp;nbsp;月 &amp;nbsp;&amp;nbsp;日（共 &amp;nbsp;&amp;nbsp;天）&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr style=&quot;height: 88px;&quot;&gt;&lt;td width=&quot;95&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-right-color: windowtext; border-bottom-color: windowtext; border-left-color: windowtext; background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;申请办理出国(境)事项、事由及费用来源(本人填写)&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;505&quot; valign=&quot;center&quot; colspan=&quot;7&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: windowtext; border-bottom-color: windowtext; background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;申请人签名：&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr style=&quot;height: 35px;&quot;&gt;&lt;td width=&quot;135&quot; valign=&quot;center&quot; colspan=&quot;2&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-right-color: windowtext; border-bottom-color: windowtext; border-left-color: windowtext; background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;同 行 亲 属 姓 名&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;119&quot; valign=&quot;center&quot; colspan=&quot;2&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: windowtext; border-bottom-color: windowtext; background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;与本人关系&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;210&quot; valign=&quot;center&quot; colspan=&quot;3&quot; style=&quot;margin: 0px; padding: 0px 7px; border-left: 0px none rgb(0, 0, 0); border-top-color: windowtext; border-right-color: windowtext; border-bottom-color: windowtext; background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;工 作 单 位&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;136&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-left: 0px none rgb(0, 0, 0); border-top-color: windowtext; border-right-color: windowtext; border-bottom-color: windowtext; background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;职 &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;务&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr style=&quot;height: 35px;&quot;&gt;&lt;td width=&quot;135&quot; valign=&quot;center&quot; colspan=&quot;2&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-right-color: windowtext; border-bottom-color: windowtext; border-left-color: windowtext; background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;119&quot; valign=&quot;center&quot; colspan=&quot;2&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: windowtext; border-bottom-color: windowtext; background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;210&quot; valign=&quot;center&quot; colspan=&quot;3&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: windowtext; border-bottom-color: windowtext; background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;136&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: windowtext; border-bottom-color: windowtext; background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr style=&quot;height: 41px;&quot;&gt;&lt;td width=&quot;135&quot; valign=&quot;center&quot; colspan=&quot;2&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-right-color: windowtext; border-bottom-color: windowtext; border-left-color: windowtext; background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;119&quot; valign=&quot;center&quot; colspan=&quot;2&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: windowtext; border-bottom-color: windowtext; background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;210&quot; valign=&quot;center&quot; colspan=&quot;3&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: windowtext; border-bottom-color: windowtext; background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;136&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: windowtext; border-bottom-color: windowtext; background-color: transparent;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr style=&quot;height: 101px;&quot;&gt;&lt;td width=&quot;95&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-right-color: windowtext; border-bottom-color: windowtext; border-left-color: windowtext; background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;科室（部门）&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;意 &amp;nbsp;见&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;505&quot; valign=&quot;top&quot; colspan=&quot;7&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: windowtext; border-bottom-color: windowtext; background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;科室（部门）负责人签名：&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;科室（部门） 盖章 &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;年 &amp;nbsp;&amp;nbsp;&amp;nbsp;月 &amp;nbsp;&amp;nbsp;&amp;nbsp;日&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr style=&quot;height: 84px;&quot;&gt;&lt;td width=&quot;95&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-right-color: windowtext; border-bottom-color: windowtext; border-left-color: windowtext; background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;公司纪委意见&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;505&quot; valign=&quot;top&quot; colspan=&quot;7&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: windowtext; border-bottom-color: windowtext; background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;年 &amp;nbsp;&amp;nbsp;&amp;nbsp;月 &amp;nbsp;&amp;nbsp;&amp;nbsp;日&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr style=&quot;height: 85px;&quot;&gt;&lt;td width=&quot;95&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-right-color: windowtext; border-bottom-color: windowtext; border-left-color: windowtext; background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;公司分管领导&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;审批意见&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;505&quot; valign=&quot;top&quot; colspan=&quot;7&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: windowtext; border-bottom-color: windowtext; background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;年 &amp;nbsp;&amp;nbsp;&amp;nbsp;月 &amp;nbsp;&amp;nbsp;&amp;nbsp;日&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr style=&quot;height: 72px;&quot;&gt;&lt;td width=&quot;95&quot; valign=&quot;center&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-right-color: windowtext; border-bottom-color: windowtext; border-left-color: windowtext; background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;公司主要领导&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;审批意见&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td width=&quot;505&quot; valign=&quot;top&quot; colspan=&quot;7&quot; style=&quot;margin: 0px; padding: 0px 7px; border-top: 0px none rgb(0, 0, 0); border-left: 0px none rgb(0, 0, 0); border-right-color: windowtext; border-bottom-color: windowtext; background-color: transparent;&quot;&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;年 &amp;nbsp;&amp;nbsp;&amp;nbsp;月 &amp;nbsp;&amp;nbsp;&amp;nbsp;日&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;说明：1、副科以上管理干部于工作日、公休日或国家法定节假日出国（境）的，均需按照流程审批（填写本表），经部门负责人、公司纪委、分管领导、党政主管领导批准。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;2、该请假单原件由政工科保存，休年假期间外出的，还需附上年假条。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES (86, 1, 56, '&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; text-indent: 0em; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-align: center;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;广州市花木公司内部审计工作暂行规定&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; line-height: 2em; text-indent: 2em;&quot;&gt;第一条&amp;nbsp; 为加强和规范我公司的内部审计工作，建立健全内部审计制度，根据《广州市林业和园林局内部审计工作暂行规定》及相关法规制度，结合公司实际，制定本规定。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; line-height: 2em; text-indent: 2em;&quot;&gt;第二条&amp;nbsp; 本规定所称内部审计，是指根据国家有关法律法规、财务会计制度和行政单位相关管理规定，对我公司各项经济活动的合法性、合规性以及内部控制制度的健全性、有效性实施审计监督和评价，达到完善内控制度、规范经营活动、改进财务工作、强化资产管理和确保国有资产保值增值的目的。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; line-height: 2em; text-indent: 2em;&quot;&gt;第三条&amp;nbsp; 公司内审机构和人员在公司经理的直接领导下，独立开展工作，并接受上级主管部门内审部门机构的领导和监督。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; line-height: 2em; text-indent: 2em;&quot;&gt;第四条&amp;nbsp; 内部审计工作应当编制年度审计工作计划。特殊情况需开展其他审计事项，应经分管领导和公司经理批准。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; line-height: 2em; text-indent: 2em;&quot;&gt;第五条&amp;nbsp; 公司成立内部审计工作小组，组长由公司纪委书记担任，成员由纪检监察、组织人事、工会、财务、总工室、业务科等科室（部门）负责人组成，日常工作由纪检监察室负责，定期召开审计工作会议，履行公司审计制度规定职能。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; line-height: 2em; text-indent: 2em;&quot;&gt;第六条&amp;nbsp; 内审工作小组应当配备与从事审计工作相适应的专业知识和业务能力、具有良好的政治素质和职业道德、具备较高的政策理论和管理专业水平的内审人员。公司应定期对内审人员开展后续教育和培训学习。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; line-height: 2em; text-indent: 2em;&quot;&gt;第七条&amp;nbsp; 内部审计工作小组和人员办理审计事项，应严格遵守《内部审计人员职业道德规范》，坚持原则，实事求是，客观公正，廉洁奉公，保守秘密，不得滥用职权徇私舞弊、泄露秘密、玩忽职守。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; line-height: 2em; text-indent: 2em;&quot;&gt;第八条&amp;nbsp; 被审计科室（部门）应积极配合审计小组开展工作，如实提供真实、合法的资料及相关文件，不得隐瞒、谎报情况，不得编制、提供虚假资料。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; line-height: 2em; text-indent: 2em;&quot;&gt;第九条&amp;nbsp; 内部审计人员办理审计事项，与被审计科室（部门）或审计事项利害关系的，应当回避。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; line-height: 2em; text-indent: 2em;&quot;&gt;第十条&amp;nbsp; 内审工作小组对下列事项进行审计监督：&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; line-height: 2em; text-indent: 2em;&quot;&gt;（一）国家和地方政府有关政策、财经法规的贯彻、遵守情况；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; line-height: 2em; text-indent: 2em;&quot;&gt;（二）财政、财务收支及经费预算执行情况；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; line-height: 2em; text-indent: 2em;&quot;&gt;（三）国有资产管理、固定资产投资管理、物资和苗木采购以及采购合同签订执行情况；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; line-height: 2em; text-indent: 2em;&quot;&gt;（四）工程项目管理、设计项目管理、合同管理情况；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; line-height: 2em; text-indent: 2em;&quot;&gt;（五）内部控制制度的建立健全和执行情况；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; line-height: 2em; text-indent: 2em;&quot;&gt;（六）重要经济合同、协议等的签订、执行情况；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; line-height: 2em; text-indent: 2em;&quot;&gt;（七）单位经营管理和经济效益情况；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; line-height: 2em; text-indent: 2em;&quot;&gt;（八）其他需要审计的事项。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; line-height: 2em; text-indent: 2em;&quot;&gt;第十一条&amp;nbsp; 内审工作小组行使以下职权：&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; line-height: 2em; text-indent: 2em;&quot;&gt;（一）列席或参加公司召开的与内部审计职能有关的会议；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; line-height: 2em; text-indent: 2em;&quot;&gt;（二）要求被审计科室（部门）按时提供或报送与审计内容有关的文件资料、审批手续、合同、票据凭证、签证等等，并进行审查；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; line-height: 2em; text-indent: 2em;&quot;&gt;（三）召开与审计事项有关的会议，对于审计事项有关的问题可向有关科室（部门）和个人进行询问、调查，并索取证明材料、复印有关资料。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; line-height: 2em; text-indent: 2em;&quot;&gt;（四）对被审计科室（部门）现行制度、规定不完善、不合规或不符合实际情况等，可建议或要求重新修订、修改、补充或废止。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; line-height: 2em; text-indent: 2em;&quot;&gt;（五）提出改进管理、提高效益的意见和建议；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; line-height: 2em; text-indent: 2em;&quot;&gt;（六）对被审计科室（部门）提出制止、纠正和处理违反财经纪律、违反上级相关规定、损失浪费行为和失职事项的处理意见，按有关规定向主管领导报告，并经主管领导同意，制止正在进行的上述行为。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; line-height: 2em; text-indent: 2em;&quot;&gt;（七）对在遵守和维护财经纪律、认真执行局和公司相关制度规定、确保国有资产保值增值和加强管理等方面取得显著成绩的单位或个人，向公司领导班子提出通报表扬或奖励的建议；对存在违反财经纪律和局与公司相关制度规定、弄虚作假，因失职造成国有资产流失的部门和个人，向公司领导班子提出处理意见。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; line-height: 2em; text-indent: 2em;&quot;&gt;第十二条&amp;nbsp; 公司内审工作小组根据各项工作任务和要求按照上审下的原则，对属下单位进行审计。根据需要，经本单位主管领导委托，也可以对本单位相应事项进行审计。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; line-height: 2em; text-indent: 2em;&quot;&gt;第十三条&amp;nbsp; 内审工作小组应当建立审计档案。审计档案包括：&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; line-height: 2em; text-indent: 2em;&quot;&gt;（一）审计通知书和审计方案；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; line-height: 2em; text-indent: 2em;&quot;&gt;（二）审计记录和审计证据；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; line-height: 2em; text-indent: 2em;&quot;&gt;（三）审计报告及附件；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; line-height: 2em; text-indent: 2em;&quot;&gt;（四）反映被审计部门业务活动的书面文件资料；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; line-height: 2em; text-indent: 2em;&quot;&gt;（五）审计处理意见以及执行情况报告；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; line-height: 2em; text-indent: 2em;&quot;&gt;（六）其他应保存的资料。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; line-height: 2em; text-indent: 2em;&quot;&gt;第十四条&amp;nbsp; 对认真履行职责、做出显著成绩的内审人员，由内审小组向公司领导班子提出给予相应奖励；对违反本规定滥用职权、弄虚作假、玩忽职守的，依照有关规定给予相应处理。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; line-height: 2em; text-indent: 2em;&quot;&gt;第十五条&amp;nbsp; 本规定自公布之日起施行。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES (87, 1, 56, '&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; text-indent: 0em; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-align: center;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&lt;strong&gt;花木公司“三重一大”事项决策实施细则&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;为规范决策行为，提高决策水平，加强廉政建设，依据《广州市林业和园林局党委议事规则》（穗林业园林党字〔2012〕19号）、《广州市林业和园林局行政办公会议规则》（穗林业园林通字〔2013〕116号）等规定，制定本实施细则。&lt;br/&gt;　　一、“三重一大”事项决策遵循的原则&lt;br/&gt;　　（一）集体决策原则。凡属“三重一大”的事项，必须经公司党委或公司领导班子集体讨论决定；&lt;br/&gt;　　（二）民主集中制原则。坚持以身作则，公司领导班子成员要自觉维护集体领导，带头执行民主集中制、议事规则和决策程序，自觉接受监督，保证权力正确行使；&lt;br/&gt;　　（三）科学决策原则。坚持以“四个全面”战略布局为指导，主动适应经济发展新常态，解放思想，务实创新，重点强化决策的调研、论证、程序、执行、监督等关键环节，有效防范决策风险，增强决策科学性；&lt;br/&gt;　　（四）依法决策原则。严格遵循国家法律法规、党内规章制度及相关规定，保证各项决策合法合规；&lt;br/&gt;　　（五）民主决策原则。积极拓宽民主渠道，增强决策透明度，保证群众在决策中的知情权、参与权和建议权，发挥群众的监督作用。&lt;br/&gt;　　二、“三重一大”事项的主要内容&lt;br/&gt;　　“三重一大”事项是指：公司重大决策、重要干部任免、重大项目安排和大额度资金使用事项。&lt;br/&gt;　　（一）重大决策是指涉及公司改革发展，具有全局性特点以及关系我公司干部职工切身利益的重大事项的决策工作。主要包括以下事项：&lt;br/&gt;　　1、贯彻落实党和国家方针政策，及上级重要决策、重要工作部署、重要指示的意见和措施；&lt;br/&gt;　　2、公司发展中长期规划、年度工作计划、年度目标责任制考核、改革和建设目标、任务、措施的制定等重要事项；&lt;br/&gt;　　3、公司财务年度决算、预算的申报和调整；&lt;br/&gt;　　4、公司规范性文件、重要管理制度、工作流程的制定和调整；&lt;br/&gt;　　5、公司党的建设、干部队伍建设、廉政建设、安全稳定（责任事故、突发事件处理、重要信访矛盾化解等事关社会安全稳定和谐问题的处置）中的重大问题；&lt;br/&gt;　　6、公司内部机构的设置、调整及人员编制；&lt;br/&gt;　　7、公司干部职工工资待遇、绩效考核、职称评审、评先评优等涉及职工利益的事项；&lt;br/&gt;　　8、公司向上级部门请示、报告的重大事项；&lt;br/&gt;　　9、党委班子和行政领导班子的自身建设；&lt;br/&gt;　　10、领导班子认为应当集体研究决定的其他重要事项。&lt;br/&gt;　　（二）重要干部任免是指按照干部管理权限，需公司党委集体讨论决定的干部任免事项，同时将招聘新进人员事项一并纳入此范围，主要包括以下事项：&lt;br/&gt;　　1、领导班子成员分工及调整；&lt;br/&gt;　　2、公司科级后备干部的推荐；&lt;br/&gt;　　3、科级干部的考核、选拔、任免、推荐、调动和奖惩等事项；&lt;br/&gt;　　4、招聘或调入新入职人员；&lt;br/&gt;　　5、领导班子认为应当集体决策的其他重要人事任免事项。&lt;br/&gt;　　（三）重大项目安排是指对公司改革和建设具有基础性、长期性作用的项目的安排。主要包括以下事项：&lt;br/&gt;　　1、公司基本建设工程项目、不动产购置、房屋修缮项目、大宗物资、苗木及设备采购、各类国有资产的处置等;&lt;br/&gt;　　2、以单位名义与外界合资、合作的重大项目；&lt;br/&gt;　　3、公司自筹工程和中标后需专业分包项目的施工单位的确定；&lt;br/&gt;　　4、公司物业经营项目承租人的确定以及重要合同、协议的审批；&lt;br/&gt;　　5、经上级批准的重大或集体考察学习活动项目经费的支出;&lt;br/&gt;　　6、领导班子认为其他需要集体研究决定的重大项目。&lt;br/&gt;　　（四）大额度资金使用是指按照相关规定，超过领导班子成员个人有权调动、使用的资金限额，需要领导班子集体研究决定的资金使用安排。主要包括以下事项：&lt;br/&gt;　　1、年度资金预算安排；&lt;br/&gt;　　2、单项支出在5万元以上（含5万元）的资金款项；&lt;br/&gt;　　3、重大扶贫款、支援款、物资调配使用和管理等;&lt;br/&gt;　　4、领导班子认为其他需要集体研究决定的重要资金使用。&lt;br/&gt;　　三、“三重一大”事项的决策方式&lt;br/&gt;　　（一）凡属“三重一大”事项决策时，应当根据具体内容、具体情况选择讨论决定的方式。主要方式有：党委会、行政领导班子会议等。&lt;br/&gt;　　（二）党委会由党委书记主持，党委成员参加，如遇重要议题，非党员的领导班子成员也要参加党委扩大会议。决策的范围包括：在“三重一大”事项中，涉及贯彻落实党和国家的方针政策的重大决策、重要工作部署、重要指示精神和公司党的建设、廉政建设、干部队伍建设、人事任免等重大决策事项。&lt;br/&gt;　　（三）行政领导班子会议由公司经理主持，公司领导班子成员参加，必要时相关科室（部门）负责人可列席会议。决策范围包括：涉及全公司各项业务工作、内部管理工作、重大项目和大额资金使用的重大决策事项。&lt;br/&gt;　　四、“三重一大”事项的决策程序&lt;br/&gt;　　公司“三重一大”事项的具体程序如下：&lt;br/&gt;　　（一）酝酿阶段。&lt;br/&gt;　　1、充分征求意见。“三重一大”事项决策前，应进行深入调查研究，充分听取分管领导、科室及各方面的意见建议。对存在较大分歧的议题，一般不提交会议讨论。&lt;br/&gt;　　2、按照程序提议。提请公司班子会议或党委会议审议的“三重一大”事项议题一般由相关科室提出，经分管领导同意后，报主要领导确定，除遇重大突发事件和紧急情况外，一般不得临时动议。&lt;br/&gt;　　3、做好相关准备。议题材料提前送达参会人员，保证其有充分时间了解相关情况。&lt;br/&gt;　　（二）决策阶段。&lt;br/&gt;　　1、保证出席人数。决策“三重一大”事项的会议，应有三分之二以上班子成员或党委委员到会方可召开。&lt;br/&gt;　　2、充分发表意见。按照“相关科室负责人提出议题、班子讨论、经理或党委书记末位表态”等步骤进行。即相关科室对议题作汇报介绍，班子成员或党委成员就议题建议逐个表态，并说明理由。经理或党委书记不先发表倾向性意见，待其他班子成员或党委成员充分发表意见后末位表态。如意见不能达成基本一致或有严重分歧，应暂缓决策。&lt;br/&gt;　　3、逐项作出决策。会议决定多个事项时，应逐个表决。表决可根据讨论事项的不同内容，采取口头、举手、无记名投票或其他方式进行，以应到会成员超过半数同意后形成决定。&lt;br/&gt;　　4、形成会议记录。会议指定专人记录会议时间、地点、主持人、参会人员、列席人员、请假人员，每项议题讨论情况及最后决定。会议记录须经每位参会人员签字背书。&lt;br/&gt;　　（三）执行阶段。&lt;br/&gt;　　1、分工组织落实。“三重一大”事项决策后，由班子成员按分工和职责组织实施。遇到职责交叉的，由公司经理或党委书记明确1名班子成员牵头。&lt;br/&gt;　　2、严格执行决策。班子成员或党委成员应带头执行各项决策，个人不得擅自改变集体决策。如遇重大突发事件和紧急情况作出临时处置的，应在事后及时向公司班子报告；未完成事项如需公司领导班子重新作出决策的，经再次决策后，按新的决策执行。&lt;br/&gt;　　3、明确执行纪律。个人对集体决策的不同意见的，可以保留并可按照组织程序向上级反映，但在没有作出新的集体决策之前，任何单位和个人不得擅自变更或拒绝执行已作出的决策。&lt;br/&gt;　　五、监督检查&lt;br/&gt;　　1、畅通监督渠道。除有关法律、法规规定应当保密的内容外，“三重一大”事项决策、执行情况应在一定范围内公开，接受内部和社会监督。&lt;br/&gt;　　2、强化主体责任。党政“一把手”为第一责任人，要带头执行民主集中制，切实履行主体责任，抓好“三重一大”集体决策制度的组织实施；班子成员要认真落实集体领导下的分工责任制，根据分工职责及时向领导班子报告“三重一大”事项的执行情况。&lt;br/&gt;　　3、强化监督责任。公司纪委要严格履行监督责任，及时发现、指出、纠正存在的问题，对问题突出的，及时向上级纪委报告。&lt;br/&gt;　　六、责任追究&lt;br/&gt;　　（一）具有下列行为之一的，由公司党委按照有关规定，追究有关责任者责任：&lt;br/&gt;　　1、不履行“三重一大”制度决策程序，不执行或擅自改变集体决定的；&lt;br/&gt;　　2、未经集体讨论决定而个人决策、事后又不通报的；&lt;br/&gt;　　3、未向领导集体提供真实情况而造成错误决定的；&lt;br/&gt;　　4、执行决策后发现可能造成损失，能够挽回而不采取措施纠正的；违反决策程序规定的；&lt;br/&gt;　　（二）领导班子决策失误造成严重后果或者涉嫌违纪违法的，在查明情况、分清责任的基础上，按照干部管理权限及时向上级部门报告，分别追究有关人员的相应责任。&lt;/span&gt;&lt;/p&gt;&lt;div&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/div&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES (88, 1, 56, '&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; text-indent: 0em; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-align: center;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;广州市花木公司党支部“三会一课”制度&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;为进一步加强公司党建工作，完善对公司党支部和党员的管理，提高党建工作水平，充分发挥党支部的战斗堡垒作用和党员的先锋模范作用，现结合公司实际，制定如下制度。&lt;br/&gt;　　一、各党支部必须坚持“三会一课”制度。三会是：党支部大会、党支部委员会、党小组生活会；　　　一课是：党课。&lt;br/&gt;　　二、党支部每季度至少要召开一次支部大会和一次支委会，学习党的文件，传达上级党组织的决定和指示，研究总结工作，根据形势任务向党员提出具体要求。&lt;br/&gt;　　三、党小组每月要召开一次党员生活会，学习党的方针、政策，开展批评与自我批评，交流思想、总结工作。&lt;br/&gt;　　四、党支部每半年一次党课教育（可吸收非党积极分子参加），其内容是围绕党的中心任务，联系实际，学习党的路线、方针、政策，学习党的理论及基本知识。&lt;br/&gt;　　五、政工科负责“三会一课”的检查考核。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES (89, 1, 56, '&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; text-indent: 0em; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-align: center;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;广州市花木公司党务公开制度&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; white-space: normal; background-color: rgb(245, 245, 245); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;为进一步扩大党内民主、增强党组织的生机活力、加强和改进新形势下党的建设，促进党务公开工作健康深入开展，特制定本制度｡&lt;br/&gt;　　一、基本原则&lt;br/&gt;　　（一）以落实党员的知情权、参与权、选举权、表达权、监督权为重点，充分发挥党员在党内生活中的主体作用，营造党内民主讨论、民主监督环境。&lt;br/&gt;　　（二）坚持自上而下的指导和自下而上的探索相结合，坚持先党内后党外，循序渐进。&lt;br/&gt;　　（三）针对公司党组织的特点，确定相应的公开内容和形式。公开的内容应真实、具体，形式应多样、便捷，并保证公开的时效性和经常性。&lt;br/&gt;　　（四）把党务公开和司务公开相结合。积极适应客观形势发展和党内基层民主建设新要求，探索党组织和党员发挥作用的途径和方式。&lt;br/&gt;　　二､公开内容&lt;br/&gt;按照依法公开、真实可信的要求、凡需要党组织班子集体研究决定的重大问题、涉及群众切身利益的问题、群众关心的热点问题、容易出现以权谋私、滋生腐败、引发不公的事项，除涉及保密的内容外，都要最大限度的向职工群众公开。包括:&lt;br/&gt;　　（一）党组织重大决策、决定、决议的酝酿、拟定、出台及落实情况。&lt;br/&gt;　　（二）领导班子自身建设情况。领导班子的思想建设、组织建设、作风建设、制度建设以及党风廉政建设责任制考核情况，民主生活会征集意见、开展批评和自我批评、问题整改情况，领导干部述廉情况，重要情况通报和报告等。&lt;br/&gt;　　（三）干部制度执行情况。干部考察预告、任前公示、竞聘上岗、奖惩情况以及《党政领导干部选拔任用工作条例》规定的公开事项。&lt;br/&gt;　　（四）领导干部廉洁自律规定执行情况。领导干部购建房、子女出国学习、配偶和子女从业等个人重大事项报告情况，执行不准收送现金、有价证券、支付凭证的规定情况，执行通信工具管理规定情况，出国(境)和跨省考察情况，执行公车使用管理规定情况。&lt;br/&gt;　　（五）组织建设情况。党代表的推荐产生情况，党员发展情况，入党积极分子情况，民主评议党员、党费收缴情况等。&lt;br/&gt;　　（六）考核情况。党务工作考核情况和受表彰情况。&lt;br/&gt;　　（七）监督情况｡违法违纪问题查处和信访监督情况，实施党内监督程序化、制度化的具体办法和措施。&lt;br/&gt;　　（八）有必要公开的党内其它事项。&lt;br/&gt;　　三、公开类型&lt;br/&gt;根据党务公开的性质分为法定公开、主动公开、依申请公开三种类型。&lt;br/&gt;　　（一）法定公开：对属于党内规定要求公开的内容，在适当范围、以适当方式予以公开。&lt;br/&gt;　　（二）主动公开：对党委制定的不涉及党和国家秘密的事项，主动公开。&lt;br/&gt;　　（三）依申请公开：对党员、群众要求公开的事项，经研究，认为可以公开的，在一定范围内以适当方式予以公开。对申请的事项暂时不宜公开的，在接到申请5个工作日内向申请人说明情况，并报上一级党组织备案。&lt;br/&gt;　　四、公开范围和方式&lt;br/&gt;　　（一）党务公开范围：公司全体党员。对事关公司经济发展、职工群众生产生活和切身利益等重大事项，按规定可以向党外公开的，及时公开。&lt;br/&gt;　　（二）党务公开方式：采用会议、文件、简报、公开栏、单位网站等方式进行。&lt;br/&gt;　　五、公开程序和时限&lt;br/&gt;　　（一）党务公开的程序按照发文审批的程序进行，由主办科室提出意见（涉及依申请公开事项，由领导小组办公室牵头、相关科室协助提供资料、依据），报公司领导审批；涉及对外宣传或媒体公开的，由公司政工科报告公司领导、上报局宣教处审核把关。&lt;br/&gt;　　（二）党务公开的时间要与公开的内容相适应，常规性工作要定期公开，阶段性工作要逐段公开，临时性工作要随时公开。&lt;br/&gt;　　六、监督与考核&lt;br/&gt;把党务公开纳入党风廉政建设责任制考核体系，明确标准，落实责任。要加强监督检查，定期、不定期地检查督促贯彻执行党务公开的情况，及时总结经验，不断提高党务公开工作的水平。为认真落实党务公开制度提供基础保障。&lt;/span&gt;&lt;/p&gt;&lt;div&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/div&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES (116, 1, 64, '&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal; background-color: rgb(238, 238, 238); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal; background-color: rgb(238, 238, 238); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px;&quot;&gt;广州市花木公司里程碑&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal; background-color: rgb(238, 238, 238); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal; background-color: rgb(238, 238, 238); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px;&quot;&gt;1958年 &amp;nbsp;2月广州市花木公司成立，后隶属于广州市建设局园林管理处管辖。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal; background-color: rgb(238, 238, 238); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px;&quot;&gt;1959年 &amp;nbsp;9月广州市花木公司成为独立的国营机构（事业单位企业管理），直接隶属建设局。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal; background-color: rgb(238, 238, 238); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px;&quot;&gt;1965年 &amp;nbsp;广州市园林局成立，广州市花木公司自此隶属于广州市园林局。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal; background-color: rgb(238, 238, 238); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px;&quot;&gt;1977年 &amp;nbsp;8月承接了为北京毛主席纪念堂敬献鲜花苗木的任务，共发运苗木1.2万株，米兰、棕竹、桔果、兰花、盆景等共1261盆。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal; background-color: rgb(238, 238, 238); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px;&quot;&gt;1989年 &amp;nbsp;经园林局批准，公司由原来的科级单位升为处级单位。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal; background-color: rgb(238, 238, 238); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px;&quot;&gt;2002年 &amp;nbsp;公司在杭州、厦门等地设立分公司，进一步开拓外地园林绿化工程业务。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal; background-color: rgb(238, 238, 238); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px;&quot;&gt;2004年 &amp;nbsp;10月被住房和城乡建设部核定为城市园林绿化壹级企业。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal; background-color: rgb(238, 238, 238); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px;&quot;&gt;2006-2008年 &amp;nbsp;承接了厦门海悦山庄高端接待区园林景观工程及厦门海悦酒店园林景观绿化工程，该工程荣获广东省风景园林优良样板工程金奖。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal; background-color: rgb(238, 238, 238); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px;&quot;&gt;2007年 &amp;nbsp;11月被广东省住房和城乡建设厅核定为风景园林工程设计专项乙级企业。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal; background-color: rgb(238, 238, 238); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px;&quot;&gt;2009-2010年 &amp;nbsp;公司全体人员上下一心参与全市亚运花卉布置工作，使广州呈现出“一线花带、十里花堤、百道花廊、处处花景”的景象。公司被评为“广州市亚运会亚残运会先进集体”，获得中国风景园林学会颁发的“优秀管理奖”。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal; background-color: rgb(238, 238, 238); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px;&quot;&gt;2010年 &amp;nbsp;4月被广东省林学会营造林专业委员会评定为造林工程施工资质乙级企业。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal; background-color: rgb(238, 238, 238); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px;&quot;&gt;2012年 &amp;nbsp;11月承接石榴岗河流域景观绿化改造工程，该工程获得中国风景园林学会“优秀园林工程奖”金奖和“广东省风景园林优良样板工程”金奖。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal; background-color: rgb(238, 238, 238); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px;&quot;&gt;2013年 &amp;nbsp;9月被广州市住房和城乡建设委员会核定为市政公用工程施工总承包叁级企业。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal; background-color: rgb(238, 238, 238); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal; background-color: rgb(238, 238, 238); line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px;&quot;&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/159444029226f069.jpg&quot; title=&quot;CgAGTFk-U_CAUaEUAANb89zgM74339 (1)&quot; alt=&quot;CgAGTFk-U_CAUaEUAANb89zgM74339 (1)&quot;/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES (117, 1, 70, '&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 12px; white-space: normal; line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px;&quot;&gt;&amp;nbsp;根据公司改革创新发展、业务拓展、人才队伍建设的内在要求，现向社会公开招聘以下工作岗位。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 12px; white-space: normal; line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px;&quot;&gt;&lt;br/&gt;　　一、招聘岗位&lt;br/&gt;　　（一）园林绿化工程施工员&lt;br/&gt;　　任职要求：&lt;br/&gt;　　①土木工程、风景园林、园林景观、园艺等相关专业专科以上学历；&lt;br/&gt;　　②工作细致认真，谨慎细心，积极主动；&lt;br/&gt;　　③工作效率高，责任心、执行力强，具有团队精神。&lt;br/&gt;　　岗位职责：负责公司施工现场管理工作&lt;br/&gt;　　工作地点：广州市&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 12px; white-space: normal; line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px;&quot;&gt;&lt;br/&gt;　　（二）花卉苗木生产管理人员&lt;br/&gt;　　任职要求：&lt;br/&gt;　　①园艺等相关专业本科以上学历；&lt;br/&gt;　　②工作细致认真，谨慎细心，积极主动；&lt;br/&gt;　　③工作效率高，责任心、执行力强，具有团队精神。&lt;br/&gt;　　岗位职责：负责花卉苗木生产管理工作&lt;br/&gt;　　工作地点：广州市&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 12px; white-space: normal; line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px;&quot;&gt;&lt;br/&gt;　　二、薪酬待遇&lt;br/&gt;　　将为优秀管理员工提供广阔的事业发展平台、多样性的职业发展通道和具竞争力的薪酬福利待遇。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 12px; white-space: normal; line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px;&quot;&gt;&lt;br/&gt;　　三、联系方式&lt;br/&gt;　　简历投递邮箱：&lt;/span&gt;&lt;a href=&quot;mailto:hmgszgk@163.com&quot; style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px;&quot;&gt;hmgszgk@163.com&lt;/a&gt;&lt;br/&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px;&quot;&gt;　　联系人：陈小姐&lt;br/&gt;　　联系电话：020-37597935&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES (118, 1, 68, '&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 12px; white-space: normal; line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px;&quot;&gt;唯才是用，唯德重用。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 12px; white-space: normal; line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px;&quot;&gt;不转机制就转岗，不换观念就换人。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 12px; white-space: normal; line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px;&quot;&gt;牢固树立人力资源是第一资源的观念，坚定不移地走人才强企之路，把建立层次科学、配比合理的专业技术和管理人才队伍放在突出地位。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES (119, 1, 69, '&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/1594444243bb1dbe.jpg&quot; title=&quot;CgAGS1kzGF6AP6B8AAPRyFd1i2Y233&quot; alt=&quot;CgAGS1kzGF6AP6B8AAPRyFd1i2Y233&quot;/&gt;&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES (120, 1, 69, '&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/1594444267bde90f.jpg&quot; title=&quot;CgAGS1kzGCiAaPvPAAReVafWAYU890&quot; alt=&quot;CgAGS1kzGCiAaPvPAAReVafWAYU890&quot;/&gt;&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES (121, 1, 69, '&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/1594444318b57c3d.jpg&quot; title=&quot;CgAGS1kzF_aAMAbAAAMWY04Rqmg543&quot; alt=&quot;CgAGS1kzF_aAMAbAAAMWY04Rqmg543&quot;/&gt;&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES (122, 1, 69, '&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/1594444345b2ced1.jpg&quot; title=&quot;CgAGS1kzF8OAJaETAAKy1JDw6Us290&quot; alt=&quot;CgAGS1kzF8OAJaETAAKy1JDw6Us290&quot;/&gt;&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES (123, 1, 69, '&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/1594444366e9a7b2.jpg&quot; title=&quot;CgAGS1kzF4uAApK3AAIiL76Fv3g682&quot; alt=&quot;CgAGS1kzF4uAApK3AAIiL76Fv3g682&quot;/&gt;&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES (124, 1, 69, '&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/1594444391883d4d.jpg&quot; title=&quot;CgAGS1kzF1aAcMrQAANn8BTXk9k833&quot; alt=&quot;CgAGS1kzF1aAcMrQAANn8BTXk9k833&quot;/&gt;&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES (125, 1, 69, '&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/1594444409d3f314.jpg&quot; title=&quot;CgAGS1kzFxSAI3k1AAS0xZ8CJmE350&quot; alt=&quot;CgAGS1kzFxSAI3k1AAS0xZ8CJmE350&quot;/&gt;&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES (126, 1, 69, '&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/159444443608617e.jpg&quot; title=&quot;CgAGS1kzFsOAEZrrAAP7kg4gTM4067&quot; alt=&quot;CgAGS1kzFsOAEZrrAAP7kg4gTM4067&quot;/&gt;&lt;/p&gt;');

-- ----------------------------
-- Table structure for dr_1_news_draft
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_news_draft`;
CREATE TABLE `dr_1_news_draft`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cid` int(10) UNSIGNED NOT NULL COMMENT '内容id',
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '具体内容',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内容草稿表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_news_flag
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_news_flag`;
CREATE TABLE `dr_1_news_flag`  (
  `flag` tinyint(2) UNSIGNED NOT NULL DEFAULT 1 COMMENT '文档标记id',
  `id` int(10) UNSIGNED NOT NULL COMMENT '文档内容id',
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  INDEX `flag`(`flag`, `id`, `uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '标记表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for dr_1_news_hits
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_news_hits`;
CREATE TABLE `dr_1_news_hits`  (
  `id` int(10) UNSIGNED NOT NULL COMMENT '文章id',
  `hits` int(10) UNSIGNED NOT NULL COMMENT '总点击数',
  `day_hits` int(10) UNSIGNED NOT NULL COMMENT '本日点击',
  `week_hits` int(10) UNSIGNED NOT NULL COMMENT '本周点击',
  `month_hits` int(10) UNSIGNED NOT NULL COMMENT '本月点击',
  `year_hits` int(10) UNSIGNED NOT NULL COMMENT '年点击量',
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `day_hits`(`day_hits`) USING BTREE,
  INDEX `week_hits`(`week_hits`) USING BTREE,
  INDEX `month_hits`(`month_hits`) USING BTREE,
  INDEX `year_hits`(`year_hits`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '时段点击量统计' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for dr_1_news_index
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_news_index`;
CREATE TABLE `dr_1_news_index`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 127 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内容索引表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of dr_1_news_index
-- ----------------------------
INSERT INTO `dr_1_news_index` VALUES (126, 1, 69, 9, 1594444735);
INSERT INTO `dr_1_news_index` VALUES (125, 1, 69, 9, 1594444578);
INSERT INTO `dr_1_news_index` VALUES (124, 1, 69, 9, 1594444646);
INSERT INTO `dr_1_news_index` VALUES (123, 1, 69, 9, 1594444684);
INSERT INTO `dr_1_news_index` VALUES (122, 1, 69, 9, 1594444616);
INSERT INTO `dr_1_news_index` VALUES (121, 1, 69, 9, 1594444599);
INSERT INTO `dr_1_news_index` VALUES (120, 1, 69, 9, 1594444528);
INSERT INTO `dr_1_news_index` VALUES (119, 1, 69, 9, 1594444490);
INSERT INTO `dr_1_news_index` VALUES (118, 1, 68, 9, 1594443722);
INSERT INTO `dr_1_news_index` VALUES (117, 1, 70, 9, 1594443661);
INSERT INTO `dr_1_news_index` VALUES (116, 1, 64, 9, 1594442480);
INSERT INTO `dr_1_news_index` VALUES (89, 1, 56, 9, 1594445770);
INSERT INTO `dr_1_news_index` VALUES (88, 1, 56, 9, 1594445782);
INSERT INTO `dr_1_news_index` VALUES (87, 1, 56, 9, 1594445756);
INSERT INTO `dr_1_news_index` VALUES (86, 1, 56, 9, 1594445794);
INSERT INTO `dr_1_news_index` VALUES (85, 1, 56, 9, 1594445815);
INSERT INTO `dr_1_news_index` VALUES (84, 1, 56, 9, 1594445839);
INSERT INTO `dr_1_news_index` VALUES (83, 1, 56, 9, 1594445867);
INSERT INTO `dr_1_news_index` VALUES (82, 1, 56, 9, 1594445879);
INSERT INTO `dr_1_news_index` VALUES (81, 1, 53, 9, 1594445645);
INSERT INTO `dr_1_news_index` VALUES (80, 1, 53, 9, 1594445695);
INSERT INTO `dr_1_news_index` VALUES (78, 1, 53, 9, 1594445722);
INSERT INTO `dr_1_news_index` VALUES (77, 1, 53, 9, 1594445736);
INSERT INTO `dr_1_news_index` VALUES (76, 1, 53, 9, 1594445624);
INSERT INTO `dr_1_news_index` VALUES (75, 1, 53, 9, 1594445612);
INSERT INTO `dr_1_news_index` VALUES (74, 1, 53, 9, 1594445578);
INSERT INTO `dr_1_news_index` VALUES (73, 1, 55, 9, 1594445476);
INSERT INTO `dr_1_news_index` VALUES (72, 1, 54, 10, 1594375123);
INSERT INTO `dr_1_news_index` VALUES (71, 1, 54, 9, 1594445387);
INSERT INTO `dr_1_news_index` VALUES (79, 1, 53, 9, 1594445710);

-- ----------------------------
-- Table structure for dr_1_news_recycle
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_news_recycle`;
CREATE TABLE `dr_1_news_recycle`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cid` int(10) UNSIGNED NOT NULL COMMENT '内容id',
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) UNSIGNED NOT NULL COMMENT '栏目id',
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '具体内容',
  `result` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '删除理由',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内容回收站表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dr_1_news_recycle
-- ----------------------------
INSERT INTO `dr_1_news_recycle` VALUES (1, 72, 1, 54, '{\"1_news\":{\"id\":\"72\",\"catid\":\"54\",\"title\":\"test\",\"thumb\":\"\",\"keywords\":\"test\",\"description\":\"test\",\"hits\":\"1\",\"uid\":\"1\",\"author\":\"admin\",\"status\":\"9\",\"url\":\"\\/index.php?c=show&id=72\",\"link_id\":\"0\",\"tableid\":\"0\",\"inputip\":\"10.50.0.40\",\"inputtime\":\"1594375123\",\"updatetime\":\"1594375146\",\"comments\":\"0\",\"avgsort\":\"0.00\",\"displayorder\":\"0\"},\"1_news_data_0\":{\"id\":\"72\",\"uid\":\"1\",\"catid\":\"54\",\"content\":\"&lt;p&gt;testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest&lt;\\/p&gt;\"},\"1_news_category_data\":null}', '', 1594375321);

-- ----------------------------
-- Table structure for dr_1_news_search
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_news_search`;
CREATE TABLE `dr_1_news_search`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `params` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '参数数组',
  `keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关键字',
  `contentid` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id集合',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '搜索时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `keyword`(`keyword`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '搜索表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_news_time
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_news_time`;
CREATE TABLE `dr_1_news_time`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '具体内容',
  `result` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '处理结果',
  `posttime` int(10) UNSIGNED NOT NULL COMMENT '定时发布时间',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `posttime`(`posttime`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内容定时发布表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_news_verify
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_news_verify`;
CREATE TABLE `dr_1_news_verify`  (
  `id` int(10) UNSIGNED NOT NULL,
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `isnew` tinyint(1) UNSIGNED NOT NULL COMMENT '是否新增',
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '具体内容',
  `backuid` mediumint(8) UNSIGNED NOT NULL COMMENT '操作人uid',
  `backinfo` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作退回信息',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '录入时间',
  `vid` int(10) NULL DEFAULT NULL,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE,
  INDEX `backuid`(`backuid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内容审核表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_page
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_page`;
CREATE TABLE `dr_1_page`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级id',
  `pids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所有上级id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '自定义页面名称',
  `dirname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '上级目录',
  `child` tinyint(1) UNSIGNED NOT NULL COMMENT '是否有子类',
  `childids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '下级所有id',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '缩略图',
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '单页内容',
  `attachment` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '附件信息',
  `show` tinyint(1) UNSIGNED NOT NULL COMMENT '是否显示在菜单',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'url地址',
  `setting` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '自定义内容',
  `displayorder` smallint(5) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `show`(`show`) USING BTREE,
  INDEX `displayorder`(`displayorder`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '自定义页面表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_photo
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_photo`;
CREATE TABLE `dr_1_photo`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) UNSIGNED NOT NULL COMMENT '栏目id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主题',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩略图',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键字',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
  `hits` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '浏览数',
  `uid` int(10) UNSIGNED NOT NULL COMMENT '作者id',
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者名称',
  `status` tinyint(2) NOT NULL COMMENT '状态',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `link_id` int(10) NOT NULL DEFAULT 0 COMMENT '同步id',
  `tableid` smallint(5) UNSIGNED NOT NULL COMMENT '附表id',
  `inputip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) NOT NULL COMMENT '更新时间',
  `updatetime` int(10) NOT NULL COMMENT '更新时间',
  `comments` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '评论数量',
  `avgsort` decimal(10, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '平均点评分数',
  `displayorder` int(10) NULL DEFAULT 0 COMMENT '排序值',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`, `updatetime`) USING BTREE,
  INDEX `link_id`(`link_id`) USING BTREE,
  INDEX `comments`(`comments`) USING BTREE,
  INDEX `avgsort`(`avgsort`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `updatetime`(`updatetime`) USING BTREE,
  INDEX `hits`(`hits`) USING BTREE,
  INDEX `displayorder`(`displayorder`, `updatetime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 115 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内容主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dr_1_photo
-- ----------------------------
INSERT INTO `dr_1_photo` VALUES (57, 43, '花卉服务', '53', '花卉服务', '花卉服务', 3, 1, 'admin', 9, '/index.php?c=show&id=57', 0, 0, '10.50.0.40', 1594354355, 1594694927, 0, 0.00, 0);
INSERT INTO `dr_1_photo` VALUES (58, 43, '花卉种植', '59', '花卉种植', '花卉种植', 5, 1, 'admin', 9, '/index.php?c=show&id=58', 0, 0, '10.50.0.40', 1594354426, 1594694903, 0, 0.00, 0);
INSERT INTO `dr_1_photo` VALUES (59, 43, '石基时花生基地', '70', '石基时花生基地', '石基时花生基地', 3, 1, 'admin', 9, '/index.php?c=show&id=59', 0, 0, '10.50.0.40', 1594356667, 1594694878, 0, 0.00, 0);
INSERT INTO `dr_1_photo` VALUES (60, 43, '花卉服务', '72', '花卉服务', '花卉服务', 2, 1, 'admin', 9, '/index.php?c=show&id=60', 0, 0, '10.50.0.40', 1594357749, 1594694850, 0, 0.00, 0);
INSERT INTO `dr_1_photo` VALUES (90, 58, '广州大道改造工程', '159', '广州大道改造工程', '广州大道改造工程', 1, 1, 'admin', 9, '/index.php?c=show&id=90', 0, 0, '10.50.0.40', 1594431313, 1594695575, 0, 0.00, 0);
INSERT INTO `dr_1_photo` VALUES (61, 43, '旧机场花生基地', '86', '旧机场花生基地', '旧机场花生基地', 3, 1, 'admin', 9, '/index.php?c=show&id=61', 0, 0, '10.50.0.40', 1594358262, 1594695327, 0, 0.00, 0);
INSERT INTO `dr_1_photo` VALUES (62, 43, '机场摆花', '82', '机场摆花', '机场摆花', 3, 1, 'admin', 9, '/index.php?c=show&id=62', 0, 0, '10.50.0.40', 1594358442, 1594695352, 0, 0.00, 0);
INSERT INTO `dr_1_photo` VALUES (63, 43, '参加行业展示', '96', '参加行业展示', '参加行业展示', 2, 1, 'admin', 9, '/index.php?c=show&id=63', 0, 0, '10.50.0.40', 1594358825, 1594695364, 0, 0.00, 0);
INSERT INTO `dr_1_photo` VALUES (64, 43, '机场高速花卉布置项目', '101', '机场高速花卉布置项目', '机场高速花卉布置项目', 3, 1, 'admin', 9, '/index.php?c=show&id=64', 0, 0, '10.50.0.40', 1594358862, 1594695377, 0, 0.00, 0);
INSERT INTO `dr_1_photo` VALUES (65, 43, '2016年园博会', '105', '2016年园博会', '2016年园博会', 3, 1, 'admin', 9, '/index.php?c=show&id=65', 0, 0, '10.50.0.40', 1594358908, 1594695386, 0, 0.00, 0);
INSERT INTO `dr_1_photo` VALUES (66, 43, '亚运时花卉布置项目', '107', '亚运时花卉布置项目', '亚运时花卉布置项目', 3, 1, 'admin', 9, '/index.php?c=show&id=66', 0, 0, '10.50.0.40', 1594358935, 1594695413, 0, 0.00, 0);
INSERT INTO `dr_1_photo` VALUES (67, 43, '花卉科普', '109', '花卉科普', '花卉科普', 7, 1, 'admin', 9, '/index.php?c=show&id=67', 0, 0, '10.50.0.40', 1594358965, 1594695425, 0, 0.00, 0);
INSERT INTO `dr_1_photo` VALUES (68, 43, '中山纪念堂立体花坛', '95', '中山纪念堂立体花坛', '中山纪念堂立体花坛', 3, 1, 'admin', 9, '/index.php?c=show&id=68', 0, 0, '10.50.0.40', 1594359062, 1594695439, 0, 0.00, 0);
INSERT INTO `dr_1_photo` VALUES (69, 43, '花卉装饰', '92', '花卉装饰', '花卉装饰', 3, 1, 'admin', 9, '/index.php?c=show&id=69', 0, 0, '10.50.0.40', 1594359100, 1594695344, 0, 0.00, 0);
INSERT INTO `dr_1_photo` VALUES (56, 43, '花卉布置工程', '47', '花卉布置工程', '花卉布置工程', 5, 1, 'admin', 9, '/index.php?c=show&id=56', 0, 0, '10.50.0.40', 1594353970, 1594694933, 0, 0.00, 0);
INSERT INTO `dr_1_photo` VALUES (91, 58, '科韵路改造工程', '161', '科韵路改造工程', '科韵路改造工程', 1, 1, 'admin', 9, '/index.php?c=show&id=91', 0, 0, '10.50.0.40', 1594431390, 1594694966, 0, 0.00, 0);
INSERT INTO `dr_1_photo` VALUES (92, 58, '广州大道南改造工程', '163', '', '广州大道南改造工程', 1, 1, 'admin', 9, '/index.php?c=show&id=92', 0, 0, '10.50.0.40', 1594431654, 1594694975, 0, 0.00, 0);
INSERT INTO `dr_1_photo` VALUES (93, 58, '大连高新万达公馆（中轴及B区）豪宅景观工程', '165', '大连高新万达公馆（中轴及B区）豪宅景观工程', '大连高新万达公馆（中轴及B区）豪宅景观工程', 1, 1, 'admin', 9, '/index.php?c=show&id=93', 0, 0, '10.50.0.40', 1594431693, 1594694986, 0, 0.00, 0);
INSERT INTO `dr_1_photo` VALUES (94, 58, '厦门海悦酒店园林景观绿化工程', '167', '厦门海悦酒店园林景观绿化工程', '厦门海悦酒店园林景观绿化工程', 1, 1, 'admin', 9, '/index.php?c=show&id=94', 0, 0, '10.50.0.40', 1594431768, 1594694996, 0, 0.00, 0);
INSERT INTO `dr_1_photo` VALUES (95, 58, '石榴岗河流域景观绿化改造工程', '169', '石榴岗河流域景观绿化改造工程', '石榴岗河流域景观绿化改造工程', 1, 1, 'admin', 9, '/index.php?c=show&id=95', 0, 0, '10.50.0.40', 1594431805, 1594695006, 0, 0.00, 0);
INSERT INTO `dr_1_photo` VALUES (96, 58, '白云国际会议中心改造工程', '171', '白云国际会议中心改造工程', '白云国际会议中心改造工程', 1, 1, 'admin', 9, '/index.php?c=show&id=96', 0, 0, '10.50.0.40', 1594431849, 1594695020, 0, 0.00, 0);
INSERT INTO `dr_1_photo` VALUES (97, 58, '番禺区前锋净水厂扩建三期工程——绿化园景工程', '173', '番禺区前锋净水厂扩建三期工程——绿化园景工程', '番禺区前锋净水厂扩建三期工程——绿化园景工程', 1, 1, 'admin', 9, '/index.php?c=show&id=97', 0, 0, '10.50.0.40', 1594431882, 1594695030, 0, 0.00, 0);
INSERT INTO `dr_1_photo` VALUES (98, 43, '广州大道（禺东西—广州大桥南）景观绿化建设工程设计施工一体化项目', '175', '广州大道（禺东西—广州大桥南）景观绿化建设工程设计施工一体化项目', '广州大道（禺东西—广州大桥南）景观绿化建设工程设计施工一体化项目', 1, 1, 'admin', 9, '/index.php?c=show&id=98', 0, 0, '10.50.0.40', 1594431926, 1594695038, 0, 0.00, 0);
INSERT INTO `dr_1_photo` VALUES (99, 58, '越秀区七株榕社区绿化广场建设工程', '177', '越秀区七株榕社区绿化广场建设工程', '越秀区七株榕社区绿化广场建设工程', 1, 1, 'admin', 9, '/index.php?c=show&id=99', 0, 0, '10.50.0.40', 1594431973, 1594695046, 0, 0.00, 0);
INSERT INTO `dr_1_photo` VALUES (100, 58, '东风路景观绿化建设工程设计施工一体化项目', '179', '东风路景观绿化建设工程设计施工一体化项目', '东风路景观绿化建设工程设计施工一体化项目', 1, 1, 'admin', 9, '/index.php?c=show&id=100', 0, 0, '10.50.0.40', 1594432080, 1594695055, 0, 0.00, 0);
INSERT INTO `dr_1_photo` VALUES (101, 58, '二沙岛东端绿地景观绿化建设项目', '181', '二沙岛东端绿地景观绿化建设项目', '二沙岛东端绿地景观绿化建设项目', 1, 1, 'admin', 9, '/index.php?c=show&id=101', 0, 0, '10.50.0.40', 1594432144, 1594695064, 0, 0.00, 0);
INSERT INTO `dr_1_photo` VALUES (102, 58, '园林景观工程', '183', '园林景观工程', '园林景观工程', 1, 1, 'admin', 9, '/index.php?c=show&id=102', 0, 0, '10.50.0.40', 1594432182, 1594695074, 0, 0.00, 0);
INSERT INTO `dr_1_photo` VALUES (103, 60, '“八路一岛”养护—东风路', '185', '', '“八路一岛”养护—东风路', 1, 1, 'admin', 9, '/index.php?c=show&id=103', 0, 0, '10.50.0.40', 1594432231, 1594695122, 0, 0.00, 0);
INSERT INTO `dr_1_photo` VALUES (104, 60, '陈家祠绿化养护', '187', '陈家祠绿化养护', '陈家祠绿化养护', 1, 1, 'admin', 9, '/index.php?c=show&id=104', 0, 0, '10.50.0.40', 1594432500, 1594695132, 0, 0.00, 0);
INSERT INTO `dr_1_photo` VALUES (105, 60, '大学城养护', '189', '大学城养护', '大学城养护', 1, 1, 'admin', 9, '/index.php?c=show&id=105', 0, 0, '10.50.0.40', 1594432538, 1594695145, 0, 0.00, 0);
INSERT INTO `dr_1_photo` VALUES (106, 60, '流花湖养护', '191', '流花湖养护', '流花湖养护', 1, 1, 'admin', 9, '/index.php?c=show&id=106', 0, 0, '10.50.0.40', 1594432578, 1594695175, 0, 0.00, 0);
INSERT INTO `dr_1_photo` VALUES (107, 60, '烈士陵园养护', '193', '烈士陵园养护', '烈士陵园养护', 1, 1, 'admin', 9, '/index.php?c=show&id=107', 0, 0, '10.50.0.40', 1594432610, 1594695155, 0, 0.00, 0);
INSERT INTO `dr_1_photo` VALUES (108, 60, '“八路一岛”养护——科韵路', '195', '“八路一岛”养护——科韵路', '“八路一岛”养护——科韵路', 1, 1, 'admin', 9, '/index.php?c=show&id=108', 0, 0, '10.50.0.40', 1594432647, 1594695114, 0, 0.00, 0);
INSERT INTO `dr_1_photo` VALUES (109, 60, '园林绿化养护', '197', '园林绿化养护', '园林绿化养护', 1, 1, 'admin', 9, '/index.php?c=show&id=109', 0, 0, '10.50.0.40', 1594432675, 1594695083, 0, 0.00, 0);
INSERT INTO `dr_1_photo` VALUES (110, 62, '陈田和黄竹塱苗木基地', '199', '陈田和黄竹塱苗木基地', '陈田和黄竹塱苗木基地', 1, 1, 'admin', 9, '/index.php?c=show&id=110', 0, 0, '10.50.0.40', 1594432733, 1594695187, 0, 0.00, 0);
INSERT INTO `dr_1_photo` VALUES (111, 62, '派潭苗木生产基地', '201', '派潭苗木生产基地', '派潭苗木生产基地', 1, 1, 'admin', 9, '/index.php?c=show&id=111', 0, 0, '10.50.0.40', 1594433075, 1594695636, 0, 0.00, 0);
INSERT INTO `dr_1_photo` VALUES (112, 62, '增城林场苗木基地', '203', '增城林场苗木基地', '增城林场苗木基地', 1, 1, 'admin', 9, '/index.php?c=show&id=112', 0, 0, '10.50.0.40', 1594433135, 1594695207, 0, 0.00, 0);
INSERT INTO `dr_1_photo` VALUES (113, 62, '石基园艺场', '204', '石基园艺场', '石基园艺场', 1, 1, 'admin', 9, '/index.php?c=show&id=113', 0, 0, '10.50.0.40', 1594433170, 1594694795, 0, 0.00, 0);
INSERT INTO `dr_1_photo` VALUES (114, 43, '苗木生产', '206', '苗木生产', '苗木生产', 1, 1, 'admin', 9, '/index.php?c=show&id=114', 0, 0, '10.50.0.40', 1594433198, 1594695103, 0, 0.00, 0);

-- ----------------------------
-- Table structure for dr_1_photo_category
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_photo_category`;
CREATE TABLE `dr_1_photo_category`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级id',
  `pids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所有上级id',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '栏目名称',
  `dirname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '上级目录',
  `child` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否有下级',
  `childids` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '下级所有id',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '栏目图片',
  `show` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否显示',
  `setting` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性配置',
  `displayorder` mediumint(8) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `show`(`show`) USING BTREE,
  INDEX `module`(`pid`, `displayorder`, `id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '栏目表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_photo_category_data
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_photo_category_data`;
CREATE TABLE `dr_1_photo_category_data`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` int(3) UNSIGNED NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '栏目模型表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for dr_1_photo_category_data_0
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_photo_category_data_0`;
CREATE TABLE `dr_1_photo_category_data_0`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '栏目模型表的附表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for dr_1_photo_comment
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_photo_comment`;
CREATE TABLE `dr_1_photo_comment`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `cid` int(10) UNSIGNED NOT NULL COMMENT '关联id',
  `cuid` int(10) UNSIGNED NOT NULL COMMENT '关联uid',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `orderid` bigint(18) UNSIGNED NOT NULL COMMENT '订单id',
  `uid` mediumint(8) UNSIGNED NULL DEFAULT 0 COMMENT '评论者ID',
  `author` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论者账号',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '评论内容',
  `support` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '支持数',
  `oppose` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '反对数',
  `avgsort` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '平均分',
  `sort1` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort2` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort3` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort4` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort5` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort6` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort7` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort8` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort9` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `reply` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '回复id',
  `in_reply` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否存在回复',
  `status` smallint(1) UNSIGNED NULL DEFAULT 0 COMMENT '审核状态',
  `inputip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '录入时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `orderid`(`orderid`) USING BTREE,
  INDEX `reply`(`reply`) USING BTREE,
  INDEX `support`(`support`) USING BTREE,
  INDEX `oppose`(`oppose`) USING BTREE,
  INDEX `avgsort`(`avgsort`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `aa`(`cid`, `status`, `inputtime`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '评论内容表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_photo_data_0
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_photo_data_0`;
CREATE TABLE `dr_1_photo_data_0`  (
  `id` int(10) UNSIGNED NOT NULL,
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` smallint(5) UNSIGNED NOT NULL COMMENT '栏目id',
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `images` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图片',
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内容附表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dr_1_photo_data_0
-- ----------------------------
INSERT INTO `dr_1_photo_data_0` VALUES (58, 1, 43, '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/159437460124f02c.jpg&quot; title=&quot;bhpx_hhzz_01&quot; alt=&quot;bhpx_hhzz_01&quot;/&gt;&lt;/p&gt;', '{\"file\":[\"64\"],\"title\":[\"bhpx_2016_01\"],\"description\":[\"\"]}');
INSERT INTO `dr_1_photo_data_0` VALUES (60, 1, 43, '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/1594373645650247.jpg&quot; style=&quot;&quot; title=&quot;bhpx_hrfw2_01&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/15943736469beb91.jpg&quot; style=&quot;&quot; title=&quot;bhpx_hrfw2_02&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/159437364642101c.jpg&quot; style=&quot;&quot; title=&quot;bhpx_hrfw2_03&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '{\"file\":[\"73\",\"74\",\"75\",\"76\"],\"title\":[\"bhpx_hrfw2_02\",\"bhpx_hrfw2_01\",\"bhpx_hrfw2_03\",\"bhpx_hrfw2_04\"],\"description\":[\"\",\"\",\"\",\"\"]}');
INSERT INTO `dr_1_photo_data_0` VALUES (61, 1, 43, '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/159435843248e9a2.jpg&quot; style=&quot;&quot; title=&quot;bhpx_jjchsjj_01&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 12px; white-space: normal; line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 12px; white-space: normal; line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px;&quot;&gt;旧机场时花种植基地位于广州市飞翔公园内,占地仅约18亩，但却担负起所有时花布置项目的时花供应。在生产上通过优化种植基质配比、合理安排种植计划、加强田间管理等手段，着力提高时花质量，全年以种植夏堇、香彩雀、孔雀草、皇帝菊、千日红、大花海棠、四季海棠、百日草、金鱼草、美女樱等为主。&lt;/span&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/159435843338fffa.jpg&quot; style=&quot;&quot; title=&quot;bhpx_jjchsjj_02&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/1594358433a68485.jpg&quot; style=&quot;&quot; title=&quot;bhpx_jjchsjj_03&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/15943584337f4f0d.jpg&quot; style=&quot;&quot; title=&quot;bhpx_jjchsjj_05&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/15943584338e8a02.jpg&quot; style=&quot;&quot; title=&quot;bhpx_jjchsjj_04&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '');
INSERT INTO `dr_1_photo_data_0` VALUES (62, 1, 43, '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/159437349047c69e.jpg&quot; style=&quot;&quot; title=&quot;bhpx_jcbhj_01&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/159437349056a2c1.jpg&quot; style=&quot;&quot; title=&quot;bhpx_jcbhj_02&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/1594373491268376.jpg&quot; style=&quot;&quot; title=&quot;bhpx_jcbhj_03&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '{\"file\":[\"83\",\"84\",\"85\"],\"title\":[\"bhpx_jcbhj_02\",\"bhpx_jcbhj_01\",\"bhpx_jcbhj_03\"],\"description\":[\"\",\"\",\"\"]}');
INSERT INTO `dr_1_photo_data_0` VALUES (63, 1, 43, '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/159437345052b729.jpg&quot; style=&quot;&quot; title=&quot;bhpx_hyzl_02&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/159437345012dd0f.jpg&quot; style=&quot;&quot; title=&quot;bhpx_hyzl_01&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/1594373451cb4996.jpg&quot; style=&quot;&quot; title=&quot;bhpx_hyzl_03&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/1594373451453bc1.jpg&quot; style=&quot;&quot; title=&quot;bhpx_hyzl_04&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '{\"file\":[\"97\",\"98\",\"99\",\"100\"],\"title\":[\"bhpx_hyzl_04\",\"bhpx_hyzl_01\",\"bhpx_hyzl_03\",\"bhpx_hyzl_02\"],\"description\":[\"\",\"\",\"\",\"\"]}');
INSERT INTO `dr_1_photo_data_0` VALUES (64, 1, 43, '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/15943733427db178.jpg&quot; style=&quot;&quot; title=&quot;bhpx_jcgshhbzxm_03.JPG&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/1594373342b5c83c.jpg&quot; style=&quot;&quot; title=&quot;bhpx_jcgshhbzxm_01.JPG&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/15943733433750f4.jpg&quot; style=&quot;&quot; title=&quot;bhpx_jcgshhbzxm_02.JPG&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '{\"file\":[\"102\",\"103\",\"104\"],\"title\":[\"bhpx_jcgshhbzxm_01\",\"bhpx_jcgshhbzxm_03\",\"bhpx_jcgshhbzxm_02\"],\"description\":[\"\",\"\",\"\"]}');
INSERT INTO `dr_1_photo_data_0` VALUES (65, 1, 43, '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/15943733053cc598.jpg&quot; title=&quot;bhpx_2016_05&quot; alt=&quot;bhpx_2016_05&quot;/&gt;&lt;/p&gt;', '{\"file\":[\"106\"],\"title\":[\"bhpx_2016_05\"],\"description\":[\"\"]}');
INSERT INTO `dr_1_photo_data_0` VALUES (66, 1, 43, '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/1594373263a6ed6c.jpg&quot; title=&quot;bhpx_yy_02&quot; alt=&quot;bhpx_yy_02&quot;/&gt;&lt;/p&gt;', '{\"file\":[\"108\"],\"title\":[\"bhpx_yy_02\"],\"description\":[\"\"]}');
INSERT INTO `dr_1_photo_data_0` VALUES (67, 1, 43, '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/15943726551dad8b.jpg&quot; title=&quot;bhpx_hhkp_01&quot; alt=&quot;bhpx_hhkp_01&quot;/&gt;&lt;/p&gt;', '{\"file\":[\"110\"],\"title\":[\"bhpx_hhkp_01\"],\"description\":[\"\"]}');
INSERT INTO `dr_1_photo_data_0` VALUES (68, 1, 43, '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/1594372976fd02d2.jpg&quot; style=&quot;&quot; title=&quot;bhpx_zsjnt_01.JPG&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/15943729767f0857.jpg&quot; style=&quot;&quot; title=&quot;bhpx_zsjnt_02.JPG&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '{\"file\":[\"93\",\"94\"],\"title\":[\"bhpx_zsjnt_01\",\"bhpx_zsjnt_02\"],\"description\":[\"\",\"\"]}');
INSERT INTO `dr_1_photo_data_0` VALUES (69, 1, 43, '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/15943729435586de.jpg&quot; style=&quot;&quot; title=&quot;bhpx_hhzs_01.JPG&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/15943729437398a3.jpg&quot; style=&quot;&quot; title=&quot;bhpx_hhzs_02.JPG&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/1594372943966e0b.jpg&quot; style=&quot;&quot; title=&quot;bhpx_hhzs_03&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/1594372943c87f24.jpg&quot; style=&quot;&quot; title=&quot;bhpx_hhzs_04.JPG&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/159437294466b758.jpg&quot; style=&quot;&quot; title=&quot;bhpx_hhzs_05.JPG&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '{\"file\":[\"87\",\"88\",\"89\",\"90\",\"91\"],\"title\":[\"bhpx_hhzs_03\",\"bhpx_hhzs_05\",\"bhpx_hhzs_01\",\"bhpx_hhzs_02\",\"bhpx_hhzs_04\"],\"description\":[\"\",\"\",\"\",\"\",\"\"]}');
INSERT INTO `dr_1_photo_data_0` VALUES (90, 1, 58, '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/1594431365a3650f.jpg&quot; title=&quot;09&quot; alt=&quot;09&quot;/&gt;&lt;/p&gt;', NULL);
INSERT INTO `dr_1_photo_data_0` VALUES (91, 1, 58, '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/1594431650f68bed.jpg&quot; title=&quot;11&quot; alt=&quot;11&quot;/&gt;&lt;/p&gt;', NULL);
INSERT INTO `dr_1_photo_data_0` VALUES (92, 1, 58, '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/159443168835e13a.jpg&quot; title=&quot;10&quot; alt=&quot;10&quot;/&gt;&lt;/p&gt;', NULL);
INSERT INTO `dr_1_photo_data_0` VALUES (93, 1, 58, '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/159443176450574c.jpg&quot; title=&quot;12&quot; alt=&quot;12&quot;/&gt;&lt;/p&gt;', NULL);
INSERT INTO `dr_1_photo_data_0` VALUES (94, 1, 58, '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/15944318023036d8.jpg&quot; title=&quot;13&quot; alt=&quot;13&quot;/&gt;&lt;/p&gt;', NULL);
INSERT INTO `dr_1_photo_data_0` VALUES (95, 1, 58, '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/15944318457364a3.jpg&quot; title=&quot;08&quot; alt=&quot;08&quot;/&gt;&lt;/p&gt;', NULL);
INSERT INTO `dr_1_photo_data_0` VALUES (96, 1, 58, '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/1594431879e56807.jpg&quot; title=&quot;07&quot; alt=&quot;07&quot;/&gt;&lt;/p&gt;', NULL);
INSERT INTO `dr_1_photo_data_0` VALUES (97, 1, 58, '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/159443192256e1b8.jpg&quot; title=&quot;03&quot; alt=&quot;03&quot;/&gt;&lt;/p&gt;', NULL);
INSERT INTO `dr_1_photo_data_0` VALUES (98, 1, 43, '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/1594431969059a09.jpg&quot; title=&quot;01&quot; alt=&quot;01&quot;/&gt;&lt;/p&gt;', NULL);
INSERT INTO `dr_1_photo_data_0` VALUES (99, 1, 58, '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/1594432077e1fffe.jpg&quot; title=&quot;04&quot; alt=&quot;04&quot;/&gt;&lt;/p&gt;', NULL);
INSERT INTO `dr_1_photo_data_0` VALUES (100, 1, 58, '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/159443213567bc83.jpg&quot; title=&quot;05&quot; alt=&quot;05&quot;/&gt;&lt;/p&gt;', NULL);
INSERT INTO `dr_1_photo_data_0` VALUES (101, 1, 58, '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/1594432178f57dcc.jpg&quot; title=&quot;06&quot; alt=&quot;06&quot;/&gt;&lt;/p&gt;', NULL);
INSERT INTO `dr_1_photo_data_0` VALUES (102, 1, 58, '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/1594432227b6f3fa.jpg&quot; title=&quot;02&quot; alt=&quot;02&quot;/&gt;&lt;/p&gt;', NULL);
INSERT INTO `dr_1_photo_data_0` VALUES (103, 1, 60, '&lt;div class=&quot;xn_c_prodv_60_wrap&quot; style=&quot;font-size: 12px; white-space: normal; margin: 0px 0px 18px; padding: 0px; width: 1200px; position: relative; height: 64px; overflow: hidden; font-family: &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&lt;div class=&quot;xn_c_prodv_60_name&quot; style=&quot;margin: 0px; padding: 0px; position: absolute; left: 0px; top: 0px; font-size: 20px; width: 1200px; height: 34px; line-height: 34px; overflow: hidden; text-align: center;&quot;&gt;&lt;span class=&quot;xn_c_prodv_60_name2&quot;&gt;“八路一岛”养护—东风路&lt;/span&gt;&lt;/div&gt;&lt;div class=&quot;xn_c_prodv_60_click&quot; style=&quot;margin: 0px; padding: 0px; position: absolute; left: 0px; top: 44px; width: 20px; height: 2px; background: rgb(0, 0, 0); overflow: hidden;&quot;&gt;&lt;span class=&quot;xn_c_prodv_60_click1&quot;&gt;点击次数&lt;/span&gt;&lt;span class=&quot;xn_c_prodv_60_click2&quot;&gt;&lt;/span&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;xn_c_prodv_4_wrap&quot; style=&quot;font-size: 12px; white-space: normal; margin: 0px 0px 30px; padding: 0px; width: 1200px; line-height: 24px; overflow: hidden; font-family: &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&lt;div class=&quot;xn_c_prodv_4_neirong&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/1594433709aa81da.jpg&quot; title=&quot;CgAGTFlQ95uAZRlLAAUu114mCNQ763.JPG&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px;&quot;&gt;“八路一岛”养护——东风路是广州市东西走向的中心道路，绿化类型包括行道树、分车带绿化带、街傍绿地。行道树以白兰、石粟、蝴蝶果、细叶榕等为主；中间分车带绿化带采取规则种植，以新优开花灌木为主，如多花红千层、红花银桦、花叶三角梅（盆景桩），景观质量高。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 2em; text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/1594433709b8c771.jpg&quot; title=&quot;CgAGS1lQ_36AGLsyAAOMck703QA340&quot;/&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/159443370991c7fb.jpg&quot; title=&quot;CgAGTFlQ97SAWqbUAAOmW2KUNY8154.JPG&quot; style=&quot;font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 15px;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', NULL);
INSERT INTO `dr_1_photo_data_0` VALUES (104, 1, 60, '&lt;div class=&quot;xn_c_prodv_60_wrap&quot; style=&quot;margin: 0px 0px 18px; padding: 0px; width: 1200px; position: relative; height: 64px; overflow: hidden; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 12px; white-space: normal;&quot;&gt;&lt;div class=&quot;xn_c_prodv_60_name&quot; style=&quot;margin: 0px; padding: 0px; position: absolute; left: 0px; top: 0px; font-size: 20px; width: 1200px; height: 34px; line-height: 34px; overflow: hidden; text-align: center;&quot;&gt;&lt;span class=&quot;xn_c_prodv_60_name2&quot;&gt;陈家祠绿化养护&lt;/span&gt;&lt;/div&gt;&lt;div class=&quot;xn_c_prodv_60_click&quot; style=&quot;margin: 0px; padding: 0px; position: absolute; left: 0px; top: 44px; width: 20px; height: 2px; background: rgb(0, 0, 0); overflow: hidden;&quot;&gt;&lt;span class=&quot;xn_c_prodv_60_click1&quot;&gt;点击次数&lt;/span&gt;&lt;span class=&quot;xn_c_prodv_60_click2&quot;&gt;&lt;/span&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;xn_c_prodv_4_wrap&quot; style=&quot;margin: 0px 0px 30px; padding: 0px; width: 1200px; line-height: 24px; font-size: 12px; overflow: hidden; font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal;&quot;&gt;&lt;div class=&quot;xn_c_prodv_4_neirong&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center;&quot;&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/159443469367817d.jpg&quot; title=&quot;CgAGS1lRAbKAWqR-AAPOWOcjECU724&quot; alt=&quot;CgAGS1lRAbKAWqR-AAPOWOcjECU724&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px;&quot;&gt;陈家祠绿化养护项目包括对陈家祠庭院及周边广场的绿化管养工作，总养护面积约20000平方米。陈家祠在植物造景上独具匠心，与庭院相互映衬，形成“园中院”、“院中园”的空间效果。周边绿化广场，在建设风格、建构筑物造型、景观设计与用材上与陈家祠建筑特色相呼应。项目的管养不仅注重植物的观赏性，更强调其文化内涵以及防尘、隔音、净化空气等功能性，用丰富多彩的植物语言为市民营造出清新、优雅的城市文化空间。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 2em; text-indent: 2em;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/15944347159a664a.jpg&quot; style=&quot;&quot; title=&quot;CgAGS1lRAc-ADN-dAATWrJ_L-5I971.JPG&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/1594434715426192.jpg&quot; style=&quot;&quot; title=&quot;CgAGS1lRAmeAfJaAAAQeyA0LrYg433&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', NULL);
INSERT INTO `dr_1_photo_data_0` VALUES (105, 1, 60, '&lt;div class=&quot;xn_c_prodv_60_wrap&quot; style=&quot;margin: 0px 0px 18px; padding: 0px; width: 1200px; position: relative; height: 64px; overflow: hidden; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 12px; white-space: normal;&quot;&gt;&lt;div class=&quot;xn_c_prodv_60_name&quot; style=&quot;margin: 0px; padding: 0px; position: absolute; left: 0px; top: 0px; font-size: 20px; width: 1200px; height: 34px; line-height: 34px; overflow: hidden; text-align: center;&quot;&gt;&lt;span class=&quot;xn_c_prodv_60_name2&quot;&gt;大学城养护&lt;/span&gt;&lt;/div&gt;&lt;div class=&quot;xn_c_prodv_60_click&quot; style=&quot;margin: 0px; padding: 0px; position: absolute; left: 0px; top: 44px; width: 20px; height: 2px; background: rgb(0, 0, 0); overflow: hidden;&quot;&gt;&lt;span class=&quot;xn_c_prodv_60_click1&quot;&gt;点击次数&lt;/span&gt;&lt;span class=&quot;xn_c_prodv_60_click2&quot;&gt;&lt;/span&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;xn_c_prodv_4_wrap&quot; style=&quot;margin: 0px 0px 30px; padding: 0px; width: 1200px; line-height: 24px; font-size: 12px; overflow: hidden; font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal;&quot;&gt;&lt;div class=&quot;xn_c_prodv_4_neirong&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center;&quot;&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/15944347787e7a71.jpg&quot; title=&quot;CgAGS1lRA4OABMf_AAPst8SKWXM872&quot; alt=&quot;CgAGS1lRA4OABMf_AAPst8SKWXM872&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px;&quot;&gt;广州大学城绿化养护项目，该项目养护绿地总面积为47万平方米，其中包括林地和市政道路绿化带。标段内乔灌木合计超10万多株，草坪地被面积超过30万平方米。在五个养护标段当中，养护面积最大、样板路段最多。&lt;/span&gt;&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/15944325757b240c.jpg&quot; title=&quot;CgAGS1lRA_iAZb2rAALaGnbAM-Q609&quot; alt=&quot;CgAGS1lRA_iAZb2rAALaGnbAM-Q609&quot;/&gt;&lt;br/&gt;&lt;/p&gt;', NULL);
INSERT INTO `dr_1_photo_data_0` VALUES (106, 1, 60, '&lt;div class=&quot;xn_c_prodv_60_wrap&quot; style=&quot;margin: 0px 0px 18px; padding: 0px; width: 1200px; position: relative; height: 64px; overflow: hidden; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 12px; white-space: normal;&quot;&gt;&lt;div class=&quot;xn_c_prodv_60_name&quot; style=&quot;margin: 0px; padding: 0px; position: absolute; left: 0px; top: 0px; font-size: 20px; width: 1200px; height: 34px; line-height: 34px; overflow: hidden; text-align: center;&quot;&gt;&lt;span class=&quot;xn_c_prodv_60_name2&quot;&gt;流花湖养护&lt;/span&gt;&lt;/div&gt;&lt;div class=&quot;xn_c_prodv_60_click&quot; style=&quot;margin: 0px; padding: 0px; position: absolute; left: 0px; top: 44px; width: 20px; height: 2px; background: rgb(0, 0, 0); overflow: hidden;&quot;&gt;&lt;span class=&quot;xn_c_prodv_60_click1&quot;&gt;点击次数&lt;/span&gt;&lt;span class=&quot;xn_c_prodv_60_click2&quot;&gt;&lt;/span&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;xn_c_prodv_4_wrap&quot; style=&quot;margin: 0px 0px 30px; padding: 0px; width: 1200px; line-height: 24px; font-size: 12px; overflow: hidden; font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal;&quot;&gt;&lt;div class=&quot;xn_c_prodv_4_neirong&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center;&quot;&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/1594434914781b1b.jpg&quot; title=&quot;CgAGS1lQ-UiADXzeAAOfsFinm70340&quot; alt=&quot;CgAGS1lQ-UiADXzeAAOfsFinm70340&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px;&quot;&gt;广州市流花湖公园绿化养护项目，主要包括乔灌木、地被、草坪等所有绿化植物的淋水、施肥、病虫害防治、修枝整形、干叶的修剪、松土、除杂、补种、调整、日常时花摆设、绿地垃圾清理及水池、溪涧的清洗等。该项目获得“广东省绿化养护优良样板工程”金奖。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px;&quot;&gt;&amp;nbsp;&amp;nbsp;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/15944349249e31dd.jpg&quot; title=&quot;CgAGS1lQ-b-AfF-4AAR5yEbp1D0428&quot; alt=&quot;CgAGS1lQ-b-AfF-4AAR5yEbp1D0428&quot;/&gt;&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', NULL);
INSERT INTO `dr_1_photo_data_0` VALUES (107, 1, 60, '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/15944326435514c8.jpg&quot; title=&quot;CgAGS1lRBO-AfP7kAALg83fQS-0352&quot; alt=&quot;CgAGS1lRBO-AfP7kAALg83fQS-0352&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; text-indent: 24px;&quot;&gt;广州起义烈士陵园绿化养护项目，主要包括养护区域内的乔木、灌木、棕榈植物、竹、地被植物、水生植物、藤本植物、草地、荫生观叶植物等，其中包括古树和名木的日常管理养护以及配合公园各大活动的摆花布置、布展等工作。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; text-indent: 24px;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/159443483528d696.jpg&quot; style=&quot;&quot; title=&quot;CgAGS1lRBM-ACCd9AARLYBQtMww863&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/15944348357974a2.jpg&quot; style=&quot;&quot; title=&quot;CgAGS1lRBLmAAvHzAAST5Mlq0y8610&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; text-indent: 24px;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;br/&gt;&lt;/p&gt;', NULL);
INSERT INTO `dr_1_photo_data_0` VALUES (108, 1, 60, '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;span style=&quot;font-size: 20px;&quot;&gt;“八路一岛”养护——科韵路&lt;/span&gt;&lt;br/&gt;&lt;/p&gt;&lt;div class=&quot;xn_c_prodv_60_wrap&quot; style=&quot;margin: 0px 0px 18px; padding: 0px; width: 1200px; position: relative; height: 64px; overflow: hidden;&quot;&gt;&lt;div class=&quot;xn_c_prodv_60_click&quot; style=&quot;margin: 0px; padding: 0px; position: absolute; left: 0px; top: 44px; width: 20px; height: 2px; background: rgb(0, 0, 0); overflow: hidden;&quot;&gt;&lt;span class=&quot;xn_c_prodv_60_click1&quot;&gt;点击次数&lt;/span&gt;&lt;span class=&quot;xn_c_prodv_60_click2&quot;&gt;&lt;/span&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;xn_c_prodv_4_wrap&quot; style=&quot;margin: 0px 0px 30px; padding: 0px; width: 1200px; line-height: 24px; font-size: 12px; overflow: hidden;&quot;&gt;&lt;div class=&quot;xn_c_prodv_4_neirong&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px;&quot;&gt;&amp;nbsp;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/15944338311f5590.jpg&quot; title=&quot;CgAGS1lQ_MyAbs1gAAKL_o_f8cA421.JPG&quot; alt=&quot;CgAGS1lQ_MyAbs1gAAKL_o_f8cA421.JPG&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 2em; text-indent: 43px;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px;&quot;&gt;“八路一岛”养护——科韵路（广园快速干线—仑头收费站）于快速路两傍绿化，部分路段为边坡绿化，绿化结构以乔、灌、地被、草坪组合，乔木主要是抗污能力强的树种如垂叶榕、细叶榄仁、黄金香柳；灌木以红继木、巴西野牡丹、双夹槐等。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', NULL);
INSERT INTO `dr_1_photo_data_0` VALUES (109, 1, 60, '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/1594432730146334.jpg&quot; title=&quot;CgAGS1lSK7GAdQRfAAQHbzdEEEA933&quot; alt=&quot;CgAGS1lSK7GAdQRfAAQHbzdEEEA933&quot;/&gt;&lt;/p&gt;', NULL);
INSERT INTO `dr_1_photo_data_0` VALUES (110, 1, 62, '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/159443307248ce54.jpg&quot; title=&quot;CgAGS1lRuyqANn80AAVXXBiZd1E387&quot; alt=&quot;CgAGS1lRuyqANn80AAVXXBiZd1E387&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; text-indent: 24px;&quot;&gt;陈田花园苗木生产基地位于白云区黄石东路陈田村旁，占地约20亩，黄竹塱苗木生产基地位于广州市从化流溪河闸口村，占地约45亩,两基地均主要以种植宫粉紫荆开花乔木为主。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; text-indent: 24px;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/159443537230faf2.jpg&quot; style=&quot;&quot; title=&quot;CgAGS1lRuvWABhuKAASKww_zWh0220&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/1594435372c2da7a.jpg&quot; style=&quot;&quot; title=&quot;CgAGS1lRuw6AUDYcAAUbZ24ouLw383&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px; text-indent: 24px;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;br/&gt;&lt;/p&gt;', NULL);
INSERT INTO `dr_1_photo_data_0` VALUES (111, 1, 62, '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/1594433116a7cd1c.jpg&quot; title=&quot;CgAGS1lRuWyAVR-gAAPVrtLYYG0869&quot; alt=&quot;CgAGS1lRuWyAVR-gAAPVrtLYYG0869&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 12px; white-space: normal;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 12px; white-space: normal; line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px;&quot;&gt;派潭苗木生产基地位于增城市派潭镇汉湖村内，占地约45亩地，用于引进种植假植宫粉紫荆、红花紫荆、黄花风铃木、黄槐、美丽异木棉等开花乔木，平均每年约引进6000株。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/1594435487475d9d.jpg&quot; style=&quot;&quot; title=&quot;CgAGS1lRuOyAantVAAUTHRadk2k728&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/1594435487240aec.jpg&quot; style=&quot;&quot; title=&quot;CgAGS1lRuQCAWN9GAAVWzf-bPzQ950&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', NULL);
INSERT INTO `dr_1_photo_data_0` VALUES (112, 1, 62, '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/1594435618609674.jpg&quot; title=&quot;CgAGTFlREWSADYM6AAOne4x609I294&quot; alt=&quot;CgAGTFlREWSADYM6AAOne4x609I294&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 12px; white-space: normal;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 12px; white-space: normal; line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px;&quot;&gt;增城林场苗木生产基地位于大达冚工区山角冚，占地150亩，共种植乔木8000多株，主要以宫粉紫荆、秋枫、黄花风铃木、蓝花楹、山乌桕、红花荷等开花乔木为主。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 12px; white-space: normal; line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px;&quot;&gt;&lt;/span&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/15944355736fa117.jpg&quot; style=&quot;&quot; title=&quot;CgAGTFlREaSAL7k-AAUSB6SmueU699&quot;/&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/1594435573cff44a.jpg&quot; style=&quot;&quot; title=&quot;CgAGTFlREcCAeT6jAAREX6aNQWg285&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/15944355731a4d19.jpg&quot; style=&quot;&quot; title=&quot;CgAGTFlREWSADYM6AAOne4x609I294&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/15944355736df14b.jpg&quot; style=&quot;&quot; title=&quot;CgAGTFlREZCASohwAAM0WmiGC0c409.JPG&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', NULL);
INSERT INTO `dr_1_photo_data_0` VALUES (113, 1, 62, '&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/15944356681766de.jpg&quot; title=&quot;CgAGS1lRtc6Ab9jiAARVWnyxP_o394&quot; alt=&quot;CgAGS1lRtc6Ab9jiAARVWnyxP_o394&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 12px; white-space: normal;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 12px; white-space: normal; line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px;&quot;&gt;石基园艺场是广州市的大型苗木生产基地之一，基地面积270亩，其中绿化苗木种植地220亩，时花种植基地50亩，经营品种100余个，集园林绿化苗木的生产、销售，售后技术服务于一体。以研究、推广彩叶树种、开花乔木类、花灌木、地被类、节日草本花卉及盆栽型小菊为重点。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 12px; white-space: normal; line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px;&quot;&gt;苗圃按使用功能分为六大功能区：一是综合管理与科研开发区；二是营养繁殖区；三是移植区；四是容器化育苗生产区；五是园林植物良种苗木收集、保存及试验示范区；六是时花生产区。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 12px; white-space: normal; line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px;&quot;&gt;&lt;/span&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/159443570303e0ac.jpg&quot; style=&quot;&quot; title=&quot;CgAGS1lRtg6AazLGAASb9PyMbqQ518&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/15944357032eaeb5.jpg&quot; style=&quot;&quot; title=&quot;CgAGS1lRtp-APsvAAAQfFRwpcRg445&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/1594435703cc7801.jpg&quot; style=&quot;&quot; title=&quot;CgAGS1lRtnyAM9UpAASRIzGKbwk427.JPG&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/1594435703bcca9f.jpg&quot; style=&quot;&quot; title=&quot;CgAGS1lRtrmAD0J7AAQ3m9_VBwo400.JPG&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', NULL);
INSERT INTO `dr_1_photo_data_0` VALUES (114, 1, 43, '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/159443322250d997.jpg&quot; title=&quot;CgAGS1lRt6WAL6_HAARsK4vQ6p8671&quot; alt=&quot;CgAGS1lRt6WAL6_HAARsK4vQ6p8671&quot;/&gt;&lt;/p&gt;', NULL);
INSERT INTO `dr_1_photo_data_0` VALUES (56, 1, 43, '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/15943747333b4840.jpg&quot; title=&quot;bhpx_hhbz_04.JPG&quot; alt=&quot;bhpx_hhbz_04.JPG&quot;/&gt;&lt;/p&gt;', '{\"file\":[\"52\"],\"title\":[\"bhpx_2016_03\"],\"description\":[\"\"]}');
INSERT INTO `dr_1_photo_data_0` VALUES (59, 1, 43, '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/1594356842bdc3d4.jpg&quot; style=&quot;&quot; title=&quot;bhpx_sjhsjd_01&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 12px; white-space: normal; line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px;&quot;&gt;番禺石碁时花种植基地位于广州市番禺区石碁镇前锋村广州市花木公司园艺场内，该园艺场是广州市的大型苗木生产基地之一，基地面积270亩，其中绿化苗木种植地220亩，时花种植基地50亩，经营品种100余个，集园林绿化苗木的生产、销售，售后技术服务于一体。以研究、推广彩叶树种、开花乔木类、花灌木、地被类、节日草本花卉及盆栽型小菊为重点。苗圃按使用功能分为六大功能区：一是综合管理与科研开发区；二是营养繁殖区；三是移植区；四是容器化育苗生产区；五是园林植物良种苗木收集、保存及试验示范区；六是时花生产区。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 12px; white-space: normal; line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px;&quot;&gt;通过第十三届财富论坛的契机，公司成立时花科研基地，搭建面积为12768㎡的时花种植温室大棚，进一步扩展时花品种、引进观赏草种植。通过系统研究野花组合种类、配比，及其播种、管理技术，研究开发具有岭南特色的生态自然野花组合类型，为今后广州地区实施野花组合应用提供理论依据，开辟广州地区园林绿化建设新方向。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 12px; white-space: normal; line-height: 2em; text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 16px;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/159435684370baab.jpg&quot; style=&quot;&quot; title=&quot;bhpx_sjhsjd_02&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/15943568433cd754.jpg&quot; style=&quot;&quot; title=&quot;bhpx_sjhsjd_03.JPG&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/1594356843a89dfe.jpg&quot; style=&quot;&quot; title=&quot;bhpx_sjhsjd_04&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/1594356843c1abb3.jpg&quot; style=&quot;&quot; title=&quot;bhpx_sjhsjd_05&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '{\"file\":[\"71\"],\"title\":[\"bhpx_hhbz_01\"],\"description\":[\"\"]}');
INSERT INTO `dr_1_photo_data_0` VALUES (57, 1, 43, '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/15943746593e1a05.jpg&quot; title=&quot;bhpx_hhfw_05&quot; alt=&quot;bhpx_hhfw_05&quot;/&gt;&lt;/p&gt;', '{\"file\":[\"58\"],\"title\":[\"bhpx_2016_04\"],\"description\":[\"\"]}');

-- ----------------------------
-- Table structure for dr_1_photo_draft
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_photo_draft`;
CREATE TABLE `dr_1_photo_draft`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cid` int(10) UNSIGNED NOT NULL COMMENT '内容id',
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '具体内容',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内容草稿表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dr_1_photo_draft
-- ----------------------------
INSERT INTO `dr_1_photo_draft` VALUES (1, 57, 1, 43, '{\"content\":\"&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http:\\/\\/10.50.0.40\\/uploadfile\\/ueditor\\/image\\/202007\\/15943746593e1a05.jpg&quot; title=&quot;bhpx_hhfw_05&quot; alt=&quot;bhpx_hhfw_05&quot;\\/&gt;&lt;\\/p&gt;\",\"catid\":43,\"uid\":1,\"inputtime\":1594354355,\"updatetime\":1594694918,\"inputip\":\"10.50.0.40\",\"displayorder\":0,\"hits\":3,\"author\":\"admin\",\"title\":\"花卉服务\",\"thumb\":\"53\",\"keywords\":\"花卉服务\",\"description\":\"花卉服务\",\"status\":9,\"id\":57}', 1594694924);
INSERT INTO `dr_1_photo_draft` VALUES (2, 90, 1, 58, '{\"content\":\"&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http:\\/\\/10.50.0.40\\/uploadfile\\/ueditor\\/image\\/202007\\/1594431365a3650f.jpg&quot; title=&quot;09&quot; alt=&quot;09&quot;\\/&gt;&lt;\\/p&gt;\",\"catid\":58,\"uid\":1,\"inputtime\":1594431313,\"updatetime\":1594694946,\"inputip\":\"10.50.0.40\",\"displayorder\":0,\"hits\":1,\"author\":\"admin\",\"title\":\"广州大道改造工程\",\"thumb\":\"159\",\"keywords\":\"广州大道改造工程\",\"description\":\"广州大道改造工程\",\"status\":9,\"id\":90}', 1594694951);
INSERT INTO `dr_1_photo_draft` VALUES (3, 114, 1, 43, '{\"content\":\"&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http:\\/\\/10.50.0.40\\/uploadfile\\/ueditor\\/image\\/202007\\/159443322250d997.jpg&quot; title=&quot;CgAGS1lRt6WAL6_HAARsK4vQ6p8671&quot; alt=&quot;CgAGS1lRt6WAL6_HAARsK4vQ6p8671&quot;\\/&gt;&lt;\\/p&gt;\",\"catid\":43,\"uid\":1,\"inputtime\":1594433198,\"updatetime\":1594695097,\"inputip\":\"10.50.0.40\",\"displayorder\":0,\"hits\":1,\"author\":\"admin\",\"title\":\"苗木生产\",\"thumb\":\"206\",\"keywords\":\"苗木生产\",\"description\":\"苗木生产\",\"status\":9,\"id\":114}', 1594695101);

-- ----------------------------
-- Table structure for dr_1_photo_flag
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_photo_flag`;
CREATE TABLE `dr_1_photo_flag`  (
  `flag` tinyint(2) UNSIGNED NOT NULL DEFAULT 1 COMMENT '文档标记id',
  `id` int(10) UNSIGNED NOT NULL COMMENT '文档内容id',
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  INDEX `flag`(`flag`, `id`, `uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '标记表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for dr_1_photo_hits
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_photo_hits`;
CREATE TABLE `dr_1_photo_hits`  (
  `id` int(10) UNSIGNED NOT NULL COMMENT '文章id',
  `hits` int(10) UNSIGNED NOT NULL COMMENT '总点击数',
  `day_hits` int(10) UNSIGNED NOT NULL COMMENT '本日点击',
  `week_hits` int(10) UNSIGNED NOT NULL COMMENT '本周点击',
  `month_hits` int(10) UNSIGNED NOT NULL COMMENT '本月点击',
  `year_hits` int(10) UNSIGNED NOT NULL COMMENT '年点击量',
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `day_hits`(`day_hits`) USING BTREE,
  INDEX `week_hits`(`week_hits`) USING BTREE,
  INDEX `month_hits`(`month_hits`) USING BTREE,
  INDEX `year_hits`(`year_hits`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '时段点击量统计' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of dr_1_photo_hits
-- ----------------------------
INSERT INTO `dr_1_photo_hits` VALUES (36, 13, 1, 1, 1, 1);
INSERT INTO `dr_1_photo_hits` VALUES (28, 2, 1, 1, 1, 1);
INSERT INTO `dr_1_photo_hits` VALUES (30, 2, 1, 1, 1, 1);
INSERT INTO `dr_1_photo_hits` VALUES (25, 2, 1, 1, 1, 1);
INSERT INTO `dr_1_photo_hits` VALUES (55, 4, 4, 4, 4, 1);
INSERT INTO `dr_1_photo_hits` VALUES (35, 9, 1, 1, 1, 1);
INSERT INTO `dr_1_photo_hits` VALUES (33, 2, 1, 1, 1, 1);
INSERT INTO `dr_1_photo_hits` VALUES (31, 2, 1, 1, 1, 1);
INSERT INTO `dr_1_photo_hits` VALUES (29, 2, 1, 1, 1, 1);
INSERT INTO `dr_1_photo_hits` VALUES (56, 5, 5, 5, 5, 1);
INSERT INTO `dr_1_photo_hits` VALUES (58, 5, 5, 5, 5, 1);
INSERT INTO `dr_1_photo_hits` VALUES (57, 3, 3, 3, 3, 1);
INSERT INTO `dr_1_photo_hits` VALUES (59, 3, 3, 3, 3, 1);
INSERT INTO `dr_1_photo_hits` VALUES (61, 3, 3, 3, 3, 1);
INSERT INTO `dr_1_photo_hits` VALUES (62, 3, 3, 3, 3, 1);
INSERT INTO `dr_1_photo_hits` VALUES (69, 3, 3, 3, 3, 1);
INSERT INTO `dr_1_photo_hits` VALUES (68, 3, 3, 3, 3, 1);
INSERT INTO `dr_1_photo_hits` VALUES (64, 3, 3, 3, 3, 1);
INSERT INTO `dr_1_photo_hits` VALUES (67, 7, 7, 7, 7, 1);
INSERT INTO `dr_1_photo_hits` VALUES (66, 3, 3, 3, 3, 1);
INSERT INTO `dr_1_photo_hits` VALUES (65, 3, 3, 3, 3, 1);
INSERT INTO `dr_1_photo_hits` VALUES (63, 2, 2, 2, 2, 1);
INSERT INTO `dr_1_photo_hits` VALUES (60, 2, 2, 2, 2, 1);
INSERT INTO `dr_1_photo_hits` VALUES (70, 4, 4, 4, 4, 1);

-- ----------------------------
-- Table structure for dr_1_photo_index
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_photo_index`;
CREATE TABLE `dr_1_photo_index`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 115 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内容索引表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of dr_1_photo_index
-- ----------------------------
INSERT INTO `dr_1_photo_index` VALUES (101, 1, 58, 9, 1594695064);
INSERT INTO `dr_1_photo_index` VALUES (100, 1, 58, 9, 1594695055);
INSERT INTO `dr_1_photo_index` VALUES (99, 1, 58, 9, 1594695046);
INSERT INTO `dr_1_photo_index` VALUES (98, 1, 43, 9, 1594695038);
INSERT INTO `dr_1_photo_index` VALUES (97, 1, 58, 9, 1594695030);
INSERT INTO `dr_1_photo_index` VALUES (96, 1, 58, 9, 1594695020);
INSERT INTO `dr_1_photo_index` VALUES (95, 1, 58, 9, 1594695006);
INSERT INTO `dr_1_photo_index` VALUES (94, 1, 58, 9, 1594694996);
INSERT INTO `dr_1_photo_index` VALUES (93, 1, 58, 9, 1594694986);
INSERT INTO `dr_1_photo_index` VALUES (92, 1, 58, 9, 1594694975);
INSERT INTO `dr_1_photo_index` VALUES (91, 1, 58, 9, 1594694966);
INSERT INTO `dr_1_photo_index` VALUES (90, 1, 58, 9, 1594695575);
INSERT INTO `dr_1_photo_index` VALUES (55, 1, 43, 10, 1594352490);
INSERT INTO `dr_1_photo_index` VALUES (56, 1, 43, 9, 1594694933);
INSERT INTO `dr_1_photo_index` VALUES (57, 1, 43, 9, 1594694927);
INSERT INTO `dr_1_photo_index` VALUES (58, 1, 43, 9, 1594694903);
INSERT INTO `dr_1_photo_index` VALUES (59, 1, 43, 9, 1594694878);
INSERT INTO `dr_1_photo_index` VALUES (60, 1, 43, 9, 1594694850);
INSERT INTO `dr_1_photo_index` VALUES (61, 1, 43, 9, 1594695327);
INSERT INTO `dr_1_photo_index` VALUES (62, 1, 43, 9, 1594695352);
INSERT INTO `dr_1_photo_index` VALUES (63, 1, 43, 9, 1594695364);
INSERT INTO `dr_1_photo_index` VALUES (64, 1, 43, 9, 1594695377);
INSERT INTO `dr_1_photo_index` VALUES (65, 1, 43, 9, 1594695386);
INSERT INTO `dr_1_photo_index` VALUES (66, 1, 43, 9, 1594695413);
INSERT INTO `dr_1_photo_index` VALUES (67, 1, 43, 9, 1594695425);
INSERT INTO `dr_1_photo_index` VALUES (68, 1, 43, 9, 1594695439);
INSERT INTO `dr_1_photo_index` VALUES (69, 1, 43, 9, 1594695344);
INSERT INTO `dr_1_photo_index` VALUES (70, 1, 58, 10, 1594367008);
INSERT INTO `dr_1_photo_index` VALUES (102, 1, 58, 9, 1594695074);
INSERT INTO `dr_1_photo_index` VALUES (103, 1, 60, 9, 1594695122);
INSERT INTO `dr_1_photo_index` VALUES (104, 1, 60, 9, 1594695132);
INSERT INTO `dr_1_photo_index` VALUES (105, 1, 60, 9, 1594695145);
INSERT INTO `dr_1_photo_index` VALUES (106, 1, 60, 9, 1594695175);
INSERT INTO `dr_1_photo_index` VALUES (107, 1, 60, 9, 1594695155);
INSERT INTO `dr_1_photo_index` VALUES (108, 1, 60, 9, 1594695114);
INSERT INTO `dr_1_photo_index` VALUES (109, 1, 60, 9, 1594695083);
INSERT INTO `dr_1_photo_index` VALUES (110, 1, 62, 9, 1594695187);
INSERT INTO `dr_1_photo_index` VALUES (111, 1, 62, 9, 1594695636);
INSERT INTO `dr_1_photo_index` VALUES (112, 1, 62, 9, 1594695207);
INSERT INTO `dr_1_photo_index` VALUES (113, 1, 62, 9, 1594694795);
INSERT INTO `dr_1_photo_index` VALUES (114, 1, 43, 9, 1594695103);

-- ----------------------------
-- Table structure for dr_1_photo_recycle
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_photo_recycle`;
CREATE TABLE `dr_1_photo_recycle`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cid` int(10) UNSIGNED NOT NULL COMMENT '内容id',
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) UNSIGNED NOT NULL COMMENT '栏目id',
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '具体内容',
  `result` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '删除理由',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内容回收站表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dr_1_photo_recycle
-- ----------------------------
INSERT INTO `dr_1_photo_recycle` VALUES (1, 36, 1, 11, '{\"1_photo\":{\"id\":\"36\",\"catid\":\"11\",\"title\":\"产品展示十二\",\"thumb\":\"8\",\"keywords\":\"\",\"description\":\"GSM电梯无线对讲呼叫系统产品是我公司推出的第五代产品，机房用无线GSM分机与管理中心通话，无需布线减少日常使用的维护成本，为管理中心提供了一个全面对讲呼叫的解决方案；采用了先进的微芯片技术，特别根据...\",\"hits\":\"13\",\"uid\":\"1\",\"author\":\"admin\",\"status\":\"9\",\"url\":\"\\/index.php?c=show&id=36\",\"link_id\":\"0\",\"tableid\":\"0\",\"inputip\":\"127.0.0.1\",\"inputtime\":\"1573193385\",\"updatetime\":\"1573193404\",\"comments\":\"0\",\"avgsort\":\"0.00\",\"displayorder\":\"0\"},\"1_photo_data_0\":{\"id\":\"36\",\"uid\":\"1\",\"catid\":\"11\",\"content\":\"&lt;p&gt;\\r\\n\\tGSM电梯无线对讲呼叫系统产品是我公司推出的第五代产品，机房用无线GSM分机与管理中心通话，无需布线减少日常使用的维护成本，为管理中心提供了一个全面对讲呼叫的解决方案；采用了先进的微芯片技术，特别根据用户使用习惯进行优化设计，我们相信这个易于使用的无线对讲系统将给你带来方便稳定可靠的通讯。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t二、GSM电梯无线对讲系统功能介绍&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t&amp;nbsp;1、系统功能简述&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t当电梯使用过程中发生故障停机或停电困人等意外情况时电梯乘客可轻按&amp;amp;ldquo;呼叫&amp;amp;rdquo;键向值班室发出呼叫信号，电梯轿厢将自动播放提前录制的警示语音。此时，值班人员手机接到电梯呼叫电话，通过电话沟通，采取施救措施。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t特点：采用GSM卡网络，移动联通都皆可，信号强，无干扰，没有距离限制，可实现千里之外也可通话，可连接无限量的电梯台数，即，可讲几个小区合并一个值班室，减少人力和物力成本。系统可存储5组号码，可以直接呼叫到值班室座机，当值班室无人值守时，则可向另外电话号码或指定手机发出求救信号，确保与外界保持持续通讯，可确保电梯被困人员定能于外界通讯。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t优势：一键式呼叫、方便快捷，能有效解决监控中心、机房、轿厢、轿顶、坑底五方对讲通话。无须布线大量节约了昂贵的线路成本；无须布线大量节约了线路铺设高额的施工成本；大量节约了由于线路故障、老化等因素而带来的维护成本；完全杜绝了由于铺设线路而带来的对楼宇及道路的破坏；监控中心位置可以根据需要任意调整，无需任何线路调整；整个系统施工极为简单、施工周期短、见效快。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t2、机房分机功能介绍&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t1） 一栋楼只需要用一个分机，分机最多可带三部电梯；&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t2）GSM网络通讯，真正达到电信级别通话质量；&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t3） 抗干扰和防雷性强，不会受到雷雨天气影响。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t4）&amp;nbsp; 安装简单操作易懂。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t三、GSM电梯无线对讲系统使用方法&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t1、电梯呼叫值班人员&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t当电梯困人时，被困乘客只需轻按&amp;amp;ldquo;呼叫&amp;amp;rdquo;键，求救信号立即发送给值班人员。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t2、挂断呼叫&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t通话结束后，按&amp;amp;ldquo;确认&amp;amp;rdquo;键挂断通话，并将手柄放回原位。&lt;\\/p&gt;\",\"images\":\"{\\\"file\\\":[\\\"7\\\",\\\"8\\\"],\\\"title\\\":[\\\"1-19102QRA9\\\",\\\"1-19102QRF0\\\"],\\\"description\\\":[\\\"\\\",\\\"\\\"]}\"},\"1_photo_category_data\":null}', '1122', 1594352184);
INSERT INTO `dr_1_photo_recycle` VALUES (2, 35, 1, 11, '{\"1_photo\":{\"id\":\"35\",\"catid\":\"11\",\"title\":\"产品展示十一\",\"thumb\":\"8\",\"keywords\":\"\",\"description\":\"GSM电梯无线对讲呼叫系统产品是我公司推出的第五代产品，机房用无线GSM分机与管理中心通话，无需布线减少日常使用的维护成本，为管理中心提供了一个全面对讲呼叫的解决方案；采用了先进的微芯片技术，特别根据...\",\"hits\":\"9\",\"uid\":\"1\",\"author\":\"admin\",\"status\":\"9\",\"url\":\"\\/index.php?c=show&id=35\",\"link_id\":\"0\",\"tableid\":\"0\",\"inputip\":\"127.0.0.1\",\"inputtime\":\"1573193364\",\"updatetime\":\"1573193383\",\"comments\":\"0\",\"avgsort\":\"0.00\",\"displayorder\":\"0\"},\"1_photo_data_0\":{\"id\":\"35\",\"uid\":\"1\",\"catid\":\"11\",\"content\":\"&lt;p&gt;\\r\\n\\tGSM电梯无线对讲呼叫系统产品是我公司推出的第五代产品，机房用无线GSM分机与管理中心通话，无需布线减少日常使用的维护成本，为管理中心提供了一个全面对讲呼叫的解决方案；采用了先进的微芯片技术，特别根据用户使用习惯进行优化设计，我们相信这个易于使用的无线对讲系统将给你带来方便稳定可靠的通讯。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t二、GSM电梯无线对讲系统功能介绍&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t&amp;nbsp;1、系统功能简述&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t当电梯使用过程中发生故障停机或停电困人等意外情况时电梯乘客可轻按&amp;amp;ldquo;呼叫&amp;amp;rdquo;键向值班室发出呼叫信号，电梯轿厢将自动播放提前录制的警示语音。此时，值班人员手机接到电梯呼叫电话，通过电话沟通，采取施救措施。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t特点：采用GSM卡网络，移动联通都皆可，信号强，无干扰，没有距离限制，可实现千里之外也可通话，可连接无限量的电梯台数，即，可讲几个小区合并一个值班室，减少人力和物力成本。系统可存储5组号码，可以直接呼叫到值班室座机，当值班室无人值守时，则可向另外电话号码或指定手机发出求救信号，确保与外界保持持续通讯，可确保电梯被困人员定能于外界通讯。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t优势：一键式呼叫、方便快捷，能有效解决监控中心、机房、轿厢、轿顶、坑底五方对讲通话。无须布线大量节约了昂贵的线路成本；无须布线大量节约了线路铺设高额的施工成本；大量节约了由于线路故障、老化等因素而带来的维护成本；完全杜绝了由于铺设线路而带来的对楼宇及道路的破坏；监控中心位置可以根据需要任意调整，无需任何线路调整；整个系统施工极为简单、施工周期短、见效快。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t2、机房分机功能介绍&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t1） 一栋楼只需要用一个分机，分机最多可带三部电梯；&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t2）GSM网络通讯，真正达到电信级别通话质量；&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t3） 抗干扰和防雷性强，不会受到雷雨天气影响。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t4）&amp;nbsp; 安装简单操作易懂。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t三、GSM电梯无线对讲系统使用方法&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t1、电梯呼叫值班人员&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t当电梯困人时，被困乘客只需轻按&amp;amp;ldquo;呼叫&amp;amp;rdquo;键，求救信号立即发送给值班人员。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t2、挂断呼叫&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t通话结束后，按&amp;amp;ldquo;确认&amp;amp;rdquo;键挂断通话，并将手柄放回原位。&lt;\\/p&gt;\",\"images\":\"{\\\"file\\\":[\\\"7\\\",\\\"8\\\"],\\\"title\\\":[\\\"1-19102QRA9\\\",\\\"1-19102QRF0\\\"],\\\"description\\\":[\\\"\\\",\\\"\\\"]}\"},\"1_photo_category_data\":null}', '1122', 1594352184);
INSERT INTO `dr_1_photo_recycle` VALUES (3, 34, 1, 10, '{\"1_photo\":{\"id\":\"34\",\"catid\":\"10\",\"title\":\"产品展示十\",\"thumb\":\"8\",\"keywords\":\"\",\"description\":\"GSM电梯无线对讲呼叫系统产品是我公司推出的第五代产品，机房用无线GSM分机与管理中心通话，无需布线减少日常使用的维护成本，为管理中心提供了一个全面对讲呼叫的解决方案；采用了先进的微芯片技术，特别根据...\",\"hits\":\"1\",\"uid\":\"1\",\"author\":\"admin\",\"status\":\"9\",\"url\":\"\\/index.php?c=show&id=34\",\"link_id\":\"0\",\"tableid\":\"0\",\"inputip\":\"127.0.0.1\",\"inputtime\":\"1573193340\",\"updatetime\":\"1573193361\",\"comments\":\"0\",\"avgsort\":\"0.00\",\"displayorder\":\"0\"},\"1_photo_data_0\":{\"id\":\"34\",\"uid\":\"1\",\"catid\":\"10\",\"content\":\"&lt;p&gt;\\r\\n\\tGSM电梯无线对讲呼叫系统产品是我公司推出的第五代产品，机房用无线GSM分机与管理中心通话，无需布线减少日常使用的维护成本，为管理中心提供了一个全面对讲呼叫的解决方案；采用了先进的微芯片技术，特别根据用户使用习惯进行优化设计，我们相信这个易于使用的无线对讲系统将给你带来方便稳定可靠的通讯。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t二、GSM电梯无线对讲系统功能介绍&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t&amp;nbsp;1、系统功能简述&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t当电梯使用过程中发生故障停机或停电困人等意外情况时电梯乘客可轻按&amp;amp;ldquo;呼叫&amp;amp;rdquo;键向值班室发出呼叫信号，电梯轿厢将自动播放提前录制的警示语音。此时，值班人员手机接到电梯呼叫电话，通过电话沟通，采取施救措施。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t特点：采用GSM卡网络，移动联通都皆可，信号强，无干扰，没有距离限制，可实现千里之外也可通话，可连接无限量的电梯台数，即，可讲几个小区合并一个值班室，减少人力和物力成本。系统可存储5组号码，可以直接呼叫到值班室座机，当值班室无人值守时，则可向另外电话号码或指定手机发出求救信号，确保与外界保持持续通讯，可确保电梯被困人员定能于外界通讯。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t优势：一键式呼叫、方便快捷，能有效解决监控中心、机房、轿厢、轿顶、坑底五方对讲通话。无须布线大量节约了昂贵的线路成本；无须布线大量节约了线路铺设高额的施工成本；大量节约了由于线路故障、老化等因素而带来的维护成本；完全杜绝了由于铺设线路而带来的对楼宇及道路的破坏；监控中心位置可以根据需要任意调整，无需任何线路调整；整个系统施工极为简单、施工周期短、见效快。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t2、机房分机功能介绍&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t1） 一栋楼只需要用一个分机，分机最多可带三部电梯；&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t2）GSM网络通讯，真正达到电信级别通话质量；&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t3） 抗干扰和防雷性强，不会受到雷雨天气影响。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t4）&amp;nbsp; 安装简单操作易懂。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t三、GSM电梯无线对讲系统使用方法&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t1、电梯呼叫值班人员&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t当电梯困人时，被困乘客只需轻按&amp;amp;ldquo;呼叫&amp;amp;rdquo;键，求救信号立即发送给值班人员。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t2、挂断呼叫&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t通话结束后，按&amp;amp;ldquo;确认&amp;amp;rdquo;键挂断通话，并将手柄放回原位。&lt;\\/p&gt;\",\"images\":\"{\\\"file\\\":[\\\"7\\\",\\\"8\\\"],\\\"title\\\":[\\\"1-19102QRA9\\\",\\\"1-19102QRF0\\\"],\\\"description\\\":[\\\"\\\",\\\"\\\"]}\"},\"1_photo_category_data\":null}', '1122', 1594352184);
INSERT INTO `dr_1_photo_recycle` VALUES (4, 33, 1, 10, '{\"1_photo\":{\"id\":\"33\",\"catid\":\"10\",\"title\":\"产品展示九\",\"thumb\":\"8\",\"keywords\":\"\",\"description\":\"GSM电梯无线对讲呼叫系统产品是我公司推出的第五代产品，机房用无线GSM分机与管理中心通话，无需布线减少日常使用的维护成本，为管理中心提供了一个全面对讲呼叫的解决方案；采用了先进的微芯片技术，特别根据...\",\"hits\":\"2\",\"uid\":\"1\",\"author\":\"admin\",\"status\":\"9\",\"url\":\"\\/index.php?c=show&id=33\",\"link_id\":\"0\",\"tableid\":\"0\",\"inputip\":\"127.0.0.1\",\"inputtime\":\"1573193319\",\"updatetime\":\"1573193338\",\"comments\":\"0\",\"avgsort\":\"0.00\",\"displayorder\":\"0\"},\"1_photo_data_0\":{\"id\":\"33\",\"uid\":\"1\",\"catid\":\"10\",\"content\":\"&lt;p&gt;\\r\\n\\tGSM电梯无线对讲呼叫系统产品是我公司推出的第五代产品，机房用无线GSM分机与管理中心通话，无需布线减少日常使用的维护成本，为管理中心提供了一个全面对讲呼叫的解决方案；采用了先进的微芯片技术，特别根据用户使用习惯进行优化设计，我们相信这个易于使用的无线对讲系统将给你带来方便稳定可靠的通讯。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t二、GSM电梯无线对讲系统功能介绍&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t&amp;nbsp;1、系统功能简述&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t当电梯使用过程中发生故障停机或停电困人等意外情况时电梯乘客可轻按&amp;amp;ldquo;呼叫&amp;amp;rdquo;键向值班室发出呼叫信号，电梯轿厢将自动播放提前录制的警示语音。此时，值班人员手机接到电梯呼叫电话，通过电话沟通，采取施救措施。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t特点：采用GSM卡网络，移动联通都皆可，信号强，无干扰，没有距离限制，可实现千里之外也可通话，可连接无限量的电梯台数，即，可讲几个小区合并一个值班室，减少人力和物力成本。系统可存储5组号码，可以直接呼叫到值班室座机，当值班室无人值守时，则可向另外电话号码或指定手机发出求救信号，确保与外界保持持续通讯，可确保电梯被困人员定能于外界通讯。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t优势：一键式呼叫、方便快捷，能有效解决监控中心、机房、轿厢、轿顶、坑底五方对讲通话。无须布线大量节约了昂贵的线路成本；无须布线大量节约了线路铺设高额的施工成本；大量节约了由于线路故障、老化等因素而带来的维护成本；完全杜绝了由于铺设线路而带来的对楼宇及道路的破坏；监控中心位置可以根据需要任意调整，无需任何线路调整；整个系统施工极为简单、施工周期短、见效快。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t2、机房分机功能介绍&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t1） 一栋楼只需要用一个分机，分机最多可带三部电梯；&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t2）GSM网络通讯，真正达到电信级别通话质量；&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t3） 抗干扰和防雷性强，不会受到雷雨天气影响。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t4）&amp;nbsp; 安装简单操作易懂。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t三、GSM电梯无线对讲系统使用方法&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t1、电梯呼叫值班人员&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t当电梯困人时，被困乘客只需轻按&amp;amp;ldquo;呼叫&amp;amp;rdquo;键，求救信号立即发送给值班人员。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t2、挂断呼叫&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t通话结束后，按&amp;amp;ldquo;确认&amp;amp;rdquo;键挂断通话，并将手柄放回原位。&lt;\\/p&gt;\",\"images\":\"{\\\"file\\\":[\\\"8\\\"],\\\"title\\\":[\\\"1-19102QRF0\\\"],\\\"description\\\":[\\\"\\\"]}\"},\"1_photo_category_data\":null}', '1122', 1594352184);
INSERT INTO `dr_1_photo_recycle` VALUES (5, 32, 1, 9, '{\"1_photo\":{\"id\":\"32\",\"catid\":\"9\",\"title\":\"产品展示八\",\"thumb\":\"8\",\"keywords\":\"\",\"description\":\"GSM电梯无线对讲呼叫系统产品是我公司推出的第五代产品，机房用无线GSM分机与管理中心通话，无需布线减少日常使用的维护成本，为管理中心提供了一个全面对讲呼叫的解决方案；采用了先进的微芯片技术，特别根据...\",\"hits\":\"1\",\"uid\":\"1\",\"author\":\"admin\",\"status\":\"9\",\"url\":\"\\/index.php?c=show&id=32\",\"link_id\":\"0\",\"tableid\":\"0\",\"inputip\":\"127.0.0.1\",\"inputtime\":\"1573193294\",\"updatetime\":\"1573193317\",\"comments\":\"0\",\"avgsort\":\"0.00\",\"displayorder\":\"0\"},\"1_photo_data_0\":{\"id\":\"32\",\"uid\":\"1\",\"catid\":\"9\",\"content\":\"&lt;p&gt;\\r\\n\\tGSM电梯无线对讲呼叫系统产品是我公司推出的第五代产品，机房用无线GSM分机与管理中心通话，无需布线减少日常使用的维护成本，为管理中心提供了一个全面对讲呼叫的解决方案；采用了先进的微芯片技术，特别根据用户使用习惯进行优化设计，我们相信这个易于使用的无线对讲系统将给你带来方便稳定可靠的通讯。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t二、GSM电梯无线对讲系统功能介绍&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t&amp;nbsp;1、系统功能简述&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t当电梯使用过程中发生故障停机或停电困人等意外情况时电梯乘客可轻按&amp;amp;ldquo;呼叫&amp;amp;rdquo;键向值班室发出呼叫信号，电梯轿厢将自动播放提前录制的警示语音。此时，值班人员手机接到电梯呼叫电话，通过电话沟通，采取施救措施。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t特点：采用GSM卡网络，移动联通都皆可，信号强，无干扰，没有距离限制，可实现千里之外也可通话，可连接无限量的电梯台数，即，可讲几个小区合并一个值班室，减少人力和物力成本。系统可存储5组号码，可以直接呼叫到值班室座机，当值班室无人值守时，则可向另外电话号码或指定手机发出求救信号，确保与外界保持持续通讯，可确保电梯被困人员定能于外界通讯。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t优势：一键式呼叫、方便快捷，能有效解决监控中心、机房、轿厢、轿顶、坑底五方对讲通话。无须布线大量节约了昂贵的线路成本；无须布线大量节约了线路铺设高额的施工成本；大量节约了由于线路故障、老化等因素而带来的维护成本；完全杜绝了由于铺设线路而带来的对楼宇及道路的破坏；监控中心位置可以根据需要任意调整，无需任何线路调整；整个系统施工极为简单、施工周期短、见效快。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t2、机房分机功能介绍&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t1） 一栋楼只需要用一个分机，分机最多可带三部电梯；&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t2）GSM网络通讯，真正达到电信级别通话质量；&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t3） 抗干扰和防雷性强，不会受到雷雨天气影响。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t4）&amp;nbsp; 安装简单操作易懂。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t三、GSM电梯无线对讲系统使用方法&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t1、电梯呼叫值班人员&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t当电梯困人时，被困乘客只需轻按&amp;amp;ldquo;呼叫&amp;amp;rdquo;键，求救信号立即发送给值班人员。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t2、挂断呼叫&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t通话结束后，按&amp;amp;ldquo;确认&amp;amp;rdquo;键挂断通话，并将手柄放回原位。&lt;\\/p&gt;\",\"images\":\"{\\\"file\\\":[\\\"7\\\",\\\"8\\\"],\\\"title\\\":[\\\"1-19102QRA9\\\",\\\"1-19102QRF0\\\"],\\\"description\\\":[\\\"\\\",\\\"\\\"]}\"},\"1_photo_category_data\":null}', '1122', 1594352184);
INSERT INTO `dr_1_photo_recycle` VALUES (6, 31, 1, 9, '{\"1_photo\":{\"id\":\"31\",\"catid\":\"9\",\"title\":\"产品展示七\",\"thumb\":\"8\",\"keywords\":\"\",\"description\":\"GSM电梯无线对讲呼叫系统产品是我公司推出的第五代产品，机房用无线GSM分机与管理中心通话，无需布线减少日常使用的维护成本，为管理中心提供了一个全面对讲呼叫的解决方案；采用了先进的微芯片技术，特别根据...\",\"hits\":\"2\",\"uid\":\"1\",\"author\":\"admin\",\"status\":\"9\",\"url\":\"\\/index.php?c=show&id=31\",\"link_id\":\"0\",\"tableid\":\"0\",\"inputip\":\"127.0.0.1\",\"inputtime\":\"1573193266\",\"updatetime\":\"1573193292\",\"comments\":\"0\",\"avgsort\":\"0.00\",\"displayorder\":\"0\"},\"1_photo_data_0\":{\"id\":\"31\",\"uid\":\"1\",\"catid\":\"9\",\"content\":\"&lt;p&gt;\\r\\n\\tGSM电梯无线对讲呼叫系统产品是我公司推出的第五代产品，机房用无线GSM分机与管理中心通话，无需布线减少日常使用的维护成本，为管理中心提供了一个全面对讲呼叫的解决方案；采用了先进的微芯片技术，特别根据用户使用习惯进行优化设计，我们相信这个易于使用的无线对讲系统将给你带来方便稳定可靠的通讯。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t二、GSM电梯无线对讲系统功能介绍&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t&amp;nbsp;1、系统功能简述&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t当电梯使用过程中发生故障停机或停电困人等意外情况时电梯乘客可轻按&amp;amp;ldquo;呼叫&amp;amp;rdquo;键向值班室发出呼叫信号，电梯轿厢将自动播放提前录制的警示语音。此时，值班人员手机接到电梯呼叫电话，通过电话沟通，采取施救措施。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t特点：采用GSM卡网络，移动联通都皆可，信号强，无干扰，没有距离限制，可实现千里之外也可通话，可连接无限量的电梯台数，即，可讲几个小区合并一个值班室，减少人力和物力成本。系统可存储5组号码，可以直接呼叫到值班室座机，当值班室无人值守时，则可向另外电话号码或指定手机发出求救信号，确保与外界保持持续通讯，可确保电梯被困人员定能于外界通讯。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t优势：一键式呼叫、方便快捷，能有效解决监控中心、机房、轿厢、轿顶、坑底五方对讲通话。无须布线大量节约了昂贵的线路成本；无须布线大量节约了线路铺设高额的施工成本；大量节约了由于线路故障、老化等因素而带来的维护成本；完全杜绝了由于铺设线路而带来的对楼宇及道路的破坏；监控中心位置可以根据需要任意调整，无需任何线路调整；整个系统施工极为简单、施工周期短、见效快。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t2、机房分机功能介绍&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t1） 一栋楼只需要用一个分机，分机最多可带三部电梯；&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t2）GSM网络通讯，真正达到电信级别通话质量；&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t3） 抗干扰和防雷性强，不会受到雷雨天气影响。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t4）&amp;nbsp; 安装简单操作易懂。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t三、GSM电梯无线对讲系统使用方法&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t1、电梯呼叫值班人员&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t当电梯困人时，被困乘客只需轻按&amp;amp;ldquo;呼叫&amp;amp;rdquo;键，求救信号立即发送给值班人员。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t2、挂断呼叫&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t通话结束后，按&amp;amp;ldquo;确认&amp;amp;rdquo;键挂断通话，并将手柄放回原位。&lt;\\/p&gt;\",\"images\":\"{\\\"file\\\":[\\\"7\\\",\\\"8\\\"],\\\"title\\\":[\\\"1-19102QRA9\\\",\\\"1-19102QRF0\\\"],\\\"description\\\":[\\\"\\\",\\\"\\\"]}\"},\"1_photo_category_data\":null}', '1122', 1594352184);
INSERT INTO `dr_1_photo_recycle` VALUES (7, 30, 1, 9, '{\"1_photo\":{\"id\":\"30\",\"catid\":\"9\",\"title\":\"产品展示六\",\"thumb\":\"8\",\"keywords\":\"\",\"description\":\"GSM电梯无线对讲呼叫系统产品是我公司推出的第五代产品，机房用无线GSM分机与管理中心通话，无需布线减少日常使用的维护成本，为管理中心提供了一个全面对讲呼叫的解决方案；采用了先进的微芯片技术，特别根据...\",\"hits\":\"2\",\"uid\":\"1\",\"author\":\"admin\",\"status\":\"9\",\"url\":\"\\/index.php?c=show&id=30\",\"link_id\":\"0\",\"tableid\":\"0\",\"inputip\":\"127.0.0.1\",\"inputtime\":\"1573193174\",\"updatetime\":\"1573193264\",\"comments\":\"0\",\"avgsort\":\"0.00\",\"displayorder\":\"0\"},\"1_photo_data_0\":{\"id\":\"30\",\"uid\":\"1\",\"catid\":\"9\",\"content\":\"&lt;p&gt;\\r\\n\\tGSM电梯无线对讲呼叫系统产品是我公司推出的第五代产品，机房用无线GSM分机与管理中心通话，无需布线减少日常使用的维护成本，为管理中心提供了一个全面对讲呼叫的解决方案；采用了先进的微芯片技术，特别根据用户使用习惯进行优化设计，我们相信这个易于使用的无线对讲系统将给你带来方便稳定可靠的通讯。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t二、GSM电梯无线对讲系统功能介绍&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t&amp;nbsp;1、系统功能简述&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t当电梯使用过程中发生故障停机或停电困人等意外情况时电梯乘客可轻按&amp;amp;ldquo;呼叫&amp;amp;rdquo;键向值班室发出呼叫信号，电梯轿厢将自动播放提前录制的警示语音。此时，值班人员手机接到电梯呼叫电话，通过电话沟通，采取施救措施。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t特点：采用GSM卡网络，移动联通都皆可，信号强，无干扰，没有距离限制，可实现千里之外也可通话，可连接无限量的电梯台数，即，可讲几个小区合并一个值班室，减少人力和物力成本。系统可存储5组号码，可以直接呼叫到值班室座机，当值班室无人值守时，则可向另外电话号码或指定手机发出求救信号，确保与外界保持持续通讯，可确保电梯被困人员定能于外界通讯。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t优势：一键式呼叫、方便快捷，能有效解决监控中心、机房、轿厢、轿顶、坑底五方对讲通话。无须布线大量节约了昂贵的线路成本；无须布线大量节约了线路铺设高额的施工成本；大量节约了由于线路故障、老化等因素而带来的维护成本；完全杜绝了由于铺设线路而带来的对楼宇及道路的破坏；监控中心位置可以根据需要任意调整，无需任何线路调整；整个系统施工极为简单、施工周期短、见效快。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t2、机房分机功能介绍&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t1） 一栋楼只需要用一个分机，分机最多可带三部电梯；&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t2）GSM网络通讯，真正达到电信级别通话质量；&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t3） 抗干扰和防雷性强，不会受到雷雨天气影响。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t4）&amp;nbsp; 安装简单操作易懂。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t三、GSM电梯无线对讲系统使用方法&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t1、电梯呼叫值班人员&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t当电梯困人时，被困乘客只需轻按&amp;amp;ldquo;呼叫&amp;amp;rdquo;键，求救信号立即发送给值班人员。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t2、挂断呼叫&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t通话结束后，按&amp;amp;ldquo;确认&amp;amp;rdquo;键挂断通话，并将手柄放回原位。&lt;\\/p&gt;\",\"images\":\"{\\\"file\\\":[\\\"7\\\",\\\"8\\\"],\\\"title\\\":[\\\"1-19102QRA9\\\",\\\"1-19102QRF0\\\"],\\\"description\\\":[\\\"\\\",\\\"\\\"]}\"},\"1_photo_category_data\":null}', '1122', 1594352184);
INSERT INTO `dr_1_photo_recycle` VALUES (8, 29, 1, 9, '{\"1_photo\":{\"id\":\"29\",\"catid\":\"9\",\"title\":\"产品展示五\",\"thumb\":\"8\",\"keywords\":\"\",\"description\":\"GSM电梯无线对讲呼叫系统产品是我公司推出的第五代产品，机房用无线GSM分机与管理中心通话，无需布线减少日常使用的维护成本，为管理中心提供了一个全面对讲呼叫的解决方案；采用了先进的微芯片技术，特别根据...\",\"hits\":\"2\",\"uid\":\"1\",\"author\":\"admin\",\"status\":\"9\",\"url\":\"\\/index.php?c=show&id=29\",\"link_id\":\"0\",\"tableid\":\"0\",\"inputip\":\"127.0.0.1\",\"inputtime\":\"1573193148\",\"updatetime\":\"1573193172\",\"comments\":\"0\",\"avgsort\":\"0.00\",\"displayorder\":\"0\"},\"1_photo_data_0\":{\"id\":\"29\",\"uid\":\"1\",\"catid\":\"9\",\"content\":\"&lt;p&gt;\\r\\n\\tGSM电梯无线对讲呼叫系统产品是我公司推出的第五代产品，机房用无线GSM分机与管理中心通话，无需布线减少日常使用的维护成本，为管理中心提供了一个全面对讲呼叫的解决方案；采用了先进的微芯片技术，特别根据用户使用习惯进行优化设计，我们相信这个易于使用的无线对讲系统将给你带来方便稳定可靠的通讯。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t二、GSM电梯无线对讲系统功能介绍&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t&amp;nbsp;1、系统功能简述&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t当电梯使用过程中发生故障停机或停电困人等意外情况时电梯乘客可轻按&amp;amp;ldquo;呼叫&amp;amp;rdquo;键向值班室发出呼叫信号，电梯轿厢将自动播放提前录制的警示语音。此时，值班人员手机接到电梯呼叫电话，通过电话沟通，采取施救措施。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t特点：采用GSM卡网络，移动联通都皆可，信号强，无干扰，没有距离限制，可实现千里之外也可通话，可连接无限量的电梯台数，即，可讲几个小区合并一个值班室，减少人力和物力成本。系统可存储5组号码，可以直接呼叫到值班室座机，当值班室无人值守时，则可向另外电话号码或指定手机发出求救信号，确保与外界保持持续通讯，可确保电梯被困人员定能于外界通讯。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t优势：一键式呼叫、方便快捷，能有效解决监控中心、机房、轿厢、轿顶、坑底五方对讲通话。无须布线大量节约了昂贵的线路成本；无须布线大量节约了线路铺设高额的施工成本；大量节约了由于线路故障、老化等因素而带来的维护成本；完全杜绝了由于铺设线路而带来的对楼宇及道路的破坏；监控中心位置可以根据需要任意调整，无需任何线路调整；整个系统施工极为简单、施工周期短、见效快。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t2、机房分机功能介绍&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t1） 一栋楼只需要用一个分机，分机最多可带三部电梯；&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t2）GSM网络通讯，真正达到电信级别通话质量；&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t3） 抗干扰和防雷性强，不会受到雷雨天气影响。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t4）&amp;nbsp; 安装简单操作易懂。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t三、GSM电梯无线对讲系统使用方法&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t1、电梯呼叫值班人员&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t当电梯困人时，被困乘客只需轻按&amp;amp;ldquo;呼叫&amp;amp;rdquo;键，求救信号立即发送给值班人员。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t2、挂断呼叫&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t通话结束后，按&amp;amp;ldquo;确认&amp;amp;rdquo;键挂断通话，并将手柄放回原位。&lt;\\/p&gt;\",\"images\":\"{\\\"file\\\":[\\\"7\\\",\\\"8\\\"],\\\"title\\\":[\\\"1-19102QRA9\\\",\\\"1-19102QRF0\\\"],\\\"description\\\":[\\\"\\\",\\\"\\\"]}\"},\"1_photo_category_data\":null}', '1122', 1594352184);
INSERT INTO `dr_1_photo_recycle` VALUES (9, 28, 1, 8, '{\"1_photo\":{\"id\":\"28\",\"catid\":\"8\",\"title\":\"产品展示四\",\"thumb\":\"8\",\"keywords\":\"\",\"description\":\"GSM电梯无线对讲呼叫系统产品是我公司推出的第五代产品，机房用无线GSM分机与管理中心通话，无需布线减少日常使用的维护成本，为管理中心提供了一个全面对讲呼叫的解决方案；采用了先进的微芯片技术，特别根据...\",\"hits\":\"2\",\"uid\":\"1\",\"author\":\"admin\",\"status\":\"9\",\"url\":\"\\/index.php?c=show&id=28\",\"link_id\":\"0\",\"tableid\":\"0\",\"inputip\":\"127.0.0.1\",\"inputtime\":\"1573193119\",\"updatetime\":\"1573193145\",\"comments\":\"0\",\"avgsort\":\"0.00\",\"displayorder\":\"0\"},\"1_photo_data_0\":{\"id\":\"28\",\"uid\":\"1\",\"catid\":\"8\",\"content\":\"&lt;p&gt;\\r\\n\\tGSM电梯无线对讲呼叫系统产品是我公司推出的第五代产品，机房用无线GSM分机与管理中心通话，无需布线减少日常使用的维护成本，为管理中心提供了一个全面对讲呼叫的解决方案；采用了先进的微芯片技术，特别根据用户使用习惯进行优化设计，我们相信这个易于使用的无线对讲系统将给你带来方便稳定可靠的通讯。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t二、GSM电梯无线对讲系统功能介绍&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t&amp;nbsp;1、系统功能简述&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t当电梯使用过程中发生故障停机或停电困人等意外情况时电梯乘客可轻按&amp;amp;ldquo;呼叫&amp;amp;rdquo;键向值班室发出呼叫信号，电梯轿厢将自动播放提前录制的警示语音。此时，值班人员手机接到电梯呼叫电话，通过电话沟通，采取施救措施。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t特点：采用GSM卡网络，移动联通都皆可，信号强，无干扰，没有距离限制，可实现千里之外也可通话，可连接无限量的电梯台数，即，可讲几个小区合并一个值班室，减少人力和物力成本。系统可存储5组号码，可以直接呼叫到值班室座机，当值班室无人值守时，则可向另外电话号码或指定手机发出求救信号，确保与外界保持持续通讯，可确保电梯被困人员定能于外界通讯。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t优势：一键式呼叫、方便快捷，能有效解决监控中心、机房、轿厢、轿顶、坑底五方对讲通话。无须布线大量节约了昂贵的线路成本；无须布线大量节约了线路铺设高额的施工成本；大量节约了由于线路故障、老化等因素而带来的维护成本；完全杜绝了由于铺设线路而带来的对楼宇及道路的破坏；监控中心位置可以根据需要任意调整，无需任何线路调整；整个系统施工极为简单、施工周期短、见效快。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t2、机房分机功能介绍&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t1） 一栋楼只需要用一个分机，分机最多可带三部电梯；&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t2）GSM网络通讯，真正达到电信级别通话质量；&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t3） 抗干扰和防雷性强，不会受到雷雨天气影响。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t4）&amp;nbsp; 安装简单操作易懂。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t三、GSM电梯无线对讲系统使用方法&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t1、电梯呼叫值班人员&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t当电梯困人时，被困乘客只需轻按&amp;amp;ldquo;呼叫&amp;amp;rdquo;键，求救信号立即发送给值班人员。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t2、挂断呼叫&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t通话结束后，按&amp;amp;ldquo;确认&amp;amp;rdquo;键挂断通话，并将手柄放回原位。&lt;\\/p&gt;\",\"images\":\"{\\\"file\\\":[\\\"7\\\",\\\"8\\\"],\\\"title\\\":[\\\"1-19102QRA9\\\",\\\"1-19102QRF0\\\"],\\\"description\\\":[\\\"\\\",\\\"\\\"]}\"},\"1_photo_category_data\":null}', '1122', 1594352184);
INSERT INTO `dr_1_photo_recycle` VALUES (10, 27, 1, 8, '{\"1_photo\":{\"id\":\"27\",\"catid\":\"8\",\"title\":\"产品展示三\",\"thumb\":\"6\",\"keywords\":\"\",\"description\":\"GSM电梯无线对讲呼叫系统产品是我公司推出的第五代产品，机房用无线GSM分机与管理中心通话，无需布线减少日常使用的维护成本，为管理中心提供了一个全面对讲呼叫的解决方案；采用了先进的微芯片技术，特别根据...\",\"hits\":\"5\",\"uid\":\"1\",\"author\":\"admin\",\"status\":\"9\",\"url\":\"\\/index.php?c=show&id=27\",\"link_id\":\"0\",\"tableid\":\"0\",\"inputip\":\"127.0.0.1\",\"inputtime\":\"1573193086\",\"updatetime\":\"1573193117\",\"comments\":\"0\",\"avgsort\":\"0.00\",\"displayorder\":\"0\"},\"1_photo_data_0\":{\"id\":\"27\",\"uid\":\"1\",\"catid\":\"8\",\"content\":\"&lt;p&gt;\\r\\n\\tGSM电梯无线对讲呼叫系统产品是我公司推出的第五代产品，机房用无线GSM分机与管理中心通话，无需布线减少日常使用的维护成本，为管理中心提供了一个全面对讲呼叫的解决方案；采用了先进的微芯片技术，特别根据用户使用习惯进行优化设计，我们相信这个易于使用的无线对讲系统将给你带来方便稳定可靠的通讯。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t二、GSM电梯无线对讲系统功能介绍&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t&amp;nbsp;1、系统功能简述&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t当电梯使用过程中发生故障停机或停电困人等意外情况时电梯乘客可轻按&amp;amp;ldquo;呼叫&amp;amp;rdquo;键向值班室发出呼叫信号，电梯轿厢将自动播放提前录制的警示语音。此时，值班人员手机接到电梯呼叫电话，通过电话沟通，采取施救措施。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t特点：采用GSM卡网络，移动联通都皆可，信号强，无干扰，没有距离限制，可实现千里之外也可通话，可连接无限量的电梯台数，即，可讲几个小区合并一个值班室，减少人力和物力成本。系统可存储5组号码，可以直接呼叫到值班室座机，当值班室无人值守时，则可向另外电话号码或指定手机发出求救信号，确保与外界保持持续通讯，可确保电梯被困人员定能于外界通讯。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t优势：一键式呼叫、方便快捷，能有效解决监控中心、机房、轿厢、轿顶、坑底五方对讲通话。无须布线大量节约了昂贵的线路成本；无须布线大量节约了线路铺设高额的施工成本；大量节约了由于线路故障、老化等因素而带来的维护成本；完全杜绝了由于铺设线路而带来的对楼宇及道路的破坏；监控中心位置可以根据需要任意调整，无需任何线路调整；整个系统施工极为简单、施工周期短、见效快。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t2、机房分机功能介绍&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t1） 一栋楼只需要用一个分机，分机最多可带三部电梯；&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t2）GSM网络通讯，真正达到电信级别通话质量；&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t3） 抗干扰和防雷性强，不会受到雷雨天气影响。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t4）&amp;nbsp; 安装简单操作易懂。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t三、GSM电梯无线对讲系统使用方法&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t1、电梯呼叫值班人员&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t当电梯困人时，被困乘客只需轻按&amp;amp;ldquo;呼叫&amp;amp;rdquo;键，求救信号立即发送给值班人员。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t2、挂断呼叫&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t通话结束后，按&amp;amp;ldquo;确认&amp;amp;rdquo;键挂断通话，并将手柄放回原位。&lt;\\/p&gt;\",\"images\":\"{\\\"file\\\":[\\\"6\\\",\\\"7\\\"],\\\"title\\\":[\\\"1-19102qa0400-l\\\",\\\"1-19102QRA9\\\"],\\\"description\\\":[\\\"\\\",\\\"\\\"]}\"},\"1_photo_category_data\":null}', '12', 1594352192);
INSERT INTO `dr_1_photo_recycle` VALUES (11, 26, 1, 8, '{\"1_photo\":{\"id\":\"26\",\"catid\":\"8\",\"title\":\"产品展示二\",\"thumb\":\"8\",\"keywords\":\"\",\"description\":\"GSM电梯无线对讲呼叫系统产品是我公司推出的第五代产品，机房用无线GSM分机与管理中心通话，无需布线减少日常使用的维护成本，为管理中心提供了一个全面对讲呼叫的解决方案；采用了先进的微芯片技术，特别根据...\",\"hits\":\"1\",\"uid\":\"1\",\"author\":\"admin\",\"status\":\"9\",\"url\":\"\\/index.php?c=show&id=26\",\"link_id\":\"0\",\"tableid\":\"0\",\"inputip\":\"127.0.0.1\",\"inputtime\":\"1573193004\",\"updatetime\":\"1573193083\",\"comments\":\"0\",\"avgsort\":\"0.00\",\"displayorder\":\"0\"},\"1_photo_data_0\":{\"id\":\"26\",\"uid\":\"1\",\"catid\":\"8\",\"content\":\"&lt;p&gt;\\r\\n\\tGSM电梯无线对讲呼叫系统产品是我公司推出的第五代产品，机房用无线GSM分机与管理中心通话，无需布线减少日常使用的维护成本，为管理中心提供了一个全面对讲呼叫的解决方案；采用了先进的微芯片技术，特别根据用户使用习惯进行优化设计，我们相信这个易于使用的无线对讲系统将给你带来方便稳定可靠的通讯。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t二、GSM电梯无线对讲系统功能介绍&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t&amp;nbsp;1、系统功能简述&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t当电梯使用过程中发生故障停机或停电困人等意外情况时电梯乘客可轻按&amp;amp;ldquo;呼叫&amp;amp;rdquo;键向值班室发出呼叫信号，电梯轿厢将自动播放提前录制的警示语音。此时，值班人员手机接到电梯呼叫电话，通过电话沟通，采取施救措施。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t特点：采用GSM卡网络，移动联通都皆可，信号强，无干扰，没有距离限制，可实现千里之外也可通话，可连接无限量的电梯台数，即，可讲几个小区合并一个值班室，减少人力和物力成本。系统可存储5组号码，可以直接呼叫到值班室座机，当值班室无人值守时，则可向另外电话号码或指定手机发出求救信号，确保与外界保持持续通讯，可确保电梯被困人员定能于外界通讯。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t优势：一键式呼叫、方便快捷，能有效解决监控中心、机房、轿厢、轿顶、坑底五方对讲通话。无须布线大量节约了昂贵的线路成本；无须布线大量节约了线路铺设高额的施工成本；大量节约了由于线路故障、老化等因素而带来的维护成本；完全杜绝了由于铺设线路而带来的对楼宇及道路的破坏；监控中心位置可以根据需要任意调整，无需任何线路调整；整个系统施工极为简单、施工周期短、见效快。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t2、机房分机功能介绍&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t1） 一栋楼只需要用一个分机，分机最多可带三部电梯；&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t2）GSM网络通讯，真正达到电信级别通话质量；&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t3） 抗干扰和防雷性强，不会受到雷雨天气影响。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t4）&amp;nbsp; 安装简单操作易懂。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t三、GSM电梯无线对讲系统使用方法&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t1、电梯呼叫值班人员&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t当电梯困人时，被困乘客只需轻按&amp;amp;ldquo;呼叫&amp;amp;rdquo;键，求救信号立即发送给值班人员。&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t2、挂断呼叫&lt;\\/p&gt;&lt;p&gt;\\r\\n\\t通话结束后，按&amp;amp;ldquo;确认&amp;amp;rdquo;键挂断通话，并将手柄放回原位。&lt;\\/p&gt;\",\"images\":\"{\\\"file\\\":[\\\"6\\\",\\\"7\\\"],\\\"title\\\":[\\\"1-19102qa0400-l\\\",\\\"1-19102QRA9\\\"],\\\"description\\\":[\\\"\\\",\\\"\\\"]}\"},\"1_photo_category_data\":null}', '12', 1594352192);
INSERT INTO `dr_1_photo_recycle` VALUES (12, 25, 1, 8, '{\"1_photo\":{\"id\":\"25\",\"catid\":\"8\",\"title\":\"产品展示一\",\"thumb\":\"6\",\"keywords\":\"产品展示\",\"description\":\"GSM电梯无线对讲呼叫系统产品是我公司推出的第五代产品，机房用无线GSM分机与管理中心通话，无需布线减少日常使用的维护成本，为管理中心提供了一个全面对讲呼叫的解决方案；采用了先进的微芯片技术，特别根据...\",\"hits\":\"2\",\"uid\":\"1\",\"author\":\"admin\",\"status\":\"9\",\"url\":\"\\/index.php?c=show&id=25\",\"link_id\":\"0\",\"tableid\":\"0\",\"inputip\":\"127.0.0.1\",\"inputtime\":\"1573192667\",\"updatetime\":\"1573192916\",\"comments\":\"0\",\"avgsort\":\"0.00\",\"displayorder\":\"0\"},\"1_photo_data_0\":{\"id\":\"25\",\"uid\":\"1\",\"catid\":\"8\",\"content\":\"&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal;&quot;&gt;GSM电梯无线对讲呼叫系统产品是我公司推出的第五代产品，机房用无线GSM分机与管理中心通话，无需布线减少日常使用的维护成本，为管理中心提供了一个全面对讲呼叫的解决方案；采用了先进的微芯片技术，特别根据用户使用习惯进行优化设计，我们相信这个易于使用的无线对讲系统将给你带来方便稳定可靠的通讯。&lt;\\/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal;&quot;&gt;二、GSM电梯无线对讲系统功能介绍&lt;\\/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal;&quot;&gt;&amp;nbsp;1、系统功能简述&lt;\\/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal;&quot;&gt;当电梯使用过程中发生故障停机或停电困人等意外情况时电梯乘客可轻按“呼叫”键向值班室发出呼叫信号，电梯轿厢将自动播放提前录制的警示语音。此时，值班人员手机接到电梯呼叫电话，通过电话沟通，采取施救措施。&lt;\\/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal;&quot;&gt;特点：采用GSM卡网络，移动联通都皆可，信号强，无干扰，没有距离限制，可实现千里之外也可通话，可连接无限量的电梯台数，即，可讲几个小区合并一个值班室，减少人力和物力成本。系统可存储5组号码，可以直接呼叫到值班室座机，当值班室无人值守时，则可向另外电话号码或指定手机发出求救信号，确保与外界保持持续通讯，可确保电梯被困人员定能于外界通讯。&lt;\\/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal;&quot;&gt;优势：一键式呼叫、方便快捷，能有效解决监控中心、机房、轿厢、轿顶、坑底五方对讲通话。无须布线大量节约了昂贵的线路成本；无须布线大量节约了线路铺设高额的施工成本；大量节约了由于线路故障、老化等因素而带来的维护成本；完全杜绝了由于铺设线路而带来的对楼宇及道路的破坏；监控中心位置可以根据需要任意调整，无需任何线路调整；整个系统施工极为简单、施工周期短、见效快。&lt;\\/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal;&quot;&gt;2、机房分机功能介绍&lt;\\/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal;&quot;&gt;1） 一栋楼只需要用一个分机，分机最多可带三部电梯；&lt;\\/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal;&quot;&gt;2）GSM网络通讯，真正达到电信级别通话质量；&lt;\\/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal;&quot;&gt;3） 抗干扰和防雷性强，不会受到雷雨天气影响。&lt;\\/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal;&quot;&gt;4）&amp;nbsp; 安装简单操作易懂。&lt;\\/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal;&quot;&gt;三、GSM电梯无线对讲系统使用方法&lt;\\/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal;&quot;&gt;1、电梯呼叫值班人员&lt;\\/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal;&quot;&gt;当电梯困人时，被困乘客只需轻按“呼叫”键，求救信号立即发送给值班人员。&lt;\\/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal;&quot;&gt;2、挂断呼叫&lt;\\/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal;&quot;&gt;通话结束后，按“确认”键挂断通话，并将手柄放回原位。&lt;\\/p&gt;&lt;p&gt;&lt;br\\/&gt;&lt;\\/p&gt;\",\"images\":\"{\\\"file\\\":[\\\"7\\\",\\\"8\\\"],\\\"title\\\":[\\\"产品展示一\\\",\\\"产品详情二\\\"],\\\"description\\\":[\\\"\\\",\\\"\\\"]}\"},\"1_photo_category_data\":null}', '12', 1594352192);
INSERT INTO `dr_1_photo_recycle` VALUES (13, 55, 1, 43, '{\"1_photo\":{\"id\":\"55\",\"catid\":\"43\",\"title\":\"2016年园博会 - 花卉服务 \",\"thumb\":\"46\",\"keywords\":\"PRODUCTS\",\"description\":\"PRODUCTS\",\"hits\":\"4\",\"uid\":\"1\",\"author\":\"admin\",\"status\":\"9\",\"url\":\"\\/index.php?c=show&id=55\",\"link_id\":\"0\",\"tableid\":\"0\",\"inputip\":\"10.50.0.40\",\"inputtime\":\"1594351212\",\"updatetime\":\"1594352490\",\"comments\":\"0\",\"avgsort\":\"0.00\",\"displayorder\":\"0\"},\"1_photo_data_0\":{\"id\":\"55\",\"uid\":\"1\",\"catid\":\"43\",\"content\":\"&lt;p&gt;&lt;br\\/&gt;&lt;\\/p&gt;&lt;p&gt;&lt;br\\/&gt;&lt;\\/p&gt;&lt;p&gt;&lt;br\\/&gt;&lt;\\/p&gt;&lt;p&gt;&lt;br\\/&gt;&lt;\\/p&gt;&lt;p&gt;&lt;img src=&quot;http:\\/\\/10.50.0.40\\/uploadfile\\/ueditor\\/image\\/202007\\/15943517197d4737.jpg&quot; style=&quot;&quot; title=&quot;bhpx_2016_05&quot;\\/&gt;&lt;\\/p&gt;&lt;p&gt;&lt;br\\/&gt;&lt;\\/p&gt;\",\"images\":\"{\\\"file\\\":[\\\"39\\\",\\\"43\\\",\\\"44\\\",\\\"45\\\"],\\\"title\\\":[\\\"bhpx_2016_01\\\",\\\"bhpx_2016_02\\\",\\\"bhpx_2016_03\\\",\\\"bhpx_2016_04\\\"],\\\"description\\\":[\\\"\\\",\\\"\\\",\\\"\\\",\\\"\\\"]}\"},\"1_photo_category_data\":null}', '', 1594353949);
INSERT INTO `dr_1_photo_recycle` VALUES (14, 70, 1, 58, '{\"1_photo\":{\"id\":\"70\",\"catid\":\"58\",\"title\":\"园林景观工程\",\"thumb\":\"125\",\"keywords\":\"园林景观工程\",\"description\":\"园林景观工程\",\"hits\":\"4\",\"uid\":\"1\",\"author\":\"admin\",\"status\":\"9\",\"url\":\"\\/index.php?c=show&id=70\",\"link_id\":\"0\",\"tableid\":\"0\",\"inputip\":\"10.50.0.40\",\"inputtime\":\"1594363053\",\"updatetime\":\"1594367008\",\"comments\":\"0\",\"avgsort\":\"0.00\",\"displayorder\":\"0\"},\"1_photo_data_0\":{\"id\":\"70\",\"uid\":\"1\",\"catid\":\"58\",\"content\":\"\",\"images\":\"{\\\"file\\\":[\\\"124\\\"],\\\"title\\\":[\\\"CgAGe1q5_7SAdweXAAUPM3uA-fw935\\\"],\\\"description\\\":[\\\"\\\"]}\"},\"1_photo_category_data\":null}', '', 1594431311);

-- ----------------------------
-- Table structure for dr_1_photo_search
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_photo_search`;
CREATE TABLE `dr_1_photo_search`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `params` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '参数数组',
  `keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关键字',
  `contentid` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id集合',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '搜索时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `keyword`(`keyword`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '搜索表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_photo_time
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_photo_time`;
CREATE TABLE `dr_1_photo_time`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '具体内容',
  `result` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '处理结果',
  `posttime` int(10) UNSIGNED NOT NULL COMMENT '定时发布时间',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `posttime`(`posttime`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内容定时发布表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_photo_verify
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_photo_verify`;
CREATE TABLE `dr_1_photo_verify`  (
  `id` int(10) UNSIGNED NOT NULL,
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `isnew` tinyint(1) UNSIGNED NOT NULL COMMENT '是否新增',
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '具体内容',
  `backuid` mediumint(8) UNSIGNED NOT NULL COMMENT '操作人uid',
  `backinfo` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作退回信息',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '录入时间',
  `vid` int(10) NULL DEFAULT NULL,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE,
  INDEX `backuid`(`backuid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内容审核表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_question
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_question`;
CREATE TABLE `dr_1_question`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) UNSIGNED NOT NULL COMMENT '栏目id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主题',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩略图',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键字',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
  `hits` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '浏览数',
  `uid` int(10) UNSIGNED NOT NULL COMMENT '作者id',
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者名称',
  `status` tinyint(2) NOT NULL COMMENT '状态',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `link_id` int(10) NOT NULL DEFAULT 0 COMMENT '同步id',
  `tableid` smallint(5) UNSIGNED NOT NULL COMMENT '附表id',
  `inputip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) NOT NULL COMMENT '更新时间',
  `updatetime` int(10) NOT NULL COMMENT '更新时间',
  `comments` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '评论数量',
  `avgsort` decimal(10, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '平均点评分数',
  `displayorder` int(10) NULL DEFAULT 0 COMMENT '排序值',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`, `updatetime`) USING BTREE,
  INDEX `link_id`(`link_id`) USING BTREE,
  INDEX `comments`(`comments`) USING BTREE,
  INDEX `avgsort`(`avgsort`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `updatetime`(`updatetime`) USING BTREE,
  INDEX `hits`(`hits`) USING BTREE,
  INDEX `displayorder`(`displayorder`, `updatetime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内容主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_question_category
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_question_category`;
CREATE TABLE `dr_1_question_category`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级id',
  `pids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所有上级id',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '栏目名称',
  `dirname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '上级目录',
  `child` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否有下级',
  `childids` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '下级所有id',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '栏目图片',
  `show` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否显示',
  `setting` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性配置',
  `displayorder` mediumint(8) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `show`(`show`) USING BTREE,
  INDEX `module`(`pid`, `displayorder`, `id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '栏目表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_question_category_data
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_question_category_data`;
CREATE TABLE `dr_1_question_category_data`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` int(3) UNSIGNED NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '栏目模型表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for dr_1_question_category_data_0
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_question_category_data_0`;
CREATE TABLE `dr_1_question_category_data_0`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '栏目模型表的附表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for dr_1_question_comment
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_question_comment`;
CREATE TABLE `dr_1_question_comment`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `cid` int(10) UNSIGNED NOT NULL COMMENT '关联id',
  `cuid` int(10) UNSIGNED NOT NULL COMMENT '关联uid',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `orderid` bigint(18) UNSIGNED NOT NULL COMMENT '订单id',
  `uid` mediumint(8) UNSIGNED NULL DEFAULT 0 COMMENT '评论者ID',
  `author` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论者账号',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '评论内容',
  `support` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '支持数',
  `oppose` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '反对数',
  `avgsort` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '平均分',
  `sort1` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort2` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort3` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort4` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort5` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort6` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort7` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort8` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `sort9` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '评分值',
  `reply` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '回复id',
  `in_reply` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否存在回复',
  `status` smallint(1) UNSIGNED NULL DEFAULT 0 COMMENT '审核状态',
  `inputip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '录入时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `orderid`(`orderid`) USING BTREE,
  INDEX `reply`(`reply`) USING BTREE,
  INDEX `support`(`support`) USING BTREE,
  INDEX `oppose`(`oppose`) USING BTREE,
  INDEX `avgsort`(`avgsort`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `aa`(`cid`, `status`, `inputtime`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '评论内容表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_question_comment_index
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_question_comment_index`;
CREATE TABLE `dr_1_question_comment_index`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) UNSIGNED NOT NULL COMMENT '内容id',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `support` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '支持数',
  `oppose` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '反对数',
  `comments` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '评论数',
  `avgsort` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '平均分',
  `sort1` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort2` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort3` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort4` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort5` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort6` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort7` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort8` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort9` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `tableid` smallint(5) UNSIGNED NULL DEFAULT 0 COMMENT '附表id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `support`(`support`) USING BTREE,
  INDEX `oppose`(`oppose`) USING BTREE,
  INDEX `comments`(`comments`) USING BTREE,
  INDEX `avgsort`(`avgsort`) USING BTREE,
  INDEX `tableid`(`tableid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '评论索引表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for dr_1_question_copy1
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_question_copy1`;
CREATE TABLE `dr_1_question_copy1`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) UNSIGNED NOT NULL COMMENT '栏目id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主题',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩略图',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键字',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
  `hits` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '浏览数',
  `uid` int(10) UNSIGNED NOT NULL COMMENT '作者id',
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者名称',
  `status` tinyint(2) NOT NULL COMMENT '状态',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `link_id` int(10) NOT NULL DEFAULT 0 COMMENT '同步id',
  `tableid` smallint(5) UNSIGNED NOT NULL COMMENT '附表id',
  `inputip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) NOT NULL COMMENT '更新时间',
  `updatetime` int(10) NOT NULL COMMENT '更新时间',
  `comments` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '评论数量',
  `avgsort` decimal(10, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '平均点评分数',
  `displayorder` int(10) NULL DEFAULT 0 COMMENT '排序值',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`, `updatetime`) USING BTREE,
  INDEX `link_id`(`link_id`) USING BTREE,
  INDEX `comments`(`comments`) USING BTREE,
  INDEX `avgsort`(`avgsort`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `updatetime`(`updatetime`) USING BTREE,
  INDEX `hits`(`hits`) USING BTREE,
  INDEX `displayorder`(`displayorder`, `updatetime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内容主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_question_data_0
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_question_data_0`;
CREATE TABLE `dr_1_question_data_0`  (
  `id` int(10) UNSIGNED NOT NULL,
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` smallint(5) UNSIGNED NOT NULL COMMENT '栏目id',
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内容附表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_question_draft
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_question_draft`;
CREATE TABLE `dr_1_question_draft`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cid` int(10) UNSIGNED NOT NULL COMMENT '内容id',
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '具体内容',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内容草稿表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_question_flag
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_question_flag`;
CREATE TABLE `dr_1_question_flag`  (
  `flag` tinyint(2) UNSIGNED NOT NULL DEFAULT 1 COMMENT '文档标记id',
  `id` int(10) UNSIGNED NOT NULL COMMENT '文档内容id',
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  INDEX `flag`(`flag`, `id`, `uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '标记表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for dr_1_question_hits
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_question_hits`;
CREATE TABLE `dr_1_question_hits`  (
  `id` int(10) UNSIGNED NOT NULL COMMENT '文章id',
  `hits` int(10) UNSIGNED NOT NULL COMMENT '总点击数',
  `day_hits` int(10) UNSIGNED NOT NULL COMMENT '本日点击',
  `week_hits` int(10) UNSIGNED NOT NULL COMMENT '本周点击',
  `month_hits` int(10) UNSIGNED NOT NULL COMMENT '本月点击',
  `year_hits` int(10) UNSIGNED NOT NULL COMMENT '年点击量',
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `day_hits`(`day_hits`) USING BTREE,
  INDEX `week_hits`(`week_hits`) USING BTREE,
  INDEX `month_hits`(`month_hits`) USING BTREE,
  INDEX `year_hits`(`year_hits`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '时段点击量统计' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for dr_1_question_index
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_question_index`;
CREATE TABLE `dr_1_question_index`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内容索引表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for dr_1_question_recycle
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_question_recycle`;
CREATE TABLE `dr_1_question_recycle`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cid` int(10) UNSIGNED NOT NULL COMMENT '内容id',
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) UNSIGNED NOT NULL COMMENT '栏目id',
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '具体内容',
  `result` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '删除理由',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内容回收站表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_question_search
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_question_search`;
CREATE TABLE `dr_1_question_search`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `params` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '参数数组',
  `keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关键字',
  `contentid` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id集合',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '搜索时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `keyword`(`keyword`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '搜索表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_question_time
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_question_time`;
CREATE TABLE `dr_1_question_time`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '具体内容',
  `result` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '处理结果',
  `posttime` int(10) UNSIGNED NOT NULL COMMENT '定时发布时间',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `posttime`(`posttime`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内容定时发布表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_question_verify
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_question_verify`;
CREATE TABLE `dr_1_question_verify`  (
  `id` int(10) UNSIGNED NOT NULL,
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '作者uid',
  `isnew` tinyint(1) UNSIGNED NOT NULL COMMENT '是否新增',
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者',
  `catid` mediumint(8) UNSIGNED NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '具体内容',
  `backuid` mediumint(8) UNSIGNED NOT NULL COMMENT '操作人uid',
  `backinfo` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作退回信息',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '录入时间',
  `vid` int(10) NULL DEFAULT NULL,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `catid`(`catid`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE,
  INDEX `backuid`(`backuid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内容审核表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_1_share_category
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_share_category`;
CREATE TABLE `dr_1_share_category`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tid` tinyint(1) NOT NULL COMMENT '栏目类型，0单页，1模块，2外链',
  `pid` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级id',
  `mid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模块目录',
  `pids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所有上级id',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '栏目名称',
  `dirname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '上级目录',
  `child` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否有下级',
  `childids` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '下级所有id',
  `domain` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '绑定电脑域名',
  `mobile_domain` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '绑定手机域名',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '栏目图片',
  `show` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否显示',
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单页内容',
  `setting` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性配置',
  `displayorder` smallint(5) NOT NULL DEFAULT 0,
  `eng_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '栏目英文名称',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mid`(`mid`) USING BTREE,
  INDEX `tid`(`tid`) USING BTREE,
  INDEX `show`(`show`) USING BTREE,
  INDEX `dirname`(`dirname`) USING BTREE,
  INDEX `module`(`pid`, `displayorder`, `id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 72 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '共享模块栏目表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dr_1_share_category
-- ----------------------------
INSERT INTO `dr_1_share_category` VALUES (67, 1, 45, 'news', '0,45', '公司动态', 'gsdt', 'xwdt/', 0, '67', '', '', '', 1, '', '{\"linkurl\":\"\",\"urlrule\":\"0\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"10\",\"mpagesize\":\"10\",\"page\":\"page.html\",\"list\":\"list.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"cat_field\":null}', 0, '');
INSERT INTO `dr_1_share_category` VALUES (68, 1, 45, 'news', '0,45', '人才理念', 'rencailinian', 'xwdt/', 0, '68', '', '', '', 1, '', '{\"linkurl\":\"\",\"urlrule\":\"0\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"10\",\"mpagesize\":\"10\",\"page\":\"page.html\",\"list\":\"list.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"cat_field\":null}', 0, '');
INSERT INTO `dr_1_share_category` VALUES (69, 1, 45, 'news', '0,45', '员工风采', 'ygfc', 'xwdt/', 0, '69', '', '', '', 1, '', '{\"linkurl\":\"\",\"urlrule\":\"0\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"10\",\"mpagesize\":\"10\",\"page\":\"page.html\",\"list\":\"list.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"cat_field\":null}', 0, '');
INSERT INTO `dr_1_share_category` VALUES (70, 1, 45, 'news', '0,45', '招聘信息', 'zhaopinxinxi', 'xwdt/', 0, '70', '', '', '', 1, '', '{\"linkurl\":\"\",\"urlrule\":\"0\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"10\",\"mpagesize\":\"10\",\"page\":\"page.html\",\"list\":\"list.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"cat_field\":null}', 0, '');
INSERT INTO `dr_1_share_category` VALUES (64, 1, 46, 'news', '0,46', '销售采购', 'xscg_s', 'xscg/', 0, '64', '', '', '', 1, '', '{\"linkurl\":\"\",\"urlrule\":\"0\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"10\",\"mpagesize\":\"10\",\"page\":\"page.html\",\"list\":\"list.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"cat_field\":null}', 0, '');
INSERT INTO `dr_1_share_category` VALUES (65, 1, 46, 'news', '0,46', '销售', 'xiaoshou', 'xscg/', 0, '65', '', '', '', 1, '', '{\"linkurl\":\"\",\"urlrule\":\"0\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"10\",\"mpagesize\":\"10\",\"page\":\"page.html\",\"list\":\"list.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"cat_field\":null}', 0, '');
INSERT INTO `dr_1_share_category` VALUES (66, 1, 46, 'news', '0,46', '采购', 'caigou', 'xscg/', 0, '66', '', '', '', 1, '', '{\"linkurl\":\"\",\"urlrule\":\"0\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"10\",\"mpagesize\":\"10\",\"page\":\"page.html\",\"list\":\"list.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"cat_field\":null}', 0, '');
INSERT INTO `dr_1_share_category` VALUES (41, 0, 0, '', '0', '关于我们', 'guanyuwomen', '', 1, '41,48,49,50,52', '', '', '287', 1, '&lt;div class=&quot;common-clumb-min commonweb clearfix&quot; style=&quot;box-sizing: border-box; background-repeat: no-repeat; padding: 77px 0px 0px; margin: 0px auto; max-width: 1200px;&quot;&gt;&lt;div class=&quot;clumb-title fl&quot; style=&quot;box-sizing: border-box; background-repeat: no-repeat; float: left; max-width: 50%;&quot;&gt;&lt;h3 class=&quot;cn font22&quot; style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin: 0px; padding: 0px 0px 7px; font-weight: normal; font-size: 22px; color: rgb(52, 54, 75);&quot;&gt;公司简介&lt;/h3&gt;&lt;h2 class=&quot;en font24&quot; style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin: 0px; padding: 0px; font-weight: normal; font-size: 24px; color: rgb(216, 32, 25); text-transform: uppercase; font-family: Rubik;&quot;&gt;&lt;/h2&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;Pledge-min commonweb padtb&quot; style=&quot;box-sizing: border-box; background-image: url(&amp;quot;../images/wicon12.png&amp;quot;); background-position: 100% 49px; background-size: initial; background-repeat: no-repeat; background-attachment: initial; background-origin: initial; background-clip: initial; padding: 49px 0px 52px; margin: 0px auto; max-width: 1200px; color: rgb(146, 146, 146);&quot;&gt;&lt;div class=&quot;Pledetext&quot; style=&quot;box-sizing: border-box; background-repeat: no-repeat; padding-right: 191.992px;&quot;&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;&quot;&gt;&lt;span style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin: 0px; padding: 0px; border: 0px;&quot;&gt;广州市花木公司成立于1958年，为广州市建筑集团有限公司下属单位，是一家以园林绿化施工、绿化养护、花卉布置和花卉苗木培育、生产、经营为主业，同时兼具园林设计、造林工程、园林绿化技术咨询等业务的国有企业，拥有风景园林设计乙级资质、市政公用工程施工总承包叁级、园林古建筑工程专业承包叁级资质和造林施工乙级资质，是“广东省第一批国家城市园林绿化壹级资质企业”、“广东省林业龙头企业”和“全国十佳园林花木企业”，公司规模、实力及知名度均在华南地区名列前茅。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;&quot;&gt;&lt;span style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin: 0px; padding: 0px; border: 0px;&quot;&gt;公司秉承“做精品工程，创一流企业”的企业目标，一直在园林工程行业承担着一定的社会责任，充分发挥国企的公共服务职能，已发展成为基础雄厚、队伍健全、管理规范、创新有力的综合性大型风景园林绿化企业，培养了一支召之能来，承之能战、战能攻坚、战能制胜的工作团队。机构下设业务科、工程科、园林科、保养部等，专业分工明确、技术能力较强，旗下多家全资附属子公司分布于全国各地。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;&quot;&gt;&lt;span style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin: 0px; padding: 0px; border: 0px;&quot;&gt;自上世纪九十年代起，公司开始广泛涉略园林绿化工程建设，尤其在继承和发扬“岭南派”园林基础上，博采众长，打造了一批有影响力的园林绿化工程，创造出众多新颖别致的现代风景园林景观。其中，不少工程在获得业界充分肯定的同时更斩获国家、省、市的奖项。近年来不断推陈出新、精益求精，打造了自己的企业名片，同时先后被评定为造林工程施工及风景园林工程设计专项乙级资质、市政公用工程施工总承包叁级、园林古建筑工程专业承包叁级和园林绿化与环卫行业企业B级资质。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;&quot;&gt;&lt;span style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin: 0px; padding: 0px; border: 0px;&quot;&gt;公司将笃守“以德养诚、以诚立信、以信兴业”经营理念的准则，发挥综合优势，竭诚为客户提供“讲质量，重信誉；讲技术，重科学；讲效率，重管理”的服务。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '{\"linkurl\":\"\",\"urlrule\":\"0\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"10\",\"mpagesize\":\"10\",\"page\":\"page.html\",\"list\":\"list.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"cat_field\":null}', 0, 'ABOUT US');
INSERT INTO `dr_1_share_category` VALUES (42, 1, 0, 'news', '0', '党务公开', 'dwgk', '', 1, '42,53,54,55,56', '', '', '', 1, '', '{\"linkurl\":\"\",\"getchild\":\"1\",\"urlrule\":\"0\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"10\",\"mpagesize\":\"10\",\"page\":\"page.html\",\"list\":\"list.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"cat_field\":null}', 0, 'PARTY WORK');
INSERT INTO `dr_1_share_category` VALUES (43, 1, 0, 'photo', '0', '百花飘香', 'bhpx', '', 0, '43', '', '', '', 1, '', '{\"linkurl\":\"\",\"urlrule\":\"0\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"10\",\"mpagesize\":\"10\",\"page\":\"page.html\",\"list\":\"list.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"cat_field\":null}', 0, 'FLOWERS');
INSERT INTO `dr_1_share_category` VALUES (44, 1, 0, 'photo', '0', '万木吐秀', 'wanmutuxiu', '', 1, '44,58,60,61,62', '', '', '', 1, '', '{\"linkurl\":\"\",\"getchild\":\"1\",\"urlrule\":\"0\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"10\",\"mpagesize\":\"10\",\"page\":\"page.html\",\"list\":\"list.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"cat_field\":null}', 0, 'MANGL SHOW');
INSERT INTO `dr_1_share_category` VALUES (45, 1, 0, 'news', '0', '新闻动态', 'xwdt', '', 1, '45,67,68,69,70', '', '', '', 1, '', '{\"linkurl\":\"\",\"urlrule\":\"0\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"10\",\"mpagesize\":\"10\",\"page\":\"page.html\",\"list\":\"list.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"cat_field\":null}', 0, 'NEW INFORMMATION');
INSERT INTO `dr_1_share_category` VALUES (46, 1, 0, 'news', '0', '销售采购', 'xscg', '', 1, '46,64,65,66', '', '', '', 1, '', '{\"linkurl\":\"\",\"urlrule\":\"0\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"10\",\"mpagesize\":\"10\",\"page\":\"aaa.html\",\"list\":\"list.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"cat_field\":null}', 0, '');
INSERT INTO `dr_1_share_category` VALUES (47, 0, 0, 'lxwm', '0', '联系我们', 'lianxiwomen', '', 0, '47', '', '', '', 1, '&lt;p&gt;&lt;span style=&quot;font-family: 宋体;text-indent: 37px&quot;&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: 宋体;text-indent: 37px&quot;&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/15944394248b9fc2.jpg&quot; title=&quot;dianh0&quot; width=&quot;150&quot; height=&quot;150&quot; alt=&quot;dianh0&quot;/&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/1594439424bb3cf4.jpg&quot; title=&quot;dizhi&quot; width=&quot;150&quot; height=&quot;150&quot; alt=&quot;dizhi&quot;/&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/15944394241deb9c.jpg&quot; title=&quot;emall&quot; width=&quot;150&quot; height=&quot;150&quot; alt=&quot;emall&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: 宋体;text-indent: 37px&quot;&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 20px;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family: 宋体; text-indent: 37px;&quot;&gt;电话：020-37598508&lt;/span&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/strong&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;strong&gt; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;地址：广州市水荫路102号&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;span style=&quot;font-family: 宋体;&quot;&gt;E-MAIL:HMGS1958@21CN.COM&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px;margin-bottom: 0px;padding: 0px;text-indent: 37px&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;img alt=&quot;广州市花木公司&quot; src=&quot;/api/ueditor/themes/default/images/spacer.gif&quot; style=&quot;background:url(http://10.50.0.40/api/language/zh-cn/images/localimage.png) no-repeat center center;border:1px solid #ddd&quot; word_img=&quot;file:///C:/Users/xiaodian/Desktop/%E5%B9%BF%E5%B7%9E%E5%B8%82%E8%8A%B1%E6%9C%A8%E5%85%AC%E5%8F%B8/%E8%81%94%E7%B3%BB%E6%88%91%E4%BB%AC/%E8%81%94%E7%B3%BB%E6%88%91%E4%BB%AC%20-_files/CgAGe1y3y3aASYa3AAAlcGNgBS0563.jpg&quot;/&gt;&lt;img alt=&quot;广州市花木公司&quot; src=&quot;/api/ueditor/themes/default/images/spacer.gif&quot; style=&quot;background:url(http://10.50.0.40/api/language/zh-cn/images/localimage.png) no-repeat center center;border:1px solid #ddd&quot; word_img=&quot;file:///C:/Users/xiaodian/Desktop/%E5%B9%BF%E5%B7%9E%E5%B8%82%E8%8A%B1%E6%9C%A8%E5%85%AC%E5%8F%B8/%E8%81%94%E7%B3%BB%E6%88%91%E4%BB%AC/%E8%81%94%E7%B3%BB%E6%88%91%E4%BB%AC%20-_files/CgAGTFlQo5OAcoPgAACn5Wz19Ik156.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '{\"linkurl\":\"\",\"urlrule\":\"0\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"10\",\"mpagesize\":\"10\",\"page\":\"page.html\",\"list\":\"list.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"cat_field\":null}', 0, 'CONTACT US');
INSERT INTO `dr_1_share_category` VALUES (48, 0, 41, '', '0,41', '公司简介', 'gsjj', 'guanyuwomen/', 0, '48', '', '', '', 1, '&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &quot;&gt;广州市花木公司成立于1958年，为广州市建筑集团有限公司下属单位，是一家以园林绿化施工、绿化养护、花卉布置和花卉苗木培育、生产、经营为主业，同时兼具园林设计、造林工程、园林绿化技术咨询等业务的国有企业，拥有风景园林设计乙级资质、市政公用工程施工总承包叁级、园林古建筑工程专业承包叁级资质和造林施工乙级资质，是“广东省第一批国家城市园林绿化壹级资质企业”、“广东省林业龙头企业”和“全国十佳园林花木企业”，公司规模、实力及知名度均在华南地区名列前茅。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &quot;&gt;公司秉承“做精品工程，创一流企业”的企业目标，一直在园林工程行业承担着一定的社会责任，充分发挥国企的公共服务职能，已发展成为基础雄厚、队伍健全、管理规范、创新有力的综合性大型风景园林绿化企业，培养了一支召之能来，承之能战、战能攻坚、战能制胜的工作团队。机构下设业务科、工程科、园林科、保养部等，专业分工明确、技术能力较强，旗下多家全资附属子公司分布于全国各地。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &quot;&gt;自上世纪九十年代起，公司开始广泛涉略园林绿化工程建设，尤其在继承和发扬“岭南派”园林基础上，博采众长，打造了一批有影响力的园林绿化工程，创造出众多新颖别致的现代风景园林景观。其中，不少工程在获得业界充分肯定的同时更斩获国家、省、市的奖项。近年来不断推陈出新、精益求精，打造了自己的企业名片，同时先后被评定为造林工程施工及风景园林工程设计专项乙级资质、市政公用工程施工总承包叁级、园林古建筑工程专业承包叁级和园林绿化与环卫行业企业B级资质。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &quot;&gt;公司将笃守“以德养诚、以诚立信、以信兴业”经营理念的准则，发挥综合优势，竭诚为客户提供“讲质量，重信誉；讲技术，重科学；讲效率，重管理”的服务。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '{\"linkurl\":\"\",\"urlrule\":\"0\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"10\",\"mpagesize\":\"10\",\"page\":\"page.html\",\"list\":\"list.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"cat_field\":null}', 0, 'company introduction');
INSERT INTO `dr_1_share_category` VALUES (49, 0, 41, '', '0,41', '里程碑', 'lichengbei', 'guanyuwomen/', 0, '49', '', '', '', 1, '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/1594347624b9c222.jpg&quot; style=&quot;&quot; title=&quot;lichengbei1&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/15943476247a85cb.jpg&quot; style=&quot;&quot; title=&quot;lichengbei2&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '{\"linkurl\":\"\",\"urlrule\":\"0\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"10\",\"mpagesize\":\"10\",\"page\":\"page.html\",\"list\":\"list.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"cat_field\":null}', 0, '');
INSERT INTO `dr_1_share_category` VALUES (50, 0, 41, '', '0,41', '企业资质', 'qiyezizhi', 'guanyuwomen/', 0, '50', '', '', '', 1, '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/159434788512ac3b.jpg&quot; style=&quot;&quot; title=&quot;qiyezizhi3&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/1594347885587601.jpg&quot; style=&quot;&quot; title=&quot;qiyezizhi1&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/1594347885131f3b.jpg&quot; style=&quot;&quot; title=&quot;qiyezizhi2&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '{\"linkurl\":\"\",\"urlrule\":\"0\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"10\",\"mpagesize\":\"10\",\"page\":\"page.html\",\"list\":\"list.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"cat_field\":null}', 0, '');
INSERT INTO `dr_1_share_category` VALUES (53, 1, 42, 'news', '0,42', '工作动态', 'gzdt', 'dwgk/', 0, '53', '', '', '286', 1, '', '{\"linkurl\":\"\",\"urlrule\":\"0\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"10\",\"mpagesize\":\"10\",\"page\":\"page.html\",\"list\":\"list.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"cat_field\":null}', 0, '');
INSERT INTO `dr_1_share_category` VALUES (52, 0, 41, '', '0,41', '组织架构', 'zuzhijiagou', 'guanyuwomen/', 0, '52', '', '', '', 1, '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://10.50.0.40/uploadfile/ueditor/image/202007/15943480185074e7.jpg&quot; title=&quot;zuzhijiagou&quot; alt=&quot;zuzhijiagou&quot;/&gt;&lt;/p&gt;', '{\"linkurl\":\"\",\"urlrule\":\"0\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"10\",\"mpagesize\":\"10\",\"page\":\"page.html\",\"list\":\"list.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"cat_field\":null}', 0, '');
INSERT INTO `dr_1_share_category` VALUES (54, 1, 42, 'news', '0,42', '党风廉政建设', 'dflzjs', 'dwgk/', 0, '54', '', '', '', 1, '', '{\"linkurl\":\"\",\"urlrule\":\"0\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"10\",\"mpagesize\":\"10\",\"page\":\"page.html\",\"list\":\"list.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"cat_field\":null}', 0, '');
INSERT INTO `dr_1_share_category` VALUES (55, 1, 42, 'news', '0,42', '党员干部建设', 'dygbjs', 'dwgk/', 0, '55', '', '', '', 1, '', '{\"linkurl\":\"\",\"urlrule\":\"0\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"10\",\"mpagesize\":\"10\",\"page\":\"page.html\",\"list\":\"list.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"cat_field\":null}', 0, '');
INSERT INTO `dr_1_share_category` VALUES (56, 1, 42, 'news', '0,42', '规章制度', 'gzzd', 'dwgk/', 0, '56', '', '', '', 1, '', '{\"linkurl\":\"\",\"urlrule\":\"0\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"10\",\"mpagesize\":\"10\",\"page\":\"page.html\",\"list\":\"list.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"cat_field\":null}', 0, '');
INSERT INTO `dr_1_share_category` VALUES (62, 1, 44, 'photo', '0,44', '苗木生产', 'mmsc', 'wanmutuxiu/', 0, '62', '', '', '', 1, '', '{\"linkurl\":\"\",\"urlrule\":\"0\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"10\",\"mpagesize\":\"10\",\"page\":\"page.html\",\"list\":\"list.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"cat_field\":null}', 0, '');
INSERT INTO `dr_1_share_category` VALUES (58, 1, 44, 'photo', '0,44', '园林景观工程', 'yljggc', 'wanmutuxiu/', 0, '58', '', '', '', 1, '', '{\"linkurl\":\"\",\"urlrule\":\"0\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"10\",\"mpagesize\":\"10\",\"page\":\"page.html\",\"list\":\"list.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"cat_field\":null}', 0, '');
INSERT INTO `dr_1_share_category` VALUES (61, 1, 44, 'photo', '0,44', '园林景观设计', 'yljgsj', 'wanmutuxiu/', 0, '61', '', '', '', 1, '', '{\"linkurl\":\"\",\"urlrule\":\"0\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"10\",\"mpagesize\":\"10\",\"page\":\"page.html\",\"list\":\"list.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"cat_field\":null}', 0, '');
INSERT INTO `dr_1_share_category` VALUES (60, 1, 44, 'photo', '0,44', '园林绿化养护', 'yllhyh', 'wanmutuxiu/', 0, '60', '', '', '', 1, '', '{\"linkurl\":\"\",\"urlrule\":\"0\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"10\",\"mpagesize\":\"10\",\"page\":\"page.html\",\"list\":\"list.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"cat_field\":null}', 0, '');

-- ----------------------------
-- Table structure for dr_1_share_index
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_share_index`;
CREATE TABLE `dr_1_share_index`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `mid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模块目录',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mid`(`mid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 127 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '共享模块内容索引表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dr_1_share_index
-- ----------------------------
INSERT INTO `dr_1_share_index` VALUES (1, 'news');
INSERT INTO `dr_1_share_index` VALUES (2, 'news');
INSERT INTO `dr_1_share_index` VALUES (3, 'news');
INSERT INTO `dr_1_share_index` VALUES (4, 'news');
INSERT INTO `dr_1_share_index` VALUES (5, 'news');
INSERT INTO `dr_1_share_index` VALUES (6, 'news');
INSERT INTO `dr_1_share_index` VALUES (7, 'news');
INSERT INTO `dr_1_share_index` VALUES (8, 'news');
INSERT INTO `dr_1_share_index` VALUES (9, 'news');
INSERT INTO `dr_1_share_index` VALUES (10, 'news');
INSERT INTO `dr_1_share_index` VALUES (11, 'news');
INSERT INTO `dr_1_share_index` VALUES (12, 'news');
INSERT INTO `dr_1_share_index` VALUES (13, 'news');
INSERT INTO `dr_1_share_index` VALUES (14, 'news');
INSERT INTO `dr_1_share_index` VALUES (15, 'news');
INSERT INTO `dr_1_share_index` VALUES (16, 'news');
INSERT INTO `dr_1_share_index` VALUES (17, 'news');
INSERT INTO `dr_1_share_index` VALUES (18, 'news');
INSERT INTO `dr_1_share_index` VALUES (19, 'news');
INSERT INTO `dr_1_share_index` VALUES (20, 'news');
INSERT INTO `dr_1_share_index` VALUES (21, 'news');
INSERT INTO `dr_1_share_index` VALUES (22, 'news');
INSERT INTO `dr_1_share_index` VALUES (23, 'news');
INSERT INTO `dr_1_share_index` VALUES (24, 'news');
INSERT INTO `dr_1_share_index` VALUES (25, 'photo');
INSERT INTO `dr_1_share_index` VALUES (26, 'photo');
INSERT INTO `dr_1_share_index` VALUES (27, 'photo');
INSERT INTO `dr_1_share_index` VALUES (28, 'photo');
INSERT INTO `dr_1_share_index` VALUES (29, 'photo');
INSERT INTO `dr_1_share_index` VALUES (30, 'photo');
INSERT INTO `dr_1_share_index` VALUES (31, 'photo');
INSERT INTO `dr_1_share_index` VALUES (32, 'photo');
INSERT INTO `dr_1_share_index` VALUES (33, 'photo');
INSERT INTO `dr_1_share_index` VALUES (34, 'photo');
INSERT INTO `dr_1_share_index` VALUES (35, 'photo');
INSERT INTO `dr_1_share_index` VALUES (36, 'photo');
INSERT INTO `dr_1_share_index` VALUES (37, 'down');
INSERT INTO `dr_1_share_index` VALUES (38, 'down');
INSERT INTO `dr_1_share_index` VALUES (39, 'down');
INSERT INTO `dr_1_share_index` VALUES (40, 'down');
INSERT INTO `dr_1_share_index` VALUES (41, 'news');
INSERT INTO `dr_1_share_index` VALUES (42, 'question');
INSERT INTO `dr_1_share_index` VALUES (43, 'question');
INSERT INTO `dr_1_share_index` VALUES (44, 'question');
INSERT INTO `dr_1_share_index` VALUES (45, 'question');
INSERT INTO `dr_1_share_index` VALUES (46, 'join');
INSERT INTO `dr_1_share_index` VALUES (47, 'news');
INSERT INTO `dr_1_share_index` VALUES (48, 'news');
INSERT INTO `dr_1_share_index` VALUES (49, 'news');
INSERT INTO `dr_1_share_index` VALUES (50, 'news');
INSERT INTO `dr_1_share_index` VALUES (51, 'news');
INSERT INTO `dr_1_share_index` VALUES (52, 'news');
INSERT INTO `dr_1_share_index` VALUES (53, 'news');
INSERT INTO `dr_1_share_index` VALUES (54, 'news');
INSERT INTO `dr_1_share_index` VALUES (55, 'photo');
INSERT INTO `dr_1_share_index` VALUES (56, 'photo');
INSERT INTO `dr_1_share_index` VALUES (57, 'photo');
INSERT INTO `dr_1_share_index` VALUES (58, 'photo');
INSERT INTO `dr_1_share_index` VALUES (59, 'photo');
INSERT INTO `dr_1_share_index` VALUES (60, 'photo');
INSERT INTO `dr_1_share_index` VALUES (61, 'photo');
INSERT INTO `dr_1_share_index` VALUES (62, 'photo');
INSERT INTO `dr_1_share_index` VALUES (63, 'photo');
INSERT INTO `dr_1_share_index` VALUES (64, 'photo');
INSERT INTO `dr_1_share_index` VALUES (65, 'photo');
INSERT INTO `dr_1_share_index` VALUES (66, 'photo');
INSERT INTO `dr_1_share_index` VALUES (67, 'photo');
INSERT INTO `dr_1_share_index` VALUES (68, 'photo');
INSERT INTO `dr_1_share_index` VALUES (69, 'photo');
INSERT INTO `dr_1_share_index` VALUES (70, 'photo');
INSERT INTO `dr_1_share_index` VALUES (71, 'news');
INSERT INTO `dr_1_share_index` VALUES (72, 'news');
INSERT INTO `dr_1_share_index` VALUES (73, 'news');
INSERT INTO `dr_1_share_index` VALUES (74, 'news');
INSERT INTO `dr_1_share_index` VALUES (75, 'news');
INSERT INTO `dr_1_share_index` VALUES (76, 'news');
INSERT INTO `dr_1_share_index` VALUES (77, 'news');
INSERT INTO `dr_1_share_index` VALUES (78, 'news');
INSERT INTO `dr_1_share_index` VALUES (79, 'news');
INSERT INTO `dr_1_share_index` VALUES (80, 'news');
INSERT INTO `dr_1_share_index` VALUES (81, 'news');
INSERT INTO `dr_1_share_index` VALUES (82, 'news');
INSERT INTO `dr_1_share_index` VALUES (83, 'news');
INSERT INTO `dr_1_share_index` VALUES (84, 'news');
INSERT INTO `dr_1_share_index` VALUES (85, 'news');
INSERT INTO `dr_1_share_index` VALUES (86, 'news');
INSERT INTO `dr_1_share_index` VALUES (87, 'news');
INSERT INTO `dr_1_share_index` VALUES (88, 'news');
INSERT INTO `dr_1_share_index` VALUES (89, 'news');
INSERT INTO `dr_1_share_index` VALUES (90, 'photo');
INSERT INTO `dr_1_share_index` VALUES (91, 'photo');
INSERT INTO `dr_1_share_index` VALUES (92, 'photo');
INSERT INTO `dr_1_share_index` VALUES (93, 'photo');
INSERT INTO `dr_1_share_index` VALUES (94, 'photo');
INSERT INTO `dr_1_share_index` VALUES (95, 'photo');
INSERT INTO `dr_1_share_index` VALUES (96, 'photo');
INSERT INTO `dr_1_share_index` VALUES (97, 'photo');
INSERT INTO `dr_1_share_index` VALUES (98, 'photo');
INSERT INTO `dr_1_share_index` VALUES (99, 'photo');
INSERT INTO `dr_1_share_index` VALUES (100, 'photo');
INSERT INTO `dr_1_share_index` VALUES (101, 'photo');
INSERT INTO `dr_1_share_index` VALUES (102, 'photo');
INSERT INTO `dr_1_share_index` VALUES (103, 'photo');
INSERT INTO `dr_1_share_index` VALUES (104, 'photo');
INSERT INTO `dr_1_share_index` VALUES (105, 'photo');
INSERT INTO `dr_1_share_index` VALUES (106, 'photo');
INSERT INTO `dr_1_share_index` VALUES (107, 'photo');
INSERT INTO `dr_1_share_index` VALUES (108, 'photo');
INSERT INTO `dr_1_share_index` VALUES (109, 'photo');
INSERT INTO `dr_1_share_index` VALUES (110, 'photo');
INSERT INTO `dr_1_share_index` VALUES (111, 'photo');
INSERT INTO `dr_1_share_index` VALUES (112, 'photo');
INSERT INTO `dr_1_share_index` VALUES (113, 'photo');
INSERT INTO `dr_1_share_index` VALUES (114, 'photo');
INSERT INTO `dr_1_share_index` VALUES (115, 'lxwm');
INSERT INTO `dr_1_share_index` VALUES (116, 'news');
INSERT INTO `dr_1_share_index` VALUES (117, 'news');
INSERT INTO `dr_1_share_index` VALUES (118, 'news');
INSERT INTO `dr_1_share_index` VALUES (119, 'news');
INSERT INTO `dr_1_share_index` VALUES (120, 'news');
INSERT INTO `dr_1_share_index` VALUES (121, 'news');
INSERT INTO `dr_1_share_index` VALUES (122, 'news');
INSERT INTO `dr_1_share_index` VALUES (123, 'news');
INSERT INTO `dr_1_share_index` VALUES (124, 'news');
INSERT INTO `dr_1_share_index` VALUES (125, 'news');
INSERT INTO `dr_1_share_index` VALUES (126, 'news');

-- ----------------------------
-- Table structure for dr_admin
-- ----------------------------
DROP TABLE IF EXISTS `dr_admin`;
CREATE TABLE `dr_admin`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(10) UNSIGNED NOT NULL COMMENT '管理员uid',
  `setting` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '相关配置',
  `usermenu` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '自定义面板菜单，序列化数组格式',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uid`(`uid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dr_admin
-- ----------------------------
INSERT INTO `dr_admin` VALUES (1, 1, '', '');

-- ----------------------------
-- Table structure for dr_admin_login
-- ----------------------------
DROP TABLE IF EXISTS `dr_admin_login`;
CREATE TABLE `dr_admin_login`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) UNSIGNED NULL DEFAULT NULL COMMENT '会员uid',
  `loginip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录Ip',
  `logintime` int(10) UNSIGNED NOT NULL COMMENT '登录时间',
  `useragent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户端信息',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `loginip`(`loginip`) USING BTREE,
  INDEX `logintime`(`logintime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '登录日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dr_admin_login
-- ----------------------------
INSERT INTO `dr_admin_login` VALUES (1, 1, '127.0.0.1', 1573117178, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36');
INSERT INTO `dr_admin_login` VALUES (2, 1, '127.0.0.1', 1573191615, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36');
INSERT INTO `dr_admin_login` VALUES (3, 1, '127.0.0.1', 1573364479, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `dr_admin_login` VALUES (4, 1, '127.0.0.1', 1573346266, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `dr_admin_login` VALUES (5, 1, '127.0.0.1', 1573796751, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `dr_admin_login` VALUES (6, 1, '10.50.0.40', 1594285365, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36');
INSERT INTO `dr_admin_login` VALUES (7, 1, '10.50.0.40', 1594344402, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36');
INSERT INTO `dr_admin_login` VALUES (8, 1, '10.50.0.40', 1594430064, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36');
INSERT INTO `dr_admin_login` VALUES (9, 1, '10.50.0.40', 1594605855, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36');
INSERT INTO `dr_admin_login` VALUES (10, 1, '10.50.0.40', 1594625657, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36');
INSERT INTO `dr_admin_login` VALUES (11, 1, '10.50.0.40', 1594694751, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36');
INSERT INTO `dr_admin_login` VALUES (12, 1, '10.50.0.40', 1594698378, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36');

-- ----------------------------
-- Table structure for dr_admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `dr_admin_menu`;
CREATE TABLE `dr_admin_menu`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` smallint(5) UNSIGNED NOT NULL COMMENT '上级菜单id',
  `name` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单语言名称',
  `uri` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'uri字符串',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '外链地址',
  `mark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单标识',
  `hidden` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '是否隐藏',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标标示',
  `displayorder` int(5) NULL DEFAULT NULL COMMENT '排序值',
  `site` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `list`(`pid`) USING BTREE,
  INDEX `displayorder`(`displayorder`) USING BTREE,
  INDEX `mark`(`mark`) USING BTREE,
  INDEX `hidden`(`hidden`) USING BTREE,
  INDEX `uri`(`uri`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 138 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dr_admin_menu
-- ----------------------------
INSERT INTO `dr_admin_menu` VALUES (1, 0, '首页', '', '', 'home', 0, 'fa fa-home', 0, '');
INSERT INTO `dr_admin_menu` VALUES (2, 1, '我的面板', '', '', 'home-my', 0, 'fa fa-home', 0, '');
INSERT INTO `dr_admin_menu` VALUES (3, 2, '后台首页', 'home/main', '', '', 0, 'fa fa-home', 0, '');
INSERT INTO `dr_admin_menu` VALUES (4, 2, '资料修改', 'api/my', '', '', 0, 'fa fa-user', 0, '');
INSERT INTO `dr_admin_menu` VALUES (5, 2, '系统更新', 'cache/index', '', '', 0, 'fa fa-refresh', 0, '');
INSERT INTO `dr_admin_menu` VALUES (6, 2, '文件更新', 'cloud/bf', '', '', 0, 'fa fa-code', 0, '');
INSERT INTO `dr_admin_menu` VALUES (7, 0, '系统', '', '', 'system', 0, 'fa fa-globe', 0, '');
INSERT INTO `dr_admin_menu` VALUES (8, 7, '系统维护', '', '', 'system-wh', 0, 'fa fa-cog', 0, '');
INSERT INTO `dr_admin_menu` VALUES (9, 8, '系统环境', 'system/index', '', '', 0, 'fa fa-cog', 0, '');
INSERT INTO `dr_admin_menu` VALUES (10, 8, '系统缓存', 'system_cache/index', '', '', 0, 'fa fa-clock-o', 0, '');
INSERT INTO `dr_admin_menu` VALUES (11, 8, '附件设置', 'attachment/index', '', '', 0, 'fa fa-folder', 0, '');
INSERT INTO `dr_admin_menu` VALUES (12, 8, '短信设置', 'sms/index', '', '', 0, 'fa fa-envelope', 0, '');
INSERT INTO `dr_admin_menu` VALUES (13, 8, '邮件设置', 'email/index', '', '', 0, 'fa fa-envelope-open', 0, '');
INSERT INTO `dr_admin_menu` VALUES (14, 8, '系统提醒', 'notice/index', '', '', 0, 'fa fa-bell', 0, '');
INSERT INTO `dr_admin_menu` VALUES (15, 8, '数据字典', 'db/index', '', '', 0, 'fa fa-database', 0, '');
INSERT INTO `dr_admin_menu` VALUES (16, 8, 'Bom检测', 'check_bom/index', '', '', 0, 'fa fa-code', 0, '');
INSERT INTO `dr_admin_menu` VALUES (17, 8, '系统体检', 'check/index', '', '', 0, 'fa fa-wrench', 0, '');
INSERT INTO `dr_admin_menu` VALUES (18, 7, '日志管理', '', '', 'system-log', 0, 'fa fa-calendar', 0, '');
INSERT INTO `dr_admin_menu` VALUES (19, 18, 'PHP错误', 'error_php/index', '', '', 0, 'fa fa-bug', 0, '');
INSERT INTO `dr_admin_menu` VALUES (20, 18, '系统错误', 'error/index', '', '', 0, 'fa fa-shield', 0, '');
INSERT INTO `dr_admin_menu` VALUES (21, 18, '操作日志', 'system_log/index', '', '', 0, 'fa fa-calendar', 0, '');
INSERT INTO `dr_admin_menu` VALUES (22, 18, '短信日志', 'sms_log/index', '', '', 0, 'fa fa-envelope', 0, '');
INSERT INTO `dr_admin_menu` VALUES (23, 18, '邮件日志', 'email_log/index', '', '', 0, 'fa fa-envelope-open', 0, '');
INSERT INTO `dr_admin_menu` VALUES (24, 0, '设置', '', '', 'config', 0, 'fa fa-cogs', 0, '');
INSERT INTO `dr_admin_menu` VALUES (25, 24, '网站设置', '', '', 'config-web', 0, 'fa fa-cog', 0, '');
INSERT INTO `dr_admin_menu` VALUES (26, 25, '网站设置', 'site_config/index', '', '', 0, 'fa fa-cog', 0, '');
INSERT INTO `dr_admin_menu` VALUES (27, 25, '终端设置', 'site_client/index', '', '', 0, 'fa fa-cogs', 0, '');
INSERT INTO `dr_admin_menu` VALUES (28, 25, '手机设置', 'site_mobile/index', '', '', 0, 'fa fa-mobile', 0, '');
INSERT INTO `dr_admin_menu` VALUES (29, 25, '域名绑定', 'site_domain/index', '', '', 0, 'fa fa-globe', 0, '');
INSERT INTO `dr_admin_menu` VALUES (30, 25, '图片设置', 'site_image/index', '', '', 0, 'fa fa-photo', 0, '');
INSERT INTO `dr_admin_menu` VALUES (31, 24, '内容设置', '', '', 'config-content', 0, 'fa fa-navicon', 0, '');
INSERT INTO `dr_admin_menu` VALUES (32, 31, '创建模块', 'module_create/index', '', '', 0, 'fa fa-plus', 0, '');
INSERT INTO `dr_admin_menu` VALUES (33, 31, '模块管理', 'module/index', '', '', 0, 'fa fa-gears', 0, '');
INSERT INTO `dr_admin_menu` VALUES (34, 31, '模块搜索', 'module_search/index', '', '', 0, 'fa fa-search', 0, '');
INSERT INTO `dr_admin_menu` VALUES (35, 31, '模块评论', 'module_comment/index', '', '', 0, 'fa fa-comments', 0, '');
INSERT INTO `dr_admin_menu` VALUES (36, 31, '网站表单', 'form/index', '', '', 0, 'fa fa-table', 0, '');
INSERT INTO `dr_admin_menu` VALUES (37, 24, 'SEO设置', '', '', 'config-seo', 0, 'fa fa-internet-explorer', 0, '');
INSERT INTO `dr_admin_menu` VALUES (38, 37, '站点SEO', 'seo_site/index', '', '', 0, 'fa fa-cog', 0, '');
INSERT INTO `dr_admin_menu` VALUES (39, 37, '模块SEO', 'seo_module/index', '', '', 0, 'fa fa-gears', 0, '');
INSERT INTO `dr_admin_menu` VALUES (40, 37, '内容SEO', 'seo_content/index', '', '', 0, 'fa fa-th-large', 0, '');
INSERT INTO `dr_admin_menu` VALUES (41, 37, '栏目SEO', 'seo_category/index', '', '', 0, 'fa fa-reorder', 0, '');
INSERT INTO `dr_admin_menu` VALUES (42, 37, '搜索SEO', 'seo_search/index', '', '', 0, 'fa fa-search', 0, '');
INSERT INTO `dr_admin_menu` VALUES (43, 37, 'URL规则', 'urlrule/index', '', '', 0, 'fa fa-link', 0, '');
INSERT INTO `dr_admin_menu` VALUES (44, 24, '用户设置', '', '', 'config-member', 0, 'fa fa-user', 0, '');
INSERT INTO `dr_admin_menu` VALUES (45, 44, '用户设置', 'member_setting/index', '', '', 0, 'fa fa-cog', 0, '');
INSERT INTO `dr_admin_menu` VALUES (46, 44, '字段划分', 'member_field/index', '', '', 0, 'fa fa-code', 0, '');
INSERT INTO `dr_admin_menu` VALUES (47, 44, '通知设置', 'member_setting_notice/index', '', '', 0, 'fa fa-volume-up', 0, '');
INSERT INTO `dr_admin_menu` VALUES (48, 24, '支付设置', '', '', 'config-pay', 0, 'fa fa-rmb', 0, '');
INSERT INTO `dr_admin_menu` VALUES (49, 48, '支付设置', 'member_payconfig/index', '', '', 0, 'fa fa-cog', 0, '');
INSERT INTO `dr_admin_menu` VALUES (50, 48, '支付接口', 'member_payapi/index', '', '', 0, 'fa fa-code', 0, '');
INSERT INTO `dr_admin_menu` VALUES (51, 0, '权限', '', '', 'auth', 0, 'fa fa-user-circle', 0, '');
INSERT INTO `dr_admin_menu` VALUES (52, 51, '后台权限', '', '', 'auth-admin', 0, 'fa fa-cog', 0, '');
INSERT INTO `dr_admin_menu` VALUES (53, 52, '后台菜单', 'menu/index', '', '', 0, 'fa fa-list-alt', 0, '');
INSERT INTO `dr_admin_menu` VALUES (54, 52, '角色权限', 'role/index', '', '', 0, 'fa fa-users', 0, '');
INSERT INTO `dr_admin_menu` VALUES (55, 52, '角色账号', 'root/index', '', '', 0, 'fa fa-user', 0, '');
INSERT INTO `dr_admin_menu` VALUES (56, 52, '审核流程', 'verify/index', '', '', 0, 'fa fa-sort-numeric-asc', 0, '');
INSERT INTO `dr_admin_menu` VALUES (57, 51, '用户权限', '', '', 'auth-member', 0, 'fa fa-user', 0, '');
INSERT INTO `dr_admin_menu` VALUES (58, 57, '用户菜单', 'member_menu/index', '', '', 0, 'fa fa-list-alt', 0, '');
INSERT INTO `dr_admin_menu` VALUES (59, 57, '内容权限', 'module_member/index', '', '', 0, 'fa fa-th-large', 0, '');
INSERT INTO `dr_admin_menu` VALUES (60, 57, '用户组权限', 'member_setting_group/index', '', '', 0, 'fa fa-group', 0, '');
INSERT INTO `dr_admin_menu` VALUES (61, 0, '内容', '', '', 'content', 0, 'fa fa-th-large', 0, '');
INSERT INTO `dr_admin_menu` VALUES (62, 61, '内容管理', '', '', 'content-module', 0, 'fa fa-th-large', 0, '');
INSERT INTO `dr_admin_menu` VALUES (63, 62, '栏目管理', 'module_category/index', '', '', 0, 'fa fa-reorder', 0, '');
INSERT INTO `dr_admin_menu` VALUES (64, 62, '静态生成', 'html/index', '', '', 0, 'fa fa-file-code-o', 0, '');
INSERT INTO `dr_admin_menu` VALUES (65, 62, '内容维护', 'module_content/index', '', '', 0, 'fa fa-wrench', 0, '');
INSERT INTO `dr_admin_menu` VALUES (66, 61, '网站表单', '', '', 'content-form', 0, 'fa fa-table', 0, '');
INSERT INTO `dr_admin_menu` VALUES (67, 61, '内容审核', '', '', 'content-verify', 0, 'fa fa-edit', 0, '');
INSERT INTO `dr_admin_menu` VALUES (68, 0, '界面', '', '', 'code', 0, 'fa fa-html5', 0, '');
INSERT INTO `dr_admin_menu` VALUES (69, 68, '模板管理', '', '', 'code-html', 0, 'fa fa-home', 0, '');
INSERT INTO `dr_admin_menu` VALUES (70, 69, '电脑模板', 'tpl_pc/index', '', '', 0, 'fa fa-desktop', 0, '');
INSERT INTO `dr_admin_menu` VALUES (71, 69, '手机模板', 'tpl_mobile/index', '', '', 0, 'fa fa-mobile', 0, '');
INSERT INTO `dr_admin_menu` VALUES (72, 69, '终端模板', 'tpl_client/index', '', '', 0, 'fa fa-cogs', 0, '');
INSERT INTO `dr_admin_menu` VALUES (73, 68, '风格管理', '', '', 'code-css', 0, 'fa fa-css3', 99, '');
INSERT INTO `dr_admin_menu` VALUES (74, 73, '系统文件', 'system_theme/index', '', '', 0, 'fa fa-chrome', 0, '');
INSERT INTO `dr_admin_menu` VALUES (75, 73, '网站风格', 'theme/index', '', '', 0, 'fa fa-photo', 0, '');
INSERT INTO `dr_admin_menu` VALUES (76, 0, '用户', '', '', 'member', 0, 'fa fa-user', 0, '');
INSERT INTO `dr_admin_menu` VALUES (77, 76, '用户管理', '', '', 'member-list', 0, 'fa fa-user', 0, '');
INSERT INTO `dr_admin_menu` VALUES (78, 77, '用户管理', 'member/index', '', '', 0, 'fa fa-user', 0, '');
INSERT INTO `dr_admin_menu` VALUES (79, 77, '用户组管理', 'member_group/index', '', '', 0, 'fa fa-users', 0, '');
INSERT INTO `dr_admin_menu` VALUES (80, 77, '提醒消息', 'member_notice/index', '', '', 0, 'fa fa-bell', 0, '');
INSERT INTO `dr_admin_menu` VALUES (81, 77, '授权账号管理', 'member_oauth/index', '', '', 0, 'fa fa-qq', 0, '');
INSERT INTO `dr_admin_menu` VALUES (82, 76, '审核管理', '', '', 'member-verify', 0, 'fa fa-edit', 0, '');
INSERT INTO `dr_admin_menu` VALUES (83, 82, '注册审核', 'member_verify/index', '', '', 0, 'fa fa-edit', 0, '');
INSERT INTO `dr_admin_menu` VALUES (84, 82, '申请审核', 'member_apply/index', '', '', 0, 'fa fa-users', 0, '');
INSERT INTO `dr_admin_menu` VALUES (85, 0, '财务', '', '', 'pay', 0, 'fa fa-rmb', 0, '');
INSERT INTO `dr_admin_menu` VALUES (86, 85, '财务管理', '', '', 'pay-list', 0, 'fa fa-rmb', 0, '');
INSERT INTO `dr_admin_menu` VALUES (87, 86, '已付流水', 'member_paylog/index', '', '', 0, 'fa fa-calendar-check-o', 0, '');
INSERT INTO `dr_admin_menu` VALUES (88, 86, '未付流水', 'member_paylog/not_index', '', '', 0, 'fa fa-calendar-times-o', 0, '');
INSERT INTO `dr_admin_menu` VALUES (89, 86, '转账汇款', 'member_payremit/index', '', '', 0, 'fa fa-credit-card', 0, '');
INSERT INTO `dr_admin_menu` VALUES (90, 86, '上门收款', 'member_paymeet/index', '', '', 0, 'fa fa-user', 0, '');
INSERT INTO `dr_admin_menu` VALUES (91, 86, '虚拟金币', 'member_scorelog/index', '', '', 0, 'fa fa-diamond', 0, '');
INSERT INTO `dr_admin_menu` VALUES (92, 86, '用户充值', 'member_pay/index', '', '', 0, 'fa fa-plus', 0, '');
INSERT INTO `dr_admin_menu` VALUES (93, 0, '应用', '', '', 'app', 0, 'fa fa-puzzle-piece', 0, '');
INSERT INTO `dr_admin_menu` VALUES (94, 93, '应用插件', '', '', 'app-plugin', 0, 'fa fa-puzzle-piece', 0, '');
INSERT INTO `dr_admin_menu` VALUES (95, 94, '应用管理', 'cloud/local', '', '', 0, 'fa fa-folder', 0, '');
INSERT INTO `dr_admin_menu` VALUES (96, 94, '联动菜单', 'linkage/index', '', '', 0, 'fa fa-columns', 0, '');
INSERT INTO `dr_admin_menu` VALUES (97, 94, '任务队列', 'cron/index', '', '', 0, 'fa fa-indent', 0, '');
INSERT INTO `dr_admin_menu` VALUES (98, 94, '附件管理', 'attachments/index', '', '', 0, 'fa fa-folder', 0, '');
INSERT INTO `dr_admin_menu` VALUES (99, 0, '服务', '', '', 'cloud', 0, 'fa fa-cloud', 99, '');
INSERT INTO `dr_admin_menu` VALUES (100, 99, '网站管理', '', '', 'cloud-dayrui', 0, 'fa fa-cloud', 0, '');
INSERT INTO `dr_admin_menu` VALUES (101, 100, '我的网站', 'cloud/index', '', '', 0, 'fa fa-cog', 0, '');
INSERT INTO `dr_admin_menu` VALUES (102, 100, '服务工单', 'cloud/service', '', '', 0, 'fa fa-user-md', 0, '');
INSERT INTO `dr_admin_menu` VALUES (103, 100, '应用商城', 'cloud/app', '', '', 0, 'fa fa-puzzle-piece', 0, '');
INSERT INTO `dr_admin_menu` VALUES (104, 100, '组件商城', 'cloud/func', '', '', 0, 'fa fa-plug', 0, '');
INSERT INTO `dr_admin_menu` VALUES (105, 100, '模板商城', 'cloud/template', '', '', 0, 'fa fa-html5', 0, '');
INSERT INTO `dr_admin_menu` VALUES (106, 100, '版本升级', 'cloud/update', '', '', 0, 'fa fa-refresh', 0, '');
INSERT INTO `dr_admin_menu` VALUES (107, 62, '文章管理', 'news/home/index', '', 'module-news', 0, 'fa fa-sticky-note', -1, '');
INSERT INTO `dr_admin_menu` VALUES (108, 67, '文章审核', 'news/verify/index', '', 'verify-module-news', 0, 'fa fa-sticky-note', -1, '');
INSERT INTO `dr_admin_menu` VALUES (109, 67, '文章评论', 'news/comment_verify/index', '', 'verify-comment-news', 0, 'fa fa-comments', -1, '');
INSERT INTO `dr_admin_menu` VALUES (110, 62, '图片管理', 'photo/home/index', '', 'module-photo', 0, 'fa fa-photo', -1, '');
INSERT INTO `dr_admin_menu` VALUES (111, 67, '图片审核', 'photo/verify/index', '', 'verify-module-photo', 0, 'fa fa-photo', -1, '');
INSERT INTO `dr_admin_menu` VALUES (112, 67, '图片评论', 'photo/comment_verify/index', '', 'verify-comment-photo', 0, 'fa fa-comments', -1, '');
INSERT INTO `dr_admin_menu` VALUES (113, 94, '自定义资料', 'block/home/index', '', '', 0, 'fa fa-th-large', 0, '');
INSERT INTO `dr_admin_menu` VALUES (114, 94, '自定义链接', 'navigator/home/index', '', '', 0, 'fa fa-link', 0, '');
INSERT INTO `dr_admin_menu` VALUES (115, 94, '系统安全', 'safe/home/index', '', '', 0, 'fa fa-shield', 0, '');
INSERT INTO `dr_admin_menu` VALUES (116, 94, '自定义页面', 'page/home/index', '', '', 0, 'fa fa-safari', 0, '');
INSERT INTO `dr_admin_menu` VALUES (117, 62, '下载管理', 'down/home/index', '', 'module-down', 0, 'fa fa-download', -1, '');
INSERT INTO `dr_admin_menu` VALUES (118, 67, '下载审核', 'down/verify/index', '', 'verify-module-down', 0, 'fa fa-download', -1, '');
INSERT INTO `dr_admin_menu` VALUES (119, 67, '下载评论', 'down/comment_verify/index', '', 'verify-comment-down', 0, 'fa fa-comments', -1, '');
INSERT INTO `dr_admin_menu` VALUES (120, 62, '常见问题管理', 'question/home/index', '', 'module-question', 0, 'fa fa-question', -1, '');
INSERT INTO `dr_admin_menu` VALUES (121, 67, '常见问题审核', 'question/verify/index', '', 'verify-module-question', 0, 'fa fa-question', -1, '');
INSERT INTO `dr_admin_menu` VALUES (122, 67, '常见问题评论', 'question/comment_verify/index', '', 'verify-comment-question', 0, 'fa fa-comments', -1, '');
INSERT INTO `dr_admin_menu` VALUES (123, 66, '投诉及维修管理', 'form/complaint/index', '', 'form-complaint', 0, '', 0, '');
INSERT INTO `dr_admin_menu` VALUES (124, 67, '投诉及维修审核', 'form/complaint_verify/index', '', 'verify-form-complaint', 0, NULL, 0, '');
INSERT INTO `dr_admin_menu` VALUES (125, 62, '人才招聘管理', 'join/home/index', '', 'module-join', 0, 'fa fa-user', -1, '');
INSERT INTO `dr_admin_menu` VALUES (126, 67, '人才招聘审核', 'join/verify/index', '', 'verify-module-join', 0, 'fa fa-user', -1, '');
INSERT INTO `dr_admin_menu` VALUES (127, 67, '人才招聘评论', 'join/comment_verify/index', '', 'verify-comment-join', 0, 'fa fa-comments', -1, '');
INSERT INTO `dr_admin_menu` VALUES (129, 67, '万木吐秀审核', 'wmtx/verify/index', '', 'verify-module-wmtx', 0, 'fa fa-amazon', -1, '');
INSERT INTO `dr_admin_menu` VALUES (130, 67, '万木吐秀评论', 'wmtx/comment_verify/index', '', 'verify-comment-wmtx', 0, 'fa fa-comments', -1, '');
INSERT INTO `dr_admin_menu` VALUES (133, 67, '联系我们审核', 'lxwm/verify/index', '', 'verify-module-lxwm', 0, 'fa fa-align-justify', -1, '');
INSERT INTO `dr_admin_menu` VALUES (134, 67, '联系我们评论', 'lxwm/comment_verify/index', '', 'verify-comment-lxwm', 0, 'fa fa-comments', -1, '');
INSERT INTO `dr_admin_menu` VALUES (136, 62, '联系我们管理', 'lxwm/home/index', '', 'module-lxwm', 0, 'fa fa-align-justify', -1, '');

-- ----------------------------
-- Table structure for dr_admin_min_menu
-- ----------------------------
DROP TABLE IF EXISTS `dr_admin_min_menu`;
CREATE TABLE `dr_admin_min_menu`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` smallint(5) UNSIGNED NOT NULL COMMENT '上级菜单id',
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单语言名称',
  `site` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '站点归属',
  `uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'uri字符串',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '外链地址',
  `mark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单标识',
  `hidden` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '是否隐藏',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标标示',
  `displayorder` int(5) NULL DEFAULT NULL COMMENT '排序值',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `list`(`pid`) USING BTREE,
  INDEX `displayorder`(`displayorder`) USING BTREE,
  INDEX `mark`(`mark`) USING BTREE,
  INDEX `hidden`(`hidden`) USING BTREE,
  INDEX `uri`(`uri`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '后台简化菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_admin_notice
-- ----------------------------
DROP TABLE IF EXISTS `dr_admin_notice`;
CREATE TABLE `dr_admin_notice`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `site` int(5) NOT NULL COMMENT '站点id',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '提醒类型：系统、内容、会员、应用',
  `msg` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '提醒内容说明',
  `uri` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '对应的URI',
  `to_rid` smallint(5) NOT NULL COMMENT '指定角色组',
  `to_uid` int(10) NOT NULL COMMENT '指定管理员',
  `status` tinyint(1) NOT NULL COMMENT '未处理0，1已查看，2处理中，3处理完成',
  `uid` int(10) NOT NULL COMMENT '申请人',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申请人',
  `op_uid` int(10) NOT NULL COMMENT '处理人',
  `op_username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '处理人',
  `updatetime` int(10) NOT NULL COMMENT '处理时间',
  `inputtime` int(10) NOT NULL COMMENT '提醒时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uri`(`uri`) USING BTREE,
  INDEX `site`(`site`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `op_uid`(`op_uid`) USING BTREE,
  INDEX `to_uid`(`to_uid`) USING BTREE,
  INDEX `to_rid`(`to_rid`) USING BTREE,
  INDEX `updatetime`(`updatetime`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台提醒表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dr_admin_notice
-- ----------------------------
INSERT INTO `dr_admin_notice` VALUES (1, 1, 'content', '投诉及维修提交审核', 'form/complaint_verify/edit:id/1', 0, 0, 0, 1, 'admin', 0, '', 0, 1573366884);
INSERT INTO `dr_admin_notice` VALUES (2, 1, 'content', '投诉及维修提交审核', 'form/complaint_verify/edit:id/2', 0, 0, 0, 1, 'admin', 0, '', 0, 1573367164);
INSERT INTO `dr_admin_notice` VALUES (3, 1, 'content', '投诉及维修提交审核', 'form/complaint_verify/edit:id/3', 0, 0, 0, 1, 'admin', 0, '', 0, 1573783060);

-- ----------------------------
-- Table structure for dr_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `dr_admin_role`;
CREATE TABLE `dr_admin_role`  (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `site` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '允许管理的站点，序列化数组格式',
  `name` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色组语言名称',
  `system` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '系统权限',
  `module` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模块权限',
  `application` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '应用权限',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台角色权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dr_admin_role
-- ----------------------------
INSERT INTO `dr_admin_role` VALUES (1, '', '超级管理员', '', '', '');
INSERT INTO `dr_admin_role` VALUES (2, '', '网站编辑员', '', '', '');

-- ----------------------------
-- Table structure for dr_admin_role_index
-- ----------------------------
DROP TABLE IF EXISTS `dr_admin_role_index`;
CREATE TABLE `dr_admin_role_index`  (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) UNSIGNED NULL DEFAULT NULL COMMENT '会员uid',
  `roleid` mediumint(8) UNSIGNED NULL DEFAULT NULL COMMENT '角色组id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `roleid`(`roleid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台角色组分配表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of dr_admin_role_index
-- ----------------------------
INSERT INTO `dr_admin_role_index` VALUES (1, 1, 1);

-- ----------------------------
-- Table structure for dr_admin_setting
-- ----------------------------
DROP TABLE IF EXISTS `dr_admin_setting`;
CREATE TABLE `dr_admin_setting`  (
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统属性参数表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_admin_verify
-- ----------------------------
DROP TABLE IF EXISTS `dr_admin_verify`;
CREATE TABLE `dr_admin_verify`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `verify` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '审核部署',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '审核管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dr_admin_verify
-- ----------------------------
INSERT INTO `dr_admin_verify` VALUES (1, '默认审核', '{\"edit\":\"1\",\"role\":{\"1\":\"2\"}}');

-- ----------------------------
-- Table structure for dr_attachment
-- ----------------------------
DROP TABLE IF EXISTS `dr_attachment`;
CREATE TABLE `dr_attachment`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '会员id',
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会员',
  `siteid` mediumint(5) UNSIGNED NOT NULL COMMENT '站点id',
  `related` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '相关表标识',
  `tableid` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '附件副表id',
  `download` mediumint(8) NOT NULL DEFAULT 0 COMMENT '无用保留',
  `filesize` int(10) UNSIGNED NOT NULL COMMENT '文件大小',
  `fileext` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件扩展名',
  `filemd5` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件md5值',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `author`(`author`) USING BTREE,
  INDEX `relatedtid`(`related`) USING BTREE,
  INDEX `fileext`(`fileext`) USING BTREE,
  INDEX `filemd5`(`filemd5`) USING BTREE,
  INDEX `siteid`(`siteid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 288 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '附件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dr_attachment
-- ----------------------------
INSERT INTO `dr_attachment` VALUES (1, 1, 'admin', 1, 'rand', 1, 0, 21899, 'jpg', '111a0c1fac19f5724b0961ef8a38ed99');
INSERT INTO `dr_attachment` VALUES (2, 1, 'admin', 1, 'rand', 1, 0, 17337, 'jpg', '18ca165850f1fbc69f2145ced15cccd7');
INSERT INTO `dr_attachment` VALUES (3, 1, 'admin', 1, 'rand', 1, 0, 25619, 'jpg', 'd1bea40c6636e184bec8f4fbe5f8de3e');
INSERT INTO `dr_attachment` VALUES (4, 1, 'admin', 1, 'rand', 1, 0, 24092, 'jpg', '18cd3fcc180c33e1aecceb7c647e6644');
INSERT INTO `dr_attachment` VALUES (5, 1, 'admin', 1, 'rand', 1, 0, 55126, 'jpg', 'caf1d53facf2bb67c41b5b51d9262dd0');
INSERT INTO `dr_attachment` VALUES (6, 1, 'admin', 1, 'rand', 1, 0, 51446, 'jpg', '8f2d7508d2a38e13d4d5907459f80a7c');
INSERT INTO `dr_attachment` VALUES (7, 1, 'admin', 1, 'rand', 1, 0, 59817, 'jpg', '06307a3e7c7cb46dd219b368a256ad39');
INSERT INTO `dr_attachment` VALUES (8, 1, 'admin', 1, 'rand', 1, 0, 49040, 'jpg', 'bfd65f252474143fecdb328ad8c95b74');
INSERT INTO `dr_attachment` VALUES (9, 1, 'admin', 1, 'rand', 1, 0, 13321, 'docx', '72ebb1daa72112395facf594d9bae4f9');
INSERT INTO `dr_attachment` VALUES (10, 1, 'admin', 1, 'rand', 1, 0, 149347, 'jpg', 'e2654383a253a6390e20541731eefe1d');
INSERT INTO `dr_attachment` VALUES (11, 1, 'admin', 1, 'rand', 1, 0, 53341, 'jpg', 'e57471aebba6290e362cb092b7cd5d70');
INSERT INTO `dr_attachment` VALUES (12, 1, 'admin', 1, 'rand', 1, 0, 71026, 'jpg', '88c5bb02d4122d1df6443303228a8145');
INSERT INTO `dr_attachment` VALUES (13, 1, 'admin', 1, 'rand', 1, 0, 72655, 'jpg', '9575be870e0939212773ae1e03eae2fc');
INSERT INTO `dr_attachment` VALUES (14, 1, 'admin', 1, 'rand', 1, 0, 49417, 'jpg', '1de65137160ef4809955e01b7fb81028');
INSERT INTO `dr_attachment` VALUES (15, 1, 'admin', 1, 'rand', 1, 0, 58253, 'jpg', '6e57203647cf44c6df11d0f659495517');
INSERT INTO `dr_attachment` VALUES (16, 1, 'admin', 1, 'rand', 1, 0, 35382, 'jpg', 'f598737c0a7a9e4bf1f817e2c7f1a112');
INSERT INTO `dr_attachment` VALUES (17, 1, 'admin', 1, 'rand', 1, 0, 30225, 'jpg', 'df3e6b4c987b7b915bb1bfd53f5347ac');
INSERT INTO `dr_attachment` VALUES (18, 1, 'admin', 1, 'rand', 1, 0, 25078, 'jpg', '232218fbdec97946f344b735e0eeab01');
INSERT INTO `dr_attachment` VALUES (19, 1, 'admin', 1, 'rand', 1, 0, 131658, 'jpg', 'a68f55d900cb170da5933fa07b19ce62');
INSERT INTO `dr_attachment` VALUES (20, 1, 'admin', 1, 'rand', 1, 0, 104607, 'jpg', '9bf14e4a6531fa7cb1025ea748a9fc68');
INSERT INTO `dr_attachment` VALUES (21, 1, 'admin', 1, 'rand', 1, 0, 54923, 'jpg', '017b6e9ce3f0afc856f7475a0c6e6c4f');
INSERT INTO `dr_attachment` VALUES (22, 1, 'admin', 1, 'rand', 1, 0, 104607, 'jpg', '9bf14e4a6531fa7cb1025ea748a9fc68');
INSERT INTO `dr_attachment` VALUES (23, 1, 'admin', 1, 'rand', 1, 0, 131658, 'jpg', 'a68f55d900cb170da5933fa07b19ce62');
INSERT INTO `dr_attachment` VALUES (24, 1, 'admin', 1, 'rand', 1, 0, 76923, 'jpg', 'a64b20b1d669cf21423716270f12b5a2');
INSERT INTO `dr_attachment` VALUES (25, 1, 'admin', 1, 'rand', 1, 0, 7873, 'png', 'a90cffef9e15e56f1bf1626de0c06035');
INSERT INTO `dr_attachment` VALUES (26, 1, 'admin', 1, 'rand', 1, 0, 106076, 'jpg', 'acc82759c37ac94558feafddcf5ad012');
INSERT INTO `dr_attachment` VALUES (27, 1, 'admin', 1, 'rand', 1, 0, 173170, 'jpg', 'e36cda9fcfbb59793a631e2370d8e69c');
INSERT INTO `dr_attachment` VALUES (28, 1, 'admin', 1, 'ueditor:category-edit-id:49', 1, 0, 106076, 'jpg', 'acc82759c37ac94558feafddcf5ad012');
INSERT INTO `dr_attachment` VALUES (29, 1, 'admin', 1, 'ueditor:category-edit-id:49', 1, 0, 173170, 'jpg', 'e36cda9fcfbb59793a631e2370d8e69c');
INSERT INTO `dr_attachment` VALUES (30, 1, 'admin', 1, 'ueditor:category-edit-id:50', 1, 0, 201299, 'jpg', 'dd4490a92cb326f069cefa2ee15e2abb');
INSERT INTO `dr_attachment` VALUES (31, 1, 'admin', 1, 'ueditor:category-edit-id:50', 1, 0, 296747, 'jpg', '5ed35f72722428ecf97d2ea434057d0a');
INSERT INTO `dr_attachment` VALUES (32, 1, 'admin', 1, 'ueditor:category-edit-id:50', 1, 0, 257570, 'jpg', '98054f1d23ac32a9d0b583d39b178fe2');
INSERT INTO `dr_attachment` VALUES (33, 1, 'admin', 1, 'ueditor:category-edit-id:52', 1, 0, 269548, 'jpg', 'af2b336abca67684e85de0d4645bd1ba');
INSERT INTO `dr_attachment` VALUES (34, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 141730, 'jpg', '69d82651019d195730ba6547d1a37ab0');
INSERT INTO `dr_attachment` VALUES (35, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 112003, 'jpg', '6f2268ee8f1c23535fe9c0732d905902');
INSERT INTO `dr_attachment` VALUES (36, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 134096, 'jpg', 'c8abea30c55a0cd75a603bb7f8a90b99');
INSERT INTO `dr_attachment` VALUES (37, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 104868, 'jpg', '13d9c01bceca5d16aeb6f03bdb48d770');
INSERT INTO `dr_attachment` VALUES (38, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 353535, 'jpg', '91a1ef38240fa73fe9948bbafd78b5ea');
INSERT INTO `dr_attachment` VALUES (39, 1, 'admin', 1, 'rand', 1, 0, 141730, 'jpg', '69d82651019d195730ba6547d1a37ab0');
INSERT INTO `dr_attachment` VALUES (40, 1, 'admin', 1, 'rand', 1, 0, 141730, 'jpg', '69d82651019d195730ba6547d1a37ab0');
INSERT INTO `dr_attachment` VALUES (41, 1, 'admin', 1, 'rand', 1, 0, 141730, 'jpg', '69d82651019d195730ba6547d1a37ab0');
INSERT INTO `dr_attachment` VALUES (42, 1, 'admin', 1, 'rand', 1, 0, 134096, 'jpg', 'c8abea30c55a0cd75a603bb7f8a90b99');
INSERT INTO `dr_attachment` VALUES (43, 1, 'admin', 1, 'rand', 1, 0, 134096, 'jpg', 'c8abea30c55a0cd75a603bb7f8a90b99');
INSERT INTO `dr_attachment` VALUES (44, 1, 'admin', 1, 'rand', 1, 0, 112003, 'jpg', '6f2268ee8f1c23535fe9c0732d905902');
INSERT INTO `dr_attachment` VALUES (45, 1, 'admin', 1, 'rand', 1, 0, 104868, 'jpg', '13d9c01bceca5d16aeb6f03bdb48d770');
INSERT INTO `dr_attachment` VALUES (46, 1, 'admin', 1, 'rand', 1, 0, 141730, 'jpg', '69d82651019d195730ba6547d1a37ab0');
INSERT INTO `dr_attachment` VALUES (47, 1, 'admin', 1, 'rand', 1, 0, 112003, 'jpg', '6f2268ee8f1c23535fe9c0732d905902');
INSERT INTO `dr_attachment` VALUES (48, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 141730, 'jpg', '69d82651019d195730ba6547d1a37ab0');
INSERT INTO `dr_attachment` VALUES (49, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 134096, 'jpg', 'c8abea30c55a0cd75a603bb7f8a90b99');
INSERT INTO `dr_attachment` VALUES (50, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 112003, 'jpg', '6f2268ee8f1c23535fe9c0732d905902');
INSERT INTO `dr_attachment` VALUES (51, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 104868, 'jpg', '13d9c01bceca5d16aeb6f03bdb48d770');
INSERT INTO `dr_attachment` VALUES (52, 1, 'admin', 1, 'rand', 1, 0, 112003, 'jpg', '6f2268ee8f1c23535fe9c0732d905902');
INSERT INTO `dr_attachment` VALUES (53, 1, 'admin', 1, 'rand', 1, 0, 104868, 'jpg', '13d9c01bceca5d16aeb6f03bdb48d770');
INSERT INTO `dr_attachment` VALUES (54, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 134096, 'jpg', 'c8abea30c55a0cd75a603bb7f8a90b99');
INSERT INTO `dr_attachment` VALUES (55, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 141730, 'jpg', '69d82651019d195730ba6547d1a37ab0');
INSERT INTO `dr_attachment` VALUES (56, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 112003, 'jpg', '6f2268ee8f1c23535fe9c0732d905902');
INSERT INTO `dr_attachment` VALUES (57, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 104868, 'jpg', '13d9c01bceca5d16aeb6f03bdb48d770');
INSERT INTO `dr_attachment` VALUES (58, 1, 'admin', 1, 'rand', 1, 0, 104868, 'jpg', '13d9c01bceca5d16aeb6f03bdb48d770');
INSERT INTO `dr_attachment` VALUES (59, 1, 'admin', 1, 'rand', 1, 0, 141730, 'jpg', '69d82651019d195730ba6547d1a37ab0');
INSERT INTO `dr_attachment` VALUES (60, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 141730, 'jpg', '69d82651019d195730ba6547d1a37ab0');
INSERT INTO `dr_attachment` VALUES (61, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 134096, 'jpg', 'c8abea30c55a0cd75a603bb7f8a90b99');
INSERT INTO `dr_attachment` VALUES (62, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 112003, 'jpg', '6f2268ee8f1c23535fe9c0732d905902');
INSERT INTO `dr_attachment` VALUES (63, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 104868, 'jpg', '13d9c01bceca5d16aeb6f03bdb48d770');
INSERT INTO `dr_attachment` VALUES (64, 1, 'admin', 1, 'rand', 1, 0, 141730, 'jpg', '69d82651019d195730ba6547d1a37ab0');
INSERT INTO `dr_attachment` VALUES (65, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 114186, 'jpg', '666422ebf27c31adad5c2166d984d7cb');
INSERT INTO `dr_attachment` VALUES (66, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 324429, 'jpg', '39992b56a95066ab98a3e44f4f7a8c30');
INSERT INTO `dr_attachment` VALUES (67, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 354958, 'jpg', '8bef274e604c08a5ad5de3dc8dece318');
INSERT INTO `dr_attachment` VALUES (68, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 304390, 'jpg', '761ff58e267007363d0e4e46f9f8c78f');
INSERT INTO `dr_attachment` VALUES (69, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 307874, 'jpg', 'a1d70c17b8ca5bae36f38fd433056863');
INSERT INTO `dr_attachment` VALUES (70, 1, 'admin', 1, 'rand', 1, 0, 134096, 'jpg', 'c8abea30c55a0cd75a603bb7f8a90b99');
INSERT INTO `dr_attachment` VALUES (71, 1, 'admin', 1, 'rand', 1, 0, 141730, 'jpg', '69d82651019d195730ba6547d1a37ab0');
INSERT INTO `dr_attachment` VALUES (72, 1, 'admin', 1, 'rand', 1, 0, 336751, 'jpg', 'b78bcd2c3ede7f90f7c62c5094c11255');
INSERT INTO `dr_attachment` VALUES (73, 1, 'admin', 1, 'rand', 1, 0, 342323, 'jpg', 'a8c12ec334cc5551d5c6572a733e9137');
INSERT INTO `dr_attachment` VALUES (74, 1, 'admin', 1, 'rand', 1, 0, 268314, 'jpg', '34461e55babe08d6ebe87d474947d3d2');
INSERT INTO `dr_attachment` VALUES (75, 1, 'admin', 1, 'rand', 1, 0, 336751, 'jpg', 'b78bcd2c3ede7f90f7c62c5094c11255');
INSERT INTO `dr_attachment` VALUES (76, 1, 'admin', 1, 'rand', 1, 0, 340976, 'jpg', '7b091f58344c84dc4f73b5bc852a77c4');
INSERT INTO `dr_attachment` VALUES (77, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 122867, 'jpg', '3b92710fb83f3527db723fe3b6d3ab01');
INSERT INTO `dr_attachment` VALUES (78, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 343129, 'jpg', 'd61f5818a2ae02fbcf58cce12617bf38');
INSERT INTO `dr_attachment` VALUES (79, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 307845, 'jpg', 'f1cd3918d7fb35ca3368d24dd34a0714');
INSERT INTO `dr_attachment` VALUES (80, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 279282, 'jpg', '05001c1e8a25c7ddaea119361f3229cf');
INSERT INTO `dr_attachment` VALUES (81, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 314404, 'jpg', '8e342388b073e7a2270e4ec997585bbd');
INSERT INTO `dr_attachment` VALUES (82, 1, 'admin', 1, 'rand', 1, 0, 322793, 'jpg', '3945776d6abc304aa7d0a26962598cc2');
INSERT INTO `dr_attachment` VALUES (83, 1, 'admin', 1, 'rand', 1, 0, 302791, 'jpg', '969527ea45adbcdde49d3dbfcfb38da9');
INSERT INTO `dr_attachment` VALUES (84, 1, 'admin', 1, 'rand', 1, 0, 320640, 'jpg', 'eb56c9aed31a459330735c4a982a0531');
INSERT INTO `dr_attachment` VALUES (85, 1, 'admin', 1, 'rand', 1, 0, 322793, 'jpg', '3945776d6abc304aa7d0a26962598cc2');
INSERT INTO `dr_attachment` VALUES (86, 1, 'admin', 1, 'rand', 1, 0, 279282, 'jpg', '05001c1e8a25c7ddaea119361f3229cf');
INSERT INTO `dr_attachment` VALUES (87, 1, 'admin', 1, 'rand', 1, 0, 314185, 'jpg', '0bffb9d87a7c7358c388c7366a8fb570');
INSERT INTO `dr_attachment` VALUES (88, 1, 'admin', 1, 'rand', 1, 0, 345936, 'jpg', '1c4a7673390d6441a208fea82b06aeb6');
INSERT INTO `dr_attachment` VALUES (89, 1, 'admin', 1, 'rand', 1, 0, 291475, 'jpg', 'd1cadf526faf18d3d9ff69148f663649');
INSERT INTO `dr_attachment` VALUES (90, 1, 'admin', 1, 'rand', 1, 0, 341218, 'jpg', '838d12a3980664b039b2b5eaf7eddee3');
INSERT INTO `dr_attachment` VALUES (91, 1, 'admin', 1, 'rand', 1, 0, 326360, 'jpg', 'c89ac9334f06e71b7a84be479578fa8f');
INSERT INTO `dr_attachment` VALUES (92, 1, 'admin', 1, 'rand', 1, 0, 291475, 'jpg', 'd1cadf526faf18d3d9ff69148f663649');
INSERT INTO `dr_attachment` VALUES (93, 1, 'admin', 1, 'rand', 1, 0, 321735, 'jpg', '2c62ca35069f66fd7c4dfbcb3d151b93');
INSERT INTO `dr_attachment` VALUES (94, 1, 'admin', 1, 'rand', 1, 0, 277506, 'jpg', '95d172d982ec4e54e84c207fbfd458a8');
INSERT INTO `dr_attachment` VALUES (95, 1, 'admin', 1, 'rand', 1, 0, 321735, 'jpg', '2c62ca35069f66fd7c4dfbcb3d151b93');
INSERT INTO `dr_attachment` VALUES (96, 1, 'admin', 1, 'rand', 1, 0, 313236, 'jpg', '34278495ee7d2d824e1a3903f673e09f');
INSERT INTO `dr_attachment` VALUES (97, 1, 'admin', 1, 'rand', 1, 0, 341739, 'jpg', 'df9f57a944c837eff53c76ebd49ec0e5');
INSERT INTO `dr_attachment` VALUES (98, 1, 'admin', 1, 'rand', 1, 0, 313236, 'jpg', '34278495ee7d2d824e1a3903f673e09f');
INSERT INTO `dr_attachment` VALUES (99, 1, 'admin', 1, 'rand', 1, 0, 344299, 'jpg', '9971dc512e397f8f83e9965a0871e061');
INSERT INTO `dr_attachment` VALUES (100, 1, 'admin', 1, 'rand', 1, 0, 348358, 'jpg', 'c525101184c1eac39868b27c482131ee');
INSERT INTO `dr_attachment` VALUES (101, 1, 'admin', 1, 'rand', 1, 0, 319515, 'jpg', '0ae4e20f81b0487a02614773ebe27890');
INSERT INTO `dr_attachment` VALUES (102, 1, 'admin', 1, 'rand', 1, 0, 319515, 'jpg', '0ae4e20f81b0487a02614773ebe27890');
INSERT INTO `dr_attachment` VALUES (103, 1, 'admin', 1, 'rand', 1, 0, 347023, 'jpg', '98492b5d23d6ca42d6c1e17abf79fc49');
INSERT INTO `dr_attachment` VALUES (104, 1, 'admin', 1, 'rand', 1, 0, 318347, 'jpg', '6656562c4ede2c8b69cb47c00d49cf6f');
INSERT INTO `dr_attachment` VALUES (105, 1, 'admin', 1, 'rand', 1, 0, 353535, 'jpg', '91a1ef38240fa73fe9948bbafd78b5ea');
INSERT INTO `dr_attachment` VALUES (106, 1, 'admin', 1, 'rand', 1, 0, 353535, 'jpg', '91a1ef38240fa73fe9948bbafd78b5ea');
INSERT INTO `dr_attachment` VALUES (107, 1, 'admin', 1, 'rand', 1, 0, 335192, 'jpg', '11291468529461e228883ce151552bf3');
INSERT INTO `dr_attachment` VALUES (108, 1, 'admin', 1, 'rand', 1, 0, 335192, 'jpg', '11291468529461e228883ce151552bf3');
INSERT INTO `dr_attachment` VALUES (109, 1, 'admin', 1, 'rand', 1, 0, 294940, 'jpg', '07c300c3fe3d93c46c6c4b44567259a4');
INSERT INTO `dr_attachment` VALUES (110, 1, 'admin', 1, 'rand', 1, 0, 294940, 'jpg', '07c300c3fe3d93c46c6c4b44567259a4');
INSERT INTO `dr_attachment` VALUES (111, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 126215, 'jpg', 'd033ce8e0fd3e9df5d2c2010137184fd');
INSERT INTO `dr_attachment` VALUES (112, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 196802, 'jpg', '7cc064daf22cfd969aed19891eeafa90');
INSERT INTO `dr_attachment` VALUES (113, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 173779, 'jpg', '19eabfecd4aaefdb92409432124141be');
INSERT INTO `dr_attachment` VALUES (114, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 96781, 'jpg', '84b4d88ec8e6c3d184f0d2b37c735de7');
INSERT INTO `dr_attachment` VALUES (115, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 155812, 'jpg', 'c5267af73f7ff9549daeceae3adf74be');
INSERT INTO `dr_attachment` VALUES (116, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 151662, 'jpg', '7db44c20845dc728125680ab945b9990');
INSERT INTO `dr_attachment` VALUES (117, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 239753, 'jpg', '885ee670fb6d999254be3719eca96b49');
INSERT INTO `dr_attachment` VALUES (118, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 242869, 'jpg', 'ccf4c340e3ae63784909674640a7b7b0');
INSERT INTO `dr_attachment` VALUES (119, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 250721, 'jpg', '0b5cc87c1388d5e1db10915e828b799f');
INSERT INTO `dr_attachment` VALUES (120, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 273225, 'jpg', '0691d1294e9475f5140ff84897f23c38');
INSERT INTO `dr_attachment` VALUES (121, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 212757, 'jpg', '732a05753148022b8d6f633dede88279');
INSERT INTO `dr_attachment` VALUES (122, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 263675, 'jpg', '3c4aa1835cfe58f08ce5ea83333cbe54');
INSERT INTO `dr_attachment` VALUES (123, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 216268, 'jpg', 'c30e04c0d94ca4020ae4c2498fac663c');
INSERT INTO `dr_attachment` VALUES (124, 1, 'admin', 1, 'rand', 1, 0, 331571, 'jpg', '8e1fc17b3585baf53ad8368c9a813c43');
INSERT INTO `dr_attachment` VALUES (125, 1, 'admin', 1, 'rand', 1, 0, 331571, 'jpg', '8e1fc17b3585baf53ad8368c9a813c43');
INSERT INTO `dr_attachment` VALUES (126, 1, 'admin', 1, 'ueditor:photo-home-edit-id:67', 1, 0, 331571, 'jpg', '8e1fc17b3585baf53ad8368c9a813c43');
INSERT INTO `dr_attachment` VALUES (127, 1, 'admin', 1, 'ueditor:photo-home-edit-id:67', 1, 0, 294940, 'jpg', '07c300c3fe3d93c46c6c4b44567259a4');
INSERT INTO `dr_attachment` VALUES (128, 1, 'admin', 1, 'ueditor:photo-home-edit-id:69', 1, 0, 291475, 'jpg', 'd1cadf526faf18d3d9ff69148f663649');
INSERT INTO `dr_attachment` VALUES (129, 1, 'admin', 1, 'ueditor:photo-home-edit-id:69', 1, 0, 341218, 'jpg', '838d12a3980664b039b2b5eaf7eddee3');
INSERT INTO `dr_attachment` VALUES (130, 1, 'admin', 1, 'ueditor:photo-home-edit-id:69', 1, 0, 314185, 'jpg', '0bffb9d87a7c7358c388c7366a8fb570');
INSERT INTO `dr_attachment` VALUES (131, 1, 'admin', 1, 'ueditor:photo-home-edit-id:69', 1, 0, 326360, 'jpg', 'c89ac9334f06e71b7a84be479578fa8f');
INSERT INTO `dr_attachment` VALUES (132, 1, 'admin', 1, 'ueditor:photo-home-edit-id:69', 1, 0, 345936, 'jpg', '1c4a7673390d6441a208fea82b06aeb6');
INSERT INTO `dr_attachment` VALUES (133, 1, 'admin', 1, 'ueditor:photo-home-edit-id:68', 1, 0, 321735, 'jpg', '2c62ca35069f66fd7c4dfbcb3d151b93');
INSERT INTO `dr_attachment` VALUES (134, 1, 'admin', 1, 'ueditor:photo-home-edit-id:68', 1, 0, 277506, 'jpg', '95d172d982ec4e54e84c207fbfd458a8');
INSERT INTO `dr_attachment` VALUES (135, 1, 'admin', 1, 'ueditor:photo-home-edit-id:66', 1, 0, 201773, 'jpg', 'd1d80fefe8d7201a08f06d8202818b50');
INSERT INTO `dr_attachment` VALUES (136, 1, 'admin', 1, 'ueditor:photo-home-edit-id:65', 1, 0, 353535, 'jpg', '91a1ef38240fa73fe9948bbafd78b5ea');
INSERT INTO `dr_attachment` VALUES (137, 1, 'admin', 1, 'ueditor:photo-home-edit-id:64', 1, 0, 341769, 'jpg', 'cf2ecaa8f35a98225224822941aa8f62');
INSERT INTO `dr_attachment` VALUES (138, 1, 'admin', 1, 'ueditor:photo-home-edit-id:64', 1, 0, 319515, 'jpg', '0ae4e20f81b0487a02614773ebe27890');
INSERT INTO `dr_attachment` VALUES (139, 1, 'admin', 1, 'ueditor:photo-home-edit-id:64', 1, 0, 318347, 'jpg', '6656562c4ede2c8b69cb47c00d49cf6f');
INSERT INTO `dr_attachment` VALUES (140, 1, 'admin', 1, 'ueditor:photo-home-edit-id:63', 1, 0, 304888, 'jpg', 'a9b2de90752531d6be036be9782dfc83');
INSERT INTO `dr_attachment` VALUES (141, 1, 'admin', 1, 'ueditor:photo-home-edit-id:63', 1, 0, 289400, 'jpg', '28a29f0a44dd5ddff397e784b627c69b');
INSERT INTO `dr_attachment` VALUES (142, 1, 'admin', 1, 'ueditor:photo-home-edit-id:63', 1, 0, 288312, 'jpg', '9f01674b1280563a4ec59de74ba2a470');
INSERT INTO `dr_attachment` VALUES (143, 1, 'admin', 1, 'ueditor:photo-home-edit-id:63', 1, 0, 322591, 'jpg', '2d6d957c83897a5a840785c72dceef5d');
INSERT INTO `dr_attachment` VALUES (144, 1, 'admin', 1, 'ueditor:photo-home-edit-id:62', 1, 0, 320640, 'jpg', 'eb56c9aed31a459330735c4a982a0531');
INSERT INTO `dr_attachment` VALUES (145, 1, 'admin', 1, 'ueditor:photo-home-edit-id:62', 1, 0, 302791, 'jpg', '969527ea45adbcdde49d3dbfcfb38da9');
INSERT INTO `dr_attachment` VALUES (146, 1, 'admin', 1, 'ueditor:photo-home-edit-id:62', 1, 0, 322793, 'jpg', '3945776d6abc304aa7d0a26962598cc2');
INSERT INTO `dr_attachment` VALUES (147, 1, 'admin', 1, 'ueditor:photo-home-edit-id:60', 1, 0, 268314, 'jpg', '34461e55babe08d6ebe87d474947d3d2');
INSERT INTO `dr_attachment` VALUES (148, 1, 'admin', 1, 'ueditor:photo-home-edit-id:60', 1, 0, 342323, 'jpg', 'a8c12ec334cc5551d5c6572a733e9137');
INSERT INTO `dr_attachment` VALUES (149, 1, 'admin', 1, 'ueditor:photo-home-edit-id:60', 1, 0, 336751, 'jpg', 'b78bcd2c3ede7f90f7c62c5094c11255');
INSERT INTO `dr_attachment` VALUES (150, 1, 'admin', 1, 'ueditor:photo-home-edit-id:58', 1, 0, 141730, 'jpg', '69d82651019d195730ba6547d1a37ab0');
INSERT INTO `dr_attachment` VALUES (151, 1, 'admin', 1, 'ueditor:photo-home-edit-id:57', 1, 0, 104868, 'jpg', '13d9c01bceca5d16aeb6f03bdb48d770');
INSERT INTO `dr_attachment` VALUES (152, 1, 'admin', 1, 'ueditor:photo-home-edit-id:56', 1, 0, 112003, 'jpg', '6f2268ee8f1c23535fe9c0732d905902');
INSERT INTO `dr_attachment` VALUES (153, 1, 'admin', 1, 'ueditor:photo-home-edit-id:58', 1, 0, 261609, 'jpg', '0c47994bcc00a672618b1bc368db11de');
INSERT INTO `dr_attachment` VALUES (154, 1, 'admin', 1, 'ueditor:photo-home-edit-id:57', 1, 0, 104868, 'jpg', '13d9c01bceca5d16aeb6f03bdb48d770');
INSERT INTO `dr_attachment` VALUES (155, 1, 'admin', 1, 'ueditor:photo-home-edit-id:57', 1, 0, 255451, 'jpg', '478b1640e6ed478a6c1f90a6c65742dc');
INSERT INTO `dr_attachment` VALUES (156, 1, 'admin', 1, 'ueditor:photo-home-edit-id:56', 1, 0, 325906, 'jpg', '5a241da1a7b04cd94719f4784bc18db2');
INSERT INTO `dr_attachment` VALUES (157, 1, 'admin', 1, 'rand', 1, 0, 141730, 'jpg', '69d82651019d195730ba6547d1a37ab0');
INSERT INTO `dr_attachment` VALUES (158, 1, 'admin', 1, 'rand', 1, 0, 331571, 'jpg', '8e1fc17b3585baf53ad8368c9a813c43');
INSERT INTO `dr_attachment` VALUES (159, 1, 'admin', 1, 'rand', 1, 0, 250721, 'jpg', '0b5cc87c1388d5e1db10915e828b799f');
INSERT INTO `dr_attachment` VALUES (160, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 250721, 'jpg', '0b5cc87c1388d5e1db10915e828b799f');
INSERT INTO `dr_attachment` VALUES (161, 1, 'admin', 1, 'rand', 1, 0, 212757, 'jpg', '732a05753148022b8d6f633dede88279');
INSERT INTO `dr_attachment` VALUES (162, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 212757, 'jpg', '732a05753148022b8d6f633dede88279');
INSERT INTO `dr_attachment` VALUES (163, 1, 'admin', 1, 'rand', 1, 0, 273225, 'jpg', '0691d1294e9475f5140ff84897f23c38');
INSERT INTO `dr_attachment` VALUES (164, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 273225, 'jpg', '0691d1294e9475f5140ff84897f23c38');
INSERT INTO `dr_attachment` VALUES (165, 1, 'admin', 1, 'rand', 1, 0, 263675, 'jpg', '3c4aa1835cfe58f08ce5ea83333cbe54');
INSERT INTO `dr_attachment` VALUES (166, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 263675, 'jpg', '3c4aa1835cfe58f08ce5ea83333cbe54');
INSERT INTO `dr_attachment` VALUES (167, 1, 'admin', 1, 'rand', 1, 0, 216268, 'jpg', 'c30e04c0d94ca4020ae4c2498fac663c');
INSERT INTO `dr_attachment` VALUES (168, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 216268, 'jpg', 'c30e04c0d94ca4020ae4c2498fac663c');
INSERT INTO `dr_attachment` VALUES (169, 1, 'admin', 1, 'rand', 1, 0, 242869, 'jpg', 'ccf4c340e3ae63784909674640a7b7b0');
INSERT INTO `dr_attachment` VALUES (170, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 242869, 'jpg', 'ccf4c340e3ae63784909674640a7b7b0');
INSERT INTO `dr_attachment` VALUES (171, 1, 'admin', 1, 'rand', 1, 0, 239753, 'jpg', '885ee670fb6d999254be3719eca96b49');
INSERT INTO `dr_attachment` VALUES (172, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 239753, 'jpg', '885ee670fb6d999254be3719eca96b49');
INSERT INTO `dr_attachment` VALUES (173, 1, 'admin', 1, 'rand', 1, 0, 126215, 'jpg', 'd033ce8e0fd3e9df5d2c2010137184fd');
INSERT INTO `dr_attachment` VALUES (174, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 126215, 'jpg', 'd033ce8e0fd3e9df5d2c2010137184fd');
INSERT INTO `dr_attachment` VALUES (175, 1, 'admin', 1, 'rand', 1, 0, 331571, 'jpg', '8e1fc17b3585baf53ad8368c9a813c43');
INSERT INTO `dr_attachment` VALUES (176, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 331571, 'jpg', '8e1fc17b3585baf53ad8368c9a813c43');
INSERT INTO `dr_attachment` VALUES (177, 1, 'admin', 1, 'rand', 1, 0, 155812, 'jpg', 'c5267af73f7ff9549daeceae3adf74be');
INSERT INTO `dr_attachment` VALUES (178, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 155812, 'jpg', 'c5267af73f7ff9549daeceae3adf74be');
INSERT INTO `dr_attachment` VALUES (179, 1, 'admin', 1, 'rand', 1, 0, 96781, 'jpg', '84b4d88ec8e6c3d184f0d2b37c735de7');
INSERT INTO `dr_attachment` VALUES (180, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 96781, 'jpg', '84b4d88ec8e6c3d184f0d2b37c735de7');
INSERT INTO `dr_attachment` VALUES (181, 1, 'admin', 1, 'rand', 1, 0, 151662, 'jpg', '7db44c20845dc728125680ab945b9990');
INSERT INTO `dr_attachment` VALUES (182, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 151662, 'jpg', '7db44c20845dc728125680ab945b9990');
INSERT INTO `dr_attachment` VALUES (183, 1, 'admin', 1, 'rand', 1, 0, 196802, 'jpg', '7cc064daf22cfd969aed19891eeafa90');
INSERT INTO `dr_attachment` VALUES (184, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 196802, 'jpg', '7cc064daf22cfd969aed19891eeafa90');
INSERT INTO `dr_attachment` VALUES (185, 1, 'admin', 1, 'rand', 1, 0, 167526, 'jpg', '16f077b14cc6480c72b0e78526fceee3');
INSERT INTO `dr_attachment` VALUES (186, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 167526, 'jpg', '16f077b14cc6480c72b0e78526fceee3');
INSERT INTO `dr_attachment` VALUES (187, 1, 'admin', 1, 'rand', 1, 0, 175985, 'jpg', '61e33c9589ca4442df9afabb4977baaa');
INSERT INTO `dr_attachment` VALUES (188, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 175985, 'jpg', '61e33c9589ca4442df9afabb4977baaa');
INSERT INTO `dr_attachment` VALUES (189, 1, 'admin', 1, 'rand', 1, 0, 186906, 'jpg', '97bf09a303749bc5677a4f00fe8ab043');
INSERT INTO `dr_attachment` VALUES (190, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 186906, 'jpg', '97bf09a303749bc5677a4f00fe8ab043');
INSERT INTO `dr_attachment` VALUES (191, 1, 'admin', 1, 'rand', 1, 0, 285927, 'jpg', '71b66d22054b65b517e5f31608b7c35e');
INSERT INTO `dr_attachment` VALUES (192, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 285927, 'jpg', '71b66d22054b65b517e5f31608b7c35e');
INSERT INTO `dr_attachment` VALUES (193, 1, 'admin', 1, 'rand', 1, 0, 188659, 'jpg', 'f23cd36ef8918dc3f966b4d5effb4783');
INSERT INTO `dr_attachment` VALUES (194, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 188659, 'jpg', 'f23cd36ef8918dc3f966b4d5effb4783');
INSERT INTO `dr_attachment` VALUES (195, 1, 'admin', 1, 'rand', 1, 0, 263060, 'jpg', 'd5789755c1939b2bfb81a20e9d255442');
INSERT INTO `dr_attachment` VALUES (196, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 263060, 'jpg', 'd5789755c1939b2bfb81a20e9d255442');
INSERT INTO `dr_attachment` VALUES (197, 1, 'admin', 1, 'rand', 1, 0, 264047, 'jpg', 'b79af9efa2e3a5938cb1dba0d14a0f70');
INSERT INTO `dr_attachment` VALUES (198, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 264047, 'jpg', 'b79af9efa2e3a5938cb1dba0d14a0f70');
INSERT INTO `dr_attachment` VALUES (199, 1, 'admin', 1, 'rand', 1, 0, 350044, 'jpg', '3e54f7638488bcad75ff08f2550dd330');
INSERT INTO `dr_attachment` VALUES (200, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 350044, 'jpg', '3e54f7638488bcad75ff08f2550dd330');
INSERT INTO `dr_attachment` VALUES (201, 1, 'admin', 1, 'rand', 1, 0, 251310, 'jpg', 'ffe0b6305360d0e763ab7a13ab5f3528');
INSERT INTO `dr_attachment` VALUES (202, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 251310, 'jpg', 'ffe0b6305360d0e763ab7a13ab5f3528');
INSERT INTO `dr_attachment` VALUES (203, 1, 'admin', 1, 'rand', 1, 0, 335268, 'jpg', '87735cda05bbc5f37251857999167faf');
INSERT INTO `dr_attachment` VALUES (204, 1, 'admin', 1, 'rand', 1, 0, 289835, 'jpg', 'bcf5e18646311f100f0cd2d338890db9');
INSERT INTO `dr_attachment` VALUES (205, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 289835, 'jpg', 'bcf5e18646311f100f0cd2d338890db9');
INSERT INTO `dr_attachment` VALUES (206, 1, 'admin', 1, 'rand', 1, 0, 289835, 'jpg', 'bcf5e18646311f100f0cd2d338890db9');
INSERT INTO `dr_attachment` VALUES (207, 1, 'admin', 1, 'ueditor:photo-home-add-id:0', 1, 0, 289835, 'jpg', 'bcf5e18646311f100f0cd2d338890db9');
INSERT INTO `dr_attachment` VALUES (208, 1, 'admin', 1, 'ueditor:photo-home-edit-id:108', 1, 0, 339671, 'jpg', '9f17a4e169bb45f4aa8a2ef1224ec791');
INSERT INTO `dr_attachment` VALUES (209, 1, 'admin', 1, 'ueditor:photo-home-edit-id:108', 1, 0, 232562, 'jpg', 'a8cb95fcb2696b579605485853704f8a');
INSERT INTO `dr_attachment` VALUES (210, 1, 'admin', 1, 'ueditor:photo-home-edit-id:108', 1, 0, 339671, 'jpg', '9f17a4e169bb45f4aa8a2ef1224ec791');
INSERT INTO `dr_attachment` VALUES (211, 1, 'admin', 1, 'ueditor:photo-home-edit-id:108', 1, 0, 239195, 'jpg', '3c468d28418171e45d5badcfa682dcdc');
INSERT INTO `dr_attachment` VALUES (212, 1, 'admin', 1, 'ueditor:photo-home-edit-id:108', 1, 0, 166910, 'jpg', '277acdc0de44ef62a2e13ed5f7fcdbd0');
INSERT INTO `dr_attachment` VALUES (213, 1, 'admin', 1, 'ueditor:photo-home-edit-id:104', 1, 0, 249432, 'jpg', '1d82d8d93e575f96783a7db68db361e8');
INSERT INTO `dr_attachment` VALUES (214, 1, 'admin', 1, 'ueditor:photo-home-edit-id:104', 1, 0, 317100, 'jpg', '0206668d45235734c8a739e00242dfb6');
INSERT INTO `dr_attachment` VALUES (215, 1, 'admin', 1, 'ueditor:photo-home-edit-id:104', 1, 0, 270024, 'jpg', '52c4cb39046ae43fced6f9d49d328f59');
INSERT INTO `dr_attachment` VALUES (216, 1, 'admin', 1, 'ueditor:photo-home-edit-id:105', 1, 0, 257207, 'jpg', '7609fa1cf7066d642122132512be4785');
INSERT INTO `dr_attachment` VALUES (217, 1, 'admin', 1, 'ueditor:photo-home-edit-id:107', 1, 0, 281440, 'jpg', '849b743df00c6e261e99fa69ffab03e6');
INSERT INTO `dr_attachment` VALUES (218, 1, 'admin', 1, 'ueditor:photo-home-edit-id:107', 1, 0, 300004, 'jpg', '793e88a468b81c08602af2ccd1d457d3');
INSERT INTO `dr_attachment` VALUES (219, 1, 'admin', 1, 'ueditor:photo-home-edit-id:106', 1, 0, 237488, 'jpg', 'e1df29b52330e65ba42eaeeecd62d65a');
INSERT INTO `dr_attachment` VALUES (220, 1, 'admin', 1, 'ueditor:photo-home-edit-id:106', 1, 0, 293320, 'jpg', 'c3e09d9b91ae26733c26342d74554b0a');
INSERT INTO `dr_attachment` VALUES (221, 1, 'admin', 1, 'ueditor:photo-home-edit-id:110', 1, 0, 297667, 'jpg', 'f31f49904e2fa6ab68fb39fa67564356');
INSERT INTO `dr_attachment` VALUES (222, 1, 'admin', 1, 'ueditor:photo-home-edit-id:110', 1, 0, 334695, 'jpg', 'cc987f634f07c9a60aad26d6930409b6');
INSERT INTO `dr_attachment` VALUES (223, 1, 'admin', 1, 'ueditor:photo-home-edit-id:111', 1, 0, 332573, 'jpg', '037eb78765b046aa102107838b9cb6f4');
INSERT INTO `dr_attachment` VALUES (224, 1, 'admin', 1, 'ueditor:photo-home-edit-id:111', 1, 0, 141801, 'jpg', '742d73032ef9e619f14044d9fa139a17');
INSERT INTO `dr_attachment` VALUES (225, 1, 'admin', 1, 'ueditor:photo-home-edit-id:112', 1, 0, 332295, 'jpg', '38ce3179cfff51f6f0be27dfa60f4989');
INSERT INTO `dr_attachment` VALUES (226, 1, 'admin', 1, 'ueditor:photo-home-edit-id:112', 1, 0, 279647, 'jpg', '70a35c696adf219723af20da61c36d47');
INSERT INTO `dr_attachment` VALUES (227, 1, 'admin', 1, 'ueditor:photo-home-edit-id:112', 1, 0, 236681, 'jpg', 'fdac3bfadc6c0452bd4f0dfa8312fa05');
INSERT INTO `dr_attachment` VALUES (228, 1, 'admin', 1, 'ueditor:photo-home-edit-id:112', 1, 0, 239483, 'jpg', 'a828b06fae981d70c0db0a31d11aafed');
INSERT INTO `dr_attachment` VALUES (229, 1, 'admin', 1, 'ueditor:photo-home-edit-id:112', 1, 0, 210010, 'jpg', 'a87a9e06ce887f7da53c92087e9c0f84');
INSERT INTO `dr_attachment` VALUES (230, 1, 'admin', 1, 'ueditor:photo-home-edit-id:112', 1, 0, 239483, 'jpg', 'a828b06fae981d70c0db0a31d11aafed');
INSERT INTO `dr_attachment` VALUES (231, 1, 'admin', 1, 'ueditor:photo-home-edit-id:113', 1, 0, 283994, 'jpg', '821dbc68f09bd3f43caad33ecf023d46');
INSERT INTO `dr_attachment` VALUES (232, 1, 'admin', 1, 'ueditor:photo-home-edit-id:113', 1, 0, 302068, 'jpg', '3fabcea03422af5f95f9fb25eb64fdbb');
INSERT INTO `dr_attachment` VALUES (233, 1, 'admin', 1, 'ueditor:photo-home-edit-id:113', 1, 0, 270101, 'jpg', 'd1c7a27bf22a6e4cfdbee959cdf47648');
INSERT INTO `dr_attachment` VALUES (234, 1, 'admin', 1, 'ueditor:photo-home-edit-id:113', 1, 0, 299299, 'jpg', 'f6c4290d7ed12cf7ee97e7ba0963ed85');
INSERT INTO `dr_attachment` VALUES (235, 1, 'admin', 1, 'ueditor:photo-home-edit-id:113', 1, 0, 276379, 'jpg', '1eea8df11870c2c829b739bb11948d17');
INSERT INTO `dr_attachment` VALUES (236, 1, 'admin', 1, 'rand', 1, 0, 279647, 'jpg', '70a35c696adf219723af20da61c36d47');
INSERT INTO `dr_attachment` VALUES (237, 1, 'admin', 1, 'ueditor:category-edit-id:47', 1, 0, 8888, 'jpg', '6648cfb2e1f0ce30112fc07afab2bea3');
INSERT INTO `dr_attachment` VALUES (238, 1, 'admin', 1, 'ueditor:category-edit-id:47', 1, 0, 8888, 'jpg', '6648cfb2e1f0ce30112fc07afab2bea3');
INSERT INTO `dr_attachment` VALUES (239, 1, 'admin', 1, 'ueditor:category-edit-id:47', 1, 0, 8888, 'jpg', '6648cfb2e1f0ce30112fc07afab2bea3');
INSERT INTO `dr_attachment` VALUES (240, 1, 'admin', 1, 'ueditor:category-edit-id:47', 1, 0, 4857, 'jpg', 'edb51bc34caf46c0994a4b21575a6456');
INSERT INTO `dr_attachment` VALUES (241, 1, 'admin', 1, 'ueditor:category-edit-id:47', 1, 0, 10523, 'jpg', '2d605d0192b6de876f4b6acafb0b44de');
INSERT INTO `dr_attachment` VALUES (242, 1, 'admin', 1, 'ueditor:category-edit-id:47', 1, 0, 8888, 'jpg', '6648cfb2e1f0ce30112fc07afab2bea3');
INSERT INTO `dr_attachment` VALUES (243, 1, 'admin', 1, 'ueditor:category-edit-id:47', 1, 0, 8888, 'jpg', '6648cfb2e1f0ce30112fc07afab2bea3');
INSERT INTO `dr_attachment` VALUES (244, 1, 'admin', 1, 'ueditor:category-edit-id:47', 1, 0, 4857, 'jpg', 'edb51bc34caf46c0994a4b21575a6456');
INSERT INTO `dr_attachment` VALUES (245, 1, 'admin', 1, 'ueditor:category-edit-id:47', 1, 0, 10523, 'jpg', '2d605d0192b6de876f4b6acafb0b44de');
INSERT INTO `dr_attachment` VALUES (246, 1, 'admin', 1, 'ueditor:news-home-add-id:0', 1, 0, 220147, 'jpg', '71bbd7c0c6f6cae33fde7da1676ffb45');
INSERT INTO `dr_attachment` VALUES (247, 1, 'admin', 1, 'rand', 1, 0, 220147, 'jpg', '71bbd7c0c6f6cae33fde7da1676ffb45');
INSERT INTO `dr_attachment` VALUES (248, 1, 'admin', 1, 'rand', 1, 0, 345012, 'jpg', '68b1cb43f63bbb824f03c166095968ed');
INSERT INTO `dr_attachment` VALUES (249, 1, 'admin', 1, 'rand', 1, 0, 297667, 'jpg', 'f31f49904e2fa6ab68fb39fa67564356');
INSERT INTO `dr_attachment` VALUES (250, 1, 'admin', 1, 'ueditor:news-home-add-id:0', 1, 0, 250312, 'jpg', '986ea5ef89e04d4b68e99a10d161ac06');
INSERT INTO `dr_attachment` VALUES (251, 1, 'admin', 1, 'ueditor:news-home-add-id:0', 1, 0, 286293, 'jpg', 'aa52dec8556f0c461ac832b60a867733');
INSERT INTO `dr_attachment` VALUES (252, 1, 'admin', 1, 'rand', 1, 0, 202339, 'jpg', '8d4f3ecc456ec4dee485b01a46799fe9');
INSERT INTO `dr_attachment` VALUES (253, 1, 'admin', 1, 'ueditor:news-home-add-id:0', 1, 0, 202339, 'jpg', '8d4f3ecc456ec4dee485b01a46799fe9');
INSERT INTO `dr_attachment` VALUES (254, 1, 'admin', 1, 'rand', 1, 0, 176852, 'jpg', '0050684a567609d1ccf85ab9af9208cc');
INSERT INTO `dr_attachment` VALUES (255, 1, 'admin', 1, 'ueditor:news-home-add-id:0', 1, 0, 176852, 'jpg', '0050684a567609d1ccf85ab9af9208cc');
INSERT INTO `dr_attachment` VALUES (256, 1, 'admin', 1, 'ueditor:news-home-add-id:0', 1, 0, 139823, 'jpg', '43966089eb25341d8c0908a046d9f080');
INSERT INTO `dr_attachment` VALUES (257, 1, 'admin', 1, 'ueditor:news-home-add-id:0', 1, 0, 223216, 'jpg', '575b9b871677c402addb3c6a608c82be');
INSERT INTO `dr_attachment` VALUES (258, 1, 'admin', 1, 'ueditor:news-home-add-id:0', 1, 0, 308421, 'jpg', 'a5fc8c5f62e3686e04c88c302f162eab');
INSERT INTO `dr_attachment` VALUES (259, 1, 'admin', 1, 'ueditor:news-home-add-id:0', 1, 0, 261010, 'jpg', 'b961580cbfa14cc693d769594024a17d');
INSERT INTO `dr_attachment` VALUES (260, 1, 'admin', 1, 'rand', 1, 0, 250312, 'jpg', '986ea5ef89e04d4b68e99a10d161ac06');
INSERT INTO `dr_attachment` VALUES (261, 1, 'admin', 1, 'rand', 1, 0, 286293, 'jpg', 'aa52dec8556f0c461ac832b60a867733');
INSERT INTO `dr_attachment` VALUES (262, 1, 'admin', 1, 'rand', 1, 0, 261010, 'jpg', 'b961580cbfa14cc693d769594024a17d');
INSERT INTO `dr_attachment` VALUES (263, 1, 'admin', 1, 'rand', 1, 0, 308421, 'jpg', 'a5fc8c5f62e3686e04c88c302f162eab');
INSERT INTO `dr_attachment` VALUES (264, 1, 'admin', 1, 'rand', 1, 0, 139823, 'jpg', '43966089eb25341d8c0908a046d9f080');
INSERT INTO `dr_attachment` VALUES (265, 1, 'admin', 1, 'rand', 1, 0, 223216, 'jpg', '575b9b871677c402addb3c6a608c82be');
INSERT INTO `dr_attachment` VALUES (266, 1, 'admin', 1, 'rand', 1, 0, 139823, 'jpg', '43966089eb25341d8c0908a046d9f080');
INSERT INTO `dr_attachment` VALUES (267, 1, 'admin', 1, 'rand', 1, 0, 20253, 'jpg', 'ade5764f30c7d9ee9dd775741a221e98');
INSERT INTO `dr_attachment` VALUES (268, 1, 'admin', 1, 'rand', 1, 0, 19557, 'jpg', '1172805497526112e336bc1109bad0de');
INSERT INTO `dr_attachment` VALUES (269, 1, 'admin', 1, 'rand', 1, 0, 19557, 'jpg', '1172805497526112e336bc1109bad0de');
INSERT INTO `dr_attachment` VALUES (270, 1, 'admin', 1, 'rand', 1, 0, 19557, 'jpg', '1172805497526112e336bc1109bad0de');
INSERT INTO `dr_attachment` VALUES (271, 1, 'admin', 1, 'rand', 1, 0, 19557, 'jpg', '1172805497526112e336bc1109bad0de');
INSERT INTO `dr_attachment` VALUES (272, 1, 'admin', 1, 'rand', 1, 0, 19557, 'jpg', '1172805497526112e336bc1109bad0de');
INSERT INTO `dr_attachment` VALUES (273, 1, 'admin', 1, 'rand', 1, 0, 19557, 'jpg', '1172805497526112e336bc1109bad0de');
INSERT INTO `dr_attachment` VALUES (274, 1, 'admin', 1, 'rand', 1, 0, 19557, 'jpg', '1172805497526112e336bc1109bad0de');
INSERT INTO `dr_attachment` VALUES (275, 1, 'admin', 1, 'rand', 1, 0, 19557, 'jpg', '1172805497526112e336bc1109bad0de');
INSERT INTO `dr_attachment` VALUES (276, 1, 'admin', 1, 'rand', 1, 0, 19557, 'jpg', '1172805497526112e336bc1109bad0de');
INSERT INTO `dr_attachment` VALUES (277, 1, 'admin', 1, 'rand', 1, 0, 19557, 'jpg', '1172805497526112e336bc1109bad0de');
INSERT INTO `dr_attachment` VALUES (278, 1, 'admin', 1, 'rand', 1, 0, 19557, 'jpg', '1172805497526112e336bc1109bad0de');
INSERT INTO `dr_attachment` VALUES (279, 1, 'admin', 1, 'rand', 1, 0, 19557, 'jpg', '1172805497526112e336bc1109bad0de');
INSERT INTO `dr_attachment` VALUES (280, 1, 'admin', 1, 'rand', 1, 0, 19557, 'jpg', '1172805497526112e336bc1109bad0de');
INSERT INTO `dr_attachment` VALUES (281, 1, 'admin', 1, 'rand', 1, 0, 19557, 'jpg', '1172805497526112e336bc1109bad0de');
INSERT INTO `dr_attachment` VALUES (282, 1, 'admin', 1, 'rand', 1, 0, 19557, 'jpg', '1172805497526112e336bc1109bad0de');
INSERT INTO `dr_attachment` VALUES (283, 1, 'admin', 1, 'rand', 1, 0, 19557, 'jpg', '1172805497526112e336bc1109bad0de');
INSERT INTO `dr_attachment` VALUES (284, 1, 'admin', 1, 'rand', 1, 0, 19557, 'jpg', '1172805497526112e336bc1109bad0de');
INSERT INTO `dr_attachment` VALUES (285, 1, 'admin', 1, 'rand', 1, 0, 19557, 'jpg', '1172805497526112e336bc1109bad0de');
INSERT INTO `dr_attachment` VALUES (286, 1, 'admin', 1, 'rand', 1, 0, 341218, 'jpg', '838d12a3980664b039b2b5eaf7eddee3');
INSERT INTO `dr_attachment` VALUES (287, 1, 'admin', 1, 'rand', 1, 0, 741620, 'jpg', '625eefbcc3a1b9da51463d761832ca56');

-- ----------------------------
-- Table structure for dr_attachment_data
-- ----------------------------
DROP TABLE IF EXISTS `dr_attachment_data`;
CREATE TABLE `dr_attachment_data`  (
  `id` mediumint(8) UNSIGNED NOT NULL COMMENT '附件id',
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员id',
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会员',
  `related` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文件大小',
  `attachment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '远程附件id',
  `attachinfo` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '附件信息',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE,
  INDEX `fileext`(`fileext`) USING BTREE,
  INDEX `remote`(`remote`) USING BTREE,
  INDEX `author`(`author`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '附件已归档表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dr_attachment_data
-- ----------------------------
INSERT INTO `dr_attachment_data` VALUES (1, 1, 'admin', 'rand', '1569413617', 'jpg', 21899, '201911/b98333eb9366863.jpg', 0, '{\"width\":283,\"height\":182}', 1573179248);
INSERT INTO `dr_attachment_data` VALUES (2, 1, 'admin', 'rand', '1569413640', 'jpg', 17337, '201911/c1a34e5069666be.jpg', 0, '{\"width\":283,\"height\":182}', 1573179270);
INSERT INTO `dr_attachment_data` VALUES (3, 1, 'admin', 'rand', '1569413663', 'jpg', 25619, '201911/69979e820e1c935.jpg', 0, '{\"width\":283,\"height\":182}', 1573179293);
INSERT INTO `dr_attachment_data` VALUES (4, 1, 'admin', 'rand', '1569413686', 'jpg', 24092, '201911/8ca0359b51b115d.jpg', 0, '{\"width\":283,\"height\":182}', 1573179314);
INSERT INTO `dr_attachment_data` VALUES (5, 1, 'admin', 'rand', '1-19102qpj40-l', 'jpg', 55126, '201911/313306d1668df4.jpg', 0, '{\"width\":618,\"height\":400}', 1573179853);
INSERT INTO `dr_attachment_data` VALUES (6, 1, 'admin', 'rand', '1-19102qa0400-l', 'jpg', 51446, '201911/8d42e28df0b741d.jpg', 0, '{\"width\":618,\"height\":400}', 1573192676);
INSERT INTO `dr_attachment_data` VALUES (7, 1, 'admin', 'rand', '1-19102QRA9', 'jpg', 59817, '201911/716a661e9e4859a.jpg', 0, '{\"width\":557,\"height\":346}', 1573192749);
INSERT INTO `dr_attachment_data` VALUES (8, 1, 'admin', 'rand', '1-19102QRF0', 'jpg', 49040, '201911/28d30f9b15dbe.jpg', 0, '{\"width\":618,\"height\":400}', 1573192822);
INSERT INTO `dr_attachment_data` VALUES (9, 1, 'admin', 'rand', '1-19102Q60Z2', 'docx', 13321, '201911/f5ca72582378258.docx', 0, '{\"width\":null,\"height\":null}', 1573204166);
INSERT INTO `dr_attachment_data` VALUES (10, 1, 'admin', 'rand', '1-19102QU5350-L', 'jpg', 149347, '201911/d1a01a3423b3731.jpg', 0, '{\"width\":878,\"height\":550}', 1573364556);
INSERT INTO `dr_attachment_data` VALUES (11, 1, 'admin', 'rand', '1569490190', 'jpg', 53341, '201911/c435af358f76412.jpg', 0, '{\"width\":380,\"height\":228}', 1573372140);
INSERT INTO `dr_attachment_data` VALUES (12, 1, 'admin', 'rand', '1569490171', 'jpg', 71026, '201911/3a8553cf3f3ca31.jpg', 0, '{\"width\":380,\"height\":228}', 1573372168);
INSERT INTO `dr_attachment_data` VALUES (13, 1, 'admin', 'rand', '1569490142', 'jpg', 72655, '201911/b03a90c6508cb8a.jpg', 0, '{\"width\":380,\"height\":228}', 1573372189);
INSERT INTO `dr_attachment_data` VALUES (14, 1, 'admin', 'rand', '1569490118', 'jpg', 49417, '201911/bfb5d9e9a2c3311.jpg', 0, '{\"width\":380,\"height\":228}', 1573372209);
INSERT INTO `dr_attachment_data` VALUES (15, 1, 'admin', 'rand', '1569490089', 'jpg', 58253, '201911/b5689ba6a74993b.jpg', 0, '{\"width\":380,\"height\":228}', 1573372226);
INSERT INTO `dr_attachment_data` VALUES (16, 1, 'admin', 'rand', '1569490057', 'jpg', 35382, '201911/3890fe8b730853f.jpg', 0, '{\"width\":380,\"height\":229}', 1573372243);
INSERT INTO `dr_attachment_data` VALUES (17, 1, 'admin', 'rand', '1569489901', 'jpg', 30225, '201911/7009632a72bc55a.jpg', 0, '{\"width\":381,\"height\":229}', 1573372258);
INSERT INTO `dr_attachment_data` VALUES (18, 1, 'admin', 'rand', '1-19102zt64c96', 'jpg', 25078, '201911/3bde12c15c839b8.jpg', 0, '{\"width\":378,\"height\":252}', 1573375589);
INSERT INTO `dr_attachment_data` VALUES (19, 1, 'admin', 'rand', 'product', 'jpg', 131658, '201911/691f9bab14680e1.jpg', 0, '{\"width\":1920,\"height\":160}', 1573786165);
INSERT INTO `dr_attachment_data` VALUES (20, 1, 'admin', 'rand', 'news', 'jpg', 104607, '201911/e620312da0fac4.jpg', 0, '{\"width\":1920,\"height\":162}', 1573786458);
INSERT INTO `dr_attachment_data` VALUES (21, 1, 'admin', 'rand', 'page', 'jpg', 54923, '201911/1ba6c0780fd326f.jpg', 0, '{\"width\":1920,\"height\":162}', 1573786547);
INSERT INTO `dr_attachment_data` VALUES (22, 1, 'admin', 'rand', 'down', 'jpg', 104607, '201911/3b99c772d8b69c6.jpg', 0, '{\"width\":1920,\"height\":162}', 1573786624);
INSERT INTO `dr_attachment_data` VALUES (23, 1, 'admin', 'rand', 'question', 'jpg', 131658, '201911/a74cbab9f4ead19.jpg', 0, '{\"width\":1920,\"height\":160}', 1573786721);
INSERT INTO `dr_attachment_data` VALUES (24, 1, 'admin', 'rand', 'join', 'jpg', 76923, '201911/beaeb2fa14e6c.jpg', 0, '{\"width\":1920,\"height\":162}', 1573786768);
INSERT INTO `dr_attachment_data` VALUES (25, 1, 'admin', 'rand', 'logo', 'png', 7873, '201911/096a70edc5de73a.png', 0, '{\"width\":230,\"height\":56}', 1573786888);
INSERT INTO `dr_attachment_data` VALUES (26, 1, 'admin', 'rand', 'lichengbei1', 'jpg', 106076, '202007/74a861a66f004.jpg', 0, '{\"width\":1200,\"height\":600}', 1594347549);
INSERT INTO `dr_attachment_data` VALUES (27, 1, 'admin', 'rand', 'lichengbei2', 'jpg', 173170, '202007/9a48015117f8a76.jpg', 0, '{\"width\":1200,\"height\":600}', 1594347553);
INSERT INTO `dr_attachment_data` VALUES (28, 1, 'admin', 'ueditor:category-edit-id:49', 'lichengbei1.jpg', 'jpg', 106076, 'ueditor/image/202007/1594347624b9c222.jpg', 0, '', 1594347624);
INSERT INTO `dr_attachment_data` VALUES (29, 1, 'admin', 'ueditor:category-edit-id:49', 'lichengbei2.jpg', 'jpg', 173170, 'ueditor/image/202007/15943476247a85cb.jpg', 0, '', 1594347624);
INSERT INTO `dr_attachment_data` VALUES (30, 1, 'admin', 'ueditor:category-edit-id:50', 'qiyezizhi3.jpg', 'jpg', 201299, 'ueditor/image/202007/159434788512ac3b.jpg', 0, '', 1594347885);
INSERT INTO `dr_attachment_data` VALUES (31, 1, 'admin', 'ueditor:category-edit-id:50', 'qiyezizhi1.jpg', 'jpg', 296747, 'ueditor/image/202007/1594347885587601.jpg', 0, '', 1594347885);
INSERT INTO `dr_attachment_data` VALUES (32, 1, 'admin', 'ueditor:category-edit-id:50', 'qiyezizhi2.jpg', 'jpg', 257570, 'ueditor/image/202007/1594347885131f3b.jpg', 0, '', 1594347885);
INSERT INTO `dr_attachment_data` VALUES (33, 1, 'admin', 'ueditor:category-edit-id:52', 'zuzhijiagou.jpg', 'jpg', 269548, 'ueditor/image/202007/15943480185074e7.jpg', 0, '', 1594348018);
INSERT INTO `dr_attachment_data` VALUES (34, 1, 'admin', 'ueditor:photo-home-add-id:0', 'bhpx_2016_01.jpg', 'jpg', 141730, 'ueditor/image/202007/15943517192d66e2.jpg', 0, '', 1594351719);
INSERT INTO `dr_attachment_data` VALUES (35, 1, 'admin', 'ueditor:photo-home-add-id:0', 'bhpx_2016_03.jpg', 'jpg', 112003, 'ueditor/image/202007/159435171951841b.jpg', 0, '', 1594351719);
INSERT INTO `dr_attachment_data` VALUES (36, 1, 'admin', 'ueditor:photo-home-add-id:0', 'bhpx_2016_02.jpg', 'jpg', 134096, 'ueditor/image/202007/1594351719ef348c.jpg', 0, '', 1594351719);
INSERT INTO `dr_attachment_data` VALUES (37, 1, 'admin', 'ueditor:photo-home-add-id:0', 'bhpx_2016_04.jpg', 'jpg', 104868, 'ueditor/image/202007/1594351719da17a3.jpg', 0, '', 1594351719);
INSERT INTO `dr_attachment_data` VALUES (38, 1, 'admin', 'ueditor:photo-home-add-id:0', 'bhpx_2016_05.jpg', 'jpg', 353535, 'ueditor/image/202007/15943517197d4737.jpg', 0, '', 1594351719);
INSERT INTO `dr_attachment_data` VALUES (39, 1, 'admin', 'rand', 'bhpx_2016_01', 'jpg', 141730, '202007/7502bb1cae9f63f.jpg', 0, '{\"width\":225,\"height\":200}', 1594351861);
INSERT INTO `dr_attachment_data` VALUES (40, 1, 'admin', 'rand', 'bhpx_2016_01', 'jpg', 141730, '202007/7ad2b1fd2fc7574.jpg', 0, '{\"width\":225,\"height\":200}', 1594351926);
INSERT INTO `dr_attachment_data` VALUES (41, 1, 'admin', 'rand', 'bhpx_2016_01', 'jpg', 141730, '202007/9bcf22434c92503.jpg', 0, '{\"width\":225,\"height\":200}', 1594351937);
INSERT INTO `dr_attachment_data` VALUES (42, 1, 'admin', 'rand', 'bhpx_2016_02', 'jpg', 134096, '202007/c1b23f36bf901d5.jpg', 0, '{\"width\":225,\"height\":200}', 1594352375);
INSERT INTO `dr_attachment_data` VALUES (43, 1, 'admin', 'rand', 'bhpx_2016_02', 'jpg', 134096, '202007/65f29d4079d4d6c.jpg', 0, '{\"width\":225,\"height\":200}', 1594352477);
INSERT INTO `dr_attachment_data` VALUES (44, 1, 'admin', 'rand', 'bhpx_2016_03', 'jpg', 112003, '202007/0f6f3f4353127f7.jpg', 0, '{\"width\":225,\"height\":200}', 1594352481);
INSERT INTO `dr_attachment_data` VALUES (45, 1, 'admin', 'rand', 'bhpx_2016_04', 'jpg', 104868, '202007/0fa77ac56618cec.jpg', 0, '{\"width\":225,\"height\":200}', 1594352485);
INSERT INTO `dr_attachment_data` VALUES (46, 1, 'admin', 'rand', 'bhpx_2016_01', 'jpg', 141730, '202007/61df2febc12924d.jpg', 0, '{\"width\":225,\"height\":200}', 1594352676);
INSERT INTO `dr_attachment_data` VALUES (47, 1, 'admin', 'rand', 'bhpx_hhbz_03', 'jpg', 112003, '202007/467a0ed5a6fe20d.jpg', 0, '{\"width\":225,\"height\":200}', 1594354062);
INSERT INTO `dr_attachment_data` VALUES (48, 1, 'admin', 'ueditor:photo-home-add-id:0', 'bhpx_2016_01.jpg', 'jpg', 141730, 'ueditor/image/202007/1594354342463d5d.jpg', 0, '', 1594354342);
INSERT INTO `dr_attachment_data` VALUES (49, 1, 'admin', 'ueditor:photo-home-add-id:0', 'bhpx_2016_02.jpg', 'jpg', 134096, 'ueditor/image/202007/1594354342e06489.jpg', 0, '', 1594354342);
INSERT INTO `dr_attachment_data` VALUES (50, 1, 'admin', 'ueditor:photo-home-add-id:0', 'bhpx_2016_03.jpg', 'jpg', 112003, 'ueditor/image/202007/15943543428a4c71.jpg', 0, '', 1594354342);
INSERT INTO `dr_attachment_data` VALUES (51, 1, 'admin', 'ueditor:photo-home-add-id:0', 'bhpx_2016_04.jpg', 'jpg', 104868, 'ueditor/image/202007/1594354342ddda35.jpg', 0, '', 1594354342);
INSERT INTO `dr_attachment_data` VALUES (52, 1, 'admin', 'rand', 'bhpx_2016_03', 'jpg', 112003, '202007/61ea3a49102f882.jpg', 0, '{\"width\":225,\"height\":200}', 1594354349);
INSERT INTO `dr_attachment_data` VALUES (53, 1, 'admin', 'rand', 'bhpx_2016_04', 'jpg', 104868, '202007/4394f1fcd438f77.jpg', 0, '{\"width\":225,\"height\":200}', 1594354369);
INSERT INTO `dr_attachment_data` VALUES (54, 1, 'admin', 'ueditor:photo-home-add-id:0', 'bhpx_2016_02.jpg', 'jpg', 134096, 'ueditor/image/202007/159435441668932d.jpg', 0, '', 1594354416);
INSERT INTO `dr_attachment_data` VALUES (55, 1, 'admin', 'ueditor:photo-home-add-id:0', 'bhpx_2016_01.jpg', 'jpg', 141730, 'ueditor/image/202007/15943544162b9327.jpg', 0, '', 1594354416);
INSERT INTO `dr_attachment_data` VALUES (56, 1, 'admin', 'ueditor:photo-home-add-id:0', 'bhpx_2016_03.jpg', 'jpg', 112003, 'ueditor/image/202007/159435441627b7b7.jpg', 0, '', 1594354416);
INSERT INTO `dr_attachment_data` VALUES (57, 1, 'admin', 'ueditor:photo-home-add-id:0', 'bhpx_2016_04.jpg', 'jpg', 104868, 'ueditor/image/202007/1594354416047af0.jpg', 0, '', 1594354416);
INSERT INTO `dr_attachment_data` VALUES (58, 1, 'admin', 'rand', 'bhpx_2016_04', 'jpg', 104868, '202007/0ba0c5b836f1fbd.jpg', 0, '{\"width\":225,\"height\":200}', 1594354422);
INSERT INTO `dr_attachment_data` VALUES (59, 1, 'admin', 'rand', 'bhpx_2016_01', 'jpg', 141730, '202007/cc28cb2186917.jpg', 0, '{\"width\":225,\"height\":200}', 1594354473);
INSERT INTO `dr_attachment_data` VALUES (60, 1, 'admin', 'ueditor:photo-home-add-id:0', 'bhpx_2016_01.jpg', 'jpg', 141730, 'ueditor/image/202007/1594354484b2b6d3.jpg', 0, '', 1594354484);
INSERT INTO `dr_attachment_data` VALUES (61, 1, 'admin', 'ueditor:photo-home-add-id:0', 'bhpx_2016_02.jpg', 'jpg', 134096, 'ueditor/image/202007/1594354484f37dea.jpg', 0, '', 1594354484);
INSERT INTO `dr_attachment_data` VALUES (62, 1, 'admin', 'ueditor:photo-home-add-id:0', 'bhpx_2016_03.jpg', 'jpg', 112003, 'ueditor/image/202007/15943544841ba9ce.jpg', 0, '', 1594354484);
INSERT INTO `dr_attachment_data` VALUES (63, 1, 'admin', 'ueditor:photo-home-add-id:0', 'bhpx_2016_04.jpg', 'jpg', 104868, 'ueditor/image/202007/15943544847a79b6.jpg', 0, '', 1594354484);
INSERT INTO `dr_attachment_data` VALUES (64, 1, 'admin', 'rand', 'bhpx_2016_01', 'jpg', 141730, '202007/c272d1b439b6c.jpg', 0, '{\"width\":225,\"height\":200}', 1594354490);
INSERT INTO `dr_attachment_data` VALUES (65, 1, 'admin', 'ueditor:photo-home-add-id:0', 'bhpx_sjhsjd_01.jpg', 'jpg', 114186, 'ueditor/image/202007/1594356842bdc3d4.jpg', 0, '', 1594356842);
INSERT INTO `dr_attachment_data` VALUES (66, 1, 'admin', 'ueditor:photo-home-add-id:0', 'bhpx_sjhsjd_02.jpg', 'jpg', 324429, 'ueditor/image/202007/159435684370baab.jpg', 0, '', 1594356842);
INSERT INTO `dr_attachment_data` VALUES (67, 1, 'admin', 'ueditor:photo-home-add-id:0', 'bhpx_sjhsjd_03.JPG', 'jpg', 354958, 'ueditor/image/202007/15943568433cd754.jpg', 0, '', 1594356843);
INSERT INTO `dr_attachment_data` VALUES (68, 1, 'admin', 'ueditor:photo-home-add-id:0', 'bhpx_sjhsjd_04.jpg', 'jpg', 304390, 'ueditor/image/202007/1594356843a89dfe.jpg', 0, '', 1594356843);
INSERT INTO `dr_attachment_data` VALUES (69, 1, 'admin', 'ueditor:photo-home-add-id:0', 'bhpx_sjhsjd_05.jpg', 'jpg', 307874, 'ueditor/image/202007/1594356843c1abb3.jpg', 0, '', 1594356843);
INSERT INTO `dr_attachment_data` VALUES (70, 1, 'admin', 'rand', 'bhpx_2016_02', 'jpg', 134096, '202007/d36f1075b1771e5.jpg', 0, '{\"width\":225,\"height\":200}', 1594356958);
INSERT INTO `dr_attachment_data` VALUES (71, 1, 'admin', 'rand', 'bhpx_hhbz_01', 'jpg', 141730, '202007/136d4563da5a.jpg', 0, '{\"width\":225,\"height\":200}', 1594357013);
INSERT INTO `dr_attachment_data` VALUES (72, 1, 'admin', 'rand', 'bhpx_hrfw2_03', 'jpg', 336751, '202007/6342a134387fcf2.jpg', 0, '{\"width\":1698,\"height\":1132}', 1594357904);
INSERT INTO `dr_attachment_data` VALUES (73, 1, 'admin', 'rand', 'bhpx_hrfw2_02', 'jpg', 342323, '202007/6e4b7e73d961ffd.jpg', 0, '{\"width\":2555,\"height\":1916}', 1594357940);
INSERT INTO `dr_attachment_data` VALUES (74, 1, 'admin', 'rand', 'bhpx_hrfw2_01', 'jpg', 268314, '202007/31e531226602508.jpg', 0, '{\"width\":3200,\"height\":1800}', 1594357940);
INSERT INTO `dr_attachment_data` VALUES (75, 1, 'admin', 'rand', 'bhpx_hrfw2_03', 'jpg', 336751, '202007/3f48f15048fb2be.jpg', 0, '{\"width\":1698,\"height\":1132}', 1594357940);
INSERT INTO `dr_attachment_data` VALUES (76, 1, 'admin', 'rand', 'bhpx_hrfw2_04', 'jpg', 340976, '202007/c86514edb5d0ea9.jpg', 0, '{\"width\":3200,\"height\":1800}', 1594357940);
INSERT INTO `dr_attachment_data` VALUES (77, 1, 'admin', 'ueditor:photo-home-add-id:0', 'bhpx_jjchsjj_01.jpg', 'jpg', 122867, 'ueditor/image/202007/159435843248e9a2.jpg', 0, '', 1594358432);
INSERT INTO `dr_attachment_data` VALUES (78, 1, 'admin', 'ueditor:photo-home-add-id:0', 'bhpx_jjchsjj_02.jpg', 'jpg', 343129, 'ueditor/image/202007/159435843338fffa.jpg', 0, '', 1594358432);
INSERT INTO `dr_attachment_data` VALUES (79, 1, 'admin', 'ueditor:photo-home-add-id:0', 'bhpx_jjchsjj_03.jpg', 'jpg', 307845, 'ueditor/image/202007/1594358433a68485.jpg', 0, '', 1594358433);
INSERT INTO `dr_attachment_data` VALUES (80, 1, 'admin', 'ueditor:photo-home-add-id:0', 'bhpx_jjchsjj_05.jpg', 'jpg', 279282, 'ueditor/image/202007/15943584337f4f0d.jpg', 0, '', 1594358433);
INSERT INTO `dr_attachment_data` VALUES (81, 1, 'admin', 'ueditor:photo-home-add-id:0', 'bhpx_jjchsjj_04.jpg', 'jpg', 314404, 'ueditor/image/202007/15943584338e8a02.jpg', 0, '', 1594358433);
INSERT INTO `dr_attachment_data` VALUES (82, 1, 'admin', 'rand', 'bhpx_jcbhj_03', 'jpg', 322793, '202007/1ccc2fed2c3c649.jpg', 0, '{\"width\":3006,\"height\":2254}', 1594358611);
INSERT INTO `dr_attachment_data` VALUES (83, 1, 'admin', 'rand', 'bhpx_jcbhj_02', 'jpg', 302791, '202007/bb5539ffc5942fd.jpg', 0, '{\"width\":1224,\"height\":919}', 1594358627);
INSERT INTO `dr_attachment_data` VALUES (84, 1, 'admin', 'rand', 'bhpx_jcbhj_01', 'jpg', 320640, '202007/cd7cca14c8b3762.jpg', 0, '{\"width\":2922,\"height\":2195}', 1594358627);
INSERT INTO `dr_attachment_data` VALUES (85, 1, 'admin', 'rand', 'bhpx_jcbhj_03', 'jpg', 322793, '202007/0ea756b6452ccfd.jpg', 0, '{\"width\":3006,\"height\":2254}', 1594358627);
INSERT INTO `dr_attachment_data` VALUES (86, 1, 'admin', 'rand', 'bhpx_jjchsjj_05', 'jpg', 279282, '202007/b9e9bad3ab20f18.jpg', 0, '{\"width\":1434,\"height\":953}', 1594358658);
INSERT INTO `dr_attachment_data` VALUES (87, 1, 'admin', 'rand', 'bhpx_hhzs_03', 'jpg', 314185, '202007/8db9f384d266d09.jpg', 0, '{\"width\":1259,\"height\":933}', 1594359489);
INSERT INTO `dr_attachment_data` VALUES (88, 1, 'admin', 'rand', 'bhpx_hhzs_05', 'jpg', 345936, '202007/396a0a178e0b209.jpg', 0, '{\"width\":1974,\"height\":1480}', 1594359489);
INSERT INTO `dr_attachment_data` VALUES (89, 1, 'admin', 'rand', 'bhpx_hhzs_01', 'jpg', 291475, '202007/19092fd7fc1d367.jpg', 0, '{\"width\":1696,\"height\":1131}', 1594359489);
INSERT INTO `dr_attachment_data` VALUES (90, 1, 'admin', 'rand', 'bhpx_hhzs_02', 'jpg', 341218, '202007/1e8ecd2e2462927.jpg', 0, '{\"width\":1687,\"height\":1125}', 1594359489);
INSERT INTO `dr_attachment_data` VALUES (91, 1, 'admin', 'rand', 'bhpx_hhzs_04', 'jpg', 326360, '202007/ad68b933241c805.jpg', 0, '{\"width\":1336,\"height\":990}', 1594359489);
INSERT INTO `dr_attachment_data` VALUES (92, 1, 'admin', 'rand', 'bhpx_hhzs_01', 'jpg', 291475, '202007/17d90997c8f6d3f.jpg', 0, '{\"width\":1696,\"height\":1131}', 1594359506);
INSERT INTO `dr_attachment_data` VALUES (93, 1, 'admin', 'rand', 'bhpx_zsjnt_01', 'jpg', 321735, '202007/5b3b7d8dc25659b.jpg', 0, '{\"width\":2151,\"height\":1348}', 1594359596);
INSERT INTO `dr_attachment_data` VALUES (94, 1, 'admin', 'rand', 'bhpx_zsjnt_02', 'jpg', 277506, '202007/ce45b3b1f228db8.jpg', 0, '{\"width\":1544,\"height\":1158}', 1594359596);
INSERT INTO `dr_attachment_data` VALUES (95, 1, 'admin', 'rand', 'bhpx_zsjnt_01', 'jpg', 321735, '202007/61e17e9b59216b.jpg', 0, '{\"width\":2151,\"height\":1348}', 1594359605);
INSERT INTO `dr_attachment_data` VALUES (96, 1, 'admin', 'rand', 'bhpx_hyzl_01', 'jpg', 313236, '202007/0fc1188ce670e73.jpg', 0, '{\"width\":1000,\"height\":668}', 1594361772);
INSERT INTO `dr_attachment_data` VALUES (97, 1, 'admin', 'rand', 'bhpx_hyzl_04', 'jpg', 341739, '202007/ec2aa466fa50134.jpg', 0, '{\"width\":1000,\"height\":668}', 1594361787);
INSERT INTO `dr_attachment_data` VALUES (98, 1, 'admin', 'rand', 'bhpx_hyzl_01', 'jpg', 313236, '202007/12c136d25888e7d.jpg', 0, '{\"width\":1000,\"height\":668}', 1594361787);
INSERT INTO `dr_attachment_data` VALUES (99, 1, 'admin', 'rand', 'bhpx_hyzl_03', 'jpg', 344299, '202007/b09a127e60da387.jpg', 0, '{\"width\":1000,\"height\":668}', 1594361787);
INSERT INTO `dr_attachment_data` VALUES (100, 1, 'admin', 'rand', 'bhpx_hyzl_02', 'jpg', 348358, '202007/44074c7cd15d475.jpg', 0, '{\"width\":1000,\"height\":668}', 1594361787);
INSERT INTO `dr_attachment_data` VALUES (101, 1, 'admin', 'rand', 'bhpx_jcgshhbzxm_01', 'jpg', 319515, '202007/c6cf579e32b8ae8.jpg', 0, '{\"width\":1769,\"height\":2360}', 1594361870);
INSERT INTO `dr_attachment_data` VALUES (102, 1, 'admin', 'rand', 'bhpx_jcgshhbzxm_01', 'jpg', 319515, '202007/e6c9c561550066f.jpg', 0, '{\"width\":1769,\"height\":2360}', 1594361886);
INSERT INTO `dr_attachment_data` VALUES (103, 1, 'admin', 'rand', 'bhpx_jcgshhbzxm_03', 'jpg', 347023, '202007/e6f04af97163e3e.jpg', 0, '{\"width\":1081,\"height\":802}', 1594361886);
INSERT INTO `dr_attachment_data` VALUES (104, 1, 'admin', 'rand', 'bhpx_jcgshhbzxm_02', 'jpg', 318347, '202007/f77f73d64284226.jpg', 0, '{\"width\":1785,\"height\":2380}', 1594361886);
INSERT INTO `dr_attachment_data` VALUES (105, 1, 'admin', 'rand', 'bhpx_2016_05', 'jpg', 353535, '202007/3acd87c8c34e7b6.jpg', 0, '{\"width\":1921,\"height\":1167}', 1594361913);
INSERT INTO `dr_attachment_data` VALUES (106, 1, 'admin', 'rand', 'bhpx_2016_05', 'jpg', 353535, '202007/13799fa5e94f24a.jpg', 0, '{\"width\":1921,\"height\":1167}', 1594361918);
INSERT INTO `dr_attachment_data` VALUES (107, 1, 'admin', 'rand', 'bhpx_yy_02', 'jpg', 335192, '202007/bcdfb4dbd477248.jpg', 0, '{\"width\":800,\"height\":600}', 1594361958);
INSERT INTO `dr_attachment_data` VALUES (108, 1, 'admin', 'rand', 'bhpx_yy_02', 'jpg', 335192, '202007/9bf030ec3c821d8.jpg', 0, '{\"width\":800,\"height\":600}', 1594361965);
INSERT INTO `dr_attachment_data` VALUES (109, 1, 'admin', 'rand', 'bhpx_hhkp_01', 'jpg', 294940, '202007/b286691cdbd3bb1.jpg', 0, '{\"width\":800,\"height\":600}', 1594361995);
INSERT INTO `dr_attachment_data` VALUES (110, 1, 'admin', 'rand', 'bhpx_hhkp_01', 'jpg', 294940, '202007/ec89f61316f1265.jpg', 0, '{\"width\":800,\"height\":600}', 1594362000);
INSERT INTO `dr_attachment_data` VALUES (111, 1, 'admin', 'ueditor:photo-home-add-id:0', 'CgAGe1q5_geALIUfAAHtB8dfNLk527.jpg', 'jpg', 126215, 'ueditor/image/202007/15943634398b0a60.jpg', 0, '', 1594363439);
INSERT INTO `dr_attachment_data` VALUES (112, 1, 'admin', 'ueditor:photo-home-add-id:0', 'CgAGe1q5_EiALzvSAAMAwgbzb0k890.jpg', 'jpg', 196802, 'ueditor/image/202007/15943634391f27c1.jpg', 0, '', 1594363439);
INSERT INTO `dr_attachment_data` VALUES (113, 1, 'admin', 'ueditor:photo-home-add-id:0', 'CgAGe1q5_7SAdweXAAUPM3uA-fw935.jpg', 'jpg', 173779, 'ueditor/image/202007/1594363439047a1d.jpg', 0, '', 1594363439);
INSERT INTO `dr_attachment_data` VALUES (114, 1, 'admin', 'ueditor:photo-home-add-id:0', 'CgAGe1q57_WACl-4AAF6DZqHAh0884.jpg', 'jpg', 96781, 'ueditor/image/202007/1594363440c0e0c3.jpg', 0, '', 1594363440);
INSERT INTO `dr_attachment_data` VALUES (115, 1, 'admin', 'ueditor:photo-home-add-id:0', 'CgAGe1q6AU-AAWCgAAJgpFIe2Cc661.jpg', 'jpg', 155812, 'ueditor/image/202007/1594363440c0c351.jpg', 0, '', 1594363440);
INSERT INTO `dr_attachment_data` VALUES (116, 1, 'admin', 'ueditor:photo-home-add-id:0', 'CgAGe1q593uAHRbTAAJQbvl5sgk883.jpg', 'jpg', 151662, 'ueditor/image/202007/159436344031121c.jpg', 0, '', 1594363440);
INSERT INTO `dr_attachment_data` VALUES (117, 1, 'admin', 'ueditor:photo-home-add-id:0', 'CgAGS1k5BTuAJD6PAAOoiRdnGlI366.jpg', 'jpg', 239753, 'ueditor/image/202007/15943634404f17e6.jpg', 0, '', 1594363440);
INSERT INTO `dr_attachment_data` VALUES (118, 1, 'admin', 'ueditor:photo-home-add-id:0', 'CgAGS1lSJ46AD71WAAO0tfKgzl0548.jpg', 'jpg', 242869, 'ueditor/image/202007/1594363440cba0a7.jpg', 0, '', 1594363440);
INSERT INTO `dr_attachment_data` VALUES (119, 1, 'admin', 'ueditor:photo-home-add-id:0', 'CgAGTFlQ8lGAdBmTAAPTYUvti3k554.jpg', 'jpg', 250721, 'ueditor/image/202007/1594363440916890.jpg', 0, '', 1594363440);
INSERT INTO `dr_attachment_data` VALUES (120, 1, 'admin', 'ueditor:photo-home-add-id:0', 'CgAGTFlQ8-mAEOAXAAQrSU50YZ4569.jpg', 'jpg', 273225, 'ueditor/image/202007/1594363440a7dddd.jpg', 0, '', 1594363440);
INSERT INTO `dr_attachment_data` VALUES (121, 1, 'admin', 'ueditor:photo-home-add-id:0', 'CgAGTFlQ9TiAMFkbAAM_FTiBvhk421.jpg', 'jpg', 212757, 'ueditor/image/202007/1594363440bd363c.jpg', 0, '', 1594363440);
INSERT INTO `dr_attachment_data` VALUES (122, 1, 'admin', 'ueditor:photo-home-add-id:0', 'CgAGTFlRC46AKL1bAAQF-yVDxhU964.jpg', 'jpg', 263675, 'ueditor/image/202007/15943634405155da.jpg', 0, '', 1594363440);
INSERT INTO `dr_attachment_data` VALUES (123, 1, 'admin', 'ueditor:photo-home-add-id:0', 'CgAGTFlRDDmAP6D-AANMzIWY1b0313.jpg', 'jpg', 216268, 'ueditor/image/202007/15943634402bf689.jpg', 0, '', 1594363440);
INSERT INTO `dr_attachment_data` VALUES (124, 1, 'admin', 'rand', 'CgAGe1q5_7SAdweXAAUPM3uA-fw935', 'jpg', 331571, '202007/57c1801301fd9de.jpg', 0, '{\"width\":437,\"height\":714}', 1594367003);
INSERT INTO `dr_attachment_data` VALUES (125, 1, 'admin', 'rand', 'CgAGe1q5_7SAdweXAAUPM3uA-fw935', 'jpg', 331571, '202007/d8ec7bf680a175e.jpg', 0, '{\"width\":437,\"height\":714}', 1594367017);
INSERT INTO `dr_attachment_data` VALUES (126, 1, 'admin', 'ueditor:photo-home-edit-id:67', 'CgAGe1q5_7SAdweXAAUPM3uA-fw935.jpg', 'jpg', 331571, 'ueditor/image/202007/1594369931bb74e8.jpg', 0, '', 1594369931);
INSERT INTO `dr_attachment_data` VALUES (127, 1, 'admin', 'ueditor:photo-home-edit-id:67', 'bhpx_hhkp_01.jpg', 'jpg', 294940, 'ueditor/image/202007/15943726551dad8b.jpg', 0, '', 1594372655);
INSERT INTO `dr_attachment_data` VALUES (128, 1, 'admin', 'ueditor:photo-home-edit-id:69', 'bhpx_hhzs_01.JPG', 'jpg', 291475, 'ueditor/image/202007/15943729435586de.jpg', 0, '', 1594372943);
INSERT INTO `dr_attachment_data` VALUES (129, 1, 'admin', 'ueditor:photo-home-edit-id:69', 'bhpx_hhzs_02.JPG', 'jpg', 341218, 'ueditor/image/202007/15943729437398a3.jpg', 0, '', 1594372943);
INSERT INTO `dr_attachment_data` VALUES (130, 1, 'admin', 'ueditor:photo-home-edit-id:69', 'bhpx_hhzs_03.jpg', 'jpg', 314185, 'ueditor/image/202007/1594372943966e0b.jpg', 0, '', 1594372943);
INSERT INTO `dr_attachment_data` VALUES (131, 1, 'admin', 'ueditor:photo-home-edit-id:69', 'bhpx_hhzs_04.JPG', 'jpg', 326360, 'ueditor/image/202007/1594372943c87f24.jpg', 0, '', 1594372943);
INSERT INTO `dr_attachment_data` VALUES (132, 1, 'admin', 'ueditor:photo-home-edit-id:69', 'bhpx_hhzs_05.JPG', 'jpg', 345936, 'ueditor/image/202007/159437294466b758.jpg', 0, '', 1594372943);
INSERT INTO `dr_attachment_data` VALUES (133, 1, 'admin', 'ueditor:photo-home-edit-id:68', 'bhpx_zsjnt_01.JPG', 'jpg', 321735, 'ueditor/image/202007/1594372976fd02d2.jpg', 0, '', 1594372975);
INSERT INTO `dr_attachment_data` VALUES (134, 1, 'admin', 'ueditor:photo-home-edit-id:68', 'bhpx_zsjnt_02.JPG', 'jpg', 277506, 'ueditor/image/202007/15943729767f0857.jpg', 0, '', 1594372975);
INSERT INTO `dr_attachment_data` VALUES (135, 1, 'admin', 'ueditor:photo-home-edit-id:66', 'bhpx_yy_02.jpg', 'jpg', 201773, 'ueditor/image/202007/1594373263a6ed6c.jpg', 0, '', 1594373263);
INSERT INTO `dr_attachment_data` VALUES (136, 1, 'admin', 'ueditor:photo-home-edit-id:65', 'bhpx_2016_05.jpg', 'jpg', 353535, 'ueditor/image/202007/15943733053cc598.jpg', 0, '', 1594373304);
INSERT INTO `dr_attachment_data` VALUES (137, 1, 'admin', 'ueditor:photo-home-edit-id:64', 'bhpx_jcgshhbzxm_03.JPG', 'jpg', 341769, 'ueditor/image/202007/15943733427db178.jpg', 0, '', 1594373342);
INSERT INTO `dr_attachment_data` VALUES (138, 1, 'admin', 'ueditor:photo-home-edit-id:64', 'bhpx_jcgshhbzxm_01.JPG', 'jpg', 319515, 'ueditor/image/202007/1594373342b5c83c.jpg', 0, '', 1594373342);
INSERT INTO `dr_attachment_data` VALUES (139, 1, 'admin', 'ueditor:photo-home-edit-id:64', 'bhpx_jcgshhbzxm_02.JPG', 'jpg', 318347, 'ueditor/image/202007/15943733433750f4.jpg', 0, '', 1594373342);
INSERT INTO `dr_attachment_data` VALUES (140, 1, 'admin', 'ueditor:photo-home-edit-id:63', 'bhpx_hyzl_01.jpg', 'jpg', 304888, 'ueditor/image/202007/159437345012dd0f.jpg', 0, '', 1594373450);
INSERT INTO `dr_attachment_data` VALUES (141, 1, 'admin', 'ueditor:photo-home-edit-id:63', 'bhpx_hyzl_02.jpg', 'jpg', 289400, 'ueditor/image/202007/159437345052b729.jpg', 0, '', 1594373450);
INSERT INTO `dr_attachment_data` VALUES (142, 1, 'admin', 'ueditor:photo-home-edit-id:63', 'bhpx_hyzl_03.jpg', 'jpg', 288312, 'ueditor/image/202007/1594373451cb4996.jpg', 0, '', 1594373451);
INSERT INTO `dr_attachment_data` VALUES (143, 1, 'admin', 'ueditor:photo-home-edit-id:63', 'bhpx_hyzl_04.jpg', 'jpg', 322591, 'ueditor/image/202007/1594373451453bc1.jpg', 0, '', 1594373451);
INSERT INTO `dr_attachment_data` VALUES (144, 1, 'admin', 'ueditor:photo-home-edit-id:62', 'bhpx_jcbhj_01.jpg', 'jpg', 320640, 'ueditor/image/202007/159437349047c69e.jpg', 0, '', 1594373490);
INSERT INTO `dr_attachment_data` VALUES (145, 1, 'admin', 'ueditor:photo-home-edit-id:62', 'bhpx_jcbhj_02.jpg', 'jpg', 302791, 'ueditor/image/202007/159437349056a2c1.jpg', 0, '', 1594373490);
INSERT INTO `dr_attachment_data` VALUES (146, 1, 'admin', 'ueditor:photo-home-edit-id:62', 'bhpx_jcbhj_03.jpg', 'jpg', 322793, 'ueditor/image/202007/1594373491268376.jpg', 0, '', 1594373491);
INSERT INTO `dr_attachment_data` VALUES (147, 1, 'admin', 'ueditor:photo-home-edit-id:60', 'bhpx_hrfw2_01.jpg', 'jpg', 268314, 'ueditor/image/202007/1594373645650247.jpg', 0, '', 1594373645);
INSERT INTO `dr_attachment_data` VALUES (148, 1, 'admin', 'ueditor:photo-home-edit-id:60', 'bhpx_hrfw2_02.jpg', 'jpg', 342323, 'ueditor/image/202007/15943736469beb91.jpg', 0, '', 1594373646);
INSERT INTO `dr_attachment_data` VALUES (149, 1, 'admin', 'ueditor:photo-home-edit-id:60', 'bhpx_hrfw2_03.jpg', 'jpg', 336751, 'ueditor/image/202007/159437364642101c.jpg', 0, '', 1594373646);
INSERT INTO `dr_attachment_data` VALUES (150, 1, 'admin', 'ueditor:photo-home-edit-id:58', 'bhpx_2016_01.jpg', 'jpg', 141730, 'ueditor/image/202007/159437371184c4c8.jpg', 0, '', 1594373711);
INSERT INTO `dr_attachment_data` VALUES (151, 1, 'admin', 'ueditor:photo-home-edit-id:57', 'bhpx_2016_04.jpg', 'jpg', 104868, 'ueditor/image/202007/1594373742e9023b.jpg', 0, '', 1594373742);
INSERT INTO `dr_attachment_data` VALUES (152, 1, 'admin', 'ueditor:photo-home-edit-id:56', 'bhpx_2016_03.jpg', 'jpg', 112003, 'ueditor/image/202007/1594373774adb8c6.jpg', 0, '', 1594373774);
INSERT INTO `dr_attachment_data` VALUES (153, 1, 'admin', 'ueditor:photo-home-edit-id:58', 'bhpx_hhzz_01.jpg', 'jpg', 261609, 'ueditor/image/202007/159437460124f02c.jpg', 0, '', 1594374601);
INSERT INTO `dr_attachment_data` VALUES (154, 1, 'admin', 'ueditor:photo-home-edit-id:57', 'bhpx_2016_04.jpg', 'jpg', 104868, 'ueditor/image/202007/1594374640bbf89a.jpg', 0, '', 1594374640);
INSERT INTO `dr_attachment_data` VALUES (155, 1, 'admin', 'ueditor:photo-home-edit-id:57', 'bhpx_hhfw_05.jpg', 'jpg', 255451, 'ueditor/image/202007/15943746593e1a05.jpg', 0, '', 1594374659);
INSERT INTO `dr_attachment_data` VALUES (156, 1, 'admin', 'ueditor:photo-home-edit-id:56', 'bhpx_hhbz_04.JPG', 'jpg', 325906, 'ueditor/image/202007/15943747333b4840.jpg', 0, '', 1594374733);
INSERT INTO `dr_attachment_data` VALUES (157, 1, 'admin', 'rand', 'bhpx_2016_01', 'jpg', 141730, '202007/3d6499f02b93cfc.jpg', 0, '{\"width\":225,\"height\":200}', 1594431024);
INSERT INTO `dr_attachment_data` VALUES (158, 1, 'admin', 'rand', '01', 'jpg', 331571, '202007/0d501b995db4dd6.jpg', 0, '{\"width\":437,\"height\":714}', 1594431250);
INSERT INTO `dr_attachment_data` VALUES (159, 1, 'admin', 'rand', '09', 'jpg', 250721, '202007/f5a90ddcc08c4e5.jpg', 0, '{\"width\":400,\"height\":560}', 1594431349);
INSERT INTO `dr_attachment_data` VALUES (160, 1, 'admin', 'ueditor:photo-home-add-id:0', '09.jpg', 'jpg', 250721, 'ueditor/image/202007/1594431365a3650f.jpg', 0, '', 1594431365);
INSERT INTO `dr_attachment_data` VALUES (161, 1, 'admin', 'rand', '11', 'jpg', 212757, '202007/83bc4e43535d68.jpg', 0, '{\"width\":400,\"height\":560}', 1594431641);
INSERT INTO `dr_attachment_data` VALUES (162, 1, 'admin', 'ueditor:photo-home-add-id:0', '11.jpg', 'jpg', 212757, 'ueditor/image/202007/1594431650f68bed.jpg', 0, '', 1594431650);
INSERT INTO `dr_attachment_data` VALUES (163, 1, 'admin', 'rand', '10', 'jpg', 273225, '202007/07cc5b8abf615a4.jpg', 0, '{\"width\":400,\"height\":560}', 1594431683);
INSERT INTO `dr_attachment_data` VALUES (164, 1, 'admin', 'ueditor:photo-home-add-id:0', '10.jpg', 'jpg', 273225, 'ueditor/image/202007/159443168835e13a.jpg', 0, '', 1594431687);
INSERT INTO `dr_attachment_data` VALUES (165, 1, 'admin', 'rand', '12', 'jpg', 263675, '202007/dfddb5067ae8426.jpg', 0, '{\"width\":400,\"height\":560}', 1594431760);
INSERT INTO `dr_attachment_data` VALUES (166, 1, 'admin', 'ueditor:photo-home-add-id:0', '12.jpg', 'jpg', 263675, 'ueditor/image/202007/159443176450574c.jpg', 0, '', 1594431763);
INSERT INTO `dr_attachment_data` VALUES (167, 1, 'admin', 'rand', '13', 'jpg', 216268, '202007/5512c1ed8e19992.jpg', 0, '{\"width\":400,\"height\":560}', 1594431798);
INSERT INTO `dr_attachment_data` VALUES (168, 1, 'admin', 'ueditor:photo-home-add-id:0', '13.jpg', 'jpg', 216268, 'ueditor/image/202007/15944318023036d8.jpg', 0, '', 1594431802);
INSERT INTO `dr_attachment_data` VALUES (169, 1, 'admin', 'rand', '08', 'jpg', 242869, '202007/cb8d5dbea4656f0.jpg', 0, '{\"width\":1110,\"height\":1590}', 1594431833);
INSERT INTO `dr_attachment_data` VALUES (170, 1, 'admin', 'ueditor:photo-home-add-id:0', '08.jpg', 'jpg', 242869, 'ueditor/image/202007/15944318457364a3.jpg', 0, '', 1594431845);
INSERT INTO `dr_attachment_data` VALUES (171, 1, 'admin', 'rand', '07', 'jpg', 239753, '202007/8a9df3af0fd35b9.jpg', 0, '{\"width\":1110,\"height\":1590}', 1594431874);
INSERT INTO `dr_attachment_data` VALUES (172, 1, 'admin', 'ueditor:photo-home-add-id:0', '07.jpg', 'jpg', 239753, 'ueditor/image/202007/1594431879e56807.jpg', 0, '', 1594431879);
INSERT INTO `dr_attachment_data` VALUES (173, 1, 'admin', 'rand', '03', 'jpg', 126215, '202007/8bbb284b4e0b.jpg', 0, '{\"width\":603,\"height\":875}', 1594431919);
INSERT INTO `dr_attachment_data` VALUES (174, 1, 'admin', 'ueditor:photo-home-add-id:0', '03.jpg', 'jpg', 126215, 'ueditor/image/202007/159443192256e1b8.jpg', 0, '', 1594431922);
INSERT INTO `dr_attachment_data` VALUES (175, 1, 'admin', 'rand', '01', 'jpg', 331571, '202007/8449b6cbcc47797.jpg', 0, '{\"width\":437,\"height\":714}', 1594431964);
INSERT INTO `dr_attachment_data` VALUES (176, 1, 'admin', 'ueditor:photo-home-add-id:0', '01.jpg', 'jpg', 331571, 'ueditor/image/202007/1594431969059a09.jpg', 0, '', 1594431969);
INSERT INTO `dr_attachment_data` VALUES (177, 1, 'admin', 'rand', '04', 'jpg', 155812, '202007/fba0b8967215430.jpg', 0, '{\"width\":471,\"height\":735}', 1594432070);
INSERT INTO `dr_attachment_data` VALUES (178, 1, 'admin', 'ueditor:photo-home-add-id:0', '04.jpg', 'jpg', 155812, 'ueditor/image/202007/1594432077e1fffe.jpg', 0, '', 1594432077);
INSERT INTO `dr_attachment_data` VALUES (179, 1, 'admin', 'rand', '05', 'jpg', 96781, '202007/70f15e07098bf95.jpg', 0, '{\"width\":535,\"height\":813}', 1594432130);
INSERT INTO `dr_attachment_data` VALUES (180, 1, 'admin', 'ueditor:photo-home-add-id:0', '05.jpg', 'jpg', 96781, 'ueditor/image/202007/159443213567bc83.jpg', 0, '', 1594432134);
INSERT INTO `dr_attachment_data` VALUES (181, 1, 'admin', 'rand', '06', 'jpg', 151662, '202007/d6de0e8ea080fd8.jpg', 0, '{\"width\":707,\"height\":1013}', 1594432175);
INSERT INTO `dr_attachment_data` VALUES (182, 1, 'admin', 'ueditor:photo-home-add-id:0', '06.jpg', 'jpg', 151662, 'ueditor/image/202007/1594432178f57dcc.jpg', 0, '', 1594432178);
INSERT INTO `dr_attachment_data` VALUES (183, 1, 'admin', 'rand', '02', 'jpg', 196802, '202007/559e68453c02fca.jpg', 0, '{\"width\":395,\"height\":565}', 1594432218);
INSERT INTO `dr_attachment_data` VALUES (184, 1, 'admin', 'ueditor:photo-home-add-id:0', '02.jpg', 'jpg', 196802, 'ueditor/image/202007/1594432227b6f3fa.jpg', 0, '', 1594432226);
INSERT INTO `dr_attachment_data` VALUES (185, 1, 'admin', 'rand', 'CgAGTFlQ9-SAetmwAAKOZgblHSc054', 'jpg', 167526, '202007/18bebe579035727.jpg', 0, '{\"width\":400,\"height\":560}', 1594432488);
INSERT INTO `dr_attachment_data` VALUES (186, 1, 'admin', 'ueditor:photo-home-add-id:0', 'CgAGTFlQ9-SAetmwAAKOZgblHSc054.jpg', 'jpg', 167526, 'ueditor/image/202007/1594432493d0ca5c.jpg', 0, '', 1594432492);
INSERT INTO `dr_attachment_data` VALUES (187, 1, 'admin', 'rand', 'CgAGS1lRApeAc4QRAAKvcb8W2eU693', 'jpg', 175985, '202007/e1840cd37479670.jpg', 0, '{\"width\":400,\"height\":560}', 1594432530);
INSERT INTO `dr_attachment_data` VALUES (188, 1, 'admin', 'ueditor:photo-home-add-id:0', 'CgAGS1lRApeAc4QRAAKvcb8W2eU693.jpg', 'jpg', 175985, 'ueditor/image/202007/15944325352da576.jpg', 0, '', 1594432534);
INSERT INTO `dr_attachment_data` VALUES (189, 1, 'admin', 'rand', 'CgAGS1lRA_iAZb2rAALaGnbAM-Q609', 'jpg', 186906, '202007/6314aa652a613ee.jpg', 0, '{\"width\":400,\"height\":560}', 1594432571);
INSERT INTO `dr_attachment_data` VALUES (190, 1, 'admin', 'ueditor:photo-home-add-id:0', 'CgAGS1lRA_iAZb2rAALaGnbAM-Q609.jpg', 'jpg', 186906, 'ueditor/image/202007/15944325757b240c.jpg', 0, '', 1594432575);
INSERT INTO `dr_attachment_data` VALUES (191, 1, 'admin', 'rand', 'CgAGS1lQ-g6AXS2UAARc53ax1Z8932', 'jpg', 285927, '202007/212cf47e650c4.jpg', 0, '{\"width\":400,\"height\":560}', 1594432603);
INSERT INTO `dr_attachment_data` VALUES (192, 1, 'admin', 'ueditor:photo-home-add-id:0', 'CgAGS1lQ-g6AXS2UAARc53ax1Z8932.jpg', 'jpg', 285927, 'ueditor/image/202007/159443260783b973.jpg', 0, '', 1594432607);
INSERT INTO `dr_attachment_data` VALUES (193, 1, 'admin', 'rand', 'CgAGS1lRBO-AfP7kAALg83fQS-0352', 'jpg', 188659, '202007/5bc293b4a4d86cf.jpg', 0, '{\"width\":400,\"height\":560}', 1594432636);
INSERT INTO `dr_attachment_data` VALUES (194, 1, 'admin', 'ueditor:photo-home-add-id:0', 'CgAGS1lRBO-AfP7kAALg83fQS-0352.jpg', 'jpg', 188659, 'ueditor/image/202007/15944326435514c8.jpg', 0, '', 1594432643);
INSERT INTO `dr_attachment_data` VALUES (195, 1, 'admin', 'rand', 'CgAGS1lQ_ROAMI3dAAQDlCnSkpc853', 'jpg', 263060, '202007/ea4e3642dde15b1.jpg', 0, '{\"width\":400,\"height\":560}', 1594432668);
INSERT INTO `dr_attachment_data` VALUES (196, 1, 'admin', 'ueditor:photo-home-add-id:0', 'CgAGS1lQ_ROAMI3dAAQDlCnSkpc853.jpg', 'jpg', 263060, 'ueditor/image/202007/15944326725000d4.jpg', 0, '', 1594432672);
INSERT INTO `dr_attachment_data` VALUES (197, 1, 'admin', 'rand', 'CgAGS1lSK7GAdQRfAAQHbzdEEEA933', 'jpg', 264047, '202007/6d47b169ae846d2.jpg', 0, '{\"width\":1110,\"height\":1590}', 1594432696);
INSERT INTO `dr_attachment_data` VALUES (198, 1, 'admin', 'ueditor:photo-home-add-id:0', 'CgAGS1lSK7GAdQRfAAQHbzdEEEA933.jpg', 'jpg', 264047, 'ueditor/image/202007/1594432730146334.jpg', 0, '', 1594432730);
INSERT INTO `dr_attachment_data` VALUES (199, 1, 'admin', 'rand', 'CgAGS1lRuyqANn80AAVXXBiZd1E387', 'jpg', 350044, '202007/738b23e8fdac058.jpg', 0, '{\"width\":400,\"height\":560}', 1594433067);
INSERT INTO `dr_attachment_data` VALUES (200, 1, 'admin', 'ueditor:photo-home-add-id:0', 'CgAGS1lRuyqANn80AAVXXBiZd1E387.jpg', 'jpg', 350044, 'ueditor/image/202007/159443307248ce54.jpg', 0, '', 1594433072);
INSERT INTO `dr_attachment_data` VALUES (201, 1, 'admin', 'rand', 'CgAGS1lRuWyAVR-gAAPVrtLYYG0869', 'jpg', 251310, '202007/5e7b12e996d06b3.jpg', 0, '{\"width\":400,\"height\":560}', 1594433110);
INSERT INTO `dr_attachment_data` VALUES (202, 1, 'admin', 'ueditor:photo-home-add-id:0', 'CgAGS1lRuWyAVR-gAAPVrtLYYG0869.jpg', 'jpg', 251310, 'ueditor/image/202007/1594433116a7cd1c.jpg', 0, '', 1594433116);
INSERT INTO `dr_attachment_data` VALUES (203, 1, 'admin', 'rand', 'CgAGTFlREoeASvfeAAUdpDnkfaA381', 'jpg', 335268, '202007/b4c39bd767dd4de.jpg', 0, '{\"width\":400,\"height\":560}', 1594433165);
INSERT INTO `dr_attachment_data` VALUES (204, 1, 'admin', 'rand', 'CgAGS1lRt6WAL6_HAARsK4vQ6p8671', 'jpg', 289835, '202007/4cb4b8fcea29.jpg', 0, '{\"width\":400,\"height\":560}', 1594433191);
INSERT INTO `dr_attachment_data` VALUES (205, 1, 'admin', 'ueditor:photo-home-add-id:0', 'CgAGS1lRt6WAL6_HAARsK4vQ6p8671.jpg', 'jpg', 289835, 'ueditor/image/202007/15944331959664a9.jpg', 0, '', 1594433195);
INSERT INTO `dr_attachment_data` VALUES (206, 1, 'admin', 'rand', 'CgAGS1lRt6WAL6_HAARsK4vQ6p8671', 'jpg', 289835, '202007/a345f30b0784366.jpg', 0, '{\"width\":400,\"height\":560}', 1594433218);
INSERT INTO `dr_attachment_data` VALUES (207, 1, 'admin', 'ueditor:photo-home-add-id:0', 'CgAGS1lRt6WAL6_HAARsK4vQ6p8671.jpg', 'jpg', 289835, 'ueditor/image/202007/159443322250d997.jpg', 0, '', 1594433222);
INSERT INTO `dr_attachment_data` VALUES (208, 1, 'admin', 'ueditor:photo-home-edit-id:108', 'CgAGTFlQ95uAZRlLAAUu114mCNQ763.JPG', 'jpg', 339671, 'ueditor/image/202007/1594433495f53ebc.jpg', 0, '', 1594433495);
INSERT INTO `dr_attachment_data` VALUES (209, 1, 'admin', 'ueditor:photo-home-edit-id:108', 'CgAGS1lQ_36AGLsyAAOMck703QA340.jpg', 'jpg', 232562, 'ueditor/image/202007/1594433709b8c771.jpg', 0, '', 1594433709);
INSERT INTO `dr_attachment_data` VALUES (210, 1, 'admin', 'ueditor:photo-home-edit-id:108', 'CgAGTFlQ95uAZRlLAAUu114mCNQ763.JPG', 'jpg', 339671, 'ueditor/image/202007/1594433709aa81da.jpg', 0, '', 1594433709);
INSERT INTO `dr_attachment_data` VALUES (211, 1, 'admin', 'ueditor:photo-home-edit-id:108', 'CgAGTFlQ97SAWqbUAAOmW2KUNY8154.JPG', 'jpg', 239195, 'ueditor/image/202007/159443370991c7fb.jpg', 0, '', 1594433709);
INSERT INTO `dr_attachment_data` VALUES (212, 1, 'admin', 'ueditor:photo-home-edit-id:108', 'CgAGS1lQ_MyAbs1gAAKL_o_f8cA421.JPG', 'jpg', 166910, 'ueditor/image/202007/15944338311f5590.jpg', 0, '', 1594433831);
INSERT INTO `dr_attachment_data` VALUES (213, 1, 'admin', 'ueditor:photo-home-edit-id:104', 'CgAGS1lRAbKAWqR-AAPOWOcjECU724.jpg', 'jpg', 249432, 'ueditor/image/202007/159443469367817d.jpg', 0, '', 1594434693);
INSERT INTO `dr_attachment_data` VALUES (214, 1, 'admin', 'ueditor:photo-home-edit-id:104', 'CgAGS1lRAc-ADN-dAATWrJ_L-5I971.JPG', 'jpg', 317100, 'ueditor/image/202007/15944347159a664a.jpg', 0, '', 1594434715);
INSERT INTO `dr_attachment_data` VALUES (215, 1, 'admin', 'ueditor:photo-home-edit-id:104', 'CgAGS1lRAmeAfJaAAAQeyA0LrYg433.jpg', 'jpg', 270024, 'ueditor/image/202007/1594434715426192.jpg', 0, '', 1594434715);
INSERT INTO `dr_attachment_data` VALUES (216, 1, 'admin', 'ueditor:photo-home-edit-id:105', 'CgAGS1lRA4OABMf_AAPst8SKWXM872.jpg', 'jpg', 257207, 'ueditor/image/202007/15944347787e7a71.jpg', 0, '', 1594434778);
INSERT INTO `dr_attachment_data` VALUES (217, 1, 'admin', 'ueditor:photo-home-edit-id:107', 'CgAGS1lRBM-ACCd9AARLYBQtMww863.jpg', 'jpg', 281440, 'ueditor/image/202007/159443483528d696.jpg', 0, '', 1594434834);
INSERT INTO `dr_attachment_data` VALUES (218, 1, 'admin', 'ueditor:photo-home-edit-id:107', 'CgAGS1lRBLmAAvHzAAST5Mlq0y8610.jpg', 'jpg', 300004, 'ueditor/image/202007/15944348357974a2.jpg', 0, '', 1594434834);
INSERT INTO `dr_attachment_data` VALUES (219, 1, 'admin', 'ueditor:photo-home-edit-id:106', 'CgAGS1lQ-UiADXzeAAOfsFinm70340.jpg', 'jpg', 237488, 'ueditor/image/202007/1594434914781b1b.jpg', 0, '', 1594434913);
INSERT INTO `dr_attachment_data` VALUES (220, 1, 'admin', 'ueditor:photo-home-edit-id:106', 'CgAGS1lQ-b-AfF-4AAR5yEbp1D0428.jpg', 'jpg', 293320, 'ueditor/image/202007/15944349249e31dd.jpg', 0, '', 1594434924);
INSERT INTO `dr_attachment_data` VALUES (221, 1, 'admin', 'ueditor:photo-home-edit-id:110', 'CgAGS1lRuvWABhuKAASKww_zWh0220.jpg', 'jpg', 297667, 'ueditor/image/202007/159443537230faf2.jpg', 0, '', 1594435372);
INSERT INTO `dr_attachment_data` VALUES (222, 1, 'admin', 'ueditor:photo-home-edit-id:110', 'CgAGS1lRuw6AUDYcAAUbZ24ouLw383.jpg', 'jpg', 334695, 'ueditor/image/202007/1594435372c2da7a.jpg', 0, '', 1594435372);
INSERT INTO `dr_attachment_data` VALUES (223, 1, 'admin', 'ueditor:photo-home-edit-id:111', 'CgAGS1lRuOyAantVAAUTHRadk2k728.jpg', 'jpg', 332573, 'ueditor/image/202007/1594435487475d9d.jpg', 0, '', 1594435487);
INSERT INTO `dr_attachment_data` VALUES (224, 1, 'admin', 'ueditor:photo-home-edit-id:111', 'CgAGS1lRuQCAWN9GAAVWzf-bPzQ950.jpg', 'jpg', 141801, 'ueditor/image/202007/1594435487240aec.jpg', 0, '', 1594435487);
INSERT INTO `dr_attachment_data` VALUES (225, 1, 'admin', 'ueditor:photo-home-edit-id:112', 'CgAGTFlREaSAL7k-AAUSB6SmueU699.jpg', 'jpg', 332295, 'ueditor/image/202007/15944355736fa117.jpg', 0, '', 1594435573);
INSERT INTO `dr_attachment_data` VALUES (226, 1, 'admin', 'ueditor:photo-home-edit-id:112', 'CgAGTFlREcCAeT6jAAREX6aNQWg285.jpg', 'jpg', 279647, 'ueditor/image/202007/1594435573cff44a.jpg', 0, '', 1594435573);
INSERT INTO `dr_attachment_data` VALUES (227, 1, 'admin', 'ueditor:photo-home-edit-id:112', 'CgAGTFlREdaARMrvAAOciQ8MED4454.JPG', 'jpg', 236681, 'ueditor/image/202007/1594435573f7f3ad.jpg', 0, '', 1594435573);
INSERT INTO `dr_attachment_data` VALUES (228, 1, 'admin', 'ueditor:photo-home-edit-id:112', 'CgAGTFlREWSADYM6AAOne4x609I294.jpg', 'jpg', 239483, 'ueditor/image/202007/15944355731a4d19.jpg', 0, '', 1594435573);
INSERT INTO `dr_attachment_data` VALUES (229, 1, 'admin', 'ueditor:photo-home-edit-id:112', 'CgAGTFlREZCASohwAAM0WmiGC0c409.JPG', 'jpg', 210010, 'ueditor/image/202007/15944355736df14b.jpg', 0, '', 1594435573);
INSERT INTO `dr_attachment_data` VALUES (230, 1, 'admin', 'ueditor:photo-home-edit-id:112', 'CgAGTFlREWSADYM6AAOne4x609I294.jpg', 'jpg', 239483, 'ueditor/image/202007/1594435618609674.jpg', 0, '', 1594435618);
INSERT INTO `dr_attachment_data` VALUES (231, 1, 'admin', 'ueditor:photo-home-edit-id:113', 'CgAGS1lRtc6Ab9jiAARVWnyxP_o394.jpg', 'jpg', 283994, 'ueditor/image/202007/15944356681766de.jpg', 0, '', 1594435667);
INSERT INTO `dr_attachment_data` VALUES (232, 1, 'admin', 'ueditor:photo-home-edit-id:113', 'CgAGS1lRtg6AazLGAASb9PyMbqQ518.jpg', 'jpg', 302068, 'ueditor/image/202007/159443570303e0ac.jpg', 0, '', 1594435703);
INSERT INTO `dr_attachment_data` VALUES (233, 1, 'admin', 'ueditor:photo-home-edit-id:113', 'CgAGS1lRtp-APsvAAAQfFRwpcRg445.jpg', 'jpg', 270101, 'ueditor/image/202007/15944357032eaeb5.jpg', 0, '', 1594435703);
INSERT INTO `dr_attachment_data` VALUES (234, 1, 'admin', 'ueditor:photo-home-edit-id:113', 'CgAGS1lRtnyAM9UpAASRIzGKbwk427.JPG', 'jpg', 299299, 'ueditor/image/202007/1594435703cc7801.jpg', 0, '', 1594435703);
INSERT INTO `dr_attachment_data` VALUES (235, 1, 'admin', 'ueditor:photo-home-edit-id:113', 'CgAGS1lRtrmAD0J7AAQ3m9_VBwo400.JPG', 'jpg', 276379, 'ueditor/image/202007/1594435703bcca9f.jpg', 0, '', 1594435703);
INSERT INTO `dr_attachment_data` VALUES (236, 1, 'admin', 'rand', 'CgAGTFlREcCAeT6jAAREX6aNQWg285', 'jpg', 279647, '202007/54f204a2604bcda.jpg', 0, '{\"width\":1413,\"height\":794}', 1594438081);
INSERT INTO `dr_attachment_data` VALUES (237, 1, 'admin', 'ueditor:category-edit-id:47', 'dianh0.jpg', 'jpg', 8888, 'ueditor/image/202007/15944390648da451.jpg', 0, '', 1594439063);
INSERT INTO `dr_attachment_data` VALUES (238, 1, 'admin', 'ueditor:category-edit-id:47', 'dianh0.jpg', 'jpg', 8888, 'ueditor/image/202007/1594439257976a7a.jpg', 0, '', 1594439257);
INSERT INTO `dr_attachment_data` VALUES (239, 1, 'admin', 'ueditor:category-edit-id:47', 'dianh0.jpg', 'jpg', 8888, 'ueditor/image/202007/1594439303a8ea18.jpg', 0, '', 1594439303);
INSERT INTO `dr_attachment_data` VALUES (240, 1, 'admin', 'ueditor:category-edit-id:47', 'dizhi.jpg', 'jpg', 4857, 'ueditor/image/202007/1594439352a64bce.jpg', 0, '', 1594439352);
INSERT INTO `dr_attachment_data` VALUES (241, 1, 'admin', 'ueditor:category-edit-id:47', 'emall.jpg', 'jpg', 10523, 'ueditor/image/202007/1594439352526fc9.jpg', 0, '', 1594439352);
INSERT INTO `dr_attachment_data` VALUES (242, 1, 'admin', 'ueditor:category-edit-id:47', 'dianh0.jpg', 'jpg', 8888, 'ueditor/image/202007/1594439395d25a4c.jpg', 0, '', 1594439395);
INSERT INTO `dr_attachment_data` VALUES (243, 1, 'admin', 'ueditor:category-edit-id:47', 'dianh0.jpg', 'jpg', 8888, 'ueditor/image/202007/15944394248b9fc2.jpg', 0, '', 1594439424);
INSERT INTO `dr_attachment_data` VALUES (244, 1, 'admin', 'ueditor:category-edit-id:47', 'dizhi.jpg', 'jpg', 4857, 'ueditor/image/202007/1594439424bb3cf4.jpg', 0, '', 1594439424);
INSERT INTO `dr_attachment_data` VALUES (245, 1, 'admin', 'ueditor:category-edit-id:47', 'emall.jpg', 'jpg', 10523, 'ueditor/image/202007/15944394241deb9c.jpg', 0, '', 1594439424);
INSERT INTO `dr_attachment_data` VALUES (246, 1, 'admin', 'ueditor:news-home-add-id:0', 'CgAGTFk-U_CAUaEUAANb89zgM74339 (1).jpg', 'jpg', 220147, 'ueditor/image/202007/159444029226f069.jpg', 0, '', 1594440292);
INSERT INTO `dr_attachment_data` VALUES (247, 1, 'admin', 'rand', 'CgAGTFk-U_CAUaEUAANb89zgM74339', 'jpg', 220147, '202007/4e08806c9069a3.jpg', 0, '{\"width\":1110,\"height\":1590}', 1594442582);
INSERT INTO `dr_attachment_data` VALUES (248, 1, 'admin', 'rand', 'CgAGS1lRuqiAHpecAAVDtDfZxN0325', 'jpg', 345012, '202007/b1eec212cf416.jpg', 0, '{\"width\":1721,\"height\":1291}', 1594443717);
INSERT INTO `dr_attachment_data` VALUES (249, 1, 'admin', 'rand', 'CgAGS1lRuvWABhuKAASKww_zWh0220', 'jpg', 297667, '202007/81d7b77c1efb2c4.jpg', 0, '{\"width\":2343,\"height\":1562}', 1594443782);
INSERT INTO `dr_attachment_data` VALUES (250, 1, 'admin', 'ueditor:news-home-add-id:0', 'CgAGS1kzGF6AP6B8AAPRyFd1i2Y233.jpg', 'jpg', 250312, 'ueditor/image/202007/1594444243bb1dbe.jpg', 0, '', 1594444243);
INSERT INTO `dr_attachment_data` VALUES (251, 1, 'admin', 'ueditor:news-home-add-id:0', 'CgAGS1kzGCiAaPvPAAReVafWAYU890.jpg', 'jpg', 286293, 'ueditor/image/202007/1594444267bde90f.jpg', 0, '', 1594444267);
INSERT INTO `dr_attachment_data` VALUES (252, 1, 'admin', 'rand', 'CgAGS1kzF_aAMAbAAAMWY04Rqmg543', 'jpg', 202339, '202007/9e326ff6b168d6a.jpg', 0, '{\"width\":1600,\"height\":1200}', 1594444313);
INSERT INTO `dr_attachment_data` VALUES (253, 1, 'admin', 'ueditor:news-home-add-id:0', 'CgAGS1kzF_aAMAbAAAMWY04Rqmg543.jpg', 'jpg', 202339, 'ueditor/image/202007/1594444318b57c3d.jpg', 0, '', 1594444318);
INSERT INTO `dr_attachment_data` VALUES (254, 1, 'admin', 'rand', 'CgAGS1kzF8OAJaETAAKy1JDw6Us290', 'jpg', 176852, '202007/01f9dad26a01aa2.jpg', 0, '{\"width\":1600,\"height\":1200}', 1594444339);
INSERT INTO `dr_attachment_data` VALUES (255, 1, 'admin', 'ueditor:news-home-add-id:0', 'CgAGS1kzF8OAJaETAAKy1JDw6Us290.jpg', 'jpg', 176852, 'ueditor/image/202007/1594444345b2ced1.jpg', 0, '', 1594444345);
INSERT INTO `dr_attachment_data` VALUES (256, 1, 'admin', 'ueditor:news-home-add-id:0', 'CgAGS1kzF4uAApK3AAIiL76Fv3g682.jpg', 'jpg', 139823, 'ueditor/image/202007/1594444366e9a7b2.jpg', 0, '', 1594444366);
INSERT INTO `dr_attachment_data` VALUES (257, 1, 'admin', 'ueditor:news-home-add-id:0', 'CgAGS1kzF1aAcMrQAANn8BTXk9k833.jpg', 'jpg', 223216, 'ueditor/image/202007/1594444391883d4d.jpg', 0, '', 1594444391);
INSERT INTO `dr_attachment_data` VALUES (258, 1, 'admin', 'ueditor:news-home-add-id:0', 'CgAGS1kzFxSAI3k1AAS0xZ8CJmE350.jpg', 'jpg', 308421, 'ueditor/image/202007/1594444409d3f314.jpg', 0, '', 1594444409);
INSERT INTO `dr_attachment_data` VALUES (259, 1, 'admin', 'ueditor:news-home-add-id:0', 'CgAGS1kzFsOAEZrrAAP7kg4gTM4067.jpg', 'jpg', 261010, 'ueditor/image/202007/159444443608617e.jpg', 0, '', 1594444436);
INSERT INTO `dr_attachment_data` VALUES (260, 1, 'admin', 'rand', 'CgAGS1kzGF6AP6B8AAPRyFd1i2Y233', 'jpg', 250312, '202007/3ddbb41b6a25218.jpg', 0, '{\"width\":1600,\"height\":1200}', 1594444494);
INSERT INTO `dr_attachment_data` VALUES (261, 1, 'admin', 'rand', 'CgAGS1kzGCiAaPvPAAReVafWAYU890', 'jpg', 286293, '202007/9aa4089aff6a345.jpg', 0, '{\"width\":1600,\"height\":1200}', 1594444533);
INSERT INTO `dr_attachment_data` VALUES (262, 1, 'admin', 'rand', 'CgAGS1kzFsOAEZrrAAP7kg4gTM4067', 'jpg', 261010, '202007/693eaa31b5c16bf.jpg', 0, '{\"width\":1600,\"height\":1200}', 1594444566);
INSERT INTO `dr_attachment_data` VALUES (263, 1, 'admin', 'rand', 'CgAGS1kzFxSAI3k1AAS0xZ8CJmE350', 'jpg', 308421, '202007/7cbf3fc0cc1e532.jpg', 0, '{\"width\":1343,\"height\":1790}', 1594444586);
INSERT INTO `dr_attachment_data` VALUES (264, 1, 'admin', 'rand', 'CgAGS1kzF4uAApK3AAIiL76Fv3g682', 'jpg', 139823, '202007/4d9d02f46b19d1.jpg', 0, '{\"width\":1600,\"height\":1200}', 1594444639);
INSERT INTO `dr_attachment_data` VALUES (265, 1, 'admin', 'rand', 'CgAGS1kzF1aAcMrQAANn8BTXk9k833', 'jpg', 223216, '202007/d735c7868b53e04.jpg', 0, '{\"width\":1600,\"height\":1200}', 1594444651);
INSERT INTO `dr_attachment_data` VALUES (266, 1, 'admin', 'rand', 'CgAGS1kzF4uAApK3AAIiL76Fv3g682', 'jpg', 139823, '202007/fed4e61f7c32510.jpg', 0, '{\"width\":1600,\"height\":1200}', 1594444689);
INSERT INTO `dr_attachment_data` VALUES (267, 1, 'admin', 'rand', 'dwgk03=0', 'jpg', 20253, '202007/6104bee8b8e74e2.jpg', 0, '{\"width\":500,\"height\":350}', 1594445398);
INSERT INTO `dr_attachment_data` VALUES (268, 1, 'admin', 'rand', 'dwgk04', 'jpg', 19557, '202007/bf2b4fba1255b84.jpg', 0, '{\"width\":532,\"height\":299}', 1594445456);
INSERT INTO `dr_attachment_data` VALUES (269, 1, 'admin', 'rand', 'dwgk04', 'jpg', 19557, '202007/0a0d683ce8abe6e.jpg', 0, '{\"width\":532,\"height\":299}', 1594445483);
INSERT INTO `dr_attachment_data` VALUES (270, 1, 'admin', 'rand', 'dwgk04', 'jpg', 19557, '202007/9c1d1f51db8af47.jpg', 0, '{\"width\":532,\"height\":299}', 1594445590);
INSERT INTO `dr_attachment_data` VALUES (271, 1, 'admin', 'rand', 'dwgk04', 'jpg', 19557, '202007/97e4343c03be9f7.jpg', 0, '{\"width\":532,\"height\":299}', 1594445618);
INSERT INTO `dr_attachment_data` VALUES (272, 1, 'admin', 'rand', 'dwgk04', 'jpg', 19557, '202007/aecb5f97d5a2771.jpg', 0, '{\"width\":532,\"height\":299}', 1594445628);
INSERT INTO `dr_attachment_data` VALUES (273, 1, 'admin', 'rand', 'dwgk04', 'jpg', 19557, '202007/217e6983a5ec864.jpg', 0, '{\"width\":532,\"height\":299}', 1594445653);
INSERT INTO `dr_attachment_data` VALUES (274, 1, 'admin', 'rand', 'dwgk04', 'jpg', 19557, '202007/3b4dd9790835e87.jpg', 0, '{\"width\":532,\"height\":299}', 1594445701);
INSERT INTO `dr_attachment_data` VALUES (275, 1, 'admin', 'rand', 'dwgk04', 'jpg', 19557, '202007/c458b6baf5cc46b.jpg', 0, '{\"width\":532,\"height\":299}', 1594445715);
INSERT INTO `dr_attachment_data` VALUES (276, 1, 'admin', 'rand', 'dwgk04', 'jpg', 19557, '202007/19cfd0b73eb5a1d.jpg', 0, '{\"width\":532,\"height\":299}', 1594445728);
INSERT INTO `dr_attachment_data` VALUES (277, 1, 'admin', 'rand', 'dwgk04', 'jpg', 19557, '202007/32bc874193b8220.jpg', 0, '{\"width\":532,\"height\":299}', 1594445741);
INSERT INTO `dr_attachment_data` VALUES (278, 1, 'admin', 'rand', 'dwgk04', 'jpg', 19557, '202007/af655cefd8cc.jpg', 0, '{\"width\":532,\"height\":299}', 1594445760);
INSERT INTO `dr_attachment_data` VALUES (279, 1, 'admin', 'rand', 'dwgk04', 'jpg', 19557, '202007/e6ff05739c2b60c.jpg', 0, '{\"width\":532,\"height\":299}', 1594445774);
INSERT INTO `dr_attachment_data` VALUES (280, 1, 'admin', 'rand', 'dwgk04', 'jpg', 19557, '202007/2fa7dd3659df38e.jpg', 0, '{\"width\":532,\"height\":299}', 1594445787);
INSERT INTO `dr_attachment_data` VALUES (281, 1, 'admin', 'rand', 'dwgk04', 'jpg', 19557, '202007/59e92bd4a9857da.jpg', 0, '{\"width\":532,\"height\":299}', 1594445801);
INSERT INTO `dr_attachment_data` VALUES (282, 1, 'admin', 'rand', 'dwgk04', 'jpg', 19557, '202007/5fa22bf67cafb9f.jpg', 0, '{\"width\":532,\"height\":299}', 1594445819);
INSERT INTO `dr_attachment_data` VALUES (283, 1, 'admin', 'rand', 'dwgk04', 'jpg', 19557, '202007/3f44a7437ca34b1.jpg', 0, '{\"width\":532,\"height\":299}', 1594445834);
INSERT INTO `dr_attachment_data` VALUES (284, 1, 'admin', 'rand', 'dwgk04', 'jpg', 19557, '202007/cfa3c849c982902.jpg', 0, '{\"width\":532,\"height\":299}', 1594445872);
INSERT INTO `dr_attachment_data` VALUES (285, 1, 'admin', 'rand', 'dwgk04', 'jpg', 19557, '202007/2392b994c10ce24.jpg', 0, '{\"width\":532,\"height\":299}', 1594445884);
INSERT INTO `dr_attachment_data` VALUES (286, 1, 'admin', 'rand', 'bhpx_hhzs_02', 'jpg', 341218, '202007/aba564fd1f4b996.jpg', 0, '{\"width\":1687,\"height\":1125}', 1594452755);
INSERT INTO `dr_attachment_data` VALUES (287, 1, 'admin', 'rand', '1111', 'jpg', 741620, '202007/7fb0a75eb2cd.jpg', 0, '{\"width\":1457,\"height\":1943}', 1594620413);

-- ----------------------------
-- Table structure for dr_attachment_remote
-- ----------------------------
DROP TABLE IF EXISTS `dr_attachment_remote`;
CREATE TABLE `dr_attachment_remote`  (
  `id` tinyint(2) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` tinyint(2) NOT NULL COMMENT '类型',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '访问地址',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '参数值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '远程附件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_attachment_unused
-- ----------------------------
DROP TABLE IF EXISTS `dr_attachment_unused`;
CREATE TABLE `dr_attachment_unused`  (
  `id` mediumint(8) UNSIGNED NOT NULL COMMENT '附件id',
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员id',
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会员',
  `siteid` mediumint(5) UNSIGNED NOT NULL COMMENT '站点id',
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文件大小',
  `attachment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '远程附件id',
  `attachinfo` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '附件信息',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE,
  INDEX `fileext`(`fileext`) USING BTREE,
  INDEX `remote`(`remote`) USING BTREE,
  INDEX `author`(`author`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '未使用的附件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_cron
-- ----------------------------
DROP TABLE IF EXISTS `dr_cron`;
CREATE TABLE `dr_cron`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `site` int(10) NOT NULL COMMENT '站点',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '参数值',
  `status` tinyint(1) UNSIGNED NOT NULL COMMENT '状态',
  `error` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '错误信息',
  `updatetime` int(10) UNSIGNED NOT NULL COMMENT '执行时间',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '写入时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `site`(`site`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `updatetime`(`updatetime`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_field
-- ----------------------------
DROP TABLE IF EXISTS `dr_field`;
CREATE TABLE `dr_field`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段别名语言',
  `fieldname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段名称',
  `fieldtype` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段类型',
  `relatedid` smallint(5) UNSIGNED NOT NULL COMMENT '相关id',
  `relatedname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '相关表',
  `isedit` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否可修改',
  `ismain` tinyint(1) UNSIGNED NOT NULL COMMENT '是否主表',
  `issystem` tinyint(1) UNSIGNED NOT NULL COMMENT '是否系统表',
  `ismember` tinyint(1) UNSIGNED NOT NULL COMMENT '是否会员可见',
  `issearch` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否可搜索',
  `disabled` tinyint(1) UNSIGNED NOT NULL COMMENT '禁用？',
  `setting` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置信息',
  `displayorder` int(5) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `list`(`relatedid`, `disabled`, `issystem`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 85 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字段表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dr_field
-- ----------------------------
INSERT INTO `dr_field` VALUES (1, '主题', 'title', 'Text', 1, 'module', 1, 1, 1, 1, 1, 0, '{\"option\":{\"width\":400,\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\"},\"validate\":{\"xss\":1,\"required\":1,\"formattr\":\"onblur=\\\"check_title();get_keywords(\'keywords\');\\\"\"}}', 0);
INSERT INTO `dr_field` VALUES (2, '缩略图', 'thumb', 'File', 1, 'module', 1, 1, 1, 1, 1, 0, '{\"option\":{\"ext\":\"jpg,gif,png\",\"size\":10,\"width\":400,\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\"}}', 0);
INSERT INTO `dr_field` VALUES (3, '关键字', 'keywords', 'Text', 1, 'module', 1, 1, 1, 1, 1, 0, '{\"option\":{\"width\":400,\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\"},\"validate\":{\"xss\":1,\"formattr\":\" data-role=\\\"tagsinput\\\"\"}}', 0);
INSERT INTO `dr_field` VALUES (4, '描述', 'description', 'Textarea', 1, 'module', 1, 1, 1, 1, 1, 0, '{\"option\":{\"width\":500,\"height\":60,\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\"},\"validate\":{\"xss\":1,\"filter\":\"dr_clearhtml\"}}', 0);
INSERT INTO `dr_field` VALUES (5, '内容', 'content', 'Ueditor', 1, 'module', 1, 0, 1, 1, 1, 0, '{\"option\":{\"mode\":1,\"width\":\"100%\",\"height\":400},\"validate\":{\"xss\":1,\"required\":1}}', 0);
INSERT INTO `dr_field` VALUES (6, '主题', 'title', 'Text', 2, 'module', 1, 1, 1, 1, 1, 0, '{\"option\":{\"width\":400,\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\"},\"validate\":{\"xss\":1,\"required\":1,\"formattr\":\"onblur=\\\"check_title();get_keywords(\'keywords\');\\\"\"}}', 0);
INSERT INTO `dr_field` VALUES (7, '缩略图', 'thumb', 'File', 2, 'module', 1, 1, 1, 1, 1, 0, '{\"option\":{\"ext\":\"jpg,gif,png\",\"size\":10,\"width\":400,\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\"}}', 0);
INSERT INTO `dr_field` VALUES (8, '关键字', 'keywords', 'Text', 2, 'module', 1, 1, 1, 1, 1, 0, '{\"option\":{\"width\":400,\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\"},\"validate\":{\"xss\":1,\"formattr\":\" data-role=\\\"tagsinput\\\"\"}}', 0);
INSERT INTO `dr_field` VALUES (9, '描述', 'description', 'Textarea', 2, 'module', 1, 1, 1, 1, 1, 0, '{\"option\":{\"width\":500,\"height\":60,\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\"},\"validate\":{\"xss\":1,\"filter\":\"dr_clearhtml\"}}', 0);
INSERT INTO `dr_field` VALUES (10, '内容', 'content', 'Ueditor', 2, 'module', 1, 0, 1, 1, 1, 0, '{\"option\":{\"mode\":1,\"width\":\"100%\",\"height\":400},\"validate\":{\"xss\":1,\"required\":1}}', 0);
INSERT INTO `dr_field` VALUES (11, '图片', 'images', 'Files', 2, 'module', 1, 0, 0, 1, 1, 1, '{\"option\":{\"input\":\"1\",\"size\":\"10\",\"count\":\"10\",\"ext\":\"jpg,jpeg,png\",\"attachment\":\"0\",\"css\":\"\"},\"validate\":{\"required\":\"0\",\"pattern\":\"\",\"errortips\":\"\",\"check\":\"\",\"filter\":\"\",\"formattr\":\"\",\"tips\":\"\",\"xss\":1},\"is_right\":\"0\"}', 0);
INSERT INTO `dr_field` VALUES (12, '栏目英文名称', 'eng_name', 'Text', 0, 'category-share', 1, 1, 0, 1, 0, 0, '{\"option\":{\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\",\"value\":\"\",\"width\":\"\",\"css\":\"\"},\"validate\":{\"required\":\"\",\"pattern\":\"\",\"errortips\":\"\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"\"}', 0);
INSERT INTO `dr_field` VALUES (13, '相关附件', 'attachment', 'Files', 1, 'page', 1, 1, 1, 1, 0, 0, 'a:2:{s:6:\"option\";a:5:{s:5:\"width\";s:3:\"80%\";s:4:\"size\";s:1:\"2\";s:5:\"count\";s:2:\"10\";s:3:\"ext\";s:31:\"jpg,gif,png,ppt,doc,xls,rar,zip\";s:10:\"uploadpath\";s:0:\"\";}s:8:\"validate\";a:9:{s:8:\"required\";s:1:\"0\";s:7:\"pattern\";s:0:\"\";s:9:\"errortips\";s:0:\"\";s:6:\"isedit\";s:1:\"0\";s:3:\"xss\";s:1:\"0\";s:5:\"check\";s:0:\"\";s:6:\"filter\";s:0:\"\";s:4:\"tips\";s:0:\"\";s:8:\"formattr\";s:0:\"\";}}', 0);
INSERT INTO `dr_field` VALUES (14, '页面内容', 'content', 'Ueditor', 1, 'page', 1, 1, 1, 1, 0, 0, 'a:2:{s:6:\"option\";a:7:{s:5:\"width\";s:3:\"90%\";s:6:\"height\";s:3:\"400\";s:4:\"mode\";s:1:\"1\";s:4:\"tool\";s:0:\"\";s:5:\"mode2\";s:1:\"1\";s:5:\"tool2\";s:0:\"\";s:5:\"value\";s:0:\"\";}s:8:\"validate\";a:9:{s:8:\"required\";s:1:\"1\";s:7:\"pattern\";s:0:\"\";s:9:\"errortips\";s:0:\"\";s:6:\"isedit\";s:1:\"0\";s:3:\"xss\";s:1:\"1\";s:5:\"check\";s:0:\"\";s:6:\"filter\";s:0:\"\";s:4:\"tips\";s:0:\"\";s:8:\"formattr\";s:0:\"\";}}', 0);
INSERT INTO `dr_field` VALUES (15, '软件名称', 'title', 'Text', 3, 'module', 1, 1, 1, 1, 1, 0, '{\"option\":{\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\",\"value\":\"\",\"width\":\"300\",\"css\":\"\"},\"validate\":{\"required\":\"1\",\"pattern\":\"\",\"errortips\":\"\",\"xss\":\"1\",\"check\":\"\",\"filter\":\"\",\"formattr\":\"onblur=\\\"check_title();get_keywords(\'keywords\');\\\"\",\"tips\":\"\"},\"is_right\":\"0\"}', 0);
INSERT INTO `dr_field` VALUES (16, '缩略图', 'thumb', 'File', 3, 'module', 1, 1, 1, 1, 1, 0, '{\"option\":{\"ext\":\"jpg,gif,png\",\"size\":10,\"width\":400,\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\"}}', 0);
INSERT INTO `dr_field` VALUES (17, '关键字', 'keywords', 'Text', 3, 'module', 1, 1, 1, 1, 1, 0, '{\"option\":{\"width\":400,\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\"},\"validate\":{\"xss\":1,\"formattr\":\" data-role=\\\"tagsinput\\\"\"}}', 0);
INSERT INTO `dr_field` VALUES (18, '描述', 'description', 'Textarea', 3, 'module', 1, 1, 1, 1, 1, 0, '{\"option\":{\"width\":500,\"height\":60,\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\"},\"validate\":{\"xss\":1,\"filter\":\"dr_clearhtml\"}}', 0);
INSERT INTO `dr_field` VALUES (34, '您的昵称', 'title', 'Text', 1, 'form-1', 1, 1, 1, 1, 0, 0, '{\"option\":{\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\",\"value\":\"\",\"width\":\"300\",\"css\":\"\"},\"validate\":{\"required\":\"1\",\"pattern\":\"\",\"errortips\":\"\",\"xss\":\"1\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"\"}', 0);
INSERT INTO `dr_field` VALUES (33, '内容', 'content', 'Ueditor', 4, 'module', 1, 0, 1, 1, 0, 1, '{\"option\":{\"down_img\":\"\",\"down_img_type\":\"\",\"watermark\":\"\",\"show_bottom_boot\":\"\",\"mini\":\"\",\"autofloat\":\"\",\"autoheight\":\"\",\"page\":\"\",\"mode\":\"1\",\"tool\":\"\'bold\', \'italic\', \'underline\'\",\"mode2\":\"1\",\"tool2\":\"\'bold\', \'italic\', \'underline\'\",\"mode3\":\"1\",\"tool3\":\"\'bold\', \'italic\', \'underline\'\",\"attachment\":\"\",\"image_reduce\":\"\",\"value\":\"\",\"width\":\"100%\",\"height\":\"400\",\"css\":\"\"},\"validate\":{\"required\":\"1\",\"pattern\":\"\",\"errortips\":\"\",\"xss\":\"1\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"\"}', 0);
INSERT INTO `dr_field` VALUES (23, '软件介绍', 'content', 'Ueditor', 3, 'module', 1, 0, 1, 1, 0, 1, '{\"option\":{\"down_img\":\"\",\"down_img_type\":\"\",\"watermark\":\"\",\"show_bottom_boot\":\"\",\"mini\":\"\",\"autofloat\":\"\",\"autoheight\":\"\",\"page\":\"\",\"mode\":\"1\",\"tool\":\"\'bold\', \'italic\', \'underline\'\",\"mode2\":\"1\",\"tool2\":\"\'bold\', \'italic\', \'underline\'\",\"mode3\":\"1\",\"tool3\":\"\'bold\', \'italic\', \'underline\'\",\"attachment\":\"\",\"image_reduce\":\"\",\"value\":\"\",\"width\":\"100%\",\"height\":\"400\",\"css\":\"\"},\"validate\":{\"required\":\"1\",\"pattern\":\"\",\"errortips\":\"\",\"xss\":\"1\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"\"}', 0);
INSERT INTO `dr_field` VALUES (28, '上传文件', 'file', 'File', 3, 'module', 1, 1, 0, 1, 0, 0, '{\"option\":{\"input\":\"1\",\"ext\":\"rar,zip,docx,jpg,gif,exe,php,html\",\"size\":\"100\",\"attachment\":\"\",\"image_reduce\":\"\",\"css\":\"\"},\"validate\":{\"required\":\"\",\"pattern\":\"\",\"errortips\":\"\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"\"}', 0);
INSERT INTO `dr_field` VALUES (29, '问题', 'title', 'Text', 4, 'module', 1, 1, 1, 1, 0, 0, '{\"option\":{\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\",\"value\":\"\",\"width\":\"400\",\"css\":\"\"},\"validate\":{\"required\":\"1\",\"pattern\":\"\",\"errortips\":\"\",\"xss\":\"1\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"onblur=\\\"check_title();get_keywords(\'keywords\');\\\"\"},\"is_right\":\"\"}', 0);
INSERT INTO `dr_field` VALUES (30, '缩略图', 'thumb', 'File', 4, 'module', 1, 1, 1, 1, 0, 1, '{\"option\":{\"ext\":\"jpg,gif,png\",\"size\":\"10\",\"attachment\":\"\",\"image_reduce\":\"\",\"css\":\"\"},\"validate\":{\"required\":\"\",\"pattern\":\"\",\"errortips\":\"\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"\"}', 0);
INSERT INTO `dr_field` VALUES (31, '关键字', 'keywords', 'Text', 4, 'module', 1, 1, 1, 1, 0, 1, '{\"option\":{\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\",\"value\":\"\",\"width\":\"400\",\"css\":\"\"},\"validate\":{\"required\":\"\",\"pattern\":\"\",\"errortips\":\"\",\"xss\":\"1\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\" data-role=\\\"tagsinput\\\"\"},\"is_right\":\"\"}', 0);
INSERT INTO `dr_field` VALUES (32, '答复', 'description', 'Textarea', 4, 'module', 1, 1, 1, 1, 0, 0, '{\"option\":{\"value\":\"\",\"width\":\"500\",\"height\":\"60\",\"css\":\"\"},\"validate\":{\"required\":\"\",\"pattern\":\"\",\"errortips\":\"\",\"xss\":\"1\",\"check\":\"\",\"filter\":\"dr_clearhtml\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"\"}', 0);
INSERT INTO `dr_field` VALUES (35, '您的电话', 'phone', 'Text', 1, 'form-1', 1, 1, 0, 1, 0, 0, '{\"option\":{\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\",\"value\":\"\",\"width\":\"\",\"css\":\"\"},\"validate\":{\"required\":\"1\",\"pattern\":\"\",\"errortips\":\"\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"\"}', 0);
INSERT INTO `dr_field` VALUES (36, '您的地址', 'address', 'Text', 1, 'form-1', 1, 1, 0, 1, 0, 0, '{\"option\":{\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\",\"value\":\"\",\"width\":\"\",\"css\":\"\"},\"validate\":{\"required\":\"1\",\"pattern\":\"\",\"errortips\":\"\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"\"}', 0);
INSERT INTO `dr_field` VALUES (37, '联系邮箱', 'email', 'Text', 1, 'form-1', 1, 1, 0, 1, 0, 0, '{\"option\":{\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\",\"value\":\"\",\"width\":\"\",\"css\":\"\"},\"validate\":{\"required\":\"1\",\"pattern\":\"\\/^[\\\\w\\\\-\\\\.]+@[\\\\w\\\\-\\\\.]+(\\\\.\\\\w+)+$\\/\",\"errortips\":\"请输入正确的邮箱\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"\"}', 0);
INSERT INTO `dr_field` VALUES (38, '留言内容', 'content', 'Textarea', 1, 'form-1', 1, 1, 0, 1, 0, 0, '{\"option\":{\"value\":\"\",\"width\":\"\",\"height\":\"\",\"css\":\"\"},\"validate\":{\"required\":\"1\",\"pattern\":\"\",\"errortips\":\"\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"\"}', 0);
INSERT INTO `dr_field` VALUES (39, '招聘名称', 'title', 'Text', 5, 'module', 1, 1, 1, 1, 0, 0, '{\"option\":{\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\",\"value\":\"\",\"width\":\"400\",\"css\":\"\"},\"validate\":{\"required\":\"1\",\"pattern\":\"\",\"errortips\":\"\",\"xss\":\"1\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"onblur=\\\"check_title();get_keywords(\'keywords\');\\\"\"},\"is_right\":\"\"}', 0);
INSERT INTO `dr_field` VALUES (40, '缩略图', 'thumb', 'File', 5, 'module', 1, 1, 1, 1, 0, 1, '{\"option\":{\"ext\":\"jpg,gif,png\",\"size\":\"10\",\"attachment\":\"\",\"image_reduce\":\"\",\"css\":\"\"},\"validate\":{\"required\":\"\",\"pattern\":\"\",\"errortips\":\"\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"\"}', 0);
INSERT INTO `dr_field` VALUES (41, '关键字', 'keywords', 'Text', 5, 'module', 1, 1, 1, 1, 0, 1, '{\"option\":{\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\",\"value\":\"\",\"width\":\"400\",\"css\":\"\"},\"validate\":{\"required\":\"\",\"pattern\":\"\",\"errortips\":\"\",\"xss\":\"1\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\" data-role=\\\"tagsinput\\\"\"},\"is_right\":\"\"}', 0);
INSERT INTO `dr_field` VALUES (42, '描述', 'description', 'Textarea', 5, 'module', 1, 1, 1, 1, 1, 0, '{\"option\":{\"width\":500,\"height\":60,\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\"},\"validate\":{\"xss\":1,\"filter\":\"dr_clearhtml\"}}', 0);
INSERT INTO `dr_field` VALUES (43, '内容', 'content', 'Ueditor', 5, 'module', 1, 0, 1, 1, 0, 1, '{\"option\":{\"down_img\":\"\",\"down_img_type\":\"\",\"watermark\":\"\",\"show_bottom_boot\":\"\",\"mini\":\"\",\"autofloat\":\"\",\"autoheight\":\"\",\"page\":\"\",\"mode\":\"1\",\"tool\":\"\'bold\', \'italic\', \'underline\'\",\"mode2\":\"1\",\"tool2\":\"\'bold\', \'italic\', \'underline\'\",\"mode3\":\"1\",\"tool3\":\"\'bold\', \'italic\', \'underline\'\",\"attachment\":\"\",\"image_reduce\":\"\",\"value\":\"\",\"width\":\"100%\",\"height\":\"400\",\"css\":\"\"},\"validate\":{\"required\":\"1\",\"pattern\":\"\",\"errortips\":\"\",\"xss\":\"1\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"\"}', 0);
INSERT INTO `dr_field` VALUES (44, '职位类型', 'type', 'Text', 5, 'module', 1, 1, 0, 1, 0, 0, '{\"option\":{\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\",\"value\":\"\",\"width\":\"\",\"css\":\"\"},\"validate\":{\"required\":\"\",\"pattern\":\"\",\"errortips\":\"\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"\"}', 0);
INSERT INTO `dr_field` VALUES (45, '工作经验', 'experience', 'Text', 5, 'module', 1, 1, 0, 1, 0, 0, '{\"option\":{\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\",\"value\":\"\",\"width\":\"\",\"css\":\"\"},\"validate\":{\"required\":\"\",\"pattern\":\"\",\"errortips\":\"\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"\"}', 0);
INSERT INTO `dr_field` VALUES (46, '学历要求', 'requirement', 'Text', 5, 'module', 1, 1, 0, 1, 0, 0, '{\"option\":{\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\",\"value\":\"\",\"width\":\"\",\"css\":\"\"},\"validate\":{\"required\":\"\",\"pattern\":\"\",\"errortips\":\"\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"\"}', 0);
INSERT INTO `dr_field` VALUES (47, '招聘人数', 'num', 'Text', 5, 'module', 1, 1, 0, 1, 0, 0, '{\"option\":{\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\",\"value\":\"\",\"width\":\"\",\"css\":\"\"},\"validate\":{\"required\":\"\",\"pattern\":\"\",\"errortips\":\"\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"\"}', 0);
INSERT INTO `dr_field` VALUES (48, '缩略图', 'thumb', 'File', 0, 'category-share', 1, 1, 1, 1, 1, 0, '{\"option\":{\"ext\":\"jpg,gif,png,jpeg\",\"size\":10,\"input\":1,\"attachment\":0}}', 0);
INSERT INTO `dr_field` VALUES (49, '栏目内容', 'content', 'Ueditor', 0, 'category-share', 1, 1, 1, 1, 1, 0, '{\"option\":{\"mode\":1,\"height\":300,\"width\":\"100%\",\"attachment\":0}}', 0);
INSERT INTO `dr_field` VALUES (79, '内容', 'content', 'Ueditor', 11, 'module', 1, 0, 1, 1, 1, 0, '{\"option\":{\"mode\":1,\"width\":\"100%\",\"height\":400},\"validate\":{\"xss\":1,\"required\":1}}', 0);
INSERT INTO `dr_field` VALUES (78, '描述', 'description', 'Textarea', 11, 'module', 1, 1, 1, 1, 1, 0, '{\"option\":{\"width\":500,\"height\":60,\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\"},\"validate\":{\"filter\":\"dr_clearhtml\"}}', 0);
INSERT INTO `dr_field` VALUES (76, '缩略图', 'thumb', 'File', 11, 'module', 1, 1, 1, 1, 1, 0, '{\"option\":{\"ext\":\"jpg,gif,png\",\"size\":10,\"width\":400,\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\"}}', 0);
INSERT INTO `dr_field` VALUES (77, '关键字', 'keywords', 'Text', 11, 'module', 1, 1, 1, 1, 1, 0, '{\"option\":{\"width\":400,\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\"},\"validate\":{\"formattr\":\" data-role=\\\"tagsinput\\\"\"}}', 0);
INSERT INTO `dr_field` VALUES (75, '主题', 'title', 'Text', 11, 'module', 1, 1, 1, 1, 1, 0, '{\"option\":{\"width\":400,\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\"},\"validate\":{\"required\":1,\"formattr\":\"onblur=\\\"check_title();get_keywords(\'keywords\');\\\"\"}}', 0);

-- ----------------------------
-- Table structure for dr_linkage
-- ----------------------------
DROP TABLE IF EXISTS `dr_linkage`;
CREATE TABLE `dr_linkage`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `type` tinyint(1) UNSIGNED NOT NULL,
  `code` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE,
  INDEX `module`(`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '联动菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dr_linkage
-- ----------------------------
INSERT INTO `dr_linkage` VALUES (1, '中国地区', 0, 'address');

-- ----------------------------
-- Table structure for dr_linkage_data_1
-- ----------------------------
DROP TABLE IF EXISTS `dr_linkage_data_1`;
CREATE TABLE `dr_linkage_data_1`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `site` mediumint(5) UNSIGNED NOT NULL COMMENT '站点id',
  `pid` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级id',
  `pids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所有上级id',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '栏目名称',
  `cname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '别名',
  `child` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否有下级',
  `hidden` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '前端隐藏',
  `childids` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '下级所有id',
  `displayorder` mediumint(8) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cname`(`cname`) USING BTREE,
  INDEX `hidden`(`hidden`) USING BTREE,
  INDEX `list`(`site`, `displayorder`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '联动菜单数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dr_linkage_data_1
-- ----------------------------
INSERT INTO `dr_linkage_data_1` VALUES (1, 1, 0, '0', '北京', 'bj', 0, 0, '1', 0);
INSERT INTO `dr_linkage_data_1` VALUES (2, 1, 0, '0', '成都', 'cd', 0, 0, '2', 0);

-- ----------------------------
-- Table structure for dr_mail_smtp
-- ----------------------------
DROP TABLE IF EXISTS `dr_mail_smtp`;
CREATE TABLE `dr_mail_smtp`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `host` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pass` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `port` mediumint(8) UNSIGNED NOT NULL,
  `displayorder` smallint(5) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `displayorder`(`displayorder`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '邮件账户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_member
-- ----------------------------
DROP TABLE IF EXISTS `dr_member`;
CREATE TABLE `dr_member`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '邮箱地址',
  `phone` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号码',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '加密密码',
  `salt` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '随机加密码',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `money` decimal(10, 2) UNSIGNED NOT NULL COMMENT 'RMB',
  `freeze` decimal(10, 2) UNSIGNED NOT NULL COMMENT '冻结RMB',
  `spend` decimal(10, 2) UNSIGNED NOT NULL COMMENT '消费RMB总额',
  `score` int(10) UNSIGNED NOT NULL COMMENT '虚拟币',
  `experience` int(10) UNSIGNED NOT NULL COMMENT '经验值',
  `regip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '注册ip',
  `regtime` int(10) UNSIGNED NOT NULL COMMENT '注册时间',
  `randcode` mediumint(6) UNSIGNED NOT NULL COMMENT '随机验证码',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `username`(`username`) USING BTREE,
  INDEX `email`(`email`) USING BTREE,
  INDEX `phone`(`phone`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dr_member
-- ----------------------------
INSERT INTO `dr_member` VALUES (1, 'admin@admin.com', '', 'admin', '60ca0c39b780707ad3a2bc53f72a693a', 'fccb60fb51', '创始人', 1000000.00, 0.00, 0.00, 1000000, 1000000, '', 1573117168, 0);

-- ----------------------------
-- Table structure for dr_member_data
-- ----------------------------
DROP TABLE IF EXISTS `dr_member_data`;
CREATE TABLE `dr_member_data`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `is_admin` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否是管理员',
  `is_lock` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '账号锁定标识',
  `is_auth` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '实名认证标识',
  `is_verify` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '审核标识',
  `is_mobile` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '手机认证标识',
  `is_avatar` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '头像上传标识',
  `is_complete` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '完善资料标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of dr_member_data
-- ----------------------------
INSERT INTO `dr_member_data` VALUES (1, 1, 0, 1, 1, 1, 0, 1);

-- ----------------------------
-- Table structure for dr_member_explog
-- ----------------------------
DROP TABLE IF EXISTS `dr_member_explog`;
CREATE TABLE `dr_member_explog`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号',
  `value` int(10) NOT NULL COMMENT '分数变化值',
  `mark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标记',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备注',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '相关地址',
  `inputtime` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `mark`(`mark`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '经验值流水日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_member_group
-- ----------------------------
DROP TABLE IF EXISTS `dr_member_group`;
CREATE TABLE `dr_member_group`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户组名称',
  `price` decimal(10, 2) NOT NULL COMMENT '售价',
  `unit` tinyint(1) UNSIGNED NOT NULL COMMENT '价格单位:1虚拟币，0金钱',
  `days` int(10) UNSIGNED NOT NULL COMMENT '生效天数',
  `apply` tinyint(1) UNSIGNED NOT NULL COMMENT '是否申请',
  `register` tinyint(1) UNSIGNED NOT NULL COMMENT '是否允许注册',
  `setting` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户组配置',
  `displayorder` smallint(5) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `displayorder`(`displayorder`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dr_member_group
-- ----------------------------
INSERT INTO `dr_member_group` VALUES (1, '注册用户', 0.00, 0, 0, 1, 1, '{\"level\":{\"auto\":\"0\",\"unit\":\"0\",\"price\":\"0\"},\"verify\":\"0\"}', 0);

-- ----------------------------
-- Table structure for dr_member_group_index
-- ----------------------------
DROP TABLE IF EXISTS `dr_member_group_index`;
CREATE TABLE `dr_member_group_index`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(10) UNSIGNED NOT NULL COMMENT '用户id',
  `gid` smallint(5) UNSIGNED NOT NULL COMMENT '用户组id',
  `lid` smallint(5) UNSIGNED NOT NULL COMMENT '用户组等级id',
  `stime` int(10) UNSIGNED NOT NULL COMMENT '开通时间',
  `etime` int(10) UNSIGNED NOT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `lid`(`lid`) USING BTREE,
  INDEX `gid`(`gid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户组归属表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of dr_member_group_index
-- ----------------------------
INSERT INTO `dr_member_group_index` VALUES (1, 1, 1, 0, 0, 0);

-- ----------------------------
-- Table structure for dr_member_group_verify
-- ----------------------------
DROP TABLE IF EXISTS `dr_member_group_verify`;
CREATE TABLE `dr_member_group_verify`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `gid` smallint(5) UNSIGNED NOT NULL COMMENT '用户组id',
  `lid` smallint(5) UNSIGNED NOT NULL COMMENT '用户组等级id',
  `status` tinyint(1) UNSIGNED NOT NULL COMMENT '状态',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '自定义字段信息',
  `inputtime` int(10) UNSIGNED NOT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '已费用',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户组申请审核' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_member_level
-- ----------------------------
DROP TABLE IF EXISTS `dr_member_level`;
CREATE TABLE `dr_member_level`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `gid` smallint(5) UNSIGNED NOT NULL COMMENT '用户id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `stars` tinyint(2) NOT NULL COMMENT '星星数量',
  `value` int(10) UNSIGNED NOT NULL COMMENT '升级值要求',
  `note` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备注',
  `apply` tinyint(1) UNSIGNED NOT NULL COMMENT '是否允许升级',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `value`(`value`) USING BTREE,
  INDEX `apply`(`apply`) USING BTREE,
  INDEX `gid`(`gid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户组级别表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_member_login
-- ----------------------------
DROP TABLE IF EXISTS `dr_member_login`;
CREATE TABLE `dr_member_login`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) UNSIGNED NULL DEFAULT NULL COMMENT '会员uid',
  `type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录方式',
  `loginip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录Ip',
  `logintime` int(10) UNSIGNED NOT NULL COMMENT '登录时间',
  `useragent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户端信息',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `loginip`(`loginip`) USING BTREE,
  INDEX `logintime`(`logintime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '登录日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_member_menu
-- ----------------------------
DROP TABLE IF EXISTS `dr_member_menu`;
CREATE TABLE `dr_member_menu`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` smallint(5) UNSIGNED NOT NULL COMMENT '上级菜单id',
  `name` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单语言名称',
  `uri` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'uri字符串',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '外链地址',
  `mark` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单标识',
  `hidden` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '是否隐藏',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标标示',
  `group` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户组划分',
  `site` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点划分',
  `displayorder` int(5) NULL DEFAULT NULL COMMENT '排序值',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `mark`(`mark`) USING BTREE,
  INDEX `hidden`(`hidden`) USING BTREE,
  INDEX `uri`(`uri`) USING BTREE,
  INDEX `displayorder`(`displayorder`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户组菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dr_member_menu
-- ----------------------------
INSERT INTO `dr_member_menu` VALUES (1, 0, '账号管理', '', '', 'user', 0, 'fa fa-user', '', '', 0);
INSERT INTO `dr_member_menu` VALUES (2, 1, '资料修改', 'account/index', '', '', 0, 'fa fa-cog', '', '', 0);
INSERT INTO `dr_member_menu` VALUES (3, 1, '头像设置', 'account/avatar', '', '', 0, 'fa fa-smile-o', '', '', 0);
INSERT INTO `dr_member_menu` VALUES (4, 1, '手机认证', 'account/mobile', '', '', 0, 'fa fa-mobile', '', '', 0);
INSERT INTO `dr_member_menu` VALUES (5, 1, '修改密码', 'account/password', '', '', 0, 'fa fa-expeditedssl', '', '', 0);
INSERT INTO `dr_member_menu` VALUES (6, 1, '账号绑定', 'account/oauth', '', '', 0, 'fa fa-qq', '', '', 0);
INSERT INTO `dr_member_menu` VALUES (7, 1, '登录记录', 'account/login', '', '', 0, 'fa fa-calendar', '', '', 0);
INSERT INTO `dr_member_menu` VALUES (8, 0, '财务管理', '', '', 'pay', 0, 'fa fa-rmb', '', '', 0);
INSERT INTO `dr_member_menu` VALUES (9, 8, '在线充值', 'recharge/index', '', '', 0, 'fa fa-rmb', '', '', 0);
INSERT INTO `dr_member_menu` VALUES (10, 8, '我的交易', 'paylog/index', '', '', 0, 'fa fa-calendar', '', '', 0);
INSERT INTO `dr_member_menu` VALUES (11, 8, '虚拟金币', 'scorelog/index', '', '', 0, 'fa fa-diamond', '', '', 0);
INSERT INTO `dr_member_menu` VALUES (12, 8, '提醒消息', 'notice/index', '', '', 0, 'fa fa-envelope', '', '', 0);
INSERT INTO `dr_member_menu` VALUES (13, 0, '内容管理', '', '', 'content-module', 0, 'fa fa-th-large', '', '', 0);
INSERT INTO `dr_member_menu` VALUES (14, 13, '我的评论', 'content/comment', '', '', 0, 'fa fa-comments', '', '', 0);
INSERT INTO `dr_member_menu` VALUES (15, 13, '文章管理', 'news/home/index', '', 'module-news', 0, 'fa fa-sticky-note', '', '', -1);
INSERT INTO `dr_member_menu` VALUES (16, 13, '图片管理', 'photo/home/index', '', 'module-photo', 0, 'fa fa-photo', '', '', -1);
INSERT INTO `dr_member_menu` VALUES (17, 13, '下载管理', 'down/home/index', '', 'module-down', 0, 'fa fa-download', '', '', -1);
INSERT INTO `dr_member_menu` VALUES (18, 13, '常见问题管理', 'question/home/index', '', 'module-question', 0, 'fa fa-question', '', '', -1);
INSERT INTO `dr_member_menu` VALUES (19, 13, '投诉及维修管理', 'form/complaint/index', '', 'form-complaint', 1, '', '', '', 0);
INSERT INTO `dr_member_menu` VALUES (20, 13, '人才招聘管理', 'join/home/index', '', 'module-join', 0, 'fa fa-user', '', '', -1);
INSERT INTO `dr_member_menu` VALUES (25, 13, '联系我们管理', 'lxwm/home/index', '', 'module-lxwm', 0, 'fa fa-align-justify', '', '', -1);

-- ----------------------------
-- Table structure for dr_member_notice
-- ----------------------------
DROP TABLE IF EXISTS `dr_member_notice`;
CREATE TABLE `dr_member_notice`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) UNSIGNED NOT NULL COMMENT '类型',
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '通知者uid',
  `isnew` tinyint(1) UNSIGNED NOT NULL COMMENT '新提醒',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知内容',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '相关地址',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '提交时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `isnew`(`isnew`) USING BTREE,
  INDEX `type`(`type`, `uid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员通知提醒表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_member_oauth
-- ----------------------------
DROP TABLE IF EXISTS `dr_member_oauth`;
CREATE TABLE `dr_member_oauth`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '会员uid',
  `oid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'OAuth返回id',
  `oauth` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '运营商',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '头像',
  `unionid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'unionId',
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '昵称',
  `expire_at` int(10) UNSIGNED NOT NULL COMMENT '绑定时间',
  `access_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保留',
  `refresh_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保留',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '快捷登录用户OAuth授权表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_member_paylog
-- ----------------------------
DROP TABLE IF EXISTS `dr_member_paylog`;
CREATE TABLE `dr_member_paylog`  (
  `id` bigint(18) UNSIGNED NOT NULL AUTO_INCREMENT,
  `site` int(10) NOT NULL COMMENT '站点',
  `mid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '支付标识',
  `uid` int(10) UNSIGNED NOT NULL COMMENT '付款人',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '付款账号',
  `touid` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '收款人',
  `tousername` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收款人账号',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '支付标题',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '相关链接',
  `value` decimal(10, 2) NOT NULL COMMENT '支付金额',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '支付方式',
  `status` tinyint(1) UNSIGNED NOT NULL COMMENT '支付状态',
  `result` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '支付结果',
  `paytime` int(10) UNSIGNED NOT NULL COMMENT '支付时间',
  `inputtime` int(10) UNSIGNED NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `touid`(`touid`) USING BTREE,
  INDEX `mid`(`mid`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `value`(`value`) USING BTREE,
  INDEX `paytime`(`paytime`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户支付记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_member_scorelog
-- ----------------------------
DROP TABLE IF EXISTS `dr_member_scorelog`;
CREATE TABLE `dr_member_scorelog`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号',
  `value` int(10) NOT NULL COMMENT '分数变化值',
  `mark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标记',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备注',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '相关地址',
  `inputtime` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `mark`(`mark`) USING BTREE,
  INDEX `inputtime`(`inputtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '金币流水日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_member_setting
-- ----------------------------
DROP TABLE IF EXISTS `dr_member_setting`;
CREATE TABLE `dr_member_setting`  (
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户属性参数表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dr_member_setting
-- ----------------------------
INSERT INTO `dr_member_setting` VALUES ('auth_site', '{\"1\":{\"category\":{\"1\":null,\"2\":null,\"3\":null,\"4\":null,\"5\":null,\"6\":null,\"7\":null,\"8\":null,\"9\":null,\"10\":null,\"11\":null,\"12\":null,\"13\":null,\"14\":null,\"15\":null,\"16\":null,\"17\":null,\"18\":null,\"19\":null,\"20\":null,\"21\":null,\"22\":null,\"23\":null,\"24\":null,\"25\":null,\"26\":null,\"27\":null,\"28\":null,\"29\":null,\"30\":null,\"31\":null,\"32\":null,\"33\":null,\"34\":null,\"35\":null,\"36\":null,\"37\":null,\"38\":null,\"39\":null},\"form\":{\"complaint\":{\"show\":[],\"add\":[],\"del\":[0],\"edit\":[0],\"code\":[0,\"1\"],\"verify\":[0,\"1\"],\"exp\":{\"1\":\"\"},\"score\":{\"1\":\"\"},\"day_post\":{\"1\":\"\"},\"total_post\":{\"1\":\"\"},\"test\":1}}}}');

-- ----------------------------
-- Table structure for dr_module
-- ----------------------------
DROP TABLE IF EXISTS `dr_module`;
CREATE TABLE `dr_module`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `site` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '站点划分',
  `dirname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '目录名称',
  `share` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '是否共享模块',
  `setting` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '配置信息',
  `comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '评论信息',
  `disabled` tinyint(1) NOT NULL DEFAULT 0 COMMENT '禁用？',
  `displayorder` smallint(5) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `dirname`(`dirname`) USING BTREE,
  INDEX `disabled`(`disabled`) USING BTREE,
  INDEX `displayorder`(`displayorder`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模块表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dr_module
-- ----------------------------
INSERT INTO `dr_module` VALUES (1, '{\"1\":{\"html\":0,\"theme\":\"default\",\"domain\":\"\",\"template\":\"default\"}}', 'news', 1, '{\"sync_category\":\"1\",\"order\":\"displayorder DESC,updatetime DESC\",\"verify_msg\":\"\",\"delete_msg\":\"\",\"list_field\":{\"title\":{\"use\":\"1\",\"name\":\"主题\",\"width\":\"\",\"func\":\"title\"},\"catid\":{\"use\":\"1\",\"name\":\"栏目\",\"width\":\"130\",\"func\":\"catid\"},\"author\":{\"use\":\"1\",\"name\":\"作者\",\"width\":\"120\",\"func\":\"author\"},\"updatetime\":{\"use\":\"1\",\"name\":\"更新时间\",\"width\":\"160\",\"func\":\"datetime\"}},\"comment_list_field\":{\"content\":{\"use\":\"1\",\"name\":\"评论\",\"width\":\"\",\"func\":\"comment\"},\"author\":{\"use\":\"1\",\"name\":\"作者\",\"width\":\"100\",\"func\":\"author\"},\"inputtime\":{\"use\":\"1\",\"name\":\"评论时间\",\"width\":\"160\",\"func\":\"datetime\"}},\"flag\":null,\"param\":null,\"search\":{\"use\":\"1\",\"field\":\"title,keywords\",\"total\":\"500\",\"length\":\"4\",\"param_join\":\"-\",\"param_rule\":\"0\",\"param_field\":\"\",\"param_join_field\":[\"\",\"\",\"\",\"\",\"\",\"\",\"\"],\"param_join_default_value\":\"0\"}}', '{\"use\":\"1\",\"num\":\"0\",\"my\":\"0\",\"reply\":\"0\",\"ct_reply\":\"0\",\"pagesize\":\"\",\"pagesize_mobile\":\"\",\"pagesize_api\":\"\",\"review\":{\"score\":\"10\",\"point\":\"0\",\"value\":{\"1\":{\"name\":\"1星评价\"},\"2\":{\"name\":\"2星评价\"},\"3\":{\"name\":\"3星评价\"},\"4\":{\"name\":\"4星评价\"},\"5\":{\"name\":\"5星评价\"}},\"option\":{\"1\":{\"name\":\"选项1\"},\"2\":{\"name\":\"选项2\"},\"3\":{\"name\":\"选项3\"},\"4\":{\"name\":\"选项4\"},\"5\":{\"name\":\"选项5\"},\"6\":{\"name\":\"选项6\"},\"7\":{\"name\":\"选项7\"},\"8\":{\"name\":\"选项8\"},\"9\":{\"name\":\"选项9\"}}}}', 0, 0);
INSERT INTO `dr_module` VALUES (2, '{\"1\":{\"html\":0,\"theme\":\"default\",\"domain\":\"\",\"template\":\"default\"}}', 'photo', 1, '{\"order\":\"displayorder DESC,updatetime DESC\",\"verify_msg\":\"\",\"delete_msg\":\"\",\"list_field\":{\"title\":{\"use\":\"1\",\"order\":\"1\",\"name\":\"主题\",\"width\":\"\",\"func\":\"title\"},\"catid\":{\"use\":\"1\",\"order\":\"2\",\"name\":\"栏目\",\"width\":\"130\",\"func\":\"catid\"},\"author\":{\"use\":\"1\",\"order\":\"3\",\"name\":\"作者\",\"width\":\"120\",\"func\":\"author\"},\"updatetime\":{\"use\":\"1\",\"order\":\"4\",\"name\":\"更新时间\",\"width\":\"160\",\"func\":\"datetime\"}},\"comment_list_field\":{\"content\":{\"use\":\"1\",\"order\":\"1\",\"name\":\"评论\",\"width\":\"\",\"func\":\"comment\"},\"author\":{\"use\":\"1\",\"order\":\"3\",\"name\":\"作者\",\"width\":\"100\",\"func\":\"author\"},\"inputtime\":{\"use\":\"1\",\"order\":\"4\",\"name\":\"评论时间\",\"width\":\"160\",\"func\":\"datetime\"}},\"flag\":null,\"param\":null,\"search\":{\"use\":\"1\",\"field\":\"title,keywords\",\"total\":\"500\",\"length\":\"4\",\"param_join\":\"-\",\"param_rule\":\"0\",\"param_field\":\"\",\"param_join_field\":[\"\",\"\",\"\",\"\",\"\",\"\",\"\"],\"param_join_default_value\":\"0\"}}', '{\"use\":\"1\",\"num\":\"0\",\"my\":\"0\",\"reply\":\"0\",\"ct_reply\":\"0\",\"pagesize\":\"\",\"pagesize_mobile\":\"\",\"pagesize_api\":\"\",\"review\":{\"score\":\"10\",\"point\":\"0\",\"value\":{\"1\":{\"name\":\"1星评价\"},\"2\":{\"name\":\"2星评价\"},\"3\":{\"name\":\"3星评价\"},\"4\":{\"name\":\"4星评价\"},\"5\":{\"name\":\"5星评价\"}},\"option\":{\"1\":{\"name\":\"选项1\"},\"2\":{\"name\":\"选项2\"},\"3\":{\"name\":\"选项3\"},\"4\":{\"name\":\"选项4\"},\"5\":{\"name\":\"选项5\"},\"6\":{\"name\":\"选项6\"},\"7\":{\"name\":\"选项7\"},\"8\":{\"name\":\"选项8\"},\"9\":{\"name\":\"选项9\"}}}}', 0, 0);
INSERT INTO `dr_module` VALUES (3, '{\"1\":{\"html\":0,\"theme\":\"default\",\"domain\":\"\",\"template\":\"default\"}}', 'down', 1, '{\"order\":\"displayorder DESC,updatetime DESC\",\"verify_msg\":\"\",\"delete_msg\":\"\",\"list_field\":{\"title\":{\"use\":\"1\",\"order\":\"1\",\"name\":\"主题\",\"width\":\"\",\"func\":\"title\"},\"catid\":{\"use\":\"1\",\"order\":\"2\",\"name\":\"栏目\",\"width\":\"120\",\"func\":\"catid\"},\"author\":{\"use\":\"1\",\"order\":\"3\",\"name\":\"作者\",\"width\":\"100\",\"func\":\"author\"},\"updatetime\":{\"use\":\"1\",\"order\":\"4\",\"name\":\"更新时间\",\"width\":\"160\",\"func\":\"datetime\"}},\"comment_list_field\":{\"content\":{\"use\":\"1\",\"order\":\"1\",\"name\":\"评论\",\"width\":\"\",\"func\":\"comment\"},\"author\":{\"use\":\"1\",\"order\":\"3\",\"name\":\"作者\",\"width\":\"100\",\"func\":\"author\"},\"inputtime\":{\"use\":\"1\",\"order\":\"4\",\"name\":\"评论时间\",\"width\":\"160\",\"func\":\"datetime\"}},\"flag\":null,\"param\":null,\"search\":{\"use\":\"1\",\"field\":\"title,keywords\",\"total\":\"500\",\"length\":\"4\",\"param_join\":\"-\",\"param_rule\":\"\",\"param_field\":\"\",\"param_join_field\":[\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"],\"param_join_default_value\":\"\"}}', '', 0, 0);
INSERT INTO `dr_module` VALUES (4, '{\"1\":{\"html\":0,\"theme\":\"default\",\"domain\":\"\",\"template\":\"default\"}}', 'question', 1, '{\"order\":\"displayorder DESC,updatetime DESC\",\"verify_msg\":\"\",\"delete_msg\":\"\",\"list_field\":{\"title\":{\"use\":\"1\",\"order\":\"1\",\"name\":\"主题\",\"width\":\"\",\"func\":\"title\"},\"catid\":{\"use\":\"1\",\"order\":\"2\",\"name\":\"栏目\",\"width\":\"130\",\"func\":\"catid\"},\"author\":{\"use\":\"1\",\"order\":\"3\",\"name\":\"作者\",\"width\":\"120\",\"func\":\"author\"},\"updatetime\":{\"use\":\"1\",\"order\":\"4\",\"name\":\"更新时间\",\"width\":\"160\",\"func\":\"datetime\"}},\"comment_list_field\":{\"content\":{\"use\":\"1\",\"order\":\"1\",\"name\":\"评论\",\"width\":\"\",\"func\":\"comment\"},\"author\":{\"use\":\"1\",\"order\":\"3\",\"name\":\"作者\",\"width\":\"100\",\"func\":\"author\"},\"inputtime\":{\"use\":\"1\",\"order\":\"4\",\"name\":\"评论时间\",\"width\":\"160\",\"func\":\"datetime\"}},\"flag\":null,\"param\":null,\"search\":{\"use\":\"1\",\"field\":\"title,keywords\",\"total\":\"500\",\"length\":\"4\",\"param_join\":\"-\",\"param_rule\":\"0\",\"param_field\":\"\",\"param_join_field\":[\"\",\"\",\"\",\"\",\"\",\"\",\"\"],\"param_join_default_value\":\"0\"}}', '{\"use\":\"1\",\"num\":\"0\",\"my\":\"0\",\"reply\":\"0\",\"ct_reply\":\"0\",\"pagesize\":\"\",\"pagesize_mobile\":\"\",\"pagesize_api\":\"\",\"review\":{\"score\":\"10\",\"point\":\"0\",\"value\":{\"1\":{\"name\":\"1星评价\"},\"2\":{\"name\":\"2星评价\"},\"3\":{\"name\":\"3星评价\"},\"4\":{\"name\":\"4星评价\"},\"5\":{\"name\":\"5星评价\"}},\"option\":{\"1\":{\"name\":\"选项1\"},\"2\":{\"name\":\"选项2\"},\"3\":{\"name\":\"选项3\"},\"4\":{\"name\":\"选项4\"},\"5\":{\"name\":\"选项5\"},\"6\":{\"name\":\"选项6\"},\"7\":{\"name\":\"选项7\"},\"8\":{\"name\":\"选项8\"},\"9\":{\"name\":\"选项9\"}}}}', 0, 0);
INSERT INTO `dr_module` VALUES (5, '{\"1\":{\"html\":0,\"theme\":\"default\",\"domain\":\"\",\"template\":\"default\"}}', 'join', 1, '{\"order\":\"displayorder DESC,updatetime DESC\",\"verify_msg\":\"\",\"delete_msg\":\"\",\"list_field\":{\"title\":{\"use\":\"1\",\"order\":\"1\",\"name\":\"主题\",\"width\":\"\",\"func\":\"title\"},\"catid\":{\"use\":\"1\",\"order\":\"2\",\"name\":\"栏目\",\"width\":\"130\",\"func\":\"catid\"},\"author\":{\"use\":\"1\",\"order\":\"3\",\"name\":\"作者\",\"width\":\"120\",\"func\":\"author\"},\"updatetime\":{\"use\":\"1\",\"order\":\"4\",\"name\":\"更新时间\",\"width\":\"160\",\"func\":\"datetime\"}},\"comment_list_field\":{\"content\":{\"use\":\"1\",\"order\":\"1\",\"name\":\"评论\",\"width\":\"\",\"func\":\"comment\"},\"author\":{\"use\":\"1\",\"order\":\"3\",\"name\":\"作者\",\"width\":\"100\",\"func\":\"author\"},\"inputtime\":{\"use\":\"1\",\"order\":\"4\",\"name\":\"评论时间\",\"width\":\"160\",\"func\":\"datetime\"}},\"flag\":null,\"param\":null,\"search\":{\"use\":\"1\",\"field\":\"title,keywords\",\"total\":\"500\",\"length\":\"4\",\"param_join\":\"-\",\"param_rule\":\"0\",\"param_field\":\"\",\"param_join_field\":[\"\",\"\",\"\",\"\",\"\",\"\",\"\"],\"param_join_default_value\":\"0\"}}', '{\"use\":\"1\",\"num\":\"0\",\"my\":\"0\",\"reply\":\"0\",\"ct_reply\":\"0\",\"pagesize\":\"\",\"pagesize_mobile\":\"\",\"pagesize_api\":\"\",\"review\":{\"score\":\"10\",\"point\":\"0\",\"value\":{\"1\":{\"name\":\"1星评价\"},\"2\":{\"name\":\"2星评价\"},\"3\":{\"name\":\"3星评价\"},\"4\":{\"name\":\"4星评价\"},\"5\":{\"name\":\"5星评价\"}},\"option\":{\"1\":{\"name\":\"选项1\"},\"2\":{\"name\":\"选项2\"},\"3\":{\"name\":\"选项3\"},\"4\":{\"name\":\"选项4\"},\"5\":{\"name\":\"选项5\"},\"6\":{\"name\":\"选项6\"},\"7\":{\"name\":\"选项7\"},\"8\":{\"name\":\"选项8\"},\"9\":{\"name\":\"选项9\"}}}}', 0, 0);
INSERT INTO `dr_module` VALUES (11, '{\"1\":{\"html\":0,\"theme\":\"default\",\"domain\":\"\",\"template\":\"default\"}}', 'lxwm', 1, '{\"order\":\"displayorder DESC,updatetime DESC\",\"verify_msg\":\"\",\"delete_msg\":\"\",\"list_field\":{\"title\":{\"use\":\"1\",\"order\":\"1\",\"name\":\"主题\",\"width\":\"\",\"func\":\"title\"},\"catid\":{\"use\":\"1\",\"order\":\"2\",\"name\":\"栏目\",\"width\":\"130\",\"func\":\"catid\"},\"author\":{\"use\":\"1\",\"order\":\"3\",\"name\":\"作者\",\"width\":\"120\",\"func\":\"author\"},\"updatetime\":{\"use\":\"1\",\"order\":\"4\",\"name\":\"更新时间\",\"width\":\"160\",\"func\":\"datetime\"}},\"comment_list_field\":{\"content\":{\"use\":\"1\",\"order\":\"1\",\"name\":\"评论\",\"width\":\"\",\"func\":\"comment\"},\"author\":{\"use\":\"1\",\"order\":\"3\",\"name\":\"作者\",\"width\":\"100\",\"func\":\"author\"},\"inputtime\":{\"use\":\"1\",\"order\":\"4\",\"name\":\"评论时间\",\"width\":\"160\",\"func\":\"datetime\"}},\"flag\":null,\"param\":null,\"search\":{\"use\":\"1\",\"field\":\"title,keywords\",\"total\":\"500\",\"length\":\"4\",\"param_join\":\"-\",\"param_rule\":\"0\",\"param_field\":\"\",\"param_join_field\":[\"\",\"\",\"\",\"\",\"\",\"\",\"\"],\"param_join_default_value\":\"0\"}}', '{\"use\":\"1\",\"num\":\"0\",\"my\":\"0\",\"reply\":\"0\",\"ct_reply\":\"0\",\"pagesize\":\"\",\"pagesize_mobile\":\"\",\"pagesize_api\":\"\",\"review\":{\"score\":\"10\",\"point\":\"0\",\"value\":{\"1\":{\"name\":\"1星评价\"},\"2\":{\"name\":\"2星评价\"},\"3\":{\"name\":\"3星评价\"},\"4\":{\"name\":\"4星评价\"},\"5\":{\"name\":\"5星评价\"}},\"option\":{\"1\":{\"name\":\"选项1\"},\"2\":{\"name\":\"选项2\"},\"3\":{\"name\":\"选项3\"},\"4\":{\"name\":\"选项4\"},\"5\":{\"name\":\"选项5\"},\"6\":{\"name\":\"选项6\"},\"7\":{\"name\":\"选项7\"},\"8\":{\"name\":\"选项8\"},\"9\":{\"name\":\"选项9\"}}}}', 0, 0);

-- ----------------------------
-- Table structure for dr_module_form
-- ----------------------------
DROP TABLE IF EXISTS `dr_module_form`;
CREATE TABLE `dr_module_form`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单名称',
  `table` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单表名称',
  `module` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模块目录',
  `disabled` tinyint(1) UNSIGNED NOT NULL COMMENT '是否禁用',
  `setting` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单配置',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `table`(`table`) USING BTREE,
  INDEX `disabled`(`disabled`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模块表单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_site
-- ----------------------------
DROP TABLE IF EXISTS `dr_site`;
CREATE TABLE `dr_site`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点名称',
  `domain` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点域名',
  `setting` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点配置',
  `disabled` tinyint(1) NOT NULL DEFAULT 0 COMMENT '禁用？',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `disabled`(`disabled`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '站点表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dr_site
-- ----------------------------
INSERT INTO `dr_site` VALUES (1, '响应式大型企业集团类网站', '10.50.0.40', '{\"webpath\":null,\"config\":{\"SITE_CLOSE\":\"\",\"SITE_CLOSE_MSG\":\"网站升级中....\",\"logo\":\"25\",\"SITE_NAME\":\"响应式大型企业集团类网站\",\"SITE_ICP\":\"ICP备案号\",\"SITE_TONGJI\":\"统计\",\"SITE_LANGUAGE\":\"zh-cn\",\"SITE_TIME_FORMAT\":\"Y-m-d\",\"SITE_THEME\":\"new\",\"SITE_TEMPLATE\":\"new_templates\",\"SITE_TIMEZONE\":\"8\",\"SITE_DOMAIN\":\"www.qiyegw122.org\",\"SITE_DOMAINS\":\"\"}}', 0);

-- ----------------------------
-- Table structure for dr_urlrule
-- ----------------------------
DROP TABLE IF EXISTS `dr_urlrule`;
CREATE TABLE `dr_urlrule`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) UNSIGNED NOT NULL COMMENT '规则类型',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规则名称',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细规则',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type`(`type`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'URL规则表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dr_urlrule
-- ----------------------------
INSERT INTO `dr_urlrule` VALUES (1, 3, '共享栏目测试规则', '{\"list\":\"list-{dirname}.html\",\"list_page\":\"list-{dirname}-{page}.html\",\"show\":\"show-{id}.html\",\"show_page\":\"show-{id}-{page}.html\",\"catjoin\":\"\\/\"}');
INSERT INTO `dr_urlrule` VALUES (2, 2, '共享模块测试规则', '{\"search\":\"{modname}\\/search.html\",\"search_page\":\"{modname}\\/search\\/{param}.html\",\"catjoin\":\"\\/\"}');
INSERT INTO `dr_urlrule` VALUES (3, 1, '独立模块测试规则', '{\"module\":\"{modname}.html\",\"list\":\"{modname}\\/list\\/{id}.html\",\"list_page\":\"{modname}\\/list\\/{id}\\/{page}.html\",\"show\":\"{modname}\\/show\\/{id}.html\",\"show_page\":\"{modname}\\/show\\/{id}\\/{page}.html\",\"search\":\"{modname}\\/search.html\",\"search_page\":\"{modname}\\/search\\/{param}.html\",\"catjoin\":\"\\/\"}');

SET FOREIGN_KEY_CHECKS = 1;
