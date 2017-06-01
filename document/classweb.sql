create database classweb default charset utf8;
/**
评论表
 */
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `des` varchar(1000) DEFAULT NULL COMMENT '评论信息',
  `userid` int(11) DEFAULT NULL COMMENT '评论人',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `matterid` varchar(36) DEFAULT NULL COMMENT '问题id',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/**
班级表
 */
DROP TABLE IF EXISTS `t_grade`;
CREATE TABLE `t_grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '班级id',
  `name` varchar(255) NOT NULL COMMENT '班级名字',
  `des` varchar(255) DEFAULT NULL COMMENT '班级介绍',
  `logo` varchar(255) DEFAULT 'img/logo.jpg' COMMENT '班级头像',
  `userid` int(11) DEFAULT NULL COMMENT '班主任id',
  `count` int(12) DEFAULT NULL COMMENT '班级总数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `t_grade` VALUES ('1', '15秋预科班', '11111', 'img/logo.jpg', '3', '21');

/**
动态表
 */
DROP TABLE IF EXISTS `t_matter`;
CREATE TABLE `t_matter` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '动态id',
  `title` varchar(255) DEFAULT NULL COMMENT '动态表情',
  `des` varchar(10000) DEFAULT NULL COMMENT '动态描述',
  `userid` int(11) DEFAULT NULL COMMENT '发布人',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/**
消息表
 */
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息id',
  `touser` int(11) DEFAULT NULL COMMENT '此消息发送的id',
  `fouser` int(11) DEFAULT NULL COMMENT '此消息从哪个id发送过来的',
  `matterid` int(11) DEFAULT NULL COMMENT '动态id',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `des` varchar(500) DEFAULT NULL COMMENT '此消息的内容',
  `status` int(11) DEFAULT '0' COMMENT '消息状态, 默认未读',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/**
公告表
 */
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `noticeid` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告编号',
  `name` varchar(50) DEFAULT NULL COMMENT '公告标题',
  `des` varchar(500) DEFAULT NULL COMMENT '公告详情',
  `noticeday` datetime DEFAULT NULL COMMENT '发布时间',
  `userid` int(11) NOT NULL COMMENT '发布人',
  `status` int(11) DEFAULT '1',
  `noticetypeid` int(11) DEFAULT NULL COMMENT '公告类型id',
  PRIMARY KEY (`noticeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/**
公告类型表
 */
DROP TABLE IF EXISTS `t_noticetype`;
CREATE TABLE `t_noticetype` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告类型编号',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `des` varchar(255) DEFAULT NULL COMMENT '描述',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

INSERT INTO `t_noticetype` VALUES ('1', '其他', '其他类型公告', '1');
INSERT INTO `t_noticetype` VALUES ('2', '放假公告', '放假类型公告', '1');
INSERT INTO `t_noticetype` VALUES ('3', '活动公告', '活动类型公告', '1');
INSERT INTO `t_noticetype` VALUES ('4', '重要通知', '重要通知类型公告', '1');
INSERT INTO `t_noticetype` VALUES ('5', '紧急通知', '紧急通知类型公告', '1');
INSERT INTO `t_noticetype` VALUES ('6', '教务通知', '教务通知类型公告', '1');

/**
权限表
 */
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `name` varchar(255) NOT NULL COMMENT '权限名称',
  `des` varchar(255) DEFAULT NULL COMMENT '权限描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

