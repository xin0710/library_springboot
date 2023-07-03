/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50531
Source Host           : localhost:3306
Source Database       : db_library
git
Target Server Type    : MYSQL
Target Server Version : 50531
File Encoding         : 65001

Date: 2023-03-06 11:18:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` varchar(17) COLLATE utf8_bin NOT NULL COMMENT '管理员id',
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '名',
  `password` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '密',
  `gender` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '男' COMMENT '性',
  `telephone` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '电',
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '邮',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('m001', '刘鹏', 'm001', '女', '15182764622', '111@gmail.com');
INSERT INTO `admin` VALUES ('m002', '张三', null, '男', '18834356465', '11@qq.com');
INSERT INTO `admin` VALUES ('m003', '11', null, '男', '18856254120', '0@qq.com');
INSERT INTO `admin` VALUES ('m111', '兔哥', '123456', '男', '23432345', '1@qq.com');
INSERT INTO `admin` VALUES ('mm', 'mm', 'mm', '男', null, null);

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `bookID` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '书籍ID',
  `bookName` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '书名',
  `bookAuthor` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '书籍作者',
  `bookPublisher` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '出版社',
  `publishTime` datetime DEFAULT NULL COMMENT '出版日期',
  `bookPrice` float(5,2) DEFAULT NULL COMMENT '单价',
  `bookSum` int(5) DEFAULT NULL COMMENT '总数',
  `bookLend` int(255) DEFAULT NULL COMMENT '借出数量',
  `tag` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '书籍类型',
  `isbn` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'isbn编号',
  PRIMARY KEY (`bookID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('b003', '细胞生物学（第4版）', '翟中和', '高等教育出版社', '2011-06-01 10:14:38', '78.00', '2', '0', '生物', '9787040321753');
INSERT INTO `book` VALUES ('b004', '计算机网络（第7版）', '谢希仁', '电子工业出版社', '2017-01-01 10:15:39', '45.00', '1', '1', '计算机', '9787121302954');
INSERT INTO `book` VALUES ('b005', '左宗棠全传', '秦翰才', '中华书局', '2016-06-01 10:17:50', '68.00', '3', '1', '历史', '9787101115079');
INSERT INTO `book` VALUES ('b006', '活着', '余华', '作家出版社', '2012-08-01 10:19:35', '20.00', '2', '1', '文学', '9787506365437');
INSERT INTO `book` VALUES ('b007', '鲁迅', '鲁迅', '北京日报出版社（原同心出版社）', '2014-05-25 10:21:10', '380.00', '1', '1', '文学', '9787547711101');
INSERT INTO `book` VALUES ('b009', '孙子兵法', '[春秋]孙武', '蓝天出版社', '2006-04-25 10:24:41', '29.80', '1', '0', '军事', '9787801587466');
INSERT INTO `book` VALUES ('b010', '福尔摩斯探案全集（套装共4册）', '[英]阿瑟·柯南·道尔', '译林出版社', '2017-04-01 10:27:14', '168.00', '1', '0', '小说', '9787544766432');
INSERT INTO `book` VALUES ('b112', '借出大于总量', '1', '1', '2021-10-29 22:08:46', '0.00', '1', '2', '0', '0');
INSERT INTO `book` VALUES ('b113', '借出等于总量', '2', '2', '2021-10-29 22:09:27', '0.00', '1', '1', '0', '0');
INSERT INTO `book` VALUES ('b114', '总量小于0', '3', '3', '2021-10-29 22:10:00', '0.00', '-1', '0', null, null);
INSERT INTO `book` VALUES ('b899', '母猪产后护理', '1', '1', '2023-03-06 03:16:14', '111.00', '111', '-1', '2', '2222');

