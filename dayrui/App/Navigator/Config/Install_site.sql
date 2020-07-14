CREATE TABLE IF NOT EXISTS `{dbprefix}navigator` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(5) unsigned NOT NULL COMMENT '上级id',
  `pids` text DEFAULT NULL COMMENT '所有上级id数据项',
  `type` tinyint(1) unsigned NOT NULL COMMENT '导航类型',
  `name` varchar(255) NOT NULL COMMENT '导航名称',
  `title` varchar(255) NOT NULL COMMENT 'seo标题',
  `url` varchar(255) NOT NULL COMMENT '导航地址',
  `thumb` varchar(255) NOT NULL COMMENT '图片标示',
  `show` tinyint(1) unsigned NOT NULL COMMENT '显示',
  `mark` varchar(255) DEFAULT NULL COMMENT '类型标示',
  `extend` tinyint(1) unsigned DEFAULT NULL COMMENT '是否继承下级',
  `child` tinyint(1) unsigned NOT NULL COMMENT '是否有下级',
  `childids` text DEFAULT NULL COMMENT '所有下级数据项',
  `target` tinyint(1) unsigned NOT NULL COMMENT '是否站外链接',
  `displayorder` smallint(5) NOT NULL COMMENT '显示顺序',
  PRIMARY KEY (`id`),
  KEY `list` (`id`,`type`,`show`,`displayorder`),
  KEY `mark` (`mark`),
  KEY `extend` (`extend`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='网站自定义链接表';