INSERT INTO `t_permission` VALUES ('1', 'grade:update', '修改班级信息');
INSERT INTO `t_permission` VALUES ('2', 'written:add', '添加班级留言');
INSERT INTO `t_permission` VALUES ('3', 'written:delete', '删除班级留言');
INSERT INTO `t_permission` VALUES ('4', 'users:add', '添加班级成员');
INSERT INTO `t_permission` VALUES ('5', 'users:update', '修改班级成员信息');
INSERT INTO `t_permission` VALUES ('6', 'matter:add', '添加动态');
INSERT INTO `t_permission` VALUES ('7', 'matter:delete', '删除动态');
INSERT INTO `t_permission` VALUES ('8', 'comment:add', '添加评论');
INSERT INTO `t_permission` VALUES ('9', 'reply:add', '添加回复');
INSERT INTO `t_permission` VALUES ('10', 'photo:add', '添加班级相册');
INSERT INTO `t_permission` VALUES ('11', 'photo:update', '修改班级相册');
INSERT INTO `t_permission` VALUES ('12', 'photo:delete', '删除班级相册');
INSERT INTO `t_permission` VALUES ('13', 'video:add', '添加班级视频');
INSERT INTO `t_permission` VALUES ('14', 'video:update', '修改班级视频');
INSERT INTO `t_permission` VALUES ('15', 'video:delete', '删除班级视频');
INSERT INTO `t_permission` VALUES ('16', 'notice:add', '添加公告');
INSERT INTO `t_permission` VALUES ('17', 'notice:update', '修改班级公告');
INSERT INTO `t_permission` VALUES ('18', 'notice:delete', '删除公告');

/**
相册表
 */
DROP TABLE IF EXISTS `t_photo`;
CREATE TABLE `t_photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '相册id',
  `name` varchar(255) DEFAULT NULL COMMENT '相册名称',
  `des` varchar(255) DEFAULT NULL COMMENT '相册介绍',
  `image` varchar(255) DEFAULT NULL COMMENT '相册图片',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `status` int(11) DEFAULT '1' COMMENT '状态',
  `userid` int(11) NOT NULL COMMENT '上传图片的人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/**
回复表
 */
DROP TABLE IF EXISTS `t_reply`;
CREATE TABLE `t_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '回复id',
  `userid` int(11) NOT NULL COMMENT '回复人id',
  `des` varchar(255) NOT NULL COMMENT '回复内容',
  `commentid` int(11) DEFAULT NULL COMMENT '评论id',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/**
角色表
 */
DROP TABLE IF EXISTS `t_roles`;
CREATE TABLE `t_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `name` varchar(255) NOT NULL COMMENT '角色名称',
  `des` varchar(255) NOT NULL COMMENT '角色的描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO `t_roles` VALUES ('1', 'admin', '管理面，也就是班干部');
INSERT INTO `t_roles` VALUES ('2', 'teacher', '任课老师，如大牛老师');
INSERT INTO `t_roles` VALUES ('3', 'classTeacher', '班主任，如庆哥');
INSERT INTO `t_roles` VALUES ('4', 'student', '普通学生');
INSERT INTO `t_roles` VALUES ('5', 'guest', '来宾用户');

/**
角色权限表
 */
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleid` int(11) DEFAULT NULL COMMENT '角色id',
  `permissionid` int(11) DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

