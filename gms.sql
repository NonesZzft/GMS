/*
Navicat MySQL Data Transfer

Source Server         : system
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : gms

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2018-07-19 17:08:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for companyinformation
-- ----------------------------
DROP TABLE IF EXISTS `companyinformation`;
CREATE TABLE `companyinformation` (
  `Comid` varchar(20) COLLATE utf8_bin NOT NULL,
  `Compassword` varchar(20) COLLATE utf8_bin NOT NULL,
  `Comtelephone` varchar(20) COLLATE utf8_bin NOT NULL,
  `Commail` varchar(30) COLLATE utf8_bin NOT NULL,
  `Comname` varchar(40) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`Comid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of companyinformation
-- ----------------------------
INSERT INTO `companyinformation` VALUES ('1111', '123', '13254856038111', 'tencent@qq.com', '腾讯');
INSERT INTO `companyinformation` VALUES ('2222', '456', '13869576948', 'huawei@gmail.com', '华为');
INSERT INTO `companyinformation` VALUES ('3333', '789', '17789576093', 'xinhuashe@163.com', '新华社');

-- ----------------------------
-- Table structure for companyposition
-- ----------------------------
DROP TABLE IF EXISTS `companyposition`;
CREATE TABLE `companyposition` (
  `Composition` varchar(30) COLLATE utf8_bin NOT NULL,
  `Comamount` int(30) DEFAULT NULL,
  `Comsalary` double(30,0) DEFAULT NULL,
  `Comcondition` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PoComid` varchar(30) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`PoComid`,`Composition`),
  KEY `Composition` (`Composition`),
  CONSTRAINT `companyposition_ibfk_1` FOREIGN KEY (`PoComid`) REFERENCES `companyinformation` (`Comid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of companyposition
-- ----------------------------
INSERT INTO `companyposition` VALUES ('新闻小编', '6', '5000', '擅长写作', '1111');
INSERT INTO `companyposition` VALUES ('网站前端', '5', '10000', '会html，css，js等前端语言', '1111');
INSERT INTO `companyposition` VALUES ('网站后端', '3', '20000', '会spring等框架', '1111');
INSERT INTO `companyposition` VALUES ('机器学习', '1', '50000', '会聚类、分类、降维等常见算法', '2222');
INSERT INTO `companyposition` VALUES ('历史顾问', '3', '7000', '熟悉中国历史', '3333');

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `sno` varchar(13) COLLATE utf8_bin NOT NULL,
  `cname` varchar(15) COLLATE utf8_bin NOT NULL,
  `score` float DEFAULT NULL,
  PRIMARY KEY (`sno`,`cname`),
  CONSTRAINT `grade_ibfk_1` FOREIGN KEY (`sno`) REFERENCES `student` (`sno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES ('2015141453021', '信号与系统', '90');
INSERT INTO `grade` VALUES ('2015141453021', '数字电路', '100');
INSERT INTO `grade` VALUES ('2015141453021', '模拟电路', '95');
INSERT INTO `grade` VALUES ('2015141453022', '中国近代史', '85');
INSERT INTO `grade` VALUES ('2015141453022', '历史经济学', '90');
INSERT INTO `grade` VALUES ('2015141453022', '西方历史', '70');

-- ----------------------------
-- Table structure for offer
-- ----------------------------
DROP TABLE IF EXISTS `offer`;
CREATE TABLE `offer` (
  `Offerstate` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `Offercomid` varchar(30) COLLATE utf8_bin NOT NULL,
  `Offerstumid` varchar(30) COLLATE utf8_bin NOT NULL,
  `Offerposition` varchar(30) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`Offercomid`,`Offerstumid`,`Offerposition`),
  KEY `offer_ibfk_1` (`Offerposition`),
  KEY `Offerstumid` (`Offerstumid`),
  CONSTRAINT `offer_ibfk_1` FOREIGN KEY (`Offerposition`) REFERENCES `companyposition` (`Composition`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `offer_ibfk_2` FOREIGN KEY (`Offercomid`) REFERENCES `companyposition` (`PoComid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `offer_ibfk_3` FOREIGN KEY (`Offerstumid`) REFERENCES `student` (`sno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of offer
-- ----------------------------
INSERT INTO `offer` VALUES ('接受', '2222', '2015141453021', '机器学习');
INSERT INTO `offer` VALUES ('接受', '3333', '2015141453022', '历史顾问');

-- ----------------------------
-- Table structure for passage
-- ----------------------------
DROP TABLE IF EXISTS `passage`;
CREATE TABLE `passage` (
  `Passagename` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `Passageoperatorid` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `Passagecontext` text COLLATE utf8_bin,
  `Passagaedate` datetime DEFAULT NULL,
  `Passagevariety` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `Passagenumber` int(20) NOT NULL,
  PRIMARY KEY (`Passagenumber`),
  KEY `Passageoperatorid` (`Passageoperatorid`),
  CONSTRAINT `passage_ibfk_1` FOREIGN KEY (`Passageoperatorid`) REFERENCES `schoolmanager` (`Managerid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of passage
-- ----------------------------
INSERT INTO `passage` VALUES ('还要加什么', 'root', 0xE4BB80E4B988, '2018-07-19 16:42:28', 'issue', '888');
INSERT INTO `passage` VALUES ('这是一条测试', 'root', 0xE982A3E58FAFE8BF98E8A18C, '2018-07-08 19:41:45', 'news', '28666');
INSERT INTO `passage` VALUES ('新时代全国高等学校本科教育工作会议在四川大学召开', 'root', 0x36E69C883231E697A5EFBC8CE69599E882B2E983A8E59CA8E59B9BE5B79DE5A4A7E5ADA6E58FACE5BC80E696B0E697B6E4BBA3E585A8E59BBDE9AB98E7AD89E5ADA6E6A0A1E69CACE7A791E69599E882B2E5B7A5E4BD9CE4BC9AE8AEAEE38082E4BC9AE8AEAEE5BCBAE8B083EFBC8CE8A681E6B7B1E585A5E5ADA6E4B9A0E8B4AFE5BDBBE4B9A0E8BF91E5B9B3E696B0E697B6E4BBA3E4B8ADE59BBDE789B9E889B2E7A4BEE4BC9AE4B8BBE4B989E6809DE683B3E5928CE5859AE79A84E58D81E4B99DE5A4A7E7B2BEE7A59EEFBC8CE585A8E99DA2E8B4AFE5BDBBE890BDE5AE9EE4B9A0E8BF91E5B9B3E680BBE4B9A6E8AEB035E69C8832E697A5E59CA8E58C97E4BAACE5A4A7E5ADA6E5B888E7949FE5BAA7E8B088E4BC9AE4B88AE9878DE8A681E8AEB2E8AF9DE7B2BEE7A59EEFBC8CE59D9AE68C81E2809CE4BBA5E69CACE4B8BAE69CACE2809DEFBC8CE68EA8E8BF9BE2809CE59B9BE4B8AAE59B9EE5BD92E2809DEFBC8CE58AA0E5BFABE5BBBAE8AEBEE9AB98E6B0B4E5B9B3E69CACE7A791E69599E882B2E38081E585A8E99DA2E68F90E9AB98E4BABAE6898DE59FB9E585BBE883BDE58A9BEFBC8CE980A0E5B0B1E5A0AAE5BD93E6B091E6978FE5A48DE585B4E5A4A7E4BBBBE79A84E697B6E4BBA3E696B0E4BABAE38082E69599E882B2E983A8E5859AE7BB84E4B9A6E8AEB0E38081E983A8E995BFE99988E5AE9DE7949FE587BAE5B8ADE4BC9AE8AEAEE5B9B6E8AEB2E8AF9DE38082, '2018-06-22 13:33:12', 'news', '15322314');
INSERT INTO `passage` VALUES ('四川大学', 'root', 0xE59B9BE5B79DE5A4A7E5ADA6E698AFE4B880E68980E58E86E58FB2E682A0E4B985E79A842E2E2E, '2018-07-19 16:20:21', 'college', '1530514111');
INSERT INTO `passage` VALUES ('震惊！从闲赋在家到月入过万他只用了十天', 'root', 0xE68DAE585858E68AA5E98193, '2018-07-19 15:42:24', 'news', '1530514121');
INSERT INTO `passage` VALUES ('这是一条公告', 'root', 0xE4BDA0E5A5BDE5958AEFBC9F0D0A0909090909090909090920202020202020202020202020202020, '2018-07-02 14:54:40', 'notation', '1530514480');
INSERT INTO `passage` VALUES ('这是一条招聘会信息', 'root', 0xE4B88DE5A5BD0D0A0909090909090909090920202020202020202020202020202020, '2018-07-02 14:55:14', 'position', '1530514514');
INSERT INTO `passage` VALUES ('这是一条最新调查', 'root', 0xE8BF98E58FAFE4BBA509090920202020202020202020202020202020, '2018-07-02 14:55:59', 'survey', '1530514559');
INSERT INTO `passage` VALUES ('这是一条热点问题', 'root', 0xE4B880E888ACE888AC090920202020202020202020202020202020, '2018-07-02 14:56:18', 'issue', '1530514578');
INSERT INTO `passage` VALUES ('这是一条政策', 'root', 0xE8BF98E8A18CE590A720202020202020202020202020202020, '2018-07-02 14:56:33', 'policy', '1530514593');
INSERT INTO `passage` VALUES ('这是一条指导', 'root', 0x796573EFBC81202020202020, '2018-07-02 14:56:52', 'guidence', '1530514612');
INSERT INTO `passage` VALUES ('寝室', 'root', 0xE5AF9DE5AEA4E696ADE794B5, '2018-07-19 15:48:16', 'policy', '1531986496');

-- ----------------------------
-- Table structure for schoolmanager
-- ----------------------------
DROP TABLE IF EXISTS `schoolmanager`;
CREATE TABLE `schoolmanager` (
  `Managerid` varchar(30) COLLATE utf8_bin NOT NULL,
  `Managerpassword` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`Managerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of schoolmanager
-- ----------------------------
INSERT INTO `schoolmanager` VALUES ('root', 'root');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `sno` varchar(20) COLLATE utf8_bin NOT NULL,
  `sname` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `sex` char(1) COLLATE utf8_bin DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `phone` char(11) COLLATE utf8_bin DEFAULT NULL,
  `college` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `major` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `cno` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `extra` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `psch` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `jsch` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `ssch` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `university` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `train` text COLLATE utf8_bin,
  `practice` text COLLATE utf8_bin,
  `cetf` int(3) DEFAULT NULL,
  `cets` int(3) DEFAULT NULL,
  `evaluation` text COLLATE utf8_bin,
  `intention` text COLLATE utf8_bin,
  `money` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `honor` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `certif` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `letter` text COLLATE utf8_bin,
  `attach` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `selfreco` text COLLATE utf8_bin,
  `library` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `dormitory` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `information` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('01', '王一', '123', '男', '1997-06-18', '1982748912', '计算机', '计算机科学与技术', '1284', 'wangyi@qq.com', '好学生', '一小', '一中', '一中', '清华大学', 0xE4B88AE8BF87E696B0E4B89CE696B9, 0xE885BEE8AEAFE5AE9EE4B9A0E8BF87, '666', '666', 0xE68891E5BE88E4BC98E7A780, 0xE885BEE8AEAF, '100000', '三好学生', '三好学生证书', 0xE58FB7, '无', 0xE68891E68EA8E88D90E887AAE5B7B1EFBC8CE68891E5BE88E4BC98E7A780, '1', '1', '1');
INSERT INTO `student` VALUES ('02', '王二', '123', '女', '1997-06-18', '333333', '外国语', '日语', '123', 'wanger@qq.com', '坏学生', '一小', '一中', '二中', '北京大学', 0xE697A0, 0xE58EBBE8BF87E697A5E69CACE4BAA4E68DA2, '555', '623', 0xE5969CE6ACA2E78EA9, 0xE7BFBBE8AF91, '10000', '自强之星', '数学建模金奖', 0xE58FB7, '无', 0xE68891E68EA8E88D90E68891E887AAE5B7B1, '1', '0', '0');
INSERT INTO `student` VALUES ('03', '王三', '123', '男', '1997-06-19', '1235698', '数学', '应用数学', '5555', 'wangsan@163.com', '很认真', '智慧树小学', '智慧果中学', '智慧高中', '上海交通大学', 0xE59CA8E8939DE7BF94E5ADA6E4B9A0E68C96E68E98, 0xE69CACE6A0A1E5AE9EE9AA8CE5AEA4E7A094E7A9B6, '123', '456', 0xE58FAAE4BC9AE5ADA6E4B9A0, 0xE8A7A3E586B3E8BF99E4B8AAE4B896E7958CE68980E69C89E99ABEE9A298, '10000', '勤奋之星', '数学建模特等奖', 0xE588ABE592ACE68891, '很麻烦', 0xE68891E68EA8E88D90E4BB96, '1', '0', '0');
INSERT INTO `student` VALUES ('04', '王四', '123', '男', '1997-06-19', '777777', '化学工业', '高分子', '531', 'wangsi@163.com', '无', '第十小学', '第十中学', '第十中学', '中科大', 0xE697A0, 0xE697A0, '555', '653', 0xE697A0, 0xE697A0, '无', '无', '无', 0xE697A0, '无', 0xE697A0, '0', '1', '0');
INSERT INTO `student` VALUES ('05', '王五', '123', '女', '1997-06-19', '23335', '物理', '物理', '444', 'wuli@163.com', '无', '第五小学', '第五中学', '第五中学', '中科大', 0xE697A0, 0xE697A0, '565', '434', 0xE697A0, 0xE697A0, '无', '无', ' 无', 0xE697A0, '无', 0xE697A0, '1', '0', '0');
INSERT INTO `student` VALUES ('12', '王一二', '123', '男', '1997-06-19', '121212', '计算机', '计算机', '121', '1212@163.com', '12', '第十二小学', '第十二中学', '第十二中学', '复旦大学', 0xE697A0, 0xE697A0, '121', '121', 0xE697A0, 0xE697A0, '无', '无', '无', 0x313231, '121', 0x31323132, '1', '1', '1');
INSERT INTO `student` VALUES ('2015141453021', '张三', '123', '男', '1997-06-18', '123456789', '计算机学院', '计算机', '201828', 'zhangsan@163.com', '无', '第一小学', '第一中学', '一中', '四川大学', 0xE697A0, 0xE697A0, '555', '680', 0xE5BE88E5A5BD, 0xE998BFE9878C, '123', '学雷锋先进个人', 'ACM金奖', 0xE68891E5B88CE69C9BE88EB7E5BE97E8BF99E4B8AAE5B297E4BD8D, '无', 0xE68891E68EA8E88D90E68891E887AAE5B7B1, '0', '1', '0');
INSERT INTO `student` VALUES ('2015141453022', '李四', '123', '女', '1997-06-19', '13557846026', '经济学院', '机械', '3981798', 'lisi@163.com', '无', '第二小学', '第二中学', '二中', '电子科技大学', 0xE697A0, 0xE998BFE9878CE5AE9EE4B9A0E8BF87, '445', '612', 0xE4B88DE4BC9AE78EA9, 0xE799BEE5BAA6, '123', '优秀班干部', '助人为乐证', 0xE68891E5B88CE69C9BE88EB7E5BE97E8BF99E4B8AAE5B297E4BD8D, '无', 0xE68891E68EA8E88D90E68891E887AAE5B7B1, '0', '1', '0');
