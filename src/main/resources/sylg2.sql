/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50132
Source Host           : localhost:3306
Source Database       : sylg2

Target Server Type    : MYSQL
Target Server Version : 50132
File Encoding         : 65001

Date: 2019-06-04 21:01:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `order_part`
-- ----------------------------
DROP TABLE IF EXISTS `order_part`;
CREATE TABLE `order_part` (
  `o_id` varchar(255) NOT NULL,
  `p_id` varchar(255) NOT NULL,
  `number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_part
-- ----------------------------
INSERT INTO `order_part` VALUES ('sylg20180521112014', '1', '2');
INSERT INTO `order_part` VALUES ('sylg20180521112014', 'sylg20180511172830', '2');
INSERT INTO `order_part` VALUES ('sylg20180517150148', '1', '9');
INSERT INTO `order_part` VALUES ('sylg20180524165049', '1', '6');
INSERT INTO `order_part` VALUES ('sylg20180524165612', '1', '3');
INSERT INTO `order_part` VALUES ('sylg20180518093538', 'sylg20180511172830', '5');
INSERT INTO `order_part` VALUES ('sylg20180518093822', 'sylg20180511172830', '4');
INSERT INTO `order_part` VALUES ('sylg20180530100111', '1', '4');
INSERT INTO `order_part` VALUES ('sylg20180603111653', 'sylg20180511172830', '2');
INSERT INTO `order_part` VALUES ('sylg20180603111653', '1', '2');
INSERT INTO `order_part` VALUES ('sylg20180603111653', 'sylg20180511172830', '2');
INSERT INTO `order_part` VALUES ('sylg20180603111653', '1', '3');
INSERT INTO `order_part` VALUES ('sylg20180603111653', 'sylg20180511172830', '2');
INSERT INTO `order_part` VALUES ('sylg20180603111653', '1', '3');
INSERT INTO `order_part` VALUES ('sylg20180518100324', '1', '2');
INSERT INTO `order_part` VALUES ('sylg20180620092901', 'sylg20180511172830', '7');
INSERT INTO `order_part` VALUES ('sylg20180620092901', 'sylg20180531114438', '2');
INSERT INTO `order_part` VALUES ('sylg20180620092901', 'sylg20180511172830', '7');
INSERT INTO `order_part` VALUES ('sylg20180620092901', 'sylg20180511172830', '7');
INSERT INTO `order_part` VALUES ('sylg20180620092901', 'sylg20180531114438', '2');
INSERT INTO `order_part` VALUES ('sylg20180620092901', 'sylg20180511172830', '7');
INSERT INTO `order_part` VALUES ('sylg20180620092901', 'sylg20180531114438', '2');
INSERT INTO `order_part` VALUES ('sylg20180620092901', 'sylg20180531114438', '2');
INSERT INTO `order_part` VALUES ('sylg20180603111144', 'sylg20180511172830', '1');
INSERT INTO `order_part` VALUES ('sylg20180603111144', 'sylg20180511172830', '1');
INSERT INTO `order_part` VALUES ('sylg20180603111144', 'sylg20180511172830', '1');
INSERT INTO `order_part` VALUES ('sylg20180603111144', 'sylg20180511172830', '1');
INSERT INTO `order_part` VALUES ('sylg20180603111144', 'sylg20180511172830', '1');
INSERT INTO `order_part` VALUES ('sylg20180624210940', 'sylg20180511172830', '2');
INSERT INTO `order_part` VALUES ('sylg20180624212001', 'sylg20180511172830', '1');
INSERT INTO `order_part` VALUES ('sylg20180625071248', 'sylg20180511172830', '2');
INSERT INTO `order_part` VALUES ('sylg20190330190610', 'sylg20180511172830', '4');
INSERT INTO `order_part` VALUES ('sylg20190330190610', 'sylg20180531114438', '3');
INSERT INTO `order_part` VALUES ('sylg20190330191557', 'sylg20190330190934', '10');
INSERT INTO `order_part` VALUES ('sylg20190330191557', 'sylg20180511172830', '10');
INSERT INTO `order_part` VALUES ('sylg20190415223420', 'sylg20180511172830', '4');
INSERT INTO `order_part` VALUES ('sylg20190415224304', 'sylg20180511172830', '2');
INSERT INTO `order_part` VALUES ('sylg20190417234822', 'sylg20180511172830', '2');
INSERT INTO `order_part` VALUES ('car20190426151126', 'sylg20180511172830', '2');
INSERT INTO `order_part` VALUES ('car20190521161627', 'sylg20180531114438', '1');
INSERT INTO `order_part` VALUES ('car20190521200625', 'sylg20180531114438', '1');
INSERT INTO `order_part` VALUES ('car20190427105347', 'sylg20190415224852', '1');

-- ----------------------------
-- Table structure for `order_worker`
-- ----------------------------
DROP TABLE IF EXISTS `order_worker`;
CREATE TABLE `order_worker` (
  `o_id` varchar(255) DEFAULT NULL,
  `w_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_worker
-- ----------------------------
INSERT INTO `order_worker` VALUES ('sylg20180521112014', 'sylg20180509093803');
INSERT INTO `order_worker` VALUES ('sylg20180521112014', 'sylg20180509094229');
INSERT INTO `order_worker` VALUES ('sylg20180517150148', 'sylg20180509094254');
INSERT INTO `order_worker` VALUES ('sylg20180524165049', 'sylg20180509093803');
INSERT INTO `order_worker` VALUES ('sylg20180524165612', 'sylg20180509093803');
INSERT INTO `order_worker` VALUES ('sylg20180518093538', 'sylg20180509093803');
INSERT INTO `order_worker` VALUES ('sylg20180518093822', 'sylg20180509093803');
INSERT INTO `order_worker` VALUES ('sylg20180530100111', 'sylg20180509094229');
INSERT INTO `order_worker` VALUES ('sylg20180603111653', 'sylg20180509093803');
INSERT INTO `order_worker` VALUES ('sylg20180603111653', 'sylg20180509094254');
INSERT INTO `order_worker` VALUES ('sylg20180603111653', 'sylg20180509093803');
INSERT INTO `order_worker` VALUES ('sylg20180603111653', 'sylg20180509094254');
INSERT INTO `order_worker` VALUES ('sylg20180603111653', 'sylg20180509093803');
INSERT INTO `order_worker` VALUES ('sylg20180603111653', 'sylg20180509094254');
INSERT INTO `order_worker` VALUES ('sylg20180518100324', 'sylg20180509093803');
INSERT INTO `order_worker` VALUES ('sylg20180620092901', 'sylg20180509094229');
INSERT INTO `order_worker` VALUES ('sylg20180620092901', 'sylg20180522094020');
INSERT INTO `order_worker` VALUES ('sylg20180620092901', 'sylg20180509094229');
INSERT INTO `order_worker` VALUES ('sylg20180620092901', 'sylg20180509094229');
INSERT INTO `order_worker` VALUES ('sylg20180620092901', 'sylg20180522094020');
INSERT INTO `order_worker` VALUES ('sylg20180620092901', 'sylg20180509094229');
INSERT INTO `order_worker` VALUES ('sylg20180620092901', 'sylg20180522094020');
INSERT INTO `order_worker` VALUES ('sylg20180620092901', 'sylg20180522094020');
INSERT INTO `order_worker` VALUES ('sylg20180603111144', 'sylg20180509094229');
INSERT INTO `order_worker` VALUES ('sylg20180603111144', 'sylg20180509094254');
INSERT INTO `order_worker` VALUES ('sylg20180603111144', 'sylg20180509094229');
INSERT INTO `order_worker` VALUES ('sylg20180603111144', 'sylg20180509094254');
INSERT INTO `order_worker` VALUES ('sylg20180603111144', '请选择员工');
INSERT INTO `order_worker` VALUES ('sylg20180603111144', 'sylg20180509094229');
INSERT INTO `order_worker` VALUES ('sylg20180603111144', 'sylg20180509094254');
INSERT INTO `order_worker` VALUES ('sylg20180603111144', 'sylg20180509094229');
INSERT INTO `order_worker` VALUES ('sylg20180603111144', '请选择员工');
INSERT INTO `order_worker` VALUES ('sylg20180603111144', 'sylg20180509094254');
INSERT INTO `order_worker` VALUES ('sylg20180603111144', 'sylg20180509094229');
INSERT INTO `order_worker` VALUES ('sylg20180603111144', '请选择员工');
INSERT INTO `order_worker` VALUES ('sylg20180603111144', 'sylg20180509094254');
INSERT INTO `order_worker` VALUES ('sylg20180603111144', '请选择员工');
INSERT INTO `order_worker` VALUES ('sylg20180624210940', 'sylg20180509094229');
INSERT INTO `order_worker` VALUES ('sylg20180624212001', 'sylg20180509094229');
INSERT INTO `order_worker` VALUES ('sylg20180625071248', 'sylg20180509094254');
INSERT INTO `order_worker` VALUES ('sylg20190330190610', 'sylg20180509094229');
INSERT INTO `order_worker` VALUES ('sylg20190330191557', 'sylg20180522094020');
INSERT INTO `order_worker` VALUES ('sylg20190415223420', 'sylg20180509094229');
INSERT INTO `order_worker` VALUES ('sylg20190415224304', 'sylg20180509094229');
INSERT INTO `order_worker` VALUES ('sylg20190415224304', 'sylg20180522094038');
INSERT INTO `order_worker` VALUES ('sylg20190417234822', 'sylg20180509094229');
INSERT INTO `order_worker` VALUES ('car20190426151126', 'car20190426151345');
INSERT INTO `order_worker` VALUES ('car20190521161627', 'car20190426151345');
INSERT INTO `order_worker` VALUES ('car20190521200625', 'car20190426151345');
INSERT INTO `order_worker` VALUES ('car20190427105347', 'car20190508144031');

-- ----------------------------
-- Table structure for `picture`
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture` (
  `p_id` varchar(255) NOT NULL,
  `o_id` varchar(255) DEFAULT NULL,
  `pic_url` varchar(255) DEFAULT NULL,
  `p_desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of picture
-- ----------------------------

-- ----------------------------
-- Table structure for `station_uphold`
-- ----------------------------
DROP TABLE IF EXISTS `station_uphold`;
CREATE TABLE `station_uphold` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `station_id` int(255) NOT NULL,
  `content` text NOT NULL,
  `up_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of station_uphold
-- ----------------------------
INSERT INTO `station_uphold` VALUES ('1', '1', '345过后就苦于突然特易突发一股有', '2019-05-24 10:02:52');
INSERT INTO `station_uphold` VALUES ('2', '3', '2342 3423 ', '2019-05-08 10:29:26');
INSERT INTO `station_uphold` VALUES ('3', '5', '请问是人的头发应该会尽快拍【黑寡妇天色让她的衣服哦', '2019-05-24 11:04:53');

-- ----------------------------
-- Table structure for `s_car`
-- ----------------------------
DROP TABLE IF EXISTS `s_car`;
CREATE TABLE `s_car` (
  `car_id` varchar(25) NOT NULL,
  `car_name` varchar(255) DEFAULT NULL,
  `car_type` varchar(255) DEFAULT NULL,
  `car_place` varchar(255) DEFAULT NULL,
  `buytime` date DEFAULT NULL,
  `u_id` int(11) DEFAULT NULL,
  `car_state` int(2) DEFAULT '0' COMMENT '0在用 1在修',
  `carNo` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`car_id`),
  KEY `cat_user` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_car
-- ----------------------------
INSERT INTO `s_car` VALUES ('1', '奔驰', '轿车', '德国', '2018-05-01', '24', '1', '辽U2456G');
INSERT INTO `s_car` VALUES ('car20190426150915', '奥迪', '轿车', '德国', '2019-04-26', '35', '0', '辽A00000');
INSERT INTO `s_car` VALUES ('car20190427105137', '奥迪', '货车', '2', '2019-04-07', '37', '0', '辽A00000');
INSERT INTO `s_car` VALUES ('car20190524110155', null, null, null, null, '37', '0', null);
INSERT INTO `s_car` VALUES ('sylg20180512103143', '2', '2', '2', '2018-05-04', '24', '1', '辽U2456G');
INSERT INTO `s_car` VALUES ('sylg20180512200840', '1', '2', '2', '2018-05-02', '24', '1', '辽U2456G');
INSERT INTO `s_car` VALUES ('sylg20180512200844', '1', '1', '1', null, '24', '0', '辽U2456G');
INSERT INTO `s_car` VALUES ('sylg20180512200847', '1', '1', '1', null, '24', '0', '辽U2456G');
INSERT INTO `s_car` VALUES ('sylg20180512200851', '1', '1', '1', null, '24', '0', '辽U2456G');
INSERT INTO `s_car` VALUES ('sylg20180512200855', '1', '1', '1', null, '24', '0', '辽U2456G');
INSERT INTO `s_car` VALUES ('sylg20180512200859', '2', '2', '2', null, '24', '0', '辽U2456G');
INSERT INTO `s_car` VALUES ('sylg20180512200902', '2', '2', '2', null, '24', '0', '辽U2456G');
INSERT INTO `s_car` VALUES ('sylg20180512200910', '2', '2', '2', null, '24', '0', '辽U2456G');
INSERT INTO `s_car` VALUES ('sylg20180512200916', '2', '2', '2', null, '24', '0', '辽U2456G');
INSERT INTO `s_car` VALUES ('sylg20180512200919', '2', '2', '2', null, '24', '0', '辽U2456G');
INSERT INTO `s_car` VALUES ('sylg20180517164732', '1', '1', '1', '2018-05-10', '27', '0', '辽U2456G');
INSERT INTO `s_car` VALUES ('sylg20180518093520', '保时捷911', '跑车', '德国', '2018-05-18', '27', '0', '辽U2456G');
INSERT INTO `s_car` VALUES ('sylg20180521111918', '马萨拉蒂', '轿车', '意大利', '2021-07-22', '28', '0', '辽U2456G');
INSERT INTO `s_car` VALUES ('sylg20180603101636', '马萨拉蒂', '轿车', '意大利', '2018-05-03', '25', '0', '辽U2456G');
INSERT INTO `s_car` VALUES ('sylg20180603101702', '奔驰', '轿车', '德国', '2018-06-01', '25', '0', '辽U2456G');
INSERT INTO `s_car` VALUES ('sylg20180604082047', '1', '', '', null, '28', '0', '辽U2456G');
INSERT INTO `s_car` VALUES ('sylg20180604082050', '1', '', '', null, '28', '0', '辽U2456G');
INSERT INTO `s_car` VALUES ('sylg20180604082053', '1', '', '', null, '28', '0', '辽U2456G');
INSERT INTO `s_car` VALUES ('sylg20180604082057', '1', '', '', null, '28', '0', '辽U2456G');
INSERT INTO `s_car` VALUES ('sylg20180604082100', '1', '', '', null, '28', '0', '辽U2456G');
INSERT INTO `s_car` VALUES ('sylg20180620092728', 'aaaa', '轿车', 'deg', '2018-06-20', '29', '0', '辽U2456G');
INSERT INTO `s_car` VALUES ('sylg20190330191423', 'jpg', '越野汽车', 'earth', '2019-03-01', '25', '0', '辽U2456G');
INSERT INTO `s_car` VALUES ('sylg20190415224127', '马萨拉蒂', '轿车', '意大利1', '2019-04-15', '30', '0', '辽U2456G');
INSERT INTO `s_car` VALUES ('sylg20190417234708', '宝马', '轿车', '德国', '2019-04-17', '31', '0', '京A00000');

-- ----------------------------
-- Table structure for `s_order`
-- ----------------------------
DROP TABLE IF EXISTS `s_order`;
CREATE TABLE `s_order` (
  `o_id` varchar(255) NOT NULL,
  `c_id` varchar(255) NOT NULL,
  `s_id` int(255) DEFAULT NULL,
  `o_describe` varchar(255) DEFAULT NULL,
  `o_state` varchar(255) DEFAULT NULL COMMENT '0预约 1 进行中 2 完成',
  `orderTime` datetime DEFAULT NULL,
  `arriveTime` datetime DEFAULT NULL,
  `beginTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `remark` varchar(10000) DEFAULT NULL,
  `imgUrls` text,
  `order_type` varchar(255) DEFAULT NULL,
  `kilometer` int(255) DEFAULT NULL,
  `sumMoney` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`o_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_order
-- ----------------------------
INSERT INTO `s_order` VALUES ('car20190423233921', 'sylg20180603101636', null, '123', '2', '2019-04-23 23:39:21', '2019-04-24 13:00:00', null, '2019-04-23 23:43:47', 'ss ', 'static/images/car/88bbb5ad-d6da-49bb-9858-1c101e65812f.jpg,', null, null, null);
INSERT INTO `s_order` VALUES ('car20190423233929', 'sylg20180603101636', null, '123', '2', '2019-04-23 23:39:29', '2019-04-24 13:00:00', null, '2019-04-23 23:42:42', 'byx', 'static/images/car/88bbb5ad-d6da-49bb-9858-1c101e65812f.jpg,', null, null, null);
INSERT INTO `s_order` VALUES ('car20190423234218', 'sylg20180603101702', null, '123', '2', '2019-04-23 23:42:18', '2019-04-24 00:00:00', null, '2019-04-26 15:16:42', '零件不够了', 'static/images/car/41012238-510a-4d57-9c19-366cb6e84930.jpg,', null, null, null);
INSERT INTO `s_order` VALUES ('car20190426151126', 'car20190426150915', '4', '坏了', '2', '2019-04-26 15:11:26', '2019-04-28 10:00:00', '2019-04-26 15:16:16', '2019-04-26 15:17:21', '正常来', 'static/images/car/1c3229cd-43be-4060-b076-ffdf1c7038ac.png,', null, null, null);
INSERT INTO `s_order` VALUES ('car20190427105347', 'car20190427105137', '6', '1', '2', '2019-04-27 10:53:47', '2019-04-27 00:00:00', '2019-05-21 20:08:02', '2019-05-21 20:24:20', 'qwe', 'static/images/car/068eca4e-ac03-4938-a4db-84ec133ea33c.png,', null, null, null);
INSERT INTO `s_order` VALUES ('car20190521161627', 'sylg20180512103143', '3', '12312', '2', '2019-05-21 16:16:28', '2019-05-21 16:16:02', '2019-05-21 18:27:43', '2019-05-21 18:27:50', '12', 'static/images/car/e344cfae-094f-4c1c-8b18-71c5b4d3c45b.png,', '零件修理', '112312', null);
INSERT INTO `s_order` VALUES ('car20190521200625', 'sylg20180512103143', '3', '2345678', '2', '2019-05-21 20:06:25', '2019-05-21 20:06:12', '2019-05-21 20:07:04', '2019-05-24 11:26:03', 'qwertyui', 'static/images/car/2917ecab-4594-4056-8c5e-c69576a3cf5a.png,', '汽车小修', '234567', null);
INSERT INTO `s_order` VALUES ('car20190524112705', 'sylg20180512103143', null, '123', '0', '2019-05-24 11:27:05', '2019-05-24 11:26:26', null, null, null, 'static/images/car/15ed4802-7081-4900-b8a3-ff1ae9d5d90a.png,', '零件修理', '123', null);
INSERT INTO `s_order` VALUES ('sylg20180624212001', 'sylg20180518093520', '3', '', '2', '2018-06-24 21:20:01', '2018-06-24 21:19:55', '2018-06-24 21:20:16', '2018-06-24 21:26:03', '', 'static/images/car/50d38b5a-e72d-45e7-8ba5-ed424e906348.png,', null, null, null);
INSERT INTO `s_order` VALUES ('sylg20180625071248', 'sylg20180518093520', '4', '', '2', '2018-06-25 07:12:48', '2018-06-25 07:12:38', '2018-08-09 12:33:29', '2019-04-17 23:51:02', '', 'static/images/car/1cc7f605-9692-44f8-9f54-feabe91ad6f1.jpg,static/images/car/9a169c42-281d-4b4b-a111-a615146f0069.jpg,', null, null, null);
INSERT INTO `s_order` VALUES ('sylg20190330190610', 'sylg20180603101636', '5', '对面的是个大笨蛋', '2', '2019-03-30 19:06:10', '2019-03-21 00:00:00', '2019-03-30 19:07:11', '2019-03-30 19:07:25', '1234567', 'static/images/car/5f98e169-7ae5-4a53-8915-173e76e2243d.jpg,static/images/car/725c8c77-90fb-40d8-89de-8f8aebbe1af0.jpg,static/images/car/7c809b0f-600b-4a37-bbae-21a610fe5a67.jpg,static/images/car/dffb66b2-f4b2-4098-9bc7-dd1fa5e828c6.jpg,static/images/car/896c091e-449b-41fa-9cc4-ad8873732ad1.jpg,static/images/car/70c46399-d182-4cec-9226-c86cbe0dd238.jpg,', null, null, null);
INSERT INTO `s_order` VALUES ('sylg20190330191557', 'sylg20180603101636', '5', 'qwe ', '2', '2019-03-30 19:15:57', '2019-03-30 00:00:00', '2019-03-30 19:17:26', '2019-04-17 23:50:57', '123456', 'static/images/car/3c2cb3da-d4fa-4c0d-a122-6cec252ae50c.jpg,', null, null, null);
INSERT INTO `s_order` VALUES ('sylg20190415223420', 'sylg20180603101702', '3', '123', '2', '2019-04-15 22:34:20', '2019-04-16 03:03:00', '2019-04-15 22:35:39', '2019-04-15 22:35:52', '', 'static/images/car/9a06ba5f-9039-440f-9d22-0c9f227c9ec4.jpg,', null, null, null);
INSERT INTO `s_order` VALUES ('sylg20190415224304', 'sylg20190415224127', '6', '假如我的汽车坏了 上面是问题', '2', '2019-04-15 22:43:04', '2019-04-16 11:00:00', '2019-04-15 22:46:12', '2019-04-15 22:46:55', '这个问题可以修理  客户11点来', 'static/images/car/4a463bd6-e1d9-4064-92dc-f4719e5d920f.jpg,static/images/car/5d7473a9-f979-4630-8158-eec45e0a6899.jpg,static/images/car/ca33d09a-da43-41a0-a3e3-35cc4e5416d6.jpg,static/images/car/8c0f552e-6c8e-4869-b929-0265ac6753a8.jpg,', null, null, null);
INSERT INTO `s_order` VALUES ('sylg20190417234822', 'sylg20190417234708', '6', '车灯坏了 看图片', '2', '2019-04-17 23:48:22', '2019-04-18 14:00:00', '2019-04-17 23:50:38', '2019-04-23 21:40:59', '准时到店维修', 'static/images/car/593ab310-5341-4314-be53-0a97d40b7185.jpg,', null, null, null);
INSERT INTO `s_order` VALUES ('sylg20190423215106', 'sylg20180603101636', null, '12345', '2', '2019-04-23 21:51:06', '2019-04-23 00:00:00', null, '2019-04-23 21:53:46', '零件没有了', 'static/images/car/3304c95f-94f2-4d1d-bb09-6cb9b2c77b89.jpg,', null, null, null);

-- ----------------------------
-- Table structure for `s_part`
-- ----------------------------
DROP TABLE IF EXISTS `s_part`;
CREATE TABLE `s_part` (
  `p_id` varchar(255) NOT NULL,
  `p_name` varchar(255) DEFAULT NULL,
  `p_price` double(10,2) DEFAULT NULL,
  `p_num` int(11) DEFAULT NULL,
  `lastBuyDate` datetime DEFAULT NULL,
  `warning` int(11) DEFAULT NULL,
  `system` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_part
-- ----------------------------
INSERT INTO `s_part` VALUES ('car20190526192238', '发动1', '123123.00', '5', '2019-05-26 19:44:19', '6', '发动机配件', '发动机配件1,,');
INSERT INTO `s_part` VALUES ('car20190526194326', '13123', '123.00', '123', '2019-05-26 19:43:25', '123', '发动机配件', '发动机配件1,,');
INSERT INTO `s_part` VALUES ('sylg20180511172830', '发动', '2100.00', '10', '2019-05-26 19:41:41', '2000', '发动机配件', '发动机配件1,,');
INSERT INTO `s_part` VALUES ('sylg20180531114438', '车零件', '2000.00', '15', '2018-06-23 09:23:13', '10', '传动系配件', '传输带');
INSERT INTO `s_part` VALUES ('sylg20190330190934', '排气零件', '188.00', '56', '2019-05-26 19:39:26', '100', '进气系统', ',进气系统1,');
INSERT INTO `s_part` VALUES ('sylg20190415224852', '测试零件', '1.00', '4', '2019-04-17 23:52:18', '1', '制动系配件', '刹车片');

-- ----------------------------
-- Table structure for `s_station`
-- ----------------------------
DROP TABLE IF EXISTS `s_station`;
CREATE TABLE `s_station` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_state` varchar(255) DEFAULT NULL,
  `s_type` varchar(255) DEFAULT NULL COMMENT '可维修车辆类型',
  `beginTime` datetime DEFAULT NULL COMMENT '创建时间',
  `scrapTime` datetime DEFAULT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_station
-- ----------------------------
INSERT INTO `s_station` VALUES ('1', '完好在使用', '新能源', '2019-05-21 15:38:10', null);
INSERT INTO `s_station` VALUES ('3', '完好待使用', '新能源', '2019-05-21 15:38:15', null);
INSERT INTO `s_station` VALUES ('4', '完好待使用', '普通', '2019-05-21 15:38:18', null);
INSERT INTO `s_station` VALUES ('5', '完好待使用', '普通', '2019-05-21 15:38:22', null);
INSERT INTO `s_station` VALUES ('6', '完好待使用', '普通', '2019-05-21 15:38:26', null);
INSERT INTO `s_station` VALUES ('7', '完好待使用', '新能源', '2019-05-21 15:38:31', null);

-- ----------------------------
-- Table structure for `s_user`
-- ----------------------------
DROP TABLE IF EXISTS `s_user`;
CREATE TABLE `s_user` (
  `u_id` int(255) NOT NULL AUTO_INCREMENT,
  `u_name` varchar(255) DEFAULT NULL,
  `u_pass` varchar(255) DEFAULT NULL,
  `u_phone` varchar(255) DEFAULT NULL,
  `u_level` int(2) DEFAULT '0' COMMENT '0：客户 1:员工  9：管理 默认员工',
  `u_loc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_user
-- ----------------------------
INSERT INTO `s_user` VALUES ('24', '2', '2', '13514250263', '0', '2');
INSERT INTO `s_user` VALUES ('29', 'dd', '123456', '13514257262', '0', 'sss');
INSERT INTO `s_user` VALUES ('30', '测试', '123123', '13514250262', '0', '中国');
INSERT INTO `s_user` VALUES ('31', 'test', '123123', '13514250261', '0', '123');
INSERT INTO `s_user` VALUES ('34', '张SASA', '313312', '13514250261', '2', 'sylg20180509094229');
INSERT INTO `s_user` VALUES ('35', 'test', '123456', '12312341234', '0', 'ces');
INSERT INTO `s_user` VALUES ('36', '张飞', '728871', '12312341234', '2', 'car20190426151345');
INSERT INTO `s_user` VALUES ('37', 'admin', 'admin', null, '1', null);
INSERT INTO `s_user` VALUES ('38', '1', '012217', '13514250262', '2', 'car20190508144031');

-- ----------------------------
-- Table structure for `s_worker`
-- ----------------------------
DROP TABLE IF EXISTS `s_worker`;
CREATE TABLE `s_worker` (
  `w_id` varchar(255) NOT NULL,
  `w_name` varchar(255) DEFAULT NULL,
  `w_phone` varchar(255) DEFAULT NULL,
  `w_salary` double DEFAULT NULL,
  `w_idcard` varchar(255) DEFAULT NULL,
  `w_location` varchar(255) DEFAULT NULL,
  `w_age` int(255) DEFAULT NULL,
  `w_sex` int(255) DEFAULT NULL COMMENT '0 女 1 男',
  `w_level` int(255) DEFAULT NULL COMMENT '员工水平等级 0 实习生 1 初级 2 高级',
  `w_state` int(255) DEFAULT '1' COMMENT '0不在职 1在职',
  `w_birthday` date DEFAULT NULL,
  PRIMARY KEY (`w_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_worker
-- ----------------------------
INSERT INTO `s_worker` VALUES ('car20190426151345', '张飞', '12312341234', '10000', '222222165672728871', 'ces', '18', '1', '0', '1', null);
INSERT INTO `s_worker` VALUES ('car20190508144031', '1', '13514250262', '1', '211282199506012217', '1', '1', '1', '1', '1', null);
INSERT INTO `s_worker` VALUES ('sylg20180509094229', '张SASA', '13514250266', '5000', '111222111122313312', '测试', '35', '1', '2', '1', null);

-- ----------------------------
-- View structure for `v_base`
-- ----------------------------
DROP VIEW IF EXISTS `v_base`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_base` AS (select `a`.`o_id` AS `o_id`,`a`.`c_id` AS `c_id`,`a`.`s_id` AS `s_id`,`a`.`o_describe` AS `o_describe`,`a`.`o_state` AS `o_state`,`a`.`order_type` AS `order_type`,`a`.`kilometer` AS `kilometer`,`a`.`orderTime` AS `orderTime`,`a`.`arriveTime` AS `arriveTime`,`a`.`beginTime` AS `beginTime`,`a`.`endTime` AS `endTime`,`a`.`remark` AS `remark`,`a`.`imgUrls` AS `imgUrls`,`b`.`u_id` AS `u_id`,`b`.`buytime` AS `buytime`,`b`.`car_name` AS `car_name`,`b`.`car_place` AS `car_place`,`b`.`car_state` AS `car_state`,`b`.`car_type` AS `car_type` from (`s_order` `a` left join `s_car` `b` on((`a`.`c_id` = `b`.`car_id`)))) ;

-- ----------------------------
-- View structure for `v_order`
-- ----------------------------
DROP VIEW IF EXISTS `v_order`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_order` AS (select `temp`.`o_id` AS `o_id`,`temp`.`c_id` AS `c_id`,`temp`.`s_id` AS `s_id`,`temp`.`order_type` AS `order_type`,`temp`.`kilometer` AS `kilometer`,`temp`.`o_describe` AS `o_describe`,`temp`.`o_state` AS `o_state`,`temp`.`orderTime` AS `orderTime`,`temp`.`arriveTime` AS `arriveTime`,`temp`.`beginTime` AS `beginTime`,`temp`.`endTime` AS `endTime`,`temp`.`remark` AS `remark`,`temp`.`imgUrls` AS `imgUrls`,`temp`.`u_id` AS `u_id`,`temp`.`buytime` AS `buytime`,`temp`.`car_name` AS `car_name`,`temp`.`car_place` AS `car_place`,`temp`.`car_state` AS `car_state`,`temp`.`car_type` AS `car_type`,`c`.`u_name` AS `userName`,`c`.`u_phone` AS `userPhone`,`c`.`u_loc` AS `userLoc` from (`v_base` `temp` left join `s_user` `c` on((`temp`.`u_id` = `c`.`u_id`)))) ;

-- ----------------------------
-- View structure for `v_orderpart`
-- ----------------------------
DROP VIEW IF EXISTS `v_orderpart`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_orderpart` AS (select `a`.`o_id` AS `o_id`,`a`.`number` AS `number`,`b`.`p_id` AS `p_id`,`b`.`p_name` AS `p_name`,`b`.`p_price` AS `p_price`,`b`.`p_num` AS `p_num`,`b`.`lastBuyDate` AS `lastBuyDate` from (`order_part` `a` left join `s_part` `b` on((`a`.`p_id` = `b`.`p_id`)))) ;

-- ----------------------------
-- View structure for `v_orderworker`
-- ----------------------------
DROP VIEW IF EXISTS `v_orderworker`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_orderworker` AS (select `a`.`o_id` AS `o_id`,`b`.`w_id` AS `w_id`,`b`.`w_name` AS `w_name`,`b`.`w_phone` AS `w_phone`,`b`.`w_salary` AS `w_salary`,`b`.`w_idcard` AS `w_idcard`,`b`.`w_location` AS `w_location`,`b`.`w_age` AS `w_age`,`b`.`w_sex` AS `w_sex`,`b`.`w_level` AS `w_level`,`b`.`w_state` AS `w_state`,`b`.`w_birthday` AS `w_birthday` from (`order_worker` `a` left join `s_worker` `b` on((`a`.`w_id` = `b`.`w_id`)))) ;