INSERT INTO `t_role_permission` VALUES ('1', '1', '1');
INSERT INTO `t_role_permission` VALUES ('2', '1', '2');
INSERT INTO `t_role_permission` VALUES ('3', '1', '3');
INSERT INTO `t_role_permission` VALUES ('4', '1', '4');
INSERT INTO `t_role_permission` VALUES ('5', '1', '5');
INSERT INTO `t_role_permission` VALUES ('6', '1', '6');
INSERT INTO `t_role_permission` VALUES ('7', '1', '7');
INSERT INTO `t_role_permission` VALUES ('8', '1', '8');
INSERT INTO `t_role_permission` VALUES ('9', '1', '9');
INSERT INTO `t_role_permission` VALUES ('10', '1', '10');
INSERT INTO `t_role_permission` VALUES ('11', '1', '11');
INSERT INTO `t_role_permission` VALUES ('12', '1', '12');
INSERT INTO `t_role_permission` VALUES ('13', '1', '13');
INSERT INTO `t_role_permission` VALUES ('14', '1', '14');
INSERT INTO `t_role_permission` VALUES ('15', '1', '15');
INSERT INTO `t_role_permission` VALUES ('16', '1', '16');
INSERT INTO `t_role_permission` VALUES ('17', '1', '17');
INSERT INTO `t_role_permission` VALUES ('18', '1', '18');
INSERT INTO `t_role_permission` VALUES ('19', '2', '1');
INSERT INTO `t_role_permission` VALUES ('20', '2', '2');
INSERT INTO `t_role_permission` VALUES ('21', '2', '3');
INSERT INTO `t_role_permission` VALUES ('22', '2', '4');
INSERT INTO `t_role_permission` VALUES ('23', '2', '5');
INSERT INTO `t_role_permission` VALUES ('24', '2', '6');
INSERT INTO `t_role_permission` VALUES ('25', '2', '7');
INSERT INTO `t_role_permission` VALUES ('26', '2', '8');
INSERT INTO `t_role_permission` VALUES ('27', '2', '9');
INSERT INTO `t_role_permission` VALUES ('28', '2', '10');
INSERT INTO `t_role_permission` VALUES ('29', '2', '11');
INSERT INTO `t_role_permission` VALUES ('30', '2', '12');
INSERT INTO `t_role_permission` VALUES ('31', '2', '13');
INSERT INTO `t_role_permission` VALUES ('32', '2', '14');
INSERT INTO `t_role_permission` VALUES ('33', '2', '15');
INSERT INTO `t_role_permission` VALUES ('34', '2', '16');
INSERT INTO `t_role_permission` VALUES ('35', '2', '17');
INSERT INTO `t_role_permission` VALUES ('36', '2', '18');
INSERT INTO `t_role_permission` VALUES ('37', '3', '1');
INSERT INTO `t_role_permission` VALUES ('38', '3', '2');
INSERT INTO `t_role_permission` VALUES ('39', '3', '3');
INSERT INTO `t_role_permission` VALUES ('40', '3', '4');
INSERT INTO `t_role_permission` VALUES ('41', '3', '5');
INSERT INTO `t_role_permission` VALUES ('42', '3', '6');
INSERT INTO `t_role_permission` VALUES ('43', '3', '7');
INSERT INTO `t_role_permission` VALUES ('44', '3', '8');
INSERT INTO `t_role_permission` VALUES ('45', '3', '9');
INSERT INTO `t_role_permission` VALUES ('46', '3', '10');
INSERT INTO `t_role_permission` VALUES ('47', '3', '11');
INSERT INTO `t_role_permission` VALUES ('48', '3', '12');
INSERT INTO `t_role_permission` VALUES ('49', '3', '13');
INSERT INTO `t_role_permission` VALUES ('50', '3', '14');
INSERT INTO `t_role_permission` VALUES ('51', '3', '15');
INSERT INTO `t_role_permission` VALUES ('52', '3', '16');
INSERT INTO `t_role_permission` VALUES ('53', '3', '17');
INSERT INTO `t_role_permission` VALUES ('54', '3', '18');
INSERT INTO `t_role_permission` VALUES ('55', '4', '2');
INSERT INTO `t_role_permission` VALUES ('56', '4', '6');
INSERT INTO `t_role_permission` VALUES ('57', '4', '8');
INSERT INTO `t_role_permission` VALUES ('58', '4', '9');
INSERT INTO `t_role_permission` VALUES ('59', '4', '3');
INSERT INTO `t_role_permission` VALUES ('60', '4', '6');
INSERT INTO `t_role_permission` VALUES ('61', '4', '7');

