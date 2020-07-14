/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50728
Source Host           : localhost:3306
Source Database       : qiyegw_db

Target Server Type    : MYSQL
Target Server Version : 50728
File Encoding         : 65001

Date: 2019-11-15 14:08:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dr_1_block
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_block`;
CREATE TABLE `dr_1_block` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '名称',
  `code` varchar(100) NOT NULL COMMENT '别名',
  `content` text NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`),
  KEY `code` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='资料块表';

-- ----------------------------
-- Records of dr_1_block
-- ----------------------------
INSERT INTO `dr_1_block` VALUES ('1', '集团全称', 'jtqc', '{i-0}:某某集团有限公司');
INSERT INTO `dr_1_block` VALUES ('2', '电话', 'phone', '{i-0}:000-88888888');
INSERT INTO `dr_1_block` VALUES ('3', '简历投递邮箱', 'email', '{i-0}:admin@admin.com');
INSERT INTO `dr_1_block` VALUES ('4', '地址', 'address', '{i-0}:北京市天桥区****************');
INSERT INTO `dr_1_block` VALUES ('5', '电话', 'tel', '{i-0}:000-88888888');
INSERT INTO `dr_1_block` VALUES ('6', '百度地图ip', 'bd-ip', '{i-0}:116.516952,39.994247');
INSERT INTO `dr_1_block` VALUES ('7', '微信号', 'weixin', '{i-0}:wx123456');
INSERT INTO `dr_1_block` VALUES ('8', '图片模块背景图片', 'photo_pic', '{i-3}:19');
INSERT INTO `dr_1_block` VALUES ('9', '新闻模块背景图片	', 'news_pic', '{i-3}:20');
INSERT INTO `dr_1_block` VALUES ('10', '单页模块背景图片', 'page_pic', '{i-3}:21');
INSERT INTO `dr_1_block` VALUES ('11', '下载模块背景图片	', 'down_pic', '{i-3}:22');
INSERT INTO `dr_1_block` VALUES ('12', '常见问题模块背景图片', 'question_pic', '{i-3}:23');
INSERT INTO `dr_1_block` VALUES ('13', '人才招聘模块背景图片', 'join_pic', '{i-3}:24');