-- ----------------------------
-- Table structure for borrow
-- ----------------------------
DROP TABLE IF EXISTS `borrow`;
CREATE TABLE `borrow` (
  `readerID` varchar(17) COLLATE utf8_bin NOT NULL COMMENT '读者id',
  `bookID` varchar(11) COLLATE utf8_bin NOT NULL COMMENT '书籍id',
  `borrowTime` datetime NOT NULL COMMENT '借出时间',
  `returnTime` datetime DEFAULT NULL COMMENT '归还时间',
  PRIMARY KEY (`readerID`,`bookID`,`borrowTime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of borrow
-- ----------------------------
INSERT INTO `borrow` VALUES ('r001', 'b001', '2023-03-03 07:30:14', '2023-03-06 03:07:25');
INSERT INTO `borrow` VALUES ('r001', 'b899', '2023-03-06 03:16:58', '2023-03-06 03:17:43');
INSERT INTO `borrow` VALUES ('r002', 'b003', '2021-10-11 10:30:24', '2023-03-03 07:29:27');
INSERT INTO `borrow` VALUES ('r00511', 'b002', '2023-03-06 03:06:35', '2023-03-06 03:07:30');
INSERT INTO `borrow` VALUES ('r110', 'b001', '2021-10-03 10:30:07', '2023-03-03 07:29:35');
INSERT INTO `borrow` VALUES ('r110', 'b002', '2021-10-06 10:30:37', '2023-03-03 07:29:55');
INSERT INTO `borrow` VALUES ('r110', 'b003', '2021-10-17 10:30:52', null);
INSERT INTO `borrow` VALUES ('r110', 'b004', '2021-10-03 10:31:06', '2021-10-03 10:32:13');
INSERT INTO `borrow` VALUES ('r110', 'b004', '2021-10-25 10:31:49', null);
INSERT INTO `borrow` VALUES ('r110', 'b005', '2021-09-26 10:31:25', null);
INSERT INTO `borrow` VALUES ('r110', 'b006', '2021-10-10 10:31:35', null);
INSERT INTO `borrow` VALUES ('r110', 'b007', '2021-10-12 10:32:31', null);
INSERT INTO `borrow` VALUES ('r110', 'b008', '2021-10-06 10:32:08', '2023-03-06 03:07:41');
INSERT INTO `borrow` VALUES ('r110', 'b111', '2023-03-06 03:09:50', null);
INSERT INTO `borrow` VALUES ('r111', 'b010', '2021-10-29 22:12:27', '2021-10-29 22:23:02');
INSERT INTO `borrow` VALUES ('r111', 'b111', '2021-10-29 11:27:33', '2023-03-06 03:07:38');

-- ----------------------------
-- Table structure for reader
-- ----------------------------
DROP TABLE IF EXISTS `reader`;
CREATE TABLE `reader` (
  `id` varchar(17) COLLATE utf8_bin NOT NULL COMMENT '读者id',
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '密码',
  `gender` varchar(255) COLLATE utf8_bin DEFAULT '男' COMMENT '性别',
  `telephone` varchar(15) COLLATE utf8_bin DEFAULT NULL COMMENT '联系电话',
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of reader
-- ----------------------------
INSERT INTO `reader` VALUES ('r001', '周杰', '12345678', '男', '13515251111', '111111111111@qq.com');
INSERT INTO `reader` VALUES ('r002', '黄金凤', 'r002', '女', '15630925514 ', 'guiying31@gmail.com');
INSERT INTO `reader` VALUES ('r003', '宋淑兰', 'r003', '女', '15144529242 ', 'zhuming@yahoo.com');
INSERT INTO `reader` VALUES ('r004', '陈凯', 'r004', '男', '18659586449 ', 'yfan@yahoo.com');
INSERT INTO `reader` VALUES ('r005', '草三', '123456', '男', '15526854123', '2132@qq.com');
INSERT INTO `reader` VALUES ('r00511', 'r00511', 'r00511', '男', '17330000000', '1@qq.co');
INSERT INTO `reader` VALUES ('r110', '借了8本书', 'r110', '男', '17885544754', '1@qq.co');
INSERT INTO `reader` VALUES ('r111', 'r111r111', 'r111r111', '女', '17885544754', '1@qq.co');
INSERT INTO `reader` VALUES ('r114', 'r110', 'r11444', '男', '17338453201', '1@qq.com');