/**
用户表
 */
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '用户的id',
  `head` varchar(255) DEFAULT 'img/default.png' COMMENT '用户的头像',
  `username` varchar(255) NOT NULL COMMENT '用户的昵称',
  `password` varchar(255) NOT NULL COMMENT '用户的密码',
  `phone` varchar(11) NOT NULL COMMENT '手机号，用于登录系统',
  `idcard` varchar(18) DEFAULT NULL COMMENT '身份证号码',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `qq` varchar(255) DEFAULT NULL COMMENT 'qq',
  `wechat` varchar(255) DEFAULT NULL COMMENT '微信',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `birthday` varchar(255) DEFAULT NULL COMMENT '生日',
  `gender` varchar(255) NOT NULL COMMENT '性别',
  `nation` varchar(255) DEFAULT NULL COMMENT '籍贯',
  `residence` varchar(255) DEFAULT NULL COMMENT '户口性质',
  `parentname` varchar(255) DEFAULT NULL COMMENT '家长姓名',
  `parentphone` varchar(255) DEFAULT NULL COMMENT '家长电话',
  `des` varchar(255) DEFAULT NULL COMMENT '个人描述',
  `status` varchar(255) NOT NULL COMMENT '账号状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `t_user` VALUES ('1', 'uploads/head/2017-03-25/1490407941420.jpg', '王彬  ', '6khXbzC+FmmXFpnAmtBclA==', '15079762838', '360721199812014014', '赣州', '12121', '121212', '19', '1998-12-01', '男', '江西', '农村', '王彬', null, '王彬', '1');
INSERT INTO `t_user` VALUES ('2', 'uploads/head/2017-03-25/1490407941420.jpg', '王根参', '6khXbzC+FmmXFpnAmtBclA==', '13672297775', '360721190111110987', '赣州', '12121', '121212', '18', '', '男', '江西', '城市', '王根参', '12345678909', '王根参', '1');
INSERT INTO `t_user` VALUES ('3', 'uploads/head/2017-03-25/1490407941420.jpg', '何庆 ', 'rrjxiaRB9FEZYgVePDDNLA==', '13767728600', '360721190111110987', '赣州', '12121', '1', '116', '1901-11-11', '男', '江西', '农村', '何庆', null, '何庆', '1');
INSERT INTO `t_user` VALUES ('4', 'uploads/head/2017-03-25/1490407941420.jpg', '张文星', 'rrjxiaRB9FEZYgVePDDNLA==', '15570102341', '360721199812014014', '赣州', '12121', 'w1233411', '19', '1998-12-01', '女', '江西', '农村', '张文星', null, '', '1');

/**
用户角色表
 */
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户角色id',
  `userid` int(11) NOT NULL COMMENT '用户id',
  `roleid` int(11) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