-- ----------------------------
-- Table structure for dr_1_down
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_down`;
CREATE TABLE `dr_1_down` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `title` varchar(255) DEFAULT NULL COMMENT '主题',
  `thumb` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` text COMMENT '描述',
  `hits` int(10) unsigned DEFAULT NULL COMMENT '浏览数',
  `uid` int(10) unsigned NOT NULL COMMENT '作者id',
  `author` varchar(50) NOT NULL COMMENT '作者名称',
  `status` tinyint(2) NOT NULL COMMENT '状态',
  `url` varchar(255) DEFAULT NULL COMMENT '地址',
  `link_id` int(10) NOT NULL DEFAULT '0' COMMENT '同步id',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '附表id',
  `inputip` varchar(15) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `updatetime` int(10) unsigned NOT NULL COMMENT '更新时间',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数量',
  `avgsort` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '平均点评分数',
  `displayorder` int(10) DEFAULT '0' COMMENT '排序值',
  `file` varchar(255) DEFAULT NULL COMMENT '上传文件',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`,`updatetime`),
  KEY `link_id` (`link_id`),
  KEY `comments` (`comments`),
  KEY `avgsort` (`avgsort`),
  KEY `status` (`status`),
  KEY `updatetime` (`updatetime`),
  KEY `hits` (`hits`),
  KEY `displayorder` (`displayorder`,`updatetime`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='内容主表';

-- ----------------------------
-- Records of dr_1_down
-- ----------------------------
INSERT INTO `dr_1_down` VALUES ('37', '18', '帮助文档一', '', '', '1', '1', '1', 'admin', '9', '/index.php?c=show&id=37', '0', '0', '127.0.0.1', '1573204150', '1573205306', '0', '0.00', '0', '9');
INSERT INTO `dr_1_down` VALUES ('38', '18', '帮助文档二', '', '', '', '1', '1', 'admin', '9', '/index.php?c=show&id=38', '0', '0', '127.0.0.1', '1573205493', '1573205506', '0', '0.00', '0', '9');
INSERT INTO `dr_1_down` VALUES ('39', '18', '帮助文档三', '', '', '', '1', '1', 'admin', '9', '/index.php?c=show&id=39', '0', '0', '127.0.0.1', '1573205508', '1573205530', '0', '0.00', '0', '9');
INSERT INTO `dr_1_down` VALUES ('40', '18', '帮助文档四', '', '', '', '1', '1', 'admin', '9', '/index.php?c=show&id=40', '0', '0', '127.0.0.1', '1573205533', '1573205541', '0', '0.00', '0', '9');

-- ----------------------------
-- Table structure for dr_1_down_category
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_down_category`;
CREATE TABLE `dr_1_down_category` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `pid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `pids` varchar(255) NOT NULL COMMENT '所有上级id',
  `name` varchar(30) NOT NULL COMMENT '栏目名称',
  `dirname` varchar(30) NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(100) NOT NULL COMMENT '上级目录',
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有下级',
  `childids` text NOT NULL COMMENT '下级所有id',
  `thumb` varchar(255) NOT NULL COMMENT '栏目图片',
  `show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `setting` text NOT NULL COMMENT '属性配置',
  `displayorder` mediumint(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `show` (`show`),
  KEY `module` (`pid`,`displayorder`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目表';

-- ----------------------------
-- Records of dr_1_down_category
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_down_category_data
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_down_category_data`;
CREATE TABLE `dr_1_down_category_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` int(3) unsigned NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目模型表';

-- ----------------------------
-- Records of dr_1_down_category_data
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_down_category_data_0
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_down_category_data_0`;
CREATE TABLE `dr_1_down_category_data_0` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目模型表的附表';

-- ----------------------------
-- Records of dr_1_down_category_data_0
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_down_comment
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_down_comment`;
CREATE TABLE `dr_1_down_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `cid` int(10) unsigned NOT NULL COMMENT '关联id',
  `cuid` int(10) unsigned NOT NULL COMMENT '关联uid',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `orderid` bigint(18) unsigned NOT NULL COMMENT '订单id',
  `uid` mediumint(8) unsigned DEFAULT '0' COMMENT '评论者ID',
  `author` varchar(250) DEFAULT NULL COMMENT '评论者账号',
  `content` text COMMENT '评论内容',
  `support` int(10) unsigned DEFAULT '0' COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT '0' COMMENT '反对数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '平均分',
  `sort1` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort2` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort3` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort4` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort5` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort6` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort7` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort8` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort9` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `reply` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '回复id',
  `in_reply` tinyint(1) unsigned DEFAULT '0' COMMENT '是否存在回复',
  `status` smallint(1) unsigned DEFAULT '0' COMMENT '审核状态',
  `inputip` varchar(50) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `catid` (`catid`),
  KEY `orderid` (`orderid`),
  KEY `reply` (`reply`),
  KEY `support` (`support`),
  KEY `oppose` (`oppose`),
  KEY `avgsort` (`avgsort`),
  KEY `status` (`status`),
  KEY `aa` (`cid`,`status`,`inputtime`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论内容表';

-- ----------------------------
-- Records of dr_1_down_comment
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_down_comment_index
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_down_comment_index`;
CREATE TABLE `dr_1_down_comment_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `support` int(10) unsigned DEFAULT '0' COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT '0' COMMENT '反对数',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '平均分',
  `sort1` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort2` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort3` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort4` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort5` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort6` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort7` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort8` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort9` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `tableid` smallint(5) unsigned DEFAULT '0' COMMENT '附表id',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `catid` (`catid`),
  KEY `support` (`support`),
  KEY `oppose` (`oppose`),
  KEY `comments` (`comments`),
  KEY `avgsort` (`avgsort`),
  KEY `tableid` (`tableid`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='评论索引表';

-- ----------------------------
-- Records of dr_1_down_comment_index
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_down_data_0
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_down_data_0`;
CREATE TABLE `dr_1_down_data_0` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext COMMENT '内容',
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容附表';

-- ----------------------------
-- Records of dr_1_down_data_0
-- ----------------------------
INSERT INTO `dr_1_down_data_0` VALUES ('37', '1', '18', '&lt;p&gt;1&lt;/p&gt;');
INSERT INTO `dr_1_down_data_0` VALUES ('38', '1', '18', null);
INSERT INTO `dr_1_down_data_0` VALUES ('39', '1', '18', null);
INSERT INTO `dr_1_down_data_0` VALUES ('40', '1', '18', null);

-- ----------------------------
-- Table structure for dr_1_down_draft
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_down_draft`;
CREATE TABLE `dr_1_down_draft` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `catid` (`catid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容草稿表';

-- ----------------------------
-- Records of dr_1_down_draft
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_down_flag
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_down_flag`;
CREATE TABLE `dr_1_down_flag` (
  `flag` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '文档标记id',
  `id` int(10) unsigned NOT NULL COMMENT '文档内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  KEY `flag` (`flag`,`id`,`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='标记表';

-- ----------------------------
-- Records of dr_1_down_flag
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_down_hits
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_down_hits`;
CREATE TABLE `dr_1_down_hits` (
  `id` int(10) unsigned NOT NULL COMMENT '文章id',
  `hits` int(10) unsigned NOT NULL COMMENT '总点击数',
  `day_hits` int(10) unsigned NOT NULL COMMENT '本日点击',
  `week_hits` int(10) unsigned NOT NULL COMMENT '本周点击',
  `month_hits` int(10) unsigned NOT NULL COMMENT '本月点击',
  `year_hits` int(10) unsigned NOT NULL COMMENT '年点击量',
  UNIQUE KEY `id` (`id`),
  KEY `day_hits` (`day_hits`),
  KEY `week_hits` (`week_hits`),
  KEY `month_hits` (`month_hits`),
  KEY `year_hits` (`year_hits`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='时段点击量统计';

-- ----------------------------
-- Records of dr_1_down_hits
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_down_index
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_down_index`;
CREATE TABLE `dr_1_down_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='内容索引表';

-- ----------------------------
-- Records of dr_1_down_index
-- ----------------------------
INSERT INTO `dr_1_down_index` VALUES ('37', '1', '18', '9', '1573204150');
INSERT INTO `dr_1_down_index` VALUES ('38', '1', '18', '9', '1573205493');
INSERT INTO `dr_1_down_index` VALUES ('39', '1', '18', '9', '1573205508');
INSERT INTO `dr_1_down_index` VALUES ('40', '1', '18', '9', '1573205533');

-- ----------------------------
-- Table structure for dr_1_down_recycle
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_down_recycle`;
CREATE TABLE `dr_1_down_recycle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `result` text NOT NULL COMMENT '删除理由',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `catid` (`catid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容回收站表';

-- ----------------------------
-- Records of dr_1_down_recycle
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_down_search
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_down_search`;
CREATE TABLE `dr_1_down_search` (
  `id` varchar(32) NOT NULL,
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `params` text NOT NULL COMMENT '参数数组',
  `keyword` varchar(255) NOT NULL COMMENT '关键字',
  `contentid` mediumtext NOT NULL COMMENT 'id集合',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `catid` (`catid`),
  KEY `keyword` (`keyword`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='搜索表';

-- ----------------------------
-- Records of dr_1_down_search
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_down_time
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_down_time`;
CREATE TABLE `dr_1_down_time` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `result` text NOT NULL COMMENT '处理结果',
  `posttime` int(10) unsigned NOT NULL COMMENT '定时发布时间',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `posttime` (`posttime`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容定时发布表';

-- ----------------------------
-- Records of dr_1_down_time
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_down_verify
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_down_verify`;
CREATE TABLE `dr_1_down_verify` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `isnew` tinyint(1) unsigned NOT NULL COMMENT '是否新增',
  `author` varchar(50) NOT NULL COMMENT '作者',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `backuid` mediumint(8) unsigned NOT NULL COMMENT '操作人uid',
  `backinfo` text NOT NULL COMMENT '操作退回信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`),
  KEY `backuid` (`backuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容审核表';

-- ----------------------------
-- Records of dr_1_down_verify
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_form
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_form`;
CREATE TABLE `dr_1_form` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '名称',
  `table` varchar(50) NOT NULL COMMENT '表名',
  `setting` text COMMENT '配置信息',
  PRIMARY KEY (`id`),
  UNIQUE KEY `table` (`table`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='表单模型表';

-- ----------------------------
-- Records of dr_1_form
-- ----------------------------
INSERT INTO `dr_1_form` VALUES ('1', '投诉及维修', 'complaint', '');

-- ----------------------------
-- Table structure for dr_1_form_complaint
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_form_complaint`;
CREATE TABLE `dr_1_form_complaint` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned DEFAULT '0' COMMENT '录入者uid',
  `author` varchar(100) DEFAULT NULL COMMENT '录入者账号',
  `title` varchar(255) DEFAULT NULL COMMENT '主题',
  `inputip` varchar(50) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态值',
  `displayorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序值',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '附表id',
  `phone` varchar(255) DEFAULT NULL COMMENT '您的电话',
  `address` varchar(255) DEFAULT NULL COMMENT '您的地址',
  `email` varchar(255) DEFAULT NULL COMMENT '联系邮箱',
  `content` text COMMENT '留言内容',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`),
  KEY `displayorder` (`displayorder`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='投诉及维修表单表';

-- ----------------------------
-- Records of dr_1_form_complaint
-- ----------------------------
INSERT INTO `dr_1_form_complaint` VALUES ('1', '1', 'admin', '昵称', '127.0.0.1', '1573366884', '0', '0', '0', '1515151515', '1515151111111111111111', '111111111111111@q.com', '内容内容内容内容内容内容内容内容内容内容');
INSERT INTO `dr_1_form_complaint` VALUES ('2', '1', 'admin', '昵称', '127.0.0.1', '1573367164', '0', '0', '0', '1515151515', '1515151111111111111111', '111111111111111@q.com', '内容内容内容内容内容内容内容内容内容内容');
INSERT INTO `dr_1_form_complaint` VALUES ('3', '1', 'admin', '11111111111', '127.0.0.1', '1573783060', '0', '0', '0', '2222222222222', '333333333333333', '34444444444444@qq.com', '4445555555555555');

-- ----------------------------
-- Table structure for dr_1_form_complaint_data_0
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_form_complaint_data_0`;
CREATE TABLE `dr_1_form_complaint_data_0` (
  `id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned DEFAULT '0' COMMENT '录入者uid',
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='投诉及维修表单附表';

-- ----------------------------
-- Records of dr_1_form_complaint_data_0
-- ----------------------------
INSERT INTO `dr_1_form_complaint_data_0` VALUES ('1', '1');
INSERT INTO `dr_1_form_complaint_data_0` VALUES ('2', '1');
INSERT INTO `dr_1_form_complaint_data_0` VALUES ('3', '1');

-- ----------------------------
-- Table structure for dr_1_join
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_join`;
CREATE TABLE `dr_1_join` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `title` varchar(255) DEFAULT NULL COMMENT '主题',
  `thumb` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` text COMMENT '描述',
  `hits` int(10) unsigned DEFAULT NULL COMMENT '浏览数',
  `uid` int(10) unsigned NOT NULL COMMENT '作者id',
  `author` varchar(50) NOT NULL COMMENT '作者名称',
  `status` tinyint(2) NOT NULL COMMENT '状态',
  `url` varchar(255) DEFAULT NULL COMMENT '地址',
  `link_id` int(10) NOT NULL DEFAULT '0' COMMENT '同步id',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '附表id',
  `inputip` varchar(15) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `updatetime` int(10) unsigned NOT NULL COMMENT '更新时间',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数量',
  `avgsort` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '平均点评分数',
  `displayorder` int(10) DEFAULT '0' COMMENT '排序值',
  `type` varchar(255) DEFAULT NULL COMMENT '职位类型',
  `experience` varchar(255) DEFAULT NULL COMMENT '工作经验',
  `requirement` varchar(255) DEFAULT NULL COMMENT '学历要求',
  `num` varchar(255) DEFAULT NULL COMMENT '招聘人数',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`,`updatetime`),
  KEY `link_id` (`link_id`),
  KEY `comments` (`comments`),
  KEY `avgsort` (`avgsort`),
  KEY `status` (`status`),
  KEY `updatetime` (`updatetime`),
  KEY `hits` (`hits`),
  KEY `displayorder` (`displayorder`,`updatetime`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='内容主表';

-- ----------------------------
-- Records of dr_1_join
-- ----------------------------
INSERT INTO `dr_1_join` VALUES ('46', '35', '网站美工', null, '', '本公司即将设立上海办事处，招聘华东区销售经理一名，负责拓展华东地区业务。', '1', '1', 'admin', '9', '/index.php?c=show&id=46', '0', '0', '127.0.0.1', '1573371151', '1573371201', '0', '0.00', '0', '全职', '3年以上', '本科', '5');

-- ----------------------------
-- Table structure for dr_1_join_category
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_join_category`;
CREATE TABLE `dr_1_join_category` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `pid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `pids` varchar(255) NOT NULL COMMENT '所有上级id',
  `name` varchar(30) NOT NULL COMMENT '栏目名称',
  `dirname` varchar(30) NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(100) NOT NULL COMMENT '上级目录',
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有下级',
  `childids` text NOT NULL COMMENT '下级所有id',
  `thumb` varchar(255) NOT NULL COMMENT '栏目图片',
  `show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `setting` text NOT NULL COMMENT '属性配置',
  `displayorder` mediumint(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `show` (`show`),
  KEY `module` (`pid`,`displayorder`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目表';

-- ----------------------------
-- Records of dr_1_join_category
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_join_category_data
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_join_category_data`;
CREATE TABLE `dr_1_join_category_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` int(3) unsigned NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目模型表';

-- ----------------------------
-- Records of dr_1_join_category_data
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_join_category_data_0
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_join_category_data_0`;
CREATE TABLE `dr_1_join_category_data_0` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目模型表的附表';

-- ----------------------------
-- Records of dr_1_join_category_data_0
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_join_comment
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_join_comment`;
CREATE TABLE `dr_1_join_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `cid` int(10) unsigned NOT NULL COMMENT '关联id',
  `cuid` int(10) unsigned NOT NULL COMMENT '关联uid',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `orderid` bigint(18) unsigned NOT NULL COMMENT '订单id',
  `uid` mediumint(8) unsigned DEFAULT '0' COMMENT '评论者ID',
  `author` varchar(250) DEFAULT NULL COMMENT '评论者账号',
  `content` text COMMENT '评论内容',
  `support` int(10) unsigned DEFAULT '0' COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT '0' COMMENT '反对数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '平均分',
  `sort1` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort2` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort3` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort4` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort5` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort6` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort7` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort8` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort9` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `reply` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '回复id',
  `in_reply` tinyint(1) unsigned DEFAULT '0' COMMENT '是否存在回复',
  `status` smallint(1) unsigned DEFAULT '0' COMMENT '审核状态',
  `inputip` varchar(50) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `catid` (`catid`),
  KEY `orderid` (`orderid`),
  KEY `reply` (`reply`),
  KEY `support` (`support`),
  KEY `oppose` (`oppose`),
  KEY `avgsort` (`avgsort`),
  KEY `status` (`status`),
  KEY `aa` (`cid`,`status`,`inputtime`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论内容表';

-- ----------------------------
-- Records of dr_1_join_comment
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_join_comment_index
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_join_comment_index`;
CREATE TABLE `dr_1_join_comment_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `support` int(10) unsigned DEFAULT '0' COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT '0' COMMENT '反对数',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '平均分',
  `sort1` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort2` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort3` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort4` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort5` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort6` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort7` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort8` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort9` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `tableid` smallint(5) unsigned DEFAULT '0' COMMENT '附表id',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `catid` (`catid`),
  KEY `support` (`support`),
  KEY `oppose` (`oppose`),
  KEY `comments` (`comments`),
  KEY `avgsort` (`avgsort`),
  KEY `tableid` (`tableid`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='评论索引表';

-- ----------------------------
-- Records of dr_1_join_comment_index
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_join_data_0
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_join_data_0`;
CREATE TABLE `dr_1_join_data_0` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext COMMENT '内容',
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容附表';

-- ----------------------------
-- Records of dr_1_join_data_0
-- ----------------------------
INSERT INTO `dr_1_join_data_0` VALUES ('46', '1', '35', null);

-- ----------------------------
-- Table structure for dr_1_join_draft
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_join_draft`;
CREATE TABLE `dr_1_join_draft` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `catid` (`catid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容草稿表';

-- ----------------------------
-- Records of dr_1_join_draft
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_join_flag
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_join_flag`;
CREATE TABLE `dr_1_join_flag` (
  `flag` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '文档标记id',
  `id` int(10) unsigned NOT NULL COMMENT '文档内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  KEY `flag` (`flag`,`id`,`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='标记表';

-- ----------------------------
-- Records of dr_1_join_flag
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_join_hits
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_join_hits`;
CREATE TABLE `dr_1_join_hits` (
  `id` int(10) unsigned NOT NULL COMMENT '文章id',
  `hits` int(10) unsigned NOT NULL COMMENT '总点击数',
  `day_hits` int(10) unsigned NOT NULL COMMENT '本日点击',
  `week_hits` int(10) unsigned NOT NULL COMMENT '本周点击',
  `month_hits` int(10) unsigned NOT NULL COMMENT '本月点击',
  `year_hits` int(10) unsigned NOT NULL COMMENT '年点击量',
  UNIQUE KEY `id` (`id`),
  KEY `day_hits` (`day_hits`),
  KEY `week_hits` (`week_hits`),
  KEY `month_hits` (`month_hits`),
  KEY `year_hits` (`year_hits`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='时段点击量统计';

-- ----------------------------
-- Records of dr_1_join_hits
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_join_index
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_join_index`;
CREATE TABLE `dr_1_join_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='内容索引表';

-- ----------------------------
-- Records of dr_1_join_index
-- ----------------------------
INSERT INTO `dr_1_join_index` VALUES ('46', '1', '35', '9', '1573371151');

-- ----------------------------
-- Table structure for dr_1_join_recycle
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_join_recycle`;
CREATE TABLE `dr_1_join_recycle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `result` text NOT NULL COMMENT '删除理由',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `catid` (`catid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容回收站表';

-- ----------------------------
-- Records of dr_1_join_recycle
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_join_search
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_join_search`;
CREATE TABLE `dr_1_join_search` (
  `id` varchar(32) NOT NULL,
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `params` text NOT NULL COMMENT '参数数组',
  `keyword` varchar(255) NOT NULL COMMENT '关键字',
  `contentid` mediumtext NOT NULL COMMENT 'id集合',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `catid` (`catid`),
  KEY `keyword` (`keyword`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='搜索表';

-- ----------------------------
-- Records of dr_1_join_search
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_join_time
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_join_time`;
CREATE TABLE `dr_1_join_time` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `result` text NOT NULL COMMENT '处理结果',
  `posttime` int(10) unsigned NOT NULL COMMENT '定时发布时间',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `posttime` (`posttime`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容定时发布表';

-- ----------------------------
-- Records of dr_1_join_time
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_join_verify
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_join_verify`;
CREATE TABLE `dr_1_join_verify` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `isnew` tinyint(1) unsigned NOT NULL COMMENT '是否新增',
  `author` varchar(50) NOT NULL COMMENT '作者',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `backuid` mediumint(8) unsigned NOT NULL COMMENT '操作人uid',
  `backinfo` text NOT NULL COMMENT '操作退回信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`),
  KEY `backuid` (`backuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容审核表';

-- ----------------------------
-- Records of dr_1_join_verify
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_navigator
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_navigator`;
CREATE TABLE `dr_1_navigator` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(5) unsigned NOT NULL COMMENT '上级id',
  `pids` text COMMENT '所有上级id数据项',
  `type` tinyint(1) unsigned NOT NULL COMMENT '导航类型',
  `name` varchar(255) NOT NULL COMMENT '导航名称',
  `title` varchar(255) NOT NULL COMMENT 'seo标题',
  `url` varchar(255) NOT NULL COMMENT '导航地址',
  `thumb` varchar(255) NOT NULL COMMENT '图片标示',
  `show` tinyint(1) unsigned NOT NULL COMMENT '显示',
  `mark` varchar(255) DEFAULT NULL COMMENT '类型标示',
  `extend` tinyint(1) unsigned DEFAULT NULL COMMENT '是否继承下级',
  `child` tinyint(1) unsigned NOT NULL COMMENT '是否有下级',
  `childids` text COMMENT '所有下级数据项',
  `target` tinyint(1) unsigned NOT NULL COMMENT '是否站外链接',
  `displayorder` smallint(5) NOT NULL COMMENT '显示顺序',
  PRIMARY KEY (`id`),
  KEY `list` (`id`,`type`,`show`,`displayorder`),
  KEY `mark` (`mark`),
  KEY `extend` (`extend`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='网站自定义链接表';

-- ----------------------------
-- Records of dr_1_navigator
-- ----------------------------
INSERT INTO `dr_1_navigator` VALUES ('1', '0', '0', '0', '友情链接', '友情链接', '1', '', '1', 'active', '0', '1', '1,2', '1', '0');
INSERT INTO `dr_1_navigator` VALUES ('2', '1', '0,1', '0', '百度', '百度', 'http://www.baidu.com', '', '1', 'baidu', '0', '0', '2', '1', '0');
INSERT INTO `dr_1_navigator` VALUES ('3', '0', '0', '0', '旗下公司', '旗下公司', '1', '', '1', 'qixia', '0', '1', '3,4,5', '1', '0');
INSERT INTO `dr_1_navigator` VALUES ('4', '3', '0,3', '0', '百度一', '百度一', 'http://www.baidu.com', '', '1', 'baidu1', '0', '0', '4', '1', '0');
INSERT INTO `dr_1_navigator` VALUES ('5', '3', '0,3', '0', '百度二', '百度二', 'http://www.baidu.com', '', '1', 'baidu2', '0', '0', '5', '1', '0');

-- ----------------------------
-- Table structure for dr_1_news
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_news`;
CREATE TABLE `dr_1_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `title` varchar(255) DEFAULT NULL COMMENT '主题',
  `thumb` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` text COMMENT '描述',
  `hits` int(10) unsigned DEFAULT NULL COMMENT '浏览数',
  `uid` int(10) unsigned NOT NULL COMMENT '作者id',
  `author` varchar(50) NOT NULL COMMENT '作者名称',
  `status` tinyint(2) NOT NULL COMMENT '状态',
  `url` varchar(255) DEFAULT NULL COMMENT '地址',
  `link_id` int(10) NOT NULL DEFAULT '0' COMMENT '同步id',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '附表id',
  `inputip` varchar(15) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `updatetime` int(10) unsigned NOT NULL COMMENT '更新时间',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数量',
  `avgsort` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '平均点评分数',
  `displayorder` int(10) DEFAULT '0' COMMENT '排序值',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`,`updatetime`),
  KEY `link_id` (`link_id`),
  KEY `comments` (`comments`),
  KEY `avgsort` (`avgsort`),
  KEY `status` (`status`),
  KEY `updatetime` (`updatetime`),
  KEY `hits` (`hits`),
  KEY `displayorder` (`displayorder`,`updatetime`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COMMENT='内容主表';

-- ----------------------------
-- Records of dr_1_news
-- ----------------------------
INSERT INTO `dr_1_news` VALUES ('1', '3', '企业愿景', '1', '', '创造出入管理系统国际一流品牌', '1', '1', 'admin', '9', '/index.php?c=show&id=1', '0', '0', '127.0.0.1', '1573179171', '1573179251', '0', '0.00', '0');
INSERT INTO `dr_1_news` VALUES ('2', '3', '企业使命', '2', '', '确保平安快捷出入，营造美丽和谐环境', '1', '1', 'admin', '9', '/index.php?c=show&id=2', '0', '0', '127.0.0.1', '1573179253', '1573179272', '0', '0.00', '0');
INSERT INTO `dr_1_news` VALUES ('3', '3', '企业价值观', '3', '', '诚实守信、厚德载物、关怀员工、回馈社会、善于学习、持续改进、拼搏进取、追求卓越。', '1', '1', 'admin', '9', '/index.php?c=show&id=3', '0', '0', '127.0.0.1', '1573179274', '1573179294', '0', '0.00', '0');
INSERT INTO `dr_1_news` VALUES ('4', '3', '企业之歌', '4', '', '某某歌曲有两首：《某某人》和《某某颂》，词、曲作者是音乐人徐立新先生，两首歌旋律优美明快，沉着有力。', '1', '1', 'admin', '9', '/index.php?c=show&id=4', '0', '0', '127.0.0.1', '1573179296', '1573179315', '0', '0.00', '0');
INSERT INTO `dr_1_news` VALUES ('5', '4', '公司荣誉一', '5', '', '公司荣誉一', '1', '1', 'admin', '9', '/index.php?c=show&id=5', '0', '0', '127.0.0.1', '1573179817', '1573179861', '0', '0.00', '0');
INSERT INTO `dr_1_news` VALUES ('6', '4', '公司荣誉二', '5', '', '公司荣誉二', '1', '1', 'admin', '9', '/index.php?c=show&id=6', '0', '0', '127.0.0.1', '1573179863', '1573179884', '0', '0.00', '0');
INSERT INTO `dr_1_news` VALUES ('7', '4', '公司荣誉三', '5', '', '公司荣誉三', '1', '1', 'admin', '9', '/index.php?c=show&id=7', '0', '0', '127.0.0.1', '1573179886', '1573179898', '0', '0.00', '0');
INSERT INTO `dr_1_news` VALUES ('8', '4', '公司荣誉四', '5', '', '公司荣誉四', '1', '1', 'admin', '9', '/index.php?c=show&id=8', '0', '0', '127.0.0.1', '1573179900', '1573179911', '0', '0.00', '0');
INSERT INTO `dr_1_news` VALUES ('9', '4', '公司荣誉五', '5', '', '公司荣誉五', '1', '1', 'admin', '9', '/index.php?c=show&id=9', '0', '0', '127.0.0.1', '1573179913', '1573179928', '0', '0.00', '0');
INSERT INTO `dr_1_news` VALUES ('10', '4', '公司荣誉六', '5', '', '公司荣誉六', '1', '1', 'admin', '9', '/index.php?c=show&id=10', '0', '0', '127.0.0.1', '1573179930', '1573179948', '0', '0.00', '0');
INSERT INTO `dr_1_news` VALUES ('11', '4', '公司荣誉七', '5', '', '公司荣誉七', '1', '1', 'admin', '9', '/index.php?c=show&id=11', '0', '0', '127.0.0.1', '1573179954', '1573179965', '0', '0.00', '0');
INSERT INTO `dr_1_news` VALUES ('12', '4', '公司荣誉八', '5', '', '公司荣誉八', '1', '1', 'admin', '9', '/index.php?c=show&id=12', '0', '0', '127.0.0.1', '1573179967', '1573179981', '0', '0.00', '0');
INSERT INTO `dr_1_news` VALUES ('13', '4', '公司荣誉九', '5', '', '公司荣誉九', '1', '1', 'admin', '9', '/index.php?c=show&id=13', '0', '0', '127.0.0.1', '1573179983', '1573179995', '0', '0.00', '0');
INSERT INTO `dr_1_news` VALUES ('14', '4', '公司荣誉十', '5', '', '公司荣誉十', '1', '1', 'admin', '9', '/index.php?c=show&id=14', '0', '0', '127.0.0.1', '1573179997', '1573180008', '0', '0.00', '0');
INSERT INTO `dr_1_news` VALUES ('15', '4', '公司荣誉十一', '5', '', '公司荣誉十一', '1', '1', 'admin', '9', '/index.php?c=show&id=15', '0', '0', '127.0.0.1', '1573180010', '1573180020', '0', '0.00', '0');
INSERT INTO `dr_1_news` VALUES ('16', '5', '1997', '', '', '★全年全球销售收入首超千亿美元。★全球发货量突破2亿，稳居全球前三。★100强企业选择华为作为数字化转型的合作伙伴。', '1', '1', 'admin', '9', '/index.php?c=show&id=16', '0', '0', '127.0.0.1', '1573180818', '1573180838', '0', '0.00', '0');
INSERT INTO `dr_1_news` VALUES ('17', '5', '1999', '', '', '★\"为客户创造效益\"为核心经营理念。★于1998年将市场拓展到中国城市。★销售额达15亿，来自中国农村市场。★开始研发并推出农村数字交换解决方案。★2001年和2003年获得CMM4级认证、CMM5级...', '1', '1', 'admin', '9', '/index.php?c=show&id=17', '0', '0', '127.0.0.1', '1573180840', '1573180854', '0', '0.00', '0');
INSERT INTO `dr_1_news` VALUES ('18', '5', '2000', '', '', '★海外市场销售额达1亿美元。★推出无线GSM解决方案。★在瑞典首都斯德哥尔摩设立研发中心。★以7.5亿美元的价格将非核心子公司Avansys卖给爱默生。', '1', '1', 'admin', '9', '/index.php?c=show&id=18', '0', '0', '127.0.0.1', '1573180864', '1573180876', '0', '0.00', '0');
INSERT INTO `dr_1_news` VALUES ('19', '5', '2003', '', '', '★与西门子合作成立合资公司。★与3Com公司合作成立合资公司。★北京分公司和上海办事处成立，某某产品首次走出上海。', '1', '1', 'admin', '9', '/index.php?c=show&id=19', '0', '0', '127.0.0.1', '1573180879', '1573180889', '0', '0.00', '0');
INSERT INTO `dr_1_news` VALUES ('20', '5', '2005', '', '', '★海外合同销售额首次超过国内合同销售额。★与沃达丰签署《全球框架协议》，正式成为沃达丰优选通信设备供应商。', '1', '1', 'admin', '9', '/index.php?c=show&id=20', '0', '0', '127.0.0.1', '1573180892', '1573180904', '0', '0.00', '0');
INSERT INTO `dr_1_news` VALUES ('21', '5', '2007', '', '', '★与赛门铁克合作成立合资公司，开发存储和安全产品与解决方案。★与Global Marine合作成立合资公司，提供海缆端到端网络解决方案。★在2007年底成为欧洲所有顶级运营商的合作伙伴。★被沃达丰授予...', '1', '1', 'admin', '9', '/index.php?c=show&id=21', '0', '0', '127.0.0.1', '1573180906', '1573180957', '0', '0.00', '0');
INSERT INTO `dr_1_news` VALUES ('22', '5', '2012', '', '', '★被商业周刊评为全球十大最有影响力的公司。★根据Informa的咨询报告，华为在移动设备市场领域排名全球第三。★首次在北美大规模商用UMTS/HSPA网络，为加拿大运营商Telus和Bell建设下一代...', '1', '1', 'admin', '9', '/index.php?c=show&id=22', '0', '0', '127.0.0.1', '1573180960', '1573180984', '0', '0.00', '0');
INSERT INTO `dr_1_news` VALUES ('23', '5', '2014', '', '', '★在全球9个国家建立5G创新研究中心。★承建全球186个400G核心路由器商用网络。★为全球客户建设480多个数据中心，其中160多个云数据中心。★全球研发中心总数达到16个，联合创新中心共28个。★...', '1', '1', 'admin', '9', '/index.php?c=show&id=23', '0', '0', '127.0.0.1', '1573180986', '1573181000', '0', '0.00', '0');
INSERT INTO `dr_1_news` VALUES ('24', '5', '2016', '', '', '★全年全球销售收入首超千亿美元。★2018年度华为手机（含荣耀）全球发货量突破2亿，稳居全球前三。★5G微波开启全面商用的新征程。★发布新一代顶级人工智能手机芯片&amp;mdash;&amp;mda...', '1', '1', 'admin', '9', '/index.php?c=show&id=24', '0', '0', '127.0.0.1', '1573181002', '1573181015', '0', '0.00', '0');
INSERT INTO `dr_1_news` VALUES ('41', '21', '客户案例一', '10', '', '天津办公家具采购，客户万泰投资需要大批办公家具，负责人在网上和实体店逛了很长时间，进行多家的款式及价格的筛选与对比，较后选择办公家具，不仅是因为单一的款式好看或是价格便宜，而是总体条件，无论款式价格还...', '1', '1', 'admin', '9', '/index.php?c=show&id=41', '0', '0', '127.0.0.1', '1573364483', '1573364628', '0', '0.00', '0');
INSERT INTO `dr_1_news` VALUES ('47', '36', '沟通渠道', '11', '', '公司与员工之间有着通畅的沟通渠道。', '1', '1', 'admin', '9', '/index.php?c=show&id=47', '0', '0', '127.0.0.1', '1573372091', '1573372150', '0', '0.00', '0');
INSERT INTO `dr_1_news` VALUES ('48', '36', '员工俱乐部', '12', '', '某某成立了各种俱乐部，旨在丰富员工生活，提高员工生活品质。', '1', '1', 'admin', '9', '/index.php?c=show&id=48', '0', '0', '127.0.0.1', '1573372153', '1573372170', '0', '0.00', '0');
INSERT INTO `dr_1_news` VALUES ('49', '36', '任职资格', '13', '', '规范人才的培养和选拔，树立有效培训和自我学习的标杆，以资格标准牵引员工不断学习、不断改进，保持持续性发展，激励员工不断提高其职位胜任能力。', '1', '1', 'admin', '9', '/index.php?c=show&id=49', '0', '0', '127.0.0.1', '1573372172', '1573372190', '0', '0.00', '0');
INSERT INTO `dr_1_news` VALUES ('50', '36', '薪酬福利', '14', '', '我们遵守当地法律规定的最低工资标准要求，还推行了极具竞争力的薪酬体系。', '1', '1', 'admin', '9', '/index.php?c=show&id=50', '0', '0', '127.0.0.1', '1573372192', '1573372210', '0', '0.00', '0');
INSERT INTO `dr_1_news` VALUES ('51', '36', '导师制度', '15', '', '某某建立了一套有效的导师制度，帮助新员工尽快适应某某。', '1', '1', 'admin', '9', '/index.php?c=show&id=51', '0', '0', '127.0.0.1', '1573372212', '1573372227', '0', '0.00', '0');
INSERT INTO `dr_1_news` VALUES ('52', '36', '职业培训', '16', '', '公司为员工提供了多种培训资源，帮助其进行自我提高。', '1', '1', 'admin', '9', '/index.php?c=show&id=52', '0', '0', '127.0.0.1', '1573372229', '1573372244', '0', '0.00', '0');
INSERT INTO `dr_1_news` VALUES ('53', '36', '工作环境', '17', '', '某某一直努力为员工提供舒适的办公环境', '1', '1', 'admin', '9', '/index.php?c=show&id=53', '0', '0', '127.0.0.1', '1573372246', '1573372259', '0', '0.00', '0');
INSERT INTO `dr_1_news` VALUES ('54', '13', '三点教您选择营销型网站和展示型网站', '18', '营销型网站,展示型网站', '三点教您选择营销型网站和展示型网站　　不少企业对于营销型网站的理解并不是很透彻，导致了这些企业在建设这些网站方面其最终的结果并没有起到很好的作用，为了让更多的企业认识到营销型网站和展示型网站的区别，并...', '1', '1', 'admin', '9', '/index.php?c=show&id=54', '0', '0', '127.0.0.1', '1573375570', '1573375620', '0', '0.00', '0');

-- ----------------------------
-- Table structure for dr_1_news_category
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_news_category`;
CREATE TABLE `dr_1_news_category` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `pid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `pids` varchar(255) NOT NULL COMMENT '所有上级id',
  `name` varchar(30) NOT NULL COMMENT '栏目名称',
  `dirname` varchar(30) NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(100) NOT NULL COMMENT '上级目录',
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有下级',
  `childids` text NOT NULL COMMENT '下级所有id',
  `thumb` varchar(255) NOT NULL COMMENT '栏目图片',
  `show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `setting` text NOT NULL COMMENT '属性配置',
  `displayorder` mediumint(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `show` (`show`),
  KEY `module` (`pid`,`displayorder`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目表';

-- ----------------------------
-- Records of dr_1_news_category
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_news_category_data
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_news_category_data`;
CREATE TABLE `dr_1_news_category_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` int(3) unsigned NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目模型表';

-- ----------------------------
-- Records of dr_1_news_category_data
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_news_category_data_0
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_news_category_data_0`;
CREATE TABLE `dr_1_news_category_data_0` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目模型表的附表';

-- ----------------------------
-- Records of dr_1_news_category_data_0
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_news_comment
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_news_comment`;
CREATE TABLE `dr_1_news_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `cid` int(10) unsigned NOT NULL COMMENT '关联id',
  `cuid` int(10) unsigned NOT NULL COMMENT '关联uid',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `orderid` bigint(18) unsigned NOT NULL COMMENT '订单id',
  `uid` mediumint(8) unsigned DEFAULT '0' COMMENT '评论者ID',
  `author` varchar(250) DEFAULT NULL COMMENT '评论者账号',
  `content` text COMMENT '评论内容',
  `support` int(10) unsigned DEFAULT '0' COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT '0' COMMENT '反对数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '平均分',
  `sort1` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort2` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort3` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort4` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort5` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort6` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort7` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort8` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort9` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `reply` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '回复id',
  `in_reply` tinyint(1) unsigned DEFAULT '0' COMMENT '是否存在回复',
  `status` smallint(1) unsigned DEFAULT '0' COMMENT '审核状态',
  `inputip` varchar(50) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `catid` (`catid`),
  KEY `orderid` (`orderid`),
  KEY `reply` (`reply`),
  KEY `support` (`support`),
  KEY `oppose` (`oppose`),
  KEY `avgsort` (`avgsort`),
  KEY `status` (`status`),
  KEY `aa` (`cid`,`status`,`inputtime`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论内容表';

-- ----------------------------
-- Records of dr_1_news_comment
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_news_comment_index
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_news_comment_index`;
CREATE TABLE `dr_1_news_comment_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `support` int(10) unsigned DEFAULT '0' COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT '0' COMMENT '反对数',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '平均分',
  `sort1` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort2` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort3` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort4` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort5` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort6` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort7` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort8` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort9` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `tableid` smallint(5) unsigned DEFAULT '0' COMMENT '附表id',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `catid` (`catid`),
  KEY `support` (`support`),
  KEY `oppose` (`oppose`),
  KEY `comments` (`comments`),
  KEY `avgsort` (`avgsort`),
  KEY `tableid` (`tableid`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='评论索引表';

-- ----------------------------
-- Records of dr_1_news_comment_index
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_news_data_0
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_news_data_0`;
CREATE TABLE `dr_1_news_data_0` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext COMMENT '内容',
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容附表';

-- ----------------------------
-- Records of dr_1_news_data_0
-- ----------------------------
INSERT INTO `dr_1_news_data_0` VALUES ('1', '1', '3', '&lt;p&gt;1&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES ('2', '1', '3', '&lt;p&gt;确保平安快捷出入，营造美丽和谐环境&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES ('3', '1', '3', '&lt;p&gt;诚实守信、厚德载物、关怀员工、回馈社会、善于学习、持续改进、拼搏进取、追求卓越。&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES ('4', '1', '3', '&lt;p&gt;某某歌曲有两首：《某某人》和《某某颂》，词、曲作者是音乐人徐立新先生，两首歌旋律优美明快，沉着有力。&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES ('5', '1', '4', '&lt;p&gt;公司荣誉一&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES ('6', '1', '4', '&lt;p&gt;公司荣誉二&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES ('7', '1', '4', '&lt;p&gt;公司荣誉三&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES ('8', '1', '4', '&lt;p&gt;公司荣誉四&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES ('9', '1', '4', '&lt;p&gt;公司荣誉五&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES ('10', '1', '4', '&lt;p&gt;公司荣誉六&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES ('11', '1', '4', '&lt;p&gt;公司荣誉七&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES ('12', '1', '4', '&lt;p&gt;公司荣誉八&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES ('13', '1', '4', '&lt;p&gt;公司荣誉九&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES ('14', '1', '4', '&lt;p&gt;公司荣誉十&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES ('15', '1', '4', '&lt;p&gt;公司荣誉十一&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES ('16', '1', '5', '&lt;p&gt;★全年全球销售收入首超千亿美元。&lt;/p&gt;&lt;p&gt;★全球发货量突破2亿，稳居全球前三。&lt;/p&gt;&lt;p&gt;★100强企业选择华为作为数字化转型的合作伙伴。&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES ('17', '1', '5', '&lt;p&gt;★&amp;quot;为客户创造效益&amp;quot;为核心经营理念。&lt;/p&gt;&lt;p&gt;★于1998年将市场拓展到中国城市。&lt;/p&gt;&lt;p&gt;★销售额达15亿，来自中国农村市场。&lt;/p&gt;&lt;p&gt;★开始研发并推出农村数字交换解决方案。&lt;/p&gt;&lt;p&gt;★2001年和2003年获得CMM4级认证、CMM5级认证。&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES ('18', '1', '5', '&lt;p&gt;★海外市场销售额达1亿美元。&lt;/p&gt;&lt;p&gt;★推出无线GSM解决方案。&lt;/p&gt;&lt;p&gt;★在瑞典首都斯德哥尔摩设立研发中心。&lt;/p&gt;&lt;p&gt;★以7.5亿美元的价格将非核心子公司Avansys卖给爱默生。&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES ('19', '1', '5', '&lt;p&gt;★与西门子合作成立合资公司。&lt;/p&gt;&lt;p&gt;★与3Com公司合作成立合资公司。&lt;/p&gt;&lt;p&gt;★北京分公司和上海办事处成立，某某产品首次走出上海。&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES ('20', '1', '5', '&lt;p&gt;★海外合同销售额首次超过国内合同销售额。&lt;/p&gt;&lt;p&gt;★与沃达丰签署《全球框架协议》，正式成为沃达丰优选通信设备供应商。&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES ('21', '1', '5', '&lt;p&gt;★与赛门铁克合作成立合资公司，开发存储和安全产品与解决方案。&lt;/p&gt;&lt;p&gt;★与Global Marine合作成立合资公司，提供海缆端到端网络解决方案。&lt;/p&gt;&lt;p&gt;★在2007年底成为欧洲所有顶级运营商的合作伙伴。&lt;/p&gt;&lt;p&gt;★被沃达丰授予“2007杰出表现奖”，是唯一获此奖项的电信网络解决方案供应商。&lt;/p&gt;&lt;p&gt;★推出基于全IP网络的移动固定融合（FMC）解决方案战略，帮助电信运营商节省运作总成本，减少能源消耗。&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES ('22', '1', '5', '&lt;p&gt;★被商业周刊评为全球十大最有影响力的公司。&lt;/p&gt;&lt;p&gt;★根据Informa的咨询报告，华为在移动设备市场领域排名全球第三。&lt;/p&gt;&lt;p&gt;★首次在北美大规模商用UMTS/HSPA网络，为加拿大运营商Telus和Bell建设下一代无线网络。&lt;/p&gt;&lt;p&gt;★移动宽带产品全球累计发货量超过2000万部，根据ABI的数据，市场份额位列全球第一。&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES ('23', '1', '5', '&lt;p&gt;★在全球9个国家建立5G创新研究中心。&lt;/p&gt;&lt;p&gt;★承建全球186个400G核心路由器商用网络。&lt;/p&gt;&lt;p&gt;★为全球客户建设480多个数据中心，其中160多个云数据中心。&lt;/p&gt;&lt;p&gt;★全球研发中心总数达到16个，联合创新中心共28个。&lt;/p&gt;&lt;p&gt;★2014年，智能手机发货量超过7500万台。&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES ('24', '1', '5', '&lt;p&gt;★全年全球销售收入首超千亿美元。&lt;/p&gt;&lt;p&gt;★2018年度华为手机（含荣耀）全球发货量突破2亿，稳居全球前三。&lt;/p&gt;&lt;p&gt;★5G微波开启全面商用的新征程。&lt;/p&gt;&lt;p&gt;★发布新一代顶级人工智能手机芯片&amp;amp;mdash;&amp;amp;mdash;麒麟980。&lt;/p&gt;&lt;p&gt;★颁奖Polar码之父，致敬基础研究和探索精神。&lt;/p&gt;&lt;p&gt;★发布了基于3GPP 标准的端到端全系列5G产品解决方案。&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES ('41', '1', '21', '&lt;div&gt;\r\n	天津办公家具采购，客户万泰投资需要大批办公家具，负责人在网上和实体店逛了很长时间，进行多家的款式及价格的筛选与对比，较后选择办公家具，不仅是因为单一的款式好看或是价格便宜，而是总体条件，无论款式价格还是厂家实力和服务，都能达到客户所需求的标准，彰显出客户万泰的企业形象。&lt;/div&gt;&lt;div&gt;\r\n	&amp;nbsp;&lt;/div&gt;&lt;div&gt;\r\n	客户的李总是位精益求精的领导者，在与我们张经理沟通时，针对产品细节的要求非常之高，尤其针对一些定制产品，各个环节要求更是精细，在生产过程中，也不断电话沟通，让我们注意家具的细节问题，现在所有产品已全部安装完成。李总说：“办公家具没有让我失望，值得我们信赖”;。&lt;/div&gt;&lt;div&gt;\r\n	&amp;nbsp;&lt;/div&gt;&lt;div&gt;\r\n	在成长过程中，保持着不骄不躁的本质，竭诚为消费者营造人性化、环保、现代的办公环境，以现代化的技术、规模化的生产，是一家整体解决方案有服务商，如您需要了解可拨打全国免费热线：400-XXXX-319或向在线客服咨询。&lt;/div&gt;');
INSERT INTO `dr_1_news_data_0` VALUES ('47', '1', '36', '&lt;p&gt;1&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES ('48', '1', '36', '&lt;p&gt;1&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES ('49', '1', '36', '&lt;p&gt;1&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES ('50', '1', '36', '&lt;p&gt;1&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES ('51', '1', '36', '&lt;p&gt;1&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES ('52', '1', '36', '&lt;p&gt;1&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES ('53', '1', '36', '&lt;p&gt;1&lt;/p&gt;');
INSERT INTO `dr_1_news_data_0` VALUES ('54', '1', '13', '&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(128, 128, 128); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 13px; white-space: normal;&quot;&gt;三点教您选择营销型网站和展示型网站&lt;/p&gt;&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://demoall.adashuo.com/19451/uploads/allimg/191028/1-19102Q51204V1.jpg&quot; style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin: 0px; padding: 0px; border: 0px; max-width: 100%; color: rgb(128, 128, 128); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 13px; white-space: normal;&quot;/&gt;&lt;span style=&quot;color: rgb(128, 128, 128); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 13px;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(128, 128, 128); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 13px; white-space: normal;&quot;&gt;　　不少企业对于营销型网站的理解并不是很透彻，导致了这些企业在建设这些网站方面其最终的结果并没有起到很好的作用，为了让更多的企业认识到营销型网站和展示型网站的区别，并在此基础上进行科学合理的运营，从而为企业的发展提供科技动力，对此合优网络科技有限公司对营销型网站和展示型网站进行了对比分析，具体如下：&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(128, 128, 128); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 13px; white-space: normal;&quot;&gt;　　1、从营销推广的角度来看&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(128, 128, 128); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 13px; white-space: normal;&quot;&gt;　　虽然这两种类型的网站都希望获得大量的流量，但是却存在着一定的区别，对于展示型网站来说，并不一定要求让用户流量在网站上直接转换成订单，但是也希望通过网站的展示，促使客户在线下和企业进行交易。所以展示型网站更多是让用户能够产生好印象，特别是第一印象。&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(128, 128, 128); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 13px; white-space: normal;&quot;&gt;　　但是对于营销型网站来说，就不仅要注重第一印象，同时还需要注重引导用户在网站直接进行下单，从而为企业获得直接的利润。所以营销推广时，更多注重网站的品牌性和功能的简便性。并且还需要配置高效的客服团队为用户提供全方位的服务，从而让网站能够获得用户的认可。&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(128, 128, 128); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 13px; white-space: normal;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://demoall.adashuo.com/19451/uploads/allimg/191028/1-19102Q51211306.jpg&quot; style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin: 0px; padding: 0px; border: 0px; max-width: 100%; color: rgb(128, 128, 128); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 13px; white-space: normal;&quot;/&gt;&lt;span style=&quot;color: rgb(128, 128, 128); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 13px;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(128, 128, 128); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 13px; white-space: normal;&quot;&gt;　　2、从定位上来看&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(128, 128, 128); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 13px; white-space: normal;&quot;&gt;&amp;nbsp; &amp;nbsp; 传统的展示型网站更多是从设计和美学的角度来进行建设，网站整体给人以炫酷的感觉，让人能够得到美得享受。而用户只需要在该平台上进行信息浏览就已经足够，基本上不考虑网站的定位问题。然而营销型网站则有着更多的要求，因为营销型网站最终的目的是为企业赢得订单，那么就非常注重流量转化率，不仅要将信息推给用户浏览，更要让用户能够据此下订单购买，所以营销型网站更加注重定位问题，注重用户目标需求，从而满足用户需求，最终获得相应的订单。&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(128, 128, 128); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 13px; white-space: normal;&quot;&gt;　　3、从技术的角度来看&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(128, 128, 128); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 13px; white-space: normal;&quot;&gt;　　传统的展示型网站为了让网站变得更加漂亮，所以会在页面上采用更多Flash动画来让网页变得炫酷起来，同时采用大量的图片，Java小程序等，从而让网站的打开速度变得更慢，而目前搜索引擎对这些内容的抓取能力还非常薄弱，所以会影响到网站内容的收录，不利于网站的排名。&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(128, 128, 128); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 13px; white-space: normal;&quot;&gt;　　而这点对于营销型网站来说，往往为了提升网站的排名，大多采用了Html静态网页进行设计，同时使用CSS样式表以及大量的文字内容，同时网站的目录结构更加扁平化，从而促进百度蜘蛛的抓取效率。另外网站还提供XML格式的地图，方便搜索引擎抓取，所以营销型网站和展示型网站在技术上也是具有明显的不同。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;');

-- ----------------------------
-- Table structure for dr_1_news_draft
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_news_draft`;
CREATE TABLE `dr_1_news_draft` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `catid` (`catid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容草稿表';

-- ----------------------------
-- Records of dr_1_news_draft
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_news_flag
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_news_flag`;
CREATE TABLE `dr_1_news_flag` (
  `flag` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '文档标记id',
  `id` int(10) unsigned NOT NULL COMMENT '文档内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  KEY `flag` (`flag`,`id`,`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='标记表';

-- ----------------------------
-- Records of dr_1_news_flag
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_news_hits
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_news_hits`;
CREATE TABLE `dr_1_news_hits` (
  `id` int(10) unsigned NOT NULL COMMENT '文章id',
  `hits` int(10) unsigned NOT NULL COMMENT '总点击数',
  `day_hits` int(10) unsigned NOT NULL COMMENT '本日点击',
  `week_hits` int(10) unsigned NOT NULL COMMENT '本周点击',
  `month_hits` int(10) unsigned NOT NULL COMMENT '本月点击',
  `year_hits` int(10) unsigned NOT NULL COMMENT '年点击量',
  UNIQUE KEY `id` (`id`),
  KEY `day_hits` (`day_hits`),
  KEY `week_hits` (`week_hits`),
  KEY `month_hits` (`month_hits`),
  KEY `year_hits` (`year_hits`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='时段点击量统计';

-- ----------------------------
-- Records of dr_1_news_hits
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_news_index
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_news_index`;
CREATE TABLE `dr_1_news_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COMMENT='内容索引表';

-- ----------------------------
-- Records of dr_1_news_index
-- ----------------------------
INSERT INTO `dr_1_news_index` VALUES ('1', '1', '3', '9', '1573179171');
INSERT INTO `dr_1_news_index` VALUES ('2', '1', '3', '9', '1573179253');
INSERT INTO `dr_1_news_index` VALUES ('3', '1', '3', '9', '1573179274');
INSERT INTO `dr_1_news_index` VALUES ('4', '1', '3', '9', '1573179296');
INSERT INTO `dr_1_news_index` VALUES ('5', '1', '4', '9', '1573179817');
INSERT INTO `dr_1_news_index` VALUES ('6', '1', '4', '9', '1573179863');
INSERT INTO `dr_1_news_index` VALUES ('7', '1', '4', '9', '1573179886');
INSERT INTO `dr_1_news_index` VALUES ('8', '1', '4', '9', '1573179900');
INSERT INTO `dr_1_news_index` VALUES ('9', '1', '4', '9', '1573179913');
INSERT INTO `dr_1_news_index` VALUES ('10', '1', '4', '9', '1573179930');
INSERT INTO `dr_1_news_index` VALUES ('11', '1', '4', '9', '1573179954');
INSERT INTO `dr_1_news_index` VALUES ('12', '1', '4', '9', '1573179967');
INSERT INTO `dr_1_news_index` VALUES ('13', '1', '4', '9', '1573179983');
INSERT INTO `dr_1_news_index` VALUES ('14', '1', '4', '9', '1573179997');
INSERT INTO `dr_1_news_index` VALUES ('15', '1', '4', '9', '1573180010');
INSERT INTO `dr_1_news_index` VALUES ('16', '1', '5', '9', '1573180818');
INSERT INTO `dr_1_news_index` VALUES ('17', '1', '5', '9', '1573180840');
INSERT INTO `dr_1_news_index` VALUES ('18', '1', '5', '9', '1573180864');
INSERT INTO `dr_1_news_index` VALUES ('19', '1', '5', '9', '1573180879');
INSERT INTO `dr_1_news_index` VALUES ('20', '1', '5', '9', '1573180892');
INSERT INTO `dr_1_news_index` VALUES ('21', '1', '5', '9', '1573180906');
INSERT INTO `dr_1_news_index` VALUES ('22', '1', '5', '9', '1573180960');
INSERT INTO `dr_1_news_index` VALUES ('23', '1', '5', '9', '1573180986');
INSERT INTO `dr_1_news_index` VALUES ('24', '1', '5', '9', '1573181002');
INSERT INTO `dr_1_news_index` VALUES ('41', '1', '21', '9', '1573364483');
INSERT INTO `dr_1_news_index` VALUES ('47', '1', '36', '9', '1573372091');
INSERT INTO `dr_1_news_index` VALUES ('48', '1', '36', '9', '1573372153');
INSERT INTO `dr_1_news_index` VALUES ('49', '1', '36', '9', '1573372172');
INSERT INTO `dr_1_news_index` VALUES ('50', '1', '36', '9', '1573372192');
INSERT INTO `dr_1_news_index` VALUES ('51', '1', '36', '9', '1573372212');
INSERT INTO `dr_1_news_index` VALUES ('52', '1', '36', '9', '1573372229');
INSERT INTO `dr_1_news_index` VALUES ('53', '1', '36', '9', '1573372246');
INSERT INTO `dr_1_news_index` VALUES ('54', '1', '13', '9', '1573375570');

-- ----------------------------
-- Table structure for dr_1_news_recycle
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_news_recycle`;
CREATE TABLE `dr_1_news_recycle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `result` text NOT NULL COMMENT '删除理由',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `catid` (`catid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容回收站表';

-- ----------------------------
-- Records of dr_1_news_recycle
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_news_search
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_news_search`;
CREATE TABLE `dr_1_news_search` (
  `id` varchar(32) NOT NULL,
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `params` text NOT NULL COMMENT '参数数组',
  `keyword` varchar(255) NOT NULL COMMENT '关键字',
  `contentid` mediumtext NOT NULL COMMENT 'id集合',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `catid` (`catid`),
  KEY `keyword` (`keyword`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='搜索表';

-- ----------------------------
-- Records of dr_1_news_search
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_news_time
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_news_time`;
CREATE TABLE `dr_1_news_time` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `result` text NOT NULL COMMENT '处理结果',
  `posttime` int(10) unsigned NOT NULL COMMENT '定时发布时间',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `posttime` (`posttime`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容定时发布表';

-- ----------------------------
-- Records of dr_1_news_time
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_news_verify
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_news_verify`;
CREATE TABLE `dr_1_news_verify` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `isnew` tinyint(1) unsigned NOT NULL COMMENT '是否新增',
  `author` varchar(50) NOT NULL COMMENT '作者',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `backuid` mediumint(8) unsigned NOT NULL COMMENT '操作人uid',
  `backinfo` text NOT NULL COMMENT '操作退回信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`),
  KEY `backuid` (`backuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容审核表';

-- ----------------------------
-- Records of dr_1_news_verify
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_page
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_page`;
CREATE TABLE `dr_1_page` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `pids` varchar(255) NOT NULL COMMENT '所有上级id',
  `name` varchar(255) NOT NULL COMMENT '自定义页面名称',
  `dirname` varchar(30) NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(100) NOT NULL COMMENT '上级目录',
  `child` tinyint(1) unsigned NOT NULL COMMENT '是否有子类',
  `childids` varchar(255) NOT NULL COMMENT '下级所有id',
  `thumb` varchar(255) NOT NULL COMMENT '缩略图',
  `content` mediumtext COMMENT '单页内容',
  `attachment` text COMMENT '附件信息',
  `show` tinyint(1) unsigned NOT NULL COMMENT '是否显示在菜单',
  `url` varchar(255) NOT NULL COMMENT 'url地址',
  `setting` mediumtext NOT NULL COMMENT '自定义内容',
  `displayorder` smallint(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `show` (`show`),
  KEY `displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='自定义页面表';

-- ----------------------------
-- Records of dr_1_page
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_photo
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_photo`;
CREATE TABLE `dr_1_photo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `title` varchar(255) DEFAULT NULL COMMENT '主题',
  `thumb` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` text COMMENT '描述',
  `hits` int(10) unsigned DEFAULT NULL COMMENT '浏览数',
  `uid` int(10) unsigned NOT NULL COMMENT '作者id',
  `author` varchar(50) NOT NULL COMMENT '作者名称',
  `status` tinyint(2) NOT NULL COMMENT '状态',
  `url` varchar(255) DEFAULT NULL COMMENT '地址',
  `link_id` int(10) NOT NULL DEFAULT '0' COMMENT '同步id',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '附表id',
  `inputip` varchar(15) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `updatetime` int(10) unsigned NOT NULL COMMENT '更新时间',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数量',
  `avgsort` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '平均点评分数',
  `displayorder` int(10) DEFAULT '0' COMMENT '排序值',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`,`updatetime`),
  KEY `link_id` (`link_id`),
  KEY `comments` (`comments`),
  KEY `avgsort` (`avgsort`),
  KEY `status` (`status`),
  KEY `updatetime` (`updatetime`),
  KEY `hits` (`hits`),
  KEY `displayorder` (`displayorder`,`updatetime`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='内容主表';

-- ----------------------------
-- Records of dr_1_photo
-- ----------------------------
INSERT INTO `dr_1_photo` VALUES ('25', '8', '产品展示一', '6', '产品展示', 'GSM电梯无线对讲呼叫系统产品是我公司推出的第五代产品，机房用无线GSM分机与管理中心通话，无需布线减少日常使用的维护成本，为管理中心提供了一个全面对讲呼叫的解决方案；采用了先进的微芯片技术，特别根据...', '1', '1', 'admin', '9', '/index.php?c=show&id=25', '0', '0', '127.0.0.1', '1573192667', '1573192916', '0', '0.00', '0');
INSERT INTO `dr_1_photo` VALUES ('26', '8', '产品展示二', '8', '', 'GSM电梯无线对讲呼叫系统产品是我公司推出的第五代产品，机房用无线GSM分机与管理中心通话，无需布线减少日常使用的维护成本，为管理中心提供了一个全面对讲呼叫的解决方案；采用了先进的微芯片技术，特别根据...', '1', '1', 'admin', '9', '/index.php?c=show&id=26', '0', '0', '127.0.0.1', '1573193004', '1573193083', '0', '0.00', '0');
INSERT INTO `dr_1_photo` VALUES ('27', '8', '产品展示三', '6', '', 'GSM电梯无线对讲呼叫系统产品是我公司推出的第五代产品，机房用无线GSM分机与管理中心通话，无需布线减少日常使用的维护成本，为管理中心提供了一个全面对讲呼叫的解决方案；采用了先进的微芯片技术，特别根据...', '5', '1', 'admin', '9', '/index.php?c=show&id=27', '0', '0', '127.0.0.1', '1573193086', '1573193117', '0', '0.00', '0');
INSERT INTO `dr_1_photo` VALUES ('28', '8', '产品展示四', '8', '', 'GSM电梯无线对讲呼叫系统产品是我公司推出的第五代产品，机房用无线GSM分机与管理中心通话，无需布线减少日常使用的维护成本，为管理中心提供了一个全面对讲呼叫的解决方案；采用了先进的微芯片技术，特别根据...', '1', '1', 'admin', '9', '/index.php?c=show&id=28', '0', '0', '127.0.0.1', '1573193119', '1573193145', '0', '0.00', '0');
INSERT INTO `dr_1_photo` VALUES ('29', '9', '产品展示五', '8', '', 'GSM电梯无线对讲呼叫系统产品是我公司推出的第五代产品，机房用无线GSM分机与管理中心通话，无需布线减少日常使用的维护成本，为管理中心提供了一个全面对讲呼叫的解决方案；采用了先进的微芯片技术，特别根据...', '1', '1', 'admin', '9', '/index.php?c=show&id=29', '0', '0', '127.0.0.1', '1573193148', '1573193172', '0', '0.00', '0');
INSERT INTO `dr_1_photo` VALUES ('30', '9', '产品展示六', '8', '', 'GSM电梯无线对讲呼叫系统产品是我公司推出的第五代产品，机房用无线GSM分机与管理中心通话，无需布线减少日常使用的维护成本，为管理中心提供了一个全面对讲呼叫的解决方案；采用了先进的微芯片技术，特别根据...', '1', '1', 'admin', '9', '/index.php?c=show&id=30', '0', '0', '127.0.0.1', '1573193174', '1573193264', '0', '0.00', '0');
INSERT INTO `dr_1_photo` VALUES ('31', '9', '产品展示七', '8', '', 'GSM电梯无线对讲呼叫系统产品是我公司推出的第五代产品，机房用无线GSM分机与管理中心通话，无需布线减少日常使用的维护成本，为管理中心提供了一个全面对讲呼叫的解决方案；采用了先进的微芯片技术，特别根据...', '1', '1', 'admin', '9', '/index.php?c=show&id=31', '0', '0', '127.0.0.1', '1573193266', '1573193292', '0', '0.00', '0');
INSERT INTO `dr_1_photo` VALUES ('32', '9', '产品展示八', '8', '', 'GSM电梯无线对讲呼叫系统产品是我公司推出的第五代产品，机房用无线GSM分机与管理中心通话，无需布线减少日常使用的维护成本，为管理中心提供了一个全面对讲呼叫的解决方案；采用了先进的微芯片技术，特别根据...', '1', '1', 'admin', '9', '/index.php?c=show&id=32', '0', '0', '127.0.0.1', '1573193294', '1573193317', '0', '0.00', '0');
INSERT INTO `dr_1_photo` VALUES ('33', '10', '产品展示九', '8', '', 'GSM电梯无线对讲呼叫系统产品是我公司推出的第五代产品，机房用无线GSM分机与管理中心通话，无需布线减少日常使用的维护成本，为管理中心提供了一个全面对讲呼叫的解决方案；采用了先进的微芯片技术，特别根据...', '1', '1', 'admin', '9', '/index.php?c=show&id=33', '0', '0', '127.0.0.1', '1573193319', '1573193338', '0', '0.00', '0');
INSERT INTO `dr_1_photo` VALUES ('34', '10', '产品展示十', '8', '', 'GSM电梯无线对讲呼叫系统产品是我公司推出的第五代产品，机房用无线GSM分机与管理中心通话，无需布线减少日常使用的维护成本，为管理中心提供了一个全面对讲呼叫的解决方案；采用了先进的微芯片技术，特别根据...', '1', '1', 'admin', '9', '/index.php?c=show&id=34', '0', '0', '127.0.0.1', '1573193340', '1573193361', '0', '0.00', '0');
INSERT INTO `dr_1_photo` VALUES ('35', '11', '产品展示十一', '8', '', 'GSM电梯无线对讲呼叫系统产品是我公司推出的第五代产品，机房用无线GSM分机与管理中心通话，无需布线减少日常使用的维护成本，为管理中心提供了一个全面对讲呼叫的解决方案；采用了先进的微芯片技术，特别根据...', '8', '1', 'admin', '9', '/index.php?c=show&id=35', '0', '0', '127.0.0.1', '1573193364', '1573193383', '0', '0.00', '0');
INSERT INTO `dr_1_photo` VALUES ('36', '11', '产品展示十二', '8', '', 'GSM电梯无线对讲呼叫系统产品是我公司推出的第五代产品，机房用无线GSM分机与管理中心通话，无需布线减少日常使用的维护成本，为管理中心提供了一个全面对讲呼叫的解决方案；采用了先进的微芯片技术，特别根据...', '10', '1', 'admin', '9', '/index.php?c=show&id=36', '0', '0', '127.0.0.1', '1573193385', '1573193404', '0', '0.00', '0');

-- ----------------------------
-- Table structure for dr_1_photo_category
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_photo_category`;
CREATE TABLE `dr_1_photo_category` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `pid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `pids` varchar(255) NOT NULL COMMENT '所有上级id',
  `name` varchar(30) NOT NULL COMMENT '栏目名称',
  `dirname` varchar(30) NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(100) NOT NULL COMMENT '上级目录',
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有下级',
  `childids` text NOT NULL COMMENT '下级所有id',
  `thumb` varchar(255) NOT NULL COMMENT '栏目图片',
  `show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `setting` text NOT NULL COMMENT '属性配置',
  `displayorder` mediumint(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `show` (`show`),
  KEY `module` (`pid`,`displayorder`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目表';

-- ----------------------------
-- Records of dr_1_photo_category
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_photo_category_data
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_photo_category_data`;
CREATE TABLE `dr_1_photo_category_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` int(3) unsigned NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目模型表';

-- ----------------------------
-- Records of dr_1_photo_category_data
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_photo_category_data_0
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_photo_category_data_0`;
CREATE TABLE `dr_1_photo_category_data_0` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目模型表的附表';

-- ----------------------------
-- Records of dr_1_photo_category_data_0
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_photo_comment
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_photo_comment`;
CREATE TABLE `dr_1_photo_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `cid` int(10) unsigned NOT NULL COMMENT '关联id',
  `cuid` int(10) unsigned NOT NULL COMMENT '关联uid',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `orderid` bigint(18) unsigned NOT NULL COMMENT '订单id',
  `uid` mediumint(8) unsigned DEFAULT '0' COMMENT '评论者ID',
  `author` varchar(250) DEFAULT NULL COMMENT '评论者账号',
  `content` text COMMENT '评论内容',
  `support` int(10) unsigned DEFAULT '0' COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT '0' COMMENT '反对数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '平均分',
  `sort1` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort2` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort3` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort4` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort5` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort6` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort7` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort8` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort9` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `reply` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '回复id',
  `in_reply` tinyint(1) unsigned DEFAULT '0' COMMENT '是否存在回复',
  `status` smallint(1) unsigned DEFAULT '0' COMMENT '审核状态',
  `inputip` varchar(50) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `catid` (`catid`),
  KEY `orderid` (`orderid`),
  KEY `reply` (`reply`),
  KEY `support` (`support`),
  KEY `oppose` (`oppose`),
  KEY `avgsort` (`avgsort`),
  KEY `status` (`status`),
  KEY `aa` (`cid`,`status`,`inputtime`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论内容表';

-- ----------------------------
-- Records of dr_1_photo_comment
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_photo_comment_index
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_photo_comment_index`;
CREATE TABLE `dr_1_photo_comment_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `support` int(10) unsigned DEFAULT '0' COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT '0' COMMENT '反对数',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '平均分',
  `sort1` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort2` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort3` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort4` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort5` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort6` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort7` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort8` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort9` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `tableid` smallint(5) unsigned DEFAULT '0' COMMENT '附表id',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `catid` (`catid`),
  KEY `support` (`support`),
  KEY `oppose` (`oppose`),
  KEY `comments` (`comments`),
  KEY `avgsort` (`avgsort`),
  KEY `tableid` (`tableid`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='评论索引表';

-- ----------------------------
-- Records of dr_1_photo_comment_index
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_photo_data_0
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_photo_data_0`;
CREATE TABLE `dr_1_photo_data_0` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext COMMENT '内容',
  `images` text COMMENT '图片',
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容附表';

-- ----------------------------
-- Records of dr_1_photo_data_0
-- ----------------------------
INSERT INTO `dr_1_photo_data_0` VALUES ('25', '1', '8', '&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal;&quot;&gt;GSM电梯无线对讲呼叫系统产品是我公司推出的第五代产品，机房用无线GSM分机与管理中心通话，无需布线减少日常使用的维护成本，为管理中心提供了一个全面对讲呼叫的解决方案；采用了先进的微芯片技术，特别根据用户使用习惯进行优化设计，我们相信这个易于使用的无线对讲系统将给你带来方便稳定可靠的通讯。&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal;&quot;&gt;二、GSM电梯无线对讲系统功能介绍&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal;&quot;&gt;&amp;nbsp;1、系统功能简述&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal;&quot;&gt;当电梯使用过程中发生故障停机或停电困人等意外情况时电梯乘客可轻按“呼叫”键向值班室发出呼叫信号，电梯轿厢将自动播放提前录制的警示语音。此时，值班人员手机接到电梯呼叫电话，通过电话沟通，采取施救措施。&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal;&quot;&gt;特点：采用GSM卡网络，移动联通都皆可，信号强，无干扰，没有距离限制，可实现千里之外也可通话，可连接无限量的电梯台数，即，可讲几个小区合并一个值班室，减少人力和物力成本。系统可存储5组号码，可以直接呼叫到值班室座机，当值班室无人值守时，则可向另外电话号码或指定手机发出求救信号，确保与外界保持持续通讯，可确保电梯被困人员定能于外界通讯。&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal;&quot;&gt;优势：一键式呼叫、方便快捷，能有效解决监控中心、机房、轿厢、轿顶、坑底五方对讲通话。无须布线大量节约了昂贵的线路成本；无须布线大量节约了线路铺设高额的施工成本；大量节约了由于线路故障、老化等因素而带来的维护成本；完全杜绝了由于铺设线路而带来的对楼宇及道路的破坏；监控中心位置可以根据需要任意调整，无需任何线路调整；整个系统施工极为简单、施工周期短、见效快。&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal;&quot;&gt;2、机房分机功能介绍&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal;&quot;&gt;1） 一栋楼只需要用一个分机，分机最多可带三部电梯；&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal;&quot;&gt;2）GSM网络通讯，真正达到电信级别通话质量；&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal;&quot;&gt;3） 抗干扰和防雷性强，不会受到雷雨天气影响。&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal;&quot;&gt;4）&amp;nbsp; 安装简单操作易懂。&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal;&quot;&gt;三、GSM电梯无线对讲系统使用方法&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal;&quot;&gt;1、电梯呼叫值班人员&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal;&quot;&gt;当电梯困人时，被困乘客只需轻按“呼叫”键，求救信号立即发送给值班人员。&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal;&quot;&gt;2、挂断呼叫&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal;&quot;&gt;通话结束后，按“确认”键挂断通话，并将手柄放回原位。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '{\"file\":[\"7\",\"8\"],\"title\":[\"产品展示一\",\"产品详情二\"],\"description\":[\"\",\"\"]}');
INSERT INTO `dr_1_photo_data_0` VALUES ('26', '1', '8', '&lt;p&gt;\r\n	GSM电梯无线对讲呼叫系统产品是我公司推出的第五代产品，机房用无线GSM分机与管理中心通话，无需布线减少日常使用的维护成本，为管理中心提供了一个全面对讲呼叫的解决方案；采用了先进的微芯片技术，特别根据用户使用习惯进行优化设计，我们相信这个易于使用的无线对讲系统将给你带来方便稳定可靠的通讯。&lt;/p&gt;&lt;p&gt;\r\n	二、GSM电梯无线对讲系统功能介绍&lt;/p&gt;&lt;p&gt;\r\n	&amp;nbsp;1、系统功能简述&lt;/p&gt;&lt;p&gt;\r\n	当电梯使用过程中发生故障停机或停电困人等意外情况时电梯乘客可轻按&amp;amp;ldquo;呼叫&amp;amp;rdquo;键向值班室发出呼叫信号，电梯轿厢将自动播放提前录制的警示语音。此时，值班人员手机接到电梯呼叫电话，通过电话沟通，采取施救措施。&lt;/p&gt;&lt;p&gt;\r\n	特点：采用GSM卡网络，移动联通都皆可，信号强，无干扰，没有距离限制，可实现千里之外也可通话，可连接无限量的电梯台数，即，可讲几个小区合并一个值班室，减少人力和物力成本。系统可存储5组号码，可以直接呼叫到值班室座机，当值班室无人值守时，则可向另外电话号码或指定手机发出求救信号，确保与外界保持持续通讯，可确保电梯被困人员定能于外界通讯。&lt;/p&gt;&lt;p&gt;\r\n	优势：一键式呼叫、方便快捷，能有效解决监控中心、机房、轿厢、轿顶、坑底五方对讲通话。无须布线大量节约了昂贵的线路成本；无须布线大量节约了线路铺设高额的施工成本；大量节约了由于线路故障、老化等因素而带来的维护成本；完全杜绝了由于铺设线路而带来的对楼宇及道路的破坏；监控中心位置可以根据需要任意调整，无需任何线路调整；整个系统施工极为简单、施工周期短、见效快。&lt;/p&gt;&lt;p&gt;\r\n	2、机房分机功能介绍&lt;/p&gt;&lt;p&gt;\r\n	1） 一栋楼只需要用一个分机，分机最多可带三部电梯；&lt;/p&gt;&lt;p&gt;\r\n	2）GSM网络通讯，真正达到电信级别通话质量；&lt;/p&gt;&lt;p&gt;\r\n	3） 抗干扰和防雷性强，不会受到雷雨天气影响。&lt;/p&gt;&lt;p&gt;\r\n	4）&amp;nbsp; 安装简单操作易懂。&lt;/p&gt;&lt;p&gt;\r\n	三、GSM电梯无线对讲系统使用方法&lt;/p&gt;&lt;p&gt;\r\n	1、电梯呼叫值班人员&lt;/p&gt;&lt;p&gt;\r\n	当电梯困人时，被困乘客只需轻按&amp;amp;ldquo;呼叫&amp;amp;rdquo;键，求救信号立即发送给值班人员。&lt;/p&gt;&lt;p&gt;\r\n	2、挂断呼叫&lt;/p&gt;&lt;p&gt;\r\n	通话结束后，按&amp;amp;ldquo;确认&amp;amp;rdquo;键挂断通话，并将手柄放回原位。&lt;/p&gt;', '{\"file\":[\"6\",\"7\"],\"title\":[\"1-19102qa0400-l\",\"1-19102QRA9\"],\"description\":[\"\",\"\"]}');
INSERT INTO `dr_1_photo_data_0` VALUES ('27', '1', '8', '&lt;p&gt;\r\n	GSM电梯无线对讲呼叫系统产品是我公司推出的第五代产品，机房用无线GSM分机与管理中心通话，无需布线减少日常使用的维护成本，为管理中心提供了一个全面对讲呼叫的解决方案；采用了先进的微芯片技术，特别根据用户使用习惯进行优化设计，我们相信这个易于使用的无线对讲系统将给你带来方便稳定可靠的通讯。&lt;/p&gt;&lt;p&gt;\r\n	二、GSM电梯无线对讲系统功能介绍&lt;/p&gt;&lt;p&gt;\r\n	&amp;nbsp;1、系统功能简述&lt;/p&gt;&lt;p&gt;\r\n	当电梯使用过程中发生故障停机或停电困人等意外情况时电梯乘客可轻按&amp;amp;ldquo;呼叫&amp;amp;rdquo;键向值班室发出呼叫信号，电梯轿厢将自动播放提前录制的警示语音。此时，值班人员手机接到电梯呼叫电话，通过电话沟通，采取施救措施。&lt;/p&gt;&lt;p&gt;\r\n	特点：采用GSM卡网络，移动联通都皆可，信号强，无干扰，没有距离限制，可实现千里之外也可通话，可连接无限量的电梯台数，即，可讲几个小区合并一个值班室，减少人力和物力成本。系统可存储5组号码，可以直接呼叫到值班室座机，当值班室无人值守时，则可向另外电话号码或指定手机发出求救信号，确保与外界保持持续通讯，可确保电梯被困人员定能于外界通讯。&lt;/p&gt;&lt;p&gt;\r\n	优势：一键式呼叫、方便快捷，能有效解决监控中心、机房、轿厢、轿顶、坑底五方对讲通话。无须布线大量节约了昂贵的线路成本；无须布线大量节约了线路铺设高额的施工成本；大量节约了由于线路故障、老化等因素而带来的维护成本；完全杜绝了由于铺设线路而带来的对楼宇及道路的破坏；监控中心位置可以根据需要任意调整，无需任何线路调整；整个系统施工极为简单、施工周期短、见效快。&lt;/p&gt;&lt;p&gt;\r\n	2、机房分机功能介绍&lt;/p&gt;&lt;p&gt;\r\n	1） 一栋楼只需要用一个分机，分机最多可带三部电梯；&lt;/p&gt;&lt;p&gt;\r\n	2）GSM网络通讯，真正达到电信级别通话质量；&lt;/p&gt;&lt;p&gt;\r\n	3） 抗干扰和防雷性强，不会受到雷雨天气影响。&lt;/p&gt;&lt;p&gt;\r\n	4）&amp;nbsp; 安装简单操作易懂。&lt;/p&gt;&lt;p&gt;\r\n	三、GSM电梯无线对讲系统使用方法&lt;/p&gt;&lt;p&gt;\r\n	1、电梯呼叫值班人员&lt;/p&gt;&lt;p&gt;\r\n	当电梯困人时，被困乘客只需轻按&amp;amp;ldquo;呼叫&amp;amp;rdquo;键，求救信号立即发送给值班人员。&lt;/p&gt;&lt;p&gt;\r\n	2、挂断呼叫&lt;/p&gt;&lt;p&gt;\r\n	通话结束后，按&amp;amp;ldquo;确认&amp;amp;rdquo;键挂断通话，并将手柄放回原位。&lt;/p&gt;', '{\"file\":[\"6\",\"7\"],\"title\":[\"1-19102qa0400-l\",\"1-19102QRA9\"],\"description\":[\"\",\"\"]}');
INSERT INTO `dr_1_photo_data_0` VALUES ('28', '1', '8', '&lt;p&gt;\r\n	GSM电梯无线对讲呼叫系统产品是我公司推出的第五代产品，机房用无线GSM分机与管理中心通话，无需布线减少日常使用的维护成本，为管理中心提供了一个全面对讲呼叫的解决方案；采用了先进的微芯片技术，特别根据用户使用习惯进行优化设计，我们相信这个易于使用的无线对讲系统将给你带来方便稳定可靠的通讯。&lt;/p&gt;&lt;p&gt;\r\n	二、GSM电梯无线对讲系统功能介绍&lt;/p&gt;&lt;p&gt;\r\n	&amp;nbsp;1、系统功能简述&lt;/p&gt;&lt;p&gt;\r\n	当电梯使用过程中发生故障停机或停电困人等意外情况时电梯乘客可轻按&amp;amp;ldquo;呼叫&amp;amp;rdquo;键向值班室发出呼叫信号，电梯轿厢将自动播放提前录制的警示语音。此时，值班人员手机接到电梯呼叫电话，通过电话沟通，采取施救措施。&lt;/p&gt;&lt;p&gt;\r\n	特点：采用GSM卡网络，移动联通都皆可，信号强，无干扰，没有距离限制，可实现千里之外也可通话，可连接无限量的电梯台数，即，可讲几个小区合并一个值班室，减少人力和物力成本。系统可存储5组号码，可以直接呼叫到值班室座机，当值班室无人值守时，则可向另外电话号码或指定手机发出求救信号，确保与外界保持持续通讯，可确保电梯被困人员定能于外界通讯。&lt;/p&gt;&lt;p&gt;\r\n	优势：一键式呼叫、方便快捷，能有效解决监控中心、机房、轿厢、轿顶、坑底五方对讲通话。无须布线大量节约了昂贵的线路成本；无须布线大量节约了线路铺设高额的施工成本；大量节约了由于线路故障、老化等因素而带来的维护成本；完全杜绝了由于铺设线路而带来的对楼宇及道路的破坏；监控中心位置可以根据需要任意调整，无需任何线路调整；整个系统施工极为简单、施工周期短、见效快。&lt;/p&gt;&lt;p&gt;\r\n	2、机房分机功能介绍&lt;/p&gt;&lt;p&gt;\r\n	1） 一栋楼只需要用一个分机，分机最多可带三部电梯；&lt;/p&gt;&lt;p&gt;\r\n	2）GSM网络通讯，真正达到电信级别通话质量；&lt;/p&gt;&lt;p&gt;\r\n	3） 抗干扰和防雷性强，不会受到雷雨天气影响。&lt;/p&gt;&lt;p&gt;\r\n	4）&amp;nbsp; 安装简单操作易懂。&lt;/p&gt;&lt;p&gt;\r\n	三、GSM电梯无线对讲系统使用方法&lt;/p&gt;&lt;p&gt;\r\n	1、电梯呼叫值班人员&lt;/p&gt;&lt;p&gt;\r\n	当电梯困人时，被困乘客只需轻按&amp;amp;ldquo;呼叫&amp;amp;rdquo;键，求救信号立即发送给值班人员。&lt;/p&gt;&lt;p&gt;\r\n	2、挂断呼叫&lt;/p&gt;&lt;p&gt;\r\n	通话结束后，按&amp;amp;ldquo;确认&amp;amp;rdquo;键挂断通话，并将手柄放回原位。&lt;/p&gt;', '{\"file\":[\"7\",\"8\"],\"title\":[\"1-19102QRA9\",\"1-19102QRF0\"],\"description\":[\"\",\"\"]}');
INSERT INTO `dr_1_photo_data_0` VALUES ('29', '1', '9', '&lt;p&gt;\r\n	GSM电梯无线对讲呼叫系统产品是我公司推出的第五代产品，机房用无线GSM分机与管理中心通话，无需布线减少日常使用的维护成本，为管理中心提供了一个全面对讲呼叫的解决方案；采用了先进的微芯片技术，特别根据用户使用习惯进行优化设计，我们相信这个易于使用的无线对讲系统将给你带来方便稳定可靠的通讯。&lt;/p&gt;&lt;p&gt;\r\n	二、GSM电梯无线对讲系统功能介绍&lt;/p&gt;&lt;p&gt;\r\n	&amp;nbsp;1、系统功能简述&lt;/p&gt;&lt;p&gt;\r\n	当电梯使用过程中发生故障停机或停电困人等意外情况时电梯乘客可轻按&amp;amp;ldquo;呼叫&amp;amp;rdquo;键向值班室发出呼叫信号，电梯轿厢将自动播放提前录制的警示语音。此时，值班人员手机接到电梯呼叫电话，通过电话沟通，采取施救措施。&lt;/p&gt;&lt;p&gt;\r\n	特点：采用GSM卡网络，移动联通都皆可，信号强，无干扰，没有距离限制，可实现千里之外也可通话，可连接无限量的电梯台数，即，可讲几个小区合并一个值班室，减少人力和物力成本。系统可存储5组号码，可以直接呼叫到值班室座机，当值班室无人值守时，则可向另外电话号码或指定手机发出求救信号，确保与外界保持持续通讯，可确保电梯被困人员定能于外界通讯。&lt;/p&gt;&lt;p&gt;\r\n	优势：一键式呼叫、方便快捷，能有效解决监控中心、机房、轿厢、轿顶、坑底五方对讲通话。无须布线大量节约了昂贵的线路成本；无须布线大量节约了线路铺设高额的施工成本；大量节约了由于线路故障、老化等因素而带来的维护成本；完全杜绝了由于铺设线路而带来的对楼宇及道路的破坏；监控中心位置可以根据需要任意调整，无需任何线路调整；整个系统施工极为简单、施工周期短、见效快。&lt;/p&gt;&lt;p&gt;\r\n	2、机房分机功能介绍&lt;/p&gt;&lt;p&gt;\r\n	1） 一栋楼只需要用一个分机，分机最多可带三部电梯；&lt;/p&gt;&lt;p&gt;\r\n	2）GSM网络通讯，真正达到电信级别通话质量；&lt;/p&gt;&lt;p&gt;\r\n	3） 抗干扰和防雷性强，不会受到雷雨天气影响。&lt;/p&gt;&lt;p&gt;\r\n	4）&amp;nbsp; 安装简单操作易懂。&lt;/p&gt;&lt;p&gt;\r\n	三、GSM电梯无线对讲系统使用方法&lt;/p&gt;&lt;p&gt;\r\n	1、电梯呼叫值班人员&lt;/p&gt;&lt;p&gt;\r\n	当电梯困人时，被困乘客只需轻按&amp;amp;ldquo;呼叫&amp;amp;rdquo;键，求救信号立即发送给值班人员。&lt;/p&gt;&lt;p&gt;\r\n	2、挂断呼叫&lt;/p&gt;&lt;p&gt;\r\n	通话结束后，按&amp;amp;ldquo;确认&amp;amp;rdquo;键挂断通话，并将手柄放回原位。&lt;/p&gt;', '{\"file\":[\"7\",\"8\"],\"title\":[\"1-19102QRA9\",\"1-19102QRF0\"],\"description\":[\"\",\"\"]}');
INSERT INTO `dr_1_photo_data_0` VALUES ('30', '1', '9', '&lt;p&gt;\r\n	GSM电梯无线对讲呼叫系统产品是我公司推出的第五代产品，机房用无线GSM分机与管理中心通话，无需布线减少日常使用的维护成本，为管理中心提供了一个全面对讲呼叫的解决方案；采用了先进的微芯片技术，特别根据用户使用习惯进行优化设计，我们相信这个易于使用的无线对讲系统将给你带来方便稳定可靠的通讯。&lt;/p&gt;&lt;p&gt;\r\n	二、GSM电梯无线对讲系统功能介绍&lt;/p&gt;&lt;p&gt;\r\n	&amp;nbsp;1、系统功能简述&lt;/p&gt;&lt;p&gt;\r\n	当电梯使用过程中发生故障停机或停电困人等意外情况时电梯乘客可轻按&amp;amp;ldquo;呼叫&amp;amp;rdquo;键向值班室发出呼叫信号，电梯轿厢将自动播放提前录制的警示语音。此时，值班人员手机接到电梯呼叫电话，通过电话沟通，采取施救措施。&lt;/p&gt;&lt;p&gt;\r\n	特点：采用GSM卡网络，移动联通都皆可，信号强，无干扰，没有距离限制，可实现千里之外也可通话，可连接无限量的电梯台数，即，可讲几个小区合并一个值班室，减少人力和物力成本。系统可存储5组号码，可以直接呼叫到值班室座机，当值班室无人值守时，则可向另外电话号码或指定手机发出求救信号，确保与外界保持持续通讯，可确保电梯被困人员定能于外界通讯。&lt;/p&gt;&lt;p&gt;\r\n	优势：一键式呼叫、方便快捷，能有效解决监控中心、机房、轿厢、轿顶、坑底五方对讲通话。无须布线大量节约了昂贵的线路成本；无须布线大量节约了线路铺设高额的施工成本；大量节约了由于线路故障、老化等因素而带来的维护成本；完全杜绝了由于铺设线路而带来的对楼宇及道路的破坏；监控中心位置可以根据需要任意调整，无需任何线路调整；整个系统施工极为简单、施工周期短、见效快。&lt;/p&gt;&lt;p&gt;\r\n	2、机房分机功能介绍&lt;/p&gt;&lt;p&gt;\r\n	1） 一栋楼只需要用一个分机，分机最多可带三部电梯；&lt;/p&gt;&lt;p&gt;\r\n	2）GSM网络通讯，真正达到电信级别通话质量；&lt;/p&gt;&lt;p&gt;\r\n	3） 抗干扰和防雷性强，不会受到雷雨天气影响。&lt;/p&gt;&lt;p&gt;\r\n	4）&amp;nbsp; 安装简单操作易懂。&lt;/p&gt;&lt;p&gt;\r\n	三、GSM电梯无线对讲系统使用方法&lt;/p&gt;&lt;p&gt;\r\n	1、电梯呼叫值班人员&lt;/p&gt;&lt;p&gt;\r\n	当电梯困人时，被困乘客只需轻按&amp;amp;ldquo;呼叫&amp;amp;rdquo;键，求救信号立即发送给值班人员。&lt;/p&gt;&lt;p&gt;\r\n	2、挂断呼叫&lt;/p&gt;&lt;p&gt;\r\n	通话结束后，按&amp;amp;ldquo;确认&amp;amp;rdquo;键挂断通话，并将手柄放回原位。&lt;/p&gt;', '{\"file\":[\"7\",\"8\"],\"title\":[\"1-19102QRA9\",\"1-19102QRF0\"],\"description\":[\"\",\"\"]}');
INSERT INTO `dr_1_photo_data_0` VALUES ('31', '1', '9', '&lt;p&gt;\r\n	GSM电梯无线对讲呼叫系统产品是我公司推出的第五代产品，机房用无线GSM分机与管理中心通话，无需布线减少日常使用的维护成本，为管理中心提供了一个全面对讲呼叫的解决方案；采用了先进的微芯片技术，特别根据用户使用习惯进行优化设计，我们相信这个易于使用的无线对讲系统将给你带来方便稳定可靠的通讯。&lt;/p&gt;&lt;p&gt;\r\n	二、GSM电梯无线对讲系统功能介绍&lt;/p&gt;&lt;p&gt;\r\n	&amp;nbsp;1、系统功能简述&lt;/p&gt;&lt;p&gt;\r\n	当电梯使用过程中发生故障停机或停电困人等意外情况时电梯乘客可轻按&amp;amp;ldquo;呼叫&amp;amp;rdquo;键向值班室发出呼叫信号，电梯轿厢将自动播放提前录制的警示语音。此时，值班人员手机接到电梯呼叫电话，通过电话沟通，采取施救措施。&lt;/p&gt;&lt;p&gt;\r\n	特点：采用GSM卡网络，移动联通都皆可，信号强，无干扰，没有距离限制，可实现千里之外也可通话，可连接无限量的电梯台数，即，可讲几个小区合并一个值班室，减少人力和物力成本。系统可存储5组号码，可以直接呼叫到值班室座机，当值班室无人值守时，则可向另外电话号码或指定手机发出求救信号，确保与外界保持持续通讯，可确保电梯被困人员定能于外界通讯。&lt;/p&gt;&lt;p&gt;\r\n	优势：一键式呼叫、方便快捷，能有效解决监控中心、机房、轿厢、轿顶、坑底五方对讲通话。无须布线大量节约了昂贵的线路成本；无须布线大量节约了线路铺设高额的施工成本；大量节约了由于线路故障、老化等因素而带来的维护成本；完全杜绝了由于铺设线路而带来的对楼宇及道路的破坏；监控中心位置可以根据需要任意调整，无需任何线路调整；整个系统施工极为简单、施工周期短、见效快。&lt;/p&gt;&lt;p&gt;\r\n	2、机房分机功能介绍&lt;/p&gt;&lt;p&gt;\r\n	1） 一栋楼只需要用一个分机，分机最多可带三部电梯；&lt;/p&gt;&lt;p&gt;\r\n	2）GSM网络通讯，真正达到电信级别通话质量；&lt;/p&gt;&lt;p&gt;\r\n	3） 抗干扰和防雷性强，不会受到雷雨天气影响。&lt;/p&gt;&lt;p&gt;\r\n	4）&amp;nbsp; 安装简单操作易懂。&lt;/p&gt;&lt;p&gt;\r\n	三、GSM电梯无线对讲系统使用方法&lt;/p&gt;&lt;p&gt;\r\n	1、电梯呼叫值班人员&lt;/p&gt;&lt;p&gt;\r\n	当电梯困人时，被困乘客只需轻按&amp;amp;ldquo;呼叫&amp;amp;rdquo;键，求救信号立即发送给值班人员。&lt;/p&gt;&lt;p&gt;\r\n	2、挂断呼叫&lt;/p&gt;&lt;p&gt;\r\n	通话结束后，按&amp;amp;ldquo;确认&amp;amp;rdquo;键挂断通话，并将手柄放回原位。&lt;/p&gt;', '{\"file\":[\"7\",\"8\"],\"title\":[\"1-19102QRA9\",\"1-19102QRF0\"],\"description\":[\"\",\"\"]}');
INSERT INTO `dr_1_photo_data_0` VALUES ('32', '1', '9', '&lt;p&gt;\r\n	GSM电梯无线对讲呼叫系统产品是我公司推出的第五代产品，机房用无线GSM分机与管理中心通话，无需布线减少日常使用的维护成本，为管理中心提供了一个全面对讲呼叫的解决方案；采用了先进的微芯片技术，特别根据用户使用习惯进行优化设计，我们相信这个易于使用的无线对讲系统将给你带来方便稳定可靠的通讯。&lt;/p&gt;&lt;p&gt;\r\n	二、GSM电梯无线对讲系统功能介绍&lt;/p&gt;&lt;p&gt;\r\n	&amp;nbsp;1、系统功能简述&lt;/p&gt;&lt;p&gt;\r\n	当电梯使用过程中发生故障停机或停电困人等意外情况时电梯乘客可轻按&amp;amp;ldquo;呼叫&amp;amp;rdquo;键向值班室发出呼叫信号，电梯轿厢将自动播放提前录制的警示语音。此时，值班人员手机接到电梯呼叫电话，通过电话沟通，采取施救措施。&lt;/p&gt;&lt;p&gt;\r\n	特点：采用GSM卡网络，移动联通都皆可，信号强，无干扰，没有距离限制，可实现千里之外也可通话，可连接无限量的电梯台数，即，可讲几个小区合并一个值班室，减少人力和物力成本。系统可存储5组号码，可以直接呼叫到值班室座机，当值班室无人值守时，则可向另外电话号码或指定手机发出求救信号，确保与外界保持持续通讯，可确保电梯被困人员定能于外界通讯。&lt;/p&gt;&lt;p&gt;\r\n	优势：一键式呼叫、方便快捷，能有效解决监控中心、机房、轿厢、轿顶、坑底五方对讲通话。无须布线大量节约了昂贵的线路成本；无须布线大量节约了线路铺设高额的施工成本；大量节约了由于线路故障、老化等因素而带来的维护成本；完全杜绝了由于铺设线路而带来的对楼宇及道路的破坏；监控中心位置可以根据需要任意调整，无需任何线路调整；整个系统施工极为简单、施工周期短、见效快。&lt;/p&gt;&lt;p&gt;\r\n	2、机房分机功能介绍&lt;/p&gt;&lt;p&gt;\r\n	1） 一栋楼只需要用一个分机，分机最多可带三部电梯；&lt;/p&gt;&lt;p&gt;\r\n	2）GSM网络通讯，真正达到电信级别通话质量；&lt;/p&gt;&lt;p&gt;\r\n	3） 抗干扰和防雷性强，不会受到雷雨天气影响。&lt;/p&gt;&lt;p&gt;\r\n	4）&amp;nbsp; 安装简单操作易懂。&lt;/p&gt;&lt;p&gt;\r\n	三、GSM电梯无线对讲系统使用方法&lt;/p&gt;&lt;p&gt;\r\n	1、电梯呼叫值班人员&lt;/p&gt;&lt;p&gt;\r\n	当电梯困人时，被困乘客只需轻按&amp;amp;ldquo;呼叫&amp;amp;rdquo;键，求救信号立即发送给值班人员。&lt;/p&gt;&lt;p&gt;\r\n	2、挂断呼叫&lt;/p&gt;&lt;p&gt;\r\n	通话结束后，按&amp;amp;ldquo;确认&amp;amp;rdquo;键挂断通话，并将手柄放回原位。&lt;/p&gt;', '{\"file\":[\"7\",\"8\"],\"title\":[\"1-19102QRA9\",\"1-19102QRF0\"],\"description\":[\"\",\"\"]}');
INSERT INTO `dr_1_photo_data_0` VALUES ('33', '1', '10', '&lt;p&gt;\r\n	GSM电梯无线对讲呼叫系统产品是我公司推出的第五代产品，机房用无线GSM分机与管理中心通话，无需布线减少日常使用的维护成本，为管理中心提供了一个全面对讲呼叫的解决方案；采用了先进的微芯片技术，特别根据用户使用习惯进行优化设计，我们相信这个易于使用的无线对讲系统将给你带来方便稳定可靠的通讯。&lt;/p&gt;&lt;p&gt;\r\n	二、GSM电梯无线对讲系统功能介绍&lt;/p&gt;&lt;p&gt;\r\n	&amp;nbsp;1、系统功能简述&lt;/p&gt;&lt;p&gt;\r\n	当电梯使用过程中发生故障停机或停电困人等意外情况时电梯乘客可轻按&amp;amp;ldquo;呼叫&amp;amp;rdquo;键向值班室发出呼叫信号，电梯轿厢将自动播放提前录制的警示语音。此时，值班人员手机接到电梯呼叫电话，通过电话沟通，采取施救措施。&lt;/p&gt;&lt;p&gt;\r\n	特点：采用GSM卡网络，移动联通都皆可，信号强，无干扰，没有距离限制，可实现千里之外也可通话，可连接无限量的电梯台数，即，可讲几个小区合并一个值班室，减少人力和物力成本。系统可存储5组号码，可以直接呼叫到值班室座机，当值班室无人值守时，则可向另外电话号码或指定手机发出求救信号，确保与外界保持持续通讯，可确保电梯被困人员定能于外界通讯。&lt;/p&gt;&lt;p&gt;\r\n	优势：一键式呼叫、方便快捷，能有效解决监控中心、机房、轿厢、轿顶、坑底五方对讲通话。无须布线大量节约了昂贵的线路成本；无须布线大量节约了线路铺设高额的施工成本；大量节约了由于线路故障、老化等因素而带来的维护成本；完全杜绝了由于铺设线路而带来的对楼宇及道路的破坏；监控中心位置可以根据需要任意调整，无需任何线路调整；整个系统施工极为简单、施工周期短、见效快。&lt;/p&gt;&lt;p&gt;\r\n	2、机房分机功能介绍&lt;/p&gt;&lt;p&gt;\r\n	1） 一栋楼只需要用一个分机，分机最多可带三部电梯；&lt;/p&gt;&lt;p&gt;\r\n	2）GSM网络通讯，真正达到电信级别通话质量；&lt;/p&gt;&lt;p&gt;\r\n	3） 抗干扰和防雷性强，不会受到雷雨天气影响。&lt;/p&gt;&lt;p&gt;\r\n	4）&amp;nbsp; 安装简单操作易懂。&lt;/p&gt;&lt;p&gt;\r\n	三、GSM电梯无线对讲系统使用方法&lt;/p&gt;&lt;p&gt;\r\n	1、电梯呼叫值班人员&lt;/p&gt;&lt;p&gt;\r\n	当电梯困人时，被困乘客只需轻按&amp;amp;ldquo;呼叫&amp;amp;rdquo;键，求救信号立即发送给值班人员。&lt;/p&gt;&lt;p&gt;\r\n	2、挂断呼叫&lt;/p&gt;&lt;p&gt;\r\n	通话结束后，按&amp;amp;ldquo;确认&amp;amp;rdquo;键挂断通话，并将手柄放回原位。&lt;/p&gt;', '{\"file\":[\"8\"],\"title\":[\"1-19102QRF0\"],\"description\":[\"\"]}');
INSERT INTO `dr_1_photo_data_0` VALUES ('34', '1', '10', '&lt;p&gt;\r\n	GSM电梯无线对讲呼叫系统产品是我公司推出的第五代产品，机房用无线GSM分机与管理中心通话，无需布线减少日常使用的维护成本，为管理中心提供了一个全面对讲呼叫的解决方案；采用了先进的微芯片技术，特别根据用户使用习惯进行优化设计，我们相信这个易于使用的无线对讲系统将给你带来方便稳定可靠的通讯。&lt;/p&gt;&lt;p&gt;\r\n	二、GSM电梯无线对讲系统功能介绍&lt;/p&gt;&lt;p&gt;\r\n	&amp;nbsp;1、系统功能简述&lt;/p&gt;&lt;p&gt;\r\n	当电梯使用过程中发生故障停机或停电困人等意外情况时电梯乘客可轻按&amp;amp;ldquo;呼叫&amp;amp;rdquo;键向值班室发出呼叫信号，电梯轿厢将自动播放提前录制的警示语音。此时，值班人员手机接到电梯呼叫电话，通过电话沟通，采取施救措施。&lt;/p&gt;&lt;p&gt;\r\n	特点：采用GSM卡网络，移动联通都皆可，信号强，无干扰，没有距离限制，可实现千里之外也可通话，可连接无限量的电梯台数，即，可讲几个小区合并一个值班室，减少人力和物力成本。系统可存储5组号码，可以直接呼叫到值班室座机，当值班室无人值守时，则可向另外电话号码或指定手机发出求救信号，确保与外界保持持续通讯，可确保电梯被困人员定能于外界通讯。&lt;/p&gt;&lt;p&gt;\r\n	优势：一键式呼叫、方便快捷，能有效解决监控中心、机房、轿厢、轿顶、坑底五方对讲通话。无须布线大量节约了昂贵的线路成本；无须布线大量节约了线路铺设高额的施工成本；大量节约了由于线路故障、老化等因素而带来的维护成本；完全杜绝了由于铺设线路而带来的对楼宇及道路的破坏；监控中心位置可以根据需要任意调整，无需任何线路调整；整个系统施工极为简单、施工周期短、见效快。&lt;/p&gt;&lt;p&gt;\r\n	2、机房分机功能介绍&lt;/p&gt;&lt;p&gt;\r\n	1） 一栋楼只需要用一个分机，分机最多可带三部电梯；&lt;/p&gt;&lt;p&gt;\r\n	2）GSM网络通讯，真正达到电信级别通话质量；&lt;/p&gt;&lt;p&gt;\r\n	3） 抗干扰和防雷性强，不会受到雷雨天气影响。&lt;/p&gt;&lt;p&gt;\r\n	4）&amp;nbsp; 安装简单操作易懂。&lt;/p&gt;&lt;p&gt;\r\n	三、GSM电梯无线对讲系统使用方法&lt;/p&gt;&lt;p&gt;\r\n	1、电梯呼叫值班人员&lt;/p&gt;&lt;p&gt;\r\n	当电梯困人时，被困乘客只需轻按&amp;amp;ldquo;呼叫&amp;amp;rdquo;键，求救信号立即发送给值班人员。&lt;/p&gt;&lt;p&gt;\r\n	2、挂断呼叫&lt;/p&gt;&lt;p&gt;\r\n	通话结束后，按&amp;amp;ldquo;确认&amp;amp;rdquo;键挂断通话，并将手柄放回原位。&lt;/p&gt;', '{\"file\":[\"7\",\"8\"],\"title\":[\"1-19102QRA9\",\"1-19102QRF0\"],\"description\":[\"\",\"\"]}');
INSERT INTO `dr_1_photo_data_0` VALUES ('35', '1', '11', '&lt;p&gt;\r\n	GSM电梯无线对讲呼叫系统产品是我公司推出的第五代产品，机房用无线GSM分机与管理中心通话，无需布线减少日常使用的维护成本，为管理中心提供了一个全面对讲呼叫的解决方案；采用了先进的微芯片技术，特别根据用户使用习惯进行优化设计，我们相信这个易于使用的无线对讲系统将给你带来方便稳定可靠的通讯。&lt;/p&gt;&lt;p&gt;\r\n	二、GSM电梯无线对讲系统功能介绍&lt;/p&gt;&lt;p&gt;\r\n	&amp;nbsp;1、系统功能简述&lt;/p&gt;&lt;p&gt;\r\n	当电梯使用过程中发生故障停机或停电困人等意外情况时电梯乘客可轻按&amp;amp;ldquo;呼叫&amp;amp;rdquo;键向值班室发出呼叫信号，电梯轿厢将自动播放提前录制的警示语音。此时，值班人员手机接到电梯呼叫电话，通过电话沟通，采取施救措施。&lt;/p&gt;&lt;p&gt;\r\n	特点：采用GSM卡网络，移动联通都皆可，信号强，无干扰，没有距离限制，可实现千里之外也可通话，可连接无限量的电梯台数，即，可讲几个小区合并一个值班室，减少人力和物力成本。系统可存储5组号码，可以直接呼叫到值班室座机，当值班室无人值守时，则可向另外电话号码或指定手机发出求救信号，确保与外界保持持续通讯，可确保电梯被困人员定能于外界通讯。&lt;/p&gt;&lt;p&gt;\r\n	优势：一键式呼叫、方便快捷，能有效解决监控中心、机房、轿厢、轿顶、坑底五方对讲通话。无须布线大量节约了昂贵的线路成本；无须布线大量节约了线路铺设高额的施工成本；大量节约了由于线路故障、老化等因素而带来的维护成本；完全杜绝了由于铺设线路而带来的对楼宇及道路的破坏；监控中心位置可以根据需要任意调整，无需任何线路调整；整个系统施工极为简单、施工周期短、见效快。&lt;/p&gt;&lt;p&gt;\r\n	2、机房分机功能介绍&lt;/p&gt;&lt;p&gt;\r\n	1） 一栋楼只需要用一个分机，分机最多可带三部电梯；&lt;/p&gt;&lt;p&gt;\r\n	2）GSM网络通讯，真正达到电信级别通话质量；&lt;/p&gt;&lt;p&gt;\r\n	3） 抗干扰和防雷性强，不会受到雷雨天气影响。&lt;/p&gt;&lt;p&gt;\r\n	4）&amp;nbsp; 安装简单操作易懂。&lt;/p&gt;&lt;p&gt;\r\n	三、GSM电梯无线对讲系统使用方法&lt;/p&gt;&lt;p&gt;\r\n	1、电梯呼叫值班人员&lt;/p&gt;&lt;p&gt;\r\n	当电梯困人时，被困乘客只需轻按&amp;amp;ldquo;呼叫&amp;amp;rdquo;键，求救信号立即发送给值班人员。&lt;/p&gt;&lt;p&gt;\r\n	2、挂断呼叫&lt;/p&gt;&lt;p&gt;\r\n	通话结束后，按&amp;amp;ldquo;确认&amp;amp;rdquo;键挂断通话，并将手柄放回原位。&lt;/p&gt;', '{\"file\":[\"7\",\"8\"],\"title\":[\"1-19102QRA9\",\"1-19102QRF0\"],\"description\":[\"\",\"\"]}');
INSERT INTO `dr_1_photo_data_0` VALUES ('36', '1', '11', '&lt;p&gt;\r\n	GSM电梯无线对讲呼叫系统产品是我公司推出的第五代产品，机房用无线GSM分机与管理中心通话，无需布线减少日常使用的维护成本，为管理中心提供了一个全面对讲呼叫的解决方案；采用了先进的微芯片技术，特别根据用户使用习惯进行优化设计，我们相信这个易于使用的无线对讲系统将给你带来方便稳定可靠的通讯。&lt;/p&gt;&lt;p&gt;\r\n	二、GSM电梯无线对讲系统功能介绍&lt;/p&gt;&lt;p&gt;\r\n	&amp;nbsp;1、系统功能简述&lt;/p&gt;&lt;p&gt;\r\n	当电梯使用过程中发生故障停机或停电困人等意外情况时电梯乘客可轻按&amp;amp;ldquo;呼叫&amp;amp;rdquo;键向值班室发出呼叫信号，电梯轿厢将自动播放提前录制的警示语音。此时，值班人员手机接到电梯呼叫电话，通过电话沟通，采取施救措施。&lt;/p&gt;&lt;p&gt;\r\n	特点：采用GSM卡网络，移动联通都皆可，信号强，无干扰，没有距离限制，可实现千里之外也可通话，可连接无限量的电梯台数，即，可讲几个小区合并一个值班室，减少人力和物力成本。系统可存储5组号码，可以直接呼叫到值班室座机，当值班室无人值守时，则可向另外电话号码或指定手机发出求救信号，确保与外界保持持续通讯，可确保电梯被困人员定能于外界通讯。&lt;/p&gt;&lt;p&gt;\r\n	优势：一键式呼叫、方便快捷，能有效解决监控中心、机房、轿厢、轿顶、坑底五方对讲通话。无须布线大量节约了昂贵的线路成本；无须布线大量节约了线路铺设高额的施工成本；大量节约了由于线路故障、老化等因素而带来的维护成本；完全杜绝了由于铺设线路而带来的对楼宇及道路的破坏；监控中心位置可以根据需要任意调整，无需任何线路调整；整个系统施工极为简单、施工周期短、见效快。&lt;/p&gt;&lt;p&gt;\r\n	2、机房分机功能介绍&lt;/p&gt;&lt;p&gt;\r\n	1） 一栋楼只需要用一个分机，分机最多可带三部电梯；&lt;/p&gt;&lt;p&gt;\r\n	2）GSM网络通讯，真正达到电信级别通话质量；&lt;/p&gt;&lt;p&gt;\r\n	3） 抗干扰和防雷性强，不会受到雷雨天气影响。&lt;/p&gt;&lt;p&gt;\r\n	4）&amp;nbsp; 安装简单操作易懂。&lt;/p&gt;&lt;p&gt;\r\n	三、GSM电梯无线对讲系统使用方法&lt;/p&gt;&lt;p&gt;\r\n	1、电梯呼叫值班人员&lt;/p&gt;&lt;p&gt;\r\n	当电梯困人时，被困乘客只需轻按&amp;amp;ldquo;呼叫&amp;amp;rdquo;键，求救信号立即发送给值班人员。&lt;/p&gt;&lt;p&gt;\r\n	2、挂断呼叫&lt;/p&gt;&lt;p&gt;\r\n	通话结束后，按&amp;amp;ldquo;确认&amp;amp;rdquo;键挂断通话，并将手柄放回原位。&lt;/p&gt;', '{\"file\":[\"7\",\"8\"],\"title\":[\"1-19102QRA9\",\"1-19102QRF0\"],\"description\":[\"\",\"\"]}');

-- ----------------------------
-- Table structure for dr_1_photo_draft
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_photo_draft`;
CREATE TABLE `dr_1_photo_draft` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `catid` (`catid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容草稿表';

-- ----------------------------
-- Records of dr_1_photo_draft
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_photo_flag
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_photo_flag`;
CREATE TABLE `dr_1_photo_flag` (
  `flag` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '文档标记id',
  `id` int(10) unsigned NOT NULL COMMENT '文档内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  KEY `flag` (`flag`,`id`,`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='标记表';

-- ----------------------------
-- Records of dr_1_photo_flag
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_photo_hits
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_photo_hits`;
CREATE TABLE `dr_1_photo_hits` (
  `id` int(10) unsigned NOT NULL COMMENT '文章id',
  `hits` int(10) unsigned NOT NULL COMMENT '总点击数',
  `day_hits` int(10) unsigned NOT NULL COMMENT '本日点击',
  `week_hits` int(10) unsigned NOT NULL COMMENT '本周点击',
  `month_hits` int(10) unsigned NOT NULL COMMENT '本月点击',
  `year_hits` int(10) unsigned NOT NULL COMMENT '年点击量',
  UNIQUE KEY `id` (`id`),
  KEY `day_hits` (`day_hits`),
  KEY `week_hits` (`week_hits`),
  KEY `month_hits` (`month_hits`),
  KEY `year_hits` (`year_hits`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='时段点击量统计';

-- ----------------------------
-- Records of dr_1_photo_hits
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_photo_index
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_photo_index`;
CREATE TABLE `dr_1_photo_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='内容索引表';

-- ----------------------------
-- Records of dr_1_photo_index
-- ----------------------------
INSERT INTO `dr_1_photo_index` VALUES ('25', '1', '8', '9', '1573192667');
INSERT INTO `dr_1_photo_index` VALUES ('26', '1', '8', '9', '1573193004');
INSERT INTO `dr_1_photo_index` VALUES ('27', '1', '8', '9', '1573193086');
INSERT INTO `dr_1_photo_index` VALUES ('28', '1', '8', '9', '1573193119');
INSERT INTO `dr_1_photo_index` VALUES ('29', '1', '9', '9', '1573193148');
INSERT INTO `dr_1_photo_index` VALUES ('30', '1', '9', '9', '1573193174');
INSERT INTO `dr_1_photo_index` VALUES ('31', '1', '9', '9', '1573193266');
INSERT INTO `dr_1_photo_index` VALUES ('32', '1', '9', '9', '1573193294');
INSERT INTO `dr_1_photo_index` VALUES ('33', '1', '10', '9', '1573193319');
INSERT INTO `dr_1_photo_index` VALUES ('34', '1', '10', '9', '1573193340');
INSERT INTO `dr_1_photo_index` VALUES ('35', '1', '11', '9', '1573193364');
INSERT INTO `dr_1_photo_index` VALUES ('36', '1', '11', '9', '1573193385');

-- ----------------------------
-- Table structure for dr_1_photo_recycle
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_photo_recycle`;
CREATE TABLE `dr_1_photo_recycle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `result` text NOT NULL COMMENT '删除理由',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `catid` (`catid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容回收站表';

-- ----------------------------
-- Records of dr_1_photo_recycle
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_photo_search
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_photo_search`;
CREATE TABLE `dr_1_photo_search` (
  `id` varchar(32) NOT NULL,
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `params` text NOT NULL COMMENT '参数数组',
  `keyword` varchar(255) NOT NULL COMMENT '关键字',
  `contentid` mediumtext NOT NULL COMMENT 'id集合',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `catid` (`catid`),
  KEY `keyword` (`keyword`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='搜索表';

-- ----------------------------
-- Records of dr_1_photo_search
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_photo_time
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_photo_time`;
CREATE TABLE `dr_1_photo_time` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `result` text NOT NULL COMMENT '处理结果',
  `posttime` int(10) unsigned NOT NULL COMMENT '定时发布时间',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `posttime` (`posttime`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容定时发布表';

-- ----------------------------
-- Records of dr_1_photo_time
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_photo_verify
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_photo_verify`;
CREATE TABLE `dr_1_photo_verify` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `isnew` tinyint(1) unsigned NOT NULL COMMENT '是否新增',
  `author` varchar(50) NOT NULL COMMENT '作者',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `backuid` mediumint(8) unsigned NOT NULL COMMENT '操作人uid',
  `backinfo` text NOT NULL COMMENT '操作退回信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`),
  KEY `backuid` (`backuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容审核表';

-- ----------------------------
-- Records of dr_1_photo_verify
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_question
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_question`;
CREATE TABLE `dr_1_question` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `title` varchar(255) DEFAULT NULL COMMENT '主题',
  `thumb` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` text COMMENT '描述',
  `hits` int(10) unsigned DEFAULT NULL COMMENT '浏览数',
  `uid` int(10) unsigned NOT NULL COMMENT '作者id',
  `author` varchar(50) NOT NULL COMMENT '作者名称',
  `status` tinyint(2) NOT NULL COMMENT '状态',
  `url` varchar(255) DEFAULT NULL COMMENT '地址',
  `link_id` int(10) NOT NULL DEFAULT '0' COMMENT '同步id',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '附表id',
  `inputip` varchar(15) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `updatetime` int(10) unsigned NOT NULL COMMENT '更新时间',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数量',
  `avgsort` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '平均点评分数',
  `displayorder` int(10) DEFAULT '0' COMMENT '排序值',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`,`updatetime`),
  KEY `link_id` (`link_id`),
  KEY `comments` (`comments`),
  KEY `avgsort` (`avgsort`),
  KEY `status` (`status`),
  KEY `updatetime` (`updatetime`),
  KEY `hits` (`hits`),
  KEY `displayorder` (`displayorder`,`updatetime`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='内容主表';

-- ----------------------------
-- Records of dr_1_question
-- ----------------------------
INSERT INTO `dr_1_question` VALUES ('42', '25', '新建用户时，发现邮箱已经被注册怎么办？', null, '', '如果您发现某个邮箱已经被注册，请您用其它有效邮箱注册智联帐户。', '1', '1', 'admin', '9', '/index.php?c=show&id=42', '0', '0', '127.0.0.1', '1573365238', '1573365255', '0', '0.00', '0');
INSERT INTO `dr_1_question` VALUES ('43', '25', '系统提示“简历无法投递”，怎么办？', null, '', '请查看您的简历是否填写完整。您必须填写了个人信息、自我评价和求职意向后才可以发送简历。为了获得更多的面试机会，建议您认真填写工作经验和教育背景。', '1', '1', 'admin', '9', '/index.php?c=show&id=43', '0', '0', '127.0.0.1', '1573365294', '1573365314', '0', '0.00', '0');
INSERT INTO `dr_1_question` VALUES ('44', '25', '如何解决家电阻燃PC色差？', null, '', '随着小家电的兴起，其外观样式和色彩也越来越多样化，对于小家电的颜色要求也越来越多，那么在注塑过程中如。', '1', '1', 'admin', '9', '/index.php?c=show&id=44', '0', '0', '127.0.0.1', '1573365316', '1573365323', '0', '0.00', '0');
INSERT INTO `dr_1_question` VALUES ('45', '25', '用户“购电插卡”或“插卡抄表”时，电表“声', null, '', '参见各类预付费装置的插卡故障提示及处理。', '1', '1', 'admin', '9', '/index.php?c=show&id=45', '0', '0', '127.0.0.1', '1573365325', '1573365331', '0', '0.00', '0');

-- ----------------------------
-- Table structure for dr_1_question_category
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_question_category`;
CREATE TABLE `dr_1_question_category` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `pid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `pids` varchar(255) NOT NULL COMMENT '所有上级id',
  `name` varchar(30) NOT NULL COMMENT '栏目名称',
  `dirname` varchar(30) NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(100) NOT NULL COMMENT '上级目录',
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有下级',
  `childids` text NOT NULL COMMENT '下级所有id',
  `thumb` varchar(255) NOT NULL COMMENT '栏目图片',
  `show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `setting` text NOT NULL COMMENT '属性配置',
  `displayorder` mediumint(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `show` (`show`),
  KEY `module` (`pid`,`displayorder`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目表';

-- ----------------------------
-- Records of dr_1_question_category
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_question_category_data
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_question_category_data`;
CREATE TABLE `dr_1_question_category_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` int(3) unsigned NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目模型表';

-- ----------------------------
-- Records of dr_1_question_category_data
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_question_category_data_0
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_question_category_data_0`;
CREATE TABLE `dr_1_question_category_data_0` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目模型表的附表';

-- ----------------------------
-- Records of dr_1_question_category_data_0
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_question_comment
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_question_comment`;
CREATE TABLE `dr_1_question_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `cid` int(10) unsigned NOT NULL COMMENT '关联id',
  `cuid` int(10) unsigned NOT NULL COMMENT '关联uid',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `orderid` bigint(18) unsigned NOT NULL COMMENT '订单id',
  `uid` mediumint(8) unsigned DEFAULT '0' COMMENT '评论者ID',
  `author` varchar(250) DEFAULT NULL COMMENT '评论者账号',
  `content` text COMMENT '评论内容',
  `support` int(10) unsigned DEFAULT '0' COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT '0' COMMENT '反对数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '平均分',
  `sort1` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort2` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort3` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort4` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort5` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort6` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort7` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort8` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort9` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `reply` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '回复id',
  `in_reply` tinyint(1) unsigned DEFAULT '0' COMMENT '是否存在回复',
  `status` smallint(1) unsigned DEFAULT '0' COMMENT '审核状态',
  `inputip` varchar(50) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `catid` (`catid`),
  KEY `orderid` (`orderid`),
  KEY `reply` (`reply`),
  KEY `support` (`support`),
  KEY `oppose` (`oppose`),
  KEY `avgsort` (`avgsort`),
  KEY `status` (`status`),
  KEY `aa` (`cid`,`status`,`inputtime`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论内容表';

-- ----------------------------
-- Records of dr_1_question_comment
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_question_comment_index
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_question_comment_index`;
CREATE TABLE `dr_1_question_comment_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `support` int(10) unsigned DEFAULT '0' COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT '0' COMMENT '反对数',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '平均分',
  `sort1` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort2` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort3` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort4` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort5` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort6` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort7` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort8` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort9` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `tableid` smallint(5) unsigned DEFAULT '0' COMMENT '附表id',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `catid` (`catid`),
  KEY `support` (`support`),
  KEY `oppose` (`oppose`),
  KEY `comments` (`comments`),
  KEY `avgsort` (`avgsort`),
  KEY `tableid` (`tableid`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='评论索引表';

-- ----------------------------
-- Records of dr_1_question_comment_index
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_question_data_0
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_question_data_0`;
CREATE TABLE `dr_1_question_data_0` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext COMMENT '内容',
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容附表';

-- ----------------------------
-- Records of dr_1_question_data_0
-- ----------------------------
INSERT INTO `dr_1_question_data_0` VALUES ('42', '1', '25', null);
INSERT INTO `dr_1_question_data_0` VALUES ('43', '1', '25', null);
INSERT INTO `dr_1_question_data_0` VALUES ('44', '1', '25', null);
INSERT INTO `dr_1_question_data_0` VALUES ('45', '1', '25', null);

-- ----------------------------
-- Table structure for dr_1_question_draft
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_question_draft`;
CREATE TABLE `dr_1_question_draft` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `catid` (`catid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容草稿表';

-- ----------------------------
-- Records of dr_1_question_draft
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_question_flag
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_question_flag`;
CREATE TABLE `dr_1_question_flag` (
  `flag` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '文档标记id',
  `id` int(10) unsigned NOT NULL COMMENT '文档内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  KEY `flag` (`flag`,`id`,`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='标记表';

-- ----------------------------
-- Records of dr_1_question_flag
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_question_hits
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_question_hits`;
CREATE TABLE `dr_1_question_hits` (
  `id` int(10) unsigned NOT NULL COMMENT '文章id',
  `hits` int(10) unsigned NOT NULL COMMENT '总点击数',
  `day_hits` int(10) unsigned NOT NULL COMMENT '本日点击',
  `week_hits` int(10) unsigned NOT NULL COMMENT '本周点击',
  `month_hits` int(10) unsigned NOT NULL COMMENT '本月点击',
  `year_hits` int(10) unsigned NOT NULL COMMENT '年点击量',
  UNIQUE KEY `id` (`id`),
  KEY `day_hits` (`day_hits`),
  KEY `week_hits` (`week_hits`),
  KEY `month_hits` (`month_hits`),
  KEY `year_hits` (`year_hits`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='时段点击量统计';

-- ----------------------------
-- Records of dr_1_question_hits
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_question_index
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_question_index`;
CREATE TABLE `dr_1_question_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='内容索引表';

-- ----------------------------
-- Records of dr_1_question_index
-- ----------------------------
INSERT INTO `dr_1_question_index` VALUES ('42', '1', '25', '9', '1573365238');
INSERT INTO `dr_1_question_index` VALUES ('43', '1', '25', '9', '1573365294');
INSERT INTO `dr_1_question_index` VALUES ('44', '1', '25', '9', '1573365316');
INSERT INTO `dr_1_question_index` VALUES ('45', '1', '25', '9', '1573365325');

-- ----------------------------
-- Table structure for dr_1_question_recycle
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_question_recycle`;
CREATE TABLE `dr_1_question_recycle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `result` text NOT NULL COMMENT '删除理由',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `catid` (`catid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容回收站表';

-- ----------------------------
-- Records of dr_1_question_recycle
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_question_search
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_question_search`;
CREATE TABLE `dr_1_question_search` (
  `id` varchar(32) NOT NULL,
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `params` text NOT NULL COMMENT '参数数组',
  `keyword` varchar(255) NOT NULL COMMENT '关键字',
  `contentid` mediumtext NOT NULL COMMENT 'id集合',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `catid` (`catid`),
  KEY `keyword` (`keyword`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='搜索表';

-- ----------------------------
-- Records of dr_1_question_search
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_question_time
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_question_time`;
CREATE TABLE `dr_1_question_time` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `result` text NOT NULL COMMENT '处理结果',
  `posttime` int(10) unsigned NOT NULL COMMENT '定时发布时间',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `posttime` (`posttime`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容定时发布表';

-- ----------------------------
-- Records of dr_1_question_time
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_question_verify
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_question_verify`;
CREATE TABLE `dr_1_question_verify` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `isnew` tinyint(1) unsigned NOT NULL COMMENT '是否新增',
  `author` varchar(50) NOT NULL COMMENT '作者',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `backuid` mediumint(8) unsigned NOT NULL COMMENT '操作人uid',
  `backinfo` text NOT NULL COMMENT '操作退回信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`),
  KEY `backuid` (`backuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容审核表';

-- ----------------------------
-- Records of dr_1_question_verify
-- ----------------------------

-- ----------------------------
-- Table structure for dr_1_share_category
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_share_category`;
CREATE TABLE `dr_1_share_category` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `tid` tinyint(1) NOT NULL COMMENT '栏目类型，0单页，1模块，2外链',
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `mid` varchar(20) NOT NULL COMMENT '模块目录',
  `pids` varchar(255) NOT NULL COMMENT '所有上级id',
  `name` varchar(30) NOT NULL COMMENT '栏目名称',
  `dirname` varchar(30) NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(100) NOT NULL COMMENT '上级目录',
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有下级',
  `childids` text NOT NULL COMMENT '下级所有id',
  `domain` varchar(50) DEFAULT NULL COMMENT '绑定电脑域名',
  `mobile_domain` varchar(50) DEFAULT NULL COMMENT '绑定手机域名',
  `thumb` varchar(255) NOT NULL COMMENT '栏目图片',
  `show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `content` mediumtext NOT NULL COMMENT '单页内容',
  `setting` text NOT NULL COMMENT '属性配置',
  `displayorder` smallint(5) NOT NULL DEFAULT '0',
  `eng_name` varchar(255) DEFAULT NULL COMMENT '栏目英文名称',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `tid` (`tid`),
  KEY `show` (`show`),
  KEY `dirname` (`dirname`),
  KEY `module` (`pid`,`displayorder`,`id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='共享模块栏目表';

-- ----------------------------
-- Records of dr_1_share_category
-- ----------------------------
INSERT INTO `dr_1_share_category` VALUES ('1', '0', '0', '', '0', '关于我们', 'about', '', '1', '1,2,3,4,5,6', '', '', '', '1', '', '{\"linkurl\":\"\",\"getchild\":\"1\",\"urlrule\":\"\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"10\",\"mpagesize\":\"10\",\"page\":\"page.html\",\"list\":\"page.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"}}', '0', 'About');
INSERT INTO `dr_1_share_category` VALUES ('2', '0', '1', '', '0,1', '公司简介', 'about30', 'about/', '0', '2', '', '', '', '1', '&lt;p&gt;&amp;nbsp;广州某某网络科技有限公司创建于2017年，发展至今已有着丰富的网站建设经验，成立至今，已经成功为3000多家企事业单位和个人提 供了网站建设，网站推广等相关电子商务解决方案。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;\r\n	我们拥有一流的网站设计人员、顶尖的网站程序开发人员、专业的销售和服务人员，在强力的市场竞争和需求下，公司愿以最敏锐的洞察力、最高效的沟通力、最稳健的控制力和最先行的执行力、整合一切可利用资源帮助客户实现愿景和目标、与互联网信息化服务全方位接轨。公司以推动中国网络信息化为己任，凭借对&amp;quot;专业、创新、诚信、务实、高效&amp;quot;的不断地追求，致力将本公司打造为一家高品质服务性单位，力争成为网络公司首选企业。&lt;br/&gt;&lt;br/&gt;\r\n	广州某某络已与阿里云、西部数码、百度等基础电信主体运营商，包括互联网龙头企业建立了紧密长期的战略合作伙伴关系，我们已为上百家企业客户提供了网络化、信息化、安全化的互联网基础应用服务方案，帮助企业建立属于自己的企业形象网站、电子商务平台以及电子商务推广和营销方案，为企业建立更稳定、更安全的信息化桥梁，提高企业的竞争力，并得到客户的一致好评。&lt;/p&gt;&lt;p&gt;\r\n	广州某某平台成品网站，坚持价格适当，模板质量过关的原则！经过多年的dedecms模板开发制作，已有了成熟的DEDECMS模板制作技术，无论性价比还是售后，都体现专业的技术！欢迎广大客户咨询。&lt;/p&gt;&lt;p&gt;\r\n	价格比及售后为本站突出的优势，我们的模板质量好，价格相对同行业低！&lt;/p&gt;&lt;p&gt;\r\n	所有模板都为本站亲自制作，原价购买现成模板包售后包程序补丁升级模板升级。质优价低，质量效果比同行业好，是我们一向的宗旨！&amp;nbsp;&lt;/p&gt;', '{\"linkurl\":\"\",\"urlrule\":\"\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"10\",\"mpagesize\":\"10\",\"page\":\"page.html\",\"list\":\"page.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"}}', '0', 'COMPANY PROFILE');
INSERT INTO `dr_1_share_category` VALUES ('3', '1', '1', 'news', '0,1', '企业文化', 'company', 'about/', '0', '3', '', '', '/static/new/picture/1569491368.jpg', '1', '&lt;p&gt;秉承“质量筑品牌，服务创未来”的经营理念，某某股份为打造优质产品而做出了不懈的努力，深受企业、媒体、社会公众和广大消费者好评。&lt;/p&gt;', '{\"linkurl\":\"\",\"urlrule\":\"\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"10\",\"mpagesize\":\"10\",\"page\":\"company.html\",\"list\":\"company.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"}}', '0', 'COMPANY CULTURE');
INSERT INTO `dr_1_share_category` VALUES ('4', '1', '1', 'news', '0,1', '公司荣誉', 'honor', 'about/', '0', '4', '', '', '', '1', '', '{\"linkurl\":\"\",\"urlrule\":\"\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"9\",\"mpagesize\":\"9\",\"page\":\"honor.html\",\"list\":\"honor.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"}}', '0', '');
INSERT INTO `dr_1_share_category` VALUES ('5', '1', '1', 'news', '0,1', '品牌历程', 'brand', 'about/', '0', '5', '', '', '', '1', '', '{\"linkurl\":\"\",\"urlrule\":\"\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"10\",\"mpagesize\":\"10\",\"page\":\"brand.html\",\"list\":\"brand.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"}}', '0', 'BRAND HISTORY');
INSERT INTO `dr_1_share_category` VALUES ('6', '1', '1', 'news', '0,1', '视频中心', 'video', 'about/', '0', '6', '', '', '', '1', '', '{\"linkurl\":\"\",\"urlrule\":\"\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"10\",\"mpagesize\":\"10\",\"page\":\"page.html\",\"list\":\"video.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"}}', '0', 'VIDEO CENTER');
INSERT INTO `dr_1_share_category` VALUES ('7', '1', '0', 'photo', '0', '产品展示', 'product', '', '1', '7,8,9,10,11', '', '', '', '1', '', '{\"linkurl\":\"\",\"urlrule\":\"\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"12\",\"mpagesize\":\"12\",\"page\":\"page.html\",\"list\":\"list.html\",\"category\":\"list.html\",\"search\":\"search.html\",\"show\":\"show.html\"}}', '0', 'PRODUCT CENTER');
INSERT INTO `dr_1_share_category` VALUES ('8', '1', '7', 'photo', '0,7', '产品分类一', 'productone', 'product/', '0', '8', '', '', '', '1', '', '{\"linkurl\":\"\",\"urlrule\":\"\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"12\",\"mpagesize\":\"12\",\"page\":\"page.html\",\"list\":\"list.html\",\"category\":\"list.html\",\"search\":\"search.html\",\"show\":\"show.html\"}}', '0', '');
INSERT INTO `dr_1_share_category` VALUES ('9', '1', '7', 'photo', '0,7', '产品分类二', 'producttwo', 'product/', '0', '9', '', '', '', '1', '', '{\"linkurl\":\"\",\"urlrule\":\"\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"12\",\"mpagesize\":\"12\",\"page\":\"page.html\",\"list\":\"list.html\",\"category\":\"list.html\",\"search\":\"search.html\",\"show\":\"show.html\"}}', '0', '');
INSERT INTO `dr_1_share_category` VALUES ('10', '1', '7', 'photo', '0,7', '产品分类三', 'productthree', 'product/', '0', '10', '', '', '', '1', '', '{\"linkurl\":\"\",\"urlrule\":\"\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"12\",\"mpagesize\":\"12\",\"page\":\"page.html\",\"list\":\"list.html\",\"category\":\"list.html\",\"search\":\"search.html\",\"show\":\"show.html\"}}', '0', '');
INSERT INTO `dr_1_share_category` VALUES ('11', '1', '7', 'photo', '0,7', '产品分类四', 'productfore', 'product/', '0', '11', '', '', '', '1', '', '{\"linkurl\":\"\",\"urlrule\":\"\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"12\",\"mpagesize\":\"12\",\"page\":\"page.html\",\"list\":\"list.html\",\"category\":\"list.html\",\"search\":\"search.html\",\"show\":\"show.html\"}}', '0', '');
INSERT INTO `dr_1_share_category` VALUES ('12', '1', '0', 'news', '0', '新闻资讯', 'News', '', '1', '12,13,14,15,16', '', '', '', '1', '', '{\"linkurl\":\"\",\"urlrule\":\"\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"9\",\"mpagesize\":\"9\",\"page\":\"page.html\",\"list\":\"list.html\",\"category\":\"list.html\",\"search\":\"search.html\",\"show\":\"show.html\"}}', '0', 'NEWS CENTER');
INSERT INTO `dr_1_share_category` VALUES ('13', '1', '12', 'news', '0,12', '公司新闻', 'company94', 'News/', '0', '13', null, null, '', '1', '', '{\"linkurl\":\"\",\"urlrule\":0,\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"9\",\"mpagesize\":\"9\",\"page\":\"page.html\",\"list\":\"list.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"html\":0}', '0', null);
INSERT INTO `dr_1_share_category` VALUES ('14', '1', '12', 'news', '0,12', '行业新闻', 'industry', 'News/', '0', '14', null, null, '', '1', '', '{\"linkurl\":\"\",\"urlrule\":0,\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"9\",\"mpagesize\":\"9\",\"page\":\"page.html\",\"list\":\"list.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"html\":0}', '0', null);
INSERT INTO `dr_1_share_category` VALUES ('15', '1', '12', 'news', '0,12', '媒体报道', 'media', 'News/', '0', '15', null, null, '', '1', '', '{\"linkurl\":\"\",\"urlrule\":0,\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"9\",\"mpagesize\":\"9\",\"page\":\"page.html\",\"list\":\"list.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"html\":0}', '0', null);
INSERT INTO `dr_1_share_category` VALUES ('16', '1', '12', 'news', '0,12', '科技新闻', 'technology', 'News/', '0', '16', null, null, '', '1', '', '{\"linkurl\":\"\",\"urlrule\":0,\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"9\",\"mpagesize\":\"9\",\"page\":\"page.html\",\"list\":\"list.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"html\":0}', '0', null);
INSERT INTO `dr_1_share_category` VALUES ('17', '1', '0', 'down', '0', '下载中心', 'downs', '', '1', '17,18,19', '', '', '', '1', '', '{\"linkurl\":\"\",\"urlrule\":\"\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"10\",\"mpagesize\":\"10\",\"page\":\"page.html\",\"list\":\"list.html\",\"category\":\"list.html\",\"search\":\"search.html\",\"show\":\"show.html\"}}', '0', 'DOWNLOAD');
INSERT INTO `dr_1_share_category` VALUES ('18', '1', '17', 'down', '0,17', '帮助文档', 'help', 'downs/', '0', '18', '', '', '', '1', '', '{\"linkurl\":\"\",\"urlrule\":\"\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"1\",\"mpagesize\":\"10\",\"page\":\"page.html\",\"list\":\"list.html\",\"category\":\"list.html\",\"search\":\"search.html\",\"show\":\"show.html\"}}', '0', 'HELP DOCUMENT');
INSERT INTO `dr_1_share_category` VALUES ('19', '1', '17', 'down', '0,17', '档案下载', 'file', 'downs/', '0', '19', '', '', '', '1', '', '{\"linkurl\":\"\",\"urlrule\":\"\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"10\",\"mpagesize\":\"10\",\"page\":\"page.html\",\"list\":\"list.html\",\"category\":\"list.html\",\"search\":\"search.html\",\"show\":\"show.html\"}}', '0', 'FILE DOWNLOAD');
INSERT INTO `dr_1_share_category` VALUES ('20', '1', '0', 'news', '0', '工程案例', 'case', '', '1', '20,21,22', '', '', '', '1', '', '{\"linkurl\":\"\",\"urlrule\":\"\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"10\",\"mpagesize\":\"10\",\"page\":\"page.html\",\"list\":\"case.html\",\"category\":\"case.html\",\"search\":\"search.html\",\"show\":\"show.html\"}}', '0', 'CASE');
INSERT INTO `dr_1_share_category` VALUES ('21', '1', '20', 'news', '0,20', '合作伙伴', 'partners', 'case/', '0', '21', null, null, '', '1', '', '{\"linkurl\":\"\",\"urlrule\":0,\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"10\",\"mpagesize\":\"10\",\"page\":\"page.html\",\"list\":\"case.html\",\"category\":\"case.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"html\":0}', '0', null);
INSERT INTO `dr_1_share_category` VALUES ('22', '1', '20', 'news', '0,20', '成功案例', 'case_study87', 'case/', '0', '22', null, null, '', '1', '', '{\"linkurl\":\"\",\"urlrule\":0,\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"10\",\"mpagesize\":\"10\",\"page\":\"page.html\",\"list\":\"case.html\",\"category\":\"case.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"html\":0}', '0', null);
INSERT INTO `dr_1_share_category` VALUES ('23', '0', '0', '', '0', '服务支持', 'service', '', '1', '23,24,25,26,27', '', '', '', '1', '&lt;p&gt;&lt;span style=&quot;color: rgb(146, 146, 146); font-family: &amp;quot;Microsoft YaHei&amp;quot;;&quot;&gt;&amp;nbsp;公司秉承以客户的需求为中心，以客户的满意为目标的经营理念，在管理、技术、产品、工程、服务等各方面不断创新，超越自我，为广大的用户提供符合要求的高品质产品和更优质的服务，持续为中国的电力智能化建设服务！&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal;&quot;&gt;本着“质量第一，服务第一，诚信第一”的理念，全心全意地为用户提供优质优价的产品。&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal;&quot;&gt;我司技术服务体系健全、规范,公司总部客户服务中心配有专职的、经验丰富的技术支持工程师专业团队，随时可派往各地进行专业指导、技术培训、支持和售后服务，为更好地服务客户，全国共有7个专业的技术服务门部26个办事处涵盖了全国31个省、直辖市、自治区，省会级城市均有多位专业技术服务工程师驻守，随时响应客户的要求。&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal;&quot;&gt;我们的技术服务工程师都是计算机软件工程、自动化、电子与计算技术等专业毕业，其中大专以上学历占85%。具有多年工作经验，熟悉电力系统行业各项应用，并经过严格培训，熟知电能计量产品知识，拥有丰富的现场技术服务经验。并针对电能计量产品的技术规范进行了强化培训，使我司技术服务工程师已掌握客户对电能计量产品的需求，为技术服务打下坚实基础。&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal;&quot;&gt;◆ 技术服务体系：分别由Call Center、应用服务组、研究室组成，构成三层服务体系。&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal;&quot;&gt;◆ 现场服务体系：由驻各省销售部及服务工程师构成，与用户保持最近的空间距离，可在最短的时间内派人到达用户指定现场，为用户解决问题。&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal;&quot;&gt;服务承诺:&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal;&quot;&gt;1、 7×24 Hot Line：公司总部及驻各省销售部设有每周7天，每天24小时服务热线，利用远方诊断功能，随时解决用户提出的问题。&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal;&quot;&gt;2、全过程服务：我司将提供与本合同设备有关的工程设计、产品监造、检验、土建、安装、调试、验收、性能验收试验、运行、检修等相应的技术指导、技术配合、技术培训等全过程的服务。&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal;&quot;&gt;3、安装培训：按客户实际安装要求派遣足够的且有工程经验的技术服务人员到现场进行技术服务，负责解决合同设备在安装调试、试运行中发现的制造质量及性能等有关问题，可根据用户需要做产品技术性能、操作方法以及使用中应注意的问题及常见故障排除方法的讲解培训。&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal;&quot;&gt;4、现场服务：对产品在施工中、运行中出现质量问题，公司将在1个小时内做出响应并根据所在地距离的远近，在24小时内派有经验的技术工程师到现场予以处理，并在3个工作日内提交解决方案，保证给用户合理满意的结果&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal;&quot;&gt;5、升级服务：当系统的版本升级时，我公司会免费提供全套升级服务，保障产品的延续使用。升级服务包括：数据备份；应用程序升级；数据库升级；数据恢复；升级培训指导等。&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal;&quot;&gt;6、定期维护：在产品使用期内，我公司将定期远程或现场监测产品使用情况，进行预防性维护，并向客户通报结果。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '{\"linkurl\":\"\",\"getchild\":\"1\",\"urlrule\":\"\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"10\",\"mpagesize\":\"10\",\"page\":\"page.html\",\"list\":\"page.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"}}', '0', 'SERVICE');
INSERT INTO `dr_1_share_category` VALUES ('24', '0', '23', '', '0,23', '服务承诺', 'service4', 'service/', '0', '24', '', '', '', '1', '&lt;p&gt;&lt;span style=&quot;color: rgb(146, 146, 146); font-family: &quot;&gt;&amp;nbsp;公司秉承以客户的需求为中心，以客户的满意为目标的经营理念，在管理、技术、产品、工程、服务等各方面不断创新，超越自我，为广大的用户提供符合要求的高品质产品和更优质的服务，持续为中国的电力智能化建设服务！&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &quot;&gt;本着“质量第一，服务第一，诚信第一”的理念，全心全意地为用户提供优质优价的产品。&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &quot;&gt;我司技术服务体系健全、规范,公司总部客户服务中心配有专职的、经验丰富的技术支持工程师专业团队，随时可派往各地进行专业指导、技术培训、支持和售后服务，为更好地服务客户，全国共有7个专业的技术服务门部26个办事处涵盖了全国31个省、直辖市、自治区，省会级城市均有多位专业技术服务工程师驻守，随时响应客户的要求。&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &quot;&gt;我们的技术服务工程师都是计算机软件工程、自动化、电子与计算技术等专业毕业，其中大专以上学历占85%。具有多年工作经验，熟悉电力系统行业各项应用，并经过严格培训，熟知电能计量产品知识，拥有丰富的现场技术服务经验。并针对电能计量产品的技术规范进行了强化培训，使我司技术服务工程师已掌握客户对电能计量产品的需求，为技术服务打下坚实基础。&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &quot;&gt;◆ 技术服务体系：分别由Call Center、应用服务组、研究室组成，构成三层服务体系。&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &quot;&gt;◆ 现场服务体系：由驻各省销售部及服务工程师构成，与用户保持最近的空间距离，可在最短的时间内派人到达用户指定现场，为用户解决问题。&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &quot;&gt;服务承诺:&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &quot;&gt;1、 7×24 Hot Line：公司总部及驻各省销售部设有每周7天，每天24小时服务热线，利用远方诊断功能，随时解决用户提出的问题。&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &quot;&gt;2、全过程服务：我司将提供与本合同设备有关的工程设计、产品监造、检验、土建、安装、调试、验收、性能验收试验、运行、检修等相应的技术指导、技术配合、技术培训等全过程的服务。&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &quot;&gt;3、安装培训：按客户实际安装要求派遣足够的且有工程经验的技术服务人员到现场进行技术服务，负责解决合同设备在安装调试、试运行中发现的制造质量及性能等有关问题，可根据用户需要做产品技术性能、操作方法以及使用中应注意的问题及常见故障排除方法的讲解培训。&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &quot;&gt;4、现场服务：对产品在施工中、运行中出现质量问题，公司将在1个小时内做出响应并根据所在地距离的远近，在24小时内派有经验的技术工程师到现场予以处理，并在3个工作日内提交解决方案，保证给用户合理满意的结果&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &quot;&gt;5、升级服务：当系统的版本升级时，我公司会免费提供全套升级服务，保障产品的延续使用。升级服务包括：数据备份；应用程序升级；数据库升级；数据恢复；升级培训指导等。&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &quot;&gt;6、定期维护：在产品使用期内，我公司将定期远程或现场监测产品使用情况，进行预防性维护，并向客户通报结果。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '{\"linkurl\":\"\",\"urlrule\":\"\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"10\",\"mpagesize\":\"10\",\"page\":\"page.html\",\"list\":\"page.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"}}', '0', 'SERVICE');
INSERT INTO `dr_1_share_category` VALUES ('25', '1', '23', 'question', '0,23', '常见问题', 'question', 'service/', '0', '25', '', '', '', '1', '', '{\"linkurl\":\"\",\"urlrule\":\"\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"10\",\"mpagesize\":\"10\",\"page\":\"page.html\",\"list\":\"list.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"}}', '0', 'COMMON PROBLEM');
INSERT INTO `dr_1_share_category` VALUES ('26', '0', '23', '', '0,23', '维保服务', 'weibao', 'service/', '0', '26', '', '', '', '1', '&lt;p&gt;服务目标：超越用户需求，为用户提供更多&lt;/p&gt;&lt;p&gt;\r\n	全心服务：为用户提供方便、快捷、可靠的全心服务&lt;/p&gt;&lt;p&gt;\r\n	快速服务：响应快、到达快、维修快&lt;/p&gt;&lt;p&gt;\r\n	服务态度：亲切．快速，准确&lt;/p&gt;&lt;p&gt;\r\n	服务热线：4008-123-8888&lt;/p&gt;&lt;p&gt;\r\n	目前某某的售后服务网络覆盖全国100%的直辖市、省会城市和地级市；并辐射到美国、沙特、印尼、马来西亚、新加坡、韩国、越南、中国台湾等国家和地区。&lt;/p&gt;', '{\"linkurl\":\"\",\"urlrule\":\"\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"10\",\"mpagesize\":\"10\",\"page\":\"page.html\",\"list\":\"page.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"}}', '0', 'MAINTENANCE SERVICE');
INSERT INTO `dr_1_share_category` VALUES ('27', '0', '23', '', '0,23', '投诉及维修', 'complaint', 'service/', '0', '27', '', '', '', '1', '', '{\"linkurl\":\"\",\"urlrule\":\"\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"10\",\"mpagesize\":\"10\",\"page\":\"complaint.html\",\"list\":\"page.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"}}', '0', '');
INSERT INTO `dr_1_share_category` VALUES ('28', '0', '0', '', '0', '解决方案', 'solution', '', '1', '28,29,30,31,32,33', '', '', '', '1', '', '{\"linkurl\":\"\",\"getchild\":\"1\",\"urlrule\":\"\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"10\",\"mpagesize\":\"10\",\"page\":\"page.html\",\"list\":\"page.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"}}', '0', 'SOLUTION');
INSERT INTO `dr_1_share_category` VALUES ('29', '0', '28', '', '0,28', '商业', 'business', 'solution/', '0', '29', '', '', '', '1', '&lt;p&gt;随着集团上市公司的不断壮大，集团企业、上市公司的信息需要采用各种途径公众于媒体、上级领导、内部员工、投资合作者、应聘者、消费者和供应商等目标人群并与他们进行沟通,如何满足这些人群的需求，这是集团企业需要解决的问题。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	无疑，网站便是最行之有效、最直接、最权威的信息发布平台。如何建造一个既符合企业形象，又能体现企业发展实力的网络平台，便成了集团上市公司树立良好网络形象的重重之重。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	方维网络为各大集团上市公司提供网站建设解决方案，网站建设、网站设计、网页设计、FLAS动画设计、网络平台开发。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	目前上市企业和集团网站的常见问题：&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	● 网络形象没有受到重视，影响投资者对公司的判断！&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	● 网站没有及时披露信息，不能为投资者带来帮助！&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	● 网站程序技术相对落后，更新麻烦！&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	● 网站设计上没有良好的体现公司文化和价值！&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	● 在搜索引擎（如百度、谷歌等）上找不到网站资料，根本没有推广！&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	1、咨询调研报告&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	了解您的企业特性，分析此行业投资者构成，为您梳理特定的需求；&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	2、上市公司功能和结构设计&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	针对各层面投资者的需求，为您设计符合其要求的网站功能结构框架，并建议和协助您整理信息披露内容。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	企业信息的披露平台：&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	我们为您提供功能强大的信息披露平台，这是一套应用成熟的信息发布系统，只需简单操作，您即可第一时间轻松发布新闻、活动、法律文件、财报、分析报告等投资者关心的各类资讯。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	舆论宣传平台：&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	宣传集团及下属机构的出色业绩、公益投入、社会回馈等，塑造集团的可信赖的公众形象。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	3、投资者沟通平台&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	介绍上市公司业绩及年报等，增强投资者信心，赢得公众信赖。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	4、人才储备平台&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	为集团及下属机构建立人力资源平台,及时发布招聘信息,建立人才储备,为集团获得长远竞争力。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	5、业务推介平台&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	对于集团的主营业务及重点项目进行推介,增强投资者信心,赢得社会美誉度，展示产品和服务,与消费者进行沟通。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	6、形象展示平台&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	传递企业的价值观与核心理念,社会责任和未来发展.展示集团品牌形象。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	7、网上调研&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	我们为您提供与投资人的在线互动，您可以使用网上调研功能，了解投资人的需求和动态；投资人也可以通过这项服务提升企业管理参与感。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	8、网站运营维护方案&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	根据您的企业日常管理模式，我们将为您建议网站日常信息提供、审核、发布的一整套运转方案，协助您高效地管理网站。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	9、完善的管理体系&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	集团网站的管理不仅仅是平台的建设问题，更重要的是管理体系的建立，没有完善的管理体现功能再强大，页面再美观的网站也不过是空中楼阁。方维网络结合多年管理经验，帮助集团公司建立内部和管理制度和体系。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	10、数据安全和日志记录&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	管理系统具备详细的登录和访问日志记录，以方便安全分析。同时拥有完善的数据备份和恢复模块，保障数据的安全。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	11、权限管理和信息审核&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	因为集团网站的信息管理和维护涉及的面非常广泛，网站的管理人员可能达到几十人到上百人，权限的管理和信息的审核非常重要。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	方维网络根据集团上市公司的情况及需求的不同，给出具有针对性的网站建设解决方案。&lt;/p&gt;', '{\"linkurl\":\"\",\"urlrule\":\"\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"10\",\"mpagesize\":\"10\",\"page\":\"page.html\",\"list\":\"page.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"}}', '0', 'BUSINESS');
INSERT INTO `dr_1_share_category` VALUES ('30', '0', '28', '', '0,28', '社区', 'community', 'solution/', '0', '30', '', '', '', '1', '&lt;p&gt;随着集团上市公司的不断壮大，集团企业、上市公司的信息需要采用各种途径公众于媒体、上级领导、内部员工、投资合作者、应聘者、消费者和供应商等目标人群并与他们进行沟通,如何满足这些人群的需求，这是集团企业需要解决的问题。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	无疑，网站便是最行之有效、最直接、最权威的信息发布平台。如何建造一个既符合企业形象，又能体现企业发展实力的网络平台，便成了集团上市公司树立良好网络形象的重重之重。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	方维网络为各大集团上市公司提供网站建设解决方案，网站建设、网站设计、网页设计、FLAS动画设计、网络平台开发。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	目前上市企业和集团网站的常见问题：&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	● 网络形象没有受到重视，影响投资者对公司的判断！&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	● 网站没有及时披露信息，不能为投资者带来帮助！&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	● 网站程序技术相对落后，更新麻烦！&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	● 网站设计上没有良好的体现公司文化和价值！&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	● 在搜索引擎（如百度、谷歌等）上找不到网站资料，根本没有推广！&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	1、咨询调研报告&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	了解您的企业特性，分析此行业投资者构成，为您梳理特定的需求；&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	2、上市公司功能和结构设计&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	针对各层面投资者的需求，为您设计符合其要求的网站功能结构框架，并建议和协助您整理信息披露内容。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	企业信息的披露平台：&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	我们为您提供功能强大的信息披露平台，这是一套应用成熟的信息发布系统，只需简单操作，您即可第一时间轻松发布新闻、活动、法律文件、财报、分析报告等投资者关心的各类资讯。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	舆论宣传平台：&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	宣传集团及下属机构的出色业绩、公益投入、社会回馈等，塑造集团的可信赖的公众形象。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	3、投资者沟通平台&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	介绍上市公司业绩及年报等，增强投资者信心，赢得公众信赖。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	4、人才储备平台&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	为集团及下属机构建立人力资源平台,及时发布招聘信息,建立人才储备,为集团获得长远竞争力。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	5、业务推介平台&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	对于集团的主营业务及重点项目进行推介,增强投资者信心,赢得社会美誉度，展示产品和服务,与消费者进行沟通。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	6、形象展示平台&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	传递企业的价值观与核心理念,社会责任和未来发展.展示集团品牌形象。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	7、网上调研&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	我们为您提供与投资人的在线互动，您可以使用网上调研功能，了解投资人的需求和动态；投资人也可以通过这项服务提升企业管理参与感。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	8、网站运营维护方案&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	根据您的企业日常管理模式，我们将为您建议网站日常信息提供、审核、发布的一整套运转方案，协助您高效地管理网站。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	9、完善的管理体系&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	集团网站的管理不仅仅是平台的建设问题，更重要的是管理体系的建立，没有完善的管理体现功能再强大，页面再美观的网站也不过是空中楼阁。方维网络结合多年管理经验，帮助集团公司建立内部和管理制度和体系。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	10、数据安全和日志记录&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	管理系统具备详细的登录和访问日志记录，以方便安全分析。同时拥有完善的数据备份和恢复模块，保障数据的安全。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	11、权限管理和信息审核&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	因为集团网站的信息管理和维护涉及的面非常广泛，网站的管理人员可能达到几十人到上百人，权限的管理和信息的审核非常重要。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	方维网络根据集团上市公司的情况及需求的不同，给出具有针对性的网站建设解决方案。&lt;/p&gt;', '{\"linkurl\":\"\",\"urlrule\":\"\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"10\",\"mpagesize\":\"10\",\"page\":\"page.html\",\"list\":\"page.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"}}', '0', 'COMMUNITY');
INSERT INTO `dr_1_share_category` VALUES ('31', '0', '28', '', '0,28', '校园', 'class', 'solution/', '0', '31', null, null, '', '1', '<p>随着集团上市公司的不断壮大，集团企业、上市公司的信息需要采用各种途径公众于媒体、上级领导、内部员工、投资合作者、应聘者、消费者和供应商等目标人群并与他们进行沟通,如何满足这些人群的需求，这是集团企业需要解决的问题。</p><p>&nbsp; &nbsp;\r\n	无疑，网站便是最行之有效、最直接、最权威的信息发布平台。如何建造一个既符合企业形象，又能体现企业发展实力的网络平台，便成了集团上市公司树立良好网络形象的重重之重。</p><p>&nbsp; &nbsp;\r\n	方维网络为各大集团上市公司提供网站建设解决方案，网站建设、网站设计、网页设计、FLAS动画设计、网络平台开发。</p><p>&nbsp; &nbsp;\r\n	目前上市企业和集团网站的常见问题：</p><p>&nbsp; &nbsp;\r\n	● 网络形象没有受到重视，影响投资者对公司的判断！</p><p>&nbsp; &nbsp;\r\n	● 网站没有及时披露信息，不能为投资者带来帮助！</p><p>&nbsp; &nbsp;\r\n	● 网站程序技术相对落后，更新麻烦！</p><p>&nbsp; &nbsp;\r\n	● 网站设计上没有良好的体现公司文化和价值！</p><p>&nbsp; &nbsp;\r\n	● 在搜索引擎（如百度、谷歌等）上找不到网站资料，根本没有推广！</p><p>&nbsp; &nbsp;\r\n	1、咨询调研报告</p><p>&nbsp; &nbsp;\r\n	了解您的企业特性，分析此行业投资者构成，为您梳理特定的需求；</p><p>&nbsp; &nbsp;\r\n	2、上市公司功能和结构设计</p><p>&nbsp; &nbsp;\r\n	针对各层面投资者的需求，为您设计符合其要求的网站功能结构框架，并建议和协助您整理信息披露内容。</p><p>&nbsp; &nbsp;\r\n	企业信息的披露平台：</p><p>&nbsp; &nbsp;\r\n	我们为您提供功能强大的信息披露平台，这是一套应用成熟的信息发布系统，只需简单操作，您即可第一时间轻松发布新闻、活动、法律文件、财报、分析报告等投资者关心的各类资讯。</p><p>&nbsp; &nbsp;\r\n	舆论宣传平台：</p><p>&nbsp; &nbsp;\r\n	宣传集团及下属机构的出色业绩、公益投入、社会回馈等，塑造集团的可信赖的公众形象。</p><p>&nbsp; &nbsp;\r\n	3、投资者沟通平台</p><p>&nbsp; &nbsp;\r\n	介绍上市公司业绩及年报等，增强投资者信心，赢得公众信赖。</p><p>&nbsp; &nbsp;\r\n	4、人才储备平台</p><p>&nbsp; &nbsp;\r\n	为集团及下属机构建立人力资源平台,及时发布招聘信息,建立人才储备,为集团获得长远竞争力。</p><p>&nbsp; &nbsp;\r\n	5、业务推介平台</p><p>&nbsp; &nbsp;\r\n	对于集团的主营业务及重点项目进行推介,增强投资者信心,赢得社会美誉度，展示产品和服务,与消费者进行沟通。</p><p>&nbsp; &nbsp;\r\n	6、形象展示平台</p><p>&nbsp; &nbsp;\r\n	传递企业的价值观与核心理念,社会责任和未来发展.展示集团品牌形象。</p><p>&nbsp; &nbsp;\r\n	7、网上调研</p><p>&nbsp; &nbsp;\r\n	我们为您提供与投资人的在线互动，您可以使用网上调研功能，了解投资人的需求和动态；投资人也可以通过这项服务提升企业管理参与感。</p><p>&nbsp; &nbsp;\r\n	8、网站运营维护方案</p><p>&nbsp; &nbsp;\r\n	根据您的企业日常管理模式，我们将为您建议网站日常信息提供、审核、发布的一整套运转方案，协助您高效地管理网站。</p><p>&nbsp; &nbsp;\r\n	9、完善的管理体系</p><p>&nbsp; &nbsp;\r\n	集团网站的管理不仅仅是平台的建设问题，更重要的是管理体系的建立，没有完善的管理体现功能再强大，页面再美观的网站也不过是空中楼阁。方维网络结合多年管理经验，帮助集团公司建立内部和管理制度和体系。</p><p>&nbsp; &nbsp;\r\n	10、数据安全和日志记录</p><p>&nbsp; &nbsp;\r\n	管理系统具备详细的登录和访问日志记录，以方便安全分析。同时拥有完善的数据备份和恢复模块，保障数据的安全。</p><p>&nbsp; &nbsp;\r\n	11、权限管理和信息审核</p><p>&nbsp; &nbsp;\r\n	因为集团网站的信息管理和维护涉及的面非常广泛，网站的管理人员可能达到几十人到上百人，权限的管理和信息的审核非常重要。</p><p>&nbsp; &nbsp;\r\n	方维网络根据集团上市公司的情况及需求的不同，给出具有针对性的网站建设解决方案。</p>', '{\"linkurl\":\"\",\"urlrule\":0,\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"10\",\"mpagesize\":\"10\",\"page\":\"page.html\",\"list\":\"page.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"html\":0}', '0', null);
INSERT INTO `dr_1_share_category` VALUES ('32', '0', '28', '', '0,28', '商业楼宇', 'commerclal', 'solution/', '0', '32', null, null, '', '1', '<p>随着集团上市公司的不断壮大，集团企业、上市公司的信息需要采用各种途径公众于媒体、上级领导、内部员工、投资合作者、应聘者、消费者和供应商等目标人群并与他们进行沟通,如何满足这些人群的需求，这是集团企业需要解决的问题。</p><p>&nbsp; &nbsp;\r\n	无疑，网站便是最行之有效、最直接、最权威的信息发布平台。如何建造一个既符合企业形象，又能体现企业发展实力的网络平台，便成了集团上市公司树立良好网络形象的重重之重。</p><p>&nbsp; &nbsp;\r\n	方维网络为各大集团上市公司提供网站建设解决方案，网站建设、网站设计、网页设计、FLAS动画设计、网络平台开发。</p><p>&nbsp; &nbsp;\r\n	目前上市企业和集团网站的常见问题：</p><p>&nbsp; &nbsp;\r\n	● 网络形象没有受到重视，影响投资者对公司的判断！</p><p>&nbsp; &nbsp;\r\n	● 网站没有及时披露信息，不能为投资者带来帮助！</p><p>&nbsp; &nbsp;\r\n	● 网站程序技术相对落后，更新麻烦！</p><p>&nbsp; &nbsp;\r\n	● 网站设计上没有良好的体现公司文化和价值！</p><p>&nbsp; &nbsp;\r\n	● 在搜索引擎（如百度、谷歌等）上找不到网站资料，根本没有推广！</p><p>&nbsp; &nbsp;\r\n	1、咨询调研报告</p><p>&nbsp; &nbsp;\r\n	了解您的企业特性，分析此行业投资者构成，为您梳理特定的需求；</p><p>&nbsp; &nbsp;\r\n	2、上市公司功能和结构设计</p><p>&nbsp; &nbsp;\r\n	针对各层面投资者的需求，为您设计符合其要求的网站功能结构框架，并建议和协助您整理信息披露内容。</p><p>&nbsp; &nbsp;\r\n	企业信息的披露平台：</p><p>&nbsp; &nbsp;\r\n	我们为您提供功能强大的信息披露平台，这是一套应用成熟的信息发布系统，只需简单操作，您即可第一时间轻松发布新闻、活动、法律文件、财报、分析报告等投资者关心的各类资讯。</p><p>&nbsp; &nbsp;\r\n	舆论宣传平台：</p><p>&nbsp; &nbsp;\r\n	宣传集团及下属机构的出色业绩、公益投入、社会回馈等，塑造集团的可信赖的公众形象。</p><p>&nbsp; &nbsp;\r\n	3、投资者沟通平台</p><p>&nbsp; &nbsp;\r\n	介绍上市公司业绩及年报等，增强投资者信心，赢得公众信赖。</p><p>&nbsp; &nbsp;\r\n	4、人才储备平台</p><p>&nbsp; &nbsp;\r\n	为集团及下属机构建立人力资源平台,及时发布招聘信息,建立人才储备,为集团获得长远竞争力。</p><p>&nbsp; &nbsp;\r\n	5、业务推介平台</p><p>&nbsp; &nbsp;\r\n	对于集团的主营业务及重点项目进行推介,增强投资者信心,赢得社会美誉度，展示产品和服务,与消费者进行沟通。</p><p>&nbsp; &nbsp;\r\n	6、形象展示平台</p><p>&nbsp; &nbsp;\r\n	传递企业的价值观与核心理念,社会责任和未来发展.展示集团品牌形象。</p><p>&nbsp; &nbsp;\r\n	7、网上调研</p><p>&nbsp; &nbsp;\r\n	我们为您提供与投资人的在线互动，您可以使用网上调研功能，了解投资人的需求和动态；投资人也可以通过这项服务提升企业管理参与感。</p><p>&nbsp; &nbsp;\r\n	8、网站运营维护方案</p><p>&nbsp; &nbsp;\r\n	根据您的企业日常管理模式，我们将为您建议网站日常信息提供、审核、发布的一整套运转方案，协助您高效地管理网站。</p><p>&nbsp; &nbsp;\r\n	9、完善的管理体系</p><p>&nbsp; &nbsp;\r\n	集团网站的管理不仅仅是平台的建设问题，更重要的是管理体系的建立，没有完善的管理体现功能再强大，页面再美观的网站也不过是空中楼阁。方维网络结合多年管理经验，帮助集团公司建立内部和管理制度和体系。</p><p>&nbsp; &nbsp;\r\n	10、数据安全和日志记录</p><p>&nbsp; &nbsp;\r\n	管理系统具备详细的登录和访问日志记录，以方便安全分析。同时拥有完善的数据备份和恢复模块，保障数据的安全。</p><p>&nbsp; &nbsp;\r\n	11、权限管理和信息审核</p><p>&nbsp; &nbsp;\r\n	因为集团网站的信息管理和维护涉及的面非常广泛，网站的管理人员可能达到几十人到上百人，权限的管理和信息的审核非常重要。</p><p>&nbsp; &nbsp;\r\n	方维网络根据集团上市公司的情况及需求的不同，给出具有针对性的网站建设解决方案。</p>', '{\"linkurl\":\"\",\"urlrule\":0,\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"10\",\"mpagesize\":\"10\",\"page\":\"page.html\",\"list\":\"page.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"html\":0}', '0', null);
INSERT INTO `dr_1_share_category` VALUES ('33', '0', '28', '', '0,28', '交通枢纽', 'hub', 'solution/', '0', '33', null, null, '', '1', '<p>随着集团上市公司的不断壮大，集团企业、上市公司的信息需要采用各种途径公众于媒体、上级领导、内部员工、投资合作者、应聘者、消费者和供应商等目标人群并与他们进行沟通,如何满足这些人群的需求，这是集团企业需要解决的问题。</p><p>&nbsp; &nbsp;\r\n	无疑，网站便是最行之有效、最直接、最权威的信息发布平台。如何建造一个既符合企业形象，又能体现企业发展实力的网络平台，便成了集团上市公司树立良好网络形象的重重之重。</p><p>&nbsp; &nbsp;\r\n	方维网络为各大集团上市公司提供网站建设解决方案，网站建设、网站设计、网页设计、FLAS动画设计、网络平台开发。</p><p>&nbsp; &nbsp;\r\n	目前上市企业和集团网站的常见问题：</p><p>&nbsp; &nbsp;\r\n	● 网络形象没有受到重视，影响投资者对公司的判断！</p><p>&nbsp; &nbsp;\r\n	● 网站没有及时披露信息，不能为投资者带来帮助！</p><p>&nbsp; &nbsp;\r\n	● 网站程序技术相对落后，更新麻烦！</p><p>&nbsp; &nbsp;\r\n	● 网站设计上没有良好的体现公司文化和价值！</p><p>&nbsp; &nbsp;\r\n	● 在搜索引擎（如百度、谷歌等）上找不到网站资料，根本没有推广！</p><p>&nbsp; &nbsp;\r\n	1、咨询调研报告</p><p>&nbsp; &nbsp;\r\n	了解您的企业特性，分析此行业投资者构成，为您梳理特定的需求；</p><p>&nbsp; &nbsp;\r\n	2、上市公司功能和结构设计</p><p>&nbsp; &nbsp;\r\n	针对各层面投资者的需求，为您设计符合其要求的网站功能结构框架，并建议和协助您整理信息披露内容。</p><p>&nbsp; &nbsp;\r\n	企业信息的披露平台：</p><p>&nbsp; &nbsp;\r\n	我们为您提供功能强大的信息披露平台，这是一套应用成熟的信息发布系统，只需简单操作，您即可第一时间轻松发布新闻、活动、法律文件、财报、分析报告等投资者关心的各类资讯。</p><p>&nbsp; &nbsp;\r\n	舆论宣传平台：</p><p>&nbsp; &nbsp;\r\n	宣传集团及下属机构的出色业绩、公益投入、社会回馈等，塑造集团的可信赖的公众形象。</p><p>&nbsp; &nbsp;\r\n	3、投资者沟通平台</p><p>&nbsp; &nbsp;\r\n	介绍上市公司业绩及年报等，增强投资者信心，赢得公众信赖。</p><p>&nbsp; &nbsp;\r\n	4、人才储备平台</p><p>&nbsp; &nbsp;\r\n	为集团及下属机构建立人力资源平台,及时发布招聘信息,建立人才储备,为集团获得长远竞争力。</p><p>&nbsp; &nbsp;\r\n	5、业务推介平台</p><p>&nbsp; &nbsp;\r\n	对于集团的主营业务及重点项目进行推介,增强投资者信心,赢得社会美誉度，展示产品和服务,与消费者进行沟通。</p><p>&nbsp; &nbsp;\r\n	6、形象展示平台</p><p>&nbsp; &nbsp;\r\n	传递企业的价值观与核心理念,社会责任和未来发展.展示集团品牌形象。</p><p>&nbsp; &nbsp;\r\n	7、网上调研</p><p>&nbsp; &nbsp;\r\n	我们为您提供与投资人的在线互动，您可以使用网上调研功能，了解投资人的需求和动态；投资人也可以通过这项服务提升企业管理参与感。</p><p>&nbsp; &nbsp;\r\n	8、网站运营维护方案</p><p>&nbsp; &nbsp;\r\n	根据您的企业日常管理模式，我们将为您建议网站日常信息提供、审核、发布的一整套运转方案，协助您高效地管理网站。</p><p>&nbsp; &nbsp;\r\n	9、完善的管理体系</p><p>&nbsp; &nbsp;\r\n	集团网站的管理不仅仅是平台的建设问题，更重要的是管理体系的建立，没有完善的管理体现功能再强大，页面再美观的网站也不过是空中楼阁。方维网络结合多年管理经验，帮助集团公司建立内部和管理制度和体系。</p><p>&nbsp; &nbsp;\r\n	10、数据安全和日志记录</p><p>&nbsp; &nbsp;\r\n	管理系统具备详细的登录和访问日志记录，以方便安全分析。同时拥有完善的数据备份和恢复模块，保障数据的安全。</p><p>&nbsp; &nbsp;\r\n	11、权限管理和信息审核</p><p>&nbsp; &nbsp;\r\n	因为集团网站的信息管理和维护涉及的面非常广泛，网站的管理人员可能达到几十人到上百人，权限的管理和信息的审核非常重要。</p><p>&nbsp; &nbsp;\r\n	方维网络根据集团上市公司的情况及需求的不同，给出具有针对性的网站建设解决方案。</p>', '{\"linkurl\":\"\",\"urlrule\":0,\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"10\",\"mpagesize\":\"10\",\"page\":\"page.html\",\"list\":\"page.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"html\":0}', '0', null);
INSERT INTO `dr_1_share_category` VALUES ('34', '0', '0', '', '0', '人才招聘', 'join', '', '1', '34,35,36', '', '', '', '1', '', '{\"linkurl\":\"\",\"getchild\":\"1\",\"urlrule\":\"\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"9\",\"mpagesize\":\"10\",\"page\":\"page.html\",\"list\":\"join.html\",\"category\":\"join.html\",\"search\":\"search.html\",\"show\":\"show.html\"}}', '0', 'RECRUITMENT');
INSERT INTO `dr_1_share_category` VALUES ('35', '1', '34', 'join', '0,34', '人才招聘', 'join1', 'join/', '0', '35', '', '', '', '1', '', '{\"linkurl\":\"\",\"urlrule\":\"\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"9\",\"mpagesize\":\"9\",\"page\":\"page.html\",\"list\":\"join.html\",\"category\":\"join.html\",\"search\":\"search.html\",\"show\":\"show.html\"}}', '0', 'RECRUITMENT');
INSERT INTO `dr_1_share_category` VALUES ('37', '0', '0', '', '0', '联系我们', 'contact', '', '1', '37,38,39', '', '', '', '1', '', '{\"linkurl\":\"\",\"getchild\":\"1\",\"urlrule\":\"\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"10\",\"mpagesize\":\"10\",\"page\":\"contact.html\",\"list\":\"page.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"}}', '0', 'CONTACT US');
INSERT INTO `dr_1_share_category` VALUES ('36', '1', '34', 'news', '0,34', '人才理念', 'career', 'join/', '0', '36', '', '', '', '1', '&lt;p&gt;&lt;span style=&quot;color: rgb(146, 146, 146); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 15px;&quot;&gt;某某强调人力资本不断增值的目标优先于财务资本增值的目标。某某员工的职业成长主要由“分类分层、系统完善”的培训体系和提供晋升双通道的任职资格管理体系支撑。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(146, 146, 146); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 15px; white-space: normal;&quot;&gt;我们将持续的人力资源开发作为实现人力资本增值目标的重要条件，并永不停息地致力于建设一个学习型组织。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '{\"linkurl\":\"\",\"urlrule\":\"\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"10\",\"mpagesize\":\"10\",\"page\":\"page.html\",\"list\":\"career.html\",\"category\":\"career.html\",\"search\":\"search.html\",\"show\":\"show.html\"}}', '0', 'CAREER DEVELOPMENT');
INSERT INTO `dr_1_share_category` VALUES ('38', '0', '37', '', '0,37', '联系我们', 'contact1', 'contact/', '0', '38', '', '', '', '1', '', '{\"linkurl\":\"\",\"urlrule\":\"\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"10\",\"mpagesize\":\"10\",\"page\":\"contact.html\",\"list\":\"page.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"}}', '0', '');
INSERT INTO `dr_1_share_category` VALUES ('39', '0', '37', '', '0,37', '留言反馈', 'feedback', 'contact/', '0', '39', '', '', '', '1', '', '{\"linkurl\":\"\",\"urlrule\":\"\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{modname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"10\",\"mpagesize\":\"10\",\"page\":\"complaint.html\",\"list\":\"page.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"}}', '0', 'FEEDBACK');

-- ----------------------------
-- Table structure for dr_1_share_index
-- ----------------------------
DROP TABLE IF EXISTS `dr_1_share_index`;
CREATE TABLE `dr_1_share_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` varchar(20) NOT NULL COMMENT '模块目录',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COMMENT='共享模块内容索引表';

-- ----------------------------
-- Records of dr_1_share_index
-- ----------------------------
INSERT INTO `dr_1_share_index` VALUES ('1', 'news');
INSERT INTO `dr_1_share_index` VALUES ('2', 'news');
INSERT INTO `dr_1_share_index` VALUES ('3', 'news');
INSERT INTO `dr_1_share_index` VALUES ('4', 'news');
INSERT INTO `dr_1_share_index` VALUES ('5', 'news');
INSERT INTO `dr_1_share_index` VALUES ('6', 'news');
INSERT INTO `dr_1_share_index` VALUES ('7', 'news');
INSERT INTO `dr_1_share_index` VALUES ('8', 'news');
INSERT INTO `dr_1_share_index` VALUES ('9', 'news');
INSERT INTO `dr_1_share_index` VALUES ('10', 'news');
INSERT INTO `dr_1_share_index` VALUES ('11', 'news');
INSERT INTO `dr_1_share_index` VALUES ('12', 'news');
INSERT INTO `dr_1_share_index` VALUES ('13', 'news');
INSERT INTO `dr_1_share_index` VALUES ('14', 'news');
INSERT INTO `dr_1_share_index` VALUES ('15', 'news');
INSERT INTO `dr_1_share_index` VALUES ('16', 'news');
INSERT INTO `dr_1_share_index` VALUES ('17', 'news');
INSERT INTO `dr_1_share_index` VALUES ('18', 'news');
INSERT INTO `dr_1_share_index` VALUES ('19', 'news');
INSERT INTO `dr_1_share_index` VALUES ('20', 'news');
INSERT INTO `dr_1_share_index` VALUES ('21', 'news');
INSERT INTO `dr_1_share_index` VALUES ('22', 'news');
INSERT INTO `dr_1_share_index` VALUES ('23', 'news');
INSERT INTO `dr_1_share_index` VALUES ('24', 'news');
INSERT INTO `dr_1_share_index` VALUES ('25', 'photo');
INSERT INTO `dr_1_share_index` VALUES ('26', 'photo');
INSERT INTO `dr_1_share_index` VALUES ('27', 'photo');
INSERT INTO `dr_1_share_index` VALUES ('28', 'photo');
INSERT INTO `dr_1_share_index` VALUES ('29', 'photo');
INSERT INTO `dr_1_share_index` VALUES ('30', 'photo');
INSERT INTO `dr_1_share_index` VALUES ('31', 'photo');
INSERT INTO `dr_1_share_index` VALUES ('32', 'photo');
INSERT INTO `dr_1_share_index` VALUES ('33', 'photo');
INSERT INTO `dr_1_share_index` VALUES ('34', 'photo');
INSERT INTO `dr_1_share_index` VALUES ('35', 'photo');
INSERT INTO `dr_1_share_index` VALUES ('36', 'photo');
INSERT INTO `dr_1_share_index` VALUES ('37', 'down');
INSERT INTO `dr_1_share_index` VALUES ('38', 'down');
INSERT INTO `dr_1_share_index` VALUES ('39', 'down');
INSERT INTO `dr_1_share_index` VALUES ('40', 'down');
INSERT INTO `dr_1_share_index` VALUES ('41', 'news');
INSERT INTO `dr_1_share_index` VALUES ('42', 'question');
INSERT INTO `dr_1_share_index` VALUES ('43', 'question');
INSERT INTO `dr_1_share_index` VALUES ('44', 'question');
INSERT INTO `dr_1_share_index` VALUES ('45', 'question');
INSERT INTO `dr_1_share_index` VALUES ('46', 'join');
INSERT INTO `dr_1_share_index` VALUES ('47', 'news');
INSERT INTO `dr_1_share_index` VALUES ('48', 'news');
INSERT INTO `dr_1_share_index` VALUES ('49', 'news');
INSERT INTO `dr_1_share_index` VALUES ('50', 'news');
INSERT INTO `dr_1_share_index` VALUES ('51', 'news');
INSERT INTO `dr_1_share_index` VALUES ('52', 'news');
INSERT INTO `dr_1_share_index` VALUES ('53', 'news');
INSERT INTO `dr_1_share_index` VALUES ('54', 'news');

-- ----------------------------
-- Table structure for dr_admin
-- ----------------------------
DROP TABLE IF EXISTS `dr_admin`;
CREATE TABLE `dr_admin` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL COMMENT '管理员uid',
  `setting` text COMMENT '相关配置',
  `usermenu` text COMMENT '自定义面板菜单，序列化数组格式',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of dr_admin
-- ----------------------------
INSERT INTO `dr_admin` VALUES ('1', '1', '', '');

-- ----------------------------
-- Table structure for dr_admin_login
-- ----------------------------
DROP TABLE IF EXISTS `dr_admin_login`;
CREATE TABLE `dr_admin_login` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned DEFAULT NULL COMMENT '会员uid',
  `loginip` varchar(50) NOT NULL COMMENT '登录Ip',
  `logintime` int(10) unsigned NOT NULL COMMENT '登录时间',
  `useragent` varchar(255) NOT NULL COMMENT '客户端信息',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `loginip` (`loginip`),
  KEY `logintime` (`logintime`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='登录日志记录';

-- ----------------------------
-- Records of dr_admin_login
-- ----------------------------
INSERT INTO `dr_admin_login` VALUES ('1', '1', '127.0.0.1', '1573117178', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36');
INSERT INTO `dr_admin_login` VALUES ('2', '1', '127.0.0.1', '1573191615', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36');
INSERT INTO `dr_admin_login` VALUES ('3', '1', '127.0.0.1', '1573364479', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `dr_admin_login` VALUES ('4', '1', '127.0.0.1', '1573346266', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `dr_admin_login` VALUES ('5', '1', '127.0.0.1', '1573796751', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');

-- ----------------------------
-- Table structure for dr_admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `dr_admin_menu`;
CREATE TABLE `dr_admin_menu` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(5) unsigned NOT NULL COMMENT '上级菜单id',
  `name` text NOT NULL COMMENT '菜单语言名称',
  `uri` varchar(255) DEFAULT NULL COMMENT 'uri字符串',
  `url` varchar(255) DEFAULT NULL COMMENT '外链地址',
  `mark` varchar(255) DEFAULT NULL COMMENT '菜单标识',
  `hidden` tinyint(1) unsigned DEFAULT NULL COMMENT '是否隐藏',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标标示',
  `displayorder` int(5) DEFAULT NULL COMMENT '排序值',
  PRIMARY KEY (`id`),
  KEY `list` (`pid`),
  KEY `displayorder` (`displayorder`),
  KEY `mark` (`mark`),
  KEY `hidden` (`hidden`),
  KEY `uri` (`uri`)
) ENGINE=MyISAM AUTO_INCREMENT=128 DEFAULT CHARSET=utf8 COMMENT='后台菜单表';

-- ----------------------------
-- Records of dr_admin_menu
-- ----------------------------
INSERT INTO `dr_admin_menu` VALUES ('1', '0', '首页', '', '', 'home', '0', 'fa fa-home', '0');
INSERT INTO `dr_admin_menu` VALUES ('2', '1', '我的面板', '', '', 'home-my', '0', 'fa fa-home', '0');
INSERT INTO `dr_admin_menu` VALUES ('3', '2', '后台首页', 'home/main', '', '', '0', 'fa fa-home', '0');
INSERT INTO `dr_admin_menu` VALUES ('4', '2', '资料修改', 'api/my', '', '', '0', 'fa fa-user', '0');
INSERT INTO `dr_admin_menu` VALUES ('5', '2', '系统更新', 'cache/index', '', '', '0', 'fa fa-refresh', '0');
INSERT INTO `dr_admin_menu` VALUES ('6', '2', '文件更新', 'cloud/bf', '', '', '0', 'fa fa-code', '0');
INSERT INTO `dr_admin_menu` VALUES ('7', '0', '系统', '', '', 'system', '0', 'fa fa-globe', '0');
INSERT INTO `dr_admin_menu` VALUES ('8', '7', '系统维护', '', '', 'system-wh', '0', 'fa fa-cog', '0');
INSERT INTO `dr_admin_menu` VALUES ('9', '8', '系统环境', 'system/index', '', '', '0', 'fa fa-cog', '0');
INSERT INTO `dr_admin_menu` VALUES ('10', '8', '系统缓存', 'system_cache/index', '', '', '0', 'fa fa-clock-o', '0');
INSERT INTO `dr_admin_menu` VALUES ('11', '8', '附件设置', 'attachment/index', '', '', '0', 'fa fa-folder', '0');
INSERT INTO `dr_admin_menu` VALUES ('12', '8', '短信设置', 'sms/index', '', '', '0', 'fa fa-envelope', '0');
INSERT INTO `dr_admin_menu` VALUES ('13', '8', '邮件设置', 'email/index', '', '', '0', 'fa fa-envelope-open', '0');
INSERT INTO `dr_admin_menu` VALUES ('14', '8', '系统提醒', 'notice/index', '', '', '0', 'fa fa-bell', '0');
INSERT INTO `dr_admin_menu` VALUES ('15', '8', '数据字典', 'db/index', '', '', '0', 'fa fa-database', '0');
INSERT INTO `dr_admin_menu` VALUES ('16', '8', 'Bom检测', 'check_bom/index', '', '', '0', 'fa fa-code', '0');
INSERT INTO `dr_admin_menu` VALUES ('17', '8', '系统体检', 'check/index', '', '', '0', 'fa fa-wrench', '0');
INSERT INTO `dr_admin_menu` VALUES ('18', '7', '日志管理', '', '', 'system-log', '0', 'fa fa-calendar', '0');
INSERT INTO `dr_admin_menu` VALUES ('19', '18', 'PHP错误', 'error_php/index', '', '', '0', 'fa fa-bug', '0');
INSERT INTO `dr_admin_menu` VALUES ('20', '18', '系统错误', 'error/index', '', '', '0', 'fa fa-shield', '0');
INSERT INTO `dr_admin_menu` VALUES ('21', '18', '操作日志', 'system_log/index', '', '', '0', 'fa fa-calendar', '0');
INSERT INTO `dr_admin_menu` VALUES ('22', '18', '短信日志', 'sms_log/index', '', '', '0', 'fa fa-envelope', '0');
INSERT INTO `dr_admin_menu` VALUES ('23', '18', '邮件日志', 'email_log/index', '', '', '0', 'fa fa-envelope-open', '0');
INSERT INTO `dr_admin_menu` VALUES ('24', '0', '设置', '', '', 'config', '0', 'fa fa-cogs', '0');
INSERT INTO `dr_admin_menu` VALUES ('25', '24', '网站设置', '', '', 'config-web', '0', 'fa fa-cog', '0');
INSERT INTO `dr_admin_menu` VALUES ('26', '25', '网站设置', 'site_config/index', '', '', '0', 'fa fa-cog', '0');
INSERT INTO `dr_admin_menu` VALUES ('27', '25', '终端设置', 'site_client/index', '', '', '0', 'fa fa-cogs', '0');
INSERT INTO `dr_admin_menu` VALUES ('28', '25', '手机设置', 'site_mobile/index', '', '', '0', 'fa fa-mobile', '0');
INSERT INTO `dr_admin_menu` VALUES ('29', '25', '域名绑定', 'site_domain/index', '', '', '0', 'fa fa-globe', '0');
INSERT INTO `dr_admin_menu` VALUES ('30', '25', '图片设置', 'site_image/index', '', '', '0', 'fa fa-photo', '0');
INSERT INTO `dr_admin_menu` VALUES ('31', '24', '内容设置', '', '', 'config-content', '0', 'fa fa-navicon', '0');
INSERT INTO `dr_admin_menu` VALUES ('32', '31', '创建模块', 'module_create/index', '', '', '0', 'fa fa-plus', '0');
INSERT INTO `dr_admin_menu` VALUES ('33', '31', '模块管理', 'module/index', '', '', '0', 'fa fa-gears', '0');
INSERT INTO `dr_admin_menu` VALUES ('34', '31', '模块搜索', 'module_search/index', '', '', '0', 'fa fa-search', '0');
INSERT INTO `dr_admin_menu` VALUES ('35', '31', '模块评论', 'module_comment/index', '', '', '0', 'fa fa-comments', '0');
INSERT INTO `dr_admin_menu` VALUES ('36', '31', '网站表单', 'form/index', '', '', '0', 'fa fa-table', '0');
INSERT INTO `dr_admin_menu` VALUES ('37', '24', 'SEO设置', '', '', 'config-seo', '0', 'fa fa-internet-explorer', '0');
INSERT INTO `dr_admin_menu` VALUES ('38', '37', '站点SEO', 'seo_site/index', '', '', '0', 'fa fa-cog', '0');
INSERT INTO `dr_admin_menu` VALUES ('39', '37', '模块SEO', 'seo_module/index', '', '', '0', 'fa fa-gears', '0');
INSERT INTO `dr_admin_menu` VALUES ('40', '37', '内容SEO', 'seo_content/index', '', '', '0', 'fa fa-th-large', '0');
INSERT INTO `dr_admin_menu` VALUES ('41', '37', '栏目SEO', 'seo_category/index', '', '', '0', 'fa fa-reorder', '0');
INSERT INTO `dr_admin_menu` VALUES ('42', '37', '搜索SEO', 'seo_search/index', '', '', '0', 'fa fa-search', '0');
INSERT INTO `dr_admin_menu` VALUES ('43', '37', 'URL规则', 'urlrule/index', '', '', '0', 'fa fa-link', '0');
INSERT INTO `dr_admin_menu` VALUES ('44', '24', '用户设置', '', '', 'config-member', '0', 'fa fa-user', '0');
INSERT INTO `dr_admin_menu` VALUES ('45', '44', '用户设置', 'member_setting/index', '', '', '0', 'fa fa-cog', '0');
INSERT INTO `dr_admin_menu` VALUES ('46', '44', '字段划分', 'member_field/index', '', '', '0', 'fa fa-code', '0');
INSERT INTO `dr_admin_menu` VALUES ('47', '44', '通知设置', 'member_setting_notice/index', '', '', '0', 'fa fa-volume-up', '0');
INSERT INTO `dr_admin_menu` VALUES ('48', '24', '支付设置', '', '', 'config-pay', '0', 'fa fa-rmb', '0');
INSERT INTO `dr_admin_menu` VALUES ('49', '48', '支付设置', 'member_payconfig/index', '', '', '0', 'fa fa-cog', '0');
INSERT INTO `dr_admin_menu` VALUES ('50', '48', '支付接口', 'member_payapi/index', '', '', '0', 'fa fa-code', '0');
INSERT INTO `dr_admin_menu` VALUES ('51', '0', '权限', '', '', 'auth', '0', 'fa fa-user-circle', '0');
INSERT INTO `dr_admin_menu` VALUES ('52', '51', '后台权限', '', '', 'auth-admin', '0', 'fa fa-cog', '0');
INSERT INTO `dr_admin_menu` VALUES ('53', '52', '后台菜单', 'menu/index', '', '', '0', 'fa fa-list-alt', '0');
INSERT INTO `dr_admin_menu` VALUES ('54', '52', '角色权限', 'role/index', '', '', '0', 'fa fa-users', '0');
INSERT INTO `dr_admin_menu` VALUES ('55', '52', '角色账号', 'root/index', '', '', '0', 'fa fa-user', '0');
INSERT INTO `dr_admin_menu` VALUES ('56', '52', '审核流程', 'verify/index', '', '', '0', 'fa fa-sort-numeric-asc', '0');
INSERT INTO `dr_admin_menu` VALUES ('57', '51', '用户权限', '', '', 'auth-member', '0', 'fa fa-user', '0');
INSERT INTO `dr_admin_menu` VALUES ('58', '57', '用户菜单', 'member_menu/index', '', '', '0', 'fa fa-list-alt', '0');
INSERT INTO `dr_admin_menu` VALUES ('59', '57', '内容权限', 'module_member/index', '', '', '0', 'fa fa-th-large', '0');
INSERT INTO `dr_admin_menu` VALUES ('60', '57', '用户组权限', 'member_setting_group/index', '', '', '0', 'fa fa-group', '0');
INSERT INTO `dr_admin_menu` VALUES ('61', '0', '内容', '', '', 'content', '0', 'fa fa-th-large', '0');
INSERT INTO `dr_admin_menu` VALUES ('62', '61', '内容管理', '', '', 'content-module', '0', 'fa fa-th-large', '0');
INSERT INTO `dr_admin_menu` VALUES ('63', '62', '栏目管理', 'module_category/index', '', '', '0', 'fa fa-reorder', '0');
INSERT INTO `dr_admin_menu` VALUES ('64', '62', '静态生成', 'html/index', '', '', '0', 'fa fa-file-code-o', '0');
INSERT INTO `dr_admin_menu` VALUES ('65', '62', '内容维护', 'module_content/index', '', '', '0', 'fa fa-wrench', '0');
INSERT INTO `dr_admin_menu` VALUES ('66', '61', '网站表单', '', '', 'content-form', '0', 'fa fa-table', '0');
INSERT INTO `dr_admin_menu` VALUES ('67', '61', '内容审核', '', '', 'content-verify', '0', 'fa fa-edit', '0');
INSERT INTO `dr_admin_menu` VALUES ('68', '0', '界面', '', '', 'code', '0', 'fa fa-html5', '0');
INSERT INTO `dr_admin_menu` VALUES ('69', '68', '模板管理', '', '', 'code-html', '0', 'fa fa-home', '0');
INSERT INTO `dr_admin_menu` VALUES ('70', '69', '电脑模板', 'tpl_pc/index', '', '', '0', 'fa fa-desktop', '0');
INSERT INTO `dr_admin_menu` VALUES ('71', '69', '手机模板', 'tpl_mobile/index', '', '', '0', 'fa fa-mobile', '0');
INSERT INTO `dr_admin_menu` VALUES ('72', '69', '终端模板', 'tpl_client/index', '', '', '0', 'fa fa-cogs', '0');
INSERT INTO `dr_admin_menu` VALUES ('73', '68', '风格管理', '', '', 'code-css', '0', 'fa fa-css3', '99');
INSERT INTO `dr_admin_menu` VALUES ('74', '73', '系统文件', 'system_theme/index', '', '', '0', 'fa fa-chrome', '0');
INSERT INTO `dr_admin_menu` VALUES ('75', '73', '网站风格', 'theme/index', '', '', '0', 'fa fa-photo', '0');
INSERT INTO `dr_admin_menu` VALUES ('76', '0', '用户', '', '', 'member', '0', 'fa fa-user', '0');
INSERT INTO `dr_admin_menu` VALUES ('77', '76', '用户管理', '', '', 'member-list', '0', 'fa fa-user', '0');
INSERT INTO `dr_admin_menu` VALUES ('78', '77', '用户管理', 'member/index', '', '', '0', 'fa fa-user', '0');
INSERT INTO `dr_admin_menu` VALUES ('79', '77', '用户组管理', 'member_group/index', '', '', '0', 'fa fa-users', '0');
INSERT INTO `dr_admin_menu` VALUES ('80', '77', '提醒消息', 'member_notice/index', '', '', '0', 'fa fa-bell', '0');
INSERT INTO `dr_admin_menu` VALUES ('81', '77', '授权账号管理', 'member_oauth/index', '', '', '0', 'fa fa-qq', '0');
INSERT INTO `dr_admin_menu` VALUES ('82', '76', '审核管理', '', '', 'member-verify', '0', 'fa fa-edit', '0');
INSERT INTO `dr_admin_menu` VALUES ('83', '82', '注册审核', 'member_verify/index', '', '', '0', 'fa fa-edit', '0');
INSERT INTO `dr_admin_menu` VALUES ('84', '82', '申请审核', 'member_apply/index', '', '', '0', 'fa fa-users', '0');
INSERT INTO `dr_admin_menu` VALUES ('85', '0', '财务', '', '', 'pay', '0', 'fa fa-rmb', '0');
INSERT INTO `dr_admin_menu` VALUES ('86', '85', '财务管理', '', '', 'pay-list', '0', 'fa fa-rmb', '0');
INSERT INTO `dr_admin_menu` VALUES ('87', '86', '已付流水', 'member_paylog/index', '', '', '0', 'fa fa-calendar-check-o', '0');
INSERT INTO `dr_admin_menu` VALUES ('88', '86', '未付流水', 'member_paylog/not_index', '', '', '0', 'fa fa-calendar-times-o', '0');
INSERT INTO `dr_admin_menu` VALUES ('89', '86', '转账汇款', 'member_payremit/index', '', '', '0', 'fa fa-credit-card', '0');
INSERT INTO `dr_admin_menu` VALUES ('90', '86', '上门收款', 'member_paymeet/index', '', '', '0', 'fa fa-user', '0');
INSERT INTO `dr_admin_menu` VALUES ('91', '86', '虚拟金币', 'member_scorelog/index', '', '', '0', 'fa fa-diamond', '0');
INSERT INTO `dr_admin_menu` VALUES ('92', '86', '用户充值', 'member_pay/index', '', '', '0', 'fa fa-plus', '0');
INSERT INTO `dr_admin_menu` VALUES ('93', '0', '应用', '', '', 'app', '0', 'fa fa-puzzle-piece', '0');
INSERT INTO `dr_admin_menu` VALUES ('94', '93', '应用插件', '', '', 'app-plugin', '0', 'fa fa-puzzle-piece', '0');
INSERT INTO `dr_admin_menu` VALUES ('95', '94', '应用管理', 'cloud/local', '', '', '0', 'fa fa-folder', '0');
INSERT INTO `dr_admin_menu` VALUES ('96', '94', '联动菜单', 'linkage/index', '', '', '0', 'fa fa-columns', '0');
INSERT INTO `dr_admin_menu` VALUES ('97', '94', '任务队列', 'cron/index', '', '', '0', 'fa fa-indent', '0');
INSERT INTO `dr_admin_menu` VALUES ('98', '94', '附件管理', 'attachments/index', '', '', '0', 'fa fa-folder', '0');
INSERT INTO `dr_admin_menu` VALUES ('99', '0', '服务', '', '', 'cloud', '0', 'fa fa-cloud', '99');
INSERT INTO `dr_admin_menu` VALUES ('100', '99', '网站管理', '', '', 'cloud-dayrui', '0', 'fa fa-cloud', '0');
INSERT INTO `dr_admin_menu` VALUES ('101', '100', '我的网站', 'cloud/index', '', '', '0', 'fa fa-cog', '0');
INSERT INTO `dr_admin_menu` VALUES ('102', '100', '服务工单', 'cloud/service', '', '', '0', 'fa fa-user-md', '0');
INSERT INTO `dr_admin_menu` VALUES ('103', '100', '应用商城', 'cloud/app', '', '', '0', 'fa fa-puzzle-piece', '0');
INSERT INTO `dr_admin_menu` VALUES ('104', '100', '组件商城', 'cloud/func', '', '', '0', 'fa fa-plug', '0');
INSERT INTO `dr_admin_menu` VALUES ('105', '100', '模板商城', 'cloud/template', '', '', '0', 'fa fa-html5', '0');
INSERT INTO `dr_admin_menu` VALUES ('106', '100', '版本升级', 'cloud/update', '', '', '0', 'fa fa-refresh', '0');
INSERT INTO `dr_admin_menu` VALUES ('107', '62', '文章管理', 'news/home/index', '', 'module-news', '0', 'fa fa-sticky-note', '-1');
INSERT INTO `dr_admin_menu` VALUES ('108', '67', '文章审核', 'news/verify/index', '', 'verify-module-news', '0', 'fa fa-sticky-note', '-1');
INSERT INTO `dr_admin_menu` VALUES ('109', '67', '文章评论', 'news/comment_verify/index', '', 'verify-comment-news', '0', 'fa fa-comments', '-1');
INSERT INTO `dr_admin_menu` VALUES ('110', '62', '图片管理', 'photo/home/index', '', 'module-photo', '0', 'fa fa-photo', '-1');
INSERT INTO `dr_admin_menu` VALUES ('111', '67', '图片审核', 'photo/verify/index', '', 'verify-module-photo', '0', 'fa fa-photo', '-1');
INSERT INTO `dr_admin_menu` VALUES ('112', '67', '图片评论', 'photo/comment_verify/index', '', 'verify-comment-photo', '0', 'fa fa-comments', '-1');
INSERT INTO `dr_admin_menu` VALUES ('113', '94', '自定义资料', 'block/home/index', '', '', '0', 'fa fa-th-large', '0');
INSERT INTO `dr_admin_menu` VALUES ('114', '94', '自定义链接', 'navigator/home/index', '', '', '0', 'fa fa-link', '0');
INSERT INTO `dr_admin_menu` VALUES ('115', '94', '系统安全', 'safe/home/index', '', '', '0', 'fa fa-shield', '0');
INSERT INTO `dr_admin_menu` VALUES ('116', '94', '自定义页面', 'page/home/index', '', '', '0', 'fa fa-safari', '0');
INSERT INTO `dr_admin_menu` VALUES ('117', '62', '下载管理', 'down/home/index', '', 'module-down', '0', 'fa fa-download', '-1');
INSERT INTO `dr_admin_menu` VALUES ('118', '67', '下载审核', 'down/verify/index', '', 'verify-module-down', '0', 'fa fa-download', '-1');
INSERT INTO `dr_admin_menu` VALUES ('119', '67', '下载评论', 'down/comment_verify/index', '', 'verify-comment-down', '0', 'fa fa-comments', '-1');
INSERT INTO `dr_admin_menu` VALUES ('120', '62', '常见问题管理', 'question/home/index', '', 'module-question', '0', 'fa fa-question', '-1');
INSERT INTO `dr_admin_menu` VALUES ('121', '67', '常见问题审核', 'question/verify/index', '', 'verify-module-question', '0', 'fa fa-question', '-1');
INSERT INTO `dr_admin_menu` VALUES ('122', '67', '常见问题评论', 'question/comment_verify/index', '', 'verify-comment-question', '0', 'fa fa-comments', '-1');
INSERT INTO `dr_admin_menu` VALUES ('123', '66', '投诉及维修管理', 'form/complaint/index', '', 'form-complaint', '0', '', '0');
INSERT INTO `dr_admin_menu` VALUES ('124', '67', '投诉及维修审核', 'form/complaint_verify/index', '', 'verify-form-complaint', '0', null, '0');
INSERT INTO `dr_admin_menu` VALUES ('125', '62', '人才招聘管理', 'join/home/index', '', 'module-join', '0', 'fa fa-user', '-1');
INSERT INTO `dr_admin_menu` VALUES ('126', '67', '人才招聘审核', 'join/verify/index', '', 'verify-module-join', '0', 'fa fa-user', '-1');
INSERT INTO `dr_admin_menu` VALUES ('127', '67', '人才招聘评论', 'join/comment_verify/index', '', 'verify-comment-join', '0', 'fa fa-comments', '-1');

-- ----------------------------
-- Table structure for dr_admin_notice
-- ----------------------------
DROP TABLE IF EXISTS `dr_admin_notice`;
CREATE TABLE `dr_admin_notice` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `site` int(5) NOT NULL COMMENT '站点id',
  `type` varchar(20) NOT NULL COMMENT '提醒类型：系统、内容、会员、应用',
  `msg` text NOT NULL COMMENT '提醒内容说明',
  `uri` varchar(100) NOT NULL COMMENT '对应的URI',
  `to_rid` smallint(5) NOT NULL COMMENT '指定角色组',
  `to_uid` int(10) NOT NULL COMMENT '指定管理员',
  `status` tinyint(1) NOT NULL COMMENT '未处理0，1已查看，2处理中，3处理完成',
  `uid` int(10) NOT NULL COMMENT '申请人',
  `username` varchar(100) NOT NULL COMMENT '申请人',
  `op_uid` int(10) NOT NULL COMMENT '处理人',
  `op_username` varchar(100) NOT NULL COMMENT '处理人',
  `updatetime` int(10) NOT NULL COMMENT '处理时间',
  `inputtime` int(10) NOT NULL COMMENT '提醒时间',
  PRIMARY KEY (`id`),
  KEY `uri` (`uri`),
  KEY `site` (`site`),
  KEY `status` (`status`),
  KEY `uid` (`uid`),
  KEY `op_uid` (`op_uid`),
  KEY `to_uid` (`to_uid`),
  KEY `to_rid` (`to_rid`),
  KEY `updatetime` (`updatetime`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='后台提醒表';

-- ----------------------------
-- Records of dr_admin_notice
-- ----------------------------
INSERT INTO `dr_admin_notice` VALUES ('1', '1', 'content', '投诉及维修提交审核', 'form/complaint_verify/edit:id/1', '0', '0', '0', '1', 'admin', '0', '', '0', '1573366884');
INSERT INTO `dr_admin_notice` VALUES ('2', '1', 'content', '投诉及维修提交审核', 'form/complaint_verify/edit:id/2', '0', '0', '0', '1', 'admin', '0', '', '0', '1573367164');
INSERT INTO `dr_admin_notice` VALUES ('3', '1', 'content', '投诉及维修提交审核', 'form/complaint_verify/edit:id/3', '0', '0', '0', '1', 'admin', '0', '', '0', '1573783060');

-- ----------------------------
-- Table structure for dr_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `dr_admin_role`;
CREATE TABLE `dr_admin_role` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `site` text NOT NULL COMMENT '允许管理的站点，序列化数组格式',
  `name` text NOT NULL COMMENT '角色组语言名称',
  `system` text NOT NULL COMMENT '系统权限',
  `module` text NOT NULL COMMENT '模块权限',
  `application` text NOT NULL COMMENT '应用权限',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='后台角色权限表';

-- ----------------------------
-- Records of dr_admin_role
-- ----------------------------
INSERT INTO `dr_admin_role` VALUES ('1', '', '超级管理员', '', '', '');
INSERT INTO `dr_admin_role` VALUES ('2', '', '网站编辑员', '', '', '');

-- ----------------------------
-- Table structure for dr_admin_role_index
-- ----------------------------
DROP TABLE IF EXISTS `dr_admin_role_index`;
CREATE TABLE `dr_admin_role_index` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned DEFAULT NULL COMMENT '会员uid',
  `roleid` mediumint(8) unsigned DEFAULT NULL COMMENT '角色组id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `roleid` (`roleid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='后台角色组分配表';

-- ----------------------------
-- Records of dr_admin_role_index
-- ----------------------------
INSERT INTO `dr_admin_role_index` VALUES ('1', '1', '1');

-- ----------------------------
-- Table structure for dr_admin_verify
-- ----------------------------
DROP TABLE IF EXISTS `dr_admin_verify`;
CREATE TABLE `dr_admin_verify` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL COMMENT '名称',
  `verify` text NOT NULL COMMENT '审核部署',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='审核管理表';

-- ----------------------------
-- Records of dr_admin_verify
-- ----------------------------
INSERT INTO `dr_admin_verify` VALUES ('1', '默认审核', '{\"edit\":\"1\",\"role\":{\"1\":\"2\"}}');

-- ----------------------------
-- Table structure for dr_attachment
-- ----------------------------
DROP TABLE IF EXISTS `dr_attachment`;
CREATE TABLE `dr_attachment` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `siteid` mediumint(5) unsigned NOT NULL COMMENT '站点id',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `tableid` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '附件副表id',
  `download` mediumint(8) NOT NULL DEFAULT '0' COMMENT '无用保留',
  `filesize` int(10) unsigned NOT NULL COMMENT '文件大小',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filemd5` varchar(50) NOT NULL COMMENT '文件md5值',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `author` (`author`),
  KEY `relatedtid` (`related`),
  KEY `fileext` (`fileext`),
  KEY `filemd5` (`filemd5`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of dr_attachment
-- ----------------------------
INSERT INTO `dr_attachment` VALUES ('1', '1', 'admin', '1', 'rand', '1', '0', '21899', 'jpg', '111a0c1fac19f5724b0961ef8a38ed99');
INSERT INTO `dr_attachment` VALUES ('2', '1', 'admin', '1', 'rand', '1', '0', '17337', 'jpg', '18ca165850f1fbc69f2145ced15cccd7');
INSERT INTO `dr_attachment` VALUES ('3', '1', 'admin', '1', 'rand', '1', '0', '25619', 'jpg', 'd1bea40c6636e184bec8f4fbe5f8de3e');
INSERT INTO `dr_attachment` VALUES ('4', '1', 'admin', '1', 'rand', '1', '0', '24092', 'jpg', '18cd3fcc180c33e1aecceb7c647e6644');
INSERT INTO `dr_attachment` VALUES ('5', '1', 'admin', '1', 'rand', '1', '0', '55126', 'jpg', 'caf1d53facf2bb67c41b5b51d9262dd0');
INSERT INTO `dr_attachment` VALUES ('6', '1', 'admin', '1', 'rand', '1', '0', '51446', 'jpg', '8f2d7508d2a38e13d4d5907459f80a7c');
INSERT INTO `dr_attachment` VALUES ('7', '1', 'admin', '1', 'rand', '1', '0', '59817', 'jpg', '06307a3e7c7cb46dd219b368a256ad39');
INSERT INTO `dr_attachment` VALUES ('8', '1', 'admin', '1', 'rand', '1', '0', '49040', 'jpg', 'bfd65f252474143fecdb328ad8c95b74');
INSERT INTO `dr_attachment` VALUES ('9', '1', 'admin', '1', 'rand', '1', '0', '13321', 'docx', '72ebb1daa72112395facf594d9bae4f9');
INSERT INTO `dr_attachment` VALUES ('10', '1', 'admin', '1', 'rand', '1', '0', '149347', 'jpg', 'e2654383a253a6390e20541731eefe1d');
INSERT INTO `dr_attachment` VALUES ('11', '1', 'admin', '1', 'rand', '1', '0', '53341', 'jpg', 'e57471aebba6290e362cb092b7cd5d70');
INSERT INTO `dr_attachment` VALUES ('12', '1', 'admin', '1', 'rand', '1', '0', '71026', 'jpg', '88c5bb02d4122d1df6443303228a8145');
INSERT INTO `dr_attachment` VALUES ('13', '1', 'admin', '1', 'rand', '1', '0', '72655', 'jpg', '9575be870e0939212773ae1e03eae2fc');
INSERT INTO `dr_attachment` VALUES ('14', '1', 'admin', '1', 'rand', '1', '0', '49417', 'jpg', '1de65137160ef4809955e01b7fb81028');
INSERT INTO `dr_attachment` VALUES ('15', '1', 'admin', '1', 'rand', '1', '0', '58253', 'jpg', '6e57203647cf44c6df11d0f659495517');
INSERT INTO `dr_attachment` VALUES ('16', '1', 'admin', '1', 'rand', '1', '0', '35382', 'jpg', 'f598737c0a7a9e4bf1f817e2c7f1a112');
INSERT INTO `dr_attachment` VALUES ('17', '1', 'admin', '1', 'rand', '1', '0', '30225', 'jpg', 'df3e6b4c987b7b915bb1bfd53f5347ac');
INSERT INTO `dr_attachment` VALUES ('18', '1', 'admin', '1', 'rand', '1', '0', '25078', 'jpg', '232218fbdec97946f344b735e0eeab01');
INSERT INTO `dr_attachment` VALUES ('19', '1', 'admin', '1', 'rand', '1', '0', '131658', 'jpg', 'a68f55d900cb170da5933fa07b19ce62');
INSERT INTO `dr_attachment` VALUES ('20', '1', 'admin', '1', 'rand', '1', '0', '104607', 'jpg', '9bf14e4a6531fa7cb1025ea748a9fc68');
INSERT INTO `dr_attachment` VALUES ('21', '1', 'admin', '1', 'rand', '1', '0', '54923', 'jpg', '017b6e9ce3f0afc856f7475a0c6e6c4f');
INSERT INTO `dr_attachment` VALUES ('22', '1', 'admin', '1', 'rand', '1', '0', '104607', 'jpg', '9bf14e4a6531fa7cb1025ea748a9fc68');
INSERT INTO `dr_attachment` VALUES ('23', '1', 'admin', '1', 'rand', '1', '0', '131658', 'jpg', 'a68f55d900cb170da5933fa07b19ce62');
INSERT INTO `dr_attachment` VALUES ('24', '1', 'admin', '1', 'rand', '1', '0', '76923', 'jpg', 'a64b20b1d669cf21423716270f12b5a2');
INSERT INTO `dr_attachment` VALUES ('25', '1', 'admin', '1', 'rand', '1', '0', '7873', 'png', 'a90cffef9e15e56f1bf1626de0c06035');

-- ----------------------------
-- Table structure for dr_attachment_data
-- ----------------------------
DROP TABLE IF EXISTS `dr_attachment_data`;
CREATE TABLE `dr_attachment_data` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `inputtime` (`inputtime`),
  KEY `fileext` (`fileext`),
  KEY `remote` (`remote`),
  KEY `author` (`author`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件已归档表';

-- ----------------------------
-- Records of dr_attachment_data
-- ----------------------------
INSERT INTO `dr_attachment_data` VALUES ('1', '1', 'admin', 'rand', '1569413617', 'jpg', '21899', '201911/b98333eb9366863.jpg', '0', '{\"width\":283,\"height\":182}', '1573179248');
INSERT INTO `dr_attachment_data` VALUES ('2', '1', 'admin', 'rand', '1569413640', 'jpg', '17337', '201911/c1a34e5069666be.jpg', '0', '{\"width\":283,\"height\":182}', '1573179270');
INSERT INTO `dr_attachment_data` VALUES ('3', '1', 'admin', 'rand', '1569413663', 'jpg', '25619', '201911/69979e820e1c935.jpg', '0', '{\"width\":283,\"height\":182}', '1573179293');
INSERT INTO `dr_attachment_data` VALUES ('4', '1', 'admin', 'rand', '1569413686', 'jpg', '24092', '201911/8ca0359b51b115d.jpg', '0', '{\"width\":283,\"height\":182}', '1573179314');
INSERT INTO `dr_attachment_data` VALUES ('5', '1', 'admin', 'rand', '1-19102qpj40-l', 'jpg', '55126', '201911/313306d1668df4.jpg', '0', '{\"width\":618,\"height\":400}', '1573179853');
INSERT INTO `dr_attachment_data` VALUES ('6', '1', 'admin', 'rand', '1-19102qa0400-l', 'jpg', '51446', '201911/8d42e28df0b741d.jpg', '0', '{\"width\":618,\"height\":400}', '1573192676');
INSERT INTO `dr_attachment_data` VALUES ('7', '1', 'admin', 'rand', '1-19102QRA9', 'jpg', '59817', '201911/716a661e9e4859a.jpg', '0', '{\"width\":557,\"height\":346}', '1573192749');
INSERT INTO `dr_attachment_data` VALUES ('8', '1', 'admin', 'rand', '1-19102QRF0', 'jpg', '49040', '201911/28d30f9b15dbe.jpg', '0', '{\"width\":618,\"height\":400}', '1573192822');
INSERT INTO `dr_attachment_data` VALUES ('9', '1', 'admin', 'rand', '1-19102Q60Z2', 'docx', '13321', '201911/f5ca72582378258.docx', '0', '{\"width\":null,\"height\":null}', '1573204166');
INSERT INTO `dr_attachment_data` VALUES ('10', '1', 'admin', 'rand', '1-19102QU5350-L', 'jpg', '149347', '201911/d1a01a3423b3731.jpg', '0', '{\"width\":878,\"height\":550}', '1573364556');
INSERT INTO `dr_attachment_data` VALUES ('11', '1', 'admin', 'rand', '1569490190', 'jpg', '53341', '201911/c435af358f76412.jpg', '0', '{\"width\":380,\"height\":228}', '1573372140');
INSERT INTO `dr_attachment_data` VALUES ('12', '1', 'admin', 'rand', '1569490171', 'jpg', '71026', '201911/3a8553cf3f3ca31.jpg', '0', '{\"width\":380,\"height\":228}', '1573372168');
INSERT INTO `dr_attachment_data` VALUES ('13', '1', 'admin', 'rand', '1569490142', 'jpg', '72655', '201911/b03a90c6508cb8a.jpg', '0', '{\"width\":380,\"height\":228}', '1573372189');
INSERT INTO `dr_attachment_data` VALUES ('14', '1', 'admin', 'rand', '1569490118', 'jpg', '49417', '201911/bfb5d9e9a2c3311.jpg', '0', '{\"width\":380,\"height\":228}', '1573372209');
INSERT INTO `dr_attachment_data` VALUES ('15', '1', 'admin', 'rand', '1569490089', 'jpg', '58253', '201911/b5689ba6a74993b.jpg', '0', '{\"width\":380,\"height\":228}', '1573372226');
INSERT INTO `dr_attachment_data` VALUES ('16', '1', 'admin', 'rand', '1569490057', 'jpg', '35382', '201911/3890fe8b730853f.jpg', '0', '{\"width\":380,\"height\":229}', '1573372243');
INSERT INTO `dr_attachment_data` VALUES ('17', '1', 'admin', 'rand', '1569489901', 'jpg', '30225', '201911/7009632a72bc55a.jpg', '0', '{\"width\":381,\"height\":229}', '1573372258');
INSERT INTO `dr_attachment_data` VALUES ('18', '1', 'admin', 'rand', '1-19102zt64c96', 'jpg', '25078', '201911/3bde12c15c839b8.jpg', '0', '{\"width\":378,\"height\":252}', '1573375589');
INSERT INTO `dr_attachment_data` VALUES ('19', '1', 'admin', 'rand', 'product', 'jpg', '131658', '201911/691f9bab14680e1.jpg', '0', '{\"width\":1920,\"height\":160}', '1573786165');
INSERT INTO `dr_attachment_data` VALUES ('20', '1', 'admin', 'rand', 'news', 'jpg', '104607', '201911/e620312da0fac4.jpg', '0', '{\"width\":1920,\"height\":162}', '1573786458');
INSERT INTO `dr_attachment_data` VALUES ('21', '1', 'admin', 'rand', 'page', 'jpg', '54923', '201911/1ba6c0780fd326f.jpg', '0', '{\"width\":1920,\"height\":162}', '1573786547');
INSERT INTO `dr_attachment_data` VALUES ('22', '1', 'admin', 'rand', 'down', 'jpg', '104607', '201911/3b99c772d8b69c6.jpg', '0', '{\"width\":1920,\"height\":162}', '1573786624');
INSERT INTO `dr_attachment_data` VALUES ('23', '1', 'admin', 'rand', 'question', 'jpg', '131658', '201911/a74cbab9f4ead19.jpg', '0', '{\"width\":1920,\"height\":160}', '1573786721');
INSERT INTO `dr_attachment_data` VALUES ('24', '1', 'admin', 'rand', 'join', 'jpg', '76923', '201911/beaeb2fa14e6c.jpg', '0', '{\"width\":1920,\"height\":162}', '1573786768');
INSERT INTO `dr_attachment_data` VALUES ('25', '1', 'admin', 'rand', 'logo', 'png', '7873', '201911/096a70edc5de73a.png', '0', '{\"width\":230,\"height\":56}', '1573786888');

-- ----------------------------
-- Table structure for dr_attachment_remote
-- ----------------------------
DROP TABLE IF EXISTS `dr_attachment_remote`;
CREATE TABLE `dr_attachment_remote` (
  `id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(2) NOT NULL COMMENT '类型',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `url` varchar(255) NOT NULL COMMENT '访问地址',
  `value` text NOT NULL COMMENT '参数值',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='远程附件表';

-- ----------------------------
-- Records of dr_attachment_remote
-- ----------------------------

-- ----------------------------
-- Table structure for dr_attachment_unused
-- ----------------------------
DROP TABLE IF EXISTS `dr_attachment_unused`;
CREATE TABLE `dr_attachment_unused` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `siteid` mediumint(5) unsigned NOT NULL COMMENT '站点id',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `inputtime` (`inputtime`),
  KEY `fileext` (`fileext`),
  KEY `remote` (`remote`),
  KEY `author` (`author`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='未使用的附件表';

-- ----------------------------
-- Records of dr_attachment_unused
-- ----------------------------

-- ----------------------------
-- Table structure for dr_cron
-- ----------------------------
DROP TABLE IF EXISTS `dr_cron`;
CREATE TABLE `dr_cron` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `site` int(10) NOT NULL COMMENT '站点',
  `type` varchar(20) NOT NULL COMMENT '类型',
  `value` text NOT NULL COMMENT '参数值',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态',
  `error` text COMMENT '错误信息',
  `updatetime` int(10) unsigned NOT NULL COMMENT '执行时间',
  `inputtime` int(10) unsigned NOT NULL COMMENT '写入时间',
  PRIMARY KEY (`id`),
  KEY `site` (`site`),
  KEY `type` (`type`),
  KEY `status` (`status`),
  KEY `updatetime` (`updatetime`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='任务管理';

-- ----------------------------
-- Records of dr_cron
-- ----------------------------

-- ----------------------------
-- Table structure for dr_field
-- ----------------------------
DROP TABLE IF EXISTS `dr_field`;
CREATE TABLE `dr_field` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL COMMENT '字段别名语言',
  `fieldname` varchar(50) NOT NULL COMMENT '字段名称',
  `fieldtype` varchar(50) NOT NULL COMMENT '字段类型',
  `relatedid` smallint(5) unsigned NOT NULL COMMENT '相关id',
  `relatedname` varchar(50) NOT NULL COMMENT '相关表',
  `isedit` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可修改',
  `ismain` tinyint(1) unsigned NOT NULL COMMENT '是否主表',
  `issystem` tinyint(1) unsigned NOT NULL COMMENT '是否系统表',
  `ismember` tinyint(1) unsigned NOT NULL COMMENT '是否会员可见',
  `issearch` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可搜索',
  `disabled` tinyint(1) unsigned NOT NULL COMMENT '禁用？',
  `setting` text NOT NULL COMMENT '配置信息',
  `displayorder` int(5) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `list` (`relatedid`,`disabled`,`issystem`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='字段表';

-- ----------------------------
-- Records of dr_field
-- ----------------------------
INSERT INTO `dr_field` VALUES ('1', '主题', 'title', 'Text', '1', 'module', '1', '1', '1', '1', '1', '0', '{\"option\":{\"width\":400,\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\"},\"validate\":{\"xss\":1,\"required\":1,\"formattr\":\"onblur=\\\"check_title();get_keywords(\'keywords\');\\\"\"}}', '0');
INSERT INTO `dr_field` VALUES ('2', '缩略图', 'thumb', 'File', '1', 'module', '1', '1', '1', '1', '1', '0', '{\"option\":{\"ext\":\"jpg,gif,png\",\"size\":10,\"width\":400,\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\"}}', '0');
INSERT INTO `dr_field` VALUES ('3', '关键字', 'keywords', 'Text', '1', 'module', '1', '1', '1', '1', '1', '0', '{\"option\":{\"width\":400,\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\"},\"validate\":{\"xss\":1,\"formattr\":\" data-role=\\\"tagsinput\\\"\"}}', '0');
INSERT INTO `dr_field` VALUES ('4', '描述', 'description', 'Textarea', '1', 'module', '1', '1', '1', '1', '1', '0', '{\"option\":{\"width\":500,\"height\":60,\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\"},\"validate\":{\"xss\":1,\"filter\":\"dr_clearhtml\"}}', '0');
INSERT INTO `dr_field` VALUES ('5', '内容', 'content', 'Ueditor', '1', 'module', '1', '0', '1', '1', '1', '0', '{\"option\":{\"mode\":1,\"width\":\"100%\",\"height\":400},\"validate\":{\"xss\":1,\"required\":1}}', '0');
INSERT INTO `dr_field` VALUES ('6', '主题', 'title', 'Text', '2', 'module', '1', '1', '1', '1', '1', '0', '{\"option\":{\"width\":400,\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\"},\"validate\":{\"xss\":1,\"required\":1,\"formattr\":\"onblur=\\\"check_title();get_keywords(\'keywords\');\\\"\"}}', '0');
INSERT INTO `dr_field` VALUES ('7', '缩略图', 'thumb', 'File', '2', 'module', '1', '1', '1', '1', '1', '0', '{\"option\":{\"ext\":\"jpg,gif,png\",\"size\":10,\"width\":400,\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\"}}', '0');
INSERT INTO `dr_field` VALUES ('8', '关键字', 'keywords', 'Text', '2', 'module', '1', '1', '1', '1', '1', '0', '{\"option\":{\"width\":400,\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\"},\"validate\":{\"xss\":1,\"formattr\":\" data-role=\\\"tagsinput\\\"\"}}', '0');
INSERT INTO `dr_field` VALUES ('9', '描述', 'description', 'Textarea', '2', 'module', '1', '1', '1', '1', '1', '0', '{\"option\":{\"width\":500,\"height\":60,\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\"},\"validate\":{\"xss\":1,\"filter\":\"dr_clearhtml\"}}', '0');
INSERT INTO `dr_field` VALUES ('10', '内容', 'content', 'Ueditor', '2', 'module', '1', '0', '1', '1', '1', '0', '{\"option\":{\"mode\":1,\"width\":\"100%\",\"height\":400},\"validate\":{\"xss\":1,\"required\":1}}', '0');
INSERT INTO `dr_field` VALUES ('11', '图片', 'images', 'Files', '2', 'module', '1', '0', '0', '1', '1', '0', '{\"option\":{\"input\":\"1\",\"size\":\"10\",\"count\":\"10\",\"ext\":\"jpg,jpeg,png\",\"attachment\":\"0\",\"css\":\"\"},\"validate\":{\"required\":\"0\",\"pattern\":\"\",\"errortips\":\"\",\"check\":\"\",\"filter\":\"\",\"formattr\":\"\",\"tips\":\"\"},\"is_right\":\"0\"}', '0');
INSERT INTO `dr_field` VALUES ('12', '栏目英文名称', 'eng_name', 'Text', '0', 'category-share', '1', '1', '0', '1', '0', '0', '{\"option\":{\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\",\"value\":\"\",\"width\":\"\",\"css\":\"\"},\"validate\":{\"required\":\"\",\"pattern\":\"\",\"errortips\":\"\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"\"}', '0');
INSERT INTO `dr_field` VALUES ('13', '相关附件', 'attachment', 'Files', '1', 'page', '1', '1', '1', '1', '0', '0', 'a:2:{s:6:\"option\";a:5:{s:5:\"width\";s:3:\"80%\";s:4:\"size\";s:1:\"2\";s:5:\"count\";s:2:\"10\";s:3:\"ext\";s:31:\"jpg,gif,png,ppt,doc,xls,rar,zip\";s:10:\"uploadpath\";s:0:\"\";}s:8:\"validate\";a:9:{s:8:\"required\";s:1:\"0\";s:7:\"pattern\";s:0:\"\";s:9:\"errortips\";s:0:\"\";s:6:\"isedit\";s:1:\"0\";s:3:\"xss\";s:1:\"0\";s:5:\"check\";s:0:\"\";s:6:\"filter\";s:0:\"\";s:4:\"tips\";s:0:\"\";s:8:\"formattr\";s:0:\"\";}}', '0');
INSERT INTO `dr_field` VALUES ('14', '页面内容', 'content', 'Ueditor', '1', 'page', '1', '1', '1', '1', '0', '0', 'a:2:{s:6:\"option\";a:7:{s:5:\"width\";s:3:\"90%\";s:6:\"height\";s:3:\"400\";s:4:\"mode\";s:1:\"1\";s:4:\"tool\";s:0:\"\";s:5:\"mode2\";s:1:\"1\";s:5:\"tool2\";s:0:\"\";s:5:\"value\";s:0:\"\";}s:8:\"validate\";a:9:{s:8:\"required\";s:1:\"1\";s:7:\"pattern\";s:0:\"\";s:9:\"errortips\";s:0:\"\";s:6:\"isedit\";s:1:\"0\";s:3:\"xss\";s:1:\"1\";s:5:\"check\";s:0:\"\";s:6:\"filter\";s:0:\"\";s:4:\"tips\";s:0:\"\";s:8:\"formattr\";s:0:\"\";}}', '0');
INSERT INTO `dr_field` VALUES ('15', '软件名称', 'title', 'Text', '3', 'module', '1', '1', '1', '1', '1', '0', '{\"option\":{\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\",\"value\":\"\",\"width\":\"300\",\"css\":\"\"},\"validate\":{\"required\":\"1\",\"pattern\":\"\",\"errortips\":\"\",\"xss\":\"1\",\"check\":\"\",\"filter\":\"\",\"formattr\":\"onblur=\\\"check_title();get_keywords(\'keywords\');\\\"\",\"tips\":\"\"},\"is_right\":\"0\"}', '0');
INSERT INTO `dr_field` VALUES ('16', '缩略图', 'thumb', 'File', '3', 'module', '1', '1', '1', '1', '1', '0', '{\"option\":{\"ext\":\"jpg,gif,png\",\"size\":10,\"width\":400,\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\"}}', '0');
INSERT INTO `dr_field` VALUES ('17', '关键字', 'keywords', 'Text', '3', 'module', '1', '1', '1', '1', '1', '0', '{\"option\":{\"width\":400,\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\"},\"validate\":{\"xss\":1,\"formattr\":\" data-role=\\\"tagsinput\\\"\"}}', '0');
INSERT INTO `dr_field` VALUES ('18', '描述', 'description', 'Textarea', '3', 'module', '1', '1', '1', '1', '1', '0', '{\"option\":{\"width\":500,\"height\":60,\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\"},\"validate\":{\"xss\":1,\"filter\":\"dr_clearhtml\"}}', '0');
INSERT INTO `dr_field` VALUES ('34', '您的昵称', 'title', 'Text', '1', 'form-1', '1', '1', '1', '1', '0', '0', '{\"option\":{\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\",\"value\":\"\",\"width\":\"300\",\"css\":\"\"},\"validate\":{\"required\":\"1\",\"pattern\":\"\",\"errortips\":\"\",\"xss\":\"1\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"\"}', '0');
INSERT INTO `dr_field` VALUES ('33', '内容', 'content', 'Ueditor', '4', 'module', '1', '0', '1', '1', '0', '1', '{\"option\":{\"down_img\":\"\",\"down_img_type\":\"\",\"watermark\":\"\",\"show_bottom_boot\":\"\",\"mini\":\"\",\"autofloat\":\"\",\"autoheight\":\"\",\"page\":\"\",\"mode\":\"1\",\"tool\":\"\'bold\', \'italic\', \'underline\'\",\"mode2\":\"1\",\"tool2\":\"\'bold\', \'italic\', \'underline\'\",\"mode3\":\"1\",\"tool3\":\"\'bold\', \'italic\', \'underline\'\",\"attachment\":\"\",\"image_reduce\":\"\",\"value\":\"\",\"width\":\"100%\",\"height\":\"400\",\"css\":\"\"},\"validate\":{\"required\":\"1\",\"pattern\":\"\",\"errortips\":\"\",\"xss\":\"1\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"\"}', '0');
INSERT INTO `dr_field` VALUES ('23', '软件介绍', 'content', 'Ueditor', '3', 'module', '1', '0', '1', '1', '0', '1', '{\"option\":{\"down_img\":\"\",\"down_img_type\":\"\",\"watermark\":\"\",\"show_bottom_boot\":\"\",\"mini\":\"\",\"autofloat\":\"\",\"autoheight\":\"\",\"page\":\"\",\"mode\":\"1\",\"tool\":\"\'bold\', \'italic\', \'underline\'\",\"mode2\":\"1\",\"tool2\":\"\'bold\', \'italic\', \'underline\'\",\"mode3\":\"1\",\"tool3\":\"\'bold\', \'italic\', \'underline\'\",\"attachment\":\"\",\"image_reduce\":\"\",\"value\":\"\",\"width\":\"100%\",\"height\":\"400\",\"css\":\"\"},\"validate\":{\"required\":\"1\",\"pattern\":\"\",\"errortips\":\"\",\"xss\":\"1\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"\"}', '0');
INSERT INTO `dr_field` VALUES ('28', '上传文件', 'file', 'File', '3', 'module', '1', '1', '0', '1', '0', '0', '{\"option\":{\"input\":\"1\",\"ext\":\"rar,zip,docx,jpg,gif,exe,php,html\",\"size\":\"100\",\"attachment\":\"\",\"image_reduce\":\"\",\"css\":\"\"},\"validate\":{\"required\":\"\",\"pattern\":\"\",\"errortips\":\"\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"\"}', '0');
INSERT INTO `dr_field` VALUES ('29', '问题', 'title', 'Text', '4', 'module', '1', '1', '1', '1', '0', '0', '{\"option\":{\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\",\"value\":\"\",\"width\":\"400\",\"css\":\"\"},\"validate\":{\"required\":\"1\",\"pattern\":\"\",\"errortips\":\"\",\"xss\":\"1\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"onblur=\\\"check_title();get_keywords(\'keywords\');\\\"\"},\"is_right\":\"\"}', '0');
INSERT INTO `dr_field` VALUES ('30', '缩略图', 'thumb', 'File', '4', 'module', '1', '1', '1', '1', '0', '1', '{\"option\":{\"ext\":\"jpg,gif,png\",\"size\":\"10\",\"attachment\":\"\",\"image_reduce\":\"\",\"css\":\"\"},\"validate\":{\"required\":\"\",\"pattern\":\"\",\"errortips\":\"\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"\"}', '0');
INSERT INTO `dr_field` VALUES ('31', '关键字', 'keywords', 'Text', '4', 'module', '1', '1', '1', '1', '0', '1', '{\"option\":{\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\",\"value\":\"\",\"width\":\"400\",\"css\":\"\"},\"validate\":{\"required\":\"\",\"pattern\":\"\",\"errortips\":\"\",\"xss\":\"1\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\" data-role=\\\"tagsinput\\\"\"},\"is_right\":\"\"}', '0');
INSERT INTO `dr_field` VALUES ('32', '答复', 'description', 'Textarea', '4', 'module', '1', '1', '1', '1', '0', '0', '{\"option\":{\"value\":\"\",\"width\":\"500\",\"height\":\"60\",\"css\":\"\"},\"validate\":{\"required\":\"\",\"pattern\":\"\",\"errortips\":\"\",\"xss\":\"1\",\"check\":\"\",\"filter\":\"dr_clearhtml\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"\"}', '0');
INSERT INTO `dr_field` VALUES ('35', '您的电话', 'phone', 'Text', '1', 'form-1', '1', '1', '0', '1', '0', '0', '{\"option\":{\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\",\"value\":\"\",\"width\":\"\",\"css\":\"\"},\"validate\":{\"required\":\"1\",\"pattern\":\"\",\"errortips\":\"\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"\"}', '0');
INSERT INTO `dr_field` VALUES ('36', '您的地址', 'address', 'Text', '1', 'form-1', '1', '1', '0', '1', '0', '0', '{\"option\":{\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\",\"value\":\"\",\"width\":\"\",\"css\":\"\"},\"validate\":{\"required\":\"1\",\"pattern\":\"\",\"errortips\":\"\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"\"}', '0');
INSERT INTO `dr_field` VALUES ('37', '联系邮箱', 'email', 'Text', '1', 'form-1', '1', '1', '0', '1', '0', '0', '{\"option\":{\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\",\"value\":\"\",\"width\":\"\",\"css\":\"\"},\"validate\":{\"required\":\"1\",\"pattern\":\"\\/^[\\\\w\\\\-\\\\.]+@[\\\\w\\\\-\\\\.]+(\\\\.\\\\w+)+$\\/\",\"errortips\":\"请输入正确的邮箱\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"\"}', '0');
INSERT INTO `dr_field` VALUES ('38', '留言内容', 'content', 'Textarea', '1', 'form-1', '1', '1', '0', '1', '0', '0', '{\"option\":{\"value\":\"\",\"width\":\"\",\"height\":\"\",\"css\":\"\"},\"validate\":{\"required\":\"1\",\"pattern\":\"\",\"errortips\":\"\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"\"}', '0');
INSERT INTO `dr_field` VALUES ('39', '招聘名称', 'title', 'Text', '5', 'module', '1', '1', '1', '1', '0', '0', '{\"option\":{\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\",\"value\":\"\",\"width\":\"400\",\"css\":\"\"},\"validate\":{\"required\":\"1\",\"pattern\":\"\",\"errortips\":\"\",\"xss\":\"1\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"onblur=\\\"check_title();get_keywords(\'keywords\');\\\"\"},\"is_right\":\"\"}', '0');
INSERT INTO `dr_field` VALUES ('40', '缩略图', 'thumb', 'File', '5', 'module', '1', '1', '1', '1', '0', '1', '{\"option\":{\"ext\":\"jpg,gif,png\",\"size\":\"10\",\"attachment\":\"\",\"image_reduce\":\"\",\"css\":\"\"},\"validate\":{\"required\":\"\",\"pattern\":\"\",\"errortips\":\"\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"\"}', '0');
INSERT INTO `dr_field` VALUES ('41', '关键字', 'keywords', 'Text', '5', 'module', '1', '1', '1', '1', '0', '1', '{\"option\":{\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\",\"value\":\"\",\"width\":\"400\",\"css\":\"\"},\"validate\":{\"required\":\"\",\"pattern\":\"\",\"errortips\":\"\",\"xss\":\"1\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\" data-role=\\\"tagsinput\\\"\"},\"is_right\":\"\"}', '0');
INSERT INTO `dr_field` VALUES ('42', '描述', 'description', 'Textarea', '5', 'module', '1', '1', '1', '1', '1', '0', '{\"option\":{\"width\":500,\"height\":60,\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\"},\"validate\":{\"xss\":1,\"filter\":\"dr_clearhtml\"}}', '0');
INSERT INTO `dr_field` VALUES ('43', '内容', 'content', 'Ueditor', '5', 'module', '1', '0', '1', '1', '0', '1', '{\"option\":{\"down_img\":\"\",\"down_img_type\":\"\",\"watermark\":\"\",\"show_bottom_boot\":\"\",\"mini\":\"\",\"autofloat\":\"\",\"autoheight\":\"\",\"page\":\"\",\"mode\":\"1\",\"tool\":\"\'bold\', \'italic\', \'underline\'\",\"mode2\":\"1\",\"tool2\":\"\'bold\', \'italic\', \'underline\'\",\"mode3\":\"1\",\"tool3\":\"\'bold\', \'italic\', \'underline\'\",\"attachment\":\"\",\"image_reduce\":\"\",\"value\":\"\",\"width\":\"100%\",\"height\":\"400\",\"css\":\"\"},\"validate\":{\"required\":\"1\",\"pattern\":\"\",\"errortips\":\"\",\"xss\":\"1\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"\"}', '0');
INSERT INTO `dr_field` VALUES ('44', '职位类型', 'type', 'Text', '5', 'module', '1', '1', '0', '1', '0', '0', '{\"option\":{\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\",\"value\":\"\",\"width\":\"\",\"css\":\"\"},\"validate\":{\"required\":\"\",\"pattern\":\"\",\"errortips\":\"\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"\"}', '0');
INSERT INTO `dr_field` VALUES ('45', '工作经验', 'experience', 'Text', '5', 'module', '1', '1', '0', '1', '0', '0', '{\"option\":{\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\",\"value\":\"\",\"width\":\"\",\"css\":\"\"},\"validate\":{\"required\":\"\",\"pattern\":\"\",\"errortips\":\"\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"\"}', '0');
INSERT INTO `dr_field` VALUES ('46', '学历要求', 'requirement', 'Text', '5', 'module', '1', '1', '0', '1', '0', '0', '{\"option\":{\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\",\"value\":\"\",\"width\":\"\",\"css\":\"\"},\"validate\":{\"required\":\"\",\"pattern\":\"\",\"errortips\":\"\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"\"}', '0');
INSERT INTO `dr_field` VALUES ('47', '招聘人数', 'num', 'Text', '5', 'module', '1', '1', '0', '1', '0', '0', '{\"option\":{\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\",\"value\":\"\",\"width\":\"\",\"css\":\"\"},\"validate\":{\"required\":\"\",\"pattern\":\"\",\"errortips\":\"\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"\"}', '0');

-- ----------------------------
-- Table structure for dr_linkage
-- ----------------------------
DROP TABLE IF EXISTS `dr_linkage`;
CREATE TABLE `dr_linkage` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '菜单名称',
  `type` tinyint(1) unsigned NOT NULL,
  `code` char(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `module` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='联动菜单表';

-- ----------------------------
-- Records of dr_linkage
-- ----------------------------
INSERT INTO `dr_linkage` VALUES ('1', '中国地区', '0', 'address');

-- ----------------------------
-- Table structure for dr_linkage_data_1
-- ----------------------------
DROP TABLE IF EXISTS `dr_linkage_data_1`;
CREATE TABLE `dr_linkage_data_1` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `site` mediumint(5) unsigned NOT NULL COMMENT '站点id',
  `pid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `pids` varchar(255) DEFAULT NULL COMMENT '所有上级id',
  `name` varchar(30) NOT NULL COMMENT '栏目名称',
  `cname` varchar(30) NOT NULL COMMENT '别名',
  `child` tinyint(1) unsigned DEFAULT '0' COMMENT '是否有下级',
  `hidden` tinyint(1) unsigned DEFAULT '0' COMMENT '前端隐藏',
  `childids` text COMMENT '下级所有id',
  `displayorder` mediumint(8) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cname` (`cname`),
  KEY `hidden` (`hidden`),
  KEY `list` (`site`,`displayorder`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='联动菜单数据表';

-- ----------------------------
-- Records of dr_linkage_data_1
-- ----------------------------
INSERT INTO `dr_linkage_data_1` VALUES ('1', '1', '0', '0', '北京', 'bj', '0', '0', '1', '0');
INSERT INTO `dr_linkage_data_1` VALUES ('2', '1', '0', '0', '成都', 'cd', '0', '0', '2', '0');

-- ----------------------------
-- Table structure for dr_mail_smtp
-- ----------------------------
DROP TABLE IF EXISTS `dr_mail_smtp`;
CREATE TABLE `dr_mail_smtp` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `host` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `port` mediumint(8) unsigned NOT NULL,
  `displayorder` smallint(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='邮件账户表';

-- ----------------------------
-- Records of dr_mail_smtp
-- ----------------------------

-- ----------------------------
-- Table structure for dr_member
-- ----------------------------
DROP TABLE IF EXISTS `dr_member`;
CREATE TABLE `dr_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` char(50) NOT NULL DEFAULT '' COMMENT '邮箱地址',
  `phone` char(20) NOT NULL COMMENT '手机号码',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '加密密码',
  `salt` char(10) NOT NULL COMMENT '随机加密码',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `money` decimal(10,2) unsigned NOT NULL COMMENT 'RMB',
  `freeze` decimal(10,2) unsigned NOT NULL COMMENT '冻结RMB',
  `spend` decimal(10,2) unsigned NOT NULL COMMENT '消费RMB总额',
  `score` int(10) unsigned NOT NULL COMMENT '虚拟币',
  `experience` int(10) unsigned NOT NULL COMMENT '经验值',
  `regip` varchar(50) NOT NULL COMMENT '注册ip',
  `regtime` int(10) unsigned NOT NULL COMMENT '注册时间',
  `randcode` mediumint(6) unsigned NOT NULL COMMENT '随机验证码',
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `phone` (`phone`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of dr_member
-- ----------------------------
INSERT INTO `dr_member` VALUES ('1', 'admin@admin.com', '', 'admin', '60ca0c39b780707ad3a2bc53f72a693a', 'fccb60fb51', '创始人', '1000000.00', '0.00', '0.00', '1000000', '1000000', '', '1573117168', '0');

-- ----------------------------
-- Table structure for dr_member_data
-- ----------------------------
DROP TABLE IF EXISTS `dr_member_data`;
CREATE TABLE `dr_member_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_admin` tinyint(1) unsigned DEFAULT '0' COMMENT '是否是管理员',
  `is_lock` tinyint(1) unsigned DEFAULT '0' COMMENT '账号锁定标识',
  `is_auth` tinyint(1) unsigned DEFAULT '0' COMMENT '实名认证标识',
  `is_verify` tinyint(1) unsigned DEFAULT '0' COMMENT '审核标识',
  `is_mobile` tinyint(1) unsigned DEFAULT '0' COMMENT '手机认证标识',
  `is_avatar` tinyint(1) unsigned DEFAULT '0' COMMENT '头像上传标识',
  `is_complete` tinyint(1) unsigned DEFAULT '0' COMMENT '完善资料标识',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of dr_member_data
-- ----------------------------
INSERT INTO `dr_member_data` VALUES ('1', '1', '0', '1', '1', '1', '0', '1');

-- ----------------------------
-- Table structure for dr_member_explog
-- ----------------------------
DROP TABLE IF EXISTS `dr_member_explog`;
CREATE TABLE `dr_member_explog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL COMMENT '账号',
  `value` int(10) NOT NULL COMMENT '分数变化值',
  `mark` varchar(50) NOT NULL COMMENT '标记',
  `note` varchar(255) NOT NULL COMMENT '备注',
  `url` varchar(255) NOT NULL COMMENT '相关地址',
  `inputtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `mark` (`mark`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='经验值流水日志';

-- ----------------------------
-- Records of dr_member_explog
-- ----------------------------

-- ----------------------------
-- Table structure for dr_member_group
-- ----------------------------
DROP TABLE IF EXISTS `dr_member_group`;
CREATE TABLE `dr_member_group` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL COMMENT '用户组名称',
  `price` decimal(10,2) NOT NULL COMMENT '售价',
  `unit` tinyint(1) unsigned NOT NULL COMMENT '价格单位:1虚拟币，0金钱',
  `days` int(10) unsigned NOT NULL COMMENT '生效天数',
  `apply` tinyint(1) unsigned NOT NULL COMMENT '是否申请',
  `register` tinyint(1) unsigned NOT NULL COMMENT '是否允许注册',
  `setting` text NOT NULL COMMENT '用户组配置',
  `displayorder` smallint(5) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `displayorder` (`displayorder`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户组表';

-- ----------------------------
-- Records of dr_member_group
-- ----------------------------
INSERT INTO `dr_member_group` VALUES ('1', '注册用户', '0.00', '0', '0', '1', '1', '{\"level\":{\"auto\":\"0\",\"unit\":\"0\",\"price\":\"0\"},\"verify\":\"0\"}', '0');

-- ----------------------------
-- Table structure for dr_member_group_index
-- ----------------------------
DROP TABLE IF EXISTS `dr_member_group_index`;
CREATE TABLE `dr_member_group_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `gid` smallint(5) unsigned NOT NULL COMMENT '用户组id',
  `lid` smallint(5) unsigned NOT NULL COMMENT '用户组等级id',
  `stime` int(10) unsigned NOT NULL COMMENT '开通时间',
  `etime` int(10) unsigned NOT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `lid` (`lid`),
  KEY `gid` (`gid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户组归属表';

-- ----------------------------
-- Records of dr_member_group_index
-- ----------------------------
INSERT INTO `dr_member_group_index` VALUES ('1', '1', '1', '0', '0', '0');

-- ----------------------------
-- Table structure for dr_member_group_verify
-- ----------------------------
DROP TABLE IF EXISTS `dr_member_group_verify`;
CREATE TABLE `dr_member_group_verify` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `gid` smallint(5) unsigned NOT NULL COMMENT '用户组id',
  `lid` smallint(5) unsigned NOT NULL COMMENT '用户组等级id',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态',
  `content` text NOT NULL COMMENT '自定义字段信息',
  `inputtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组申请审核';

-- ----------------------------
-- Records of dr_member_group_verify
-- ----------------------------

-- ----------------------------
-- Table structure for dr_member_level
-- ----------------------------
DROP TABLE IF EXISTS `dr_member_level`;
CREATE TABLE `dr_member_level` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `gid` smallint(5) unsigned NOT NULL COMMENT '用户id',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `stars` tinyint(2) NOT NULL COMMENT '星星数量',
  `value` int(10) unsigned NOT NULL COMMENT '升级值要求',
  `note` text NOT NULL COMMENT '备注',
  `apply` tinyint(1) unsigned NOT NULL COMMENT '是否允许升级',
  PRIMARY KEY (`id`),
  KEY `value` (`value`),
  KEY `apply` (`apply`),
  KEY `gid` (`gid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组级别表';

-- ----------------------------
-- Records of dr_member_level
-- ----------------------------

-- ----------------------------
-- Table structure for dr_member_login
-- ----------------------------
DROP TABLE IF EXISTS `dr_member_login`;
CREATE TABLE `dr_member_login` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned DEFAULT NULL COMMENT '会员uid',
  `type` varchar(30) NOT NULL COMMENT '登录方式',
  `loginip` varchar(50) NOT NULL COMMENT '登录Ip',
  `logintime` int(10) unsigned NOT NULL COMMENT '登录时间',
  `useragent` varchar(255) NOT NULL COMMENT '客户端信息',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `loginip` (`loginip`),
  KEY `logintime` (`logintime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='登录日志记录';

-- ----------------------------
-- Records of dr_member_login
-- ----------------------------

-- ----------------------------
-- Table structure for dr_member_menu
-- ----------------------------
DROP TABLE IF EXISTS `dr_member_menu`;
CREATE TABLE `dr_member_menu` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(5) unsigned NOT NULL COMMENT '上级菜单id',
  `name` text NOT NULL COMMENT '菜单语言名称',
  `uri` varchar(255) DEFAULT NULL COMMENT 'uri字符串',
  `url` varchar(255) DEFAULT NULL COMMENT '外链地址',
  `mark` varchar(20) DEFAULT NULL COMMENT '菜单标识',
  `hidden` tinyint(1) unsigned DEFAULT NULL COMMENT '是否隐藏',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标标示',
  `group` text NOT NULL COMMENT '用户组划分',
  `site` text NOT NULL COMMENT '站点划分',
  `displayorder` int(5) DEFAULT NULL COMMENT '排序值',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `mark` (`mark`),
  KEY `hidden` (`hidden`),
  KEY `uri` (`uri`),
  KEY `displayorder` (`displayorder`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='用户组菜单表';

-- ----------------------------
-- Records of dr_member_menu
-- ----------------------------
INSERT INTO `dr_member_menu` VALUES ('1', '0', '账号管理', '', '', 'user', '0', 'fa fa-user', '', '', '0');
INSERT INTO `dr_member_menu` VALUES ('2', '1', '资料修改', 'account/index', '', '', '0', 'fa fa-cog', '', '', '0');
INSERT INTO `dr_member_menu` VALUES ('3', '1', '头像设置', 'account/avatar', '', '', '0', 'fa fa-smile-o', '', '', '0');
INSERT INTO `dr_member_menu` VALUES ('4', '1', '手机认证', 'account/mobile', '', '', '0', 'fa fa-mobile', '', '', '0');
INSERT INTO `dr_member_menu` VALUES ('5', '1', '修改密码', 'account/password', '', '', '0', 'fa fa-expeditedssl', '', '', '0');
INSERT INTO `dr_member_menu` VALUES ('6', '1', '账号绑定', 'account/oauth', '', '', '0', 'fa fa-qq', '', '', '0');
INSERT INTO `dr_member_menu` VALUES ('7', '1', '登录记录', 'account/login', '', '', '0', 'fa fa-calendar', '', '', '0');
INSERT INTO `dr_member_menu` VALUES ('8', '0', '财务管理', '', '', 'pay', '0', 'fa fa-rmb', '', '', '0');
INSERT INTO `dr_member_menu` VALUES ('9', '8', '在线充值', 'recharge/index', '', '', '0', 'fa fa-rmb', '', '', '0');
INSERT INTO `dr_member_menu` VALUES ('10', '8', '我的交易', 'paylog/index', '', '', '0', 'fa fa-calendar', '', '', '0');
INSERT INTO `dr_member_menu` VALUES ('11', '8', '虚拟金币', 'scorelog/index', '', '', '0', 'fa fa-diamond', '', '', '0');
INSERT INTO `dr_member_menu` VALUES ('12', '8', '提醒消息', 'notice/index', '', '', '0', 'fa fa-envelope', '', '', '0');
INSERT INTO `dr_member_menu` VALUES ('13', '0', '内容管理', '', '', 'content-module', '0', 'fa fa-th-large', '', '', '0');
INSERT INTO `dr_member_menu` VALUES ('14', '13', '我的评论', 'content/comment', '', '', '0', 'fa fa-comments', '', '', '0');
INSERT INTO `dr_member_menu` VALUES ('15', '13', '文章管理', 'news/home/index', '', 'module-news', '0', 'fa fa-sticky-note', '', '', '-1');
INSERT INTO `dr_member_menu` VALUES ('16', '13', '图片管理', 'photo/home/index', '', 'module-photo', '0', 'fa fa-photo', '', '', '-1');
INSERT INTO `dr_member_menu` VALUES ('17', '13', '下载管理', 'down/home/index', '', 'module-down', '0', 'fa fa-download', '', '', '-1');
INSERT INTO `dr_member_menu` VALUES ('18', '13', '常见问题管理', 'question/home/index', '', 'module-question', '0', 'fa fa-question', '', '', '-1');
INSERT INTO `dr_member_menu` VALUES ('19', '13', '投诉及维修管理', 'form/complaint/index', '', 'form-complaint', '0', '', '', '', '0');
INSERT INTO `dr_member_menu` VALUES ('20', '13', '人才招聘管理', 'join/home/index', '', 'module-join', '0', 'fa fa-user', '', '', '-1');

-- ----------------------------
-- Table structure for dr_member_notice
-- ----------------------------
DROP TABLE IF EXISTS `dr_member_notice`;
CREATE TABLE `dr_member_notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '通知者uid',
  `isnew` tinyint(1) unsigned NOT NULL COMMENT '新提醒',
  `content` text NOT NULL COMMENT '通知内容',
  `url` varchar(255) NOT NULL COMMENT '相关地址',
  `inputtime` int(10) unsigned NOT NULL COMMENT '提交时间',
  PRIMARY KEY (`id`),
  KEY `isnew` (`isnew`),
  KEY `type` (`type`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员通知提醒表';

-- ----------------------------
-- Records of dr_member_notice
-- ----------------------------

-- ----------------------------
-- Table structure for dr_member_oauth
-- ----------------------------
DROP TABLE IF EXISTS `dr_member_oauth`;
CREATE TABLE `dr_member_oauth` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '会员uid',
  `oid` varchar(255) NOT NULL COMMENT 'OAuth返回id',
  `oauth` varchar(255) NOT NULL COMMENT '运营商',
  `avatar` varchar(255) NOT NULL COMMENT '头像',
  `unionid` varchar(255) DEFAULT NULL COMMENT 'unionId',
  `nickname` varchar(255) NOT NULL COMMENT '昵称',
  `expire_at` int(10) unsigned NOT NULL COMMENT '绑定时间',
  `access_token` varchar(255) DEFAULT NULL COMMENT '保留',
  `refresh_token` varchar(255) DEFAULT NULL COMMENT '保留',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='快捷登录用户OAuth授权表';

-- ----------------------------
-- Records of dr_member_oauth
-- ----------------------------

-- ----------------------------
-- Table structure for dr_member_paylog
-- ----------------------------
DROP TABLE IF EXISTS `dr_member_paylog`;
CREATE TABLE `dr_member_paylog` (
  `id` bigint(18) unsigned NOT NULL AUTO_INCREMENT,
  `site` int(10) NOT NULL COMMENT '站点',
  `mid` varchar(100) NOT NULL COMMENT '支付标识',
  `uid` int(10) unsigned NOT NULL COMMENT '付款人',
  `username` varchar(50) NOT NULL COMMENT '付款账号',
  `touid` int(10) unsigned DEFAULT '0' COMMENT '收款人',
  `tousername` varchar(50) DEFAULT NULL COMMENT '收款人账号',
  `title` varchar(255) NOT NULL COMMENT '支付标题',
  `url` varchar(255) NOT NULL COMMENT '相关链接',
  `value` decimal(10,2) NOT NULL COMMENT '支付金额',
  `type` varchar(20) NOT NULL COMMENT '支付方式',
  `status` tinyint(1) unsigned NOT NULL COMMENT '支付状态',
  `result` text NOT NULL COMMENT '支付结果',
  `paytime` int(10) unsigned NOT NULL COMMENT '支付时间',
  `inputtime` int(10) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `touid` (`touid`),
  KEY `mid` (`mid`),
  KEY `status` (`status`),
  KEY `value` (`value`),
  KEY `paytime` (`paytime`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户支付记录表';

-- ----------------------------
-- Records of dr_member_paylog
-- ----------------------------

-- ----------------------------
-- Table structure for dr_member_scorelog
-- ----------------------------
DROP TABLE IF EXISTS `dr_member_scorelog`;
CREATE TABLE `dr_member_scorelog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL COMMENT '账号',
  `value` int(10) NOT NULL COMMENT '分数变化值',
  `mark` varchar(50) NOT NULL COMMENT '标记',
  `note` varchar(255) NOT NULL COMMENT '备注',
  `url` varchar(255) NOT NULL COMMENT '相关地址',
  `inputtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `mark` (`mark`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='金币流水日志';

-- ----------------------------
-- Records of dr_member_scorelog
-- ----------------------------

-- ----------------------------
-- Table structure for dr_member_setting
-- ----------------------------
DROP TABLE IF EXISTS `dr_member_setting`;
CREATE TABLE `dr_member_setting` (
  `name` varchar(50) NOT NULL,
  `value` mediumtext NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户属性参数表';

-- ----------------------------
-- Records of dr_member_setting
-- ----------------------------
INSERT INTO `dr_member_setting` VALUES ('auth_site', '{\"1\":{\"category\":{\"1\":null,\"2\":null,\"3\":null,\"4\":null,\"5\":null,\"6\":null,\"7\":null,\"8\":null,\"9\":null,\"10\":null,\"11\":null,\"12\":null,\"13\":null,\"14\":null,\"15\":null,\"16\":null,\"17\":null,\"18\":null,\"19\":null,\"20\":null,\"21\":null,\"22\":null,\"23\":null,\"24\":null,\"25\":null,\"26\":null,\"27\":null,\"28\":null,\"29\":null,\"30\":null,\"31\":null,\"32\":null,\"33\":null,\"34\":null,\"35\":null,\"36\":null,\"37\":null,\"38\":null,\"39\":null},\"form\":{\"complaint\":{\"show\":[],\"add\":[],\"del\":[0],\"edit\":[0],\"code\":[0,\"1\"],\"verify\":[0,\"1\"],\"exp\":{\"1\":\"\"},\"score\":{\"1\":\"\"},\"day_post\":{\"1\":\"\"},\"total_post\":{\"1\":\"\"},\"test\":1}}}}');

-- ----------------------------
-- Table structure for dr_module
-- ----------------------------
DROP TABLE IF EXISTS `dr_module`;
CREATE TABLE `dr_module` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `site` text COMMENT '站点划分',
  `dirname` varchar(50) NOT NULL COMMENT '目录名称',
  `share` tinyint(1) unsigned DEFAULT NULL COMMENT '是否共享模块',
  `setting` text COMMENT '配置信息',
  `comment` text COMMENT '评论信息',
  `disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '禁用？',
  `displayorder` smallint(5) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `dirname` (`dirname`),
  KEY `disabled` (`disabled`),
  KEY `displayorder` (`displayorder`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='模块表';

-- ----------------------------
-- Records of dr_module
-- ----------------------------
INSERT INTO `dr_module` VALUES ('1', '{\"1\":{\"html\":0,\"theme\":\"default\",\"domain\":\"\",\"template\":\"default\"}}', 'news', '1', '{\"order\":\"displayorder DESC,updatetime DESC\",\"verify_msg\":\"\",\"delete_msg\":\"\",\"list_field\":{\"title\":{\"use\":\"1\",\"order\":\"1\",\"name\":\"主题\",\"width\":\"\",\"func\":\"title\"},\"catid\":{\"use\":\"1\",\"order\":\"2\",\"name\":\"栏目\",\"width\":\"130\",\"func\":\"catid\"},\"author\":{\"use\":\"1\",\"order\":\"3\",\"name\":\"作者\",\"width\":\"120\",\"func\":\"author\"},\"updatetime\":{\"use\":\"1\",\"order\":\"4\",\"name\":\"更新时间\",\"width\":\"160\",\"func\":\"datetime\"}},\"comment_list_field\":{\"content\":{\"use\":\"1\",\"order\":\"1\",\"name\":\"评论\",\"width\":\"\",\"func\":\"comment\"},\"author\":{\"use\":\"1\",\"order\":\"3\",\"name\":\"作者\",\"width\":\"100\",\"func\":\"author\"},\"inputtime\":{\"use\":\"1\",\"order\":\"4\",\"name\":\"评论时间\",\"width\":\"160\",\"func\":\"datetime\"}},\"flag\":null,\"param\":null,\"search\":{\"use\":\"1\",\"field\":\"title,keywords\",\"total\":\"500\",\"length\":\"4\",\"param_join\":\"-\",\"param_rule\":\"0\",\"param_field\":\"\",\"param_join_field\":[\"\",\"\",\"\",\"\",\"\",\"\",\"\"],\"param_join_default_value\":\"0\"}}', '{\"use\":\"1\",\"num\":\"0\",\"my\":\"0\",\"reply\":\"0\",\"ct_reply\":\"0\",\"pagesize\":\"\",\"pagesize_mobile\":\"\",\"pagesize_api\":\"\",\"review\":{\"score\":\"10\",\"point\":\"0\",\"value\":{\"1\":{\"name\":\"1星评价\"},\"2\":{\"name\":\"2星评价\"},\"3\":{\"name\":\"3星评价\"},\"4\":{\"name\":\"4星评价\"},\"5\":{\"name\":\"5星评价\"}},\"option\":{\"1\":{\"name\":\"选项1\"},\"2\":{\"name\":\"选项2\"},\"3\":{\"name\":\"选项3\"},\"4\":{\"name\":\"选项4\"},\"5\":{\"name\":\"选项5\"},\"6\":{\"name\":\"选项6\"},\"7\":{\"name\":\"选项7\"},\"8\":{\"name\":\"选项8\"},\"9\":{\"name\":\"选项9\"}}}}', '0', '0');
INSERT INTO `dr_module` VALUES ('2', '{\"1\":{\"html\":0,\"theme\":\"default\",\"domain\":\"\",\"template\":\"default\"}}', 'photo', '1', '{\"order\":\"displayorder DESC,updatetime DESC\",\"verify_msg\":\"\",\"delete_msg\":\"\",\"list_field\":{\"title\":{\"use\":\"1\",\"order\":\"1\",\"name\":\"主题\",\"width\":\"\",\"func\":\"title\"},\"catid\":{\"use\":\"1\",\"order\":\"2\",\"name\":\"栏目\",\"width\":\"130\",\"func\":\"catid\"},\"author\":{\"use\":\"1\",\"order\":\"3\",\"name\":\"作者\",\"width\":\"120\",\"func\":\"author\"},\"updatetime\":{\"use\":\"1\",\"order\":\"4\",\"name\":\"更新时间\",\"width\":\"160\",\"func\":\"datetime\"}},\"comment_list_field\":{\"content\":{\"use\":\"1\",\"order\":\"1\",\"name\":\"评论\",\"width\":\"\",\"func\":\"comment\"},\"author\":{\"use\":\"1\",\"order\":\"3\",\"name\":\"作者\",\"width\":\"100\",\"func\":\"author\"},\"inputtime\":{\"use\":\"1\",\"order\":\"4\",\"name\":\"评论时间\",\"width\":\"160\",\"func\":\"datetime\"}},\"flag\":null,\"param\":null,\"search\":{\"use\":\"1\",\"field\":\"title,keywords\",\"total\":\"500\",\"length\":\"4\",\"param_join\":\"-\",\"param_rule\":\"0\",\"param_field\":\"\",\"param_join_field\":[\"\",\"\",\"\",\"\",\"\",\"\",\"\"],\"param_join_default_value\":\"0\"}}', '{\"use\":\"1\",\"num\":\"0\",\"my\":\"0\",\"reply\":\"0\",\"ct_reply\":\"0\",\"pagesize\":\"\",\"pagesize_mobile\":\"\",\"pagesize_api\":\"\",\"review\":{\"score\":\"10\",\"point\":\"0\",\"value\":{\"1\":{\"name\":\"1星评价\"},\"2\":{\"name\":\"2星评价\"},\"3\":{\"name\":\"3星评价\"},\"4\":{\"name\":\"4星评价\"},\"5\":{\"name\":\"5星评价\"}},\"option\":{\"1\":{\"name\":\"选项1\"},\"2\":{\"name\":\"选项2\"},\"3\":{\"name\":\"选项3\"},\"4\":{\"name\":\"选项4\"},\"5\":{\"name\":\"选项5\"},\"6\":{\"name\":\"选项6\"},\"7\":{\"name\":\"选项7\"},\"8\":{\"name\":\"选项8\"},\"9\":{\"name\":\"选项9\"}}}}', '0', '0');
INSERT INTO `dr_module` VALUES ('3', '{\"1\":{\"html\":0,\"theme\":\"default\",\"domain\":\"\",\"template\":\"default\"}}', 'down', '1', '{\"order\":\"displayorder DESC,updatetime DESC\",\"verify_msg\":\"\",\"delete_msg\":\"\",\"list_field\":{\"title\":{\"use\":\"1\",\"order\":\"1\",\"name\":\"主题\",\"width\":\"\",\"func\":\"title\"},\"catid\":{\"use\":\"1\",\"order\":\"2\",\"name\":\"栏目\",\"width\":\"120\",\"func\":\"catid\"},\"author\":{\"use\":\"1\",\"order\":\"3\",\"name\":\"作者\",\"width\":\"100\",\"func\":\"author\"},\"updatetime\":{\"use\":\"1\",\"order\":\"4\",\"name\":\"更新时间\",\"width\":\"160\",\"func\":\"datetime\"}},\"comment_list_field\":{\"content\":{\"use\":\"1\",\"order\":\"1\",\"name\":\"评论\",\"width\":\"\",\"func\":\"comment\"},\"author\":{\"use\":\"1\",\"order\":\"3\",\"name\":\"作者\",\"width\":\"100\",\"func\":\"author\"},\"inputtime\":{\"use\":\"1\",\"order\":\"4\",\"name\":\"评论时间\",\"width\":\"160\",\"func\":\"datetime\"}},\"flag\":null,\"param\":null,\"search\":{\"use\":\"1\",\"field\":\"title,keywords\",\"total\":\"500\",\"length\":\"4\",\"param_join\":\"-\",\"param_rule\":\"\",\"param_field\":\"\",\"param_join_field\":[\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"],\"param_join_default_value\":\"\"}}', '', '0', '0');
INSERT INTO `dr_module` VALUES ('4', '{\"1\":{\"html\":0,\"theme\":\"default\",\"domain\":\"\",\"template\":\"default\"}}', 'question', '1', '{\"order\":\"displayorder DESC,updatetime DESC\",\"verify_msg\":\"\",\"delete_msg\":\"\",\"list_field\":{\"title\":{\"use\":\"1\",\"order\":\"1\",\"name\":\"主题\",\"width\":\"\",\"func\":\"title\"},\"catid\":{\"use\":\"1\",\"order\":\"2\",\"name\":\"栏目\",\"width\":\"130\",\"func\":\"catid\"},\"author\":{\"use\":\"1\",\"order\":\"3\",\"name\":\"作者\",\"width\":\"120\",\"func\":\"author\"},\"updatetime\":{\"use\":\"1\",\"order\":\"4\",\"name\":\"更新时间\",\"width\":\"160\",\"func\":\"datetime\"}},\"comment_list_field\":{\"content\":{\"use\":\"1\",\"order\":\"1\",\"name\":\"评论\",\"width\":\"\",\"func\":\"comment\"},\"author\":{\"use\":\"1\",\"order\":\"3\",\"name\":\"作者\",\"width\":\"100\",\"func\":\"author\"},\"inputtime\":{\"use\":\"1\",\"order\":\"4\",\"name\":\"评论时间\",\"width\":\"160\",\"func\":\"datetime\"}},\"flag\":null,\"param\":null,\"search\":{\"use\":\"1\",\"field\":\"title,keywords\",\"total\":\"500\",\"length\":\"4\",\"param_join\":\"-\",\"param_rule\":\"0\",\"param_field\":\"\",\"param_join_field\":[\"\",\"\",\"\",\"\",\"\",\"\",\"\"],\"param_join_default_value\":\"0\"}}', '{\"use\":\"1\",\"num\":\"0\",\"my\":\"0\",\"reply\":\"0\",\"ct_reply\":\"0\",\"pagesize\":\"\",\"pagesize_mobile\":\"\",\"pagesize_api\":\"\",\"review\":{\"score\":\"10\",\"point\":\"0\",\"value\":{\"1\":{\"name\":\"1星评价\"},\"2\":{\"name\":\"2星评价\"},\"3\":{\"name\":\"3星评价\"},\"4\":{\"name\":\"4星评价\"},\"5\":{\"name\":\"5星评价\"}},\"option\":{\"1\":{\"name\":\"选项1\"},\"2\":{\"name\":\"选项2\"},\"3\":{\"name\":\"选项3\"},\"4\":{\"name\":\"选项4\"},\"5\":{\"name\":\"选项5\"},\"6\":{\"name\":\"选项6\"},\"7\":{\"name\":\"选项7\"},\"8\":{\"name\":\"选项8\"},\"9\":{\"name\":\"选项9\"}}}}', '0', '0');
INSERT INTO `dr_module` VALUES ('5', '{\"1\":{\"html\":0,\"theme\":\"default\",\"domain\":\"\",\"template\":\"default\"}}', 'join', '1', '{\"order\":\"displayorder DESC,updatetime DESC\",\"verify_msg\":\"\",\"delete_msg\":\"\",\"list_field\":{\"title\":{\"use\":\"1\",\"order\":\"1\",\"name\":\"主题\",\"width\":\"\",\"func\":\"title\"},\"catid\":{\"use\":\"1\",\"order\":\"2\",\"name\":\"栏目\",\"width\":\"130\",\"func\":\"catid\"},\"author\":{\"use\":\"1\",\"order\":\"3\",\"name\":\"作者\",\"width\":\"120\",\"func\":\"author\"},\"updatetime\":{\"use\":\"1\",\"order\":\"4\",\"name\":\"更新时间\",\"width\":\"160\",\"func\":\"datetime\"}},\"comment_list_field\":{\"content\":{\"use\":\"1\",\"order\":\"1\",\"name\":\"评论\",\"width\":\"\",\"func\":\"comment\"},\"author\":{\"use\":\"1\",\"order\":\"3\",\"name\":\"作者\",\"width\":\"100\",\"func\":\"author\"},\"inputtime\":{\"use\":\"1\",\"order\":\"4\",\"name\":\"评论时间\",\"width\":\"160\",\"func\":\"datetime\"}},\"flag\":null,\"param\":null,\"search\":{\"use\":\"1\",\"field\":\"title,keywords\",\"total\":\"500\",\"length\":\"4\",\"param_join\":\"-\",\"param_rule\":\"0\",\"param_field\":\"\",\"param_join_field\":[\"\",\"\",\"\",\"\",\"\",\"\",\"\"],\"param_join_default_value\":\"0\"}}', '{\"use\":\"1\",\"num\":\"0\",\"my\":\"0\",\"reply\":\"0\",\"ct_reply\":\"0\",\"pagesize\":\"\",\"pagesize_mobile\":\"\",\"pagesize_api\":\"\",\"review\":{\"score\":\"10\",\"point\":\"0\",\"value\":{\"1\":{\"name\":\"1星评价\"},\"2\":{\"name\":\"2星评价\"},\"3\":{\"name\":\"3星评价\"},\"4\":{\"name\":\"4星评价\"},\"5\":{\"name\":\"5星评价\"}},\"option\":{\"1\":{\"name\":\"选项1\"},\"2\":{\"name\":\"选项2\"},\"3\":{\"name\":\"选项3\"},\"4\":{\"name\":\"选项4\"},\"5\":{\"name\":\"选项5\"},\"6\":{\"name\":\"选项6\"},\"7\":{\"name\":\"选项7\"},\"8\":{\"name\":\"选项8\"},\"9\":{\"name\":\"选项9\"}}}}', '0', '0');

-- ----------------------------
-- Table structure for dr_module_form
-- ----------------------------
DROP TABLE IF EXISTS `dr_module_form`;
CREATE TABLE `dr_module_form` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '表单名称',
  `table` varchar(50) NOT NULL COMMENT '表单表名称',
  `module` varchar(50) NOT NULL COMMENT '模块目录',
  `disabled` tinyint(1) unsigned NOT NULL COMMENT '是否禁用',
  `setting` text NOT NULL COMMENT '表单配置',
  PRIMARY KEY (`id`),
  KEY `table` (`table`),
  KEY `disabled` (`disabled`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='模块表单表';

-- ----------------------------
-- Records of dr_module_form
-- ----------------------------

-- ----------------------------
-- Table structure for dr_site
-- ----------------------------
DROP TABLE IF EXISTS `dr_site`;
CREATE TABLE `dr_site` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '站点名称',
  `domain` varchar(50) NOT NULL COMMENT '站点域名',
  `setting` text NOT NULL COMMENT '站点配置',
  `disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '禁用？',
  PRIMARY KEY (`id`),
  KEY `disabled` (`disabled`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='站点表';

-- ----------------------------
-- Records of dr_site
-- ----------------------------
INSERT INTO `dr_site` VALUES ('1', '响应式大型企业集团类网站', 'www.qiyegw122.org', '{\"webpath\":null,\"config\":{\"SITE_CLOSE\":\"\",\"SITE_CLOSE_MSG\":\"网站升级中....\",\"logo\":\"25\",\"SITE_NAME\":\"响应式大型企业集团类网站\",\"SITE_ICP\":\"ICP备案号\",\"SITE_TONGJI\":\"统计\",\"SITE_LANGUAGE\":\"zh-cn\",\"SITE_TIME_FORMAT\":\"Y-m-d\",\"SITE_THEME\":\"new\",\"SITE_TEMPLATE\":\"new_templates\",\"SITE_TIMEZONE\":\"8\",\"SITE_DOMAIN\":\"www.qiyegw122.org\",\"SITE_DOMAINS\":\"\"}}', '0');

-- ----------------------------
-- Table structure for dr_urlrule
-- ----------------------------
DROP TABLE IF EXISTS `dr_urlrule`;
CREATE TABLE `dr_urlrule` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL COMMENT '规则类型',
  `name` varchar(50) NOT NULL COMMENT '规则名称',
  `value` text NOT NULL COMMENT '详细规则',
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='URL规则表';

-- ----------------------------
-- Records of dr_urlrule
-- ----------------------------
INSERT INTO `dr_urlrule` VALUES ('1', '3', '共享栏目测试规则', '{\"list\":\"list-{dirname}.html\",\"list_page\":\"list-{dirname}-{page}.html\",\"show\":\"show-{id}.html\",\"show_page\":\"show-{id}-{page}.html\",\"catjoin\":\"\\/\"}');
INSERT INTO `dr_urlrule` VALUES ('2', '2', '共享模块测试规则', '{\"search\":\"{modname}\\/search.html\",\"search_page\":\"{modname}\\/search\\/{param}.html\",\"catjoin\":\"\\/\"}');
INSERT INTO `dr_urlrule` VALUES ('3', '1', '独立模块测试规则', '{\"module\":\"{modname}.html\",\"list\":\"{modname}\\/list\\/{id}.html\",\"list_page\":\"{modname}\\/list\\/{id}\\/{page}.html\",\"show\":\"{modname}\\/show\\/{id}.html\",\"show_page\":\"{modname}\\/show\\/{id}\\/{page}.html\",\"search\":\"{modname}\\/search.html\",\"search_page\":\"{modname}\\/search\\/{param}.html\",\"catjoin\":\"\\/\"}');