INSERT INTO `t_user_role` VALUES ('1', '1', '1');
INSERT INTO `t_user_role` VALUES ('2', '2', '2');
INSERT INTO `t_user_role` VALUES ('3', '3', '3');
INSERT INTO `t_user_role` VALUES ('4', '4', '4');
INSERT INTO `t_user_role` VALUES ('5', '5', '4');
INSERT INTO `t_user_role` VALUES ('6', '6', '4');
INSERT INTO `t_user_role` VALUES ('7', '7', '4');
INSERT INTO `t_user_role` VALUES ('8', '8', '4');
INSERT INTO `t_user_role` VALUES ('9', '9', '4');
INSERT INTO `t_user_role` VALUES ('10', '10', '4');
INSERT INTO `t_user_role` VALUES ('11', '11', '4');
INSERT INTO `t_user_role` VALUES ('12', '12', '4');
INSERT INTO `t_user_role` VALUES ('13', '13', '4');
INSERT INTO `t_user_role` VALUES ('14', '14', '4');
INSERT INTO `t_user_role` VALUES ('15', '15', '4');
INSERT INTO `t_user_role` VALUES ('16', '16', '4');
INSERT INTO `t_user_role` VALUES ('17', '17', '4');
INSERT INTO `t_user_role` VALUES ('18', '18', '4');
INSERT INTO `t_user_role` VALUES ('19', '19', '4');
INSERT INTO `t_user_role` VALUES ('20', '20', '4');
INSERT INTO `t_user_role` VALUES ('21', '21', '4');
INSERT INTO `t_user_role` VALUES ('22', '22', '4');
INSERT INTO `t_user_role` VALUES ('23', '23', '4');
INSERT INTO `t_user_role` VALUES ('24', '24', '4');
INSERT INTO `t_user_role` VALUES ('25', '25', '4');
INSERT INTO `t_user_role` VALUES ('26', '26', '4');
INSERT INTO `t_user_role` VALUES ('27', '27', '4');
INSERT INTO `t_user_role` VALUES ('28', '28', '4');
INSERT INTO `t_user_role` VALUES ('29', '29', '4');
INSERT INTO `t_user_role` VALUES ('30', '30', '4');
INSERT INTO `t_user_role` VALUES ('31', '31', '4');
INSERT INTO `t_user_role` VALUES ('32', '32', '4');
INSERT INTO `t_user_role` VALUES ('33', '33', '4');
INSERT INTO `t_user_role` VALUES ('34', '34', '4');
INSERT INTO `t_user_role` VALUES ('35', '35', '4');
INSERT INTO `t_user_role` VALUES ('36', '36', '4');
INSERT INTO `t_user_role` VALUES ('37', '37', '4');
INSERT INTO `t_user_role` VALUES ('38', '38', '4');
INSERT INTO `t_user_role` VALUES ('39', '5', '4');
INSERT INTO `t_user_role` VALUES ('40', '6', '4');
INSERT INTO `t_user_role` VALUES ('41', '7', '4');
INSERT INTO `t_user_role` VALUES ('42', '8', '4');
INSERT INTO `t_user_role` VALUES ('43', '9', '4');
INSERT INTO `t_user_role` VALUES ('44', '10', '4');
INSERT INTO `t_user_role` VALUES ('45', '11', '4');
INSERT INTO `t_user_role` VALUES ('46', '12', '4');
INSERT INTO `t_user_role` VALUES ('47', '13', '4');
INSERT INTO `t_user_role` VALUES ('48', '14', '4');
INSERT INTO `t_user_role` VALUES ('49', '15', '4');
INSERT INTO `t_user_role` VALUES ('50', '16', '4');
INSERT INTO `t_user_role` VALUES ('51', '17', '4');
INSERT INTO `t_user_role` VALUES ('52', '18', '4');
INSERT INTO `t_user_role` VALUES ('53', '19', '4');
INSERT INTO `t_user_role` VALUES ('54', '20', '4');
INSERT INTO `t_user_role` VALUES ('55', '21', '4');
INSERT INTO `t_user_role` VALUES ('56', '22', '4');
INSERT INTO `t_user_role` VALUES ('57', '23', '4');
INSERT INTO `t_user_role` VALUES ('58', '24', '4');
INSERT INTO `t_user_role` VALUES ('59', '25', '4');
INSERT INTO `t_user_role` VALUES ('60', '26', '4');
INSERT INTO `t_user_role` VALUES ('61', '27', '4');
INSERT INTO `t_user_role` VALUES ('62', '28', '4');
INSERT INTO `t_user_role` VALUES ('63', '29', '4');
INSERT INTO `t_user_role` VALUES ('64', '30', '4');
INSERT INTO `t_user_role` VALUES ('65', '31', '4');
INSERT INTO `t_user_role` VALUES ('66', '32', '4');
INSERT INTO `t_user_role` VALUES ('67', '33', '4');
INSERT INTO `t_user_role` VALUES ('68', '34', '4');
INSERT INTO `t_user_role` VALUES ('69', '35', '4');

/**
视频表
 */
DROP TABLE IF EXISTS `t_video`;
CREATE TABLE `t_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '视频id',
  `name` varchar(255) DEFAULT NULL COMMENT '视频名称',
  `des` varchar(255) DEFAULT NULL COMMENT '视频介绍',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `url` varchar(255) DEFAULT NULL COMMENT 'URL地址',
  `userid` int(11) DEFAULT NULL COMMENT '上传人',
  `status` varchar(255) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/**
留言表
 */
DROP TABLE IF EXISTS `t_written`;
CREATE TABLE `t_written` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '留言id',
  `userid` int(11) DEFAULT NULL COMMENT '留言人',
  `des` varchar(255) DEFAULT NULL COMMENT '留言信息',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
