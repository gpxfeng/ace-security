/*
Navicat MySQL Data Transfer

Source Server         : localhost_mysql
Source Server Version : 50549
Source Host           : localhost:3306
Source Database       : videocms

Target Server Type    : MYSQL
Target Server Version : 50549
File Encoding         : 65001

Date: 2019-06-15 09:59:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for androidbox
-- ----------------------------
DROP TABLE IF EXISTS `androidbox`;
CREATE TABLE `androidbox` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '盒子id',
  `mac` varchar(255) DEFAULT NULL,
  `orderid` varchar(255) DEFAULT NULL COMMENT '访问token',
  `provid` varchar(255) DEFAULT NULL,
  `system` varchar(255) DEFAULT NULL,
  `chip` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `launcher` varchar(255) DEFAULT NULL COMMENT 'launcher',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of androidbox
-- ----------------------------
INSERT INTO `androidbox` VALUES ('1', '00:11:6e:02:18:08', '2017-05-10 08:28:55', 'p212_8189', '6.0.1', 'Amlogic', '1', '2017-05-10 08:29:07', '2017-05-04 22:36:42', 'com.zk.normal');
INSERT INTO `androidbox` VALUES ('2', '72:7e:2b:c8:6e:d0', '2017-05-07 15:05:24', 'EVPAD-2S-H', '4.4.2', 'EVPAD', '1', '2017-05-10 11:49:38', '2017-05-07 14:54:56', 'com.moon.android.evpad');
INSERT INTO `androidbox` VALUES ('3', '00:11:6e:01:0e:f4', '2017-05-10 22:09:45', 'p212_8189', '6.0.1', 'Amlogic', '1', '2017-05-10 23:02:54', '2017-05-10 22:09:45', 'com.mirage.launch');
INSERT INTO `androidbox` VALUES ('4', '00:11:6e:02:0a:08', null, 'p212_8189', '6.0.1', 'Amlogic', '1', '2017-12-26 16:01:33', '2017-12-26 16:01:21', 'com.zoomtak.tv');
INSERT INTO `androidbox` VALUES ('5', '00:11:6e:05:01:02', null, 'p212_8189', '6.0.1', 'Amlogic', '1', '2017-12-28 14:35:05', '2017-12-28 14:34:47', 'com.mirage.launch');

-- ----------------------------
-- Table structure for appinfo
-- ----------------------------
DROP TABLE IF EXISTS `appinfo`;
CREATE TABLE `appinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '名称',
  `enable` tinyint(1) DEFAULT '0' COMMENT '是否可用',
  `description` text COMMENT '描述',
  `downtime` int(11) DEFAULT '0' COMMENT '下载次数',
  `installmodel` tinyint(1) DEFAULT '0' COMMENT '安装模式',
  `updatetime` datetime DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `versionname` varchar(255) DEFAULT NULL,
  `versioncode` int(11) DEFAULT '0',
  `categoryid` int(11) DEFAULT '0' COMMENT '类别id',
  `essential` tinyint(1) DEFAULT '0' COMMENT '是否必备',
  `downurl` varchar(255) DEFAULT NULL COMMENT '下载地址',
  `sequence` int(11) DEFAULT '0' COMMENT '序号',
  `pkgname` varchar(255) DEFAULT NULL COMMENT '包名',
  `boxid` int(11) DEFAULT '0',
  `iconurl` varchar(255) DEFAULT NULL,
  `imgurl` text,
  PRIMARY KEY (`id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of appinfo
-- ----------------------------
INSERT INTO `appinfo` VALUES ('35', 'dream tv', '0', 'dream tv', '0', '1', '2017-11-14 08:34:19', '2017-03-16 21:53:37', '1.0.1', '1', '3', '1', 'http://upgrade.brauditv.com:9190/app/Dream_TV_sign.apk', '100', 'com.gemini.test', '2', 'http://upgrade.brauditv.com:9190/app/img/tv.jpg', 'http://img1.360buyimg.com/imgb/s250x250_jfs/t3190/8/5069233134/243284/c599ec55/5861d884Nd24b0b4c.jpg,http://img1.360buyimg.com/imgb/s250x250_jfs/t3190/8/5069233134/243284/c599ec55/5861d884Nd24b0b4c.jpg');
INSERT INTO `appinfo` VALUES ('48', 'Launcher', '1', 'launcher', '0', '1', '2017-11-14 08:37:08', '2017-06-02 12:08:53', '1.0', '20171113', '6', '1', 'http://upgrade.brauditv.com:9190/app/MirageLaunch_sign.apk', '100', 'com.mirage.launch', '1', 'http://upgrade.brauditv.com:9190/app/img/launch_ico.png', '');
INSERT INTO `appinfo` VALUES ('49', 'Dream Vod', '1', 'Dream Vod', '0', '1', '2017-11-15 07:10:58', '2017-06-26 13:32:26', '201703111827', '20171114', '3', '1', 'http://upgrade.brauditv.com:9190/app/DreamVod_sign.apk', '100', 'com.auditv.dreamvod', '1', 'http://upgrade.brauditv.com:9190/app/img/dream_vod1.png', 'http://upgrade.brauditv.com:9190/app/img/dream_vod001.png,http://upgrade.brauditv.com:9190/app/img/dream_vod002.png,http://upgrade.brauditv.com:9190/app/img/dream_vod003.png,http://upgrade.brauditv.com:9190/app/img/dream_vod004.png');
INSERT INTO `appinfo` VALUES ('54', 'Dream Series', '1', 'Dream Series', '0', '1', '2017-11-15 04:18:03', '2017-09-25 16:50:27', '201703111827', '20171114', '3', '1', 'http://upgrade.brauditv.com:9190/app/DreamSeries_sign.apk', '100', 'com.auditv.dreamseries', '1', 'http://upgrade.brauditv.com:9190/app/img/dream_series1.png', '');
INSERT INTO `appinfo` VALUES ('55', 'Dream TV', '1', 'Dream TV', '0', '1', '2017-11-14 08:30:54', '2017-10-14 15:34:35', '11.0', '20171024', '3', '1', 'http://upgrade.brauditv.com:9190/app/Dream_TV_sign.apk', '100', 'com.auditv.dreamtv', '1', 'http://upgrade.brauditv.com:9190/app/img/dream_tv.png', '');
INSERT INTO `appinfo` VALUES ('56', 'Hot TV', '1', 'Hot TV', '0', '1', '2017-11-14 08:31:10', '2017-10-16 17:36:31', '11.0', '20171024', '3', '1', 'http://upgrade.brauditv.com:9190/app/Hot_TV_sign.apk', '100', 'com.auditv.sextv', '1', 'http://upgrade.brauditv.com:9190/app/img/hot_tv.png', '');
INSERT INTO `appinfo` VALUES ('57', 'Test', '1', 'TestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTest', '0', '0', '2017-11-04 20:38:39', '2017-11-01 14:17:54', '10.0', '10', '7', '0', 'http://fms.ipinyou.com/5/07/AC/1F/F001Nl1PhBm0000QyigP.jpg', '100', 'test.auditv.com', '0', 'http://upgrade.brauditv.com:9190/app/img/dream_live.jpg', 'http://fms.ipinyou.com/5/07/AC/1F/F001Nl1PhBm0000QyigP.jpg,http://fms.ipinyou.com/5/07/AC/1F/F001Nl1PhBm0000QyigP.jpg');
INSERT INTO `appinfo` VALUES ('58', 'Dream Stroe', '1', 'Dream Stroe', '7', '0', '2017-11-14 08:40:23', '2017-11-04 20:47:31', '201711141827', '20171114', '6', '0', 'http://upgrade.brauditv.com:9190/app/DreamStore_sign.apk', '100', 'com.aitaktv.dreamstroe', '0', 'http://upgrade.brauditv.com:9190/app/img/store.jpg', 'http://upgrade.brauditv.com:9190/app/img/device1.png,http://upgrade.brauditv.com:9190/app/img/device2.png,http://upgrade.brauditv.com:9190/app/img/device3.png,http://upgrade.brauditv.com:9190/app/img/device4.png,http://upgrade.brauditv.com:9190/app/img/device5.png');
INSERT INTO `appinfo` VALUES ('59', 'gemini-iptv-iauditv', '0', 'gemini-iptv-iauditv', '0', '0', '2017-11-09 15:55:28', '2017-11-09 15:52:06', '11.0', '110', '3', '0', 'http://192.168.0.104:8080/test/gemini-iptv-iauditv.apk', '100', 'com.gemini.iphantom', '0', 'http://upgrade.brauditv.com:9190/app/img/fy1.png', 'http://upgrade.brauditv.com:9190/app/img/fy1.png');
INSERT INTO `appinfo` VALUES ('60', 'Skype', '1', 'Skype is for doing things together, whenever you’re apart. Skype makes it simple to share experiences with the people that matter to you, wherever they are. ', '0', '0', '2017-11-13 07:01:58', '2017-11-13 06:09:23', '8.10.0.4', '134255625', '8', '0', 'http://upgrade.brauditv.com:9190/app/chat/skype-8-10-0-4.apk', '100', 'com.skype.raider', '0', 'http://upgrade.brauditv.com:9190/app/img/skype.png', 'http://upgrade.brauditv.com:9190/app/img/skype001 .png,http://upgrade.brauditv.com:9190/app/img/skype002 .png,http://upgrade.brauditv.com:9190/app/img/skype003.jpg');
INSERT INTO `appinfo` VALUES ('61', 'Messenger', '1', 'Facebook is a social networking website that is operated and privately owned by Facebook, Inc.Since September 2006, anyone who confirms themselves to be over the age of 13 with a valid e-mail address can become a Facebook user. ', '0', '0', '2017-11-13 07:13:35', '2017-11-13 06:27:43', '143.0.0.20.69', '79000748', '8', '0', 'http://upgrade.brauditv.com:9190/app/chat/facebook-messenger-143-0-0-20-69.apk', '100', 'com.facebook.orca', '0', 'http://upgrade.brauditv.com:9190/app/img/facebook-messenger.png', 'http://upgrade.brauditv.com:9190/app/img/facebook001.jpg,http://upgrade.brauditv.com:9190/app/img/facebook002.jpg,http://upgrade.brauditv.com:9190/app/img/facebook003.jpg');
INSERT INTO `appinfo` VALUES ('63', 'Tumblr', '1', 'Tumblr is where your interests connect you with your people.', '0', '0', '2017-11-14 01:31:35', '2017-11-13 06:33:03', '9.6.0.00', '109060000', '8', '0', 'http://upgrade.brauditv.com:9190/app/chat/tumblr-9-6-0-00.apk', '100', 'com.tumblr', '0', 'http://upgrade.brauditv.com:9190/app/img/tumblr.png', 'http://upgrade.brauditv.com:9190/app/img/tumblr001.jpg,http://upgrade.brauditv.com:9190/app/img/tumblr002.png,http://upgrade.brauditv.com:9190/app/img/tumblr003.png');
INSERT INTO `appinfo` VALUES ('64', 'WhatsApp', '1', 'WhatsApp is available in over 40 languages (up to 60 on Android). As a general rule, WhatsApp follows the language of your phone. If you change the language of your phone to Spanish, WhatsApp will automatically be in Spanish.', '0', '0', '2017-11-13 07:10:46', '2017-11-13 06:36:49', '2.17.412', '452084', '8', '0', 'http://upgrade.brauditv.com:9190/app/chat/whatsapp-messenger-2-17-412.apk', '100', 'com.whatsapp', '0', 'http://upgrade.brauditv.com:9190/app/img/whatsapp-messenger.png', 'http://upgrade.brauditv.com:9190/app/img/whatsapp001.png,http://upgrade.brauditv.com:9190/app/img/whatsapp002.jpg,http://upgrade.brauditv.com:9190/app/img/whatsapp003.jpg');
INSERT INTO `appinfo` VALUES ('65', 'Snapchat', '1', 'Snapchat Online Chat save and share your snapchat snaps and stories online from your computer.', '0', '0', '2017-11-13 07:15:39', '2017-11-13 06:39:57', '10.20.0.0', '1382', '8', '0', 'http://upgrade.brauditv.com:9190/app/chat/snapchat-10-20-0-0.apk', '100', 'com.snapchat.android', '0', 'http://upgrade.brauditv.com:9190/app/img/snapchat.png', 'http://upgrade.brauditv.com:9190/app/img/snapchat001.png,http://upgrade.brauditv.com:9190/app/img/snapchat002.png,http://upgrade.brauditv.com:9190/app/img/snapchat003.png');
INSERT INTO `appinfo` VALUES ('66', 'Vevo', '1', 'Vevo is working hard to make sure all of our videos are available worldwide. In the meantime, watch your favorite music videos through Vevo on YouTube, and follow us on social media for updates!', '0', '0', '2017-11-13 07:16:11', '2017-11-13 06:48:37', '5.4.0.5', '1763499728', '3', '0', 'http://upgrade.brauditv.com:9190/app/chat/vevo-5-4-0-5.apk', '100', 'com.vevo', '0', 'http://upgrade.brauditv.com:9190/app/img/vevo.png', 'http://upgrade.brauditv.com:9190/app/img/vevo001.png,http://upgrade.brauditv.com:9190/app/img/vevo002.jpg,http://upgrade.brauditv.com:9190/app/img/vevo003.jpg');
INSERT INTO `appinfo` VALUES ('67', 'Dream Vod', '1', 'Dream Vod', '0', '1', '2017-12-26 16:35:00', '2017-12-26 16:35:02', '201703111827', '20171114', '3', '1', 'http://upgrade.brauditv.com:9190/app/DreamVod_sign.apk', '100', 'com.auditv.vodtest', '1', 'http://upgrade.brauditv.com:9190/app/img/dream_vod1.png', 'http://upgrade.brauditv.com:9190/app/img/dream_vod001.png,http://upgrade.brauditv.com:9190/app/img/dream_vod002.png,http://upgrade.brauditv.com:9190/app/img/dream_vod003.png,http://upgrade.brauditv.com:9190/app/img/dream_vod004.png');
INSERT INTO `appinfo` VALUES ('68', 'Dream Series', '0', 'Dream Series', '0', '1', '2017-12-28 15:37:17', '2017-12-28 15:37:19', '201703111827', '20171114', '3', '1', 'http://upgrade.brauditv.com:9190/app/DreamSeries_sign.apk', '100', 'com.auditv.seriestest', '1', 'http://upgrade.brauditv.com:9190/app/img/dream_series1.png', null);

-- ----------------------------
-- Table structure for apptype
-- ----------------------------
DROP TABLE IF EXISTS `apptype`;
CREATE TABLE `apptype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT '0' COMMENT '-1:launcher, 0:必装应用, >0:排序',
  `enable` tinyint(1) DEFAULT '0',
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  `boxid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apptype
-- ----------------------------

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '分类名称',
  `imageurl` text COMMENT '图片地址，带有http的完整地址',
  `filepath` text COMMENT '分类存储的文件夹',
  `enable` tinyint(1) DEFAULT '1' COMMENT '分类是否可用',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '最后编辑时间',
  `type` int(11) DEFAULT '1' COMMENT '1:vod,2:美剧,3:18+,4:动漫,5:回看',
  `pushstate` int(11) DEFAULT '0' COMMENT '轮播状态',
  `mediaurl` varchar(255) DEFAULT '(NULL)' COMMENT '轮播输出地址',
  `p2purl` varchar(255) DEFAULT '(NULL)' COMMENT '轮播原力p2p地址',
  `port` int(11) DEFAULT NULL COMMENT '轮播输出端口',
  `pasepage` int(11) DEFAULT '20' COMMENT '每日爬取页数',
  `imgpath` text COMMENT '图片存储文件夹',
  `subtitlepath` text COMMENT '字幕存储文件夹',
  `passwd` varchar(11) DEFAULT '(NULL)' COMMENT '浏览当前分类需要的密码',
  `sequence` int(11) DEFAULT NULL COMMENT '排序序号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', 'Lançamentos', null, '/home/data/vod/video/', '1', '2017-06-22 15:37:48', '2019-06-13 04:01:50', '1', '0', null, null, null, '10', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '100');
INSERT INTO `category` VALUES ('2', 'Ação', null, '/home/data/vod/video/', '1', '2017-06-22 15:37:48', '2019-06-13 04:01:49', '1', '0', null, null, null, '10', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '102');
INSERT INTO `category` VALUES ('3', 'Animação', null, '/home/data/vod/video/', '1', '2017-06-22 15:37:48', '2019-06-13 04:01:49', '1', '0', null, null, null, '10', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '103');
INSERT INTO `category` VALUES ('4', 'Aventura', null, '/home/data/vod/video/', '1', '2017-06-22 15:37:48', '2019-06-13 04:01:49', '1', '0', null, null, null, '10', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '104');
INSERT INTO `category` VALUES ('5', 'Biografia', null, '/home/data/vod/video/', '1', '2017-06-22 15:37:48', '2019-06-13 04:01:49', '1', '0', null, null, null, '10', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '105');
INSERT INTO `category` VALUES ('6', 'Comédia', null, '/home/data/vod/video/', '1', '2017-06-22 15:37:48', '2019-06-13 04:01:49', '1', '0', null, null, null, '10', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '106');
INSERT INTO `category` VALUES ('7', 'Comédia Romântica', null, '/home/data/vod/video/', '1', '2017-06-22 15:37:48', '2019-06-13 04:01:49', '1', '0', null, null, null, '10', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '107');
INSERT INTO `category` VALUES ('8', 'Drama', null, '/home/data/vod/video/', '1', '2017-06-22 15:37:48', '2019-06-13 04:01:49', '1', '0', null, null, null, '10', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '108');
INSERT INTO `category` VALUES ('9', 'Ficção', null, '/home/data/vod/video/', '1', '2017-06-22 15:37:48', '2019-06-13 04:01:49', '1', '0', null, null, null, '10', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '109');
INSERT INTO `category` VALUES ('10', 'Guerra', null, '/home/data/vod/video/', '1', '2017-06-22 15:37:48', '2019-06-13 04:01:49', '1', '0', null, null, null, '10', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '110');
INSERT INTO `category` VALUES ('11', 'Musical', null, '/home/data/vod/video/', '1', '2017-06-22 15:37:48', '2019-06-13 04:01:49', '1', '0', null, null, null, '10', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '111');
INSERT INTO `category` VALUES ('12', 'Nacional', null, '/home/data/vod/video/', '1', '2017-06-22 15:37:48', '2019-06-13 04:01:49', '1', '0', null, null, null, '10', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '112');
INSERT INTO `category` VALUES ('13', 'Crime', null, '/home/data/vod/video/', '1', '2017-06-22 15:37:48', '2018-09-14 00:00:08', '1', '0', null, null, null, '10', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '113');
INSERT INTO `category` VALUES ('14', 'Romance', null, '/home/data/vod/video/', '1', '2017-06-22 15:37:48', '2019-06-13 04:01:49', '1', '0', null, null, null, '10', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '114');
INSERT INTO `category` VALUES ('15', 'Suspense', null, '/home/data/vod/video/', '1', '2017-06-22 15:37:48', '2019-06-13 04:01:49', '1', '0', null, null, null, '10', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '115');
INSERT INTO `category` VALUES ('16', 'Terror', null, '/home/data/vod/video/', '1', '2017-06-22 15:37:48', '2019-06-13 04:01:50', '1', '0', null, null, null, '10', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '116');
INSERT INTO `category` VALUES ('17', 'Últimos Adicionados', null, '/home/data/vod/video/', '1', '2017-06-22 15:37:48', '2019-06-13 04:01:50', '1', '0', null, null, null, '10', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '99');
INSERT INTO `category` VALUES ('18', 'Corrida', null, '/home/data/vod/video/', '0', '2017-09-18 15:40:47', '2017-10-11 11:00:00', '1', '0', null, null, null, '10', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '118');
INSERT INTO `category` VALUES ('19', 'Crime', null, '/home/data/vod/video/', '0', '2017-09-18 15:40:47', '2017-10-11 11:00:00', '1', '0', null, null, null, '10', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '119');
INSERT INTO `category` VALUES ('20', 'Documentário', null, '/home/data/vod/video/', '0', '2017-09-18 15:40:47', '2017-10-11 11:00:01', '1', '0', null, null, null, '10', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '120');
INSERT INTO `category` VALUES ('21', 'Faroeste1', null, '/home/data/vod/video/', '0', '2017-09-18 15:40:47', '2017-10-11 11:00:01', '1', '0', null, null, null, '10', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '121');
INSERT INTO `category` VALUES ('22', 'Ficção Científica', null, '/home/data/vod/video/', '0', '2017-09-18 15:40:47', '2017-10-11 11:00:01', '1', '0', null, null, null, '10', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '122');
INSERT INTO `category` VALUES ('23', 'Infantil', null, '/home/data/vod/video/', '0', '2017-09-18 15:40:47', '2018-09-18 09:06:47', '1', '0', null, null, null, '10', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '123');
INSERT INTO `category` VALUES ('24', 'TODO', null, '/home/data/series/video/', '1', '2017-06-23 16:01:19', '2018-03-20 08:04:22', '2', '0', null, null, null, '1', '/home/data/series/image/', '/home/data/series/subtitle/', null, '201');
INSERT INTO `category` VALUES ('25', 'TODO', null, '/home/data/animes/video/', '1', '2018-04-07 20:29:34', '2018-04-06 22:40:29', '4', '0', null, null, null, '1', '/home/data/animes/image/', '/home/data/animes/subtitle/', null, '401');
INSERT INTO `category` VALUES ('26', 'IDADE -6', null, '/home/data/animes/video/', '1', '2018-04-19 20:40:30', '2018-04-19 20:38:25', '4', '0', null, null, null, '1', '/home/data/animes/image/', '/home/data/animes/subtitle/', null, '402');
INSERT INTO `category` VALUES ('27', 'IDADE 14+', null, '/home/data/animes/video/', '1', '2018-04-19 20:40:32', '2018-04-19 20:39:52', '4', '0', null, null, null, '1', '/home/data/animes/image/', '/home/data/animes/subtitle/', null, '403');
INSERT INTO `category` VALUES ('47', 'Telecine_Pipoca_FHD', null, '/home/data/playback/video/', '1', '2018-07-13 09:14:59', '2018-07-13 09:14:59', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '542');
INSERT INTO `category` VALUES ('48', 'Cinemax_FHD', null, '/home/data/playback/video/', '1', '2018-07-14 00:36:45', '2018-07-14 00:36:45', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '507');
INSERT INTO `category` VALUES ('49', 'FoxSports_FHD', null, '/home/data/playback/video/', '1', '2018-07-14 00:39:01', '2018-07-14 00:39:01', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '519');
INSERT INTO `category` VALUES ('50', 'FoxSports_2_FHD', null, '/home/data/playback/video/', '1', '2018-07-14 00:42:08', '2018-07-14 00:42:08', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '518');
INSERT INTO `category` VALUES ('51', 'Band_SP_FHD', null, '/home/data/playback/video/', '1', '2018-07-14 00:44:07', '2018-07-14 00:44:07', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '505');
INSERT INTO `category` VALUES ('52', 'Combate_FHD', null, '/home/data/playback/video/', '1', '2018-07-14 00:58:16', '2018-07-14 00:58:16', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '508');
INSERT INTO `category` VALUES ('53', 'Fox_FHD', null, '/home/data/playback/video/', '1', '2018-07-14 01:00:36', '2018-07-14 01:00:36', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '520');
INSERT INTO `category` VALUES ('55', 'HBO_2_FHD', null, '/home/data/playback/video/', '1', '2018-07-14 01:05:27', '2018-07-14 01:05:27', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '525');
INSERT INTO `category` VALUES ('56', 'HBO_FHD', null, '/home/data/playback/video/', '1', '2018-07-14 01:06:58', '2018-07-14 01:06:58', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '526');
INSERT INTO `category` VALUES ('57', 'Animal_Planet_FHD', null, '/home/data/playback/video/', '1', '2018-07-14 01:08:03', '2018-07-14 01:08:03', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '502');
INSERT INTO `category` VALUES ('58', 'Discovery_World_FHD', null, '/home/data/playback/video/', '1', '2018-07-14 01:09:36', '2018-07-14 01:09:36', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '516');
INSERT INTO `category` VALUES ('60', 'HBO_Plus_FHD', null, '/home/data/playback/video/', '1', '2018-07-14 01:21:38', '2018-07-14 01:21:38', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '527');
INSERT INTO `category` VALUES ('61', 'HBO_Signature_FHD', null, '/home/data/playback/video/', '1', '2018-07-14 01:22:56', '2018-07-14 01:22:56', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '528');
INSERT INTO `category` VALUES ('62', 'Max_UP_FHD', null, '/home/data/playback/video/', '0', '2018-07-14 01:26:34', '2018-07-14 01:26:34', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '531');
INSERT INTO `category` VALUES ('63', 'Cartoon_Network_FHD', null, '/home/data/playback/video/', '0', '2018-07-14 01:35:58', '2018-07-14 01:35:58', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '506');
INSERT INTO `category` VALUES ('65', 'Mega_Pix_FHD', null, '/home/data/playback/video/', '1', '2018-07-14 01:41:49', '2018-07-14 01:41:49', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '532');
INSERT INTO `category` VALUES ('66', 'Discovery_Channel_FHD', null, '/home/data/playback/video/', '1', '2018-07-14 01:44:17', '2018-07-14 01:44:17', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '509');
INSERT INTO `category` VALUES ('67', 'Max_FHD', null, '/home/data/playback/video/', '1', '2018-07-14 01:47:14', '2018-07-14 01:47:14', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '530');
INSERT INTO `category` VALUES ('68', 'Foot Neuropathy Treatment', null, '/home/data/vod/video/', '0', '2018-07-29 00:00:03', '2018-07-30 00:00:03', '1', '0', null, null, null, '20', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '124');
INSERT INTO `category` VALUES ('69', 'America Online Internet', null, '/home/data/vod/video/', '0', '2018-07-29 00:00:04', '2018-07-30 00:00:03', '1', '0', null, null, null, '20', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '125');
INSERT INTO `category` VALUES ('70', 'AOL Internet', null, '/home/data/vod/video/', '0', '2018-07-29 00:00:04', '2018-07-30 00:00:03', '1', '0', null, null, null, '20', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '126');
INSERT INTO `category` VALUES ('71', 'Free Aol Chat Rooms', null, '/home/data/vod/video/', '0', '2018-07-29 00:00:04', '2018-07-30 00:00:03', '1', '0', null, null, null, '20', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '127');
INSERT INTO `category` VALUES ('72', 'Nail Fungus Medication', null, '/home/data/vod/video/', '0', '2018-07-29 00:00:04', '2018-07-29 00:00:04', '1', '0', null, null, null, '20', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '128');
INSERT INTO `category` VALUES ('73', 'AOL Music Videos', null, '/home/data/vod/video/', '0', '2018-07-29 00:00:04', '2018-07-30 00:00:03', '1', '0', null, null, null, '20', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '129');
INSERT INTO `category` VALUES ('74', 'AOL Journals', null, '/home/data/vod/video/', '0', '2018-07-29 00:00:04', '2018-07-29 00:00:04', '1', '0', null, null, null, '20', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '130');
INSERT INTO `category` VALUES ('75', 'Foot Care Products', null, '/home/data/vod/video/', '0', '2018-07-30 00:00:03', '2018-07-30 00:00:03', '1', '0', null, null, null, '20', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '131');
INSERT INTO `category` VALUES ('76', 'Foot Care Tips', null, '/home/data/vod/video/', '0', '2018-07-30 00:00:03', '2018-07-30 00:00:03', '1', '0', null, null, null, '20', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '132');
INSERT INTO `category` VALUES ('77', 'Watch Movies Online', null, '/home/data/vod/video/', '0', '2018-07-31 00:00:06', '2018-07-31 00:00:06', '1', '0', null, null, null, '20', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '133');
INSERT INTO `category` VALUES ('78', 'Movie Trailers', null, '/home/data/vod/video/', '0', '2018-07-31 00:00:06', '2018-07-31 00:00:06', '1', '0', null, null, null, '20', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '134');
INSERT INTO `category` VALUES ('79', 'HD Trailers', null, '/home/data/vod/video/', '0', '2018-07-31 00:00:06', '2018-07-31 00:00:06', '1', '0', null, null, null, '20', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '135');
INSERT INTO `category` VALUES ('80', 'Movie Subtitles', null, '/home/data/vod/video/', '0', '2018-07-31 00:00:06', '2018-07-31 00:00:06', '1', '0', null, null, null, '20', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '136');
INSERT INTO `category` VALUES ('81', 'Movie Rentals', null, '/home/data/vod/video/', '0', '2018-07-31 00:00:06', '2018-07-31 00:00:06', '1', '0', null, null, null, '20', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '137');
INSERT INTO `category` VALUES ('82', 'Upcoming Movies', null, '/home/data/vod/video/', '0', '2018-07-31 00:00:06', '2018-07-31 00:00:06', '1', '0', null, null, null, '20', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '138');
INSERT INTO `category` VALUES ('83', 'Latest Movies', null, '/home/data/vod/video/', '0', '2018-07-31 00:00:06', '2018-07-31 00:00:06', '1', '0', null, null, null, '20', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '139');
INSERT INTO `category` VALUES ('84', 'Discovery_Theater_FHD', null, '/home/data/playback/video/', '1', '2018-08-06 06:51:55', '2018-08-06 06:51:55', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '514');
INSERT INTO `category` VALUES ('85', 'Legenda', '', '/home/data/vod/video/', '1', '2018-09-06 01:31:46', '2018-09-06 01:31:46', '1', '0', '', '', '0', '0', '/home/data/vod/image/', '/home/data/playback/subtitle/', '', '101');
INSERT INTO `category` VALUES ('86', 'Faroeste', '', '/home/data/vod/video/', '0', '2018-09-06 01:32:30', '2018-09-06 01:32:30', '1', '0', '', '', '0', '0', '/home/data/vod/image/', '/home/data/playback/subtitle/', '', '145');
INSERT INTO `category` VALUES ('87', 'NatGeo_Kids_FHD', null, '/home/data/playback/video/', '0', '2018-09-06 02:51:25', '2018-09-06 02:51:25', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '533');
INSERT INTO `category` VALUES ('88', 'Discovery_Civilization_FHD', null, '/home/data/playback/video/', '1', '2018-09-06 03:29:11', '2018-09-06 03:29:11', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '510');
INSERT INTO `category` VALUES ('89', 'Discovery_H_H_FHD', null, '/home/data/playback/video/', '1', '2018-09-06 03:30:52', '2018-09-06 03:30:52', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '511');
INSERT INTO `category` VALUES ('90', 'Discovery_Kids_FHD', null, '/home/data/playback/video/', '0', '2018-09-06 03:31:21', '2018-09-06 03:31:21', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '512');
INSERT INTO `category` VALUES ('91', 'Discovery_Science_FHD', null, '/home/data/playback/video/', '1', '2018-09-06 03:32:26', '2018-09-06 03:32:26', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '513');
INSERT INTO `category` VALUES ('92', 'Discovery_Turbo_FHD', null, '/home/data/playback/video/', '1', '2018-09-06 03:33:40', '2018-09-06 03:33:40', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '515');
INSERT INTO `category` VALUES ('93', 'Telecine_Action_FHD', null, '/home/data/playback/video/', '1', '2018-09-06 03:34:01', '2018-09-06 03:34:01', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '540');
INSERT INTO `category` VALUES ('94', 'Telecine_Fun_FHD', null, '/home/data/playback/video/', '1', '2018-09-06 03:34:21', '2018-09-06 03:34:21', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '541');
INSERT INTO `category` VALUES ('95', 'Telecine_Premium_FHD', null, '/home/data/playback/video/', '1', '2018-09-06 03:34:50', '2018-09-06 03:34:50', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '543');
INSERT INTO `category` VALUES ('96', 'Telecine_Touch_FHD', null, '/home/data/playback/video/', '1', '2018-09-06 03:35:17', '2018-09-06 03:35:17', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '544');
INSERT INTO `category` VALUES ('97', 'FOX_PREMIUM1_FHD', null, '/home/data/playback/video/', '1', '2018-09-06 03:35:56', '2018-09-06 03:35:56', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '521');
INSERT INTO `category` VALUES ('98', 'FOX_PREMIUM2_FHD', null, '/home/data/playback/video/', '1', '2018-09-06 03:36:48', '2018-09-06 03:36:48', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '522');
INSERT INTO `category` VALUES ('99', 'Disney_Channel_FHD', null, '/home/data/playback/video/', '0', '2018-09-06 03:37:25', '2018-09-06 03:37:25', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '517');
INSERT INTO `category` VALUES ('100', 'Sportv_FHD', null, '/home/data/playback/video/', '1', '2018-09-06 03:37:52', '2018-09-06 03:37:52', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '539');
INSERT INTO `category` VALUES ('103', 'AMC_FHD', null, '/home/data/playback/video/', '1', '2018-09-06 03:39:19', '2018-09-06 03:39:19', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '501');
INSERT INTO `category` VALUES ('104', 'AXN_FHD', null, '/home/data/playback/video/', '1', '2018-09-06 03:39:33', '2018-09-06 03:39:33', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '503');
INSERT INTO `category` VALUES ('105', 'Sony_FHD', null, '/home/data/playback/video/', '1', '2018-09-06 03:39:51', '2018-09-06 03:39:51', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '538');
INSERT INTO `category` VALUES ('106', 'Warner_FHD', null, '/home/data/playback/video/', '1', '2018-09-06 03:40:13', '2018-09-06 03:40:13', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '546');
INSERT INTO `category` VALUES ('108', 'A_E_FHD', null, '/home/data/playback/video/', '1', '2018-09-08 15:42:38', '2018-09-08 15:42:38', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '504');
INSERT INTO `category` VALUES ('117', 'Globo_News_FHD', null, '/home/data/playback/video/', '1', '2018-09-08 16:15:59', '2018-09-08 16:15:59', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '523');
INSERT INTO `category` VALUES ('118', 'Globo_SP_FHD', null, '/home/data/playback/video/', '1', '2018-09-11 10:47:27', '2018-09-11 10:47:27', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '524');
INSERT INTO `category` VALUES ('119', 'TNT_FHD', null, '/home/data/playback/video/', '1', '2018-09-11 10:53:10', '2018-09-11 10:53:10', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '545');
INSERT INTO `category` VALUES ('120', 'History_FHD', null, '/home/data/playback/video/', '1', '2018-09-11 17:34:13', '2018-09-11 17:34:13', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '529');
INSERT INTO `category` VALUES ('121', 'SBT_FHD', null, '/home/data/playback/video/', '1', '2018-09-12 11:38:21', '2018-09-12 11:38:21', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '537');
INSERT INTO `category` VALUES ('122', 'RECORDTV_SP_FHD', null, '/home/data/playback/video/', '1', '2018-09-12 11:42:54', '2018-09-12 11:42:54', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '536');
INSERT INTO `category` VALUES ('124', 'Clássicos', null, '/home/data/vod/video/', '0', '2018-09-12 04:11:01', '2018-09-18 09:06:46', '1', '0', null, null, null, '20', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '146');
INSERT INTO `category` VALUES ('125', 'Filmes', null, '/home/data/vod/video/', '0', '2018-09-12 04:11:01', '2018-09-18 09:06:46', '1', '0', null, null, null, '20', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '147');
INSERT INTO `category` VALUES ('126', 'Documentários', null, '/home/data/vod/video/', '0', '2018-09-12 04:11:01', '2018-09-18 09:06:46', '1', '0', null, null, null, '20', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '148');
INSERT INTO `category` VALUES ('127', 'Filmes Nacional', null, '/home/data/vod/video/', '0', '2018-09-12 04:11:01', '2018-09-18 09:06:46', '1', '0', null, null, null, '20', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '149');
INSERT INTO `category` VALUES ('128', 'Filmografia', null, '/home/data/vod/video/', '0', '2018-09-12 04:11:01', '2018-09-18 09:06:46', '1', '0', null, null, null, '20', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '150');
INSERT INTO `category` VALUES ('129', 'Heróis', null, '/home/data/vod/video/', '0', '2018-09-12 04:11:02', '2018-09-18 09:06:47', '1', '0', null, null, null, '20', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '151');
INSERT INTO `category` VALUES ('135', 'Off_FHD', null, '/home/data/playback/video/', '1', '2018-10-05 20:38:12', '2018-10-05 20:38:12', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '535');
INSERT INTO `category` VALUES ('136', 'Nat_Geo_FHD', null, '/home/data/playback/video/', '1', '2018-10-12 21:24:46', '2018-10-12 21:24:46', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '534');
INSERT INTO `category` VALUES ('137', 'Música', null, '/home/data/vod/video/', '1', '2018-12-06 22:47:35', '2018-12-06 22:47:35', '1', '0', null, null, '0', '0', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '152');
INSERT INTO `category` VALUES ('138', 'Fantasia', null, '/home/data/vod/video/', '1', '2018-12-06 22:53:10', '2018-12-06 22:53:10', '1', '0', null, null, '0', '0', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '153');
INSERT INTO `category` VALUES ('139', 'lutas', null, '/home/data/vod/video/', '1', '2018-12-07 21:18:36', '2018-12-07 21:18:36', '1', '0', null, null, '0', '0', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '154');
INSERT INTO `category` VALUES ('140', 'Sem categoria', null, '/home/data/vod/video/', '1', '2018-12-08 01:02:24', '2018-12-08 01:02:24', '1', '0', null, null, '0', '0', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '155');
INSERT INTO `category` VALUES ('141', 'Drama', null, null, '1', '2019-01-21 07:46:33', '2019-01-21 07:46:33', '2', '0', '(NULL)', '(NULL)', null, '20', null, null, '(NULL)', '205');
INSERT INTO `category` VALUES ('142', 'Romance', null, null, '1', '2019-01-21 07:46:33', '2019-01-21 07:46:33', '2', '0', '(NULL)', '(NULL)', null, '20', null, null, '(NULL)', '206');
INSERT INTO `category` VALUES ('143', 'Action', null, null, '1', '2019-01-21 07:46:33', '2019-01-21 07:46:33', '2', '0', '(NULL)', '(NULL)', null, '20', null, null, '(NULL)', '207');
INSERT INTO `category` VALUES ('144', 'Comedy', null, null, '1', '2019-01-21 07:46:33', '2019-01-21 07:46:33', '2', '0', '(NULL)', '(NULL)', null, '20', null, null, '(NULL)', '208');
INSERT INTO `category` VALUES ('145', 'Adventure', null, null, '1', '2019-01-21 07:46:33', '2019-01-21 07:46:33', '2', '0', '(NULL)', '(NULL)', null, '20', null, null, '(NULL)', '209');
INSERT INTO `category` VALUES ('146', 'Family', null, null, '1', '2019-01-21 07:46:33', '2019-01-21 07:46:33', '2', '0', '(NULL)', '(NULL)', null, '20', null, null, '(NULL)', '210');
INSERT INTO `category` VALUES ('147', 'Crime', null, null, '1', '2019-01-21 07:46:33', '2019-01-21 07:46:33', '2', '0', '(NULL)', '(NULL)', null, '20', null, null, '(NULL)', '211');
INSERT INTO `category` VALUES ('148', 'Fantasy', null, null, '1', '2019-01-21 07:46:33', '2019-01-21 07:46:33', '2', '0', '(NULL)', '(NULL)', null, '20', null, null, '(NULL)', '212');
INSERT INTO `category` VALUES ('149', 'Horror', null, null, '1', '2019-01-21 07:46:33', '2019-01-21 07:46:33', '2', '0', '(NULL)', '(NULL)', null, '20', null, null, '(NULL)', '213');
INSERT INTO `category` VALUES ('150', 'Thriller', null, null, '1', '2019-01-21 07:46:33', '2019-01-21 07:46:33', '2', '0', '(NULL)', '(NULL)', null, '20', null, null, '(NULL)', '214');
INSERT INTO `category` VALUES ('151', 'Documentary', null, null, '1', '2019-01-21 07:46:33', '2019-01-21 07:46:33', '2', '0', '(NULL)', '(NULL)', null, '20', null, null, '(NULL)', '215');
INSERT INTO `category` VALUES ('152', 'Sci-Fi', null, null, '1', '2019-01-21 07:46:33', '2019-01-21 07:46:33', '2', '0', '(NULL)', '(NULL)', null, '20', null, null, '(NULL)', '216');
INSERT INTO `category` VALUES ('153', 'Mystery', null, null, '1', '2019-01-21 07:46:33', '2019-01-21 07:46:33', '2', '0', '(NULL)', '(NULL)', null, '20', null, null, '(NULL)', '217');
INSERT INTO `category` VALUES ('154', 'Biography', null, null, '1', '2019-01-21 07:46:33', '2019-01-21 07:46:33', '2', '0', '(NULL)', '(NULL)', null, '20', null, null, '(NULL)', '218');
INSERT INTO `category` VALUES ('155', 'History', null, null, '1', '2019-01-21 07:46:33', '2019-01-21 07:46:33', '2', '0', '(NULL)', '(NULL)', null, '20', null, null, '(NULL)', '219');
INSERT INTO `category` VALUES ('156', 'Animation', null, null, '1', '2019-01-21 07:46:33', '2019-01-21 07:46:33', '2', '0', '(NULL)', '(NULL)', null, '20', null, null, '(NULL)', '220');
INSERT INTO `category` VALUES ('157', 'Western', null, null, '1', '2019-01-21 07:46:33', '2019-01-21 07:46:33', '2', '0', '(NULL)', '(NULL)', null, '20', null, null, '(NULL)', '221');
INSERT INTO `category` VALUES ('158', 'Sport', null, null, '1', '2019-01-21 07:46:33', '2019-01-21 07:46:33', '2', '0', '(NULL)', '(NULL)', null, '20', null, null, '(NULL)', '222');
INSERT INTO `category` VALUES ('159', 'Reality-TV', null, null, '1', '2019-01-21 07:46:33', '2019-01-21 07:46:33', '2', '0', '(NULL)', '(NULL)', null, '20', null, null, '(NULL)', '223');
INSERT INTO `category` VALUES ('160', 'War', null, null, '1', '2019-01-21 07:46:33', '2019-01-21 07:46:33', '2', '0', '(NULL)', '(NULL)', null, '20', null, null, '(NULL)', '224');
INSERT INTO `category` VALUES ('161', 'Music', null, null, '1', '2019-01-21 07:46:33', '2019-01-21 07:46:33', '2', '0', '(NULL)', '(NULL)', null, '20', null, null, '(NULL)', '225');
INSERT INTO `category` VALUES ('162', 'Game-Show', null, null, '1', '2019-01-21 07:46:33', '2019-01-21 07:46:33', '2', '0', '(NULL)', '(NULL)', null, '20', null, null, '(NULL)', '226');
INSERT INTO `category` VALUES ('163', 'Short', null, null, '1', '2019-01-21 07:46:33', '2019-01-21 07:46:33', '2', '0', '(NULL)', '(NULL)', null, '20', null, null, '(NULL)', '227');
INSERT INTO `category` VALUES ('171', 'Documentário', null, '/home/data/vod/video/', '1', '2019-03-14 09:46:01', '2019-03-14 09:46:01', '1', '0', null, null, '0', '0', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '156');
INSERT INTO `category` VALUES ('173', 'História', null, '/home/data/vod/video/', '1', '2019-03-14 13:55:45', '2019-03-14 13:55:45', '1', '0', null, null, '0', '0', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '157');
INSERT INTO `category` VALUES ('175', 'Ficção Científica', null, '/home/data/vod/video/', '1', '2019-03-14 14:17:17', '2019-03-14 14:17:17', '1', '0', null, null, '0', '0', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '158');
INSERT INTO `category` VALUES ('177', 'Thriller', null, '/home/data/vod/video/', '1', '2019-03-14 14:17:17', '2019-03-14 14:17:17', '1', '0', null, null, '0', '0', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '159');
INSERT INTO `category` VALUES ('179', 'Mistério', null, '/home/data/vod/video/', '1', '2019-03-14 22:00:35', '2019-03-14 22:00:35', '1', '0', null, null, '0', '0', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '160');
INSERT INTO `category` VALUES ('181', 'Policial', null, '/home/data/vod/video/', '1', '2019-03-14 22:21:44', '2019-06-13 04:01:49', '1', '0', null, null, '0', '0', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '161');
INSERT INTO `category` VALUES ('183', 'Família', null, '/home/data/vod/video/', '1', '2019-03-15 03:21:24', '2019-03-15 03:21:24', '1', '0', null, null, '0', '0', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '162');
INSERT INTO `category` VALUES ('185', 'Histórico', null, '/home/data/vod/video/', '1', '2019-03-21 17:20:03', '2019-03-21 17:20:03', '1', '0', null, null, '0', '0', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '163');
INSERT INTO `category` VALUES ('187', 'Comédia dramática', null, '/home/data/vod/video/', '1', '2019-03-22 00:51:44', '2019-03-22 00:51:44', '1', '0', null, null, '0', '0', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '164');
INSERT INTO `category` VALUES ('189', 'Show', null, '/home/data/vod/video/', '1', '2019-03-22 05:51:30', '2019-03-22 05:51:30', '1', '0', null, null, '0', '0', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '165');
INSERT INTO `category` VALUES ('191', 'Faroeste', null, '/home/data/vod/video/', '1', '2019-03-22 08:24:47', '2019-03-22 08:24:47', '1', '0', null, null, '0', '0', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '166');
INSERT INTO `category` VALUES ('193', 'Esporte', null, '/home/data/vod/video/', '1', '2019-03-23 06:49:44', '2019-03-23 06:49:44', '1', '0', null, null, '0', '0', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '167');
INSERT INTO `category` VALUES ('227', 'Viva_FHD', null, '/home/data/playback/video/', '1', '2019-04-08 16:05:49', '2019-04-08 16:05:49', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '547');
INSERT INTO `category` VALUES ('229', 'Universal_Channel_FHD', null, '/home/data/playback/video/', '1', '2019-04-08 16:06:51', '2019-04-08 16:06:51', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '548');
INSERT INTO `category` VALUES ('231', 'ESPN_Brasil_FHD', null, '/home/data/playback/video/', '1', '2019-04-08 16:07:53', '2019-04-08 16:07:53', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '549');
INSERT INTO `category` VALUES ('233', 'Band_Sports_FHD', null, '/home/data/playback/video/', '1', '2019-04-08 16:08:18', '2019-04-08 16:08:18', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '550');
INSERT INTO `category` VALUES ('235', 'Space_FHD', null, '/home/data/playback/video/', '1', '2019-04-08 16:08:36', '2019-04-08 16:08:36', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '551');
INSERT INTO `category` VALUES ('237', 'Comedy_Central_FHD', null, '/home/data/playback/video/', '1', '2019-04-09 18:38:25', '2019-04-09 18:38:25', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '552');
INSERT INTO `category` VALUES ('239', 'Bis_FHD', null, '/home/data/playback/video/', '1', '2019-04-09 18:38:44', '2019-04-09 18:38:44', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, '553');
INSERT INTO `category` VALUES ('241', 'Sportv_2_FHD', null, '/home/data/playback/video/', '1', '2019-05-26 10:02:29', '2019-05-26 10:02:29', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, null);
INSERT INTO `category` VALUES ('243', 'Sportv_3_FHD', null, '/home/data/playback/video/', '1', '2019-05-26 10:03:54', '2019-05-26 10:03:54', '5', '0', null, null, '0', '1', '/home/data/playback/image/', '/home/data/playback/subtitle/', null, null);
INSERT INTO `category` VALUES ('245', 'Ação Comédia Policial', null, '/home/data/vod/video/', '1', '2019-06-06 14:02:11', '2019-06-06 14:02:11', '1', '0', null, null, '0', '0', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '168');
INSERT INTO `category` VALUES ('247', 'Ação Aventura Ficção', null, '/home/data/vod/video/', '1', '2019-06-06 14:39:41', '2019-06-06 14:39:41', '1', '0', null, null, '0', '0', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '169');
INSERT INTO `category` VALUES ('249', 'Ação Ficção Suspense', null, '/home/data/vod/video/', '1', '2019-06-06 15:02:15', '2019-06-06 15:02:15', '1', '0', null, null, '0', '0', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '170');
INSERT INTO `category` VALUES ('251', '动作片', null, '/home/data/vod/video/', '1', '2019-06-13 19:11:59', '2019-06-13 19:11:59', '1', '0', null, null, '0', '0', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '171');
INSERT INTO `category` VALUES ('252', '科幻片', null, '/home/data/vod/video/', '1', '2019-06-14 13:35:52', '2019-06-14 13:35:52', '1', '0', null, null, '0', '0', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '172');
INSERT INTO `category` VALUES ('253', '爱情片', null, '/home/data/vod/video/', '1', '2019-06-14 13:36:30', '2019-06-14 13:36:30', '1', '0', null, null, '0', '0', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '173');
INSERT INTO `category` VALUES ('254', '剧情片', null, '/home/data/vod/video/', '1', '2019-06-14 13:39:33', '2019-06-14 13:39:33', '1', '0', null, null, '0', '0', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '174');
INSERT INTO `category` VALUES ('255', '恐怖片', null, '/home/data/vod/video/', '1', '2019-06-14 13:42:11', '2019-06-14 13:42:11', '1', '0', null, null, '0', '0', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '175');
INSERT INTO `category` VALUES ('256', '欧美剧', null, '/home/data/vod/video/', '1', '2019-06-14 14:28:10', '2019-06-14 14:28:10', '1', '0', null, null, '0', '0', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '176');
INSERT INTO `category` VALUES ('257', '国产剧', null, '/home/data/vod/video/', '1', '2019-06-14 14:29:46', '2019-06-14 14:29:46', '1', '0', null, null, '0', '0', '/home/data/vod/image/', '/home/data/vod/subtitle/', null, '177');

-- ----------------------------
-- Table structure for dramainfo
-- ----------------------------
DROP TABLE IF EXISTS `dramainfo`;
CREATE TABLE `dramainfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `imageurl` text,
  `cateid` varchar(100) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `filepath` text,
  `duration` varchar(100) DEFAULT NULL,
  `director` varchar(255) DEFAULT NULL,
  `actors` varchar(255) DEFAULT NULL,
  `rdate` varchar(100) DEFAULT NULL,
  `description` text,
  `country` text COMMENT '国家',
  `basicview` int(11) DEFAULT NULL COMMENT '大众点击量',
  `recommend` int(11) DEFAULT NULL COMMENT '推荐点击量',
  `ratingvalue` varchar(64) DEFAULT NULL COMMENT '影片评分',
  `regionid` varchar(100) DEFAULT NULL COMMENT '多个国家',
  `cateid2` varchar(100) DEFAULT NULL COMMENT '美剧用的分类',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=542791 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dramainfo
-- ----------------------------
INSERT INTO `dramainfo` VALUES ('542763', '忍者神龟：变种时代 ', '0', 'C:\\Users\\Administrator\\Desktop\\vod\\img\\1560423559845.jpg', '251', '2019-06-13 19:11:59', '2019-06-13 19:11:59', '1', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', '12 Minutos', '乔纳森·里贝斯曼', '梅根·福克斯,威尔·阿奈特,威廉·菲德内尔,阿兰·里奇森', '2014', '繁华大都会美国纽约，罪恶首领施莱德率领的大脚帮在城市内为非作歹，甚嚣尘上。安保公司老板埃里克·萨克斯（威廉·菲德内尔 William Fichtner 饰）推出最新安保系统，发誓维护城市的战争。第6频道女记者爱普尔·奥尼尔（梅根·福克斯 Megan Fox 饰）偶然拍到大脚帮被四名奥秘侠客挫败的画面，在第二次遭遇十分事件时，她惊讶地发现四名侠客居然是变异后的巴西龟：拉斐尔、列奥纳多、米可朗基罗、多纳泰罗。忍者神龟的名字勾起了爱普尔儿时的记忆，当年她的父亲与萨克斯正是研讨生物变异实验的同伴。她将这个音讯通知给萨克斯，可是在和忍者神龟及其教员斯普林特会面后，才觉察萨克斯与施莱德是这座城市内的罪恶之源……本片依据同名经典漫画改编。', null, null, null, null, '123', null);
INSERT INTO `dramainfo` VALUES ('542764', '黑衣人：全球追缉 ', '1', 'C:\\Users\\Administrator\\Desktop\\vod\\img\\黑衣人：全球追缉 .jpg', '252', '2019-06-14 13:35:49', '2019-06-14 13:35:49', '1', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', '12 Minutos', 'F·加里·格雷', '克里斯·海姆斯沃斯,泰莎·汤普森,丽贝卡·弗格森,库梅尔·南贾尼,拉菲·斯波,艾玛·汤普森,连姆·尼森,戴维娜·西塔拉姆,纳西尔·贾玛,维克托里娅·菲斯,佩内洛普·卡普迪雅,斯蒂芬·怀特,安纳托·陶布曼,露丝·霍洛克斯,贝恩·科拉科,马西·哈里尔,哈廷·帕特尔,通恰伊·古奈什,艾德里安·阿尔瓦拉多,史蒂芬·萨姆森,曼迪娅·弗罗里,黄渤,伊隆·马斯克', '2019', '全球最具影响力的经典科幻IP《黑衣人》片面晋级！科幻电影之父史蒂文·斯皮尔伯格联手《速度与热情8》导演F·加里·格雷，金牌班底鼎力巨献！英国黑衣人总部王牌探员H（锤哥）与新晋探员M（泰莎·汤普森）在阻止外星团伙入侵的进程中不测根除了隐藏在黑衣人组织中的外敌，成功拯救世界 。 影片中，各种脑洞大开的外星人和推翻想象的高科技装备轮番退场，热血沸腾惊心动魄的举措追车局面层出不穷，完满构建出全新的黑衣人宇宙观。本片将于2019年6月14日内地同步北美上映。', null, null, null, null, '123', null);
INSERT INTO `dramainfo` VALUES ('542765', '黄大仙 ', '1', 'https://www.haiwaiyy.comhttp://img1.doubanio.com/view/photo/l/public/p2159870098.webp', '253', '2019-06-14 13:36:24', '2019-06-14 13:36:24', '1', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', '12 Minutos', '杜岗雨', '林正英,黎燕珊,黄造时', '1992', '由于私自干预了人世之事，黄大仙（林正英 饰）被王母娘娘贬下人世，投胎转世成为了一个叫黄初平的男孩。黄初平是刘家的羊倌，和刘家的侍妾小兰（郁雯 饰）情投意合渐渐走到了一同。不时觊觎小兰美貌的少爷因而经常针对为难黄初平。 　　在观音娘娘（黎燕珊 饰）的指点和协助之下，黄初平末尾了他的漫漫修为之路，一晃眼多年过去，修为大有出息的黄初平决议踏上普度众生的旅途，他和小兰就此别过。一路上，黄初平协助了许许多多受苦难所困扰的伟人们，水灾肆虐，黄初平甚至不惜将自己的血幻化成雨水滋养干枯的大地。最终，黄初平得道成仙前往了仙界。', null, null, null, null, '124', null);
INSERT INTO `dramainfo` VALUES ('542766', '我的一级兄弟 ', '1', 'C:\\Users\\Administrator\\Desktop\\vod\\img\\我的一级兄弟 .jpg', '253', '2019-06-14 13:37:35', '2019-06-14 13:37:35', '1', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', '12 Minutos', '陆相孝', '申河均,李光洙,李絮', '2019', '申河均、李光洙将加盟喜剧温情片[我的一级兄弟]，该片由陆相孝执导，讲述肢体残疾一级的女子(申河均饰)与肉体障碍一级的女子(李光洙饰)相遇后发作的故事。影片方案5月初开拍。', null, null, null, null, '125', null);
INSERT INTO `dramainfo` VALUES ('542767', '翻不去的一页 ', '1', 'C:\\Users\\Administrator\\Desktop\\vod\\img\\翻不去的一页 .jpg', '255', '2019-06-14 13:42:11', '2019-06-14 13:42:11', '1', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', '12 Minutos', 'Adam', '道格·琼斯,米拉·索维诺,瑟达吕斯·布兰', '2019', 'Among countless others, four small-town boys are kidnapped by James Whitley, a deranged, warm-eyed psychopath. His grotesque pursuit to reunite orphaned children with their deceased birth parents is gridlocked when the boys escape and he is arrested. Twenty years later, Whitley flees during a prison fire and decides to see his mission through. Detective Larson, one of Whitley\'s prior victims - and now a cop - is removed from the case due to impartiality leaving his partner and lover, Detective Shotwell to solve the case. Fueled by rage and a chance of redemption, Detective Larson chases the steadfast psychopath on his own, only to fall back into the same trap he once escaped as a child.', null, null, null, null, '123', null);
INSERT INTO `dramainfo` VALUES ('542768', '御龙王妃 ', '1', 'C:\\Users\\Administrator\\Desktop\\vod\\img\\御龙王妃 .jpg', '253', '2019-06-14 13:49:32', '2019-06-14 13:49:32', '1', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', '12 Minutos', '秦榛', '何聪睿,戚蓝尹,张驰', '2019', '寿宴之上，太子派四个女刺客伺机刺杀平亲王，为动摇自己的位置，却不曾想困兽在对战之际发怒，末尾攻击在场宾客。为保太子周全，风善云、风筝、风起不顾风零落支持，与兽人大战，风善云身死，6070w.com其他两人暴露自己。姐妹间因而事发生间隙。为防止平亲王通过清查此案，太子令风零落潜伏于平亲王府。', null, null, null, null, '127', null);
INSERT INTO `dramainfo` VALUES ('542769', '追龙Ⅱ/追龍2：贼王 ', '1', 'C:\\Users\\Administrator\\Desktop\\vod\\img\\追龙追龍2贼王.jpg', '251', '2019-06-14 14:24:36', '2019-06-14 14:24:36', '1', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', '12 Minutos', '王晶', '梁家辉,古天乐,林家栋,邱意浓,叶相明,任达华,杜江,余安安', '2019', '悍匪龙志强，在香港回归前，趁香港英政府不作为，而屡犯巨案，先后绑架富豪利家及雷家之长子，敲诈超越二十亿元，事主怕被报复,交赎款后都不敢报警。中国公安部极为关注，与香港警方合力，派香港警员何天卧底潜入龙志强立功团伙，发现他正筹划绑架澳门富豪贺非凡，最终陆港警察合力勇擒龙志强，救出贺非凡。', null, null, null, null, '124', null);
INSERT INTO `dramainfo` VALUES ('542770', '马卡龙少女 -第20集', '1', 'C:\\Users\\Administrator\\Desktop\\Series\\img\\马卡龙少女.jpg', '257', '2019-06-14 14:29:45', '2019-06-14 14:29:45', '2', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', '12 Minutos', '朱维俐', '陈芋米,吕勇卓,蒲萄,刘名凯', '2019', '网红少女江楚楚，虽然拥有了他人眼中光鲜亮丽的职业——网红，但生活如人饮水，冷暖自知，甚至会由于一件内衣而“破产”。在江楚楚的网红生涯近乎解体的边缘，一条因愤怒而收回的购物差评竟成为了改动她人生轨迹的末尾；总裁骆天一正值新上任阶段，这一条突如其来的购物差评竟成为了他总裁生涯的第一道考验。为化解“职业危机”，骆天一化身呆萌实习生，闯入江楚楚的网红世界，开启一段甜蜜且充溢笑料的浪漫邂逅，演出“大总裁给小网红打工”的神转机……', null, null, null, null, '127', null);
INSERT INTO `dramainfo` VALUES ('542771', '马卡龙少女 -第11集', '1', 'C:\\Users\\Administrator\\Desktop\\Series\\img\\马卡龙少女.jpg', '257', '2019-06-14 14:29:46', '2019-06-14 14:29:46', '2', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', '12 Minutos', '朱维俐', '陈芋米,吕勇卓,蒲萄,刘名凯', '2019', '网红少女江楚楚，虽然拥有了他人眼中光鲜亮丽的职业——网红，但生活如人饮水，冷暖自知，甚至会由于一件内衣而“破产”。在江楚楚的网红生涯近乎解体的边缘，一条因愤怒而收回的购物差评竟成为了改动她人生轨迹的末尾；总裁骆天一正值新上任阶段，这一条突如其来的购物差评竟成为了他总裁生涯的第一道考验。为化解“职业危机”，骆天一化身呆萌实习生，闯入江楚楚的网红世界，开启一段甜蜜且充溢笑料的浪漫邂逅，演出“大总裁给小网红打工”的神转机……', null, null, null, null, '127', null);
INSERT INTO `dramainfo` VALUES ('542772', '马卡龙少女 -第10集', '1', 'C:\\Users\\Administrator\\Desktop\\Series\\img\\马卡龙少女.jpg', '257', '2019-06-14 14:29:46', '2019-06-14 14:29:46', '2', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', '12 Minutos', '朱维俐', '陈芋米,吕勇卓,蒲萄,刘名凯', '2019', '网红少女江楚楚，虽然拥有了他人眼中光鲜亮丽的职业——网红，但生活如人饮水，冷暖自知，甚至会由于一件内衣而“破产”。在江楚楚的网红生涯近乎解体的边缘，一条因愤怒而收回的购物差评竟成为了改动她人生轨迹的末尾；总裁骆天一正值新上任阶段，这一条突如其来的购物差评竟成为了他总裁生涯的第一道考验。为化解“职业危机”，骆天一化身呆萌实习生，闯入江楚楚的网红世界，开启一段甜蜜且充溢笑料的浪漫邂逅，演出“大总裁给小网红打工”的神转机……', null, null, null, null, '127', null);
INSERT INTO `dramainfo` VALUES ('542773', '马卡龙少女 -第02集', '1', 'C:\\Users\\Administrator\\Desktop\\Series\\img\\马卡龙少女.jpg', '257', '2019-06-14 14:29:46', '2019-06-14 14:29:46', '2', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', '12 Minutos', '朱维俐', '陈芋米,吕勇卓,蒲萄,刘名凯', '2019', '网红少女江楚楚，虽然拥有了他人眼中光鲜亮丽的职业——网红，但生活如人饮水，冷暖自知，甚至会由于一件内衣而“破产”。在江楚楚的网红生涯近乎解体的边缘，一条因愤怒而收回的购物差评竟成为了改动她人生轨迹的末尾；总裁骆天一正值新上任阶段，这一条突如其来的购物差评竟成为了他总裁生涯的第一道考验。为化解“职业危机”，骆天一化身呆萌实习生，闯入江楚楚的网红世界，开启一段甜蜜且充溢笑料的浪漫邂逅，演出“大总裁给小网红打工”的神转机……', null, null, null, null, '127', null);
INSERT INTO `dramainfo` VALUES ('542774', '马卡龙少女 -第13集', '1', 'C:\\Users\\Administrator\\Desktop\\Series\\img\\马卡龙少女.jpg', '257', '2019-06-14 14:29:47', '2019-06-14 14:29:47', '2', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', '12 Minutos', '朱维俐', '陈芋米,吕勇卓,蒲萄,刘名凯', '2019', '网红少女江楚楚，虽然拥有了他人眼中光鲜亮丽的职业——网红，但生活如人饮水，冷暖自知，甚至会由于一件内衣而“破产”。在江楚楚的网红生涯近乎解体的边缘，一条因愤怒而收回的购物差评竟成为了改动她人生轨迹的末尾；总裁骆天一正值新上任阶段，这一条突如其来的购物差评竟成为了他总裁生涯的第一道考验。为化解“职业危机”，骆天一化身呆萌实习生，闯入江楚楚的网红世界，开启一段甜蜜且充溢笑料的浪漫邂逅，演出“大总裁给小网红打工”的神转机……', null, null, null, null, '127', null);
INSERT INTO `dramainfo` VALUES ('542775', '马卡龙少女 -第01集', '1', 'C:\\Users\\Administrator\\Desktop\\Series\\img\\马卡龙少女.jpg', '257', '2019-06-14 14:29:47', '2019-06-14 14:29:47', '2', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', '12 Minutos', '朱维俐', '陈芋米,吕勇卓,蒲萄,刘名凯', '2019', '网红少女江楚楚，虽然拥有了他人眼中光鲜亮丽的职业——网红，但生活如人饮水，冷暖自知，甚至会由于一件内衣而“破产”。在江楚楚的网红生涯近乎解体的边缘，一条因愤怒而收回的购物差评竟成为了改动她人生轨迹的末尾；总裁骆天一正值新上任阶段，这一条突如其来的购物差评竟成为了他总裁生涯的第一道考验。为化解“职业危机”，骆天一化身呆萌实习生，闯入江楚楚的网红世界，开启一段甜蜜且充溢笑料的浪漫邂逅，演出“大总裁给小网红打工”的神转机……', null, null, null, null, '127', null);
INSERT INTO `dramainfo` VALUES ('542776', '马卡龙少女 -第12集', '1', 'C:\\Users\\Administrator\\Desktop\\Series\\img\\马卡龙少女.jpg', '257', '2019-06-14 14:29:47', '2019-06-14 14:29:47', '2', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', '12 Minutos', '朱维俐', '陈芋米,吕勇卓,蒲萄,刘名凯', '2019', '网红少女江楚楚，虽然拥有了他人眼中光鲜亮丽的职业——网红，但生活如人饮水，冷暖自知，甚至会由于一件内衣而“破产”。在江楚楚的网红生涯近乎解体的边缘，一条因愤怒而收回的购物差评竟成为了改动她人生轨迹的末尾；总裁骆天一正值新上任阶段，这一条突如其来的购物差评竟成为了他总裁生涯的第一道考验。为化解“职业危机”，骆天一化身呆萌实习生，闯入江楚楚的网红世界，开启一段甜蜜且充溢笑料的浪漫邂逅，演出“大总裁给小网红打工”的神转机……', null, null, null, null, '127', null);
INSERT INTO `dramainfo` VALUES ('542777', '马卡龙少女 -第04集', '1', 'C:\\Users\\Administrator\\Desktop\\Series\\img\\马卡龙少女.jpg', '257', '2019-06-14 14:29:47', '2019-06-14 14:29:47', '2', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', '12 Minutos', '朱维俐', '陈芋米,吕勇卓,蒲萄,刘名凯', '2019', '网红少女江楚楚，虽然拥有了他人眼中光鲜亮丽的职业——网红，但生活如人饮水，冷暖自知，甚至会由于一件内衣而“破产”。在江楚楚的网红生涯近乎解体的边缘，一条因愤怒而收回的购物差评竟成为了改动她人生轨迹的末尾；总裁骆天一正值新上任阶段，这一条突如其来的购物差评竟成为了他总裁生涯的第一道考验。为化解“职业危机”，骆天一化身呆萌实习生，闯入江楚楚的网红世界，开启一段甜蜜且充溢笑料的浪漫邂逅，演出“大总裁给小网红打工”的神转机……', null, null, null, null, '127', null);
INSERT INTO `dramainfo` VALUES ('542778', '马卡龙少女 -第15集', '1', 'C:\\Users\\Administrator\\Desktop\\Series\\img\\马卡龙少女.jpg', '257', '2019-06-14 14:29:48', '2019-06-14 14:29:48', '2', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', '12 Minutos', '朱维俐', '陈芋米,吕勇卓,蒲萄,刘名凯', '2019', '网红少女江楚楚，虽然拥有了他人眼中光鲜亮丽的职业——网红，但生活如人饮水，冷暖自知，甚至会由于一件内衣而“破产”。在江楚楚的网红生涯近乎解体的边缘，一条因愤怒而收回的购物差评竟成为了改动她人生轨迹的末尾；总裁骆天一正值新上任阶段，这一条突如其来的购物差评竟成为了他总裁生涯的第一道考验。为化解“职业危机”，骆天一化身呆萌实习生，闯入江楚楚的网红世界，开启一段甜蜜且充溢笑料的浪漫邂逅，演出“大总裁给小网红打工”的神转机……', null, null, null, null, '127', null);
INSERT INTO `dramainfo` VALUES ('542779', '马卡龙少女 -第03集', '1', 'C:\\Users\\Administrator\\Desktop\\Series\\img\\马卡龙少女.jpg', '257', '2019-06-14 14:29:48', '2019-06-14 14:29:48', '2', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', '12 Minutos', '朱维俐', '陈芋米,吕勇卓,蒲萄,刘名凯', '2019', '网红少女江楚楚，虽然拥有了他人眼中光鲜亮丽的职业——网红，但生活如人饮水，冷暖自知，甚至会由于一件内衣而“破产”。在江楚楚的网红生涯近乎解体的边缘，一条因愤怒而收回的购物差评竟成为了改动她人生轨迹的末尾；总裁骆天一正值新上任阶段，这一条突如其来的购物差评竟成为了他总裁生涯的第一道考验。为化解“职业危机”，骆天一化身呆萌实习生，闯入江楚楚的网红世界，开启一段甜蜜且充溢笑料的浪漫邂逅，演出“大总裁给小网红打工”的神转机……', null, null, null, null, '127', null);
INSERT INTO `dramainfo` VALUES ('542780', '马卡龙少女 -第14集', '1', 'C:\\Users\\Administrator\\Desktop\\Series\\img\\马卡龙少女.jpg', '257', '2019-06-14 14:29:48', '2019-06-14 14:29:48', '2', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', '12 Minutos', '朱维俐', '陈芋米,吕勇卓,蒲萄,刘名凯', '2019', '网红少女江楚楚，虽然拥有了他人眼中光鲜亮丽的职业——网红，但生活如人饮水，冷暖自知，甚至会由于一件内衣而“破产”。在江楚楚的网红生涯近乎解体的边缘，一条因愤怒而收回的购物差评竟成为了改动她人生轨迹的末尾；总裁骆天一正值新上任阶段，这一条突如其来的购物差评竟成为了他总裁生涯的第一道考验。为化解“职业危机”，骆天一化身呆萌实习生，闯入江楚楚的网红世界，开启一段甜蜜且充溢笑料的浪漫邂逅，演出“大总裁给小网红打工”的神转机……', null, null, null, null, '127', null);
INSERT INTO `dramainfo` VALUES ('542781', '马卡龙少女 -第06集', '1', 'C:\\Users\\Administrator\\Desktop\\Series\\img\\马卡龙少女.jpg', '257', '2019-06-14 14:29:48', '2019-06-14 14:29:48', '2', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', '12 Minutos', '朱维俐', '陈芋米,吕勇卓,蒲萄,刘名凯', '2019', '网红少女江楚楚，虽然拥有了他人眼中光鲜亮丽的职业——网红，但生活如人饮水，冷暖自知，甚至会由于一件内衣而“破产”。在江楚楚的网红生涯近乎解体的边缘，一条因愤怒而收回的购物差评竟成为了改动她人生轨迹的末尾；总裁骆天一正值新上任阶段，这一条突如其来的购物差评竟成为了他总裁生涯的第一道考验。为化解“职业危机”，骆天一化身呆萌实习生，闯入江楚楚的网红世界，开启一段甜蜜且充溢笑料的浪漫邂逅，演出“大总裁给小网红打工”的神转机……', null, null, null, null, '127', null);
INSERT INTO `dramainfo` VALUES ('542782', '马卡龙少女 -第17集', '1', 'C:\\Users\\Administrator\\Desktop\\Series\\img\\马卡龙少女.jpg', '257', '2019-06-14 14:29:49', '2019-06-14 14:29:49', '2', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', '12 Minutos', '朱维俐', '陈芋米,吕勇卓,蒲萄,刘名凯', '2019', '网红少女江楚楚，虽然拥有了他人眼中光鲜亮丽的职业——网红，但生活如人饮水，冷暖自知，甚至会由于一件内衣而“破产”。在江楚楚的网红生涯近乎解体的边缘，一条因愤怒而收回的购物差评竟成为了改动她人生轨迹的末尾；总裁骆天一正值新上任阶段，这一条突如其来的购物差评竟成为了他总裁生涯的第一道考验。为化解“职业危机”，骆天一化身呆萌实习生，闯入江楚楚的网红世界，开启一段甜蜜且充溢笑料的浪漫邂逅，演出“大总裁给小网红打工”的神转机……', null, null, null, null, '127', null);
INSERT INTO `dramainfo` VALUES ('542783', '马卡龙少女 -第05集', '1', 'C:\\Users\\Administrator\\Desktop\\Series\\img\\马卡龙少女.jpg', '257', '2019-06-14 14:29:49', '2019-06-14 14:29:49', '2', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', '12 Minutos', '朱维俐', '陈芋米,吕勇卓,蒲萄,刘名凯', '2019', '网红少女江楚楚，虽然拥有了他人眼中光鲜亮丽的职业——网红，但生活如人饮水，冷暖自知，甚至会由于一件内衣而“破产”。在江楚楚的网红生涯近乎解体的边缘，一条因愤怒而收回的购物差评竟成为了改动她人生轨迹的末尾；总裁骆天一正值新上任阶段，这一条突如其来的购物差评竟成为了他总裁生涯的第一道考验。为化解“职业危机”，骆天一化身呆萌实习生，闯入江楚楚的网红世界，开启一段甜蜜且充溢笑料的浪漫邂逅，演出“大总裁给小网红打工”的神转机……', null, null, null, null, '127', null);
INSERT INTO `dramainfo` VALUES ('542784', '马卡龙少女 -第16集', '1', 'C:\\Users\\Administrator\\Desktop\\Series\\img\\马卡龙少女.jpg', '257', '2019-06-14 14:29:49', '2019-06-14 14:29:49', '2', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', '12 Minutos', '朱维俐', '陈芋米,吕勇卓,蒲萄,刘名凯', '2019', '网红少女江楚楚，虽然拥有了他人眼中光鲜亮丽的职业——网红，但生活如人饮水，冷暖自知，甚至会由于一件内衣而“破产”。在江楚楚的网红生涯近乎解体的边缘，一条因愤怒而收回的购物差评竟成为了改动她人生轨迹的末尾；总裁骆天一正值新上任阶段，这一条突如其来的购物差评竟成为了他总裁生涯的第一道考验。为化解“职业危机”，骆天一化身呆萌实习生，闯入江楚楚的网红世界，开启一段甜蜜且充溢笑料的浪漫邂逅，演出“大总裁给小网红打工”的神转机……', null, null, null, null, '127', null);
INSERT INTO `dramainfo` VALUES ('542785', '马卡龙少女 -第08集', '1', 'C:\\Users\\Administrator\\Desktop\\Series\\img\\马卡龙少女.jpg', '257', '2019-06-14 14:29:51', '2019-06-14 14:29:51', '2', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', '12 Minutos', '朱维俐', '陈芋米,吕勇卓,蒲萄,刘名凯', '2019', '网红少女江楚楚，虽然拥有了他人眼中光鲜亮丽的职业——网红，但生活如人饮水，冷暖自知，甚至会由于一件内衣而“破产”。在江楚楚的网红生涯近乎解体的边缘，一条因愤怒而收回的购物差评竟成为了改动她人生轨迹的末尾；总裁骆天一正值新上任阶段，这一条突如其来的购物差评竟成为了他总裁生涯的第一道考验。为化解“职业危机”，骆天一化身呆萌实习生，闯入江楚楚的网红世界，开启一段甜蜜且充溢笑料的浪漫邂逅，演出“大总裁给小网红打工”的神转机……', null, null, null, null, '127', null);
INSERT INTO `dramainfo` VALUES ('542786', '马卡龙少女 -第19集', '1', 'C:\\Users\\Administrator\\Desktop\\Series\\img\\马卡龙少女.jpg', '257', '2019-06-14 14:29:52', '2019-06-14 14:29:52', '2', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', '12 Minutos', '朱维俐', '陈芋米,吕勇卓,蒲萄,刘名凯', '2019', '网红少女江楚楚，虽然拥有了他人眼中光鲜亮丽的职业——网红，但生活如人饮水，冷暖自知，甚至会由于一件内衣而“破产”。在江楚楚的网红生涯近乎解体的边缘，一条因愤怒而收回的购物差评竟成为了改动她人生轨迹的末尾；总裁骆天一正值新上任阶段，这一条突如其来的购物差评竟成为了他总裁生涯的第一道考验。为化解“职业危机”，骆天一化身呆萌实习生，闯入江楚楚的网红世界，开启一段甜蜜且充溢笑料的浪漫邂逅，演出“大总裁给小网红打工”的神转机……', null, null, null, null, '127', null);
INSERT INTO `dramainfo` VALUES ('542787', '马卡龙少女 -第07集', '1', 'C:\\Users\\Administrator\\Desktop\\Series\\img\\马卡龙少女.jpg', '257', '2019-06-14 14:29:52', '2019-06-14 14:29:52', '2', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', '12 Minutos', '朱维俐', '陈芋米,吕勇卓,蒲萄,刘名凯', '2019', '网红少女江楚楚，虽然拥有了他人眼中光鲜亮丽的职业——网红，但生活如人饮水，冷暖自知，甚至会由于一件内衣而“破产”。在江楚楚的网红生涯近乎解体的边缘，一条因愤怒而收回的购物差评竟成为了改动她人生轨迹的末尾；总裁骆天一正值新上任阶段，这一条突如其来的购物差评竟成为了他总裁生涯的第一道考验。为化解“职业危机”，骆天一化身呆萌实习生，闯入江楚楚的网红世界，开启一段甜蜜且充溢笑料的浪漫邂逅，演出“大总裁给小网红打工”的神转机……', null, null, null, null, '127', null);
INSERT INTO `dramainfo` VALUES ('542788', '马卡龙少女 -第18集', '1', 'C:\\Users\\Administrator\\Desktop\\Series\\img\\马卡龙少女.jpg', '257', '2019-06-14 14:29:52', '2019-06-14 14:29:52', '2', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', '12 Minutos', '朱维俐', '陈芋米,吕勇卓,蒲萄,刘名凯', '2019', '网红少女江楚楚，虽然拥有了他人眼中光鲜亮丽的职业——网红，但生活如人饮水，冷暖自知，甚至会由于一件内衣而“破产”。在江楚楚的网红生涯近乎解体的边缘，一条因愤怒而收回的购物差评竟成为了改动她人生轨迹的末尾；总裁骆天一正值新上任阶段，这一条突如其来的购物差评竟成为了他总裁生涯的第一道考验。为化解“职业危机”，骆天一化身呆萌实习生，闯入江楚楚的网红世界，开启一段甜蜜且充溢笑料的浪漫邂逅，演出“大总裁给小网红打工”的神转机……', null, null, null, null, '127', null);
INSERT INTO `dramainfo` VALUES ('542789', '马卡龙少女 -第09集', '1', 'C:\\Users\\Administrator\\Desktop\\Series\\img\\马卡龙少女.jpg', '257', '2019-06-14 14:29:52', '2019-06-14 14:29:52', '2', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', '12 Minutos', '朱维俐', '陈芋米,吕勇卓,蒲萄,刘名凯', '2019', '网红少女江楚楚，虽然拥有了他人眼中光鲜亮丽的职业——网红，但生活如人饮水，冷暖自知，甚至会由于一件内衣而“破产”。在江楚楚的网红生涯近乎解体的边缘，一条因愤怒而收回的购物差评竟成为了改动她人生轨迹的末尾；总裁骆天一正值新上任阶段，这一条突如其来的购物差评竟成为了他总裁生涯的第一道考验。为化解“职业危机”，骆天一化身呆萌实习生，闯入江楚楚的网红世界，开启一段甜蜜且充溢笑料的浪漫邂逅，演出“大总裁给小网红打工”的神转机……', null, null, null, null, '127', null);
INSERT INTO `dramainfo` VALUES ('542790', '洛城战警第一季 ', '1', 'C:\\Users\\Administrator\\Desktop\\Series\\img\\洛城战警第一季.jpg', '256', '2019-06-14 15:12:38', '2019-06-14 15:12:38', '2', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', '12 Minutos', '安东·克罗帕', '扎克·吉尔福德,杰西卡·阿尔芭,埃涅·赫德森,杜恩·马丁,加布里埃尔·尤尼恩,雷恩·麦帕林,大卫·弗莫洛,乔丹·罗德里格斯', '2019', 'NBC过去拿下电影《绝地战警2 Bad Boys II》角色Sydney “Syd” Burnett的团体衍生剧试映集《洛城战警 L.A.’s Finest》，但该项目最终没被预订。但是经过制片公司Sony Pictures电视部门的销售后，《洛城战警》以13集首季被有线台Spectrum收归旗下，预定美国时间5月13日首播。 在《绝地战警2》中饰演Syd一角的演员是Gabrielle Union，剧集版将由她继续演出。她是Marcus Burnett（Martin Lawrence饰）的妹妹，亦是美国缉毒局的卧底探员。另外在片中，Sydney与Mike Lowrey（Will Smith饰）是情侣。 《洛城战警》里Syd成了洛杉矶警局的警探，原本可以扔下过去，享用生活的她却能够由于新拍档Nancy McKenna而令事情变得复杂。在2000-02年主演过《末世黑天使 Dark Angel》的Jessica Alba将饰演Nancy McKenna，Nancy高中后参与了陆军，在伊拉克及阿富汗待了10年之久；回国后她当上了警探，与丈夫一同抚养两个前青少年期的继子。 其他角色包括Ben Walker﹑Ben Baines（Zack Gilford及Duane Martin饰演，下同）﹑Patrick McKenna（Ryan McPartlin）﹑Isabel “Izzy” McKenna（Sophie Reynolds）及Joseph Vaughn（Ernie Hudson）。', null, null, null, null, '123', null);

-- ----------------------------
-- Table structure for dramardate
-- ----------------------------
DROP TABLE IF EXISTS `dramardate`;
CREATE TABLE `dramardate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` varchar(128) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT '1',
  `type` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='影片年份表';

-- ----------------------------
-- Records of dramardate
-- ----------------------------
INSERT INTO `dramardate` VALUES ('1', '2019', '1', '0');
INSERT INTO `dramardate` VALUES ('2', '2018', '1', '0');
INSERT INTO `dramardate` VALUES ('3', '2017', '1', '0');
INSERT INTO `dramardate` VALUES ('4', '2016', '1', '0');
INSERT INTO `dramardate` VALUES ('5', '2015', '1', '0');
INSERT INTO `dramardate` VALUES ('6', '2014', '1', '0');
INSERT INTO `dramardate` VALUES ('7', '2013', '1', '0');
INSERT INTO `dramardate` VALUES ('8', '2012', '1', '0');
INSERT INTO `dramardate` VALUES ('9', '2011', '1', '0');
INSERT INTO `dramardate` VALUES ('10', '2010', '1', '0');
INSERT INTO `dramardate` VALUES ('11', '2009', '1', '0');
INSERT INTO `dramardate` VALUES ('12', '2008', '1', '0');
INSERT INTO `dramardate` VALUES ('13', '2007', '1', '0');
INSERT INTO `dramardate` VALUES ('14', '2006', '1', '0');
INSERT INTO `dramardate` VALUES ('15', '2005', '1', '0');
INSERT INTO `dramardate` VALUES ('16', '2004', '1', '0');
INSERT INTO `dramardate` VALUES ('17', '2003', '1', '0');
INSERT INTO `dramardate` VALUES ('18', '2002', '1', '0');
INSERT INTO `dramardate` VALUES ('19', '2001', '1', '0');
INSERT INTO `dramardate` VALUES ('20', '2000', '1', '0');
INSERT INTO `dramardate` VALUES ('21', 'other', '1', '0');

-- ----------------------------
-- Table structure for dramaregion
-- ----------------------------
DROP TABLE IF EXISTS `dramaregion`;
CREATE TABLE `dramaregion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT '0',
  `sequence` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8 COMMENT='影片国家表';

-- ----------------------------
-- Records of dramaregion
-- ----------------------------
INSERT INTO `dramaregion` VALUES ('1', 'USA', '1', '1', '0');
INSERT INTO `dramaregion` VALUES ('2', 'CHINA', '1', '2', '0');
INSERT INTO `dramaregion` VALUES ('3', 'other', '1', '31', '0');
INSERT INTO `dramaregion` VALUES ('4', 'Australia', '1', '4', '0');
INSERT INTO `dramaregion` VALUES ('5', 'UK', '1', '5', '0');
INSERT INTO `dramaregion` VALUES ('6', 'Hong Kong', '1', '6', '0');
INSERT INTO `dramaregion` VALUES ('7', 'Brazil', '1', '7', '0');
INSERT INTO `dramaregion` VALUES ('8', 'Germany', '1', '8', '0');
INSERT INTO `dramaregion` VALUES ('9', 'South Africa', '1', '9', '0');
INSERT INTO `dramaregion` VALUES ('10', 'Russia', '1', '10', '0');
INSERT INTO `dramaregion` VALUES ('11', 'Norway', '1', '11', '0');
INSERT INTO `dramaregion` VALUES ('12', 'Canada', '1', '12', '0');
INSERT INTO `dramaregion` VALUES ('13', 'Bulgaria', '1', '13', '0');
INSERT INTO `dramaregion` VALUES ('14', 'India', '1', '14', '0');
INSERT INTO `dramaregion` VALUES ('15', 'Austria', '1', '15', '0');
INSERT INTO `dramaregion` VALUES ('16', 'Mexico', '1', '16', '0');
INSERT INTO `dramaregion` VALUES ('17', 'Italy', '1', '17', '0');
INSERT INTO `dramaregion` VALUES ('18', 'Japan', '1', '18', '0');
INSERT INTO `dramaregion` VALUES ('19', 'France', '1', '19', '0');
INSERT INTO `dramaregion` VALUES ('20', 'South Korea', '1', '20', '0');
INSERT INTO `dramaregion` VALUES ('21', 'New Zealand', '1', '21', '0');
INSERT INTO `dramaregion` VALUES ('22', 'Hungary', '1', '22', '0');
INSERT INTO `dramaregion` VALUES ('23', 'Belgium', '1', '23', '0');
INSERT INTO `dramaregion` VALUES ('24', 'Netherlands', '1', '24', '0');
INSERT INTO `dramaregion` VALUES ('25', 'Sweden', '1', '25', '0');
INSERT INTO `dramaregion` VALUES ('26', 'Finland', '1', '26', '0');
INSERT INTO `dramaregion` VALUES ('27', 'Denmark', '1', '27', '0');
INSERT INTO `dramaregion` VALUES ('28', 'Greece', '1', '28', '0');
INSERT INTO `dramaregion` VALUES ('29', 'Spain', '1', '29', '0');
INSERT INTO `dramaregion` VALUES ('30', 'Switzerland', '1', '30', '0');
INSERT INTO `dramaregion` VALUES ('31', 'Ireland', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('32', 'Thailand', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('33', 'Czech Republic', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('34', 'Argentina', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('35', 'Cambodia', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('36', 'Luxembourg', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('37', 'Israel', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('38', 'Puerto Rico', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('39', 'United Arab Emirates', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('40', 'Poland', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('41', 'Slovakia', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('42', 'Taiwan', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('43', 'Colombia', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('44', 'Portugal', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('45', 'Malaysia', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('46', 'Bahamas', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('47', 'Belarus', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('48', 'Philippines', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('49', 'Aruba', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('50', 'West Germany', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('51', 'Namibia', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('52', 'Malta', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('53', 'Morocco', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('54', 'Lebanon', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('55', 'Lithuania', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('56', 'Qatar', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('57', 'Ukraine', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('58', 'Iceland', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('59', 'Venezuela', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('60', 'Algeria', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('61', 'Romania', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('62', 'Serbia', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('63', 'Kosovo', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('64', 'Panama', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('65', 'Turkey', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('66', 'Indonesia', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('67', 'Jordan', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('68', 'Iran', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('69', 'Estonia', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('70', 'Chile', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('71', 'Latvia', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('72', 'Guatemala', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('73', 'Yugoslavia', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('74', 'Jamaica', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('75', 'Tunisia', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('76', 'Uruguay', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('77', 'Singapore', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('78', 'Myanmar', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('79', 'Monaco', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('80', 'Trinidad and Tobago', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('81', 'Dominican Republic', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('82', 'Albania', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('83', 'Kenya', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('84', 'Republic of Macedonia', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('85', 'Korea', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('86', 'Maldives', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('87', 'Brunei', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('88', 'Djibouti', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('89', 'Soviet Union', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('90', 'Holy See (Vatican City State)', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('91', 'Nepal', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('92', 'Georgia', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('93', 'Croatia', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('94', 'Cyprus', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('95', 'Paraguay', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('96', 'Cuba', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('97', 'British Virgin Islands', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('98', 'Bosnia and Herzegovina', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('99', 'Peru', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('100', 'Nigeria', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('101', 'Senegal', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('102', 'Syria', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('103', 'Botswana', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('104', 'Isle Of Man', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('105', 'Haiti', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('106', 'Saudi Arabia', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('107', 'Bolivia', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('108', 'Kazakhstan', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('109', 'Fiji', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('110', 'Marshall Islands', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('111', 'Azerbaijan', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('112', 'East Germany', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('119', 'Iraq', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('121', 'Malawi', '0', null, '0');
INSERT INTO `dramaregion` VALUES ('123', '美国', '0', '0', '0');
INSERT INTO `dramaregion` VALUES ('124', '香港', '0', '0', '0');
INSERT INTO `dramaregion` VALUES ('125', '韩国', '0', '0', '0');
INSERT INTO `dramaregion` VALUES ('126', '法国', '0', '0', '0');
INSERT INTO `dramaregion` VALUES ('127', '大陆', '0', '0', '0');

-- ----------------------------
-- Table structure for dramascore
-- ----------------------------
DROP TABLE IF EXISTS `dramascore`;
CREATE TABLE `dramascore` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `dramaid` int(11) NOT NULL COMMENT '影片信息表id',
  `type` int(11) DEFAULT NULL,
  `fourstars` int(11) DEFAULT '0' COMMENT '评价次数',
  `threestars` int(11) DEFAULT '0' COMMENT '评价次数',
  `twostars` int(11) DEFAULT '0' COMMENT '评价次数',
  `onestars` int(11) DEFAULT '0' COMMENT '评价次数',
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`dramaid`)
) ENGINE=InnoDB AUTO_INCREMENT=4604 DEFAULT CHARSET=utf8 COMMENT='影片评分表';

-- ----------------------------
-- Records of dramascore
-- ----------------------------
INSERT INTO `dramascore` VALUES ('1', '176506', '2', '1', '3', '2', '1', null, null);
INSERT INTO `dramascore` VALUES ('2', '176495', '2', '11', '3', '1', '0', null, '2019-06-01 10:01:28');
INSERT INTO `dramascore` VALUES ('3', '137822', '1', '16', '1', '1', '3', null, '2019-06-04 11:21:43');
INSERT INTO `dramascore` VALUES ('4', '44570', '4', '2', '1', '0', '0', null, '2019-05-23 19:07:48');
INSERT INTO `dramascore` VALUES ('5', '174721', '2', '2', '1', '1', '1', null, null);
INSERT INTO `dramascore` VALUES ('6', '155529', '2', '9', '0', '0', '0', null, '2019-06-04 20:43:50');
INSERT INTO `dramascore` VALUES ('7', '130915', '2', '6', '3', '0', '2', null, '2019-05-07 08:28:33');
INSERT INTO `dramascore` VALUES ('8', '167063', '1', '2', '0', '0', '1', null, '2019-06-08 10:05:03');
INSERT INTO `dramascore` VALUES ('9', '77687', '1', '2', '0', '0', '0', null, '2019-06-09 05:16:21');
INSERT INTO `dramascore` VALUES ('10', '175190', '1', '4', '3', '2', '1', null, '2019-01-23 14:58:32');
INSERT INTO `dramascore` VALUES ('11', '77678', '1', '3', '0', '0', '0', null, '2019-05-20 23:01:33');
INSERT INTO `dramascore` VALUES ('12', '87278', '1', '1', '0', '0', '0', null, null);
INSERT INTO `dramascore` VALUES ('13', '90037', '1', '5', '1', '0', '0', null, '2019-02-27 19:59:40');
INSERT INTO `dramascore` VALUES ('14', '175182', '1', '1', '1', '1', '0', null, '2019-05-23 01:23:31');
INSERT INTO `dramascore` VALUES ('15', '175181', '1', '14', '2', '0', '0', null, '2019-06-08 02:36:33');
INSERT INTO `dramascore` VALUES ('16', '150205', '1', '2', '0', '0', '0', null, null);
INSERT INTO `dramascore` VALUES ('17', '164953', '1', '4', '0', '0', '0', null, '2019-03-15 22:48:09');
INSERT INTO `dramascore` VALUES ('18', '114258', '1', '0', '1', '1', '1', null, '2019-03-30 11:17:05');
INSERT INTO `dramascore` VALUES ('19', '2052', '1', '0', '1', '0', '0', null, null);
INSERT INTO `dramascore` VALUES ('20', '180125', '1', '1', '3', '1', '0', null, null);
INSERT INTO `dramascore` VALUES ('21', '180120', '1', '1', '1', '1', '0', null, null);
INSERT INTO `dramascore` VALUES ('22', '180122', '1', '0', '2', '0', '1', null, '2019-04-07 21:07:31');
INSERT INTO `dramascore` VALUES ('23', '178855', '2', '1', '3', '0', '1', null, '2019-06-10 08:29:54');
INSERT INTO `dramascore` VALUES ('24', '159321', '1', '2', '1', '1', '0', null, '2019-03-16 23:38:35');
INSERT INTO `dramascore` VALUES ('25', '160374', '1', '0', '1', '1', '0', null, null);
INSERT INTO `dramascore` VALUES ('26', '163510', '1', '1', '0', '0', '0', null, null);
INSERT INTO `dramascore` VALUES ('27', '180127', '1', '1', '3', '0', '0', null, '2019-03-04 08:53:55');
INSERT INTO `dramascore` VALUES ('28', '167054', '1', '11', '1', '0', '0', null, '2019-06-08 00:49:03');
INSERT INTO `dramascore` VALUES ('29', '178857', '2', '4', '1', '0', '0', null, '2019-05-26 01:37:51');
INSERT INTO `dramascore` VALUES ('30', '168735', '1', '8', '2', '0', '0', null, '2019-05-23 01:40:23');
INSERT INTO `dramascore` VALUES ('31', '72440', '1', '0', '1', '0', '0', null, null);
INSERT INTO `dramascore` VALUES ('32', '11584', '4', '0', '1', '0', '0', null, null);
INSERT INTO `dramascore` VALUES ('33', '125302', '1', '1', '0', '0', '0', null, null);
INSERT INTO `dramascore` VALUES ('34', '10059', '2', '1', '0', '0', '1', null, '2019-05-12 01:21:49');
INSERT INTO `dramascore` VALUES ('35', '10965', '1', '2', '0', '0', '0', null, '2019-01-31 21:31:10');
INSERT INTO `dramascore` VALUES ('36', '180126', '1', '2', '0', '0', '0', null, '2019-06-12 09:32:09');
INSERT INTO `dramascore` VALUES ('37', '14385', '2', '63', '4', '2', '6', null, '2019-06-11 00:39:52');
INSERT INTO `dramascore` VALUES ('38', '91125', '2', '2', '0', '0', '0', null, '2019-02-12 08:17:31');
INSERT INTO `dramascore` VALUES ('39', '141814', '1', '0', '0', '1', '0', null, null);
INSERT INTO `dramascore` VALUES ('40', '182417', '4', '1', '0', '0', '2', null, '2019-01-30 09:18:02');
INSERT INTO `dramascore` VALUES ('41', '151002', '1', '0', '2', '0', '0', null, '2019-03-31 00:23:50');
INSERT INTO `dramascore` VALUES ('42', '150989', '1', '0', '1', '0', '0', null, null);
INSERT INTO `dramascore` VALUES ('43', '190139', '1', '1', '1', '1', '0', null, '2019-05-08 09:19:52');
INSERT INTO `dramascore` VALUES ('44', '148432', '1', '0', '1', '0', '0', null, null);
INSERT INTO `dramascore` VALUES ('45', '190197', '1', '1', '1', '0', '0', null, null);
INSERT INTO `dramascore` VALUES ('46', '50701', '1', '11', '2', '1', '2', null, '2019-05-28 10:03:53');
INSERT INTO `dramascore` VALUES ('47', '190226', '1', '1', '1', '0', '0', null, '2019-05-08 09:19:23');
INSERT INTO `dramascore` VALUES ('48', '181441', '4', '13', '0', '0', '0', null, '2019-05-24 00:23:54');
INSERT INTO `dramascore` VALUES ('49', '10316', '2', '17', '0', '2', '1', null, '2019-06-12 07:34:19');
INSERT INTO `dramascore` VALUES ('50', '196778', '1', '7', '1', '0', '1', null, '2019-05-25 09:10:34');
INSERT INTO `dramascore` VALUES ('51', '181404', '4', '22', '1', '2', '12', '2019-01-17 02:28:24', '2019-05-29 11:08:08');
INSERT INTO `dramascore` VALUES ('52', '163536', '1', '2', '0', '0', '0', '2019-01-17 11:42:51', '2019-04-11 12:41:57');
INSERT INTO `dramascore` VALUES ('53', '10543', '2', '450', '12', '12', '16', '2019-01-17 17:33:09', '2019-06-13 09:23:55');
INSERT INTO `dramascore` VALUES ('54', '119616', '1', '3', '1', '0', '0', '2019-01-17 19:52:02', '2019-05-05 11:21:50');
INSERT INTO `dramascore` VALUES ('55', '119619', '1', '3', '0', '0', '0', '2019-01-17 19:53:41', '2019-05-05 11:22:18');
INSERT INTO `dramascore` VALUES ('56', '115409', '1', '7', '1', '2', '0', '2019-01-17 20:13:10', '2019-06-10 07:18:40');
INSERT INTO `dramascore` VALUES ('57', '199074', '2', '18', '2', '0', '1', '2019-01-18 15:58:56', '2019-06-11 07:36:30');
INSERT INTO `dramascore` VALUES ('58', '167052', '1', '4', '2', '0', '0', '2019-01-19 10:18:18', '2019-05-16 09:06:22');
INSERT INTO `dramascore` VALUES ('59', '190146', '1', '63', '9', '3', '4', '2019-01-19 10:40:21', '2019-06-10 08:41:55');
INSERT INTO `dramascore` VALUES ('60', '155923', '1', '1', '0', '0', '0', '2019-01-19 17:09:45', '2019-01-19 17:09:45');
INSERT INTO `dramascore` VALUES ('61', '154903', '1', '0', '1', '0', '1', '2019-01-19 17:10:51', '2019-05-07 09:23:55');
INSERT INTO `dramascore` VALUES ('62', '204874', '1', '149', '16', '3', '8', '2019-01-19 18:44:10', '2019-06-02 08:59:00');
INSERT INTO `dramascore` VALUES ('63', '10336', '2', '2', '1', '1', '1', '2019-01-20 02:26:18', '2019-06-01 06:46:24');
INSERT INTO `dramascore` VALUES ('64', '204799', '1', '6', '2', '1', '2', '2019-01-20 09:35:27', '2019-06-03 04:38:39');
INSERT INTO `dramascore` VALUES ('65', '10882', '4', '1', '1', '0', '0', '2019-01-20 13:36:27', '2019-06-07 11:42:17');
INSERT INTO `dramascore` VALUES ('66', '1306', '1', '1', '0', '0', '0', '2019-01-20 20:13:26', '2019-01-20 20:13:26');
INSERT INTO `dramascore` VALUES ('67', '153332', '1', '1', '0', '0', '0', '2019-01-21 07:45:01', '2019-01-21 07:45:01');
INSERT INTO `dramascore` VALUES ('68', '207197', '2', '5', '1', '0', '0', '2019-01-21 07:48:32', '2019-06-13 09:11:19');
INSERT INTO `dramascore` VALUES ('69', '10573', '2', '4', '0', '1', '3', '2019-01-21 07:51:19', '2019-06-01 11:11:01');
INSERT INTO `dramascore` VALUES ('70', '10570', '2', '90', '2', '2', '4', '2019-01-21 07:51:40', '2019-06-10 19:05:05');
INSERT INTO `dramascore` VALUES ('71', '10564', '2', '1', '1', '0', '0', '2019-01-21 07:51:55', '2019-02-21 18:33:37');
INSERT INTO `dramascore` VALUES ('72', '10416', '2', '1', '0', '0', '1', '2019-01-21 07:52:34', '2019-02-14 21:25:23');
INSERT INTO `dramascore` VALUES ('73', '10291', '2', '3', '0', '0', '0', '2019-01-21 07:53:23', '2019-05-23 19:22:22');
INSERT INTO `dramascore` VALUES ('74', '10158', '2', '0', '0', '1', '0', '2019-01-21 07:53:53', '2019-01-21 07:53:53');
INSERT INTO `dramascore` VALUES ('75', '10098', '2', '3', '0', '0', '1', '2019-01-21 07:54:20', '2019-06-02 11:26:50');
INSERT INTO `dramascore` VALUES ('76', '10090', '2', '2', '0', '0', '0', '2019-01-21 07:54:31', '2019-05-08 04:07:10');
INSERT INTO `dramascore` VALUES ('77', '10063', '2', '103', '0', '1', '0', '2019-01-21 07:55:10', '2019-06-01 12:41:00');
INSERT INTO `dramascore` VALUES ('78', '10064', '2', '5', '0', '0', '0', '2019-01-21 07:55:19', '2019-04-11 22:04:48');
INSERT INTO `dramascore` VALUES ('79', '9613', '2', '36', '5', '0', '0', '2019-01-21 07:55:38', '2019-06-09 18:59:25');
INSERT INTO `dramascore` VALUES ('80', '9612', '2', '40', '1', '1', '0', '2019-01-21 07:55:45', '2019-06-13 08:57:49');
INSERT INTO `dramascore` VALUES ('81', '9615', '2', '5', '0', '0', '0', '2019-01-21 07:55:53', '2019-05-10 14:33:36');
INSERT INTO `dramascore` VALUES ('82', '207398', '1', '51', '4', '1', '5', '2019-01-21 07:57:05', '2019-06-13 00:20:38');
INSERT INTO `dramascore` VALUES ('83', '158566', '1', '0', '0', '1', '0', '2019-01-21 08:34:46', '2019-01-21 08:34:46');
INSERT INTO `dramascore` VALUES ('84', '9614', '2', '101', '1', '0', '15', '2019-01-21 10:09:10', '2019-06-10 23:33:16');
INSERT INTO `dramascore` VALUES ('85', '66667', '1', '5', '1', '0', '1', '2019-01-21 16:43:45', '2019-06-03 07:04:06');
INSERT INTO `dramascore` VALUES ('86', '181199', '4', '50', '1', '2', '49', '2019-01-21 19:46:08', '2019-06-06 10:42:23');
INSERT INTO `dramascore` VALUES ('87', '207401', '1', '9', '0', '2', '1', '2019-01-21 20:33:49', '2019-06-08 05:34:38');
INSERT INTO `dramascore` VALUES ('88', '204766', '1', '51', '0', '0', '7', '2019-01-21 20:37:21', '2019-06-12 08:15:25');
INSERT INTO `dramascore` VALUES ('89', '182421', '4', '15', '0', '0', '0', '2019-01-22 00:27:29', '2019-05-23 15:13:06');
INSERT INTO `dramascore` VALUES ('90', '207372', '1', '1', '1', '0', '0', '2019-01-22 02:33:20', '2019-05-28 05:53:29');
INSERT INTO `dramascore` VALUES ('91', '207355', '1', '1', '0', '0', '0', '2019-01-22 12:34:08', '2019-01-22 12:34:08');
INSERT INTO `dramascore` VALUES ('92', '10558', '2', '8', '0', '0', '3', '2019-01-22 13:43:00', '2019-05-30 10:38:55');
INSERT INTO `dramascore` VALUES ('93', '207389', '1', '47', '2', '0', '0', '2019-01-22 17:10:45', '2019-06-13 08:22:40');
INSERT INTO `dramascore` VALUES ('94', '204742', '1', '2', '0', '0', '4', '2019-01-22 18:25:44', '2019-05-10 09:30:12');
INSERT INTO `dramascore` VALUES ('95', '209903', '1', '2', '0', '0', '1', '2019-01-22 22:00:57', '2019-06-10 04:36:48');
INSERT INTO `dramascore` VALUES ('96', '151053', '1', '7', '0', '1', '0', '2019-01-23 09:21:30', '2019-05-19 21:39:50');
INSERT INTO `dramascore` VALUES ('97', '51294', '1', '9', '0', '0', '1', '2019-01-23 10:24:58', '2019-05-25 22:25:14');
INSERT INTO `dramascore` VALUES ('98', '204739', '1', '14', '1', '0', '1', '2019-01-23 16:35:25', '2019-05-30 06:14:29');
INSERT INTO `dramascore` VALUES ('99', '162544', '1', '0', '1', '1', '0', '2019-01-24 07:35:16', '2019-03-01 11:42:36');
INSERT INTO `dramascore` VALUES ('100', '44942', '4', '14', '0', '0', '2', '2019-01-24 07:48:01', '2019-06-01 21:30:06');
INSERT INTO `dramascore` VALUES ('101', '163511', '1', '9', '1', '0', '0', '2019-01-24 21:23:28', '2019-05-25 09:56:14');
INSERT INTO `dramascore` VALUES ('102', '26865', '2', '57', '0', '0', '7', '2019-01-24 22:31:03', '2019-06-12 09:29:24');
INSERT INTO `dramascore` VALUES ('103', '209971', '1', '5', '1', '0', '0', '2019-01-24 23:06:29', '2019-06-12 10:12:13');
INSERT INTO `dramascore` VALUES ('104', '149261', '1', '1', '0', '0', '0', '2019-01-26 15:49:26', '2019-01-26 15:49:26');
INSERT INTO `dramascore` VALUES ('106', '149805', '1', '1', '1', '0', '0', '2019-01-26 16:24:02', '2019-04-08 09:32:36');
INSERT INTO `dramascore` VALUES ('108', '125277', '1', '1', '1', '0', '0', '2019-01-26 16:24:25', '2019-04-10 11:33:26');
INSERT INTO `dramascore` VALUES ('110', '53495', '1', '6', '3', '3', '5', '2019-01-26 16:24:37', '2019-06-03 10:33:11');
INSERT INTO `dramascore` VALUES ('112', '421', '1', '7', '0', '0', '0', '2019-01-26 21:52:25', '2019-05-10 04:25:12');
INSERT INTO `dramascore` VALUES ('114', '207395', '1', '3', '0', '0', '0', '2019-01-27 01:11:59', '2019-04-07 20:35:59');
INSERT INTO `dramascore` VALUES ('116', '105034', '2', '60', '3', '2', '4', '2019-01-27 12:39:37', '2019-06-04 07:38:23');
INSERT INTO `dramascore` VALUES ('118', '216228', '1', '1', '3', '1', '1', '2019-01-27 16:13:54', '2019-06-05 11:14:22');
INSERT INTO `dramascore` VALUES ('120', '2386', '1', '2', '1', '0', '0', '2019-01-27 17:02:09', '2019-05-04 11:32:14');
INSERT INTO `dramascore` VALUES ('122', '213988', '2', '6', '0', '0', '1', '2019-01-27 19:14:38', '2019-06-04 20:43:40');
INSERT INTO `dramascore` VALUES ('124', '216092', '1', '1', '0', '1', '0', '2019-01-27 19:54:45', '2019-05-12 08:34:26');
INSERT INTO `dramascore` VALUES ('126', '207374', '1', '2', '2', '0', '1', '2019-01-27 20:07:38', '2019-04-10 00:55:39');
INSERT INTO `dramascore` VALUES ('128', '159891', '1', '3', '0', '0', '0', '2019-01-27 20:24:28', '2019-05-20 14:04:47');
INSERT INTO `dramascore` VALUES ('130', '216138', '1', '3', '0', '0', '0', '2019-01-27 22:11:58', '2019-05-14 05:40:07');
INSERT INTO `dramascore` VALUES ('132', '204791', '1', '2', '0', '1', '0', '2019-01-28 01:56:17', '2019-06-02 00:17:58');
INSERT INTO `dramascore` VALUES ('134', '178927', '4', '8', '0', '0', '0', '2019-01-28 01:57:01', '2019-05-26 06:25:38');
INSERT INTO `dramascore` VALUES ('136', '181285', '4', '4', '0', '0', '0', '2019-01-28 01:57:07', '2019-03-22 05:29:03');
INSERT INTO `dramascore` VALUES ('138', '32', '1', '1', '0', '0', '0', '2019-01-28 07:56:21', '2019-01-28 07:56:21');
INSERT INTO `dramascore` VALUES ('140', '10592', '2', '125', '4', '0', '3', '2019-01-28 13:43:19', '2019-06-13 11:58:08');
INSERT INTO `dramascore` VALUES ('142', '163147', '1', '2', '0', '0', '0', '2019-01-28 20:56:53', '2019-06-03 06:34:41');
INSERT INTO `dramascore` VALUES ('144', '10940', '1', '2', '2', '0', '0', '2019-01-28 21:07:02', '2019-05-18 12:45:59');
INSERT INTO `dramascore` VALUES ('146', '163693', '1', '1', '0', '2', '1', '2019-01-29 08:46:48', '2019-06-10 06:32:47');
INSERT INTO `dramascore` VALUES ('148', '162571', '1', '0', '0', '0', '2', '2019-01-29 12:04:00', '2019-03-13 20:53:30');
INSERT INTO `dramascore` VALUES ('150', '219834', '1', '1', '0', '3', '0', '2019-01-29 21:06:05', '2019-05-28 13:19:34');
INSERT INTO `dramascore` VALUES ('152', '10916', '2', '3', '1', '0', '0', '2019-01-29 22:43:23', '2019-05-02 01:50:37');
INSERT INTO `dramascore` VALUES ('153', '10653', '4', '1', '0', '0', '0', '2019-01-30 09:14:16', '2019-01-30 09:14:16');
INSERT INTO `dramascore` VALUES ('155', '217210', '2', '21', '0', '0', '1', '2019-01-30 09:17:42', '2019-05-21 11:38:19');
INSERT INTO `dramascore` VALUES ('157', '219772', '1', '9', '1', '1', '3', '2019-01-30 20:42:50', '2019-06-12 06:06:27');
INSERT INTO `dramascore` VALUES ('159', '216164', '1', '2', '0', '1', '2', '2019-01-30 21:02:07', '2019-04-04 06:38:37');
INSERT INTO `dramascore` VALUES ('161', '159455', '1', '2', '0', '0', '0', '2019-01-31 12:54:07', '2019-04-11 19:16:27');
INSERT INTO `dramascore` VALUES ('163', '10153', '2', '5', '0', '0', '0', '2019-01-31 13:16:22', '2019-03-15 22:38:01');
INSERT INTO `dramascore` VALUES ('165', '166311', '1', '14', '0', '1', '0', '2019-01-31 14:54:08', '2019-06-09 04:22:33');
INSERT INTO `dramascore` VALUES ('167', '204729', '1', '3', '0', '0', '0', '2019-01-31 18:03:24', '2019-02-03 20:20:52');
INSERT INTO `dramascore` VALUES ('169', '196753', '1', '1', '1', '0', '0', '2019-01-31 18:03:48', '2019-04-24 03:38:28');
INSERT INTO `dramascore` VALUES ('171', '100040', '1', '5', '0', '2', '1', '2019-01-31 18:07:13', '2019-06-01 09:49:21');
INSERT INTO `dramascore` VALUES ('173', '160165', '1', '1', '0', '0', '0', '2019-02-01 11:10:37', '2019-02-01 11:10:37');
INSERT INTO `dramascore` VALUES ('175', '148092', '1', '6', '1', '1', '5', '2019-02-01 13:08:03', '2019-06-05 01:08:40');
INSERT INTO `dramascore` VALUES ('177', '154566', '1', '1', '0', '0', '0', '2019-02-01 22:35:13', '2019-02-01 22:35:13');
INSERT INTO `dramascore` VALUES ('179', '224339', '2', '8', '1', '0', '0', '2019-02-02 00:47:49', '2019-05-18 12:35:35');
INSERT INTO `dramascore` VALUES ('181', '11174', '1', '1', '0', '0', '0', '2019-02-02 15:02:18', '2019-02-02 15:02:18');
INSERT INTO `dramascore` VALUES ('183', '180203', '4', '7', '0', '0', '0', '2019-02-02 15:47:59', '2019-04-26 18:19:38');
INSERT INTO `dramascore` VALUES ('185', '230213', '1', '1', '0', '1', '1', '2019-02-02 19:34:44', '2019-02-04 20:58:22');
INSERT INTO `dramascore` VALUES ('187', '163801', '1', '0', '2', '0', '0', '2019-02-02 20:07:22', '2019-04-14 08:15:40');
INSERT INTO `dramascore` VALUES ('189', '230255', '1', '52', '9', '6', '6', '2019-02-02 20:21:05', '2019-06-01 21:07:42');
INSERT INTO `dramascore` VALUES ('191', '156226', '1', '1', '0', '1', '1', '2019-02-02 22:29:12', '2019-03-30 02:44:36');
INSERT INTO `dramascore` VALUES ('193', '178934', '4', '6', '0', '0', '0', '2019-02-03 08:58:50', '2019-06-11 21:46:42');
INSERT INTO `dramascore` VALUES ('195', '230199', '1', '1', '2', '0', '3', '2019-02-03 12:54:44', '2019-05-12 08:30:31');
INSERT INTO `dramascore` VALUES ('197', '93551', '1', '8', '1', '0', '0', '2019-02-03 17:23:02', '2019-06-02 10:45:20');
INSERT INTO `dramascore` VALUES ('199', '230235', '1', '50', '6', '3', '6', '2019-02-03 18:09:23', '2019-06-08 10:42:18');
INSERT INTO `dramascore` VALUES ('201', '230185', '1', '19', '1', '0', '3', '2019-02-03 18:26:56', '2019-05-26 12:07:26');
INSERT INTO `dramascore` VALUES ('203', '9625', '2', '16', '0', '1', '0', '2019-02-03 20:06:54', '2019-05-31 09:07:15');
INSERT INTO `dramascore` VALUES ('205', '10552', '2', '8', '0', '0', '0', '2019-02-04 18:25:22', '2019-06-06 11:59:59');
INSERT INTO `dramascore` VALUES ('207', '196773', '1', '0', '0', '0', '1', '2019-02-04 21:04:17', '2019-02-04 21:04:17');
INSERT INTO `dramascore` VALUES ('209', '204821', '1', '2', '0', '0', '1', '2019-02-04 22:59:06', '2019-04-11 16:48:24');
INSERT INTO `dramascore` VALUES ('211', '11644', '4', '1', '1', '0', '1', '2019-02-05 09:36:36', '2019-06-06 21:34:31');
INSERT INTO `dramascore` VALUES ('213', '141849', '1', '7', '1', '0', '0', '2019-02-05 13:38:36', '2019-06-09 09:56:47');
INSERT INTO `dramascore` VALUES ('215', '219776', '1', '9', '0', '1', '1', '2019-02-05 16:35:45', '2019-06-08 09:37:20');
INSERT INTO `dramascore` VALUES ('217', '230155', '1', '7', '0', '0', '1', '2019-02-05 21:35:46', '2019-06-13 08:55:03');
INSERT INTO `dramascore` VALUES ('219', '216158', '1', '1', '0', '0', '4', '2019-02-05 21:48:56', '2019-05-04 10:16:19');
INSERT INTO `dramascore` VALUES ('221', '216022', '1', '18', '4', '0', '2', '2019-02-05 23:43:17', '2019-06-09 10:17:40');
INSERT INTO `dramascore` VALUES ('223', '204809', '1', '0', '0', '1', '0', '2019-02-06 06:46:20', '2019-02-06 06:46:20');
INSERT INTO `dramascore` VALUES ('225', '180145', '4', '5', '1', '0', '0', '2019-02-06 08:13:12', '2019-05-21 07:39:58');
INSERT INTO `dramascore` VALUES ('227', '129078', '1', '1', '0', '2', '0', '2019-02-06 13:33:17', '2019-04-27 14:03:14');
INSERT INTO `dramascore` VALUES ('229', '158731', '1', '5', '0', '0', '0', '2019-02-06 14:57:29', '2019-06-05 03:25:58');
INSERT INTO `dramascore` VALUES ('231', '229425', '1', '4', '0', '1', '0', '2019-02-06 15:12:21', '2019-05-11 10:46:52');
INSERT INTO `dramascore` VALUES ('233', '215988', '1', '11', '2', '0', '6', '2019-02-06 17:30:39', '2019-05-19 07:22:02');
INSERT INTO `dramascore` VALUES ('235', '10574', '2', '86', '0', '2', '3', '2019-02-06 18:45:35', '2019-06-08 04:05:26');
INSERT INTO `dramascore` VALUES ('237', '224383', '2', '31', '0', '1', '4', '2019-02-06 19:42:43', '2019-06-03 01:30:57');
INSERT INTO `dramascore` VALUES ('239', '175100', '2', '1', '0', '0', '0', '2019-02-06 19:58:22', '2019-02-06 19:58:22');
INSERT INTO `dramascore` VALUES ('241', '9621', '2', '27', '0', '4', '0', '2019-02-06 20:53:27', '2019-06-10 08:59:27');
INSERT INTO `dramascore` VALUES ('243', '230219', '1', '9', '4', '1', '1', '2019-02-06 21:11:32', '2019-06-08 17:16:11');
INSERT INTO `dramascore` VALUES ('245', '230173', '1', '2', '0', '0', '1', '2019-02-06 21:11:54', '2019-06-02 00:24:25');
INSERT INTO `dramascore` VALUES ('247', '163716', '1', '2', '0', '0', '0', '2019-02-07 09:10:02', '2019-03-16 12:40:19');
INSERT INTO `dramascore` VALUES ('249', '229401', '1', '2', '1', '0', '0', '2019-02-07 09:10:40', '2019-05-01 06:07:59');
INSERT INTO `dramascore` VALUES ('251', '10874', '4', '2', '0', '0', '0', '2019-02-07 09:25:12', '2019-05-07 10:49:48');
INSERT INTO `dramascore` VALUES ('253', '219774', '1', '1', '0', '1', '0', '2019-02-07 13:24:24', '2019-04-22 08:26:30');
INSERT INTO `dramascore` VALUES ('255', '50180', '1', '1', '0', '0', '0', '2019-02-07 17:37:33', '2019-02-07 17:37:33');
INSERT INTO `dramascore` VALUES ('257', '1593', '1', '1', '0', '0', '0', '2019-02-07 19:12:01', '2019-02-07 19:12:01');
INSERT INTO `dramascore` VALUES ('259', '245291', '1', '1', '0', '0', '1', '2019-02-07 20:53:24', '2019-02-09 13:25:11');
INSERT INTO `dramascore` VALUES ('261', '163654', '1', '1', '0', '0', '0', '2019-02-07 22:32:36', '2019-02-07 22:32:36');
INSERT INTO `dramascore` VALUES ('263', '245263', '1', '9', '0', '0', '3', '2019-02-07 22:39:52', '2019-06-07 11:09:55');
INSERT INTO `dramascore` VALUES ('265', '245255', '1', '7', '1', '1', '3', '2019-02-07 23:11:46', '2019-06-13 02:18:06');
INSERT INTO `dramascore` VALUES ('267', '245249', '1', '20', '2', '0', '6', '2019-02-07 23:12:05', '2019-06-11 23:40:09');
INSERT INTO `dramascore` VALUES ('269', '162142', '1', '0', '1', '1', '1', '2019-02-08 07:26:57', '2019-06-02 03:20:11');
INSERT INTO `dramascore` VALUES ('271', '161542', '1', '0', '0', '0', '2', '2019-02-08 18:12:18', '2019-03-02 22:03:34');
INSERT INTO `dramascore` VALUES ('273', '139', '1', '8', '1', '0', '0', '2019-02-08 19:16:24', '2019-06-10 05:20:53');
INSERT INTO `dramascore` VALUES ('275', '245149', '1', '1', '0', '0', '1', '2019-02-08 19:20:08', '2019-02-10 15:39:49');
INSERT INTO `dramascore` VALUES ('277', '245281', '1', '15', '2', '1', '4', '2019-02-08 20:22:00', '2019-05-05 05:51:42');
INSERT INTO `dramascore` VALUES ('279', '159727', '1', '3', '0', '0', '0', '2019-02-08 22:35:49', '2019-06-04 04:19:19');
INSERT INTO `dramascore` VALUES ('281', '212019', '2', '3', '0', '0', '0', '2019-02-09 08:27:53', '2019-05-01 01:22:50');
INSERT INTO `dramascore` VALUES ('283', '543', '1', '9', '0', '0', '3', '2019-02-09 16:44:05', '2019-05-22 02:05:56');
INSERT INTO `dramascore` VALUES ('285', '130716', '2', '6', '1', '1', '1', '2019-02-09 19:06:08', '2019-06-02 10:46:58');
INSERT INTO `dramascore` VALUES ('287', '11393', '2', '16', '1', '0', '2', '2019-02-09 22:17:03', '2019-06-06 09:51:56');
INSERT INTO `dramascore` VALUES ('289', '245143', '1', '5', '2', '0', '0', '2019-02-09 23:44:37', '2019-05-19 10:49:39');
INSERT INTO `dramascore` VALUES ('291', '248251', '1', '2', '0', '0', '1', '2019-02-10 11:35:09', '2019-05-22 11:52:38');
INSERT INTO `dramascore` VALUES ('293', '49362', '1', '2', '0', '0', '1', '2019-02-10 13:02:58', '2019-06-06 07:33:14');
INSERT INTO `dramascore` VALUES ('295', '540', '1', '1', '0', '0', '0', '2019-02-10 14:14:03', '2019-02-10 14:14:03');
INSERT INTO `dramascore` VALUES ('297', '163284', '1', '2', '0', '0', '0', '2019-02-10 15:22:33', '2019-02-15 03:45:13');
INSERT INTO `dramascore` VALUES ('299', '154859', '1', '1', '0', '0', '1', '2019-02-10 15:27:16', '2019-05-03 01:52:33');
INSERT INTO `dramascore` VALUES ('301', '229349', '1', '5', '0', '0', '0', '2019-02-10 15:31:30', '2019-03-25 10:53:28');
INSERT INTO `dramascore` VALUES ('303', '163612', '1', '1', '0', '0', '1', '2019-02-10 17:39:15', '2019-03-20 11:57:27');
INSERT INTO `dramascore` VALUES ('305', '247519', '1', '9', '0', '0', '0', '2019-02-10 18:06:51', '2019-04-02 08:50:07');
INSERT INTO `dramascore` VALUES ('307', '51300', '1', '10', '3', '0', '1', '2019-02-10 19:53:46', '2019-06-10 08:15:15');
INSERT INTO `dramascore` VALUES ('309', '247539', '1', '7', '0', '0', '0', '2019-02-10 21:13:43', '2019-06-11 05:48:24');
INSERT INTO `dramascore` VALUES ('311', '247535', '1', '6', '0', '0', '2', '2019-02-10 22:49:45', '2019-05-29 01:18:47');
INSERT INTO `dramascore` VALUES ('313', '248411', '2', '7', '0', '0', '0', '2019-02-11 15:49:41', '2019-06-03 03:12:13');
INSERT INTO `dramascore` VALUES ('315', '183', '1', '2', '0', '0', '0', '2019-02-11 20:50:50', '2019-02-11 20:50:51');
INSERT INTO `dramascore` VALUES ('317', '10551', '2', '27', '0', '0', '1', '2019-02-11 21:08:25', '2019-06-12 09:59:43');
INSERT INTO `dramascore` VALUES ('319', '83838', '2', '1', '0', '0', '0', '2019-02-12 08:26:51', '2019-02-12 08:26:51');
INSERT INTO `dramascore` VALUES ('321', '11359', '2', '12', '0', '1', '0', '2019-02-12 08:27:32', '2019-06-03 07:53:32');
INSERT INTO `dramascore` VALUES ('323', '10575', '2', '2', '1', '0', '0', '2019-02-12 09:38:03', '2019-05-12 14:24:19');
INSERT INTO `dramascore` VALUES ('325', '1662', '1', '0', '1', '0', '0', '2019-02-12 10:16:13', '2019-02-12 10:16:13');
INSERT INTO `dramascore` VALUES ('327', '180217', '4', '2', '0', '0', '0', '2019-02-12 19:50:38', '2019-04-08 01:42:17');
INSERT INTO `dramascore` VALUES ('329', '163390', '1', '1', '0', '0', '0', '2019-02-13 07:45:57', '2019-02-13 07:45:57');
INSERT INTO `dramascore` VALUES ('331', '10880', '4', '5', '0', '0', '0', '2019-02-13 09:25:17', '2019-05-25 08:02:41');
INSERT INTO `dramascore` VALUES ('333', '245155', '1', '11', '1', '2', '39', '2019-02-14 14:07:21', '2019-06-02 19:06:23');
INSERT INTO `dramascore` VALUES ('335', '229433', '1', '20', '0', '0', '0', '2019-02-14 14:59:42', '2019-06-11 12:36:02');
INSERT INTO `dramascore` VALUES ('337', '10818', '4', '3', '1', '0', '0', '2019-02-14 22:07:06', '2019-05-26 05:21:55');
INSERT INTO `dramascore` VALUES ('339', '248321', '1', '4', '0', '0', '1', '2019-02-15 03:43:29', '2019-06-11 09:34:09');
INSERT INTO `dramascore` VALUES ('341', '180154', '4', '4', '0', '0', '0', '2019-02-15 03:59:47', '2019-05-07 10:41:45');
INSERT INTO `dramascore` VALUES ('343', '181450', '4', '2', '0', '0', '0', '2019-02-15 04:08:58', '2019-05-01 00:36:40');
INSERT INTO `dramascore` VALUES ('345', '181429', '4', '3', '0', '0', '0', '2019-02-15 04:09:16', '2019-05-01 00:36:23');
INSERT INTO `dramascore` VALUES ('347', '181310', '4', '2', '0', '0', '0', '2019-02-15 04:09:32', '2019-05-07 10:40:05');
INSERT INTO `dramascore` VALUES ('349', '181329', '4', '2', '0', '0', '0', '2019-02-15 04:09:45', '2019-04-04 11:11:50');
INSERT INTO `dramascore` VALUES ('351', '181311', '4', '5', '0', '0', '0', '2019-02-15 04:09:53', '2019-06-08 12:49:33');
INSERT INTO `dramascore` VALUES ('353', '181095', '4', '6', '0', '0', '0', '2019-02-15 04:10:45', '2019-05-31 02:55:14');
INSERT INTO `dramascore` VALUES ('355', '179802', '4', '42', '1', '0', '37', '2019-02-15 04:11:50', '2019-06-10 07:38:55');
INSERT INTO `dramascore` VALUES ('357', '10621', '4', '4', '0', '0', '0', '2019-02-15 04:13:23', '2019-06-11 02:29:42');
INSERT INTO `dramascore` VALUES ('359', '10660', '4', '85', '1', '0', '1', '2019-02-15 04:14:00', '2019-06-06 10:42:15');
INSERT INTO `dramascore` VALUES ('361', '10823', '4', '4', '0', '0', '0', '2019-02-15 04:14:43', '2019-05-07 10:49:25');
INSERT INTO `dramascore` VALUES ('363', '10866', '4', '5', '0', '0', '1', '2019-02-15 04:15:06', '2019-05-26 04:54:54');
INSERT INTO `dramascore` VALUES ('365', '44896', '4', '4', '0', '0', '0', '2019-02-15 04:17:43', '2019-05-07 10:54:56');
INSERT INTO `dramascore` VALUES ('367', '10415', '2', '5', '0', '0', '1', '2019-02-15 06:08:19', '2019-05-12 06:45:47');
INSERT INTO `dramascore` VALUES ('369', '159957', '1', '4', '1', '0', '0', '2019-02-15 08:27:33', '2019-05-05 03:47:07');
INSERT INTO `dramascore` VALUES ('371', '10879', '4', '9', '0', '0', '0', '2019-02-15 11:31:42', '2019-06-08 06:58:33');
INSERT INTO `dramascore` VALUES ('373', '542', '1', '3', '1', '0', '0', '2019-02-15 20:48:19', '2019-05-02 02:39:04');
INSERT INTO `dramascore` VALUES ('375', '53390', '1', '4', '0', '0', '3', '2019-02-16 08:07:26', '2019-05-24 19:59:17');
INSERT INTO `dramascore` VALUES ('377', '77673', '1', '14', '0', '1', '0', '2019-02-16 14:04:10', '2019-06-06 07:36:35');
INSERT INTO `dramascore` VALUES ('379', '522', '1', '1', '0', '0', '0', '2019-02-16 14:35:00', '2019-02-16 14:35:00');
INSERT INTO `dramascore` VALUES ('381', '11533', '4', '2', '0', '0', '0', '2019-02-16 20:17:41', '2019-03-14 08:34:40');
INSERT INTO `dramascore` VALUES ('383', '11346', '2', '4', '1', '2', '0', '2019-02-16 20:18:23', '2019-05-20 18:46:16');
INSERT INTO `dramascore` VALUES ('385', '67781', '2', '18', '0', '0', '1', '2019-02-17 15:11:39', '2019-06-12 03:28:57');
INSERT INTO `dramascore` VALUES ('387', '265479', '1', '16', '0', '3', '6', '2019-02-17 19:51:38', '2019-06-01 12:38:20');
INSERT INTO `dramascore` VALUES ('389', '265499', '1', '16', '3', '0', '1', '2019-02-17 19:54:47', '2019-05-27 05:53:03');
INSERT INTO `dramascore` VALUES ('391', '268097', '1', '10', '1', '0', '2', '2019-02-17 21:53:34', '2019-06-08 03:56:18');
INSERT INTO `dramascore` VALUES ('393', '168763', '2', '5', '0', '0', '1', '2019-02-17 22:14:52', '2019-06-12 07:31:03');
INSERT INTO `dramascore` VALUES ('395', '157946', '1', '1', '0', '0', '0', '2019-02-18 00:22:42', '2019-02-18 00:22:42');
INSERT INTO `dramascore` VALUES ('397', '10368', '2', '0', '0', '0', '2', '2019-02-18 16:31:06', '2019-04-03 11:31:37');
INSERT INTO `dramascore` VALUES ('399', '11342', '2', '8', '0', '0', '0', '2019-02-18 16:32:28', '2019-05-13 21:46:09');
INSERT INTO `dramascore` VALUES ('401', '10259', '2', '2', '0', '1', '0', '2019-02-18 17:27:20', '2019-05-18 06:41:46');
INSERT INTO `dramascore` VALUES ('403', '162580', '1', '4', '0', '0', '0', '2019-02-18 18:04:22', '2019-05-12 08:34:55');
INSERT INTO `dramascore` VALUES ('405', '190153', '1', '3', '1', '0', '0', '2019-02-18 18:09:11', '2019-05-18 09:47:18');
INSERT INTO `dramascore` VALUES ('407', '165051', '1', '1', '1', '0', '0', '2019-02-18 18:09:19', '2019-02-28 20:07:43');
INSERT INTO `dramascore` VALUES ('409', '53335', '1', '3', '0', '0', '1', '2019-02-18 18:42:25', '2019-06-07 08:53:38');
INSERT INTO `dramascore` VALUES ('411', '96', '1', '2', '0', '0', '0', '2019-02-18 22:03:27', '2019-03-02 11:03:15');
INSERT INTO `dramascore` VALUES ('413', '157808', '1', '4', '0', '1', '0', '2019-02-19 15:05:04', '2019-05-30 05:32:29');
INSERT INTO `dramascore` VALUES ('415', '154270', '1', '1', '0', '0', '0', '2019-02-19 16:18:29', '2019-02-19 16:18:29');
INSERT INTO `dramascore` VALUES ('417', '146416', '1', '2', '0', '0', '0', '2019-02-19 21:12:44', '2019-03-26 18:19:00');
INSERT INTO `dramascore` VALUES ('419', '268057', '1', '1', '1', '0', '0', '2019-02-20 01:50:45', '2019-03-24 15:34:32');
INSERT INTO `dramascore` VALUES ('421', '159325', '1', '4', '0', '0', '0', '2019-02-20 08:28:59', '2019-05-24 23:47:13');
INSERT INTO `dramascore` VALUES ('423', '269355', '1', '13', '0', '1', '0', '2019-02-20 09:03:35', '2019-05-19 07:26:21');
INSERT INTO `dramascore` VALUES ('425', '114153', '1', '6', '0', '0', '0', '2019-02-20 09:20:03', '2019-06-04 08:46:11');
INSERT INTO `dramascore` VALUES ('427', '10553', '2', '107', '0', '4', '1', '2019-02-20 17:28:43', '2019-06-13 10:50:06');
INSERT INTO `dramascore` VALUES ('429', '268109', '1', '1', '0', '0', '0', '2019-02-21 11:24:11', '2019-02-21 11:24:11');
INSERT INTO `dramascore` VALUES ('431', '213890', '2', '15', '2', '0', '0', '2019-02-21 14:48:52', '2019-06-12 11:29:26');
INSERT INTO `dramascore` VALUES ('433', '11368', '2', '3', '1', '1', '5', '2019-02-21 15:34:33', '2019-06-09 18:39:24');
INSERT INTO `dramascore` VALUES ('435', '154750', '1', '0', '0', '0', '1', '2019-02-21 17:23:09', '2019-02-21 17:23:09');
INSERT INTO `dramascore` VALUES ('437', '38874', '2', '5', '0', '0', '0', '2019-02-21 18:28:55', '2019-05-06 01:56:46');
INSERT INTO `dramascore` VALUES ('439', '35379', '2', '1', '0', '1', '0', '2019-02-21 18:30:35', '2019-04-22 08:55:39');
INSERT INTO `dramascore` VALUES ('441', '11982', '2', '98', '5', '2', '0', '2019-02-21 18:32:28', '2019-06-11 08:06:57');
INSERT INTO `dramascore` VALUES ('443', '10540', '2', '2', '1', '0', '0', '2019-02-21 18:33:57', '2019-05-26 10:01:00');
INSERT INTO `dramascore` VALUES ('445', '167474', '2', '2', '0', '0', '1', '2019-02-21 18:36:08', '2019-04-28 18:36:01');
INSERT INTO `dramascore` VALUES ('447', '211', '1', '2', '1', '1', '0', '2019-02-21 18:37:41', '2019-06-01 07:14:12');
INSERT INTO `dramascore` VALUES ('449', '414', '1', '4', '0', '0', '1', '2019-02-22 06:25:29', '2019-06-13 07:14:08');
INSERT INTO `dramascore` VALUES ('451', '267953', '1', '25', '2', '0', '2', '2019-02-22 07:10:52', '2019-05-28 01:52:35');
INSERT INTO `dramascore` VALUES ('453', '467', '1', '16', '7', '3', '2', '2019-02-22 09:02:06', '2019-06-13 02:00:41');
INSERT INTO `dramascore` VALUES ('455', '11372', '2', '24', '1', '0', '1', '2019-02-22 11:04:41', '2019-06-12 23:00:14');
INSERT INTO `dramascore` VALUES ('457', '11050', '1', '1', '0', '0', '0', '2019-02-22 16:22:50', '2019-02-22 16:22:50');
INSERT INTO `dramascore` VALUES ('459', '10469', '2', '2', '0', '0', '0', '2019-02-22 17:47:24', '2019-05-10 10:29:28');
INSERT INTO `dramascore` VALUES ('461', '248413', '2', '36', '5', '4', '1', '2019-02-22 20:05:07', '2019-06-12 08:16:00');
INSERT INTO `dramascore` VALUES ('463', '10453', '2', '1', '2', '0', '1', '2019-02-23 15:17:29', '2019-05-09 08:30:22');
INSERT INTO `dramascore` VALUES ('465', '180178', '4', '1', '0', '0', '0', '2019-02-23 16:24:25', '2019-02-23 16:24:25');
INSERT INTO `dramascore` VALUES ('467', '162172', '1', '2', '0', '0', '1', '2019-02-23 19:00:36', '2019-06-08 10:13:15');
INSERT INTO `dramascore` VALUES ('469', '10961', '1', '11', '1', '1', '2', '2019-02-23 20:33:12', '2019-06-04 03:19:44');
INSERT INTO `dramascore` VALUES ('471', '229419', '1', '4', '2', '1', '0', '2019-02-23 20:36:11', '2019-03-26 21:05:48');
INSERT INTO `dramascore` VALUES ('473', '285809', '1', '5', '1', '0', '0', '2019-02-23 20:47:35', '2019-03-02 20:49:46');
INSERT INTO `dramascore` VALUES ('475', '209905', '1', '3', '0', '1', '0', '2019-02-23 21:34:00', '2019-06-01 01:43:23');
INSERT INTO `dramascore` VALUES ('477', '157648', '1', '0', '0', '0', '1', '2019-02-23 21:34:18', '2019-02-23 21:34:18');
INSERT INTO `dramascore` VALUES ('479', '159635', '1', '1', '0', '0', '0', '2019-02-23 21:56:36', '2019-02-23 21:56:36');
INSERT INTO `dramascore` VALUES ('481', '86733', '1', '5', '0', '0', '0', '2019-02-23 22:16:15', '2019-06-08 11:40:35');
INSERT INTO `dramascore` VALUES ('483', '86307', '2', '7', '0', '0', '0', '2019-02-23 23:44:00', '2019-06-13 09:28:20');
INSERT INTO `dramascore` VALUES ('485', '285989', '1', '9', '2', '1', '2', '2019-02-24 09:54:44', '2019-06-08 11:52:33');
INSERT INTO `dramascore` VALUES ('487', '285685', '1', '3', '1', '0', '4', '2019-02-24 11:56:53', '2019-05-03 20:58:46');
INSERT INTO `dramascore` VALUES ('489', '182346', '4', '3', '0', '0', '0', '2019-02-24 12:06:28', '2019-03-22 00:21:29');
INSERT INTO `dramascore` VALUES ('491', '11127', '1', '0', '0', '0', '1', '2019-02-24 12:54:36', '2019-02-24 12:54:36');
INSERT INTO `dramascore` VALUES ('493', '10554', '1', '8', '1', '0', '0', '2019-02-24 13:24:48', '2019-06-03 05:40:44');
INSERT INTO `dramascore` VALUES ('495', '159383', '1', '2', '0', '0', '1', '2019-02-24 14:07:49', '2019-05-24 02:38:02');
INSERT INTO `dramascore` VALUES ('497', '159438', '1', '0', '0', '0', '1', '2019-02-24 14:14:06', '2019-02-24 14:14:06');
INSERT INTO `dramascore` VALUES ('499', '159439', '1', '0', '0', '0', '1', '2019-02-24 14:16:00', '2019-02-24 14:16:00');
INSERT INTO `dramascore` VALUES ('501', '158360', '1', '0', '0', '0', '1', '2019-02-24 14:19:55', '2019-02-24 14:19:55');
INSERT INTO `dramascore` VALUES ('503', '158356', '1', '0', '0', '0', '1', '2019-02-24 14:26:53', '2019-02-24 14:26:53');
INSERT INTO `dramascore` VALUES ('505', '267999', '1', '1', '0', '0', '0', '2019-02-24 14:27:36', '2019-02-24 14:27:36');
INSERT INTO `dramascore` VALUES ('507', '265493', '1', '2', '0', '0', '1', '2019-02-24 14:32:56', '2019-05-06 23:35:43');
INSERT INTO `dramascore` VALUES ('509', '285745', '1', '3', '0', '0', '47', '2019-02-24 14:53:27', '2019-05-17 09:26:45');
INSERT INTO `dramascore` VALUES ('511', '285695', '1', '2', '1', '0', '0', '2019-02-24 15:45:10', '2019-03-24 20:56:46');
INSERT INTO `dramascore` VALUES ('513', '158327', '1', '1', '1', '0', '0', '2019-02-24 16:19:07', '2019-04-02 06:11:25');
INSERT INTO `dramascore` VALUES ('515', '158326', '1', '0', '1', '0', '1', '2019-02-24 16:30:05', '2019-06-10 04:39:11');
INSERT INTO `dramascore` VALUES ('517', '285655', '1', '16', '2', '0', '34', '2019-02-24 16:34:44', '2019-05-20 10:19:02');
INSERT INTO `dramascore` VALUES ('519', '154485', '1', '0', '0', '0', '1', '2019-02-24 16:38:13', '2019-02-24 16:38:13');
INSERT INTO `dramascore` VALUES ('521', '161994', '1', '0', '0', '0', '1', '2019-02-24 16:48:06', '2019-02-24 16:48:06');
INSERT INTO `dramascore` VALUES ('523', '159656', '1', '2', '0', '0', '0', '2019-02-24 18:16:00', '2019-04-21 02:43:07');
INSERT INTO `dramascore` VALUES ('525', '196575', '1', '9', '0', '0', '2', '2019-02-24 19:03:53', '2019-05-31 08:20:45');
INSERT INTO `dramascore` VALUES ('527', '245021', '1', '0', '0', '0', '2', '2019-02-24 19:04:52', '2019-03-27 14:26:48');
INSERT INTO `dramascore` VALUES ('529', '247549', '1', '17', '2', '0', '0', '2019-02-24 19:09:54', '2019-06-07 17:25:08');
INSERT INTO `dramascore` VALUES ('531', '247555', '1', '21', '1', '1', '3', '2019-02-24 19:10:07', '2019-05-18 10:31:33');
INSERT INTO `dramascore` VALUES ('533', '247587', '1', '2', '0', '0', '1', '2019-02-24 19:10:39', '2019-03-11 23:26:12');
INSERT INTO `dramascore` VALUES ('535', '161151', '1', '1', '0', '0', '1', '2019-02-24 19:10:49', '2019-02-27 20:04:21');
INSERT INTO `dramascore` VALUES ('537', '247557', '1', '11', '0', '0', '2', '2019-02-24 19:11:02', '2019-05-18 10:31:41');
INSERT INTO `dramascore` VALUES ('539', '285531', '1', '1', '0', '0', '1', '2019-02-24 20:11:19', '2019-03-01 20:36:25');
INSERT INTO `dramascore` VALUES ('541', '158348', '1', '1', '0', '0', '0', '2019-02-24 21:52:54', '2019-02-24 21:52:54');
INSERT INTO `dramascore` VALUES ('543', '146419', '1', '4', '1', '0', '0', '2019-02-25 08:39:57', '2019-06-01 00:46:13');
INSERT INTO `dramascore` VALUES ('545', '285817', '4', '11', '0', '0', '1', '2019-02-25 10:49:21', '2019-05-23 15:12:52');
INSERT INTO `dramascore` VALUES ('547', '196748', '1', '7', '0', '0', '1', '2019-02-25 17:39:22', '2019-05-29 12:07:13');
INSERT INTO `dramascore` VALUES ('549', '285489', '2', '18', '1', '0', '4', '2019-02-25 18:34:57', '2019-06-07 22:45:31');
INSERT INTO `dramascore` VALUES ('551', '285563', '1', '2', '1', '1', '3', '2019-02-25 20:00:33', '2019-05-06 21:16:41');
INSERT INTO `dramascore` VALUES ('553', '160183', '1', '2', '0', '0', '0', '2019-02-27 00:01:41', '2019-04-11 19:15:57');
INSERT INTO `dramascore` VALUES ('555', '10971', '1', '14', '1', '0', '0', '2019-02-27 12:52:15', '2019-06-09 11:38:25');
INSERT INTO `dramascore` VALUES ('557', '285649', '1', '0', '2', '0', '0', '2019-02-27 13:10:14', '2019-03-16 13:26:16');
INSERT INTO `dramascore` VALUES ('559', '158598', '1', '0', '0', '1', '0', '2019-02-27 16:21:52', '2019-02-27 16:21:52');
INSERT INTO `dramascore` VALUES ('561', '161347', '1', '0', '1', '1', '0', '2019-02-27 19:00:03', '2019-06-04 11:42:21');
INSERT INTO `dramascore` VALUES ('563', '53518', '1', '1', '1', '0', '0', '2019-02-27 19:59:49', '2019-03-11 20:47:13');
INSERT INTO `dramascore` VALUES ('565', '53063', '1', '1', '0', '0', '0', '2019-02-27 19:59:58', '2019-02-27 19:59:58');
INSERT INTO `dramascore` VALUES ('567', '163657', '1', '1', '0', '0', '1', '2019-02-27 20:01:00', '2019-04-07 04:09:45');
INSERT INTO `dramascore` VALUES ('569', '159958', '1', '1', '0', '0', '0', '2019-02-27 21:19:32', '2019-02-27 21:19:32');
INSERT INTO `dramascore` VALUES ('571', '159956', '1', '1', '0', '0', '0', '2019-02-27 22:50:30', '2019-02-27 22:50:30');
INSERT INTO `dramascore` VALUES ('573', '10862', '4', '4', '0', '0', '0', '2019-02-28 16:03:09', '2019-05-26 22:10:05');
INSERT INTO `dramascore` VALUES ('575', '10411', '2', '1', '0', '1', '0', '2019-02-28 18:51:22', '2019-05-15 09:01:46');
INSERT INTO `dramascore` VALUES ('577', '204768', '1', '28', '3', '1', '1', '2019-02-28 19:02:30', '2019-06-01 10:43:34');
INSERT INTO `dramascore` VALUES ('579', '285601', '1', '0', '0', '2', '0', '2019-02-28 19:46:05', '2019-05-25 03:49:05');
INSERT INTO `dramascore` VALUES ('581', '114231', '1', '0', '2', '0', '1', '2019-02-28 20:06:49', '2019-05-15 08:56:20');
INSERT INTO `dramascore` VALUES ('583', '163651', '1', '1', '0', '0', '0', '2019-02-28 20:58:09', '2019-02-28 20:58:09');
INSERT INTO `dramascore` VALUES ('585', '162319', '1', '1', '0', '0', '0', '2019-02-28 22:43:16', '2019-02-28 22:43:16');
INSERT INTO `dramascore` VALUES ('587', '11371', '2', '2', '0', '0', '1', '2019-02-28 23:32:14', '2019-05-21 13:16:58');
INSERT INTO `dramascore` VALUES ('589', '168711', '1', '4', '0', '2', '2', '2019-03-01 11:38:08', '2019-06-05 13:50:54');
INSERT INTO `dramascore` VALUES ('591', '1761', '1', '1', '0', '0', '0', '2019-03-01 12:49:16', '2019-03-01 12:49:16');
INSERT INTO `dramascore` VALUES ('593', '10525', '1', '3', '0', '0', '0', '2019-03-01 14:25:38', '2019-03-26 16:42:08');
INSERT INTO `dramascore` VALUES ('595', '9622', '2', '1', '0', '0', '0', '2019-03-01 17:48:23', '2019-03-01 17:48:23');
INSERT INTO `dramascore` VALUES ('597', '10562', '2', '1', '0', '0', '0', '2019-03-01 17:51:17', '2019-03-01 17:51:17');
INSERT INTO `dramascore` VALUES ('599', '11375', '2', '22', '1', '0', '1', '2019-03-01 19:20:45', '2019-06-05 07:00:44');
INSERT INTO `dramascore` VALUES ('601', '267905', '1', '0', '1', '0', '0', '2019-03-01 21:21:22', '2019-03-01 21:21:22');
INSERT INTO `dramascore` VALUES ('603', '153149', '1', '3', '0', '0', '0', '2019-03-02 01:08:30', '2019-06-09 19:09:44');
INSERT INTO `dramascore` VALUES ('605', '161962', '1', '1', '1', '0', '1', '2019-03-02 08:36:38', '2019-04-24 18:58:03');
INSERT INTO `dramascore` VALUES ('607', '51539', '1', '1', '0', '0', '0', '2019-03-02 09:53:13', '2019-03-02 09:53:13');
INSERT INTO `dramascore` VALUES ('609', '204397', '1', '2', '1', '0', '0', '2019-03-02 12:54:34', '2019-05-05 12:25:53');
INSERT INTO `dramascore` VALUES ('611', '303221', '1', '0', '0', '1', '0', '2019-03-02 15:10:25', '2019-03-02 15:10:25');
INSERT INTO `dramascore` VALUES ('613', '196595', '1', '1', '0', '0', '1', '2019-03-02 16:14:12', '2019-05-24 20:51:11');
INSERT INTO `dramascore` VALUES ('615', '149696', '1', '1', '0', '0', '0', '2019-03-02 18:48:05', '2019-03-02 18:48:05');
INSERT INTO `dramascore` VALUES ('617', '103039', '1', '5', '0', '0', '0', '2019-03-02 20:18:16', '2019-05-05 04:45:07');
INSERT INTO `dramascore` VALUES ('619', '303373', '1', '38', '1', '4', '2', '2019-03-02 20:45:44', '2019-06-10 05:20:46');
INSERT INTO `dramascore` VALUES ('621', '163682', '1', '4', '0', '1', '1', '2019-03-02 22:02:23', '2019-05-20 06:37:01');
INSERT INTO `dramascore` VALUES ('623', '162561', '1', '4', '1', '0', '0', '2019-03-02 22:02:52', '2019-04-22 02:22:33');
INSERT INTO `dramascore` VALUES ('625', '159520', '1', '1', '0', '0', '1', '2019-03-02 22:04:51', '2019-04-24 22:03:45');
INSERT INTO `dramascore` VALUES ('627', '159382', '1', '2', '0', '0', '0', '2019-03-02 22:05:22', '2019-04-11 19:18:00');
INSERT INTO `dramascore` VALUES ('629', '159175', '1', '1', '0', '0', '0', '2019-03-02 22:05:42', '2019-03-02 22:05:42');
INSERT INTO `dramascore` VALUES ('631', '159200', '1', '1', '0', '0', '0', '2019-03-02 22:06:02', '2019-03-02 22:06:02');
INSERT INTO `dramascore` VALUES ('633', '159202', '1', '2', '0', '0', '0', '2019-03-02 22:06:21', '2019-05-06 11:40:48');
INSERT INTO `dramascore` VALUES ('635', '285715', '1', '4', '1', '0', '0', '2019-03-02 23:35:19', '2019-05-18 02:07:06');
INSERT INTO `dramascore` VALUES ('637', '159356', '1', '7', '0', '0', '0', '2019-03-02 23:55:06', '2019-06-02 18:25:36');
INSERT INTO `dramascore` VALUES ('639', '153936', '1', '1', '0', '0', '1', '2019-03-03 00:00:02', '2019-05-01 10:30:41');
INSERT INTO `dramascore` VALUES ('641', '245231', '1', '1', '1', '0', '0', '2019-03-03 08:47:48', '2019-03-17 20:33:14');
INSERT INTO `dramascore` VALUES ('643', '10917', '2', '63', '1', '1', '0', '2019-03-03 09:00:03', '2019-05-31 10:30:18');
INSERT INTO `dramascore` VALUES ('645', '303817', '1', '7', '0', '0', '4', '2019-03-03 09:56:20', '2019-05-30 06:21:21');
INSERT INTO `dramascore` VALUES ('647', '21623', '2', '12', '0', '0', '0', '2019-03-03 10:36:21', '2019-05-28 09:52:44');
INSERT INTO `dramascore` VALUES ('649', '248241', '1', '0', '1', '0', '1', '2019-03-03 10:53:01', '2019-04-20 05:31:29');
INSERT INTO `dramascore` VALUES ('651', '10863', '4', '1', '0', '0', '1', '2019-03-03 15:18:56', '2019-03-24 12:47:30');
INSERT INTO `dramascore` VALUES ('653', '10852', '4', '3', '0', '0', '0', '2019-03-03 15:19:07', '2019-06-05 08:25:05');
INSERT INTO `dramascore` VALUES ('655', '51277', '1', '1', '0', '0', '1', '2019-03-03 15:40:23', '2019-05-26 17:48:41');
INSERT INTO `dramascore` VALUES ('657', '303277', '1', '3', '0', '0', '0', '2019-03-03 15:46:07', '2019-03-16 21:03:10');
INSERT INTO `dramascore` VALUES ('659', '303307', '1', '6', '0', '2', '5', '2019-03-03 15:48:04', '2019-06-04 10:58:53');
INSERT INTO `dramascore` VALUES ('661', '303937', '1', '27', '0', '0', '0', '2019-03-03 16:12:06', '2019-06-13 08:18:05');
INSERT INTO `dramascore` VALUES ('663', '303829', '1', '2', '0', '0', '2', '2019-03-03 18:24:18', '2019-03-23 09:54:29');
INSERT INTO `dramascore` VALUES ('665', '154668', '1', '0', '0', '0', '1', '2019-03-03 19:29:10', '2019-03-03 19:29:10');
INSERT INTO `dramascore` VALUES ('667', '149823', '1', '0', '0', '0', '1', '2019-03-03 20:11:19', '2019-03-03 20:11:19');
INSERT INTO `dramascore` VALUES ('669', '303903', '1', '6', '0', '1', '1', '2019-03-03 20:45:54', '2019-06-12 12:12:39');
INSERT INTO `dramascore` VALUES ('671', '303337', '1', '30', '7', '6', '6', '2019-03-03 22:14:14', '2019-05-21 23:58:14');
INSERT INTO `dramascore` VALUES ('673', '328', '1', '6', '0', '0', '0', '2019-03-03 22:29:22', '2019-05-18 09:39:19');
INSERT INTO `dramascore` VALUES ('675', '163246', '1', '2', '0', '0', '2', '2019-03-04 00:28:29', '2019-04-14 02:45:49');
INSERT INTO `dramascore` VALUES ('677', '190219', '1', '2', '0', '0', '0', '2019-03-04 01:32:36', '2019-05-31 08:24:32');
INSERT INTO `dramascore` VALUES ('679', '306545', '1', '23', '0', '1', '2', '2019-03-04 07:24:49', '2019-06-04 06:36:49');
INSERT INTO `dramascore` VALUES ('681', '204749', '1', '0', '0', '1', '1', '2019-03-04 08:52:24', '2019-03-04 08:52:38');
INSERT INTO `dramascore` VALUES ('683', '190187', '1', '4', '0', '0', '2', '2019-03-04 08:53:27', '2019-04-07 04:38:47');
INSERT INTO `dramascore` VALUES ('685', '167062', '1', '1', '0', '1', '0', '2019-03-04 08:55:18', '2019-03-04 18:50:11');
INSERT INTO `dramascore` VALUES ('687', '111897', '1', '3', '0', '1', '0', '2019-03-04 10:47:31', '2019-05-15 02:26:54');
INSERT INTO `dramascore` VALUES ('689', '306531', '1', '1', '0', '0', '1', '2019-03-04 11:10:53', '2019-03-04 20:41:39');
INSERT INTO `dramascore` VALUES ('691', '158021', '1', '1', '1', '0', '1', '2019-03-04 11:14:13', '2019-04-15 02:15:27');
INSERT INTO `dramascore` VALUES ('693', '159890', '1', '8', '1', '1', '2', '2019-03-04 12:44:02', '2019-06-11 06:05:53');
INSERT INTO `dramascore` VALUES ('695', '303869', '1', '18', '1', '3', '5', '2019-03-04 13:12:40', '2019-06-13 08:53:43');
INSERT INTO `dramascore` VALUES ('697', '306449', '1', '6', '4', '2', '3', '2019-03-04 16:35:00', '2019-05-27 07:34:23');
INSERT INTO `dramascore` VALUES ('699', '306473', '1', '45', '3', '1', '3', '2019-03-04 16:35:14', '2019-06-11 07:45:35');
INSERT INTO `dramascore` VALUES ('701', '77682', '1', '2', '0', '0', '0', '2019-03-04 16:47:39', '2019-03-22 22:33:23');
INSERT INTO `dramascore` VALUES ('703', '306463', '1', '2', '0', '2', '1', '2019-03-04 18:14:33', '2019-05-19 06:49:27');
INSERT INTO `dramascore` VALUES ('705', '245137', '1', '1', '0', '1', '1', '2019-03-04 18:41:21', '2019-06-05 10:36:02');
INSERT INTO `dramascore` VALUES ('707', '114238', '1', '0', '3', '0', '0', '2019-03-04 18:51:50', '2019-05-21 06:34:27');
INSERT INTO `dramascore` VALUES ('709', '100029', '1', '8', '1', '1', '1', '2019-03-04 18:52:05', '2019-06-05 05:12:14');
INSERT INTO `dramascore` VALUES ('711', '303915', '1', '10', '1', '2', '2', '2019-03-04 20:11:18', '2019-05-11 22:52:43');
INSERT INTO `dramascore` VALUES ('713', '306479', '1', '7', '1', '0', '1', '2019-03-04 20:16:29', '2019-06-09 04:52:54');
INSERT INTO `dramascore` VALUES ('715', '303189', '1', '17', '1', '0', '2', '2019-03-04 20:17:28', '2019-06-13 08:54:06');
INSERT INTO `dramascore` VALUES ('717', '303203', '1', '0', '1', '0', '2', '2019-03-04 20:37:37', '2019-03-20 15:36:40');
INSERT INTO `dramascore` VALUES ('719', '10522', '1', '1', '0', '0', '0', '2019-03-04 22:59:40', '2019-03-04 22:59:40');
INSERT INTO `dramascore` VALUES ('721', '11209', '1', '6', '1', '1', '0', '2019-03-05 06:49:28', '2019-06-12 22:12:42');
INSERT INTO `dramascore` VALUES ('723', '89107', '1', '1', '0', '0', '0', '2019-03-05 07:10:07', '2019-03-05 07:10:07');
INSERT INTO `dramascore` VALUES ('725', '303357', '1', '3', '0', '0', '0', '2019-03-05 09:36:34', '2019-06-13 08:53:52');
INSERT INTO `dramascore` VALUES ('727', '245117', '1', '0', '0', '0', '1', '2019-03-05 12:02:25', '2019-03-05 12:02:25');
INSERT INTO `dramascore` VALUES ('729', '11528', '4', '9', '0', '0', '0', '2019-03-05 12:32:01', '2019-06-12 11:37:25');
INSERT INTO `dramascore` VALUES ('731', '157575', '1', '0', '0', '0', '1', '2019-03-05 14:21:39', '2019-03-05 14:21:39');
INSERT INTO `dramascore` VALUES ('733', '153326', '1', '1', '0', '0', '0', '2019-03-05 15:58:19', '2019-03-05 15:58:19');
INSERT INTO `dramascore` VALUES ('735', '303197', '1', '4', '0', '0', '0', '2019-03-05 16:28:26', '2019-03-16 21:03:43');
INSERT INTO `dramascore` VALUES ('737', '545', '1', '5', '0', '0', '2', '2019-03-05 16:40:10', '2019-06-08 08:57:48');
INSERT INTO `dramascore` VALUES ('739', '153192', '1', '1', '1', '0', '0', '2019-03-05 20:24:01', '2019-05-08 20:38:15');
INSERT INTO `dramascore` VALUES ('741', '163625', '1', '8', '0', '0', '0', '2019-03-05 20:24:25', '2019-06-10 10:31:32');
INSERT INTO `dramascore` VALUES ('743', '11362', '2', '4', '0', '0', '0', '2019-03-06 01:16:16', '2019-03-21 14:36:11');
INSERT INTO `dramascore` VALUES ('745', '10310', '2', '2', '0', '0', '0', '2019-03-06 09:58:18', '2019-04-14 10:55:57');
INSERT INTO `dramascore` VALUES ('747', '163725', '1', '1', '0', '0', '0', '2019-03-06 10:05:34', '2019-03-06 10:05:34');
INSERT INTO `dramascore` VALUES ('749', '159900', '1', '0', '0', '0', '1', '2019-03-06 18:12:23', '2019-03-06 18:12:23');
INSERT INTO `dramascore` VALUES ('751', '285759', '1', '1', '1', '0', '0', '2019-03-06 20:31:37', '2019-04-20 04:21:50');
INSERT INTO `dramascore` VALUES ('753', '161059', '1', '1', '0', '0', '0', '2019-03-06 22:48:08', '2019-03-06 22:48:08');
INSERT INTO `dramascore` VALUES ('755', '158131', '1', '3', '1', '0', '1', '2019-03-06 22:51:37', '2019-05-30 04:39:36');
INSERT INTO `dramascore` VALUES ('757', '158069', '1', '2', '0', '0', '0', '2019-03-06 22:51:57', '2019-06-10 03:09:51');
INSERT INTO `dramascore` VALUES ('759', '158000', '1', '3', '0', '0', '1', '2019-03-06 22:52:26', '2019-03-31 02:58:01');
INSERT INTO `dramascore` VALUES ('761', '245185', '1', '5', '0', '0', '0', '2019-03-06 22:54:38', '2019-06-03 05:48:02');
INSERT INTO `dramascore` VALUES ('763', '16', '1', '1', '0', '0', '0', '2019-03-07 21:20:21', '2019-03-07 21:20:21');
INSERT INTO `dramascore` VALUES ('765', '68585', '4', '5', '1', '0', '5', '2019-03-08 00:09:47', '2019-05-14 00:24:13');
INSERT INTO `dramascore` VALUES ('767', '315739', '2', '478', '7', '7', '30', '2019-03-08 07:44:11', '2019-06-12 22:43:53');
INSERT INTO `dramascore` VALUES ('769', '108912', '2', '4', '0', '1', '0', '2019-03-08 19:26:57', '2019-04-23 08:35:35');
INSERT INTO `dramascore` VALUES ('771', '162579', '1', '1', '0', '0', '0', '2019-03-08 20:54:36', '2019-03-08 20:54:36');
INSERT INTO `dramascore` VALUES ('773', '159619', '1', '0', '0', '0', '1', '2019-03-08 20:58:09', '2019-03-08 20:58:09');
INSERT INTO `dramascore` VALUES ('775', '157644', '1', '1', '2', '0', '0', '2019-03-08 21:14:50', '2019-06-01 13:45:31');
INSERT INTO `dramascore` VALUES ('777', '156725', '1', '3', '0', '0', '0', '2019-03-08 22:48:35', '2019-05-31 03:08:13');
INSERT INTO `dramascore` VALUES ('779', '306429', '1', '4', '0', '0', '1', '2019-03-09 05:07:38', '2019-05-10 12:04:14');
INSERT INTO `dramascore` VALUES ('781', '306465', '1', '1', '1', '0', '0', '2019-03-09 08:34:21', '2019-03-14 08:27:26');
INSERT INTO `dramascore` VALUES ('783', '182399', '4', '4', '0', '0', '2', '2019-03-09 12:38:58', '2019-04-19 00:02:46');
INSERT INTO `dramascore` VALUES ('785', '146235', '2', '1', '2', '0', '0', '2019-03-09 14:06:38', '2019-05-06 05:01:50');
INSERT INTO `dramascore` VALUES ('787', '157958', '1', '2', '0', '0', '0', '2019-03-09 15:32:39', '2019-05-04 10:05:47');
INSERT INTO `dramascore` VALUES ('789', '245297', '1', '2', '0', '0', '1', '2019-03-09 16:30:16', '2019-05-01 08:01:30');
INSERT INTO `dramascore` VALUES ('791', '320399', '1', '3', '0', '0', '1', '2019-03-09 16:40:22', '2019-04-28 14:10:20');
INSERT INTO `dramascore` VALUES ('793', '320523', '1', '2', '2', '0', '9', '2019-03-09 20:25:13', '2019-05-31 12:18:30');
INSERT INTO `dramascore` VALUES ('795', '320415', '1', '4', '0', '0', '1', '2019-03-09 21:37:48', '2019-06-02 09:30:49');
INSERT INTO `dramascore` VALUES ('797', '320463', '1', '10', '1', '1', '1', '2019-03-09 22:14:39', '2019-05-19 07:25:42');
INSERT INTO `dramascore` VALUES ('799', '321589', '1', '14', '3', '0', '0', '2019-03-10 08:24:09', '2019-06-13 08:53:31');
INSERT INTO `dramascore` VALUES ('801', '159889', '1', '5', '1', '0', '0', '2019-03-10 08:39:37', '2019-04-28 09:39:11');
INSERT INTO `dramascore` VALUES ('803', '159510', '1', '1', '0', '0', '1', '2019-03-10 12:43:32', '2019-03-10 12:44:03');
INSERT INTO `dramascore` VALUES ('805', '320563', '1', '21', '3', '0', '0', '2019-03-10 16:11:58', '2019-06-02 09:13:05');
INSERT INTO `dramascore` VALUES ('807', '156636', '1', '1', '0', '0', '0', '2019-03-10 19:15:46', '2019-03-10 19:15:46');
INSERT INTO `dramascore` VALUES ('809', '148065', '1', '0', '0', '0', '1', '2019-03-10 19:17:01', '2019-03-10 19:17:01');
INSERT INTO `dramascore` VALUES ('811', '247529', '1', '5', '0', '0', '0', '2019-03-10 22:21:30', '2019-05-14 07:29:49');
INSERT INTO `dramascore` VALUES ('813', '15512', '1', '1', '1', '0', '0', '2019-03-10 23:14:22', '2019-03-10 23:14:44');
INSERT INTO `dramascore` VALUES ('815', '139876', '2', '7', '0', '0', '0', '2019-03-11 02:27:44', '2019-06-01 09:33:58');
INSERT INTO `dramascore` VALUES ('817', '320405', '1', '11', '0', '1', '6', '2019-03-11 15:57:14', '2019-06-03 10:18:50');
INSERT INTO `dramascore` VALUES ('819', '160944', '1', '0', '0', '0', '1', '2019-03-11 16:42:46', '2019-03-11 16:42:46');
INSERT INTO `dramascore` VALUES ('821', '159887', '1', '4', '0', '0', '1', '2019-03-11 16:44:12', '2019-04-29 10:32:19');
INSERT INTO `dramascore` VALUES ('823', '147826', '1', '0', '1', '0', '0', '2019-03-11 19:14:17', '2019-03-11 19:14:17');
INSERT INTO `dramascore` VALUES ('825', '2142', '1', '1', '0', '0', '1', '2019-03-11 23:33:21', '2019-05-28 02:06:01');
INSERT INTO `dramascore` VALUES ('827', '10365', '2', '1', '0', '0', '0', '2019-03-12 03:55:41', '2019-03-12 03:55:41');
INSERT INTO `dramascore` VALUES ('829', '248361', '2', '13', '1', '0', '0', '2019-03-12 07:57:41', '2019-06-11 07:37:21');
INSERT INTO `dramascore` VALUES ('831', '328583', '2', '7', '1', '0', '1', '2019-03-12 13:46:17', '2019-06-10 03:00:15');
INSERT INTO `dramascore` VALUES ('833', '156040', '1', '3', '0', '0', '0', '2019-03-12 17:45:26', '2019-06-04 00:34:13');
INSERT INTO `dramascore` VALUES ('835', '125270', '1', '3', '0', '0', '0', '2019-03-12 19:52:12', '2019-05-05 03:51:07');
INSERT INTO `dramascore` VALUES ('837', '329247', '2', '7', '1', '0', '2', '2019-03-13 07:00:01', '2019-05-30 02:38:30');
INSERT INTO `dramascore` VALUES ('839', '329165', '2', '5', '1', '0', '2', '2019-03-13 07:00:09', '2019-06-02 22:54:27');
INSERT INTO `dramascore` VALUES ('841', '10978', '1', '1', '0', '0', '0', '2019-03-13 07:03:54', '2019-03-13 07:03:54');
INSERT INTO `dramascore` VALUES ('843', '10594', '2', '2', '0', '0', '0', '2019-03-13 07:04:08', '2019-05-13 04:18:16');
INSERT INTO `dramascore` VALUES ('845', '320479', '1', '3', '0', '0', '3', '2019-03-13 09:25:23', '2019-04-26 06:49:58');
INSERT INTO `dramascore` VALUES ('847', '43750', '4', '1', '0', '0', '0', '2019-03-13 12:17:36', '2019-03-13 12:17:36');
INSERT INTO `dramascore` VALUES ('849', '103045', '1', '3', '0', '0', '0', '2019-03-13 15:09:21', '2019-03-16 20:52:25');
INSERT INTO `dramascore` VALUES ('851', '326041', '1', '3', '1', '0', '2', '2019-03-13 15:45:32', '2019-05-02 03:27:46');
INSERT INTO `dramascore` VALUES ('853', '256', '1', '2', '0', '0', '0', '2019-03-14 00:30:12', '2019-06-02 23:29:53');
INSERT INTO `dramascore` VALUES ('855', '9603', '2', '17', '1', '0', '3', '2019-03-14 08:34:27', '2019-06-12 07:29:20');
INSERT INTO `dramascore` VALUES ('857', '10539', '2', '4', '1', '0', '1', '2019-03-14 08:35:31', '2019-06-10 18:52:25');
INSERT INTO `dramascore` VALUES ('859', '10235', '2', '2', '0', '0', '0', '2019-03-14 08:35:43', '2019-05-28 01:23:52');
INSERT INTO `dramascore` VALUES ('861', '15176', '1', '1', '0', '0', '0', '2019-03-14 14:42:58', '2019-03-14 14:42:58');
INSERT INTO `dramascore` VALUES ('863', '285701', '1', '0', '0', '0', '2', '2019-03-14 15:25:23', '2019-04-12 07:05:57');
INSERT INTO `dramascore` VALUES ('865', '125330', '1', '0', '0', '1', '0', '2019-03-14 17:46:27', '2019-03-14 17:46:27');
INSERT INTO `dramascore` VALUES ('867', '333203', '1', '2', '0', '0', '0', '2019-03-14 18:25:53', '2019-03-15 23:49:11');
INSERT INTO `dramascore` VALUES ('869', '334479', '1', '21', '4', '3', '8', '2019-03-14 21:35:04', '2019-05-31 12:18:51');
INSERT INTO `dramascore` VALUES ('871', '334533', '1', '1', '0', '0', '0', '2019-03-14 21:48:09', '2019-03-14 21:48:09');
INSERT INTO `dramascore` VALUES ('873', '158231', '1', '0', '0', '1', '1', '2019-03-14 21:51:24', '2019-03-14 22:53:49');
INSERT INTO `dramascore` VALUES ('875', '15514', '1', '2', '0', '0', '0', '2019-03-14 22:27:30', '2019-05-24 07:02:26');
INSERT INTO `dramascore` VALUES ('877', '329', '1', '4', '0', '0', '0', '2019-03-14 22:30:25', '2019-04-18 00:51:10');
INSERT INTO `dramascore` VALUES ('879', '160995', '1', '2', '0', '0', '0', '2019-03-14 23:31:28', '2019-05-18 01:04:46');
INSERT INTO `dramascore` VALUES ('881', '11352', '2', '2', '1', '0', '0', '2019-03-15 03:04:38', '2019-05-10 10:25:27');
INSERT INTO `dramascore` VALUES ('883', '335685', '1', '5', '0', '0', '0', '2019-03-15 04:27:57', '2019-03-15 22:49:08');
INSERT INTO `dramascore` VALUES ('885', '108848', '2', '1', '1', '0', '0', '2019-03-15 09:07:32', '2019-05-03 10:21:56');
INSERT INTO `dramascore` VALUES ('887', '332305', '2', '12', '1', '0', '0', '2019-03-15 09:08:04', '2019-05-13 12:43:02');
INSERT INTO `dramascore` VALUES ('889', '335509', '1', '1', '0', '0', '0', '2019-03-15 09:08:09', '2019-03-15 09:08:09');
INSERT INTO `dramascore` VALUES ('891', '144889', '2', '6', '0', '0', '0', '2019-03-15 09:11:07', '2019-03-20 14:34:25');
INSERT INTO `dramascore` VALUES ('893', '142684', '2', '10', '2', '0', '2', '2019-03-15 09:11:43', '2019-05-20 02:24:41');
INSERT INTO `dramascore` VALUES ('895', '141368', '2', '2', '0', '0', '0', '2019-03-15 09:11:57', '2019-05-01 09:29:36');
INSERT INTO `dramascore` VALUES ('897', '334529', '1', '0', '0', '1', '0', '2019-03-15 14:46:18', '2019-03-15 14:46:18');
INSERT INTO `dramascore` VALUES ('899', '160997', '1', '1', '0', '0', '1', '2019-03-15 14:52:52', '2019-05-07 05:02:45');
INSERT INTO `dramascore` VALUES ('901', '326139', '2', '6', '1', '1', '4', '2019-03-15 15:05:47', '2019-06-09 19:08:57');
INSERT INTO `dramascore` VALUES ('903', '468', '1', '17', '2', '2', '3', '2019-03-15 18:45:42', '2019-06-10 03:25:40');
INSERT INTO `dramascore` VALUES ('905', '334545', '1', '24', '1', '1', '0', '2019-03-15 18:54:11', '2019-06-12 10:08:03');
INSERT INTO `dramascore` VALUES ('907', '159981', '1', '0', '0', '0', '1', '2019-03-15 19:36:47', '2019-03-15 19:36:47');
INSERT INTO `dramascore` VALUES ('909', '10479', '2', '2', '0', '0', '0', '2019-03-15 21:25:49', '2019-05-19 10:05:10');
INSERT INTO `dramascore` VALUES ('911', '157931', '1', '0', '0', '1', '0', '2019-03-15 21:30:14', '2019-03-15 21:30:14');
INSERT INTO `dramascore` VALUES ('913', '334777', '1', '2', '0', '0', '0', '2019-03-15 22:38:39', '2019-03-16 10:42:40');
INSERT INTO `dramascore` VALUES ('915', '159768', '1', '2', '0', '0', '0', '2019-03-15 22:42:11', '2019-05-20 05:35:45');
INSERT INTO `dramascore` VALUES ('917', '268035', '1', '3', '0', '0', '2', '2019-03-15 22:44:29', '2019-05-14 06:11:06');
INSERT INTO `dramascore` VALUES ('919', '285629', '1', '1', '0', '0', '1', '2019-03-15 22:44:38', '2019-03-26 13:26:39');
INSERT INTO `dramascore` VALUES ('921', '285583', '1', '4', '0', '0', '0', '2019-03-15 22:44:46', '2019-05-12 14:44:41');
INSERT INTO `dramascore` VALUES ('923', '207377', '1', '7', '0', '0', '1', '2019-03-15 22:44:59', '2019-06-04 08:49:48');
INSERT INTO `dramascore` VALUES ('925', '207383', '1', '1', '2', '0', '0', '2019-03-15 22:45:07', '2019-05-22 07:40:37');
INSERT INTO `dramascore` VALUES ('927', '204409', '1', '2', '1', '0', '1', '2019-03-15 22:45:13', '2019-05-14 05:30:15');
INSERT INTO `dramascore` VALUES ('929', '335511', '1', '1', '0', '0', '0', '2019-03-16 01:39:16', '2019-03-16 01:39:16');
INSERT INTO `dramascore` VALUES ('931', '156710', '1', '1', '0', '0', '0', '2019-03-16 04:28:47', '2019-03-16 04:28:47');
INSERT INTO `dramascore` VALUES ('933', '53286', '1', '1', '1', '0', '1', '2019-03-16 04:29:18', '2019-06-02 21:14:38');
INSERT INTO `dramascore` VALUES ('935', '51357', '1', '3', '0', '0', '1', '2019-03-16 04:30:46', '2019-04-04 07:47:00');
INSERT INTO `dramascore` VALUES ('937', '168993', '2', '5', '0', '0', '0', '2019-03-16 04:31:35', '2019-06-04 04:07:52');
INSERT INTO `dramascore` VALUES ('939', '10913', '2', '2', '0', '0', '0', '2019-03-16 04:31:44', '2019-04-27 04:01:18');
INSERT INTO `dramascore` VALUES ('941', '10454', '2', '1', '0', '0', '0', '2019-03-16 04:32:04', '2019-03-16 04:32:04');
INSERT INTO `dramascore` VALUES ('943', '11395', '2', '25', '0', '0', '2', '2019-03-16 04:39:10', '2019-06-13 05:47:19');
INSERT INTO `dramascore` VALUES ('945', '216188', '1', '2', '0', '0', '0', '2019-03-16 08:09:19', '2019-03-16 08:09:20');
INSERT INTO `dramascore` VALUES ('947', '10649', '4', '3', '0', '0', '0', '2019-03-16 09:24:14', '2019-03-23 13:30:26');
INSERT INTO `dramascore` VALUES ('949', '182410', '4', '1', '0', '0', '0', '2019-03-16 09:24:35', '2019-03-16 09:24:35');
INSERT INTO `dramascore` VALUES ('951', '10202', '2', '3', '0', '1', '0', '2019-03-16 10:07:49', '2019-06-03 03:32:49');
INSERT INTO `dramascore` VALUES ('953', '334519', '1', '3', '0', '0', '0', '2019-03-16 11:00:06', '2019-04-18 07:39:51');
INSERT INTO `dramascore` VALUES ('955', '214', '1', '5', '0', '0', '0', '2019-03-16 11:28:30', '2019-06-10 07:27:09');
INSERT INTO `dramascore` VALUES ('957', '334697', '1', '1', '0', '0', '0', '2019-03-16 11:58:56', '2019-03-16 11:58:56');
INSERT INTO `dramascore` VALUES ('959', '11212', '2', '18', '0', '0', '2', '2019-03-16 12:02:46', '2019-06-02 17:38:49');
INSERT INTO `dramascore` VALUES ('961', '157941', '1', '0', '1', '0', '0', '2019-03-16 12:07:50', '2019-03-16 12:07:50');
INSERT INTO `dramascore` VALUES ('963', '334715', '1', '9', '0', '0', '7', '2019-03-16 12:09:28', '2019-05-31 12:18:40');
INSERT INTO `dramascore` VALUES ('965', '159831', '1', '1', '0', '0', '0', '2019-03-16 12:21:12', '2019-03-16 12:21:12');
INSERT INTO `dramascore` VALUES ('967', '158704', '1', '6', '0', '0', '2', '2019-03-16 12:25:53', '2019-06-13 04:37:13');
INSERT INTO `dramascore` VALUES ('969', '148761', '1', '2', '0', '0', '0', '2019-03-16 12:37:32', '2019-05-07 02:09:07');
INSERT INTO `dramascore` VALUES ('971', '306521', '1', '4', '0', '0', '0', '2019-03-16 12:41:05', '2019-06-02 01:06:06');
INSERT INTO `dramascore` VALUES ('973', '369', '1', '1', '0', '0', '0', '2019-03-16 12:42:15', '2019-03-16 12:42:15');
INSERT INTO `dramascore` VALUES ('975', '1921', '1', '4', '2', '2', '2', '2019-03-16 13:16:58', '2019-06-11 07:11:35');
INSERT INTO `dramascore` VALUES ('977', '161032', '1', '1', '0', '0', '0', '2019-03-16 14:14:47', '2019-03-16 14:14:47');
INSERT INTO `dramascore` VALUES ('979', '334843', '1', '1', '0', '0', '1', '2019-03-16 14:33:00', '2019-04-13 12:45:13');
INSERT INTO `dramascore` VALUES ('981', '10433', '2', '1', '0', '0', '1', '2019-03-16 14:33:13', '2019-05-25 23:08:07');
INSERT INTO `dramascore` VALUES ('983', '1824', '1', '2', '0', '0', '1', '2019-03-16 14:44:05', '2019-06-13 03:54:06');
INSERT INTO `dramascore` VALUES ('985', '159322', '1', '1', '0', '1', '0', '2019-03-16 15:06:48', '2019-04-23 07:48:17');
INSERT INTO `dramascore` VALUES ('987', '1282', '1', '0', '0', '1', '0', '2019-03-16 15:37:25', '2019-03-16 15:37:25');
INSERT INTO `dramascore` VALUES ('989', '154', '1', '11', '1', '0', '0', '2019-03-16 16:31:27', '2019-06-09 10:37:19');
INSERT INTO `dramascore` VALUES ('991', '151021', '1', '1', '0', '0', '0', '2019-03-16 16:34:07', '2019-03-16 16:34:07');
INSERT INTO `dramascore` VALUES ('993', '100010', '1', '1', '0', '0', '0', '2019-03-16 18:38:54', '2019-03-16 18:38:54');
INSERT INTO `dramascore` VALUES ('995', '71755', '1', '1', '0', '0', '0', '2019-03-16 18:40:00', '2019-03-16 18:40:00');
INSERT INTO `dramascore` VALUES ('997', '1309', '1', '2', '0', '0', '0', '2019-03-16 19:31:48', '2019-03-16 22:01:50');
INSERT INTO `dramascore` VALUES ('999', '461', '1', '1', '1', '0', '0', '2019-03-16 19:49:50', '2019-05-30 15:12:10');
INSERT INTO `dramascore` VALUES ('1001', '248211', '1', '2', '0', '0', '3', '2019-03-16 19:56:05', '2019-06-10 05:29:16');
INSERT INTO `dramascore` VALUES ('1003', '245217', '1', '2', '0', '0', '1', '2019-03-16 20:28:01', '2019-05-17 22:45:30');
INSERT INTO `dramascore` VALUES ('1005', '340445', '1', '13', '1', '3', '5', '2019-03-16 22:29:20', '2019-06-08 07:35:55');
INSERT INTO `dramascore` VALUES ('1007', '340439', '1', '15', '1', '0', '0', '2019-03-16 22:30:35', '2019-05-25 08:07:39');
INSERT INTO `dramascore` VALUES ('1009', '340419', '1', '2', '1', '0', '2', '2019-03-16 22:33:25', '2019-03-30 17:54:17');
INSERT INTO `dramascore` VALUES ('1011', '340369', '1', '28', '5', '2', '5', '2019-03-16 22:34:14', '2019-06-13 08:53:19');
INSERT INTO `dramascore` VALUES ('1013', '334579', '1', '2', '1', '0', '2', '2019-03-16 22:46:02', '2019-05-17 04:36:08');
INSERT INTO `dramascore` VALUES ('1015', '156442', '1', '1', '0', '0', '2', '2019-03-16 23:09:12', '2019-05-05 03:17:04');
INSERT INTO `dramascore` VALUES ('1017', '10065', '2', '20', '0', '0', '0', '2019-03-17 01:06:18', '2019-06-12 07:06:38');
INSERT INTO `dramascore` VALUES ('1019', '150674', '1', '4', '0', '0', '1', '2019-03-17 04:41:37', '2019-06-07 21:14:10');
INSERT INTO `dramascore` VALUES ('1021', '282', '1', '3', '0', '0', '0', '2019-03-17 07:02:49', '2019-06-03 10:35:38');
INSERT INTO `dramascore` VALUES ('1023', '182392', '4', '0', '1', '0', '0', '2019-03-17 07:51:56', '2019-03-17 07:51:56');
INSERT INTO `dramascore` VALUES ('1025', '340451', '1', '123', '6', '5', '7', '2019-03-17 08:04:28', '2019-06-13 11:48:06');
INSERT INTO `dramascore` VALUES ('1027', '10214', '2', '1', '0', '0', '0', '2019-03-17 08:41:35', '2019-03-17 08:41:35');
INSERT INTO `dramascore` VALUES ('1029', '10544', '2', '8', '0', '0', '0', '2019-03-17 08:55:26', '2019-06-02 04:57:14');
INSERT INTO `dramascore` VALUES ('1031', '245', '1', '1', '0', '0', '0', '2019-03-17 11:37:08', '2019-03-17 11:37:08');
INSERT INTO `dramascore` VALUES ('1033', '340455', '1', '16', '1', '2', '2', '2019-03-17 14:12:51', '2019-05-15 05:34:58');
INSERT INTO `dramascore` VALUES ('1035', '340397', '1', '10', '0', '1', '4', '2019-03-17 14:28:11', '2019-06-12 01:41:23');
INSERT INTO `dramascore` VALUES ('1037', '159902', '1', '1', '1', '0', '1', '2019-03-17 14:46:14', '2019-04-06 06:38:30');
INSERT INTO `dramascore` VALUES ('1039', '1526', '1', '1', '0', '0', '0', '2019-03-17 15:32:43', '2019-03-17 15:32:43');
INSERT INTO `dramascore` VALUES ('1041', '11540', '4', '2', '0', '0', '0', '2019-03-17 15:45:58', '2019-05-17 12:44:25');
INSERT INTO `dramascore` VALUES ('1043', '157514', '1', '0', '1', '0', '0', '2019-03-17 15:49:01', '2019-03-17 15:49:01');
INSERT INTO `dramascore` VALUES ('1045', '109881', '1', '3', '1', '0', '1', '2019-03-17 16:26:56', '2019-04-23 10:40:21');
INSERT INTO `dramascore` VALUES ('1047', '124', '1', '0', '0', '0', '1', '2019-03-17 17:17:23', '2019-03-17 17:17:23');
INSERT INTO `dramascore` VALUES ('1049', '320387', '1', '3', '1', '0', '2', '2019-03-17 17:23:27', '2019-06-07 08:22:22');
INSERT INTO `dramascore` VALUES ('1051', '1851', '1', '1', '0', '1', '0', '2019-03-17 17:35:14', '2019-05-31 07:36:10');
INSERT INTO `dramascore` VALUES ('1053', '196', '1', '2', '0', '0', '0', '2019-03-17 17:36:30', '2019-04-15 09:06:31');
INSERT INTO `dramascore` VALUES ('1055', '213846', '2', '3', '0', '0', '0', '2019-03-17 18:03:02', '2019-06-06 01:22:25');
INSERT INTO `dramascore` VALUES ('1057', '156146', '1', '0', '1', '0', '0', '2019-03-17 19:43:44', '2019-03-17 19:43:44');
INSERT INTO `dramascore` VALUES ('1059', '157810', '1', '3', '0', '0', '0', '2019-03-17 20:06:05', '2019-05-04 22:58:42');
INSERT INTO `dramascore` VALUES ('1061', '340403', '1', '4', '0', '0', '0', '2019-03-17 20:33:10', '2019-04-20 13:30:17');
INSERT INTO `dramascore` VALUES ('1063', '31951', '1', '2', '0', '0', '0', '2019-03-17 20:42:52', '2019-03-25 15:04:53');
INSERT INTO `dramascore` VALUES ('1065', '159071', '1', '2', '0', '0', '0', '2019-03-17 20:45:06', '2019-04-22 01:55:25');
INSERT INTO `dramascore` VALUES ('1067', '2201', '1', '2', '0', '0', '0', '2019-03-17 20:46:02', '2019-06-13 07:57:22');
INSERT INTO `dramascore` VALUES ('1069', '2392', '1', '1', '0', '0', '0', '2019-03-17 20:46:16', '2019-03-17 20:46:16');
INSERT INTO `dramascore` VALUES ('1071', '159798', '1', '1', '0', '0', '0', '2019-03-17 20:46:34', '2019-03-17 20:46:34');
INSERT INTO `dramascore` VALUES ('1073', '21868', '1', '36', '3', '1', '0', '2019-03-17 20:47:53', '2019-06-04 02:15:56');
INSERT INTO `dramascore` VALUES ('1075', '146', '1', '21', '7', '12', '2', '2019-03-17 20:48:01', '2019-06-13 09:25:57');
INSERT INTO `dramascore` VALUES ('1077', '342335', '1', '1', '0', '1', '2', '2019-03-17 21:03:21', '2019-05-16 03:58:21');
INSERT INTO `dramascore` VALUES ('1079', '162519', '1', '1', '1', '0', '0', '2019-03-17 21:13:02', '2019-05-03 10:50:01');
INSERT INTO `dramascore` VALUES ('1081', '37707', '2', '40', '0', '0', '4', '2019-03-17 22:09:51', '2019-06-11 23:33:03');
INSERT INTO `dramascore` VALUES ('1083', '303215', '1', '1', '0', '0', '1', '2019-03-17 22:27:00', '2019-05-19 13:17:38');
INSERT INTO `dramascore` VALUES ('1085', '129087', '2', '3', '1', '0', '1', '2019-03-17 23:04:59', '2019-06-12 06:06:29');
INSERT INTO `dramascore` VALUES ('1087', '89920', '2', '2', '0', '0', '4', '2019-03-17 23:05:10', '2019-06-09 03:49:56');
INSERT INTO `dramascore` VALUES ('1089', '89916', '2', '1', '0', '2', '1', '2019-03-17 23:05:27', '2019-06-09 03:50:13');
INSERT INTO `dramascore` VALUES ('1091', '159600', '1', '1', '0', '0', '0', '2019-03-17 23:52:09', '2019-03-17 23:52:09');
INSERT INTO `dramascore` VALUES ('1093', '10252', '2', '1', '0', '0', '0', '2019-03-17 23:58:39', '2019-03-17 23:58:39');
INSERT INTO `dramascore` VALUES ('1095', '157436', '1', '2', '0', '0', '0', '2019-03-18 01:19:43', '2019-03-19 01:57:03');
INSERT INTO `dramascore` VALUES ('1097', '285663', '1', '2', '0', '0', '1', '2019-03-18 09:42:39', '2019-06-13 08:54:16');
INSERT INTO `dramascore` VALUES ('1099', '159885', '1', '1', '0', '2', '0', '2019-03-18 09:55:03', '2019-06-04 04:52:15');
INSERT INTO `dramascore` VALUES ('1101', '340405', '1', '0', '0', '0', '3', '2019-03-18 09:56:18', '2019-03-31 09:59:18');
INSERT INTO `dramascore` VALUES ('1103', '1001', '1', '2', '0', '0', '0', '2019-03-18 10:18:13', '2019-06-10 07:17:16');
INSERT INTO `dramascore` VALUES ('1105', '20818', '2', '10', '0', '0', '2', '2019-03-18 11:02:56', '2019-05-28 09:44:55');
INSERT INTO `dramascore` VALUES ('1107', '10881', '4', '26', '0', '0', '1', '2019-03-18 11:13:29', '2019-06-07 11:42:35');
INSERT INTO `dramascore` VALUES ('1109', '546', '1', '2', '0', '0', '1', '2019-03-18 13:26:37', '2019-06-06 06:31:45');
INSERT INTO `dramascore` VALUES ('1111', '2455', '1', '3', '0', '0', '1', '2019-03-18 15:17:14', '2019-04-25 04:34:16');
INSERT INTO `dramascore` VALUES ('1113', '159832', '1', '2', '0', '0', '0', '2019-03-18 15:40:12', '2019-04-28 09:40:12');
INSERT INTO `dramascore` VALUES ('1115', '148594', '1', '4', '0', '1', '0', '2019-03-18 15:46:05', '2019-06-04 06:04:13');
INSERT INTO `dramascore` VALUES ('1117', '320299', '1', '5', '0', '0', '0', '2019-03-18 15:48:09', '2019-06-01 03:48:55');
INSERT INTO `dramascore` VALUES ('1119', '320305', '1', '4', '0', '1', '1', '2019-03-18 16:04:10', '2019-05-13 03:53:45');
INSERT INTO `dramascore` VALUES ('1121', '153034', '1', '1', '0', '0', '0', '2019-03-18 16:29:08', '2019-03-18 16:29:08');
INSERT INTO `dramascore` VALUES ('1123', '153032', '1', '1', '0', '0', '0', '2019-03-18 16:29:37', '2019-03-18 16:29:37');
INSERT INTO `dramascore` VALUES ('1125', '159319', '1', '3', '0', '0', '1', '2019-03-18 16:30:24', '2019-05-31 06:13:03');
INSERT INTO `dramascore` VALUES ('1127', '326', '1', '3', '0', '0', '0', '2019-03-18 17:44:19', '2019-03-22 18:48:00');
INSERT INTO `dramascore` VALUES ('1129', '10315', '2', '4', '0', '0', '1', '2019-03-18 17:45:38', '2019-05-15 02:30:57');
INSERT INTO `dramascore` VALUES ('1131', '333209', '1', '1', '0', '0', '0', '2019-03-18 18:50:38', '2019-03-18 18:50:38');
INSERT INTO `dramascore` VALUES ('1133', '251', '1', '1', '2', '0', '0', '2019-03-18 18:50:47', '2019-05-13 01:46:56');
INSERT INTO `dramascore` VALUES ('1135', '328735', '2', '96', '3', '5', '2', '2019-03-18 19:09:03', '2019-06-12 11:29:44');
INSERT INTO `dramascore` VALUES ('1137', '10211', '2', '3', '0', '0', '0', '2019-03-18 19:10:16', '2019-04-09 10:23:36');
INSERT INTO `dramascore` VALUES ('1139', '158652', '1', '6', '1', '0', '1', '2019-03-18 19:39:18', '2019-05-26 07:26:48');
INSERT INTO `dramascore` VALUES ('1141', '114163', '1', '1', '0', '0', '1', '2019-03-18 19:53:33', '2019-06-07 08:24:12');
INSERT INTO `dramascore` VALUES ('1143', '10106', '2', '3', '1', '0', '1', '2019-03-18 20:25:15', '2019-06-02 00:08:18');
INSERT INTO `dramascore` VALUES ('1145', '11578', '4', '1', '0', '0', '0', '2019-03-18 21:37:51', '2019-03-18 21:37:51');
INSERT INTO `dramascore` VALUES ('1147', '159962', '1', '3', '0', '1', '0', '2019-03-18 21:46:55', '2019-04-10 00:46:02');
INSERT INTO `dramascore` VALUES ('1149', '15148', '1', '5', '0', '0', '0', '2019-03-18 21:50:12', '2019-03-22 10:16:39');
INSERT INTO `dramascore` VALUES ('1151', '163358', '1', '3', '1', '0', '0', '2019-03-18 21:56:01', '2019-05-12 14:01:16');
INSERT INTO `dramascore` VALUES ('1153', '10279', '2', '4', '0', '0', '1', '2019-03-18 22:15:11', '2019-05-23 12:24:32');
INSERT INTO `dramascore` VALUES ('1155', '334461', '1', '0', '0', '2', '0', '2019-03-18 22:34:21', '2019-03-23 09:23:13');
INSERT INTO `dramascore` VALUES ('1157', '182351', '4', '1', '1', '0', '0', '2019-03-19 01:00:13', '2019-05-14 00:13:05');
INSERT INTO `dramascore` VALUES ('1159', '2333', '1', '1', '0', '0', '0', '2019-03-19 01:54:09', '2019-03-19 01:54:09');
INSERT INTO `dramascore` VALUES ('1161', '2335', '1', '1', '0', '0', '0', '2019-03-19 01:54:21', '2019-03-19 01:54:21');
INSERT INTO `dramascore` VALUES ('1163', '2578', '1', '1', '0', '0', '0', '2019-03-19 01:54:51', '2019-03-19 01:54:51');
INSERT INTO `dramascore` VALUES ('1165', '2582', '1', '1', '0', '0', '0', '2019-03-19 01:55:04', '2019-03-19 01:55:04');
INSERT INTO `dramascore` VALUES ('1167', '2583', '1', '2', '0', '0', '0', '2019-03-19 01:55:30', '2019-05-28 05:48:28');
INSERT INTO `dramascore` VALUES ('1169', '156170', '1', '2', '0', '0', '0', '2019-03-19 01:55:40', '2019-04-20 09:24:49');
INSERT INTO `dramascore` VALUES ('1171', '320509', '1', '3', '1', '0', '1', '2019-03-19 01:57:26', '2019-04-19 21:02:51');
INSERT INTO `dramascore` VALUES ('1173', '2332', '1', '1', '0', '0', '0', '2019-03-19 01:57:46', '2019-03-19 01:57:46');
INSERT INTO `dramascore` VALUES ('1175', '2331', '1', '1', '0', '0', '0', '2019-03-19 01:58:05', '2019-03-19 01:58:05');
INSERT INTO `dramascore` VALUES ('1177', '207129', '2', '3', '1', '0', '0', '2019-03-19 02:20:17', '2019-04-05 03:39:57');
INSERT INTO `dramascore` VALUES ('1179', '162290', '1', '0', '0', '0', '2', '2019-03-19 02:50:52', '2019-06-13 07:19:27');
INSERT INTO `dramascore` VALUES ('1181', '159396', '1', '1', '0', '1', '0', '2019-03-19 04:26:52', '2019-04-11 19:17:06');
INSERT INTO `dramascore` VALUES ('1183', '154277', '1', '1', '0', '0', '0', '2019-03-19 13:15:31', '2019-03-19 13:15:31');
INSERT INTO `dramascore` VALUES ('1185', '159862', '1', '3', '0', '2', '0', '2019-03-19 13:23:08', '2019-06-05 01:48:23');
INSERT INTO `dramascore` VALUES ('1187', '125293', '1', '2', '1', '0', '0', '2019-03-19 15:20:48', '2019-04-30 09:15:26');
INSERT INTO `dramascore` VALUES ('1189', '10912', '2', '10', '0', '0', '0', '2019-03-19 16:37:10', '2019-05-21 08:12:06');
INSERT INTO `dramascore` VALUES ('1191', '335083', '1', '0', '0', '0', '1', '2019-03-19 17:31:02', '2019-03-19 17:31:02');
INSERT INTO `dramascore` VALUES ('1193', '207122', '2', '2', '0', '0', '2', '2019-03-19 17:48:52', '2019-06-01 11:09:30');
INSERT INTO `dramascore` VALUES ('1195', '16833', '2', '3', '0', '0', '1', '2019-03-19 17:49:38', '2019-06-10 08:32:39');
INSERT INTO `dramascore` VALUES ('1197', '268021', '1', '3', '1', '1', '1', '2019-03-19 18:56:08', '2019-06-13 08:54:40');
INSERT INTO `dramascore` VALUES ('1199', '2379', '1', '2', '0', '0', '0', '2019-03-19 19:15:37', '2019-04-29 02:54:47');
INSERT INTO `dramascore` VALUES ('1201', '10180', '2', '0', '0', '0', '1', '2019-03-19 20:10:28', '2019-03-19 20:10:28');
INSERT INTO `dramascore` VALUES ('1203', '10943', '1', '3', '1', '0', '0', '2019-03-19 20:24:04', '2019-05-06 01:18:10');
INSERT INTO `dramascore` VALUES ('1205', '10281', '2', '1', '0', '0', '3', '2019-03-19 20:31:27', '2019-05-03 00:03:27');
INSERT INTO `dramascore` VALUES ('1207', '10350', '2', '11', '1', '0', '0', '2019-03-19 21:15:33', '2019-06-01 22:19:28');
INSERT INTO `dramascore` VALUES ('1209', '676', '1', '1', '0', '0', '1', '2019-03-19 21:16:32', '2019-03-31 14:38:03');
INSERT INTO `dramascore` VALUES ('1211', '10219', '2', '1', '0', '0', '0', '2019-03-19 21:36:39', '2019-03-19 21:36:39');
INSERT INTO `dramascore` VALUES ('1213', '10150', '2', '2', '0', '0', '0', '2019-03-19 23:08:47', '2019-04-16 11:22:17');
INSERT INTO `dramascore` VALUES ('1215', '153859', '1', '1', '0', '0', '0', '2019-03-20 01:28:08', '2019-03-20 01:28:08');
INSERT INTO `dramascore` VALUES ('1217', '159908', '1', '7', '0', '2', '0', '2019-03-20 10:48:20', '2019-06-10 08:43:14');
INSERT INTO `dramascore` VALUES ('1219', '163758', '1', '6', '1', '0', '2', '2019-03-20 12:10:52', '2019-05-23 09:00:54');
INSERT INTO `dramascore` VALUES ('1221', '158730', '1', '1', '0', '0', '0', '2019-03-20 12:16:03', '2019-03-20 12:16:03');
INSERT INTO `dramascore` VALUES ('1223', '153389', '1', '1', '0', '0', '0', '2019-03-20 13:36:02', '2019-03-20 13:36:02');
INSERT INTO `dramascore` VALUES ('1225', '141364', '2', '9', '0', '0', '0', '2019-03-20 14:12:00', '2019-06-02 09:17:56');
INSERT INTO `dramascore` VALUES ('1227', '10883', '4', '12', '0', '0', '0', '2019-03-20 14:25:14', '2019-05-23 19:17:05');
INSERT INTO `dramascore` VALUES ('1229', '2701', '1', '2', '0', '0', '0', '2019-03-20 15:19:25', '2019-03-21 00:38:17');
INSERT INTO `dramascore` VALUES ('1231', '158573', '1', '4', '0', '0', '0', '2019-03-20 15:54:08', '2019-05-25 21:39:58');
INSERT INTO `dramascore` VALUES ('1233', '348751', '1', '1', '1', '1', '0', '2019-03-20 18:46:43', '2019-05-05 09:41:43');
INSERT INTO `dramascore` VALUES ('1235', '419', '1', '1', '0', '0', '1', '2019-03-20 18:48:22', '2019-05-31 21:47:03');
INSERT INTO `dramascore` VALUES ('1237', '160754', '1', '0', '0', '0', '1', '2019-03-20 18:55:06', '2019-03-20 18:55:06');
INSERT INTO `dramascore` VALUES ('1239', '190224', '1', '1', '0', '0', '0', '2019-03-20 21:04:09', '2019-03-20 21:04:09');
INSERT INTO `dramascore` VALUES ('1241', '158178', '1', '2', '0', '0', '0', '2019-03-20 21:14:44', '2019-04-12 10:43:22');
INSERT INTO `dramascore` VALUES ('1243', '10981', '1', '1', '0', '0', '0', '2019-03-20 21:33:18', '2019-03-20 21:33:18');
INSERT INTO `dramascore` VALUES ('1245', '46290', '2', '15', '3', '1', '1', '2019-03-20 23:21:43', '2019-06-12 05:58:10');
INSERT INTO `dramascore` VALUES ('1247', '36', '1', '0', '1', '0', '0', '2019-03-21 12:12:03', '2019-03-21 12:12:03');
INSERT INTO `dramascore` VALUES ('1249', '158232', '1', '0', '1', '0', '0', '2019-03-21 13:04:13', '2019-03-21 13:04:13');
INSERT INTO `dramascore` VALUES ('1251', '2527', '1', '1', '0', '0', '0', '2019-03-21 14:56:29', '2019-03-21 14:56:29');
INSERT INTO `dramascore` VALUES ('1253', '2702', '1', '3', '0', '0', '0', '2019-03-21 15:07:40', '2019-05-09 11:51:40');
INSERT INTO `dramascore` VALUES ('1255', '350943', '1', '1', '0', '0', '0', '2019-03-21 18:55:46', '2019-03-21 18:55:46');
INSERT INTO `dramascore` VALUES ('1257', '348719', '1', '25', '2', '0', '15', '2019-03-21 19:00:05', '2019-06-08 09:43:25');
INSERT INTO `dramascore` VALUES ('1259', '176', '1', '5', '1', '1', '0', '2019-03-21 19:26:26', '2019-05-26 01:57:52');
INSERT INTO `dramascore` VALUES ('1261', '334473', '1', '3', '0', '0', '0', '2019-03-21 21:17:12', '2019-05-22 09:42:58');
INSERT INTO `dramascore` VALUES ('1263', '160907', '1', '9', '0', '0', '1', '2019-03-21 21:25:47', '2019-06-01 10:55:51');
INSERT INTO `dramascore` VALUES ('1265', '2211', '1', '2', '0', '0', '0', '2019-03-21 22:26:11', '2019-05-17 06:02:22');
INSERT INTO `dramascore` VALUES ('1267', '156633', '1', '1', '0', '0', '0', '2019-03-21 22:26:59', '2019-03-21 22:26:59');
INSERT INTO `dramascore` VALUES ('1269', '160278', '1', '1', '0', '0', '0', '2019-03-22 00:29:06', '2019-03-22 00:29:06');
INSERT INTO `dramascore` VALUES ('1271', '159472', '1', '1', '0', '0', '0', '2019-03-22 00:33:29', '2019-03-22 00:33:29');
INSERT INTO `dramascore` VALUES ('1273', '153405', '1', '4', '0', '0', '0', '2019-03-22 00:42:23', '2019-06-01 08:20:02');
INSERT INTO `dramascore` VALUES ('1275', '351199', '1', '3', '0', '0', '4', '2019-03-22 05:32:54', '2019-04-06 07:54:53');
INSERT INTO `dramascore` VALUES ('1277', '150677', '1', '0', '0', '0', '1', '2019-03-22 08:43:42', '2019-03-22 08:43:42');
INSERT INTO `dramascore` VALUES ('1279', '348745', '1', '3', '0', '1', '0', '2019-03-22 09:28:48', '2019-05-29 12:05:29');
INSERT INTO `dramascore` VALUES ('1281', '15141', '1', '3', '0', '0', '2', '2019-03-22 11:40:19', '2019-06-08 02:15:03');
INSERT INTO `dramascore` VALUES ('1283', '947', '1', '1', '0', '0', '0', '2019-03-22 12:31:26', '2019-03-22 12:31:26');
INSERT INTO `dramascore` VALUES ('1285', '303861', '1', '1', '0', '0', '1', '2019-03-22 12:38:45', '2019-06-03 09:39:53');
INSERT INTO `dramascore` VALUES ('1287', '2419', '1', '3', '0', '0', '0', '2019-03-22 12:44:24', '2019-05-09 11:35:49');
INSERT INTO `dramascore` VALUES ('1289', '10244', '2', '29', '0', '1', '0', '2019-03-22 14:02:39', '2019-05-28 04:33:33');
INSERT INTO `dramascore` VALUES ('1291', '352729', '1', '0', '0', '0', '1', '2019-03-22 15:15:18', '2019-03-22 15:15:18');
INSERT INTO `dramascore` VALUES ('1293', '352187', '1', '3', '0', '0', '1', '2019-03-22 16:02:53', '2019-04-06 01:51:19');
INSERT INTO `dramascore` VALUES ('1295', '163753', '1', '4', '1', '0', '1', '2019-03-22 16:27:36', '2019-06-01 22:36:35');
INSERT INTO `dramascore` VALUES ('1297', '155694', '1', '2', '0', '0', '0', '2019-03-22 17:21:58', '2019-03-22 19:09:24');
INSERT INTO `dramascore` VALUES ('1299', '163759', '1', '2', '0', '0', '1', '2019-03-22 17:21:59', '2019-05-18 00:29:25');
INSERT INTO `dramascore` VALUES ('1301', '352433', '1', '2', '0', '0', '0', '2019-03-22 17:37:34', '2019-03-30 03:43:03');
INSERT INTO `dramascore` VALUES ('1303', '348747', '1', '10', '2', '0', '0', '2019-03-22 17:38:24', '2019-05-18 13:24:57');
INSERT INTO `dramascore` VALUES ('1305', '348753', '1', '3', '0', '1', '3', '2019-03-22 17:39:44', '2019-06-13 08:52:58');
INSERT INTO `dramascore` VALUES ('1307', '348721', '1', '8', '1', '0', '2', '2019-03-22 17:40:27', '2019-05-31 09:27:45');
INSERT INTO `dramascore` VALUES ('1309', '10645', '4', '2', '0', '0', '0', '2019-03-22 19:24:48', '2019-04-28 15:31:21');
INSERT INTO `dramascore` VALUES ('1311', '353347', '1', '4', '0', '0', '0', '2019-03-22 19:43:29', '2019-04-09 06:15:01');
INSERT INTO `dramascore` VALUES ('1313', '284', '1', '1', '0', '0', '0', '2019-03-22 19:59:53', '2019-03-22 19:59:53');
INSERT INTO `dramascore` VALUES ('1315', '159905', '1', '2', '0', '1', '0', '2019-03-22 21:21:01', '2019-03-31 01:52:58');
INSERT INTO `dramascore` VALUES ('1317', '68486', '2', '4', '0', '0', '0', '2019-03-22 21:22:26', '2019-05-23 03:10:00');
INSERT INTO `dramascore` VALUES ('1319', '161277', '1', '1', '0', '0', '1', '2019-03-22 21:28:42', '2019-05-29 08:28:32');
INSERT INTO `dramascore` VALUES ('1321', '161089', '1', '0', '1', '0', '0', '2019-03-22 21:45:03', '2019-03-22 21:45:03');
INSERT INTO `dramascore` VALUES ('1323', '158155', '1', '1', '0', '0', '0', '2019-03-22 21:45:47', '2019-03-22 21:45:47');
INSERT INTO `dramascore` VALUES ('1325', '161562', '1', '1', '0', '0', '0', '2019-03-22 21:55:37', '2019-03-22 21:55:37');
INSERT INTO `dramascore` VALUES ('1327', '334453', '1', '3', '0', '4', '0', '2019-03-22 22:46:49', '2019-05-27 00:22:23');
INSERT INTO `dramascore` VALUES ('1329', '181158', '4', '11', '0', '0', '0', '2019-03-22 22:49:38', '2019-04-18 19:50:19');
INSERT INTO `dramascore` VALUES ('1331', '11349', '2', '0', '0', '0', '1', '2019-03-22 23:02:11', '2019-03-22 23:02:11');
INSERT INTO `dramascore` VALUES ('1333', '354073', '1', '4', '0', '0', '1', '2019-03-22 23:49:39', '2019-04-29 01:48:32');
INSERT INTO `dramascore` VALUES ('1335', '10948', '1', '2', '1', '0', '0', '2019-03-23 00:49:22', '2019-06-03 05:58:49');
INSERT INTO `dramascore` VALUES ('1337', '89109', '1', '1', '0', '0', '0', '2019-03-23 03:31:44', '2019-03-23 03:31:44');
INSERT INTO `dramascore` VALUES ('1339', '159919', '1', '3', '0', '0', '0', '2019-03-23 08:05:59', '2019-04-08 08:07:51');
INSERT INTO `dramascore` VALUES ('1341', '86739', '1', '15', '0', '0', '0', '2019-03-23 08:21:23', '2019-06-10 04:04:35');
INSERT INTO `dramascore` VALUES ('1343', '355', '1', '4', '0', '0', '1', '2019-03-23 08:25:46', '2019-05-26 22:31:15');
INSERT INTO `dramascore` VALUES ('1345', '10977', '1', '2', '2', '0', '0', '2019-03-23 08:47:19', '2019-06-02 09:24:38');
INSERT INTO `dramascore` VALUES ('1347', '10519', '1', '1', '0', '0', '1', '2019-03-23 08:48:03', '2019-05-04 07:00:10');
INSERT INTO `dramascore` VALUES ('1349', '351715', '1', '10', '4', '0', '2', '2019-03-23 08:49:14', '2019-06-06 06:57:01');
INSERT INTO `dramascore` VALUES ('1351', '355209', '1', '1', '0', '0', '0', '2019-03-23 09:05:41', '2019-03-23 09:05:41');
INSERT INTO `dramascore` VALUES ('1353', '216', '1', '1', '0', '0', '0', '2019-03-23 10:23:18', '2019-03-23 10:23:18');
INSERT INTO `dramascore` VALUES ('1355', '355909', '2', '8', '0', '0', '0', '2019-03-23 15:09:46', '2019-05-19 10:36:31');
INSERT INTO `dramascore` VALUES ('1357', '185', '1', '11', '0', '0', '0', '2019-03-23 15:37:01', '2019-06-12 06:23:07');
INSERT INTO `dramascore` VALUES ('1359', '155730', '1', '5', '0', '0', '0', '2019-03-23 17:32:04', '2019-05-27 08:36:03');
INSERT INTO `dramascore` VALUES ('1361', '350459', '1', '1', '0', '0', '0', '2019-03-23 18:16:48', '2019-03-23 18:16:48');
INSERT INTO `dramascore` VALUES ('1363', '53096', '1', '1', '0', '0', '0', '2019-03-23 19:48:28', '2019-03-23 19:48:28');
INSERT INTO `dramascore` VALUES ('1365', '11344', '2', '1', '0', '0', '1', '2019-03-23 20:32:51', '2019-04-17 19:42:37');
INSERT INTO `dramascore` VALUES ('1367', '355949', '1', '68', '4', '4', '16', '2019-03-23 20:34:54', '2019-06-08 15:06:56');
INSERT INTO `dramascore` VALUES ('1369', '334437', '1', '1', '0', '0', '1', '2019-03-23 21:00:55', '2019-04-14 07:48:16');
INSERT INTO `dramascore` VALUES ('1371', '355735', '1', '0', '0', '2', '3', '2019-03-23 21:25:01', '2019-05-03 01:27:50');
INSERT INTO `dramascore` VALUES ('1373', '11664', '4', '21', '0', '0', '0', '2019-03-23 22:41:50', '2019-03-30 11:50:13');
INSERT INTO `dramascore` VALUES ('1375', '355963', '1', '7', '0', '0', '2', '2019-03-24 00:22:43', '2019-06-02 12:18:54');
INSERT INTO `dramascore` VALUES ('1377', '179880', '4', '2', '1', '0', '0', '2019-03-24 02:04:14', '2019-03-30 11:49:52');
INSERT INTO `dramascore` VALUES ('1379', '158621', '1', '2', '0', '0', '0', '2019-03-24 06:30:44', '2019-04-28 09:40:59');
INSERT INTO `dramascore` VALUES ('1381', '158622', '1', '2', '0', '0', '0', '2019-03-24 07:56:41', '2019-04-28 09:40:54');
INSERT INTO `dramascore` VALUES ('1383', '334275', '1', '0', '0', '0', '1', '2019-03-24 13:22:54', '2019-03-24 13:22:54');
INSERT INTO `dramascore` VALUES ('1385', '15172', '1', '3', '0', '0', '0', '2019-03-24 13:41:51', '2019-06-10 09:01:47');
INSERT INTO `dramascore` VALUES ('1387', '159922', '1', '6', '0', '0', '0', '2019-03-24 15:10:45', '2019-05-26 20:52:54');
INSERT INTO `dramascore` VALUES ('1389', '357755', '1', '1', '0', '0', '1', '2019-03-24 15:36:08', '2019-03-24 16:45:45');
INSERT INTO `dramascore` VALUES ('1391', '154904', '1', '1', '0', '0', '0', '2019-03-24 17:12:31', '2019-03-24 17:12:31');
INSERT INTO `dramascore` VALUES ('1393', '168637', '1', '0', '0', '0', '1', '2019-03-24 17:22:02', '2019-03-24 17:22:02');
INSERT INTO `dramascore` VALUES ('1395', '10549', '2', '8', '1', '1', '0', '2019-03-24 17:59:14', '2019-05-22 11:25:03');
INSERT INTO `dramascore` VALUES ('1397', '355983', '1', '3', '0', '0', '0', '2019-03-24 18:45:59', '2019-05-27 05:29:25');
INSERT INTO `dramascore` VALUES ('1399', '358345', '1', '1', '1', '0', '0', '2019-03-24 18:53:43', '2019-04-29 04:27:24');
INSERT INTO `dramascore` VALUES ('1401', '1591', '1', '0', '1', '0', '0', '2019-03-24 20:17:29', '2019-03-24 20:17:29');
INSERT INTO `dramascore` VALUES ('1403', '359095', '1', '1', '0', '1', '1', '2019-03-24 22:03:21', '2019-03-24 22:44:12');
INSERT INTO `dramascore` VALUES ('1405', '11367', '2', '2', '1', '0', '2', '2019-03-24 22:06:31', '2019-05-10 23:46:37');
INSERT INTO `dramascore` VALUES ('1407', '77664', '1', '1', '1', '0', '1', '2019-03-24 22:11:00', '2019-05-27 08:05:23');
INSERT INTO `dramascore` VALUES ('1409', '11100', '1', '1', '0', '0', '0', '2019-03-24 22:34:19', '2019-03-24 22:34:19');
INSERT INTO `dramascore` VALUES ('1411', '355715', '1', '5', '0', '0', '1', '2019-03-25 10:53:45', '2019-06-10 01:02:09');
INSERT INTO `dramascore` VALUES ('1413', '137', '1', '1', '0', '0', '0', '2019-03-25 12:16:05', '2019-03-25 12:16:05');
INSERT INTO `dramascore` VALUES ('1415', '104142', '1', '1', '2', '1', '0', '2019-03-25 15:41:37', '2019-04-25 17:50:19');
INSERT INTO `dramascore` VALUES ('1417', '94062', '1', '2', '0', '0', '0', '2019-03-25 15:41:54', '2019-05-19 21:40:10');
INSERT INTO `dramascore` VALUES ('1419', '159628', '1', '1', '0', '1', '0', '2019-03-25 17:28:26', '2019-04-17 06:50:15');
INSERT INTO `dramascore` VALUES ('1421', '9604', '2', '5', '0', '0', '0', '2019-03-25 18:35:20', '2019-05-18 06:38:12');
INSERT INTO `dramascore` VALUES ('1423', '25577', '1', '2', '0', '0', '0', '2019-03-25 19:22:01', '2019-06-07 04:57:38');
INSERT INTO `dramascore` VALUES ('1425', '158629', '1', '2', '0', '0', '0', '2019-03-25 20:35:42', '2019-06-08 11:13:04');
INSERT INTO `dramascore` VALUES ('1427', '226', '1', '5', '0', '0', '3', '2019-03-25 20:40:06', '2019-06-13 05:47:07');
INSERT INTO `dramascore` VALUES ('1429', '157951', '1', '3', '0', '0', '0', '2019-03-25 21:29:32', '2019-06-13 05:04:58');
INSERT INTO `dramascore` VALUES ('1431', '160047', '1', '0', '0', '0', '3', '2019-03-25 22:20:53', '2019-05-05 07:51:42');
INSERT INTO `dramascore` VALUES ('1433', '11638', '4', '12', '0', '0', '0', '2019-03-26 02:34:36', '2019-05-23 19:10:03');
INSERT INTO `dramascore` VALUES ('1435', '248285', '1', '1', '0', '0', '0', '2019-03-26 08:17:15', '2019-03-26 08:17:15');
INSERT INTO `dramascore` VALUES ('1437', '156022', '1', '1', '0', '0', '0', '2019-03-26 14:15:28', '2019-03-26 14:15:28');
INSERT INTO `dramascore` VALUES ('1439', '157564', '1', '2', '0', '0', '1', '2019-03-26 15:20:01', '2019-05-19 04:52:26');
INSERT INTO `dramascore` VALUES ('1441', '154034', '1', '1', '0', '0', '0', '2019-03-26 18:26:06', '2019-03-26 18:26:06');
INSERT INTO `dramascore` VALUES ('1443', '363777', '2', '2', '6', '2', '4', '2019-03-26 18:34:27', '2019-06-13 09:46:03');
INSERT INTO `dramascore` VALUES ('1445', '363291', '1', '7', '1', '0', '2', '2019-03-26 18:54:02', '2019-05-22 11:27:49');
INSERT INTO `dramascore` VALUES ('1447', '115', '1', '8', '0', '0', '0', '2019-03-26 18:55:08', '2019-05-21 06:38:18');
INSERT INTO `dramascore` VALUES ('1449', '161217', '1', '2', '0', '0', '0', '2019-03-26 19:10:08', '2019-04-20 04:21:22');
INSERT INTO `dramascore` VALUES ('1451', '10349', '2', '2', '0', '0', '0', '2019-03-26 19:54:08', '2019-03-30 01:38:27');
INSERT INTO `dramascore` VALUES ('1453', '11118', '1', '1', '0', '0', '0', '2019-03-26 19:59:26', '2019-03-26 19:59:26');
INSERT INTO `dramascore` VALUES ('1455', '154648', '1', '2', '0', '0', '0', '2019-03-26 20:00:28', '2019-04-21 07:43:23');
INSERT INTO `dramascore` VALUES ('1457', '158775', '1', '3', '0', '0', '1', '2019-03-26 21:11:44', '2019-06-13 02:40:42');
INSERT INTO `dramascore` VALUES ('1459', '10060', '2', '2', '0', '0', '0', '2019-03-26 22:01:41', '2019-04-20 00:08:27');
INSERT INTO `dramascore` VALUES ('1461', '359671', '2', '2', '1', '0', '3', '2019-03-27 01:16:58', '2019-05-08 06:25:18');
INSERT INTO `dramascore` VALUES ('1463', '10177', '2', '2', '0', '0', '0', '2019-03-27 09:56:31', '2019-05-28 09:47:01');
INSERT INTO `dramascore` VALUES ('1465', '107785', '1', '4', '1', '0', '0', '2019-03-27 10:25:35', '2019-05-26 04:29:17');
INSERT INTO `dramascore` VALUES ('1467', '158572', '1', '9', '2', '0', '1', '2019-03-27 10:26:02', '2019-06-06 20:28:56');
INSERT INTO `dramascore` VALUES ('1469', '157957', '1', '1', '0', '0', '0', '2019-03-27 10:51:00', '2019-03-27 10:51:00');
INSERT INTO `dramascore` VALUES ('1471', '161079', '1', '6', '0', '1', '2', '2019-03-27 10:54:12', '2019-06-01 03:32:11');
INSERT INTO `dramascore` VALUES ('1473', '366419', '1', '5', '1', '0', '0', '2019-03-27 15:48:00', '2019-05-16 08:20:36');
INSERT INTO `dramascore` VALUES ('1475', '10468', '2', '1', '0', '0', '0', '2019-03-27 16:51:40', '2019-03-27 16:51:40');
INSERT INTO `dramascore` VALUES ('1477', '157811', '1', '3', '0', '0', '0', '2019-03-27 18:07:55', '2019-04-10 00:49:34');
INSERT INTO `dramascore` VALUES ('1479', '209934', '1', '2', '0', '0', '0', '2019-03-27 18:13:44', '2019-06-10 08:57:47');
INSERT INTO `dramascore` VALUES ('1481', '154352', '1', '1', '0', '0', '0', '2019-03-27 18:35:34', '2019-03-27 18:35:34');
INSERT INTO `dramascore` VALUES ('1483', '10267', '2', '1', '0', '0', '0', '2019-03-27 18:59:53', '2019-03-27 18:59:53');
INSERT INTO `dramascore` VALUES ('1485', '2156', '1', '1', '0', '0', '0', '2019-03-27 19:29:58', '2019-03-27 19:29:58');
INSERT INTO `dramascore` VALUES ('1487', '25588', '1', '1', '0', '0', '0', '2019-03-27 19:41:12', '2019-03-27 19:41:12');
INSERT INTO `dramascore` VALUES ('1489', '10339', '2', '1', '0', '0', '0', '2019-03-27 21:22:59', '2019-03-27 21:22:59');
INSERT INTO `dramascore` VALUES ('1491', '367231', '1', '0', '0', '0', '1', '2019-03-27 21:31:37', '2019-03-27 21:31:37');
INSERT INTO `dramascore` VALUES ('1493', '11374', '1', '1', '1', '0', '0', '2019-03-27 21:39:26', '2019-03-27 21:52:54');
INSERT INTO `dramascore` VALUES ('1495', '10199', '2', '10', '0', '0', '0', '2019-03-27 23:00:31', '2019-04-30 11:48:29');
INSERT INTO `dramascore` VALUES ('1497', '366721', '1', '1', '0', '0', '0', '2019-03-27 23:17:58', '2019-03-27 23:17:58');
INSERT INTO `dramascore` VALUES ('1499', '159796', '1', '3', '0', '0', '0', '2019-03-28 09:41:12', '2019-05-29 08:00:08');
INSERT INTO `dramascore` VALUES ('1501', '159616', '1', '2', '0', '0', '0', '2019-03-28 09:41:46', '2019-05-18 22:37:06');
INSERT INTO `dramascore` VALUES ('1503', '160227', '1', '2', '0', '0', '0', '2019-03-28 09:42:02', '2019-05-18 22:40:50');
INSERT INTO `dramascore` VALUES ('1505', '159473', '1', '1', '0', '0', '0', '2019-03-28 09:42:25', '2019-03-28 09:42:25');
INSERT INTO `dramascore` VALUES ('1507', '158811', '1', '1', '0', '0', '0', '2019-03-28 09:43:28', '2019-03-28 09:43:28');
INSERT INTO `dramascore` VALUES ('1509', '159899', '1', '1', '0', '0', '0', '2019-03-28 09:45:24', '2019-03-28 09:45:24');
INSERT INTO `dramascore` VALUES ('1511', '158183', '1', '0', '0', '1', '1', '2019-03-28 14:23:08', '2019-03-28 14:23:20');
INSERT INTO `dramascore` VALUES ('1513', '355891', '1', '2', '0', '0', '1', '2019-03-28 14:33:36', '2019-05-18 01:05:53');
INSERT INTO `dramascore` VALUES ('1515', '156640', '1', '0', '0', '0', '2', '2019-03-28 14:54:41', '2019-03-30 02:43:54');
INSERT INTO `dramascore` VALUES ('1517', '362589', '1', '1', '1', '0', '0', '2019-03-28 15:07:30', '2019-04-14 02:35:09');
INSERT INTO `dramascore` VALUES ('1519', '153065', '1', '1', '0', '0', '0', '2019-03-28 18:04:32', '2019-03-28 18:04:32');
INSERT INTO `dramascore` VALUES ('1521', '367689', '1', '4', '0', '0', '1', '2019-03-28 20:33:25', '2019-04-14 10:11:04');
INSERT INTO `dramascore` VALUES ('1523', '369753', '1', '1', '0', '0', '0', '2019-03-28 20:51:38', '2019-03-28 20:51:38');
INSERT INTO `dramascore` VALUES ('1525', '369553', '1', '1', '0', '1', '2', '2019-03-29 10:48:49', '2019-05-24 19:16:38');
INSERT INTO `dramascore` VALUES ('1527', '11213', '2', '4', '0', '0', '1', '2019-03-29 11:21:31', '2019-06-07 08:09:05');
INSERT INTO `dramascore` VALUES ('1529', '154388', '1', '2', '0', '0', '0', '2019-03-29 18:51:22', '2019-05-12 12:07:24');
INSERT INTO `dramascore` VALUES ('1531', '28', '1', '21', '0', '0', '0', '2019-03-29 22:23:18', '2019-06-07 06:24:21');
INSERT INTO `dramascore` VALUES ('1533', '1102', '1', '35', '1', '0', '0', '2019-03-29 22:23:27', '2019-06-07 06:19:43');
INSERT INTO `dramascore` VALUES ('1535', '369455', '1', '17', '0', '0', '3', '2019-03-29 22:25:48', '2019-06-13 01:09:50');
INSERT INTO `dramascore` VALUES ('1537', '181454', '4', '3', '0', '0', '0', '2019-03-30 01:50:13', '2019-03-30 01:50:14');
INSERT INTO `dramascore` VALUES ('1539', '371079', '1', '12', '0', '0', '1', '2019-03-30 01:50:16', '2019-06-11 20:57:35');
INSERT INTO `dramascore` VALUES ('1541', '367631', '1', '7', '0', '0', '0', '2019-03-30 02:09:48', '2019-06-01 23:04:03');
INSERT INTO `dramascore` VALUES ('1543', '150682', '1', '1', '0', '0', '0', '2019-03-30 02:27:26', '2019-03-30 02:27:26');
INSERT INTO `dramascore` VALUES ('1545', '371059', '1', '2', '2', '1', '0', '2019-03-30 02:33:08', '2019-06-08 05:13:57');
INSERT INTO `dramascore` VALUES ('1547', '334751', '1', '2', '0', '1', '3', '2019-03-30 02:36:38', '2019-05-29 07:22:00');
INSERT INTO `dramascore` VALUES ('1549', '334407', '1', '0', '0', '0', '2', '2019-03-30 02:36:45', '2019-03-30 02:37:01');
INSERT INTO `dramascore` VALUES ('1551', '154918', '1', '0', '1', '1', '0', '2019-03-30 02:47:26', '2019-03-30 02:47:37');
INSERT INTO `dramascore` VALUES ('1553', '154920', '1', '1', '0', '1', '0', '2019-03-30 02:47:44', '2019-06-01 01:38:47');
INSERT INTO `dramascore` VALUES ('1555', '369217', '1', '1', '0', '0', '0', '2019-03-30 03:09:01', '2019-03-30 03:09:01');
INSERT INTO `dramascore` VALUES ('1557', '154408', '1', '0', '0', '2', '0', '2019-03-30 04:22:15', '2019-03-30 04:22:26');
INSERT INTO `dramascore` VALUES ('1559', '204855', '1', '1', '0', '0', '0', '2019-03-30 05:08:43', '2019-03-30 05:08:43');
INSERT INTO `dramascore` VALUES ('1561', '11169', '1', '1', '0', '0', '0', '2019-03-30 05:33:56', '2019-03-30 05:33:56');
INSERT INTO `dramascore` VALUES ('1563', '1636', '1', '0', '1', '0', '0', '2019-03-30 05:45:14', '2019-03-30 05:45:14');
INSERT INTO `dramascore` VALUES ('1565', '2686', '1', '0', '0', '0', '2', '2019-03-30 07:15:52', '2019-03-30 07:15:59');
INSERT INTO `dramascore` VALUES ('1567', '151047', '1', '2', '1', '0', '0', '2019-03-30 07:53:19', '2019-04-07 06:28:31');
INSERT INTO `dramascore` VALUES ('1569', '149826', '1', '5', '2', '0', '0', '2019-03-30 07:53:30', '2019-06-01 00:02:58');
INSERT INTO `dramascore` VALUES ('1571', '50385', '1', '4', '1', '0', '1', '2019-03-30 07:59:00', '2019-06-03 17:33:35');
INSERT INTO `dramascore` VALUES ('1573', '31944', '1', '7', '0', '0', '0', '2019-03-30 08:03:06', '2019-06-02 20:50:22');
INSERT INTO `dramascore` VALUES ('1575', '11030', '1', '1', '0', '0', '0', '2019-03-30 08:08:28', '2019-03-30 08:08:28');
INSERT INTO `dramascore` VALUES ('1577', '10959', '1', '1', '0', '0', '0', '2019-03-30 08:10:07', '2019-03-30 08:10:07');
INSERT INTO `dramascore` VALUES ('1579', '77688', '1', '0', '0', '0', '1', '2019-03-30 08:21:18', '2019-03-30 08:21:18');
INSERT INTO `dramascore` VALUES ('1581', '50711', '1', '14', '0', '0', '3', '2019-03-30 09:29:22', '2019-06-04 07:34:40');
INSERT INTO `dramascore` VALUES ('1583', '1134', '1', '0', '2', '0', '0', '2019-03-30 09:42:40', '2019-03-30 09:42:46');
INSERT INTO `dramascore` VALUES ('1585', '161961', '1', '1', '0', '0', '1', '2019-03-30 09:50:25', '2019-05-29 21:06:35');
INSERT INTO `dramascore` VALUES ('1587', '369243', '1', '2', '0', '0', '0', '2019-03-30 10:19:01', '2019-04-06 11:22:36');
INSERT INTO `dramascore` VALUES ('1589', '1116', '1', '2', '1', '1', '0', '2019-03-30 11:30:06', '2019-04-02 04:11:22');
INSERT INTO `dramascore` VALUES ('1591', '179884', '4', '3', '0', '0', '0', '2019-03-30 12:42:49', '2019-06-06 08:02:19');
INSERT INTO `dramascore` VALUES ('1593', '49202', '1', '1', '0', '0', '0', '2019-03-30 17:54:04', '2019-03-30 17:54:04');
INSERT INTO `dramascore` VALUES ('1595', '32557', '1', '1', '1', '0', '0', '2019-03-30 18:09:54', '2019-05-27 06:27:27');
INSERT INTO `dramascore` VALUES ('1597', '572', '1', '0', '2', '0', '0', '2019-03-30 19:27:06', '2019-04-11 00:40:54');
INSERT INTO `dramascore` VALUES ('1599', '50355', '1', '0', '0', '0', '1', '2019-03-30 22:46:09', '2019-03-30 22:46:09');
INSERT INTO `dramascore` VALUES ('1601', '10548', '2', '4', '1', '0', '0', '2019-03-31 00:41:37', '2019-05-06 11:06:23');
INSERT INTO `dramascore` VALUES ('1603', '111620', '1', '3', '0', '0', '0', '2019-03-31 01:07:24', '2019-05-27 05:55:18');
INSERT INTO `dramascore` VALUES ('1605', '2387', '1', '4', '0', '0', '0', '2019-03-31 01:30:36', '2019-05-20 07:57:16');
INSERT INTO `dramascore` VALUES ('1607', '90048', '1', '0', '0', '0', '1', '2019-03-31 06:41:37', '2019-03-31 06:41:37');
INSERT INTO `dramascore` VALUES ('1609', '356035', '1', '3', '1', '3', '4', '2019-03-31 07:50:17', '2019-06-02 10:21:02');
INSERT INTO `dramascore` VALUES ('1611', '608', '1', '1', '0', '0', '0', '2019-03-31 09:37:55', '2019-03-31 09:37:55');
INSERT INTO `dramascore` VALUES ('1613', '1795', '1', '2', '0', '0', '0', '2019-03-31 09:41:13', '2019-04-02 08:18:07');
INSERT INTO `dramascore` VALUES ('1615', '59640', '4', '0', '0', '0', '1', '2019-03-31 09:46:07', '2019-03-31 09:46:07');
INSERT INTO `dramascore` VALUES ('1617', '200', '1', '4', '0', '0', '0', '2019-03-31 11:13:09', '2019-06-08 00:05:58');
INSERT INTO `dramascore` VALUES ('1619', '148478', '1', '0', '0', '0', '1', '2019-03-31 11:33:13', '2019-03-31 11:33:13');
INSERT INTO `dramascore` VALUES ('1621', '11062', '1', '2', '0', '0', '0', '2019-03-31 11:51:34', '2019-03-31 11:51:34');
INSERT INTO `dramascore` VALUES ('1623', '375141', '1', '42', '1', '0', '3', '2019-03-31 11:55:04', '2019-06-13 09:58:34');
INSERT INTO `dramascore` VALUES ('1625', '196593', '1', '0', '2', '1', '1', '2019-03-31 12:42:34', '2019-05-20 04:28:58');
INSERT INTO `dramascore` VALUES ('1627', '161077', '1', '0', '0', '0', '5', '2019-03-31 12:43:29', '2019-05-14 08:47:06');
INSERT INTO `dramascore` VALUES ('1629', '334737', '1', '13', '0', '0', '1', '2019-03-31 23:33:37', '2019-06-10 09:54:30');
INSERT INTO `dramascore` VALUES ('1631', '375165', '1', '9', '0', '0', '1', '2019-04-01 00:03:54', '2019-06-11 08:01:14');
INSERT INTO `dramascore` VALUES ('1633', '375315', '1', '6', '0', '0', '2', '2019-04-01 01:29:44', '2019-05-08 06:21:31');
INSERT INTO `dramascore` VALUES ('1635', '10406', '2', '26', '0', '0', '0', '2019-04-01 01:45:21', '2019-04-30 11:39:22');
INSERT INTO `dramascore` VALUES ('1637', '30', '1', '2', '1', '0', '0', '2019-04-01 02:07:39', '2019-05-03 01:53:51');
INSERT INTO `dramascore` VALUES ('1639', '26330', '1', '3', '0', '0', '0', '2019-04-01 02:24:29', '2019-06-10 09:00:41');
INSERT INTO `dramascore` VALUES ('1641', '50999', '1', '2', '0', '0', '0', '2019-04-01 02:37:40', '2019-04-07 06:20:46');
INSERT INTO `dramascore` VALUES ('1643', '245309', '1', '2', '0', '0', '1', '2019-04-01 03:35:28', '2019-05-02 08:18:27');
INSERT INTO `dramascore` VALUES ('1645', '153064', '1', '1', '0', '0', '0', '2019-04-01 03:37:24', '2019-04-01 03:37:24');
INSERT INTO `dramascore` VALUES ('1647', '158565', '1', '7', '0', '0', '0', '2019-04-01 03:40:48', '2019-05-22 23:00:14');
INSERT INTO `dramascore` VALUES ('1649', '159833', '1', '1', '0', '0', '0', '2019-04-01 05:26:58', '2019-04-01 05:26:58');
INSERT INTO `dramascore` VALUES ('1651', '375309', '1', '10', '2', '2', '1', '2019-04-01 05:42:20', '2019-05-17 10:36:30');
INSERT INTO `dramascore` VALUES ('1653', '158616', '1', '4', '0', '0', '0', '2019-04-01 06:16:21', '2019-05-11 00:26:53');
INSERT INTO `dramascore` VALUES ('1655', '153038', '1', '1', '0', '0', '0', '2019-04-01 06:16:54', '2019-04-01 06:16:54');
INSERT INTO `dramascore` VALUES ('1657', '375149', '1', '0', '0', '0', '4', '2019-04-01 06:21:43', '2019-04-14 13:19:22');
INSERT INTO `dramascore` VALUES ('1659', '355727', '1', '3', '1', '0', '0', '2019-04-01 06:22:10', '2019-06-05 10:28:53');
INSERT INTO `dramascore` VALUES ('1661', '159728', '1', '0', '1', '0', '0', '2019-04-01 07:40:21', '2019-04-01 07:40:21');
INSERT INTO `dramascore` VALUES ('1663', '159721', '1', '2', '0', '0', '0', '2019-04-01 08:13:46', '2019-04-14 09:06:07');
INSERT INTO `dramascore` VALUES ('1665', '375191', '1', '6', '0', '0', '1', '2019-04-01 08:26:22', '2019-05-12 03:30:32');
INSERT INTO `dramascore` VALUES ('1667', '11354', '2', '5', '0', '0', '0', '2019-04-01 08:26:46', '2019-06-07 13:55:08');
INSERT INTO `dramascore` VALUES ('1669', '26527', '2', '15', '0', '1', '1', '2019-04-01 09:00:52', '2019-06-02 09:40:54');
INSERT INTO `dramascore` VALUES ('1671', '417', '1', '2', '1', '0', '0', '2019-04-01 09:15:02', '2019-05-19 20:45:08');
INSERT INTO `dramascore` VALUES ('1673', '159252', '1', '1', '0', '0', '0', '2019-04-01 10:00:21', '2019-04-01 10:00:21');
INSERT INTO `dramascore` VALUES ('1675', '153446', '1', '3', '0', '0', '1', '2019-04-01 10:11:53', '2019-06-10 09:54:19');
INSERT INTO `dramascore` VALUES ('1677', '10898', '4', '5', '0', '0', '0', '2019-04-01 10:32:52', '2019-05-27 20:25:35');
INSERT INTO `dramascore` VALUES ('1679', '659', '1', '1', '0', '0', '0', '2019-04-01 11:03:46', '2019-04-01 11:03:46');
INSERT INTO `dramascore` VALUES ('1681', '320591', '2', '8', '1', '0', '1', '2019-04-01 11:15:12', '2019-06-08 09:36:57');
INSERT INTO `dramascore` VALUES ('1683', '602', '1', '0', '0', '0', '1', '2019-04-01 12:55:26', '2019-04-01 12:55:26');
INSERT INTO `dramascore` VALUES ('1685', '93553', '1', '1', '0', '1', '0', '2019-04-01 13:21:20', '2019-05-01 22:38:19');
INSERT INTO `dramascore` VALUES ('1687', '159858', '1', '2', '0', '0', '1', '2019-04-01 20:13:37', '2019-04-27 21:00:36');
INSERT INTO `dramascore` VALUES ('1689', '159866', '1', '2', '0', '0', '0', '2019-04-01 20:15:32', '2019-04-28 05:29:56');
INSERT INTO `dramascore` VALUES ('1691', '370849', '1', '7', '0', '0', '1', '2019-04-01 21:06:35', '2019-05-14 19:33:51');
INSERT INTO `dramascore` VALUES ('1693', '201', '1', '2', '0', '0', '0', '2019-04-02 00:02:36', '2019-06-08 10:51:12');
INSERT INTO `dramascore` VALUES ('1695', '153035', '1', '2', '0', '0', '0', '2019-04-02 00:17:58', '2019-05-03 10:11:51');
INSERT INTO `dramascore` VALUES ('1697', '765', '1', '1', '0', '0', '0', '2019-04-02 01:36:44', '2019-04-02 01:36:44');
INSERT INTO `dramascore` VALUES ('1699', '156466', '1', '1', '0', '0', '0', '2019-04-02 05:51:23', '2019-04-02 05:51:23');
INSERT INTO `dramascore` VALUES ('1701', '155666', '1', '1', '0', '0', '0', '2019-04-02 07:47:41', '2019-04-02 07:47:41');
INSERT INTO `dramascore` VALUES ('1703', '166237', '1', '2', '0', '0', '0', '2019-04-02 08:25:26', '2019-06-02 19:14:03');
INSERT INTO `dramascore` VALUES ('1705', '299', '1', '1', '0', '0', '0', '2019-04-02 08:54:03', '2019-04-02 08:54:03');
INSERT INTO `dramascore` VALUES ('1707', '153249', '1', '0', '0', '0', '1', '2019-04-02 09:27:35', '2019-04-02 09:27:35');
INSERT INTO `dramascore` VALUES ('1709', '10547', '2', '2', '0', '0', '0', '2019-04-02 10:53:45', '2019-05-03 05:19:21');
INSERT INTO `dramascore` VALUES ('1711', '17335', '2', '1', '0', '0', '0', '2019-04-02 19:22:39', '2019-04-02 19:22:39');
INSERT INTO `dramascore` VALUES ('1713', '2399', '1', '1', '0', '1', '0', '2019-04-02 23:04:13', '2019-04-10 01:01:00');
INSERT INTO `dramascore` VALUES ('1715', '375271', '1', '2', '0', '0', '1', '2019-04-03 05:29:25', '2019-05-19 10:54:23');
INSERT INTO `dramascore` VALUES ('1717', '268015', '1', '1', '0', '0', '0', '2019-04-03 06:13:45', '2019-04-03 06:13:45');
INSERT INTO `dramascore` VALUES ('1719', '375093', '1', '1', '0', '0', '1', '2019-04-03 07:13:23', '2019-04-07 19:25:44');
INSERT INTO `dramascore` VALUES ('1721', '367785', '1', '1', '0', '0', '2', '2019-04-03 07:17:47', '2019-04-06 07:53:33');
INSERT INTO `dramascore` VALUES ('1723', '366069', '1', '0', '1', '1', '0', '2019-04-03 07:20:31', '2019-04-06 07:16:13');
INSERT INTO `dramascore` VALUES ('1725', '2328', '1', '2', '0', '0', '0', '2019-04-03 10:07:36', '2019-05-31 06:20:46');
INSERT INTO `dramascore` VALUES ('1727', '125274', '1', '3', '0', '0', '0', '2019-04-03 10:46:16', '2019-06-12 13:51:11');
INSERT INTO `dramascore` VALUES ('1729', '10405', '2', '1', '0', '0', '1', '2019-04-03 11:32:34', '2019-04-11 08:12:37');
INSERT INTO `dramascore` VALUES ('1731', '158157', '1', '2', '0', '0', '0', '2019-04-03 13:24:50', '2019-04-26 22:37:16');
INSERT INTO `dramascore` VALUES ('1733', '354711', '1', '3', '0', '0', '0', '2019-04-03 15:12:39', '2019-06-09 02:30:28');
INSERT INTO `dramascore` VALUES ('1735', '10326', '2', '6', '1', '0', '0', '2019-04-03 16:12:57', '2019-06-12 10:57:20');
INSERT INTO `dramascore` VALUES ('1737', '359629', '2', '1', '0', '0', '0', '2019-04-03 20:43:05', '2019-04-03 20:43:05');
INSERT INTO `dramascore` VALUES ('1739', '375171', '1', '1', '1', '0', '1', '2019-04-03 22:01:39', '2019-06-07 08:24:25');
INSERT INTO `dramascore` VALUES ('1741', '359637', '2', '5', '2', '0', '1', '2019-04-04 02:43:45', '2019-06-13 11:50:23');
INSERT INTO `dramascore` VALUES ('1743', '11186', '1', '0', '0', '0', '1', '2019-04-04 03:21:23', '2019-04-04 03:21:23');
INSERT INTO `dramascore` VALUES ('1745', '153250', '1', '3', '0', '0', '0', '2019-04-04 04:26:08', '2019-04-21 08:37:33');
INSERT INTO `dramascore` VALUES ('1747', '356119', '1', '0', '1', '0', '0', '2019-04-04 04:34:37', '2019-04-04 04:34:37');
INSERT INTO `dramascore` VALUES ('1749', '159854', '1', '2', '0', '0', '0', '2019-04-04 04:51:08', '2019-04-08 02:56:14');
INSERT INTO `dramascore` VALUES ('1751', '156177', '1', '1', '1', '0', '0', '2019-04-04 05:35:44', '2019-05-03 10:06:00');
INSERT INTO `dramascore` VALUES ('1753', '2576', '1', '1', '0', '0', '0', '2019-04-04 05:45:44', '2019-04-04 05:45:44');
INSERT INTO `dramascore` VALUES ('1755', '359715', '1', '1', '0', '0', '0', '2019-04-04 06:29:06', '2019-04-04 06:29:06');
INSERT INTO `dramascore` VALUES ('1757', '356049', '1', '2', '0', '1', '0', '2019-04-04 07:41:47', '2019-04-09 11:24:52');
INSERT INTO `dramascore` VALUES ('1759', '10236', '2', '5', '0', '0', '1', '2019-04-04 11:39:46', '2019-06-09 03:56:56');
INSERT INTO `dramascore` VALUES ('1761', '385925', '2', '5', '0', '0', '0', '2019-04-05 03:20:12', '2019-05-17 10:13:36');
INSERT INTO `dramascore` VALUES ('1763', '154747', '1', '1', '0', '0', '0', '2019-04-05 05:31:15', '2019-04-05 05:31:15');
INSERT INTO `dramascore` VALUES ('1765', '152989', '1', '0', '0', '0', '1', '2019-04-05 05:43:55', '2019-04-05 05:43:55');
INSERT INTO `dramascore` VALUES ('1767', '207', '1', '0', '1', '0', '0', '2019-04-05 06:35:20', '2019-04-05 06:35:20');
INSERT INTO `dramascore` VALUES ('1769', '375205', '1', '1', '0', '0', '1', '2019-04-05 08:16:49', '2019-06-07 08:25:22');
INSERT INTO `dramascore` VALUES ('1771', '385393', '2', '3', '0', '0', '1', '2019-04-05 09:59:51', '2019-04-30 10:39:38');
INSERT INTO `dramascore` VALUES ('1773', '10341', '2', '1', '0', '0', '0', '2019-04-05 11:13:14', '2019-04-05 11:13:14');
INSERT INTO `dramascore` VALUES ('1775', '10850', '4', '2', '0', '0', '0', '2019-04-05 12:22:19', '2019-04-06 06:35:01');
INSERT INTO `dramascore` VALUES ('1777', '158414', '1', '1', '0', '0', '0', '2019-04-05 12:23:58', '2019-04-05 12:23:58');
INSERT INTO `dramascore` VALUES ('1779', '120', '1', '1', '0', '0', '1', '2019-04-05 12:25:41', '2019-05-29 05:08:06');
INSERT INTO `dramascore` VALUES ('1781', '375027', '1', '7', '1', '0', '0', '2019-04-06 02:50:50', '2019-05-15 11:35:27');
INSERT INTO `dramascore` VALUES ('1783', '204850', '1', '3', '0', '0', '0', '2019-04-06 03:10:59', '2019-06-09 10:18:34');
INSERT INTO `dramascore` VALUES ('1785', '154597', '1', '1', '0', '0', '0', '2019-04-06 03:28:26', '2019-04-06 03:28:26');
INSERT INTO `dramascore` VALUES ('1787', '2613', '1', '2', '0', '0', '0', '2019-04-06 04:04:51', '2019-05-10 23:06:13');
INSERT INTO `dramascore` VALUES ('1789', '153021', '1', '5', '0', '0', '2', '2019-04-06 04:35:41', '2019-06-04 05:25:43');
INSERT INTO `dramascore` VALUES ('1791', '154881', '1', '1', '0', '0', '1', '2019-04-06 04:48:44', '2019-06-03 01:14:56');
INSERT INTO `dramascore` VALUES ('1793', '149146', '1', '1', '0', '0', '0', '2019-04-06 05:07:44', '2019-04-06 05:07:44');
INSERT INTO `dramascore` VALUES ('1795', '10388', '2', '9', '0', '0', '0', '2019-04-06 06:25:52', '2019-04-17 05:00:59');
INSERT INTO `dramascore` VALUES ('1797', '10387', '2', '16', '0', '0', '0', '2019-04-06 06:33:19', '2019-05-26 08:15:35');
INSERT INTO `dramascore` VALUES ('1799', '163626', '1', '0', '0', '0', '1', '2019-04-06 06:53:49', '2019-04-06 06:53:49');
INSERT INTO `dramascore` VALUES ('1801', '153146', '1', '0', '0', '1', '0', '2019-04-06 07:09:05', '2019-04-06 07:09:05');
INSERT INTO `dramascore` VALUES ('1803', '149', '1', '5', '1', '0', '1', '2019-04-06 07:32:38', '2019-06-12 11:13:02');
INSERT INTO `dramascore` VALUES ('1805', '163604', '1', '1', '1', '1', '0', '2019-04-06 09:29:30', '2019-04-06 09:29:47');
INSERT INTO `dramascore` VALUES ('1807', '163647', '1', '1', '0', '0', '1', '2019-04-06 10:11:34', '2019-05-10 10:01:40');
INSERT INTO `dramascore` VALUES ('1809', '388661', '2', '17', '0', '0', '1', '2019-04-06 10:41:51', '2019-06-13 11:09:58');
INSERT INTO `dramascore` VALUES ('1811', '10160', '2', '1', '0', '0', '0', '2019-04-06 11:52:15', '2019-04-06 11:52:15');
INSERT INTO `dramascore` VALUES ('1813', '391165', '1', '29', '1', '0', '5', '2019-04-06 17:53:10', '2019-05-12 21:49:11');
INSERT INTO `dramascore` VALUES ('1815', '153098', '1', '5', '1', '0', '0', '2019-04-06 19:17:39', '2019-05-31 00:56:03');
INSERT INTO `dramascore` VALUES ('1817', '388621', '2', '20', '3', '0', '5', '2019-04-06 19:48:12', '2019-06-11 07:15:09');
INSERT INTO `dramascore` VALUES ('1819', '32308', '1', '2', '1', '0', '0', '2019-04-06 20:53:20', '2019-06-10 08:59:20');
INSERT INTO `dramascore` VALUES ('1821', '161311', '1', '1', '0', '0', '0', '2019-04-06 22:32:26', '2019-04-06 22:32:26');
INSERT INTO `dramascore` VALUES ('1823', '391103', '1', '60', '5', '6', '13', '2019-04-06 23:24:41', '2019-05-31 23:47:01');
INSERT INTO `dramascore` VALUES ('1825', '10590', '1', '0', '0', '1', '0', '2019-04-06 23:46:58', '2019-04-06 23:46:58');
INSERT INTO `dramascore` VALUES ('1827', '155761', '1', '7', '0', '0', '0', '2019-04-07 00:30:32', '2019-04-30 00:00:21');
INSERT INTO `dramascore` VALUES ('1829', '391153', '1', '6', '0', '0', '2', '2019-04-07 00:46:29', '2019-04-16 07:39:26');
INSERT INTO `dramascore` VALUES ('1831', '167058', '1', '0', '0', '1', '0', '2019-04-07 01:08:38', '2019-04-07 01:08:38');
INSERT INTO `dramascore` VALUES ('1833', '358443', '1', '0', '2', '0', '0', '2019-04-07 01:36:06', '2019-04-22 21:53:38');
INSERT INTO `dramascore` VALUES ('1835', '149303', '1', '2', '1', '0', '0', '2019-04-07 01:38:50', '2019-06-01 23:47:03');
INSERT INTO `dramascore` VALUES ('1837', '10363', '2', '1', '0', '0', '0', '2019-04-07 03:45:29', '2019-04-07 03:45:29');
INSERT INTO `dramascore` VALUES ('1839', '462', '1', '12', '0', '0', '0', '2019-04-07 04:21:22', '2019-06-03 02:57:36');
INSERT INTO `dramascore` VALUES ('1841', '161968', '1', '2', '0', '0', '0', '2019-04-07 04:39:59', '2019-04-27 11:26:47');
INSERT INTO `dramascore` VALUES ('1843', '157363', '1', '0', '1', '0', '0', '2019-04-07 04:40:27', '2019-04-07 04:40:27');
INSERT INTO `dramascore` VALUES ('1845', '140103', '1', '0', '0', '1', '0', '2019-04-07 04:41:45', '2019-04-07 04:41:45');
INSERT INTO `dramascore` VALUES ('1847', '137830', '1', '2', '1', '2', '0', '2019-04-07 04:42:12', '2019-05-27 23:58:54');
INSERT INTO `dramascore` VALUES ('1849', '158144', '1', '2', '0', '0', '1', '2019-04-07 04:42:35', '2019-05-12 08:37:14');
INSERT INTO `dramascore` VALUES ('1851', '119617', '1', '1', '1', '0', '0', '2019-04-07 04:43:59', '2019-05-05 11:22:00');
INSERT INTO `dramascore` VALUES ('1853', '391083', '1', '2', '0', '0', '0', '2019-04-07 04:44:47', '2019-04-13 08:28:03');
INSERT INTO `dramascore` VALUES ('1855', '111894', '1', '1', '0', '1', '0', '2019-04-07 04:45:05', '2019-06-08 11:33:44');
INSERT INTO `dramascore` VALUES ('1857', '391073', '1', '17', '2', '0', '1', '2019-04-07 04:45:23', '2019-05-27 08:06:15');
INSERT INTO `dramascore` VALUES ('1859', '87287', '1', '1', '0', '0', '0', '2019-04-07 04:47:34', '2019-04-07 04:47:34');
INSERT INTO `dramascore` VALUES ('1861', '86135', '1', '0', '2', '0', '0', '2019-04-07 04:48:02', '2019-05-10 08:56:27');
INSERT INTO `dramascore` VALUES ('1863', '159683', '1', '1', '0', '0', '1', '2019-04-07 04:50:10', '2019-06-10 00:52:19');
INSERT INTO `dramascore` VALUES ('1865', '49235', '1', '2', '0', '0', '0', '2019-04-07 04:50:32', '2019-06-06 07:32:54');
INSERT INTO `dramascore` VALUES ('1867', '159494', '1', '1', '0', '0', '1', '2019-04-07 04:51:45', '2019-05-24 06:49:53');
INSERT INTO `dramascore` VALUES ('1869', '158310', '1', '1', '0', '0', '0', '2019-04-07 04:52:37', '2019-04-07 04:52:37');
INSERT INTO `dramascore` VALUES ('1871', '15225', '1', '2', '0', '0', '0', '2019-04-07 05:12:44', '2019-05-08 07:45:32');
INSERT INTO `dramascore` VALUES ('1873', '11060', '1', '0', '0', '0', '2', '2019-04-07 06:27:02', '2019-04-07 06:27:02');
INSERT INTO `dramascore` VALUES ('1875', '2136', '1', '1', '0', '0', '0', '2019-04-07 07:01:29', '2019-04-07 07:01:29');
INSERT INTO `dramascore` VALUES ('1877', '390959', '1', '4', '3', '0', '0', '2019-04-07 07:37:58', '2019-05-11 10:09:19');
INSERT INTO `dramascore` VALUES ('1879', '10944', '1', '1', '1', '0', '0', '2019-04-07 08:08:06', '2019-05-26 02:02:49');
INSERT INTO `dramascore` VALUES ('1881', '217', '1', '2', '0', '0', '0', '2019-04-07 08:38:26', '2019-04-21 02:26:26');
INSERT INTO `dramascore` VALUES ('1883', '391109', '1', '15', '0', '0', '1', '2019-04-07 08:50:26', '2019-06-03 02:59:03');
INSERT INTO `dramascore` VALUES ('1885', '358879', '1', '0', '2', '0', '0', '2019-04-07 08:57:55', '2019-06-13 01:12:15');
INSERT INTO `dramascore` VALUES ('1887', '267995', '1', '0', '0', '0', '1', '2019-04-07 09:10:44', '2019-04-07 09:10:44');
INSERT INTO `dramascore` VALUES ('1889', '10432', '2', '1', '0', '0', '1', '2019-04-07 09:11:59', '2019-05-17 06:56:07');
INSERT INTO `dramascore` VALUES ('1891', '10597', '2', '1', '0', '0', '0', '2019-04-07 09:17:05', '2019-04-07 09:17:05');
INSERT INTO `dramascore` VALUES ('1893', '391119', '1', '2', '0', '0', '1', '2019-04-07 10:42:05', '2019-04-14 21:15:55');
INSERT INTO `dramascore` VALUES ('1895', '391131', '1', '27', '3', '1', '6', '2019-04-07 12:59:09', '2019-05-26 23:41:23');
INSERT INTO `dramascore` VALUES ('1897', '150325', '1', '1', '0', '0', '0', '2019-04-07 14:07:11', '2019-04-07 14:07:11');
INSERT INTO `dramascore` VALUES ('1899', '159923', '1', '3', '0', '0', '0', '2019-04-07 15:50:20', '2019-06-03 01:32:46');
INSERT INTO `dramascore` VALUES ('1901', '375071', '1', '2', '0', '0', '0', '2019-04-07 15:51:10', '2019-04-20 09:46:52');
INSERT INTO `dramascore` VALUES ('1903', '10361', '2', '3', '1', '0', '0', '2019-04-07 20:04:17', '2019-05-07 08:35:59');
INSERT INTO `dramascore` VALUES ('1905', '391017', '1', '5', '0', '0', '2', '2019-04-07 20:43:51', '2019-06-01 04:09:48');
INSERT INTO `dramascore` VALUES ('1907', '33540', '1', '0', '0', '0', '2', '2019-04-07 21:30:57', '2019-04-07 21:31:15');
INSERT INTO `dramascore` VALUES ('1909', '11123', '1', '1', '0', '0', '0', '2019-04-07 22:23:45', '2019-04-07 22:23:45');
INSERT INTO `dramascore` VALUES ('1911', '11172', '1', '1', '0', '0', '0', '2019-04-07 22:54:09', '2019-04-07 22:54:09');
INSERT INTO `dramascore` VALUES ('1913', '163624', '1', '6', '0', '0', '0', '2019-04-07 23:16:49', '2019-06-10 10:31:15');
INSERT INTO `dramascore` VALUES ('1915', '158571', '1', '3', '0', '0', '0', '2019-04-07 23:43:25', '2019-05-02 02:19:47');
INSERT INTO `dramascore` VALUES ('1917', '155028', '1', '1', '0', '0', '0', '2019-04-08 00:58:54', '2019-04-08 00:58:54');
INSERT INTO `dramascore` VALUES ('1919', '2192', '1', '1', '0', '0', '0', '2019-04-08 01:27:37', '2019-04-08 01:27:37');
INSERT INTO `dramascore` VALUES ('1921', '391051', '1', '6', '0', '0', '1', '2019-04-08 01:59:47', '2019-04-28 09:25:05');
INSERT INTO `dramascore` VALUES ('1923', '159895', '1', '6', '0', '0', '1', '2019-04-08 02:27:08', '2019-05-26 04:55:21');
INSERT INTO `dramascore` VALUES ('1925', '57642', '1', '1', '0', '0', '0', '2019-04-08 02:30:06', '2019-04-08 02:30:06');
INSERT INTO `dramascore` VALUES ('1927', '867', '1', '1', '0', '0', '0', '2019-04-08 03:34:34', '2019-04-08 03:34:34');
INSERT INTO `dramascore` VALUES ('1929', '160933', '1', '1', '2', '0', '0', '2019-04-08 03:53:14', '2019-05-04 04:31:54');
INSERT INTO `dramascore` VALUES ('1931', '10238', '2', '1', '0', '0', '0', '2019-04-08 04:10:43', '2019-04-08 04:10:43');
INSERT INTO `dramascore` VALUES ('1933', '141848', '1', '0', '1', '0', '0', '2019-04-08 04:49:38', '2019-04-08 04:49:38');
INSERT INTO `dramascore` VALUES ('1935', '362627', '1', '1', '0', '0', '0', '2019-04-08 06:08:38', '2019-04-08 06:08:38');
INSERT INTO `dramascore` VALUES ('1937', '159906', '1', '4', '0', '0', '0', '2019-04-08 07:01:17', '2019-06-03 04:44:36');
INSERT INTO `dramascore` VALUES ('1939', '159875', '1', '2', '0', '1', '0', '2019-04-08 07:04:49', '2019-05-16 07:19:03');
INSERT INTO `dramascore` VALUES ('1941', '388671', '2', '2', '1', '0', '0', '2019-04-08 07:08:58', '2019-05-02 11:17:47');
INSERT INTO `dramascore` VALUES ('1943', '320451', '1', '2', '0', '0', '0', '2019-04-08 07:57:14', '2019-04-16 07:26:21');
INSERT INTO `dramascore` VALUES ('1945', '348727', '1', '8', '0', '0', '0', '2019-04-08 08:00:18', '2019-06-08 20:11:06');
INSERT INTO `dramascore` VALUES ('1947', '355747', '1', '1', '0', '0', '1', '2019-04-08 08:04:46', '2019-05-18 01:05:24');
INSERT INTO `dramascore` VALUES ('1949', '391007', '1', '2', '0', '3', '3', '2019-04-08 08:30:58', '2019-06-13 04:36:41');
INSERT INTO `dramascore` VALUES ('1951', '148205', '1', '1', '0', '0', '0', '2019-04-08 09:12:53', '2019-04-08 09:12:53');
INSERT INTO `dramascore` VALUES ('1953', '15151', '1', '1', '0', '0', '0', '2019-04-08 09:54:44', '2019-04-08 09:54:44');
INSERT INTO `dramascore` VALUES ('1955', '942', '1', '1', '0', '0', '0', '2019-04-08 09:55:00', '2019-04-08 09:55:00');
INSERT INTO `dramascore` VALUES ('1957', '160973', '1', '2', '0', '0', '0', '2019-04-08 10:02:52', '2019-04-12 20:22:56');
INSERT INTO `dramascore` VALUES ('1959', '159546', '1', '1', '0', '0', '1', '2019-04-08 10:16:27', '2019-04-18 09:47:22');
INSERT INTO `dramascore` VALUES ('1961', '10546', '2', '8', '1', '0', '0', '2019-04-08 23:56:24', '2019-06-05 20:38:19');
INSERT INTO `dramascore` VALUES ('1963', '368003', '1', '2', '0', '0', '0', '2019-04-09 02:26:27', '2019-05-31 12:20:17');
INSERT INTO `dramascore` VALUES ('1965', '11108', '1', '1', '0', '0', '0', '2019-04-09 03:36:06', '2019-04-09 03:36:06');
INSERT INTO `dramascore` VALUES ('1967', '11103', '1', '2', '0', '0', '0', '2019-04-09 04:52:33', '2019-04-21 08:03:00');
INSERT INTO `dramascore` VALUES ('1969', '36491', '1', '3', '0', '0', '0', '2019-04-09 06:19:52', '2019-04-26 09:27:43');
INSERT INTO `dramascore` VALUES ('1971', '369159', '1', '0', '2', '0', '0', '2019-04-09 06:58:24', '2019-05-26 05:34:34');
INSERT INTO `dramascore` VALUES ('1973', '395677', '2', '10', '0', '0', '0', '2019-04-09 08:26:36', '2019-05-08 22:54:37');
INSERT INTO `dramascore` VALUES ('1975', '395663', '2', '3', '0', '1', '0', '2019-04-09 08:38:29', '2019-04-22 03:17:24');
INSERT INTO `dramascore` VALUES ('1977', '156154', '1', '1', '0', '0', '0', '2019-04-09 10:02:50', '2019-04-09 10:02:50');
INSERT INTO `dramascore` VALUES ('1979', '11366', '2', '7', '0', '1', '0', '2019-04-09 10:18:27', '2019-06-11 11:32:44');
INSERT INTO `dramascore` VALUES ('1981', '56798', '4', '1', '0', '0', '0', '2019-04-09 10:35:22', '2019-04-09 10:35:22');
INSERT INTO `dramascore` VALUES ('1983', '87289', '1', '3', '0', '0', '0', '2019-04-09 10:45:26', '2019-05-20 07:35:20');
INSERT INTO `dramascore` VALUES ('1985', '375293', '1', '1', '1', '0', '0', '2019-04-09 11:25:21', '2019-04-12 04:40:36');
INSERT INTO `dramascore` VALUES ('1987', '10538', '2', '1', '0', '0', '0', '2019-04-09 11:50:43', '2019-04-09 11:50:43');
INSERT INTO `dramascore` VALUES ('1989', '159819', '1', '2', '0', '0', '0', '2019-04-09 23:00:32', '2019-05-23 20:54:32');
INSERT INTO `dramascore` VALUES ('1991', '153039', '1', '0', '0', '0', '1', '2019-04-09 23:05:51', '2019-04-09 23:05:51');
INSERT INTO `dramascore` VALUES ('1993', '11094', '1', '0', '1', '0', '0', '2019-04-10 00:18:06', '2019-04-10 00:18:06');
INSERT INTO `dramascore` VALUES ('1995', '179977', '4', '3', '0', '0', '0', '2019-04-10 00:29:40', '2019-05-16 13:42:48');
INSERT INTO `dramascore` VALUES ('1997', '159947', '1', '2', '0', '0', '0', '2019-04-10 00:45:53', '2019-04-18 21:35:15');
INSERT INTO `dramascore` VALUES ('1999', '159860', '1', '0', '0', '1', '0', '2019-04-10 00:46:54', '2019-04-10 00:46:54');
INSERT INTO `dramascore` VALUES ('2001', '158645', '1', '1', '0', '1', '0', '2019-04-10 00:48:41', '2019-04-28 09:40:42');
INSERT INTO `dramascore` VALUES ('2003', '158570', '1', '0', '1', '0', '0', '2019-04-10 00:48:57', '2019-04-10 00:48:57');
INSERT INTO `dramascore` VALUES ('2005', '158060', '1', '4', '0', '0', '1', '2019-04-10 00:49:17', '2019-06-01 05:14:25');
INSERT INTO `dramascore` VALUES ('2007', '154704', '1', '1', '0', '0', '1', '2019-04-10 00:49:56', '2019-05-05 03:23:52');
INSERT INTO `dramascore` VALUES ('2009', '154666', '1', '2', '0', '0', '0', '2019-04-10 00:50:02', '2019-05-14 23:28:10');
INSERT INTO `dramascore` VALUES ('2011', '152845', '1', '0', '1', '0', '0', '2019-04-10 00:50:51', '2019-04-10 00:50:51');
INSERT INTO `dramascore` VALUES ('2013', '148739', '1', '1', '0', '0', '0', '2019-04-10 00:51:49', '2019-04-10 00:51:49');
INSERT INTO `dramascore` VALUES ('2015', '148317', '1', '0', '1', '0', '1', '2019-04-10 00:52:13', '2019-05-21 08:23:56');
INSERT INTO `dramascore` VALUES ('2017', '15146', '1', '0', '1', '0', '0', '2019-04-10 00:55:31', '2019-04-10 00:55:31');
INSERT INTO `dramascore` VALUES ('2019', '15147', '1', '1', '1', '0', '0', '2019-04-10 00:55:39', '2019-05-05 09:49:56');
INSERT INTO `dramascore` VALUES ('2021', '10979', '1', '0', '0', '0', '1', '2019-04-10 00:55:58', '2019-04-10 00:55:58');
INSERT INTO `dramascore` VALUES ('2023', '10973', '1', '7', '1', '1', '1', '2019-04-10 00:57:30', '2019-06-02 11:07:08');
INSERT INTO `dramascore` VALUES ('2025', '2689', '1', '0', '0', '1', '0', '2019-04-10 00:59:41', '2019-04-10 00:59:41');
INSERT INTO `dramascore` VALUES ('2027', '2398', '1', '1', '0', '0', '0', '2019-04-10 01:00:50', '2019-04-10 01:00:50');
INSERT INTO `dramascore` VALUES ('2029', '2395', '1', '0', '1', '0', '0', '2019-04-10 01:01:15', '2019-04-10 01:01:15');
INSERT INTO `dramascore` VALUES ('2031', '2393', '1', '2', '0', '0', '0', '2019-04-10 01:01:21', '2019-05-01 10:46:24');
INSERT INTO `dramascore` VALUES ('2033', '2391', '1', '1', '0', '0', '0', '2019-04-10 01:02:21', '2019-04-10 01:02:21');
INSERT INTO `dramascore` VALUES ('2035', '2385', '1', '4', '0', '0', '0', '2019-04-10 01:02:33', '2019-06-10 08:51:09');
INSERT INTO `dramascore` VALUES ('2037', '2384', '1', '1', '0', '0', '0', '2019-04-10 01:02:40', '2019-04-10 01:02:40');
INSERT INTO `dramascore` VALUES ('2039', '2354', '1', '2', '0', '0', '0', '2019-04-10 01:03:28', '2019-04-15 09:04:57');
INSERT INTO `dramascore` VALUES ('2041', '2347', '1', '0', '0', '1', '0', '2019-04-10 01:03:44', '2019-04-10 01:03:44');
INSERT INTO `dramascore` VALUES ('2043', '1968', '1', '0', '0', '0', '1', '2019-04-10 01:04:36', '2019-04-10 01:04:36');
INSERT INTO `dramascore` VALUES ('2045', '1902', '1', '4', '1', '0', '1', '2019-04-10 01:05:02', '2019-06-09 22:49:58');
INSERT INTO `dramascore` VALUES ('2047', '1859', '1', '1', '0', '0', '0', '2019-04-10 01:05:21', '2019-04-10 01:05:21');
INSERT INTO `dramascore` VALUES ('2049', '1826', '1', '0', '1', '0', '0', '2019-04-10 01:05:33', '2019-04-10 01:05:33');
INSERT INTO `dramascore` VALUES ('2051', '195', '1', '2', '0', '0', '0', '2019-04-10 01:07:19', '2019-06-13 05:46:48');
INSERT INTO `dramascore` VALUES ('2053', '192', '1', '2', '0', '0', '0', '2019-04-10 01:07:39', '2019-05-05 10:56:03');
INSERT INTO `dramascore` VALUES ('2055', '188', '1', '2', '0', '0', '0', '2019-04-10 01:07:45', '2019-06-02 09:49:23');
INSERT INTO `dramascore` VALUES ('2057', '366149', '1', '2', '0', '0', '1', '2019-04-10 01:27:25', '2019-05-13 22:18:29');
INSERT INTO `dramascore` VALUES ('2059', '153409', '1', '0', '0', '0', '2', '2019-04-10 01:29:27', '2019-06-09 19:36:23');
INSERT INTO `dramascore` VALUES ('2061', '153179', '1', '0', '0', '0', '1', '2019-04-10 01:30:46', '2019-04-10 01:30:46');
INSERT INTO `dramascore` VALUES ('2063', '148891', '1', '0', '0', '0', '1', '2019-04-10 01:38:33', '2019-04-10 01:38:33');
INSERT INTO `dramascore` VALUES ('2065', '369153', '1', '3', '1', '0', '0', '2019-04-10 01:54:45', '2019-05-25 22:20:16');
INSERT INTO `dramascore` VALUES ('2067', '155958', '1', '1', '1', '0', '0', '2019-04-10 01:57:05', '2019-06-01 08:15:09');
INSERT INTO `dramascore` VALUES ('2069', '10945', '1', '1', '0', '0', '0', '2019-04-10 02:02:50', '2019-04-10 02:02:50');
INSERT INTO `dramascore` VALUES ('2071', '148356', '1', '1', '0', '0', '0', '2019-04-10 05:59:51', '2019-04-10 05:59:51');
INSERT INTO `dramascore` VALUES ('2073', '15102', '1', '1', '0', '0', '0', '2019-04-10 06:22:59', '2019-04-10 06:22:59');
INSERT INTO `dramascore` VALUES ('2075', '985', '1', '1', '0', '0', '0', '2019-04-10 06:41:44', '2019-04-10 06:41:44');
INSERT INTO `dramascore` VALUES ('2077', '1883', '1', '1', '0', '0', '0', '2019-04-10 07:25:06', '2019-04-10 07:25:06');
INSERT INTO `dramascore` VALUES ('2079', '51373', '1', '1', '0', '0', '0', '2019-04-10 07:31:28', '2019-04-10 07:31:28');
INSERT INTO `dramascore` VALUES ('2081', '359659', '2', '2', '0', '0', '0', '2019-04-10 07:35:26', '2019-05-19 04:07:32');
INSERT INTO `dramascore` VALUES ('2083', '11357', '2', '0', '1', '0', '0', '2019-04-10 08:29:26', '2019-04-10 08:29:26');
INSERT INTO `dramascore` VALUES ('2085', '10261', '2', '5', '1', '0', '1', '2019-04-10 08:54:42', '2019-06-12 07:28:05');
INSERT INTO `dramascore` VALUES ('2087', '10141', '2', '1', '0', '0', '0', '2019-04-10 08:56:38', '2019-04-10 08:56:38');
INSERT INTO `dramascore` VALUES ('2089', '398473', '2', '33', '0', '0', '3', '2019-04-10 09:16:13', '2019-06-12 02:08:36');
INSERT INTO `dramascore` VALUES ('2091', '1586', '1', '1', '1', '0', '0', '2019-04-10 09:27:44', '2019-06-08 11:35:21');
INSERT INTO `dramascore` VALUES ('2093', '10937', '1', '4', '0', '0', '0', '2019-04-10 10:09:52', '2019-05-11 09:07:40');
INSERT INTO `dramascore` VALUES ('2095', '571', '1', '0', '1', '0', '0', '2019-04-10 11:32:47', '2019-04-10 11:32:47');
INSERT INTO `dramascore` VALUES ('2097', '155147', '1', '0', '1', '0', '0', '2019-04-10 11:33:14', '2019-04-10 11:33:14');
INSERT INTO `dramascore` VALUES ('2099', '2147', '1', '0', '0', '1', '0', '2019-04-10 11:33:44', '2019-04-10 11:33:44');
INSERT INTO `dramascore` VALUES ('2101', '153377', '1', '2', '0', '0', '0', '2019-04-10 13:16:46', '2019-06-10 07:56:28');
INSERT INTO `dramascore` VALUES ('2103', '153789', '1', '3', '0', '1', '0', '2019-04-10 16:40:14', '2019-05-28 05:37:28');
INSERT INTO `dramascore` VALUES ('2105', '398467', '2', '4', '0', '3', '12', '2019-04-10 22:48:20', '2019-05-08 06:24:21');
INSERT INTO `dramascore` VALUES ('2107', '10396', '2', '1', '0', '0', '0', '2019-04-11 00:58:13', '2019-04-11 00:58:13');
INSERT INTO `dramascore` VALUES ('2109', '10148', '2', '2', '0', '0', '0', '2019-04-11 05:42:56', '2019-06-01 11:14:47');
INSERT INTO `dramascore` VALUES ('2111', '154498', '1', '0', '1', '1', '0', '2019-04-11 06:12:25', '2019-05-11 09:39:09');
INSERT INTO `dramascore` VALUES ('2113', '10346', '2', '26', '0', '0', '0', '2019-04-11 06:28:43', '2019-05-11 12:28:27');
INSERT INTO `dramascore` VALUES ('2115', '51006', '1', '1', '0', '0', '0', '2019-04-11 07:52:48', '2019-04-11 07:52:48');
INSERT INTO `dramascore` VALUES ('2117', '2096', '1', '0', '1', '0', '0', '2019-04-11 07:54:24', '2019-04-11 07:54:24');
INSERT INTO `dramascore` VALUES ('2119', '11396', '2', '8', '0', '0', '0', '2019-04-11 08:11:06', '2019-06-04 11:29:20');
INSERT INTO `dramascore` VALUES ('2121', '10265', '2', '3', '0', '0', '0', '2019-04-11 08:14:21', '2019-05-27 08:13:11');
INSERT INTO `dramascore` VALUES ('2123', '11334', '2', '7', '0', '0', '0', '2019-04-11 08:20:10', '2019-05-24 10:30:34');
INSERT INTO `dramascore` VALUES ('2125', '10337', '2', '3', '0', '0', '0', '2019-04-11 08:22:53', '2019-04-17 04:05:43');
INSERT INTO `dramascore` VALUES ('2127', '15544', '1', '1', '0', '0', '0', '2019-04-11 09:38:55', '2019-04-11 09:38:55');
INSERT INTO `dramascore` VALUES ('2129', '100015', '1', '1', '0', '0', '2', '2019-04-11 10:46:19', '2019-06-02 08:44:08');
INSERT INTO `dramascore` VALUES ('2131', '10117', '2', '1', '0', '0', '0', '2019-04-11 14:01:51', '2019-04-11 14:01:51');
INSERT INTO `dramascore` VALUES ('2133', '403133', '2', '10', '0', '1', '1', '2019-04-11 14:52:15', '2019-05-12 08:34:48');
INSERT INTO `dramascore` VALUES ('2135', '158417', '1', '0', '0', '0', '1', '2019-04-11 18:29:19', '2019-04-11 18:29:19');
INSERT INTO `dramascore` VALUES ('2137', '160177', '1', '0', '0', '1', '0', '2019-04-11 19:16:10', '2019-04-11 19:16:10');
INSERT INTO `dramascore` VALUES ('2139', '159443', '1', '1', '1', '0', '0', '2019-04-11 19:16:33', '2019-04-11 19:16:43');
INSERT INTO `dramascore` VALUES ('2141', '159404', '1', '2', '0', '0', '0', '2019-04-11 19:17:13', '2019-04-28 18:35:07');
INSERT INTO `dramascore` VALUES ('2143', '159391', '1', '1', '0', '0', '0', '2019-04-11 19:17:19', '2019-04-11 19:17:19');
INSERT INTO `dramascore` VALUES ('2145', '10596', '2', '1', '0', '0', '0', '2019-04-11 19:51:13', '2019-04-11 19:51:13');
INSERT INTO `dramascore` VALUES ('2147', '51570', '1', '1', '0', '0', '0', '2019-04-11 21:14:31', '2019-04-11 21:14:31');
INSERT INTO `dramascore` VALUES ('2149', '159894', '1', '2', '0', '0', '0', '2019-04-11 21:41:28', '2019-05-26 00:18:36');
INSERT INTO `dramascore` VALUES ('2151', '154635', '1', '2', '0', '0', '0', '2019-04-12 00:57:41', '2019-04-27 11:53:08');
INSERT INTO `dramascore` VALUES ('2153', '160406', '1', '2', '0', '0', '0', '2019-04-12 03:02:39', '2019-04-28 23:36:01');
INSERT INTO `dramascore` VALUES ('2155', '359599', '2', '7', '1', '0', '1', '2019-04-12 04:35:05', '2019-06-11 09:12:29');
INSERT INTO `dramascore` VALUES ('2157', '10395', '2', '0', '2', '0', '0', '2019-04-12 08:12:24', '2019-04-12 08:12:24');
INSERT INTO `dramascore` VALUES ('2159', '11217', '1', '1', '0', '0', '0', '2019-04-12 08:14:29', '2019-04-12 08:14:29');
INSERT INTO `dramascore` VALUES ('2161', '10476', '2', '2', '0', '0', '0', '2019-04-12 09:12:24', '2019-05-10 10:29:15');
INSERT INTO `dramascore` VALUES ('2163', '158117', '1', '1', '0', '0', '0', '2019-04-12 10:43:39', '2019-04-12 10:43:39');
INSERT INTO `dramascore` VALUES ('2165', '155978', '1', '2', '0', '0', '0', '2019-04-12 10:48:51', '2019-06-01 21:42:45');
INSERT INTO `dramascore` VALUES ('2167', '1890', '1', '1', '0', '0', '0', '2019-04-12 12:45:50', '2019-04-12 12:45:50');
INSERT INTO `dramascore` VALUES ('2169', '10191', '2', '5', '0', '0', '0', '2019-04-12 21:17:29', '2019-06-12 07:35:14');
INSERT INTO `dramascore` VALUES ('2171', '10237', '2', '4', '0', '1', '0', '2019-04-12 21:25:27', '2019-06-04 11:57:09');
INSERT INTO `dramascore` VALUES ('2173', '11119', '1', '0', '0', '0', '1', '2019-04-12 21:44:10', '2019-04-12 21:44:10');
INSERT INTO `dramascore` VALUES ('2175', '10185', '2', '5', '0', '0', '0', '2019-04-13 03:29:19', '2019-06-10 01:39:33');
INSERT INTO `dramascore` VALUES ('2177', '359613', '2', '1', '0', '0', '1', '2019-04-13 03:38:40', '2019-04-24 22:28:15');
INSERT INTO `dramascore` VALUES ('2179', '155909', '1', '1', '0', '0', '0', '2019-04-13 08:27:49', '2019-04-13 08:27:49');
INSERT INTO `dramascore` VALUES ('2181', '390979', '1', '6', '0', '0', '0', '2019-04-13 08:34:29', '2019-05-31 10:17:16');
INSERT INTO `dramascore` VALUES ('2183', '155980', '1', '1', '0', '0', '0', '2019-04-13 11:29:44', '2019-04-13 11:29:44');
INSERT INTO `dramascore` VALUES ('2185', '10080', '2', '0', '0', '0', '1', '2019-04-13 17:28:43', '2019-04-13 17:28:43');
INSERT INTO `dramascore` VALUES ('2187', '1821', '1', '1', '1', '0', '0', '2019-04-13 22:38:31', '2019-06-08 08:01:42');
INSERT INTO `dramascore` VALUES ('2189', '57658', '1', '0', '1', '0', '0', '2019-04-14 01:57:27', '2019-04-14 01:57:27');
INSERT INTO `dramascore` VALUES ('2191', '15532', '1', '0', '0', '2', '0', '2019-04-14 02:38:59', '2019-04-20 08:50:41');
INSERT INTO `dramascore` VALUES ('2193', '365627', '1', '0', '1', '0', '0', '2019-04-14 02:57:49', '2019-04-14 02:57:49');
INSERT INTO `dramascore` VALUES ('2195', '356255', '1', '2', '0', '0', '0', '2019-04-14 02:58:25', '2019-05-21 10:16:39');
INSERT INTO `dramascore` VALUES ('2197', '89113', '1', '1', '0', '0', '0', '2019-04-14 03:08:36', '2019-04-14 03:08:36');
INSERT INTO `dramascore` VALUES ('2199', '2709', '1', '2', '0', '0', '1', '2019-04-14 03:26:00', '2019-06-01 23:07:17');
INSERT INTO `dramascore` VALUES ('2201', '375299', '1', '1', '0', '0', '0', '2019-04-14 04:26:19', '2019-04-14 04:26:19');
INSERT INTO `dramascore` VALUES ('2203', '358895', '1', '2', '0', '0', '1', '2019-04-14 06:40:30', '2019-05-01 08:35:00');
INSERT INTO `dramascore` VALUES ('2205', '375113', '1', '5', '2', '0', '0', '2019-04-14 07:34:59', '2019-05-31 10:57:27');
INSERT INTO `dramascore` VALUES ('2207', '151312', '1', '1', '0', '0', '0', '2019-04-14 08:18:07', '2019-04-14 08:18:07');
INSERT INTO `dramascore` VALUES ('2209', '375233', '1', '1', '0', '0', '1', '2019-04-14 08:27:07', '2019-06-10 06:57:48');
INSERT INTO `dramascore` VALUES ('2211', '159818', '1', '2', '0', '0', '0', '2019-04-14 08:45:03', '2019-06-01 20:49:47');
INSERT INTO `dramascore` VALUES ('2213', '159873', '1', '4', '0', '0', '0', '2019-04-14 11:09:07', '2019-05-21 10:17:24');
INSERT INTO `dramascore` VALUES ('2215', '158128', '1', '1', '0', '0', '0', '2019-04-14 11:27:31', '2019-04-14 11:27:31');
INSERT INTO `dramascore` VALUES ('2217', '995', '1', '1', '0', '0', '0', '2019-04-14 11:53:12', '2019-04-14 11:53:12');
INSERT INTO `dramascore` VALUES ('2219', '159821', '1', '6', '0', '0', '0', '2019-04-14 12:45:00', '2019-06-10 10:33:09');
INSERT INTO `dramascore` VALUES ('2221', '409813', '1', '0', '1', '0', '0', '2019-04-14 13:56:17', '2019-04-14 13:56:17');
INSERT INTO `dramascore` VALUES ('2223', '163742', '1', '3', '0', '0', '0', '2019-04-14 16:16:21', '2019-05-31 11:12:25');
INSERT INTO `dramascore` VALUES ('2225', '252', '1', '6', '0', '0', '0', '2019-04-14 17:01:05', '2019-06-07 19:27:57');
INSERT INTO `dramascore` VALUES ('2227', '32958', '1', '1', '0', '0', '0', '2019-04-14 18:24:15', '2019-04-14 18:24:15');
INSERT INTO `dramascore` VALUES ('2229', '409927', '1', '2', '0', '0', '4', '2019-04-14 21:08:00', '2019-04-30 16:12:17');
INSERT INTO `dramascore` VALUES ('2231', '10382', '2', '1', '0', '0', '0', '2019-04-14 21:22:34', '2019-04-14 21:22:34');
INSERT INTO `dramascore` VALUES ('2233', '567', '1', '1', '0', '0', '0', '2019-04-14 23:30:37', '2019-04-14 23:30:37');
INSERT INTO `dramascore` VALUES ('2235', '245101', '1', '0', '0', '0', '1', '2019-04-14 23:42:51', '2019-04-14 23:42:51');
INSERT INTO `dramascore` VALUES ('2237', '410021', '1', '4', '2', '0', '6', '2019-04-15 00:23:17', '2019-06-01 23:00:38');
INSERT INTO `dramascore` VALUES ('2239', '409893', '1', '8', '2', '1', '0', '2019-04-15 00:45:08', '2019-05-27 01:41:07');
INSERT INTO `dramascore` VALUES ('2241', '161082', '1', '1', '0', '1', '0', '2019-04-15 01:11:48', '2019-06-01 10:27:39');
INSERT INTO `dramascore` VALUES ('2243', '410013', '1', '2', '1', '0', '0', '2019-04-15 01:26:14', '2019-06-04 11:19:59');
INSERT INTO `dramascore` VALUES ('2245', '411105', '1', '3', '1', '3', '5', '2019-04-15 01:56:03', '2019-05-11 11:03:40');
INSERT INTO `dramascore` VALUES ('2247', '411403', '1', '4', '0', '0', '1', '2019-04-15 02:54:46', '2019-04-27 10:00:53');
INSERT INTO `dramascore` VALUES ('2249', '54851', '2', '5', '0', '1', '0', '2019-04-15 03:35:54', '2019-06-10 08:31:58');
INSERT INTO `dramascore` VALUES ('2251', '411279', '1', '2', '0', '0', '1', '2019-04-15 05:31:52', '2019-06-01 23:01:48');
INSERT INTO `dramascore` VALUES ('2253', '411367', '1', '3', '0', '0', '0', '2019-04-15 05:37:59', '2019-04-16 09:28:12');
INSERT INTO `dramascore` VALUES ('2255', '1090', '1', '0', '0', '1', '1', '2019-04-15 07:01:21', '2019-04-29 04:48:35');
INSERT INTO `dramascore` VALUES ('2257', '10480', '2', '0', '1', '0', '0', '2019-04-15 07:24:55', '2019-04-15 07:24:55');
INSERT INTO `dramascore` VALUES ('2259', '411457', '1', '8', '2', '3', '1', '2019-04-15 08:14:49', '2019-05-19 08:25:25');
INSERT INTO `dramascore` VALUES ('2261', '148597', '1', '6', '0', '0', '0', '2019-04-15 08:59:07', '2019-06-07 20:23:23');
INSERT INTO `dramascore` VALUES ('2263', '21033', '1', '2', '0', '0', '0', '2019-04-15 08:59:57', '2019-05-12 17:47:42');
INSERT INTO `dramascore` VALUES ('2265', '15150', '1', '2', '1', '0', '0', '2019-04-15 09:00:13', '2019-06-11 03:15:04');
INSERT INTO `dramascore` VALUES ('2267', '2388', '1', '1', '0', '0', '0', '2019-04-15 09:03:49', '2019-04-15 09:03:49');
INSERT INTO `dramascore` VALUES ('2269', '375195', '1', '4', '0', '0', '0', '2019-04-15 09:05:50', '2019-05-25 04:55:21');
INSERT INTO `dramascore` VALUES ('2271', '411035', '1', '12', '2', '1', '0', '2019-04-15 09:10:50', '2019-05-30 00:47:50');
INSERT INTO `dramascore` VALUES ('2273', '10367', '2', '1', '0', '0', '0', '2019-04-15 09:15:04', '2019-04-15 09:15:04');
INSERT INTO `dramascore` VALUES ('2275', '11550', '4', '1', '0', '0', '0', '2019-04-15 09:49:28', '2019-04-15 09:49:28');
INSERT INTO `dramascore` VALUES ('2277', '411023', '1', '11', '0', '0', '12', '2019-04-15 10:01:23', '2019-05-21 09:13:50');
INSERT INTO `dramascore` VALUES ('2279', '411315', '1', '9', '0', '0', '0', '2019-04-15 10:15:19', '2019-06-09 06:13:27');
INSERT INTO `dramascore` VALUES ('2281', '410929', '1', '10', '0', '0', '3', '2019-04-15 11:14:26', '2019-06-04 22:09:04');
INSERT INTO `dramascore` VALUES ('2283', '11333', '2', '2', '0', '0', '0', '2019-04-15 11:53:17', '2019-06-02 08:37:34');
INSERT INTO `dramascore` VALUES ('2285', '410903', '1', '8', '0', '0', '0', '2019-04-15 13:14:18', '2019-05-10 20:10:00');
INSERT INTO `dramascore` VALUES ('2287', '160984', '1', '1', '1', '0', '0', '2019-04-15 13:49:18', '2019-05-20 07:42:40');
INSERT INTO `dramascore` VALUES ('2289', '411441', '1', '7', '0', '1', '1', '2019-04-15 17:59:48', '2019-04-27 08:28:58');
INSERT INTO `dramascore` VALUES ('2291', '411345', '1', '9', '0', '1', '0', '2019-04-15 18:47:24', '2019-06-04 09:27:05');
INSERT INTO `dramascore` VALUES ('2293', '154868', '1', '1', '0', '0', '0', '2019-04-16 00:25:44', '2019-04-16 00:25:44');
INSERT INTO `dramascore` VALUES ('2295', '364925', '1', '0', '0', '0', '1', '2019-04-16 05:55:39', '2019-04-16 05:55:39');
INSERT INTO `dramascore` VALUES ('2297', '154279', '1', '0', '1', '0', '0', '2019-04-16 05:56:24', '2019-04-16 05:56:24');
INSERT INTO `dramascore` VALUES ('2299', '156206', '1', '3', '0', '0', '0', '2019-04-16 08:25:30', '2019-04-16 08:25:51');
INSERT INTO `dramascore` VALUES ('2301', '31948', '1', '1', '0', '0', '0', '2019-04-16 08:46:12', '2019-04-16 08:46:12');
INSERT INTO `dramascore` VALUES ('2303', '411481', '1', '9', '1', '0', '3', '2019-04-16 11:07:53', '2019-05-08 00:31:50');
INSERT INTO `dramascore` VALUES ('2305', '409977', '1', '12', '0', '0', '0', '2019-04-16 11:08:27', '2019-05-26 10:18:32');
INSERT INTO `dramascore` VALUES ('2307', '409967', '1', '10', '0', '0', '1', '2019-04-16 11:08:33', '2019-05-23 11:07:26');
INSERT INTO `dramascore` VALUES ('2309', '375007', '1', '6', '0', '0', '1', '2019-04-16 11:09:29', '2019-05-15 11:35:34');
INSERT INTO `dramascore` VALUES ('2311', '156244', '1', '2', '0', '0', '0', '2019-04-16 11:10:42', '2019-05-09 04:59:49');
INSERT INTO `dramascore` VALUES ('2313', '411193', '1', '3', '1', '1', '0', '2019-04-16 11:51:40', '2019-05-18 04:06:37');
INSERT INTO `dramascore` VALUES ('2315', '411267', '1', '18', '0', '1', '0', '2019-04-16 12:36:21', '2019-05-31 06:18:47');
INSERT INTO `dramascore` VALUES ('2317', '162543', '1', '0', '0', '0', '1', '2019-04-16 13:34:28', '2019-04-16 13:34:28');
INSERT INTO `dramascore` VALUES ('2319', '155353', '1', '1', '0', '0', '0', '2019-04-16 13:38:41', '2019-04-16 13:38:41');
INSERT INTO `dramascore` VALUES ('2321', '159256', '1', '1', '0', '0', '0', '2019-04-16 20:16:14', '2019-04-16 20:16:14');
INSERT INTO `dramascore` VALUES ('2323', '409883', '1', '5', '1', '1', '0', '2019-04-16 21:24:54', '2019-06-06 08:14:16');
INSERT INTO `dramascore` VALUES ('2325', '10188', '2', '2', '0', '0', '0', '2019-04-16 22:18:22', '2019-04-30 10:32:24');
INSERT INTO `dramascore` VALUES ('2327', '10571', '2', '0', '0', '1', '0', '2019-04-17 00:36:19', '2019-04-17 00:36:19');
INSERT INTO `dramascore` VALUES ('2329', '355757', '1', '1', '1', '1', '1', '2019-04-17 01:28:08', '2019-05-19 02:30:50');
INSERT INTO `dramascore` VALUES ('2331', '158245', '1', '0', '0', '0', '2', '2019-04-17 02:06:23', '2019-05-01 11:15:27');
INSERT INTO `dramascore` VALUES ('2333', '161308', '1', '1', '0', '0', '0', '2019-04-17 03:56:20', '2019-04-17 03:56:20');
INSERT INTO `dramascore` VALUES ('2335', '25792', '2', '4', '0', '0', '0', '2019-04-17 05:11:20', '2019-05-21 08:11:00');
INSERT INTO `dramascore` VALUES ('2337', '156653', '1', '1', '0', '0', '0', '2019-04-17 06:05:22', '2019-04-17 06:05:22');
INSERT INTO `dramascore` VALUES ('2339', '159770', '1', '1', '0', '0', '0', '2019-04-17 06:08:14', '2019-04-17 06:08:14');
INSERT INTO `dramascore` VALUES ('2341', '159563', '1', '2', '0', '0', '0', '2019-04-17 06:36:32', '2019-04-17 13:15:31');
INSERT INTO `dramascore` VALUES ('2343', '9618', '2', '6', '1', '0', '2', '2019-04-17 06:48:16', '2019-06-08 06:15:00');
INSERT INTO `dramascore` VALUES ('2345', '157844', '1', '1', '0', '0', '0', '2019-04-17 07:18:34', '2019-04-17 07:18:34');
INSERT INTO `dramascore` VALUES ('2347', '411153', '1', '3', '0', '1', '1', '2019-04-17 09:39:56', '2019-04-24 11:11:20');
INSERT INTO `dramascore` VALUES ('2349', '160229', '1', '1', '0', '0', '0', '2019-04-17 10:26:13', '2019-04-17 10:26:13');
INSERT INTO `dramascore` VALUES ('2351', '409941', '1', '1', '0', '0', '0', '2019-04-17 10:38:31', '2019-04-17 10:38:31');
INSERT INTO `dramascore` VALUES ('2353', '153277', '1', '1', '0', '2', '1', '2019-04-17 10:46:00', '2019-06-10 08:46:19');
INSERT INTO `dramascore` VALUES ('2355', '153023', '1', '1', '1', '0', '1', '2019-04-17 10:47:02', '2019-05-10 04:18:19');
INSERT INTO `dramascore` VALUES ('2357', '2000', '1', '2', '0', '0', '1', '2019-04-17 10:55:23', '2019-06-11 07:38:12');
INSERT INTO `dramascore` VALUES ('2359', '410637', '1', '4', '0', '0', '0', '2019-04-17 10:56:23', '2019-05-02 13:11:44');
INSERT INTO `dramascore` VALUES ('2361', '196607', '1', '3', '0', '0', '0', '2019-04-17 11:30:18', '2019-05-28 09:06:40');
INSERT INTO `dramascore` VALUES ('2363', '409877', '1', '3', '2', '0', '0', '2019-04-17 12:14:14', '2019-05-19 03:03:00');
INSERT INTO `dramascore` VALUES ('2365', '2649', '1', '1', '0', '0', '0', '2019-04-17 12:15:15', '2019-04-17 12:15:15');
INSERT INTO `dramascore` VALUES ('2367', '409913', '1', '6', '2', '0', '4', '2019-04-17 13:08:54', '2019-06-09 05:53:18');
INSERT INTO `dramascore` VALUES ('2369', '11331', '2', '1', '0', '0', '0', '2019-04-17 19:42:47', '2019-04-17 19:42:47');
INSERT INTO `dramascore` VALUES ('2371', '10459', '2', '1', '0', '0', '0', '2019-04-17 19:42:55', '2019-04-17 19:42:55');
INSERT INTO `dramascore` VALUES ('2373', '10914', '2', '3', '1', '0', '0', '2019-04-17 19:43:05', '2019-06-12 09:06:52');
INSERT INTO `dramascore` VALUES ('2375', '11358', '2', '1', '0', '0', '0', '2019-04-17 19:43:18', '2019-04-17 19:43:18');
INSERT INTO `dramascore` VALUES ('2377', '174718', '2', '1', '0', '0', '0', '2019-04-17 19:43:25', '2019-04-17 19:43:25');
INSERT INTO `dramascore` VALUES ('2379', '411383', '1', '0', '2', '0', '0', '2019-04-17 20:42:20', '2019-04-20 00:29:33');
INSERT INTO `dramascore` VALUES ('2381', '11651', '4', '4', '0', '0', '0', '2019-04-17 22:37:22', '2019-06-06 23:36:51');
INSERT INTO `dramascore` VALUES ('2383', '11650', '4', '4', '0', '0', '2', '2019-04-17 22:37:48', '2019-05-27 20:26:12');
INSERT INTO `dramascore` VALUES ('2385', '156561', '1', '0', '0', '1', '0', '2019-04-18 00:38:29', '2019-04-18 00:38:29');
INSERT INTO `dramascore` VALUES ('2387', '160877', '1', '1', '0', '0', '0', '2019-04-18 02:04:49', '2019-04-18 02:04:49');
INSERT INTO `dramascore` VALUES ('2389', '10528', '1', '1', '0', '0', '0', '2019-04-18 04:21:26', '2019-04-18 04:21:26');
INSERT INTO `dramascore` VALUES ('2391', '410647', '1', '3', '0', '0', '2', '2019-04-18 04:54:13', '2019-05-22 03:59:32');
INSERT INTO `dramascore` VALUES ('2393', '103805', '2', '13', '1', '1', '0', '2019-04-18 05:08:58', '2019-06-04 07:43:42');
INSERT INTO `dramascore` VALUES ('2395', '411109', '1', '3', '0', '0', '0', '2019-04-18 07:12:58', '2019-06-05 07:09:40');
INSERT INTO `dramascore` VALUES ('2397', '10595', '2', '2', '0', '0', '0', '2019-04-18 20:32:46', '2019-06-02 02:28:22');
INSERT INTO `dramascore` VALUES ('2399', '2109', '1', '0', '1', '0', '0', '2019-04-18 22:50:34', '2019-04-18 22:50:34');
INSERT INTO `dramascore` VALUES ('2401', '161338', '1', '3', '0', '0', '0', '2019-04-19 03:06:18', '2019-05-28 09:32:59');
INSERT INTO `dramascore` VALUES ('2403', '159700', '1', '1', '0', '0', '0', '2019-04-19 04:03:41', '2019-04-19 04:03:41');
INSERT INTO `dramascore` VALUES ('2405', '1626', '1', '0', '1', '0', '0', '2019-04-19 05:43:23', '2019-04-19 05:43:23');
INSERT INTO `dramascore` VALUES ('2407', '410769', '1', '5', '0', '0', '1', '2019-04-19 06:44:26', '2019-04-28 06:48:14');
INSERT INTO `dramascore` VALUES ('2409', '369281', '1', '5', '1', '0', '1', '2019-04-19 07:07:05', '2019-06-13 03:44:36');
INSERT INTO `dramascore` VALUES ('2411', '29', '1', '1', '0', '0', '0', '2019-04-19 07:11:15', '2019-04-19 07:11:15');
INSERT INTO `dramascore` VALUES ('2413', '152881', '1', '0', '0', '0', '2', '2019-04-19 07:54:50', '2019-05-21 03:24:28');
INSERT INTO `dramascore` VALUES ('2415', '410705', '1', '3', '1', '0', '0', '2019-04-19 08:51:53', '2019-05-23 03:45:27');
INSERT INTO `dramascore` VALUES ('2417', '411063', '1', '2', '0', '2', '1', '2019-04-19 09:00:12', '2019-05-27 06:30:25');
INSERT INTO `dramascore` VALUES ('2419', '10271', '2', '1', '0', '0', '0', '2019-04-19 09:16:03', '2019-04-19 09:16:03');
INSERT INTO `dramascore` VALUES ('2421', '158036', '1', '1', '0', '0', '0', '2019-04-19 09:34:18', '2019-04-19 09:34:18');
INSERT INTO `dramascore` VALUES ('2423', '160845', '1', '3', '0', '0', '0', '2019-04-19 10:03:12', '2019-04-19 10:03:23');
INSERT INTO `dramascore` VALUES ('2425', '11122', '1', '2', '0', '0', '0', '2019-04-19 10:30:24', '2019-04-25 07:29:45');
INSERT INTO `dramascore` VALUES ('2427', '160863', '1', '1', '0', '0', '0', '2019-04-19 10:35:36', '2019-04-19 10:35:36');
INSERT INTO `dramascore` VALUES ('2429', '411079', '1', '1', '0', '0', '2', '2019-04-19 10:48:48', '2019-05-09 23:23:47');
INSERT INTO `dramascore` VALUES ('2431', '157948', '1', '0', '1', '0', '0', '2019-04-19 12:07:14', '2019-04-19 12:07:14');
INSERT INTO `dramascore` VALUES ('2433', '11502', '4', '1', '0', '0', '0', '2019-04-19 12:39:47', '2019-04-19 12:39:47');
INSERT INTO `dramascore` VALUES ('2435', '159412', '1', '1', '0', '0', '0', '2019-04-19 14:14:40', '2019-04-19 14:14:40');
INSERT INTO `dramascore` VALUES ('2437', '410701', '1', '2', '0', '0', '0', '2019-04-19 16:30:11', '2019-05-26 19:20:59');
INSERT INTO `dramascore` VALUES ('2439', '943', '1', '1', '0', '0', '0', '2019-04-19 19:42:47', '2019-04-19 19:42:47');
INSERT INTO `dramascore` VALUES ('2441', '215', '1', '0', '1', '0', '0', '2019-04-19 20:11:45', '2019-04-19 20:11:45');
INSERT INTO `dramascore` VALUES ('2443', '409823', '1', '1', '0', '0', '3', '2019-04-19 22:00:07', '2019-06-07 08:24:58');
INSERT INTO `dramascore` VALUES ('2445', '160000', '1', '0', '0', '0', '1', '2019-04-19 22:42:39', '2019-04-19 22:42:39');
INSERT INTO `dramascore` VALUES ('2447', '2610', '1', '1', '0', '0', '0', '2019-04-19 23:45:49', '2019-04-19 23:45:49');
INSERT INTO `dramascore` VALUES ('2449', '10192', '2', '2', '1', '0', '0', '2019-04-20 00:08:11', '2019-05-25 12:32:48');
INSERT INTO `dramascore` VALUES ('2451', '11347', '2', '1', '0', '0', '0', '2019-04-20 00:11:40', '2019-04-20 00:11:40');
INSERT INTO `dramascore` VALUES ('2453', '10464', '2', '0', '1', '0', '0', '2019-04-20 00:14:02', '2019-04-20 00:14:02');
INSERT INTO `dramascore` VALUES ('2455', '10145', '2', '3', '0', '0', '0', '2019-04-20 00:16:21', '2019-05-04 07:54:23');
INSERT INTO `dramascore` VALUES ('2457', '157388', '1', '2', '0', '0', '0', '2019-04-20 00:23:14', '2019-04-23 07:48:55');
INSERT INTO `dramascore` VALUES ('2459', '10159', '2', '0', '1', '0', '0', '2019-04-20 00:23:23', '2019-04-20 00:23:23');
INSERT INTO `dramascore` VALUES ('2461', '159630', '1', '2', '0', '0', '0', '2019-04-20 00:25:35', '2019-04-25 02:15:32');
INSERT INTO `dramascore` VALUES ('2463', '152770', '1', '30', '0', '0', '1', '2019-04-20 01:02:43', '2019-05-05 01:55:43');
INSERT INTO `dramascore` VALUES ('2465', '154047', '1', '2', '0', '0', '0', '2019-04-20 01:58:26', '2019-05-19 11:02:02');
INSERT INTO `dramascore` VALUES ('2467', '369267', '1', '6', '0', '0', '0', '2019-04-20 02:46:11', '2019-06-06 06:26:58');
INSERT INTO `dramascore` VALUES ('2469', '10451', '2', '1', '0', '0', '0', '2019-04-20 02:51:33', '2019-04-20 02:51:33');
INSERT INTO `dramascore` VALUES ('2471', '10190', '2', '1', '0', '1', '0', '2019-04-20 02:55:51', '2019-06-09 19:23:24');
INSERT INTO `dramascore` VALUES ('2473', '411305', '1', '3', '0', '0', '0', '2019-04-20 03:34:58', '2019-05-05 01:54:02');
INSERT INTO `dramascore` VALUES ('2475', '2431', '1', '0', '0', '0', '1', '2019-04-20 03:41:19', '2019-04-20 03:41:19');
INSERT INTO `dramascore` VALUES ('2477', '230165', '1', '0', '0', '0', '1', '2019-04-20 05:40:28', '2019-04-20 05:40:28');
INSERT INTO `dramascore` VALUES ('2479', '157435', '1', '1', '0', '0', '0', '2019-04-20 06:31:20', '2019-04-20 06:31:20');
INSERT INTO `dramascore` VALUES ('2481', '156833', '1', '1', '0', '0', '0', '2019-04-20 07:53:14', '2019-04-20 07:53:14');
INSERT INTO `dramascore` VALUES ('2483', '111621', '1', '3', '0', '0', '0', '2019-04-20 08:14:46', '2019-06-08 11:44:07');
INSERT INTO `dramascore` VALUES ('2485', '375085', '1', '2', '0', '0', '0', '2019-04-20 08:15:39', '2019-04-30 11:52:13');
INSERT INTO `dramascore` VALUES ('2487', '160900', '1', '2', '0', '0', '0', '2019-04-20 08:52:29', '2019-06-13 04:01:31');
INSERT INTO `dramascore` VALUES ('2489', '2241', '1', '0', '0', '0', '3', '2019-04-20 09:18:08', '2019-06-09 21:53:34');
INSERT INTO `dramascore` VALUES ('2491', '150529', '1', '0', '1', '0', '0', '2019-04-20 09:21:32', '2019-04-20 09:21:32');
INSERT INTO `dramascore` VALUES ('2493', '285779', '1', '1', '1', '0', '0', '2019-04-20 10:13:49', '2019-06-13 08:54:27');
INSERT INTO `dramascore` VALUES ('2495', '110754', '1', '1', '0', '0', '0', '2019-04-20 10:19:01', '2019-04-20 10:19:01');
INSERT INTO `dramascore` VALUES ('2497', '411135', '1', '14', '1', '1', '1', '2019-04-20 10:19:54', '2019-06-06 05:51:22');
INSERT INTO `dramascore` VALUES ('2499', '151298', '1', '1', '0', '0', '0', '2019-04-20 10:20:13', '2019-04-20 10:20:13');
INSERT INTO `dramascore` VALUES ('2501', '411007', '1', '3', '0', '2', '0', '2019-04-20 10:35:57', '2019-06-03 06:52:43');
INSERT INTO `dramascore` VALUES ('2503', '154248', '1', '0', '1', '0', '0', '2019-04-20 10:39:02', '2019-04-20 10:39:02');
INSERT INTO `dramascore` VALUES ('2505', '10335', '2', '2', '0', '0', '0', '2019-04-20 12:58:32', '2019-05-21 08:13:45');
INSERT INTO `dramascore` VALUES ('2507', '420525', '2', '17', '0', '0', '1', '2019-04-20 19:11:38', '2019-06-13 02:06:11');
INSERT INTO `dramascore` VALUES ('2509', '11157', '1', '3', '0', '0', '1', '2019-04-20 22:45:40', '2019-05-12 17:43:31');
INSERT INTO `dramascore` VALUES ('2511', '161132', '1', '1', '0', '0', '0', '2019-04-20 22:45:52', '2019-04-20 22:45:52');
INSERT INTO `dramascore` VALUES ('2513', '156381', '1', '0', '2', '0', '0', '2019-04-20 22:59:54', '2019-05-15 10:29:45');
INSERT INTO `dramascore` VALUES ('2515', '132', '1', '3', '2', '0', '0', '2019-04-20 23:11:41', '2019-06-08 10:29:11');
INSERT INTO `dramascore` VALUES ('2517', '2457', '1', '1', '0', '0', '0', '2019-04-20 23:44:21', '2019-04-20 23:44:21');
INSERT INTO `dramascore` VALUES ('2519', '157590', '1', '0', '1', '0', '0', '2019-04-21 00:02:03', '2019-04-21 00:02:03');
INSERT INTO `dramascore` VALUES ('2521', '730', '1', '0', '1', '0', '0', '2019-04-21 00:02:27', '2019-04-21 00:02:27');
INSERT INTO `dramascore` VALUES ('2523', '548', '1', '0', '0', '1', '0', '2019-04-21 00:07:30', '2019-04-21 00:07:30');
INSERT INTO `dramascore` VALUES ('2525', '11190', '1', '2', '1', '0', '0', '2019-04-21 01:19:58', '2019-06-04 05:37:48');
INSERT INTO `dramascore` VALUES ('2527', '137841', '1', '1', '0', '0', '0', '2019-04-21 03:16:50', '2019-04-21 03:16:50');
INSERT INTO `dramascore` VALUES ('2529', '10545', '2', '10', '2', '1', '0', '2019-04-21 03:41:30', '2019-06-13 05:33:30');
INSERT INTO `dramascore` VALUES ('2531', '159309', '1', '0', '0', '0', '1', '2019-04-21 03:54:19', '2019-04-21 03:54:19');
INSERT INTO `dramascore` VALUES ('2533', '204747', '1', '0', '2', '0', '1', '2019-04-21 04:25:43', '2019-05-17 23:49:21');
INSERT INTO `dramascore` VALUES ('2535', '410961', '1', '6', '0', '0', '0', '2019-04-21 05:36:00', '2019-05-09 08:46:21');
INSERT INTO `dramascore` VALUES ('2537', '424695', '1', '3', '0', '0', '6', '2019-04-21 06:33:01', '2019-06-02 20:31:06');
INSERT INTO `dramascore` VALUES ('2539', '424517', '1', '4', '0', '0', '2', '2019-04-21 06:33:42', '2019-06-11 01:25:14');
INSERT INTO `dramascore` VALUES ('2541', '155932', '1', '0', '1', '0', '0', '2019-04-21 06:38:53', '2019-04-21 06:38:53');
INSERT INTO `dramascore` VALUES ('2543', '163685', '1', '0', '0', '1', '0', '2019-04-21 07:06:42', '2019-04-21 07:06:42');
INSERT INTO `dramascore` VALUES ('2545', '424841', '1', '19', '2', '1', '2', '2019-04-21 07:16:57', '2019-06-11 20:33:55');
INSERT INTO `dramascore` VALUES ('2547', '51254', '1', '0', '0', '0', '1', '2019-04-21 07:17:50', '2019-04-21 07:17:50');
INSERT INTO `dramascore` VALUES ('2549', '410657', '1', '4', '0', '0', '0', '2019-04-21 07:35:17', '2019-06-09 08:11:45');
INSERT INTO `dramascore` VALUES ('2551', '424593', '1', '22', '3', '1', '6', '2019-04-21 08:18:31', '2019-06-10 10:31:54');
INSERT INTO `dramascore` VALUES ('2553', '153218', '1', '1', '0', '0', '0', '2019-04-21 08:27:25', '2019-04-21 08:27:25');
INSERT INTO `dramascore` VALUES ('2555', '11041', '1', '1', '1', '0', '0', '2019-04-21 08:57:02', '2019-05-25 23:09:47');
INSERT INTO `dramascore` VALUES ('2557', '162266', '1', '4', '0', '0', '0', '2019-04-21 09:24:33', '2019-05-20 09:17:45');
INSERT INTO `dramascore` VALUES ('2559', '32957', '1', '1', '0', '0', '1', '2019-04-21 09:41:44', '2019-04-26 08:26:29');
INSERT INTO `dramascore` VALUES ('2561', '424497', '1', '6', '1', '0', '1', '2019-04-21 10:17:52', '2019-05-19 13:04:20');
INSERT INTO `dramascore` VALUES ('2563', '156272', '1', '1', '0', '0', '0', '2019-04-21 10:40:25', '2019-04-21 10:40:25');
INSERT INTO `dramascore` VALUES ('2565', '11163', '1', '0', '1', '0', '0', '2019-04-21 10:45:01', '2019-04-21 10:45:01');
INSERT INTO `dramascore` VALUES ('2567', '424909', '1', '5', '0', '1', '0', '2019-04-21 11:18:45', '2019-05-10 20:08:30');
INSERT INTO `dramascore` VALUES ('2569', '424413', '1', '16', '1', '0', '0', '2019-04-21 11:18:55', '2019-06-04 12:29:52');
INSERT INTO `dramascore` VALUES ('2571', '158316', '1', '0', '2', '1', '0', '2019-04-21 12:34:39', '2019-06-07 11:21:35');
INSERT INTO `dramascore` VALUES ('2573', '153202', '1', '0', '1', '0', '0', '2019-04-21 13:02:50', '2019-04-21 13:02:50');
INSERT INTO `dramascore` VALUES ('2575', '154384', '1', '1', '0', '0', '0', '2019-04-21 13:26:30', '2019-04-21 13:26:30');
INSERT INTO `dramascore` VALUES ('2577', '25600', '1', '10', '0', '0', '1', '2019-04-21 18:42:08', '2019-06-01 21:47:55');
INSERT INTO `dramascore` VALUES ('2579', '424941', '1', '3', '2', '0', '0', '2019-04-21 23:51:29', '2019-04-30 08:38:19');
INSERT INTO `dramascore` VALUES ('2581', '11021', '1', '1', '0', '0', '0', '2019-04-22 01:45:43', '2019-04-22 01:45:43');
INSERT INTO `dramascore` VALUES ('2583', '1814', '1', '1', '0', '0', '0', '2019-04-22 03:00:23', '2019-04-22 03:00:23');
INSERT INTO `dramascore` VALUES ('2585', '424663', '1', '3', '1', '0', '2', '2019-04-22 03:22:33', '2019-06-09 12:03:57');
INSERT INTO `dramascore` VALUES ('2587', '426505', '1', '30', '4', '2', '12', '2019-04-22 04:52:42', '2019-05-28 09:56:56');
INSERT INTO `dramascore` VALUES ('2589', '411231', '1', '0', '0', '2', '0', '2019-04-22 05:04:34', '2019-05-29 06:50:04');
INSERT INTO `dramascore` VALUES ('2591', '424847', '1', '1', '0', '1', '1', '2019-04-22 07:31:00', '2019-05-01 12:01:09');
INSERT INTO `dramascore` VALUES ('2593', '426491', '1', '13', '1', '1', '0', '2019-04-22 07:32:20', '2019-05-02 10:54:09');
INSERT INTO `dramascore` VALUES ('2595', '424407', '1', '12', '0', '0', '0', '2019-04-22 07:51:07', '2019-06-10 01:31:32');
INSERT INTO `dramascore` VALUES ('2597', '148851', '1', '1', '1', '0', '0', '2019-04-22 08:11:38', '2019-05-12 06:51:59');
INSERT INTO `dramascore` VALUES ('2599', '11170', '1', '1', '0', '0', '0', '2019-04-22 08:20:56', '2019-04-22 08:20:56');
INSERT INTO `dramascore` VALUES ('2601', '424665', '1', '11', '0', '2', '4', '2019-04-22 08:27:48', '2019-06-01 05:48:16');
INSERT INTO `dramascore` VALUES ('2603', '11130', '1', '1', '0', '0', '0', '2019-04-22 08:43:46', '2019-04-22 08:43:46');
INSERT INTO `dramascore` VALUES ('2605', '157969', '1', '4', '1', '0', '0', '2019-04-22 10:27:24', '2019-05-19 09:22:23');
INSERT INTO `dramascore` VALUES ('2607', '151093', '1', '2', '0', '0', '0', '2019-04-22 12:01:33', '2019-05-20 05:42:08');
INSERT INTO `dramascore` VALUES ('2609', '424925', '1', '8', '0', '0', '3', '2019-04-22 13:33:43', '2019-05-30 10:37:59');
INSERT INTO `dramascore` VALUES ('2611', '426437', '1', '8', '0', '0', '3', '2019-04-22 13:34:13', '2019-04-30 11:45:23');
INSERT INTO `dramascore` VALUES ('2613', '369169', '1', '3', '0', '0', '1', '2019-04-22 15:21:52', '2019-06-07 11:20:17');
INSERT INTO `dramascore` VALUES ('2615', '11364', '2', '1', '0', '0', '1', '2019-04-23 01:13:35', '2019-05-19 10:18:10');
INSERT INTO `dramascore` VALUES ('2617', '156451', '1', '3', '0', '0', '0', '2019-04-23 01:36:02', '2019-06-01 05:52:59');
INSERT INTO `dramascore` VALUES ('2619', '158430', '1', '0', '1', '0', '0', '2019-04-23 01:40:24', '2019-04-23 01:40:24');
INSERT INTO `dramascore` VALUES ('2621', '159418', '1', '0', '0', '0', '1', '2019-04-23 01:43:56', '2019-04-23 01:43:56');
INSERT INTO `dramascore` VALUES ('2623', '153017', '1', '1', '0', '0', '0', '2019-04-23 02:04:08', '2019-04-23 02:04:08');
INSERT INTO `dramascore` VALUES ('2625', '159554', '1', '1', '0', '0', '0', '2019-04-23 04:21:29', '2019-04-23 04:21:29');
INSERT INTO `dramascore` VALUES ('2627', '229409', '1', '1', '0', '0', '0', '2019-04-23 04:40:06', '2019-04-23 04:40:06');
INSERT INTO `dramascore` VALUES ('2629', '424871', '1', '6', '0', '0', '0', '2019-04-23 06:20:51', '2019-05-23 18:58:57');
INSERT INTO `dramascore` VALUES ('2631', '149296', '1', '1', '0', '0', '0', '2019-04-23 07:38:28', '2019-04-23 07:38:28');
INSERT INTO `dramascore` VALUES ('2633', '1862', '1', '1', '0', '0', '0', '2019-04-23 07:39:54', '2019-04-23 07:39:54');
INSERT INTO `dramascore` VALUES ('2635', '2065', '1', '4', '0', '0', '0', '2019-04-23 08:17:00', '2019-05-03 10:56:55');
INSERT INTO `dramascore` VALUES ('2637', '86743', '1', '4', '0', '0', '0', '2019-04-23 09:17:19', '2019-05-17 06:18:46');
INSERT INTO `dramascore` VALUES ('2639', '154555', '1', '1', '0', '0', '0', '2019-04-23 09:18:14', '2019-04-23 09:18:14');
INSERT INTO `dramascore` VALUES ('2641', '72459', '1', '0', '1', '0', '0', '2019-04-23 10:05:23', '2019-04-23 10:05:23');
INSERT INTO `dramascore` VALUES ('2643', '424857', '1', '2', '0', '0', '0', '2019-04-23 10:25:32', '2019-05-18 04:02:57');
INSERT INTO `dramascore` VALUES ('2645', '204339', '1', '1', '1', '0', '1', '2019-04-23 10:55:13', '2019-05-04 03:40:01');
INSERT INTO `dramascore` VALUES ('2647', '429073', '2', '7', '0', '0', '2', '2019-04-23 15:45:01', '2019-06-07 09:32:56');
INSERT INTO `dramascore` VALUES ('2649', '154800', '1', '3', '0', '0', '0', '2019-04-23 16:15:13', '2019-06-06 10:35:38');
INSERT INTO `dramascore` VALUES ('2651', '149154', '1', '2', '0', '0', '2', '2019-04-23 16:59:57', '2019-06-10 08:47:59');
INSERT INTO `dramascore` VALUES ('2653', '424929', '1', '0', '1', '0', '0', '2019-04-23 22:42:20', '2019-04-23 22:42:20');
INSERT INTO `dramascore` VALUES ('2655', '424933', '1', '5', '1', '0', '0', '2019-04-24 01:47:18', '2019-06-11 12:00:46');
INSERT INTO `dramascore` VALUES ('2657', '40943', '1', '0', '0', '0', '2', '2019-04-24 01:56:57', '2019-06-10 22:47:54');
INSERT INTO `dramascore` VALUES ('2659', '154210', '1', '1', '0', '0', '0', '2019-04-24 02:37:22', '2019-04-24 02:37:22');
INSERT INTO `dramascore` VALUES ('2661', '158135', '1', '1', '1', '0', '0', '2019-04-24 03:28:19', '2019-05-08 08:48:44');
INSERT INTO `dramascore` VALUES ('2663', '426419', '1', '4', '0', '0', '3', '2019-04-24 04:24:59', '2019-05-24 08:33:31');
INSERT INTO `dramascore` VALUES ('2665', '424425', '1', '10', '0', '0', '0', '2019-04-24 04:54:22', '2019-06-04 12:29:45');
INSERT INTO `dramascore` VALUES ('2667', '424431', '1', '8', '0', '0', '0', '2019-04-24 04:56:45', '2019-06-04 12:29:39');
INSERT INTO `dramascore` VALUES ('2669', '157673', '1', '1', '0', '0', '0', '2019-04-24 05:57:40', '2019-04-24 05:57:40');
INSERT INTO `dramascore` VALUES ('2671', '154993', '1', '1', '0', '0', '0', '2019-04-24 06:42:54', '2019-04-24 06:42:54');
INSERT INTO `dramascore` VALUES ('2673', '181471', '4', '0', '0', '0', '1', '2019-04-24 09:47:21', '2019-04-24 09:47:21');
INSERT INTO `dramascore` VALUES ('2675', '424607', '1', '4', '0', '0', '0', '2019-04-24 11:39:41', '2019-05-13 08:23:22');
INSERT INTO `dramascore` VALUES ('2677', '411357', '1', '3', '0', '0', '0', '2019-04-24 18:43:36', '2019-05-20 09:38:02');
INSERT INTO `dramascore` VALUES ('2679', '425005', '2', '1', '1', '1', '0', '2019-04-24 18:44:24', '2019-05-09 08:44:15');
INSERT INTO `dramascore` VALUES ('2681', '424965', '2', '2', '0', '0', '0', '2019-04-24 18:44:35', '2019-04-24 18:44:36');
INSERT INTO `dramascore` VALUES ('2683', '424605', '2', '5', '0', '0', '0', '2019-04-24 18:44:45', '2019-05-01 09:58:07');
INSERT INTO `dramascore` VALUES ('2685', '160800', '1', '1', '0', '0', '0', '2019-04-24 20:38:02', '2019-04-24 20:38:02');
INSERT INTO `dramascore` VALUES ('2687', '149549', '1', '0', '1', '0', '0', '2019-04-24 23:20:45', '2019-04-24 23:20:45');
INSERT INTO `dramascore` VALUES ('2689', '159795', '1', '2', '0', '0', '0', '2019-04-25 04:39:14', '2019-05-04 10:42:54');
INSERT INTO `dramascore` VALUES ('2691', '157814', '1', '1', '0', '0', '0', '2019-04-25 04:39:22', '2019-04-25 04:39:22');
INSERT INTO `dramascore` VALUES ('2693', '424699', '1', '4', '0', '1', '1', '2019-04-25 05:29:11', '2019-05-31 09:22:04');
INSERT INTO `dramascore` VALUES ('2695', '410927', '1', '1', '0', '0', '2', '2019-04-25 05:30:43', '2019-06-10 10:20:02');
INSERT INTO `dramascore` VALUES ('2697', '159794', '1', '2', '0', '0', '0', '2019-04-25 06:32:06', '2019-05-30 06:15:09');
INSERT INTO `dramascore` VALUES ('2699', '2715', '1', '3', '0', '0', '0', '2019-04-25 06:47:04', '2019-04-27 22:11:27');
INSERT INTO `dramascore` VALUES ('2701', '159921', '1', '1', '0', '0', '0', '2019-04-25 07:41:56', '2019-04-25 07:41:56');
INSERT INTO `dramascore` VALUES ('2703', '157315', '1', '0', '0', '0', '1', '2019-04-25 08:28:44', '2019-04-25 08:28:44');
INSERT INTO `dramascore` VALUES ('2705', '456', '1', '1', '0', '0', '0', '2019-04-25 09:15:58', '2019-04-25 09:15:58');
INSERT INTO `dramascore` VALUES ('2707', '159920', '1', '1', '1', '0', '0', '2019-04-25 23:57:47', '2019-05-25 21:58:02');
INSERT INTO `dramascore` VALUES ('2709', '100004', '1', '1', '0', '0', '1', '2019-04-26 01:43:26', '2019-05-12 02:05:04');
INSERT INTO `dramascore` VALUES ('2711', '424441', '1', '4', '0', '1', '1', '2019-04-26 01:53:22', '2019-06-01 09:41:05');
INSERT INTO `dramascore` VALUES ('2713', '173', '1', '1', '0', '0', '0', '2019-04-26 04:01:31', '2019-04-26 04:01:31');
INSERT INTO `dramascore` VALUES ('2715', '177890', '4', '0', '0', '0', '2', '2019-04-26 04:18:54', '2019-04-26 04:18:55');
INSERT INTO `dramascore` VALUES ('2717', '424577', '1', '4', '1', '0', '1', '2019-04-26 05:02:20', '2019-06-02 14:02:06');
INSERT INTO `dramascore` VALUES ('2719', '148818', '1', '3', '0', '1', '1', '2019-04-26 06:57:28', '2019-05-25 21:44:08');
INSERT INTO `dramascore` VALUES ('2721', '161586', '1', '2', '0', '0', '0', '2019-04-26 07:15:12', '2019-06-06 02:47:25');
INSERT INTO `dramascore` VALUES ('2723', '135', '1', '1', '0', '0', '0', '2019-04-26 09:01:17', '2019-04-26 09:01:17');
INSERT INTO `dramascore` VALUES ('2725', '159017', '1', '1', '0', '0', '0', '2019-04-26 09:15:20', '2019-04-26 09:15:20');
INSERT INTO `dramascore` VALUES ('2727', '160306', '1', '2', '0', '0', '0', '2019-04-26 11:19:13', '2019-05-11 02:16:57');
INSERT INTO `dramascore` VALUES ('2729', '25562', '1', '2', '0', '0', '0', '2019-04-26 12:33:01', '2019-05-01 10:48:44');
INSERT INTO `dramascore` VALUES ('2731', '148327', '1', '0', '0', '0', '1', '2019-04-26 17:20:53', '2019-04-26 17:20:53');
INSERT INTO `dramascore` VALUES ('2733', '424875', '1', '4', '0', '0', '1', '2019-04-26 18:18:24', '2019-05-23 18:58:50');
INSERT INTO `dramascore` VALUES ('2735', '11144', '1', '0', '0', '0', '1', '2019-04-26 21:07:23', '2019-04-26 21:07:23');
INSERT INTO `dramascore` VALUES ('2737', '804', '1', '0', '0', '1', '0', '2019-04-27 00:21:10', '2019-04-27 00:21:10');
INSERT INTO `dramascore` VALUES ('2739', '1223', '1', '1', '0', '0', '0', '2019-04-27 02:05:55', '2019-04-27 02:05:55');
INSERT INTO `dramascore` VALUES ('2741', '9619', '2', '1', '0', '0', '0', '2019-04-27 06:41:53', '2019-04-27 06:41:53');
INSERT INTO `dramascore` VALUES ('2743', '154887', '1', '1', '0', '0', '0', '2019-04-27 07:15:22', '2019-04-27 07:15:22');
INSERT INTO `dramascore` VALUES ('2745', '10332', '2', '3', '0', '0', '0', '2019-04-27 07:40:12', '2019-06-11 11:00:15');
INSERT INTO `dramascore` VALUES ('2747', '15233', '1', '1', '0', '0', '0', '2019-04-27 10:45:47', '2019-04-27 10:45:47');
INSERT INTO `dramascore` VALUES ('2749', '1015', '1', '1', '0', '0', '1', '2019-04-27 11:00:21', '2019-04-28 21:39:32');
INSERT INTO `dramascore` VALUES ('2751', '410875', '1', '1', '0', '0', '1', '2019-04-27 11:09:17', '2019-05-06 05:55:02');
INSERT INTO `dramascore` VALUES ('2753', '2389', '1', '25', '1', '0', '1', '2019-04-27 12:11:50', '2019-06-10 08:50:49');
INSERT INTO `dramascore` VALUES ('2755', '148068', '1', '0', '1', '0', '0', '2019-04-27 12:12:55', '2019-04-27 12:12:55');
INSERT INTO `dramascore` VALUES ('2757', '11109', '1', '1', '0', '0', '0', '2019-04-27 12:17:03', '2019-04-27 12:17:03');
INSERT INTO `dramascore` VALUES ('2759', '154943', '1', '1', '0', '0', '0', '2019-04-27 14:03:04', '2019-04-27 14:03:04');
INSERT INTO `dramascore` VALUES ('2761', '153300', '1', '2', '0', '0', '0', '2019-04-27 19:53:49', '2019-05-19 10:39:25');
INSERT INTO `dramascore` VALUES ('2763', '116', '1', '2', '1', '0', '0', '2019-04-27 20:44:46', '2019-05-13 07:10:00');
INSERT INTO `dramascore` VALUES ('2765', '163388', '1', '1', '0', '0', '0', '2019-04-27 21:41:10', '2019-04-27 21:41:10');
INSERT INTO `dramascore` VALUES ('2767', '148718', '1', '2', '0', '0', '0', '2019-04-27 21:47:29', '2019-05-30 06:19:55');
INSERT INTO `dramascore` VALUES ('2769', '2103', '1', '0', '1', '0', '0', '2019-04-28 01:44:47', '2019-04-28 01:44:47');
INSERT INTO `dramascore` VALUES ('2771', '342', '1', '1', '0', '0', '0', '2019-04-28 02:23:39', '2019-04-28 02:23:39');
INSERT INTO `dramascore` VALUES ('2773', '10312', '2', '0', '0', '1', '0', '2019-04-28 02:56:00', '2019-04-28 02:56:00');
INSERT INTO `dramascore` VALUES ('2775', '162435', '1', '3', '0', '0', '1', '2019-04-28 04:55:48', '2019-06-07 08:25:49');
INSERT INTO `dramascore` VALUES ('2777', '161', '1', '1', '0', '0', '0', '2019-04-28 05:26:24', '2019-04-28 05:26:24');
INSERT INTO `dramascore` VALUES ('2779', '10278', '2', '2', '1', '0', '1', '2019-04-28 09:39:28', '2019-06-04 11:52:42');
INSERT INTO `dramascore` VALUES ('2781', '159870', '1', '2', '1', '0', '0', '2019-04-28 09:39:33', '2019-06-03 06:10:07');
INSERT INTO `dramascore` VALUES ('2783', '159876', '1', '1', '1', '0', '0', '2019-04-28 09:39:42', '2019-05-26 03:14:24');
INSERT INTO `dramascore` VALUES ('2785', '440147', '1', '7', '0', '0', '0', '2019-04-28 09:45:36', '2019-05-19 11:21:38');
INSERT INTO `dramascore` VALUES ('2787', '15103', '1', '4', '0', '0', '0', '2019-04-28 09:58:42', '2019-06-10 09:01:19');
INSERT INTO `dramascore` VALUES ('2789', '424831', '1', '5', '0', '0', '0', '2019-04-28 10:44:23', '2019-06-03 08:19:25');
INSERT INTO `dramascore` VALUES ('2791', '2630', '1', '1', '0', '0', '0', '2019-04-28 10:54:02', '2019-04-28 10:54:02');
INSERT INTO `dramascore` VALUES ('2793', '440151', '1', '39', '4', '1', '0', '2019-04-28 11:10:24', '2019-06-04 12:28:33');
INSERT INTO `dramascore` VALUES ('2795', '440041', '1', '15', '0', '0', '0', '2019-04-28 11:11:20', '2019-06-04 12:28:51');
INSERT INTO `dramascore` VALUES ('2797', '440007', '1', '10', '0', '1', '1', '2019-04-28 11:13:16', '2019-06-09 10:07:39');
INSERT INTO `dramascore` VALUES ('2799', '440057', '1', '3', '0', '0', '0', '2019-04-28 11:14:55', '2019-05-10 20:07:00');
INSERT INTO `dramascore` VALUES ('2801', '440129', '1', '6', '0', '0', '0', '2019-04-28 11:16:08', '2019-05-28 10:49:22');
INSERT INTO `dramascore` VALUES ('2803', '439939', '1', '12', '0', '0', '0', '2019-04-28 11:17:09', '2019-06-04 12:29:08');
INSERT INTO `dramascore` VALUES ('2805', '151040', '1', '1', '0', '0', '0', '2019-04-28 15:34:47', '2019-04-28 15:34:47');
INSERT INTO `dramascore` VALUES ('2807', '440027', '1', '3', '0', '0', '0', '2019-04-28 16:48:49', '2019-05-03 11:10:36');
INSERT INTO `dramascore` VALUES ('2809', '440265', '1', '60', '10', '1', '7', '2019-04-28 17:17:17', '2019-06-08 11:55:29');
INSERT INTO `dramascore` VALUES ('2811', '440117', '1', '8', '0', '0', '0', '2019-04-28 18:18:22', '2019-06-10 12:24:36');
INSERT INTO `dramascore` VALUES ('2813', '158994', '1', '3', '0', '0', '0', '2019-04-28 18:18:56', '2019-06-07 09:28:25');
INSERT INTO `dramascore` VALUES ('2815', '156388', '1', '3', '0', '0', '0', '2019-04-28 18:45:23', '2019-05-11 01:20:48');
INSERT INTO `dramascore` VALUES ('2817', '155325', '1', '1', '0', '0', '0', '2019-04-28 19:30:28', '2019-04-28 19:30:28');
INSERT INTO `dramascore` VALUES ('2819', '440343', '1', '159', '32', '48', '288', '2019-04-28 20:42:01', '2019-06-13 11:48:35');
INSERT INTO `dramascore` VALUES ('2821', '156214', '1', '1', '0', '0', '0', '2019-04-28 20:45:38', '2019-04-28 20:45:38');
INSERT INTO `dramascore` VALUES ('2823', '10062', '2', '3', '0', '0', '2', '2019-04-28 21:36:12', '2019-06-02 20:26:35');
INSERT INTO `dramascore` VALUES ('2825', '440323', '1', '49', '2', '0', '2', '2019-04-28 22:20:18', '2019-06-11 11:33:58');
INSERT INTO `dramascore` VALUES ('2827', '440035', '1', '6', '0', '0', '0', '2019-04-28 22:39:49', '2019-06-12 02:36:25');
INSERT INTO `dramascore` VALUES ('2829', '439999', '1', '0', '0', '1', '1', '2019-04-29 00:19:30', '2019-05-19 01:51:30');
INSERT INTO `dramascore` VALUES ('2831', '159897', '1', '2', '0', '0', '1', '2019-04-29 00:45:58', '2019-06-07 08:25:32');
INSERT INTO `dramascore` VALUES ('2833', '550', '1', '1', '0', '0', '1', '2019-04-29 01:41:56', '2019-04-29 03:17:07');
INSERT INTO `dramascore` VALUES ('2835', '147853', '1', '0', '0', '0', '1', '2019-04-29 03:18:14', '2019-04-29 03:18:14');
INSERT INTO `dramascore` VALUES ('2837', '440307', '1', '23', '1', '1', '14', '2019-04-29 03:21:31', '2019-05-11 12:09:38');
INSERT INTO `dramascore` VALUES ('2839', '370743', '1', '3', '0', '0', '1', '2019-04-29 04:40:52', '2019-05-24 00:55:04');
INSERT INTO `dramascore` VALUES ('2841', '160934', '1', '2', '0', '0', '0', '2019-04-29 05:31:50', '2019-04-29 22:35:28');
INSERT INTO `dramascore` VALUES ('2843', '107763', '1', '0', '0', '0', '2', '2019-04-29 05:57:30', '2019-05-12 10:40:33');
INSERT INTO `dramascore` VALUES ('2845', '10167', '2', '3', '0', '0', '0', '2019-04-29 06:21:27', '2019-04-29 06:21:28');
INSERT INTO `dramascore` VALUES ('2847', '355903', '2', '1', '0', '0', '0', '2019-04-29 07:51:09', '2019-04-29 07:51:09');
INSERT INTO `dramascore` VALUES ('2849', '440171', '1', '5', '0', '0', '3', '2019-04-29 08:30:54', '2019-06-05 07:10:00');
INSERT INTO `dramascore` VALUES ('2851', '23096', '1', '1', '0', '0', '1', '2019-04-29 08:43:38', '2019-05-27 00:34:03');
INSERT INTO `dramascore` VALUES ('2853', '10938', '1', '3', '0', '0', '0', '2019-04-29 08:50:03', '2019-05-07 03:04:10');
INSERT INTO `dramascore` VALUES ('2855', '147314', '1', '2', '0', '0', '0', '2019-04-29 08:55:31', '2019-06-04 21:20:13');
INSERT INTO `dramascore` VALUES ('2857', '517', '1', '1', '0', '0', '0', '2019-04-29 09:09:07', '2019-04-29 09:09:07');
INSERT INTO `dramascore` VALUES ('2859', '10193', '2', '1', '0', '0', '0', '2019-04-29 10:46:37', '2019-04-29 10:46:37');
INSERT INTO `dramascore` VALUES ('2861', '440317', '1', '2', '0', '0', '7', '2019-04-29 11:49:39', '2019-05-16 19:23:47');
INSERT INTO `dramascore` VALUES ('2863', '26324', '1', '3', '0', '0', '0', '2019-04-29 22:35:47', '2019-06-10 09:00:51');
INSERT INTO `dramascore` VALUES ('2865', '157573', '1', '1', '0', '0', '0', '2019-04-29 22:37:07', '2019-04-29 22:37:07');
INSERT INTO `dramascore` VALUES ('2867', '440277', '1', '5', '1', '0', '0', '2019-04-30 01:38:21', '2019-05-26 09:58:10');
INSERT INTO `dramascore` VALUES ('2869', '1822', '1', '1', '0', '0', '0', '2019-04-30 03:46:59', '2019-04-30 03:46:59');
INSERT INTO `dramascore` VALUES ('2871', '440243', '1', '4', '2', '0', '2', '2019-04-30 04:18:07', '2019-05-27 03:33:19');
INSERT INTO `dramascore` VALUES ('2873', '147277', '1', '0', '0', '1', '0', '2019-04-30 07:31:21', '2019-04-30 07:31:21');
INSERT INTO `dramascore` VALUES ('2875', '153329', '1', '4', '1', '0', '0', '2019-04-30 08:29:17', '2019-06-05 03:01:13');
INSERT INTO `dramascore` VALUES ('2877', '440217', '1', '1', '0', '0', '1', '2019-04-30 09:06:37', '2019-04-30 10:47:27');
INSERT INTO `dramascore` VALUES ('2879', '440125', '1', '3', '0', '0', '0', '2019-04-30 09:10:36', '2019-05-17 07:16:27');
INSERT INTO `dramascore` VALUES ('2881', '440211', '1', '1', '0', '1', '0', '2019-04-30 11:05:48', '2019-05-01 11:08:28');
INSERT INTO `dramascore` VALUES ('2883', '10340', '2', '2', '0', '0', '0', '2019-04-30 11:46:39', '2019-05-09 04:41:28');
INSERT INTO `dramascore` VALUES ('2885', '410973', '1', '1', '0', '0', '1', '2019-04-30 17:23:11', '2019-05-17 00:26:28');
INSERT INTO `dramascore` VALUES ('2887', '2473', '1', '1', '0', '0', '0', '2019-04-30 18:04:57', '2019-04-30 18:04:57');
INSERT INTO `dramascore` VALUES ('2889', '443447', '2', '4', '0', '0', '0', '2019-04-30 18:45:54', '2019-06-01 22:37:55');
INSERT INTO `dramascore` VALUES ('2891', '153173', '1', '2', '0', '0', '0', '2019-05-01 00:00:30', '2019-05-05 00:31:45');
INSERT INTO `dramascore` VALUES ('2893', '440197', '1', '1', '0', '1', '0', '2019-05-01 00:24:35', '2019-06-13 09:00:35');
INSERT INTO `dramascore` VALUES ('2895', '11088', '1', '1', '1', '0', '0', '2019-05-01 02:59:25', '2019-05-29 07:15:37');
INSERT INTO `dramascore` VALUES ('2897', '155081', '1', '1', '0', '0', '1', '2019-05-01 03:10:59', '2019-05-20 03:57:17');
INSERT INTO `dramascore` VALUES ('2899', '158041', '1', '1', '0', '0', '0', '2019-05-01 03:18:09', '2019-05-01 03:18:09');
INSERT INTO `dramascore` VALUES ('2901', '370647', '1', '5', '0', '0', '1', '2019-05-01 05:11:01', '2019-05-28 04:50:22');
INSERT INTO `dramascore` VALUES ('2903', '10535', '2', '5', '0', '0', '0', '2019-05-01 05:30:50', '2019-05-07 05:35:31');
INSERT INTO `dramascore` VALUES ('2905', '141859', '1', '2', '0', '0', '0', '2019-05-01 08:29:20', '2019-06-10 05:04:18');
INSERT INTO `dramascore` VALUES ('2907', '440215', '1', '1', '0', '0', '1', '2019-05-01 09:22:20', '2019-05-09 15:01:50');
INSERT INTO `dramascore` VALUES ('2909', '103032', '1', '1', '0', '0', '0', '2019-05-01 10:24:23', '2019-05-01 10:24:23');
INSERT INTO `dramascore` VALUES ('2911', '154331', '1', '1', '0', '0', '1', '2019-05-01 10:31:54', '2019-05-02 06:23:19');
INSERT INTO `dramascore` VALUES ('2913', '440221', '1', '2', '0', '0', '1', '2019-05-01 12:05:55', '2019-05-09 08:37:24');
INSERT INTO `dramascore` VALUES ('2915', '11003', '1', '3', '0', '0', '0', '2019-05-01 14:13:40', '2019-05-15 23:15:47');
INSERT INTO `dramascore` VALUES ('2917', '182377', '4', '1', '0', '0', '0', '2019-05-01 18:28:22', '2019-05-01 18:28:22');
INSERT INTO `dramascore` VALUES ('2919', '162914', '1', '2', '0', '0', '0', '2019-05-01 21:37:24', '2019-06-01 08:10:42');
INSERT INTO `dramascore` VALUES ('2921', '646', '1', '1', '0', '0', '0', '2019-05-01 22:00:04', '2019-05-01 22:00:04');
INSERT INTO `dramascore` VALUES ('2923', '866', '1', '1', '0', '0', '0', '2019-05-01 22:01:27', '2019-05-01 22:01:27');
INSERT INTO `dramascore` VALUES ('2925', '153148', '1', '1', '0', '0', '0', '2019-05-01 22:34:42', '2019-05-01 22:34:42');
INSERT INTO `dramascore` VALUES ('2927', '154398', '1', '1', '0', '0', '0', '2019-05-01 22:54:43', '2019-05-01 22:54:43');
INSERT INTO `dramascore` VALUES ('2929', '1356', '1', '1', '0', '0', '0', '2019-05-01 23:13:34', '2019-05-01 23:13:34');
INSERT INTO `dramascore` VALUES ('2931', '372', '1', '2', '0', '0', '0', '2019-05-02 03:21:13', '2019-05-05 08:57:23');
INSERT INTO `dramascore` VALUES ('2933', '10436', '2', '2', '0', '0', '0', '2019-05-02 05:56:33', '2019-05-10 10:30:42');
INSERT INTO `dramascore` VALUES ('2935', '156898', '1', '1', '0', '0', '0', '2019-05-02 06:07:50', '2019-05-02 06:07:50');
INSERT INTO `dramascore` VALUES ('2937', '11223', '1', '1', '0', '0', '0', '2019-05-02 06:22:20', '2019-05-02 06:22:20');
INSERT INTO `dramascore` VALUES ('2939', '157953', '1', '1', '0', '0', '0', '2019-05-02 07:24:36', '2019-05-02 07:24:36');
INSERT INTO `dramascore` VALUES ('2941', '1156', '1', '1', '0', '0', '0', '2019-05-02 08:27:24', '2019-05-02 08:27:24');
INSERT INTO `dramascore` VALUES ('2943', '157081', '1', '1', '0', '0', '0', '2019-05-02 09:40:38', '2019-05-02 09:40:38');
INSERT INTO `dramascore` VALUES ('2945', '156727', '1', '0', '0', '1', '0', '2019-05-02 10:00:42', '2019-05-02 10:00:42');
INSERT INTO `dramascore` VALUES ('2947', '153812', '1', '0', '1', '0', '0', '2019-05-02 10:13:05', '2019-05-02 10:13:05');
INSERT INTO `dramascore` VALUES ('2949', '439953', '1', '4', '0', '0', '0', '2019-05-02 12:22:01', '2019-05-13 10:16:53');
INSERT INTO `dramascore` VALUES ('2951', '1701', '1', '2', '0', '0', '0', '2019-05-02 14:37:17', '2019-06-12 06:47:35');
INSERT INTO `dramascore` VALUES ('2953', '10488', '1', '1', '0', '0', '0', '2019-05-02 15:53:38', '2019-05-02 15:53:38');
INSERT INTO `dramascore` VALUES ('2955', '786', '1', '0', '1', '0', '0', '2019-05-03 01:35:09', '2019-05-03 01:35:09');
INSERT INTO `dramascore` VALUES ('2957', '842', '1', '0', '1', '0', '0', '2019-05-03 04:01:33', '2019-05-03 04:01:33');
INSERT INTO `dramascore` VALUES ('2959', '158777', '1', '1', '0', '0', '0', '2019-05-03 04:33:48', '2019-05-03 04:33:48');
INSERT INTO `dramascore` VALUES ('2961', '829', '1', '7', '1', '0', '4', '2019-05-03 07:28:41', '2019-05-19 04:09:48');
INSERT INTO `dramascore` VALUES ('2963', '76', '1', '1', '0', '0', '0', '2019-05-03 08:01:49', '2019-05-03 08:01:49');
INSERT INTO `dramascore` VALUES ('2965', '158295', '1', '1', '0', '0', '0', '2019-05-03 09:50:13', '2019-05-03 09:50:13');
INSERT INTO `dramascore` VALUES ('2967', '156184', '1', '1', '0', '0', '0', '2019-05-03 10:04:29', '2019-05-03 10:04:29');
INSERT INTO `dramascore` VALUES ('2969', '156187', '1', '1', '0', '0', '0', '2019-05-03 10:04:42', '2019-05-03 10:04:42');
INSERT INTO `dramascore` VALUES ('2971', '156180', '1', '1', '0', '0', '0', '2019-05-03 10:04:56', '2019-05-03 10:04:56');
INSERT INTO `dramascore` VALUES ('2973', '154615', '1', '1', '0', '0', '0', '2019-05-03 10:09:30', '2019-05-03 10:09:30');
INSERT INTO `dramascore` VALUES ('2975', '154024', '1', '2', '0', '0', '0', '2019-05-03 10:11:16', '2019-05-12 12:07:04');
INSERT INTO `dramascore` VALUES ('2977', '154134', '1', '1', '0', '0', '0', '2019-05-03 10:11:26', '2019-05-03 10:11:26');
INSERT INTO `dramascore` VALUES ('2979', '153878', '1', '1', '0', '0', '0', '2019-05-03 10:11:40', '2019-05-03 10:11:40');
INSERT INTO `dramascore` VALUES ('2981', '153874', '1', '1', '0', '0', '0', '2019-05-03 10:12:09', '2019-05-03 10:12:09');
INSERT INTO `dramascore` VALUES ('2983', '151107', '1', '1', '0', '0', '0', '2019-05-03 10:17:23', '2019-05-03 10:17:23');
INSERT INTO `dramascore` VALUES ('2985', '156265', '1', '1', '0', '0', '0', '2019-05-03 10:34:57', '2019-05-03 10:34:57');
INSERT INTO `dramascore` VALUES ('2987', '149251', '1', '1', '0', '0', '0', '2019-05-03 10:39:06', '2019-05-03 10:39:06');
INSERT INTO `dramascore` VALUES ('2989', '11178', '1', '1', '0', '0', '0', '2019-05-03 10:48:53', '2019-05-03 10:48:53');
INSERT INTO `dramascore` VALUES ('2991', '2327', '1', '1', '0', '0', '0', '2019-05-03 10:52:30', '2019-05-03 10:52:30');
INSERT INTO `dramascore` VALUES ('2993', '2322', '1', '2', '0', '0', '0', '2019-05-03 10:52:50', '2019-05-08 02:51:43');
INSERT INTO `dramascore` VALUES ('2995', '2324', '1', '2', '2', '1', '0', '2019-05-03 10:52:59', '2019-06-07 08:52:04');
INSERT INTO `dramascore` VALUES ('2997', '2320', '1', '1', '0', '0', '0', '2019-05-03 10:53:06', '2019-05-03 10:53:06');
INSERT INTO `dramascore` VALUES ('2999', '2319', '1', '3', '0', '0', '0', '2019-05-03 10:53:14', '2019-05-08 11:24:30');
INSERT INTO `dramascore` VALUES ('3001', '2304', '1', '1', '0', '0', '0', '2019-05-03 10:53:40', '2019-05-03 10:53:40');
INSERT INTO `dramascore` VALUES ('3003', '2078', '1', '1', '0', '0', '0', '2019-05-03 10:56:41', '2019-05-03 10:56:41');
INSERT INTO `dramascore` VALUES ('3005', '424687', '1', '2', '0', '0', '1', '2019-05-03 11:03:44', '2019-05-21 05:42:32');
INSERT INTO `dramascore` VALUES ('3007', '1848', '1', '1', '0', '0', '0', '2019-05-03 11:25:19', '2019-05-03 11:25:19');
INSERT INTO `dramascore` VALUES ('3009', '1716', '1', '1', '0', '0', '0', '2019-05-03 11:25:40', '2019-05-03 11:25:40');
INSERT INTO `dramascore` VALUES ('3011', '369197', '1', '1', '0', '0', '0', '2019-05-03 11:39:21', '2019-05-03 11:39:21');
INSERT INTO `dramascore` VALUES ('3013', '10130', '2', '2', '0', '0', '0', '2019-05-03 16:30:02', '2019-05-24 10:45:32');
INSERT INTO `dramascore` VALUES ('3015', '157847', '1', '0', '0', '0', '2', '2019-05-03 16:52:48', '2019-05-03 16:52:48');
INSERT INTO `dramascore` VALUES ('3017', '158019', '1', '0', '0', '0', '1', '2019-05-03 22:53:24', '2019-05-03 22:53:24');
INSERT INTO `dramascore` VALUES ('3019', '148890', '1', '1', '0', '0', '1', '2019-05-03 23:25:41', '2019-05-03 23:26:39');
INSERT INTO `dramascore` VALUES ('3021', '10975', '1', '3', '0', '0', '1', '2019-05-03 23:33:50', '2019-05-29 00:55:38');
INSERT INTO `dramascore` VALUES ('3023', '320365', '1', '0', '0', '1', '0', '2019-05-04 03:51:12', '2019-05-04 03:51:12');
INSERT INTO `dramascore` VALUES ('3025', '97', '1', '2', '0', '0', '0', '2019-05-04 04:23:16', '2019-06-01 17:28:09');
INSERT INTO `dramascore` VALUES ('3027', '148997', '1', '0', '0', '0', '2', '2019-05-04 06:31:36', '2019-05-31 23:53:27');
INSERT INTO `dramascore` VALUES ('3029', '15156', '1', '0', '0', '0', '1', '2019-05-04 06:33:51', '2019-05-04 06:33:51');
INSERT INTO `dramascore` VALUES ('3031', '157405', '1', '0', '0', '0', '2', '2019-05-04 07:51:00', '2019-05-20 09:44:54');
INSERT INTO `dramascore` VALUES ('3033', '158034', '1', '0', '0', '0', '1', '2019-05-04 08:17:52', '2019-05-04 08:17:52');
INSERT INTO `dramascore` VALUES ('3035', '153193', '1', '0', '1', '0', '0', '2019-05-04 08:42:27', '2019-05-04 08:42:27');
INSERT INTO `dramascore` VALUES ('3037', '10149', '2', '4', '1', '1', '3', '2019-05-04 09:12:17', '2019-06-11 06:56:47');
INSERT INTO `dramascore` VALUES ('3039', '9609', '2', '3', '0', '0', '0', '2019-05-04 09:12:35', '2019-06-02 09:24:29');
INSERT INTO `dramascore` VALUES ('3041', '448513', '2', '3', '0', '0', '0', '2019-05-04 09:27:49', '2019-05-09 21:15:53');
INSERT INTO `dramascore` VALUES ('3043', '448527', '2', '3', '0', '0', '0', '2019-05-04 10:50:28', '2019-05-19 04:08:37');
INSERT INTO `dramascore` VALUES ('3045', '168757', '2', '4', '0', '0', '0', '2019-05-04 12:33:57', '2019-05-31 22:37:18');
INSERT INTO `dramascore` VALUES ('3047', '109879', '1', '0', '0', '0', '1', '2019-05-04 14:20:20', '2019-05-04 14:20:20');
INSERT INTO `dramascore` VALUES ('3049', '163811', '1', '1', '0', '0', '0', '2019-05-04 18:28:59', '2019-05-04 18:28:59');
INSERT INTO `dramascore` VALUES ('3051', '158624', '1', '1', '0', '1', '1', '2019-05-04 19:42:38', '2019-05-27 01:35:55');
INSERT INTO `dramascore` VALUES ('3053', '159853', '1', '2', '0', '1', '0', '2019-05-04 20:00:59', '2019-06-01 08:58:51');
INSERT INTO `dramascore` VALUES ('3055', '158631', '1', '1', '0', '1', '0', '2019-05-04 21:15:03', '2019-05-04 21:31:34');
INSERT INTO `dramascore` VALUES ('3057', '10865', '4', '10', '0', '0', '0', '2019-05-04 21:47:58', '2019-05-05 13:44:21');
INSERT INTO `dramascore` VALUES ('3059', '1543', '1', '1', '0', '0', '0', '2019-05-04 22:19:36', '2019-05-04 22:19:36');
INSERT INTO `dramascore` VALUES ('3061', '2182', '1', '1', '0', '0', '0', '2019-05-05 01:11:44', '2019-05-05 01:11:44');
INSERT INTO `dramascore` VALUES ('3063', '233', '1', '1', '0', '1', '0', '2019-05-05 02:03:54', '2019-05-20 09:08:59');
INSERT INTO `dramascore` VALUES ('3065', '154640', '1', '1', '0', '0', '0', '2019-05-05 02:48:01', '2019-05-05 02:48:01');
INSERT INTO `dramascore` VALUES ('3067', '157603', '1', '1', '0', '0', '0', '2019-05-05 02:57:12', '2019-05-05 02:57:12');
INSERT INTO `dramascore` VALUES ('3069', '152890', '1', '0', '0', '0', '1', '2019-05-05 03:34:05', '2019-05-05 03:34:05');
INSERT INTO `dramascore` VALUES ('3071', '10123', '2', '1', '0', '0', '0', '2019-05-05 03:38:16', '2019-05-05 03:38:16');
INSERT INTO `dramascore` VALUES ('3073', '1860', '1', '0', '0', '0', '1', '2019-05-05 04:05:54', '2019-05-05 04:05:54');
INSERT INTO `dramascore` VALUES ('3075', '455361', '2', '10', '1', '0', '0', '2019-05-05 04:14:44', '2019-06-10 08:34:04');
INSERT INTO `dramascore` VALUES ('3077', '158156', '1', '0', '0', '0', '1', '2019-05-05 04:28:37', '2019-05-05 04:28:37');
INSERT INTO `dramascore` VALUES ('3079', '159688', '1', '4', '0', '0', '0', '2019-05-05 04:29:36', '2019-05-31 00:32:45');
INSERT INTO `dramascore` VALUES ('3081', '10320', '2', '1', '0', '0', '0', '2019-05-05 04:30:08', '2019-05-05 04:30:08');
INSERT INTO `dramascore` VALUES ('3083', '30833', '1', '4', '2', '0', '1', '2019-05-05 08:08:13', '2019-06-09 01:25:22');
INSERT INTO `dramascore` VALUES ('3085', '456029', '1', '10', '0', '0', '1', '2019-05-05 08:37:22', '2019-05-29 08:21:27');
INSERT INTO `dramascore` VALUES ('3087', '10404', '2', '1', '0', '0', '0', '2019-05-05 09:57:25', '2019-05-05 09:57:25');
INSERT INTO `dramascore` VALUES ('3089', '456155', '1', '6', '0', '0', '0', '2019-05-05 10:17:41', '2019-06-09 23:20:42');
INSERT INTO `dramascore` VALUES ('3091', '154816', '1', '1', '0', '0', '0', '2019-05-05 10:29:40', '2019-05-05 10:29:40');
INSERT INTO `dramascore` VALUES ('3093', '153114', '1', '1', '0', '0', '0', '2019-05-05 11:21:12', '2019-05-05 11:21:12');
INSERT INTO `dramascore` VALUES ('3095', '2199', '1', '1', '0', '0', '0', '2019-05-05 11:22:44', '2019-05-05 11:22:44');
INSERT INTO `dramascore` VALUES ('3097', '153060', '1', '1', '0', '0', '0', '2019-05-05 11:38:55', '2019-05-05 11:38:55');
INSERT INTO `dramascore` VALUES ('3099', '153211', '1', '0', '0', '1', '0', '2019-05-05 11:52:20', '2019-05-05 11:52:20');
INSERT INTO `dramascore` VALUES ('3101', '456071', '1', '3', '0', '0', '2', '2019-05-05 11:52:21', '2019-05-16 19:25:32');
INSERT INTO `dramascore` VALUES ('3103', '157483', '1', '0', '1', '0', '0', '2019-05-05 12:08:12', '2019-05-05 12:08:12');
INSERT INTO `dramascore` VALUES ('3105', '10263', '2', '2', '0', '0', '0', '2019-05-05 13:07:07', '2019-06-09 03:48:54');
INSERT INTO `dramascore` VALUES ('3107', '151196', '1', '1', '0', '0', '0', '2019-05-05 13:13:20', '2019-05-05 13:13:20');
INSERT INTO `dramascore` VALUES ('3109', '456357', '1', '80', '3', '2', '2', '2019-05-05 13:54:43', '2019-06-02 09:22:45');
INSERT INTO `dramascore` VALUES ('3111', '148729', '1', '0', '0', '1', '0', '2019-05-05 16:50:46', '2019-05-05 16:50:46');
INSERT INTO `dramascore` VALUES ('3113', '456487', '1', '9', '0', '0', '1', '2019-05-05 17:21:40', '2019-06-10 05:05:51');
INSERT INTO `dramascore` VALUES ('3115', '11000', '1', '1', '0', '0', '0', '2019-05-05 17:33:10', '2019-05-05 17:33:10');
INSERT INTO `dramascore` VALUES ('3117', '229413', '1', '1', '0', '0', '0', '2019-05-05 18:42:27', '2019-05-05 18:42:27');
INSERT INTO `dramascore` VALUES ('3119', '49199', '1', '1', '0', '0', '0', '2019-05-05 22:27:48', '2019-05-05 22:27:48');
INSERT INTO `dramascore` VALUES ('3121', '101286', '1', '0', '0', '1', '1', '2019-05-05 22:28:38', '2019-06-05 20:54:28');
INSERT INTO `dramascore` VALUES ('3123', '448491', '2', '2', '0', '0', '0', '2019-05-05 22:40:24', '2019-05-10 01:34:44');
INSERT INTO `dramascore` VALUES ('3125', '456511', '1', '7', '0', '0', '3', '2019-05-05 22:43:36', '2019-06-02 08:27:22');
INSERT INTO `dramascore` VALUES ('3127', '456293', '1', '1', '3', '0', '1', '2019-05-06 00:39:42', '2019-06-10 07:11:23');
INSERT INTO `dramascore` VALUES ('3129', '11148', '1', '0', '0', '1', '0', '2019-05-06 01:26:46', '2019-05-06 01:26:46');
INSERT INTO `dramascore` VALUES ('3131', '456535', '1', '7', '0', '0', '1', '2019-05-06 02:21:35', '2019-05-31 01:43:47');
INSERT INTO `dramascore` VALUES ('3133', '160224', '1', '2', '1', '0', '1', '2019-05-06 02:42:48', '2019-06-07 08:26:07');
INSERT INTO `dramascore` VALUES ('3135', '239', '1', '1', '1', '0', '0', '2019-05-06 03:42:20', '2019-05-31 05:30:24');
INSERT INTO `dramascore` VALUES ('3137', '456475', '1', '9', '0', '1', '0', '2019-05-06 04:13:22', '2019-06-11 12:03:22');
INSERT INTO `dramascore` VALUES ('3139', '10364', '2', '8', '0', '0', '0', '2019-05-06 04:27:16', '2019-06-06 05:00:47');
INSERT INTO `dramascore` VALUES ('3141', '2200', '1', '1', '0', '0', '0', '2019-05-06 05:33:23', '2019-05-06 05:33:23');
INSERT INTO `dramascore` VALUES ('3143', '458017', '1', '2', '1', '0', '2', '2019-05-06 06:25:54', '2019-05-19 09:49:54');
INSERT INTO `dramascore` VALUES ('3145', '65', '1', '1', '0', '0', '0', '2019-05-06 07:31:40', '2019-05-06 07:31:40');
INSERT INTO `dramascore` VALUES ('3147', '456287', '1', '7', '1', '0', '1', '2019-05-06 07:43:19', '2019-06-03 03:16:49');
INSERT INTO `dramascore` VALUES ('3149', '458033', '1', '46', '4', '3', '3', '2019-05-06 07:55:45', '2019-06-04 12:27:26');
INSERT INTO `dramascore` VALUES ('3151', '456517', '1', '7', '2', '1', '0', '2019-05-06 07:56:35', '2019-05-28 10:48:22');
INSERT INTO `dramascore` VALUES ('3153', '456327', '1', '6', '0', '0', '2', '2019-05-06 09:15:58', '2019-05-23 09:46:33');
INSERT INTO `dramascore` VALUES ('3155', '456317', '1', '11', '2', '0', '1', '2019-05-06 09:20:06', '2019-06-10 05:45:02');
INSERT INTO `dramascore` VALUES ('3157', '163519', '1', '2', '0', '0', '0', '2019-05-06 09:28:20', '2019-05-07 09:26:44');
INSERT INTO `dramascore` VALUES ('3159', '457951', '1', '6', '1', '0', '0', '2019-05-06 10:16:45', '2019-05-18 11:15:19');
INSERT INTO `dramascore` VALUES ('3161', '11196', '1', '66', '0', '0', '2', '2019-05-06 10:33:30', '2019-06-10 03:28:37');
INSERT INTO `dramascore` VALUES ('3163', '456277', '1', '4', '0', '0', '1', '2019-05-06 10:55:46', '2019-06-13 03:45:59');
INSERT INTO `dramascore` VALUES ('3165', '456163', '1', '3', '0', '0', '0', '2019-05-06 14:22:44', '2019-06-13 02:09:49');
INSERT INTO `dramascore` VALUES ('3167', '446087', '2', '1', '0', '0', '0', '2019-05-06 15:14:22', '2019-05-06 15:14:22');
INSERT INTO `dramascore` VALUES ('3169', '153279', '1', '1', '0', '0', '1', '2019-05-06 20:31:42', '2019-05-10 09:29:31');
INSERT INTO `dramascore` VALUES ('3171', '456047', '1', '2', '0', '0', '0', '2019-05-06 21:01:36', '2019-06-12 14:39:52');
INSERT INTO `dramascore` VALUES ('3173', '456099', '1', '2', '1', '0', '0', '2019-05-07 04:08:25', '2019-05-16 19:37:37');
INSERT INTO `dramascore` VALUES ('3175', '10348', '2', '1', '0', '0', '0', '2019-05-07 06:17:50', '2019-05-07 06:17:50');
INSERT INTO `dramascore` VALUES ('3177', '2693', '1', '1', '0', '0', '0', '2019-05-07 06:32:16', '2019-05-07 06:32:16');
INSERT INTO `dramascore` VALUES ('3179', '162347', '1', '1', '0', '0', '0', '2019-05-07 08:14:23', '2019-05-07 08:14:23');
INSERT INTO `dramascore` VALUES ('3181', '10565', '2', '0', '0', '0', '1', '2019-05-07 08:32:37', '2019-05-07 08:32:37');
INSERT INTO `dramascore` VALUES ('3183', '10401', '2', '0', '0', '0', '1', '2019-05-07 08:34:39', '2019-05-07 08:34:39');
INSERT INTO `dramascore` VALUES ('3185', '446083', '2', '2', '0', '0', '0', '2019-05-07 09:09:16', '2019-05-27 09:56:55');
INSERT INTO `dramascore` VALUES ('3187', '456171', '1', '1', '0', '0', '1', '2019-05-07 09:20:05', '2019-05-07 11:15:34');
INSERT INTO `dramascore` VALUES ('3189', '10175', '2', '2', '0', '0', '0', '2019-05-07 10:11:04', '2019-06-01 11:14:21');
INSERT INTO `dramascore` VALUES ('3191', '181289', '4', '1', '0', '0', '0', '2019-05-07 10:40:15', '2019-05-07 10:40:15');
INSERT INTO `dramascore` VALUES ('3193', '177345', '4', '1', '0', '0', '0', '2019-05-07 10:44:25', '2019-05-07 10:44:25');
INSERT INTO `dramascore` VALUES ('3195', '10618', '4', '1', '0', '0', '0', '2019-05-07 10:47:39', '2019-05-07 10:47:39');
INSERT INTO `dramascore` VALUES ('3197', '10623', '4', '1', '0', '1', '0', '2019-05-07 10:48:01', '2019-05-14 00:19:29');
INSERT INTO `dramascore` VALUES ('3199', '10625', '4', '2', '0', '0', '0', '2019-05-07 10:48:24', '2019-06-08 09:23:13');
INSERT INTO `dramascore` VALUES ('3201', '10626', '4', '1', '0', '0', '0', '2019-05-07 10:48:30', '2019-05-07 10:48:30');
INSERT INTO `dramascore` VALUES ('3203', '10644', '4', '1', '0', '0', '0', '2019-05-07 10:48:53', '2019-05-07 10:48:53');
INSERT INTO `dramascore` VALUES ('3205', '10875', '4', '1', '0', '0', '1', '2019-05-07 10:49:59', '2019-06-01 23:07:09');
INSERT INTO `dramascore` VALUES ('3207', '10877', '4', '1', '0', '0', '0', '2019-05-07 10:50:15', '2019-05-07 10:50:15');
INSERT INTO `dramascore` VALUES ('3209', '10906', '4', '1', '0', '0', '0', '2019-05-07 10:51:00', '2019-05-07 10:51:00');
INSERT INTO `dramascore` VALUES ('3211', '11604', '4', '1', '0', '0', '0', '2019-05-07 10:53:13', '2019-05-07 10:53:13');
INSERT INTO `dramascore` VALUES ('3213', '458689', '2', '8', '0', '1', '0', '2019-05-07 10:54:11', '2019-06-12 11:35:55');
INSERT INTO `dramascore` VALUES ('3215', '11529', '4', '1', '0', '0', '1', '2019-05-07 11:08:12', '2019-06-10 15:50:49');
INSERT INTO `dramascore` VALUES ('3217', '458029', '1', '10', '5', '9', '45', '2019-05-07 11:09:01', '2019-06-06 00:04:53');
INSERT INTO `dramascore` VALUES ('3219', '375065', '1', '3', '0', '0', '0', '2019-05-07 15:21:48', '2019-05-22 08:26:26');
INSERT INTO `dramascore` VALUES ('3221', '154913', '1', '1', '0', '0', '1', '2019-05-07 15:34:16', '2019-05-30 18:00:14');
INSERT INTO `dramascore` VALUES ('3223', '10207', '2', '11', '0', '0', '0', '2019-05-07 15:51:54', '2019-06-06 20:38:33');
INSERT INTO `dramascore` VALUES ('3225', '220', '1', '1', '0', '0', '0', '2019-05-07 20:36:24', '2019-05-07 20:36:24');
INSERT INTO `dramascore` VALUES ('3227', '154321', '1', '3', '0', '0', '0', '2019-05-07 21:02:40', '2019-05-07 21:02:59');
INSERT INTO `dramascore` VALUES ('3229', '15180', '1', '1', '0', '0', '0', '2019-05-07 22:07:01', '2019-05-07 22:07:01');
INSERT INTO `dramascore` VALUES ('3231', '293', '1', '1', '0', '0', '0', '2019-05-07 22:10:31', '2019-05-07 22:10:31');
INSERT INTO `dramascore` VALUES ('3233', '292', '1', '1', '0', '0', '0', '2019-05-07 22:10:43', '2019-05-07 22:10:43');
INSERT INTO `dramascore` VALUES ('3235', '279', '1', '1', '0', '0', '0', '2019-05-07 22:12:37', '2019-05-07 22:12:37');
INSERT INTO `dramascore` VALUES ('3237', '159892', '1', '1', '0', '0', '0', '2019-05-07 22:54:29', '2019-05-07 22:54:29');
INSERT INTO `dramascore` VALUES ('3239', '456383', '1', '18', '0', '0', '0', '2019-05-08 02:19:26', '2019-06-13 02:09:11');
INSERT INTO `dramascore` VALUES ('3241', '159790', '1', '1', '0', '0', '0', '2019-05-08 04:07:33', '2019-05-08 04:07:33');
INSERT INTO `dramascore` VALUES ('3243', '31938', '1', '1', '0', '0', '0', '2019-05-08 05:32:19', '2019-05-08 05:32:19');
INSERT INTO `dramascore` VALUES ('3245', '161091', '1', '0', '1', '0', '0', '2019-05-08 06:24:09', '2019-05-08 06:24:09');
INSERT INTO `dramascore` VALUES ('3247', '10657', '4', '1', '0', '0', '1', '2019-05-08 07:19:28', '2019-06-08 07:38:00');
INSERT INTO `dramascore` VALUES ('3249', '492', '1', '0', '1', '0', '0', '2019-05-08 08:07:18', '2019-05-08 08:07:18');
INSERT INTO `dramascore` VALUES ('3251', '155739', '1', '1', '0', '0', '0', '2019-05-08 08:36:39', '2019-05-08 08:36:39');
INSERT INTO `dramascore` VALUES ('3253', '160902', '1', '2', '0', '0', '0', '2019-05-08 09:19:43', '2019-05-09 06:32:05');
INSERT INTO `dramascore` VALUES ('3255', '1572', '1', '1', '0', '0', '0', '2019-05-08 09:38:48', '2019-05-08 09:38:48');
INSERT INTO `dramascore` VALUES ('3257', '51285', '1', '0', '0', '0', '1', '2019-05-08 10:33:44', '2019-05-08 10:33:44');
INSERT INTO `dramascore` VALUES ('3259', '2033', '1', '2', '0', '0', '0', '2019-05-08 10:53:05', '2019-06-13 02:07:27');
INSERT INTO `dramascore` VALUES ('3261', '26331', '1', '3', '0', '0', '0', '2019-05-08 14:29:46', '2019-06-10 09:00:36');
INSERT INTO `dramascore` VALUES ('3263', '163658', '1', '3', '0', '0', '1', '2019-05-08 22:52:57', '2019-06-05 06:06:20');
INSERT INTO `dramascore` VALUES ('3265', '456095', '1', '2', '0', '0', '1', '2019-05-08 23:16:05', '2019-05-27 03:48:43');
INSERT INTO `dramascore` VALUES ('3267', '456271', '1', '4', '0', '0', '1', '2019-05-08 23:43:52', '2019-05-20 09:42:45');
INSERT INTO `dramascore` VALUES ('3269', '11052', '1', '3', '0', '0', '0', '2019-05-09 00:27:06', '2019-06-13 08:17:35');
INSERT INTO `dramascore` VALUES ('3271', '11261', '1', '1', '0', '0', '0', '2019-05-09 02:21:46', '2019-05-09 02:21:46');
INSERT INTO `dramascore` VALUES ('3273', '385', '1', '1', '0', '0', '0', '2019-05-09 04:29:03', '2019-05-09 04:29:03');
INSERT INTO `dramascore` VALUES ('3275', '158127', '1', '1', '0', '0', '0', '2019-05-09 06:01:49', '2019-05-09 06:01:49');
INSERT INTO `dramascore` VALUES ('3277', '153275', '1', '2', '0', '0', '0', '2019-05-09 07:10:21', '2019-05-20 20:05:56');
INSERT INTO `dramascore` VALUES ('3279', '156186', '1', '1', '0', '0', '0', '2019-05-09 07:26:47', '2019-05-09 07:26:47');
INSERT INTO `dramascore` VALUES ('3281', '10061', '2', '2', '0', '0', '0', '2019-05-09 08:24:25', '2019-05-16 06:15:43');
INSERT INTO `dramascore` VALUES ('3283', '157169', '1', '2', '1', '0', '0', '2019-05-09 08:38:54', '2019-06-02 01:11:47');
INSERT INTO `dramascore` VALUES ('3285', '464587', '2', '15', '0', '0', '1', '2019-05-09 08:51:25', '2019-06-07 09:32:44');
INSERT INTO `dramascore` VALUES ('3287', '15130', '1', '1', '0', '0', '0', '2019-05-09 09:27:51', '2019-05-09 09:27:51');
INSERT INTO `dramascore` VALUES ('3289', '456445', '1', '25', '0', '0', '1', '2019-05-09 09:41:21', '2019-05-27 20:56:52');
INSERT INTO `dramascore` VALUES ('3291', '10358', '2', '3', '0', '0', '0', '2019-05-09 10:36:51', '2019-06-01 11:19:14');
INSERT INTO `dramascore` VALUES ('3293', '161140', '1', '0', '0', '0', '1', '2019-05-09 10:56:09', '2019-05-09 10:56:09');
INSERT INTO `dramascore` VALUES ('3295', '26327', '1', '3', '0', '0', '0', '2019-05-09 11:30:46', '2019-06-12 05:12:30');
INSERT INTO `dramascore` VALUES ('3297', '26332', '1', '2', '0', '0', '0', '2019-05-09 11:31:08', '2019-06-10 09:00:32');
INSERT INTO `dramascore` VALUES ('3299', '158279', '1', '0', '0', '0', '1', '2019-05-09 12:16:05', '2019-05-09 12:16:05');
INSERT INTO `dramascore` VALUES ('3301', '9626', '2', '4', '0', '0', '0', '2019-05-09 14:53:52', '2019-06-12 11:11:38');
INSERT INTO `dramascore` VALUES ('3303', '10452', '2', '2', '0', '0', '0', '2019-05-09 15:01:15', '2019-05-09 15:01:16');
INSERT INTO `dramascore` VALUES ('3305', '456077', '1', '0', '0', '0', '2', '2019-05-09 21:04:09', '2019-05-16 19:38:04');
INSERT INTO `dramascore` VALUES ('3307', '160262', '1', '0', '0', '0', '1', '2019-05-10 00:38:43', '2019-05-10 00:38:43');
INSERT INTO `dramascore` VALUES ('3309', '464573', '2', '3', '0', '0', '0', '2019-05-10 02:11:01', '2019-05-15 02:43:14');
INSERT INTO `dramascore` VALUES ('3311', '151024', '1', '0', '1', '0', '0', '2019-05-10 04:11:26', '2019-05-10 04:11:26');
INSERT INTO `dramascore` VALUES ('3313', '2711', '1', '3', '0', '0', '0', '2019-05-10 05:03:55', '2019-06-01 23:07:28');
INSERT INTO `dramascore` VALUES ('3315', '11369', '2', '2', '0', '0', '0', '2019-05-10 06:37:21', '2019-06-01 13:11:18');
INSERT INTO `dramascore` VALUES ('3317', '458725', '2', '19', '1', '1', '0', '2019-05-10 08:08:41', '2019-06-12 07:01:01');
INSERT INTO `dramascore` VALUES ('3319', '10138', '2', '1', '0', '0', '0', '2019-05-10 09:24:00', '2019-05-10 09:24:00');
INSERT INTO `dramascore` VALUES ('3321', '155839', '1', '1', '0', '0', '0', '2019-05-10 09:28:38', '2019-05-10 09:28:38');
INSERT INTO `dramascore` VALUES ('3323', '152798', '1', '5', '0', '0', '1', '2019-05-10 09:30:20', '2019-06-08 08:58:42');
INSERT INTO `dramascore` VALUES ('3325', '148852', '1', '1', '0', '0', '0', '2019-05-10 09:30:50', '2019-05-10 09:30:50');
INSERT INTO `dramascore` VALUES ('3327', '21032', '1', '1', '0', '0', '0', '2019-05-10 09:31:45', '2019-05-10 09:31:45');
INSERT INTO `dramascore` VALUES ('3329', '15155', '1', '1', '0', '0', '0', '2019-05-10 09:31:57', '2019-05-10 09:31:57');
INSERT INTO `dramascore` VALUES ('3331', '15153', '1', '2', '0', '0', '0', '2019-05-10 09:32:04', '2019-05-14 06:56:07');
INSERT INTO `dramascore` VALUES ('3333', '15149', '1', '2', '0', '0', '0', '2019-05-10 09:32:21', '2019-06-10 04:05:05');
INSERT INTO `dramascore` VALUES ('3335', '15143', '1', '1', '0', '0', '0', '2019-05-10 09:32:28', '2019-05-10 09:32:28');
INSERT INTO `dramascore` VALUES ('3337', '15142', '1', '1', '0', '0', '0', '2019-05-10 09:32:36', '2019-05-10 09:32:36');
INSERT INTO `dramascore` VALUES ('3339', '15145', '1', '1', '0', '0', '0', '2019-05-10 09:32:42', '2019-05-10 09:32:42');
INSERT INTO `dramascore` VALUES ('3341', '2708', '1', '2', '0', '0', '0', '2019-05-10 09:36:11', '2019-06-01 23:07:22');
INSERT INTO `dramascore` VALUES ('3343', '160179', '1', '1', '0', '0', '0', '2019-05-10 09:58:29', '2019-05-10 09:58:29');
INSERT INTO `dramascore` VALUES ('3345', '154551', '1', '1', '0', '0', '0', '2019-05-10 09:59:57', '2019-05-10 09:59:57');
INSERT INTO `dramascore` VALUES ('3347', '2306', '1', '1', '0', '0', '0', '2019-05-10 10:01:46', '2019-05-10 10:01:46');
INSERT INTO `dramascore` VALUES ('3349', '2305', '1', '1', '0', '0', '0', '2019-05-10 10:01:55', '2019-05-10 10:01:55');
INSERT INTO `dramascore` VALUES ('3351', '2340', '1', '0', '0', '0', '1', '2019-05-10 10:05:30', '2019-05-10 10:05:30');
INSERT INTO `dramascore` VALUES ('3353', '359643', '2', '3', '0', '0', '0', '2019-05-10 10:18:01', '2019-06-13 02:07:04');
INSERT INTO `dramascore` VALUES ('3355', '157878', '1', '3', '0', '0', '0', '2019-05-10 10:24:01', '2019-06-10 09:49:55');
INSERT INTO `dramascore` VALUES ('3357', '10550', '2', '2', '0', '0', '0', '2019-05-10 10:27:29', '2019-06-06 20:43:02');
INSERT INTO `dramascore` VALUES ('3359', '10457', '2', '4', '0', '0', '0', '2019-05-10 10:29:51', '2019-06-11 00:53:31');
INSERT INTO `dramascore` VALUES ('3361', '10269', '2', '2', '0', '0', '0', '2019-05-10 10:35:31', '2019-05-14 10:16:34');
INSERT INTO `dramascore` VALUES ('3363', '10243', '2', '1', '1', '0', '0', '2019-05-10 14:10:01', '2019-05-20 08:38:43');
INSERT INTO `dramascore` VALUES ('3365', '10355', '2', '1', '0', '0', '0', '2019-05-10 14:10:33', '2019-05-10 14:10:33');
INSERT INTO `dramascore` VALUES ('3367', '9607', '2', '2', '0', '0', '0', '2019-05-10 14:10:44', '2019-06-13 00:40:05');
INSERT INTO `dramascore` VALUES ('3369', '182379', '4', '1', '0', '0', '0', '2019-05-10 16:43:39', '2019-05-10 16:43:39');
INSERT INTO `dramascore` VALUES ('3371', '138067', '1', '2', '0', '0', '0', '2019-05-10 18:53:06', '2019-05-12 06:05:50');
INSERT INTO `dramascore` VALUES ('3373', '100020', '1', '1', '0', '0', '0', '2019-05-10 18:58:05', '2019-05-10 18:58:05');
INSERT INTO `dramascore` VALUES ('3375', '440103', '1', '1', '0', '0', '1', '2019-05-10 20:07:09', '2019-06-08 10:24:15');
INSERT INTO `dramascore` VALUES ('3377', '440105', '1', '1', '0', '1', '0', '2019-05-10 20:07:20', '2019-05-25 05:45:54');
INSERT INTO `dramascore` VALUES ('3379', '2022', '1', '0', '1', '0', '0', '2019-05-10 20:16:16', '2019-05-10 20:16:16');
INSERT INTO `dramascore` VALUES ('3381', '322', '1', '0', '1', '0', '0', '2019-05-10 22:54:40', '2019-05-10 22:54:40');
INSERT INTO `dramascore` VALUES ('3383', '11600', '4', '1', '0', '0', '0', '2019-05-11 03:20:15', '2019-05-11 03:20:15');
INSERT INTO `dramascore` VALUES ('3385', '456459', '1', '5', '0', '0', '0', '2019-05-11 06:41:30', '2019-05-14 12:11:18');
INSERT INTO `dramascore` VALUES ('3387', '159859', '1', '0', '0', '0', '1', '2019-05-11 07:26:31', '2019-05-11 07:26:31');
INSERT INTO `dramascore` VALUES ('3389', '159851', '1', '0', '1', '0', '0', '2019-05-11 07:27:02', '2019-05-11 07:27:02');
INSERT INTO `dramascore` VALUES ('3391', '2614', '1', '1', '0', '0', '0', '2019-05-11 08:09:55', '2019-05-11 08:09:55');
INSERT INTO `dramascore` VALUES ('3393', '11007', '1', '1', '0', '0', '0', '2019-05-11 08:33:11', '2019-05-11 08:33:11');
INSERT INTO `dramascore` VALUES ('3395', '162314', '1', '1', '0', '0', '0', '2019-05-11 09:21:15', '2019-05-11 09:21:15');
INSERT INTO `dramascore` VALUES ('3397', '156407', '1', '0', '1', '0', '1', '2019-05-11 09:26:30', '2019-05-17 08:46:06');
INSERT INTO `dramascore` VALUES ('3399', '157881', '1', '1', '0', '0', '0', '2019-05-11 09:51:21', '2019-05-11 09:51:21');
INSERT INTO `dramascore` VALUES ('3401', '150352', '1', '0', '0', '1', '0', '2019-05-11 11:01:40', '2019-05-11 11:01:40');
INSERT INTO `dramascore` VALUES ('3403', '162509', '1', '0', '0', '0', '1', '2019-05-11 11:42:28', '2019-05-11 11:42:28');
INSERT INTO `dramascore` VALUES ('3405', '156504', '1', '0', '1', '0', '0', '2019-05-11 15:15:07', '2019-05-11 15:15:07');
INSERT INTO `dramascore` VALUES ('3407', '10375', '2', '1', '0', '0', '0', '2019-05-11 19:06:48', '2019-05-11 19:06:48');
INSERT INTO `dramascore` VALUES ('3409', '155939', '1', '0', '0', '0', '1', '2019-05-11 20:58:41', '2019-05-11 20:58:41');
INSERT INTO `dramascore` VALUES ('3411', '457995', '1', '3', '0', '0', '1', '2019-05-12 01:52:30', '2019-05-27 19:15:47');
INSERT INTO `dramascore` VALUES ('3413', '160427', '1', '1', '0', '0', '0', '2019-05-12 08:07:18', '2019-05-12 08:07:18');
INSERT INTO `dramascore` VALUES ('3415', '472001', '1', '12', '0', '0', '1', '2019-05-12 08:08:09', '2019-06-03 00:40:42');
INSERT INTO `dramascore` VALUES ('3417', '161052', '1', '0', '0', '1', '0', '2019-05-12 08:35:25', '2019-05-12 08:35:25');
INSERT INTO `dramascore` VALUES ('3419', '159686', '1', '1', '0', '0', '0', '2019-05-12 08:35:51', '2019-05-12 08:35:51');
INSERT INTO `dramascore` VALUES ('3421', '159575', '1', '1', '0', '0', '0', '2019-05-12 08:36:17', '2019-05-12 08:36:17');
INSERT INTO `dramascore` VALUES ('3423', '158307', '1', '1', '1', '0', '0', '2019-05-12 08:36:58', '2019-05-31 22:17:36');
INSERT INTO `dramascore` VALUES ('3425', '25591', '1', '0', '0', '0', '1', '2019-05-12 09:10:37', '2019-05-12 09:10:37');
INSERT INTO `dramascore` VALUES ('3427', '472053', '1', '3', '3', '0', '2', '2019-05-12 09:18:21', '2019-05-28 00:51:14');
INSERT INTO `dramascore` VALUES ('3429', '159257', '1', '1', '0', '0', '0', '2019-05-12 09:28:58', '2019-05-12 09:28:58');
INSERT INTO `dramascore` VALUES ('3431', '2026', '1', '0', '0', '0', '1', '2019-05-12 09:29:00', '2019-05-12 09:29:00');
INSERT INTO `dramascore` VALUES ('3433', '2272', '1', '1', '0', '0', '0', '2019-05-12 09:31:14', '2019-05-12 09:31:14');
INSERT INTO `dramascore` VALUES ('3435', '155976', '1', '1', '0', '0', '0', '2019-05-12 09:43:35', '2019-05-12 09:43:35');
INSERT INTO `dramascore` VALUES ('3437', '515', '1', '1', '0', '0', '0', '2019-05-12 09:47:28', '2019-05-12 09:47:28');
INSERT INTO `dramascore` VALUES ('3439', '1664', '1', '1', '0', '0', '0', '2019-05-12 09:49:31', '2019-05-12 09:49:31');
INSERT INTO `dramascore` VALUES ('3441', '472271', '1', '124', '3', '6', '45', '2019-05-12 09:50:03', '2019-06-13 04:35:24');
INSERT INTO `dramascore` VALUES ('3443', '472061', '1', '3', '1', '0', '2', '2019-05-12 09:56:13', '2019-05-29 07:22:51');
INSERT INTO `dramascore` VALUES ('3445', '472227', '1', '2', '0', '0', '4', '2019-05-12 10:05:37', '2019-05-31 04:22:45');
INSERT INTO `dramascore` VALUES ('3447', '159326', '1', '1', '0', '0', '0', '2019-05-12 10:30:04', '2019-05-12 10:30:04');
INSERT INTO `dramascore` VALUES ('3449', '31937', '1', '1', '0', '0', '1', '2019-05-12 10:45:53', '2019-06-02 20:53:01');
INSERT INTO `dramascore` VALUES ('3451', '11199', '1', '1', '0', '0', '0', '2019-05-12 10:46:45', '2019-05-12 10:46:45');
INSERT INTO `dramascore` VALUES ('3453', '11185', '1', '0', '1', '0', '0', '2019-05-12 10:47:06', '2019-05-12 10:47:06');
INSERT INTO `dramascore` VALUES ('3455', '11162', '1', '0', '1', '0', '0', '2019-05-12 10:47:37', '2019-05-12 10:47:37');
INSERT INTO `dramascore` VALUES ('3457', '364727', '1', '1', '0', '0', '0', '2019-05-12 10:51:09', '2019-05-12 10:51:09');
INSERT INTO `dramascore` VALUES ('3459', '11110', '1', '1', '0', '0', '0', '2019-05-12 11:12:28', '2019-05-12 11:12:28');
INSERT INTO `dramascore` VALUES ('3461', '471979', '1', '0', '0', '1', '1', '2019-05-12 11:22:46', '2019-06-07 11:54:55');
INSERT INTO `dramascore` VALUES ('3463', '10998', '1', '1', '0', '0', '0', '2019-05-12 12:03:04', '2019-05-12 12:03:04');
INSERT INTO `dramascore` VALUES ('3465', '472211', '1', '4', '2', '1', '0', '2019-05-12 12:06:49', '2019-05-20 21:49:03');
INSERT INTO `dramascore` VALUES ('3467', '471479', '1', '11', '1', '0', '0', '2019-05-12 12:52:02', '2019-06-03 10:36:51');
INSERT INTO `dramascore` VALUES ('3469', '1497', '1', '0', '1', '0', '0', '2019-05-12 18:00:02', '2019-05-12 18:00:02');
INSERT INTO `dramascore` VALUES ('3471', '521', '1', '0', '0', '1', '0', '2019-05-12 19:48:17', '2019-05-12 19:48:17');
INSERT INTO `dramascore` VALUES ('3473', '472091', '1', '6', '0', '1', '0', '2019-05-12 21:08:58', '2019-05-29 03:42:43');
INSERT INTO `dramascore` VALUES ('3475', '158057', '1', '2', '0', '0', '0', '2019-05-12 22:12:11', '2019-05-29 09:30:50');
INSERT INTO `dramascore` VALUES ('3477', '158081', '1', '2', '0', '0', '0', '2019-05-12 22:13:47', '2019-05-29 09:31:19');
INSERT INTO `dramascore` VALUES ('3479', '177807', '4', '2', '0', '0', '0', '2019-05-12 23:40:20', '2019-05-17 22:02:48');
INSERT INTO `dramascore` VALUES ('3481', '472145', '1', '6', '0', '5', '5', '2019-05-13 01:28:44', '2019-06-13 02:47:49');
INSERT INTO `dramascore` VALUES ('3483', '439937', '1', '2', '0', '0', '3', '2019-05-13 02:00:52', '2019-06-08 03:43:54');
INSERT INTO `dramascore` VALUES ('3485', '160176', '1', '1', '0', '0', '0', '2019-05-13 02:37:35', '2019-05-13 02:37:35');
INSERT INTO `dramascore` VALUES ('3487', '471923', '1', '58', '7', '1', '9', '2019-05-13 02:41:41', '2019-06-12 02:42:18');
INSERT INTO `dramascore` VALUES ('3489', '161325', '1', '2', '0', '0', '0', '2019-05-13 02:50:34', '2019-06-08 10:32:38');
INSERT INTO `dramascore` VALUES ('3491', '472125', '1', '4', '0', '0', '0', '2019-05-13 03:08:06', '2019-05-31 01:43:25');
INSERT INTO `dramascore` VALUES ('3493', '472133', '1', '5', '0', '0', '2', '2019-05-13 03:08:17', '2019-06-09 04:36:10');
INSERT INTO `dramascore` VALUES ('3495', '471865', '1', '5', '0', '1', '0', '2019-05-13 03:11:11', '2019-06-10 04:50:15');
INSERT INTO `dramascore` VALUES ('3497', '440021', '1', '1', '0', '0', '0', '2019-05-13 03:14:40', '2019-05-13 03:14:40');
INSERT INTO `dramascore` VALUES ('3499', '472013', '1', '4', '0', '0', '1', '2019-05-13 03:30:05', '2019-05-21 05:37:51');
INSERT INTO `dramascore` VALUES ('3501', '10071', '2', '0', '1', '0', '0', '2019-05-13 04:51:03', '2019-05-13 04:51:03');
INSERT INTO `dramascore` VALUES ('3503', '150695', '1', '1', '0', '0', '0', '2019-05-13 07:30:03', '2019-05-13 07:30:03');
INSERT INTO `dramascore` VALUES ('3505', '472267', '1', '6', '0', '1', '3', '2019-05-13 07:39:08', '2019-06-12 08:28:58');
INSERT INTO `dramascore` VALUES ('3507', '472243', '1', '2', '0', '1', '1', '2019-05-13 08:23:01', '2019-05-31 04:11:46');
INSERT INTO `dramascore` VALUES ('3509', '154526', '1', '1', '0', '0', '0', '2019-05-13 23:07:19', '2019-05-13 23:07:19');
INSERT INTO `dramascore` VALUES ('3511', '471837', '1', '8', '1', '0', '0', '2019-05-13 23:32:24', '2019-06-05 02:35:11');
INSERT INTO `dramascore` VALUES ('3513', '10229', '2', '1', '0', '0', '0', '2019-05-14 02:51:47', '2019-05-14 02:51:47');
INSERT INTO `dramascore` VALUES ('3515', '472151', '1', '5', '0', '0', '3', '2019-05-14 03:13:15', '2019-05-18 10:49:40');
INSERT INTO `dramascore` VALUES ('3517', '472219', '1', '4', '1', '1', '0', '2019-05-14 03:18:30', '2019-05-17 22:45:17');
INSERT INTO `dramascore` VALUES ('3519', '471965', '1', '3', '0', '1', '0', '2019-05-14 03:21:25', '2019-06-09 05:42:55');
INSERT INTO `dramascore` VALUES ('3521', '158153', '1', '2', '0', '0', '1', '2019-05-14 04:37:37', '2019-05-17 06:39:06');
INSERT INTO `dramascore` VALUES ('3523', '2380', '1', '0', '0', '0', '1', '2019-05-14 05:33:35', '2019-05-14 05:33:35');
INSERT INTO `dramascore` VALUES ('3525', '9617', '2', '1', '0', '0', '0', '2019-05-14 05:53:28', '2019-05-14 05:53:28');
INSERT INTO `dramascore` VALUES ('3527', '506', '1', '1', '0', '0', '0', '2019-05-14 06:25:01', '2019-05-14 06:25:01');
INSERT INTO `dramascore` VALUES ('3529', '11183', '1', '1', '0', '0', '0', '2019-05-14 08:27:20', '2019-05-14 08:27:20');
INSERT INTO `dramascore` VALUES ('3531', '391045', '1', '0', '1', '0', '0', '2019-05-14 11:15:10', '2019-05-14 11:15:10');
INSERT INTO `dramascore` VALUES ('3533', '471903', '1', '8', '1', '1', '3', '2019-05-14 11:16:51', '2019-06-02 08:36:14');
INSERT INTO `dramascore` VALUES ('3535', '472247', '1', '3', '0', '1', '0', '2019-05-14 17:58:01', '2019-05-31 15:05:28');
INSERT INTO `dramascore` VALUES ('3537', '161167', '1', '1', '0', '0', '0', '2019-05-15 00:41:38', '2019-05-15 00:41:38');
INSERT INTO `dramascore` VALUES ('3539', '156016', '1', '1', '0', '0', '0', '2019-05-15 03:14:20', '2019-05-15 03:14:20');
INSERT INTO `dramascore` VALUES ('3541', '153400', '1', '0', '1', '0', '0', '2019-05-15 04:46:34', '2019-05-15 04:46:34');
INSERT INTO `dramascore` VALUES ('3543', '1018', '1', '2', '0', '0', '0', '2019-05-15 04:55:50', '2019-06-10 00:41:28');
INSERT INTO `dramascore` VALUES ('3545', '472165', '1', '1', '0', '1', '0', '2019-05-15 05:32:04', '2019-05-30 10:16:05');
INSERT INTO `dramascore` VALUES ('3547', '71783', '1', '0', '0', '0', '1', '2019-05-15 07:30:41', '2019-05-15 07:30:41');
INSERT INTO `dramascore` VALUES ('3549', '159195', '1', '1', '0', '0', '0', '2019-05-15 08:40:16', '2019-05-15 08:40:16');
INSERT INTO `dramascore` VALUES ('3551', '158403', '1', '1', '0', '0', '0', '2019-05-15 08:42:02', '2019-05-15 08:42:02');
INSERT INTO `dramascore` VALUES ('3553', '10204', '2', '2', '1', '0', '0', '2019-05-15 10:24:16', '2019-06-01 13:52:43');
INSERT INTO `dramascore` VALUES ('3555', '478509', '2', '37', '0', '0', '3', '2019-05-15 13:52:15', '2019-06-09 08:05:00');
INSERT INTO `dramascore` VALUES ('3557', '151462', '1', '1', '0', '0', '0', '2019-05-15 14:31:51', '2019-05-15 14:31:51');
INSERT INTO `dramascore` VALUES ('3559', '2443', '1', '1', '0', '1', '0', '2019-05-15 23:56:53', '2019-05-22 04:18:30');
INSERT INTO `dramascore` VALUES ('3561', '178853', '2', '0', '0', '0', '1', '2019-05-15 23:59:42', '2019-05-15 23:59:42');
INSERT INTO `dramascore` VALUES ('3563', '158455', '1', '0', '0', '0', '1', '2019-05-16 01:03:54', '2019-05-16 01:03:54');
INSERT INTO `dramascore` VALUES ('3565', '10352', '2', '2', '0', '0', '0', '2019-05-16 01:36:38', '2019-06-02 01:30:44');
INSERT INTO `dramascore` VALUES ('3567', '478463', '2', '1', '0', '0', '0', '2019-05-16 03:07:28', '2019-05-16 03:07:28');
INSERT INTO `dramascore` VALUES ('3569', '216226', '1', '1', '0', '0', '0', '2019-05-16 03:24:55', '2019-05-16 03:24:55');
INSERT INTO `dramascore` VALUES ('3571', '261', '1', '1', '0', '0', '0', '2019-05-16 05:14:02', '2019-05-16 05:14:02');
INSERT INTO `dramascore` VALUES ('3573', '864', '1', '1', '0', '0', '0', '2019-05-16 06:32:19', '2019-05-16 06:32:19');
INSERT INTO `dramascore` VALUES ('3575', '699', '1', '1', '0', '0', '0', '2019-05-16 06:32:59', '2019-05-16 06:32:59');
INSERT INTO `dramascore` VALUES ('3577', '289', '1', '1', '0', '0', '1', '2019-05-16 06:47:50', '2019-06-08 11:45:24');
INSERT INTO `dramascore` VALUES ('3579', '157530', '1', '1', '0', '0', '0', '2019-05-16 07:13:37', '2019-05-16 07:13:37');
INSERT INTO `dramascore` VALUES ('3581', '471943', '1', '2', '0', '0', '0', '2019-05-16 08:08:43', '2019-05-19 10:46:59');
INSERT INTO `dramascore` VALUES ('3583', '10942', '1', '1', '0', '0', '1', '2019-05-16 11:42:59', '2019-06-13 08:30:46');
INSERT INTO `dramascore` VALUES ('3585', '16322', '2', '2', '0', '0', '0', '2019-05-16 14:35:22', '2019-05-20 21:16:41');
INSERT INTO `dramascore` VALUES ('3587', '206', '1', '1', '0', '0', '0', '2019-05-16 18:51:28', '2019-05-16 18:51:28');
INSERT INTO `dramascore` VALUES ('3589', '86735', '1', '1', '0', '0', '0', '2019-05-17 02:57:46', '2019-05-17 02:57:46');
INSERT INTO `dramascore` VALUES ('3591', '482019', '2', '6', '0', '0', '1', '2019-05-17 08:54:19', '2019-06-12 06:25:34');
INSERT INTO `dramascore` VALUES ('3593', '11340', '2', '1', '0', '0', '0', '2019-05-17 09:07:21', '2019-05-17 09:07:21');
INSERT INTO `dramascore` VALUES ('3595', '154220', '1', '1', '0', '0', '0', '2019-05-17 12:07:13', '2019-05-17 12:07:13');
INSERT INTO `dramascore` VALUES ('3597', '482747', '1', '229', '7', '5', '12', '2019-05-17 12:41:02', '2019-06-13 11:47:35');
INSERT INTO `dramascore` VALUES ('3599', '15165', '1', '2', '0', '0', '0', '2019-05-17 12:44:12', '2019-05-17 14:18:44');
INSERT INTO `dramascore` VALUES ('3601', '2061', '1', '3', '0', '0', '0', '2019-05-18 01:02:10', '2019-06-11 12:02:34');
INSERT INTO `dramascore` VALUES ('3603', '66664', '1', '2', '0', '0', '0', '2019-05-18 01:03:32', '2019-06-11 12:02:19');
INSERT INTO `dramascore` VALUES ('3605', '355871', '1', '1', '0', '0', '0', '2019-05-18 01:05:35', '2019-05-18 01:05:35');
INSERT INTO `dramascore` VALUES ('3607', '160362', '1', '0', '0', '0', '1', '2019-05-18 02:00:46', '2019-05-18 02:00:46');
INSERT INTO `dramascore` VALUES ('3609', '158040', '1', '0', '1', '0', '0', '2019-05-18 02:03:52', '2019-05-18 02:03:52');
INSERT INTO `dramascore` VALUES ('3611', '498', '1', '0', '0', '1', '0', '2019-05-18 03:26:32', '2019-05-18 03:26:32');
INSERT INTO `dramascore` VALUES ('3613', '11630', '4', '1', '0', '0', '0', '2019-05-18 03:56:19', '2019-05-18 03:56:19');
INSERT INTO `dramascore` VALUES ('3615', '119734', '1', '31', '1', '0', '0', '2019-05-18 08:04:26', '2019-05-26 14:20:47');
INSERT INTO `dramascore` VALUES ('3617', '40954', '1', '1', '0', '0', '0', '2019-05-18 09:48:49', '2019-05-18 09:48:49');
INSERT INTO `dramascore` VALUES ('3619', '456429', '1', '1', '1', '0', '1', '2019-05-18 12:05:01', '2019-06-06 03:41:43');
INSERT INTO `dramascore` VALUES ('3621', '165831', '1', '2', '0', '0', '0', '2019-05-18 12:15:47', '2019-05-18 12:16:00');
INSERT INTO `dramascore` VALUES ('3623', '159503', '1', '3', '0', '0', '0', '2019-05-18 13:51:24', '2019-06-10 03:10:12');
INSERT INTO `dramascore` VALUES ('3625', '472111', '1', '5', '0', '0', '0', '2019-05-18 20:07:06', '2019-05-27 05:50:18');
INSERT INTO `dramascore` VALUES ('3627', '159977', '1', '2', '0', '0', '0', '2019-05-19 02:33:22', '2019-06-03 03:13:38');
INSERT INTO `dramascore` VALUES ('3629', '159840', '1', '1', '0', '0', '0', '2019-05-19 02:33:48', '2019-05-19 02:33:48');
INSERT INTO `dramascore` VALUES ('3631', '158359', '1', '0', '1', '0', '0', '2019-05-19 04:25:39', '2019-05-19 04:25:39');
INSERT INTO `dramascore` VALUES ('3633', '158322', '1', '0', '1', '0', '0', '2019-05-19 06:08:06', '2019-05-19 06:08:06');
INSERT INTO `dramascore` VALUES ('3635', '159903', '1', '0', '1', '0', '0', '2019-05-19 08:41:57', '2019-05-19 08:41:57');
INSERT INTO `dramascore` VALUES ('3637', '368921', '1', '0', '0', '0', '2', '2019-05-19 08:49:06', '2019-05-26 05:52:51');
INSERT INTO `dramascore` VALUES ('3639', '15166', '1', '1', '0', '0', '0', '2019-05-19 10:20:21', '2019-05-19 10:20:21');
INSERT INTO `dramascore` VALUES ('3641', '485563', '1', '5', '0', '1', '0', '2019-05-19 10:26:00', '2019-05-28 10:46:52');
INSERT INTO `dramascore` VALUES ('3643', '485577', '1', '9', '1', '0', '0', '2019-05-19 10:29:04', '2019-06-04 03:27:25');
INSERT INTO `dramascore` VALUES ('3645', '11002', '1', '0', '0', '0', '1', '2019-05-19 11:03:38', '2019-05-19 11:03:38');
INSERT INTO `dramascore` VALUES ('3647', '159415', '1', '2', '0', '0', '0', '2019-05-19 11:25:47', '2019-06-01 08:19:21');
INSERT INTO `dramascore` VALUES ('3649', '637', '1', '1', '0', '0', '0', '2019-05-19 11:50:08', '2019-05-19 11:50:08');
INSERT INTO `dramascore` VALUES ('3651', '1138', '1', '1', '0', '0', '0', '2019-05-19 16:44:58', '2019-05-19 16:44:58');
INSERT INTO `dramascore` VALUES ('3653', '440257', '1', '0', '0', '1', '3', '2019-05-19 16:46:41', '2019-06-01 23:01:59');
INSERT INTO `dramascore` VALUES ('3655', '1141', '1', '2', '0', '0', '0', '2019-05-19 17:03:31', '2019-05-26 23:03:13');
INSERT INTO `dramascore` VALUES ('3657', '485641', '1', '6', '0', '0', '0', '2019-05-19 17:34:36', '2019-06-13 07:25:46');
INSERT INTO `dramascore` VALUES ('3659', '472233', '1', '1', '0', '0', '3', '2019-05-19 19:03:03', '2019-06-03 06:30:32');
INSERT INTO `dramascore` VALUES ('3661', '485661', '1', '3', '3', '1', '1', '2019-05-19 22:04:35', '2019-06-11 11:56:53');
INSERT INTO `dramascore` VALUES ('3663', '485625', '1', '4', '0', '0', '1', '2019-05-19 23:27:01', '2019-06-08 02:38:26');
INSERT INTO `dramascore` VALUES ('3665', '485617', '1', '6', '1', '0', '1', '2019-05-20 00:52:59', '2019-05-31 07:41:54');
INSERT INTO `dramascore` VALUES ('3667', '11171', '1', '1', '0', '0', '0', '2019-05-20 01:06:28', '2019-05-20 01:06:28');
INSERT INTO `dramascore` VALUES ('3669', '153133', '1', '0', '0', '0', '1', '2019-05-20 01:28:09', '2019-05-20 01:28:09');
INSERT INTO `dramascore` VALUES ('3671', '158364', '1', '0', '1', '0', '0', '2019-05-20 01:52:47', '2019-05-20 01:52:47');
INSERT INTO `dramascore` VALUES ('3673', '364', '1', '1', '0', '0', '0', '2019-05-20 02:50:24', '2019-05-20 02:50:24');
INSERT INTO `dramascore` VALUES ('3675', '154357', '1', '1', '0', '0', '0', '2019-05-20 03:07:18', '2019-05-20 03:07:18');
INSERT INTO `dramascore` VALUES ('3677', '36388', '1', '2', '0', '0', '1', '2019-05-20 03:55:15', '2019-06-08 11:44:27');
INSERT INTO `dramascore` VALUES ('3679', '485951', '1', '5', '0', '2', '0', '2019-05-20 05:02:18', '2019-06-02 08:36:49');
INSERT INTO `dramascore` VALUES ('3681', '485649', '1', '7', '2', '1', '1', '2019-05-20 06:05:04', '2019-05-29 03:10:32');
INSERT INTO `dramascore` VALUES ('3683', '485935', '1', '5', '3', '0', '6', '2019-05-20 06:16:28', '2019-06-04 09:17:57');
INSERT INTO `dramascore` VALUES ('3685', '191', '1', '1', '0', '0', '0', '2019-05-20 07:22:27', '2019-05-20 07:22:27');
INSERT INTO `dramascore` VALUES ('3687', '157835', '1', '1', '0', '0', '0', '2019-05-20 08:37:02', '2019-05-20 08:37:02');
INSERT INTO `dramascore` VALUES ('3689', '158251', '1', '1', '0', '0', '0', '2019-05-20 08:38:38', '2019-05-20 08:38:38');
INSERT INTO `dramascore` VALUES ('3691', '162575', '1', '2', '0', '0', '1', '2019-05-20 08:56:10', '2019-06-13 07:42:09');
INSERT INTO `dramascore` VALUES ('3693', '485547', '1', '4', '1', '0', '0', '2019-05-20 08:57:07', '2019-06-09 11:54:44');
INSERT INTO `dramascore` VALUES ('3695', '485533', '1', '0', '1', '0', '0', '2019-05-20 09:06:15', '2019-05-20 09:06:15');
INSERT INTO `dramascore` VALUES ('3697', '204871', '1', '1', '0', '0', '0', '2019-05-20 09:47:14', '2019-05-20 09:47:14');
INSERT INTO `dramascore` VALUES ('3699', '485631', '1', '2', '0', '0', '2', '2019-05-20 10:11:00', '2019-05-27 03:45:01');
INSERT INTO `dramascore` VALUES ('3701', '485635', '1', '4', '0', '0', '0', '2019-05-20 10:11:14', '2019-06-01 09:46:28');
INSERT INTO `dramascore` VALUES ('3703', '485643', '1', '3', '1', '0', '0', '2019-05-20 10:11:21', '2019-05-28 10:46:15');
INSERT INTO `dramascore` VALUES ('3705', '485639', '1', '3', '0', '0', '0', '2019-05-20 10:11:49', '2019-05-28 10:46:25');
INSERT INTO `dramascore` VALUES ('3707', '904', '1', '0', '0', '1', '0', '2019-05-20 10:14:13', '2019-05-20 10:14:13');
INSERT INTO `dramascore` VALUES ('3709', '1810', '1', '0', '0', '0', '1', '2019-05-20 15:22:31', '2019-05-20 15:22:31');
INSERT INTO `dramascore` VALUES ('3711', '153333', '1', '1', '0', '0', '0', '2019-05-20 20:06:22', '2019-05-20 20:06:22');
INSERT INTO `dramascore` VALUES ('3713', '485589', '1', '20', '0', '0', '0', '2019-05-20 21:42:37', '2019-06-12 04:26:06');
INSERT INTO `dramascore` VALUES ('3715', '485555', '1', '0', '0', '0', '2', '2019-05-20 22:18:01', '2019-05-29 10:58:56');
INSERT INTO `dramascore` VALUES ('3717', '472033', '1', '0', '0', '0', '2', '2019-05-20 23:14:57', '2019-06-02 11:02:42');
INSERT INTO `dramascore` VALUES ('3719', '153147', '1', '0', '1', '0', '0', '2019-05-20 23:55:00', '2019-05-20 23:55:00');
INSERT INTO `dramascore` VALUES ('3721', '10974', '1', '0', '0', '0', '3', '2019-05-21 01:24:54', '2019-05-21 01:25:39');
INSERT INTO `dramascore` VALUES ('3723', '485659', '1', '3', '0', '1', '1', '2019-05-21 01:42:46', '2019-05-28 06:40:37');
INSERT INTO `dramascore` VALUES ('3725', '485657', '1', '3', '1', '0', '1', '2019-05-21 01:57:55', '2019-05-27 04:40:47');
INSERT INTO `dramascore` VALUES ('3727', '485523', '1', '1', '0', '0', '0', '2019-05-21 04:02:26', '2019-05-21 04:02:26');
INSERT INTO `dramascore` VALUES ('3729', '1491', '1', '1', '0', '0', '0', '2019-05-21 04:44:33', '2019-05-21 04:44:33');
INSERT INTO `dramascore` VALUES ('3731', '485541', '1', '3', '0', '0', '0', '2019-05-21 06:29:23', '2019-05-28 08:24:50');
INSERT INTO `dramascore` VALUES ('3733', '10392', '2', '1', '0', '0', '0', '2019-05-21 08:13:12', '2019-05-21 08:13:12');
INSERT INTO `dramascore` VALUES ('3735', '77685', '1', '0', '0', '0', '1', '2019-05-21 08:59:56', '2019-05-21 08:59:56');
INSERT INTO `dramascore` VALUES ('3737', '485645', '1', '3', '0', '1', '0', '2019-05-21 09:26:19', '2019-06-06 07:55:02');
INSERT INTO `dramascore` VALUES ('3739', '163764', '1', '1', '0', '0', '0', '2019-05-21 11:26:24', '2019-05-21 11:26:24');
INSERT INTO `dramascore` VALUES ('3741', '485511', '1', '9', '1', '1', '0', '2019-05-21 11:30:45', '2019-06-13 13:50:15');
INSERT INTO `dramascore` VALUES ('3743', '153422', '1', '1', '0', '0', '0', '2019-05-21 11:51:21', '2019-05-21 11:51:21');
INSERT INTO `dramascore` VALUES ('3745', '2060', '1', '1', '0', '0', '0', '2019-05-22 00:34:31', '2019-05-22 00:34:31');
INSERT INTO `dramascore` VALUES ('3747', '11360', '2', '1', '0', '0', '0', '2019-05-22 00:34:59', '2019-05-22 00:34:59');
INSERT INTO `dramascore` VALUES ('3749', '153434', '1', '2', '0', '0', '0', '2019-05-22 02:31:36', '2019-05-25 08:34:24');
INSERT INTO `dramascore` VALUES ('3751', '213842', '2', '1', '0', '0', '0', '2019-05-22 03:21:18', '2019-05-22 03:21:18');
INSERT INTO `dramascore` VALUES ('3753', '2355', '1', '0', '0', '1', '0', '2019-05-22 03:39:10', '2019-05-22 03:39:10');
INSERT INTO `dramascore` VALUES ('3755', '145', '1', '1', '0', '0', '0', '2019-05-22 04:11:59', '2019-05-22 04:11:59');
INSERT INTO `dramascore` VALUES ('3757', '1160', '1', '4', '0', '0', '0', '2019-05-22 07:36:09', '2019-06-04 09:41:28');
INSERT INTO `dramascore` VALUES ('3759', '843', '1', '1', '0', '0', '0', '2019-05-22 08:39:48', '2019-05-22 08:39:48');
INSERT INTO `dramascore` VALUES ('3761', '159272', '1', '0', '0', '0', '1', '2019-05-22 09:05:53', '2019-05-22 09:05:53');
INSERT INTO `dramascore` VALUES ('3763', '10156', '2', '1', '0', '0', '0', '2019-05-22 12:20:56', '2019-05-22 12:20:56');
INSERT INTO `dramascore` VALUES ('3765', '159420', '1', '2', '0', '0', '0', '2019-05-22 19:49:12', '2019-06-01 08:18:38');
INSERT INTO `dramascore` VALUES ('3767', '245211', '1', '1', '0', '0', '0', '2019-05-22 21:17:25', '2019-05-22 21:17:25');
INSERT INTO `dramascore` VALUES ('3769', '163810', '1', '0', '0', '0', '1', '2019-05-22 21:30:52', '2019-05-22 21:30:52');
INSERT INTO `dramascore` VALUES ('3771', '177794', '4', '2', '0', '0', '0', '2019-05-23 00:07:49', '2019-05-29 00:27:49');
INSERT INTO `dramascore` VALUES ('3773', '485623', '1', '2', '1', '0', '1', '2019-05-23 02:18:20', '2019-06-12 22:10:34');
INSERT INTO `dramascore` VALUES ('3775', '160854', '1', '0', '0', '0', '1', '2019-05-23 02:43:05', '2019-05-23 02:43:05');
INSERT INTO `dramascore` VALUES ('3777', '10383', '2', '0', '1', '0', '0', '2019-05-23 06:03:54', '2019-05-23 06:03:54');
INSERT INTO `dramascore` VALUES ('3779', '471893', '1', '5', '1', '0', '0', '2019-05-23 07:19:50', '2019-05-26 11:50:39');
INSERT INTO `dramascore` VALUES ('3781', '50185', '1', '1', '1', '0', '0', '2019-05-23 08:27:28', '2019-06-07 05:58:23');
INSERT INTO `dramascore` VALUES ('3783', '152808', '1', '0', '0', '0', '4', '2019-05-23 08:28:56', '2019-05-23 08:30:08');
INSERT INTO `dramascore` VALUES ('3785', '2699', '1', '1', '0', '1', '0', '2019-05-23 08:33:26', '2019-05-29 01:05:43');
INSERT INTO `dramascore` VALUES ('3787', '485525', '1', '5', '0', '0', '0', '2019-05-23 11:03:34', '2019-06-13 09:43:34');
INSERT INTO `dramascore` VALUES ('3789', '177855', '4', '1', '0', '0', '0', '2019-05-23 19:01:11', '2019-05-23 19:01:11');
INSERT INTO `dramascore` VALUES ('3791', '177845', '4', '1', '0', '0', '0', '2019-05-23 19:01:42', '2019-05-23 19:01:42');
INSERT INTO `dramascore` VALUES ('3793', '177359', '4', '1', '0', '0', '0', '2019-05-23 19:02:05', '2019-05-23 19:02:05');
INSERT INTO `dramascore` VALUES ('3795', '175961', '4', '1', '0', '0', '0', '2019-05-23 19:05:22', '2019-05-23 19:05:22');
INSERT INTO `dramascore` VALUES ('3797', '59617', '4', '1', '0', '0', '0', '2019-05-23 19:06:02', '2019-05-23 19:06:02');
INSERT INTO `dramascore` VALUES ('3799', '11625', '4', '3', '0', '0', '0', '2019-05-23 19:11:04', '2019-06-12 21:36:37');
INSERT INTO `dramascore` VALUES ('3801', '11616', '4', '1', '0', '0', '0', '2019-05-23 19:11:42', '2019-05-23 19:11:42');
INSERT INTO `dramascore` VALUES ('3803', '11609', '4', '1', '0', '0', '0', '2019-05-23 19:12:06', '2019-05-23 19:12:06');
INSERT INTO `dramascore` VALUES ('3805', '11606', '4', '1', '0', '0', '0', '2019-05-23 19:12:22', '2019-05-23 19:12:22');
INSERT INTO `dramascore` VALUES ('3807', '11553', '4', '1', '0', '0', '0', '2019-05-23 19:13:51', '2019-05-23 19:13:51');
INSERT INTO `dramascore` VALUES ('3809', '11554', '4', '1', '0', '0', '0', '2019-05-23 19:13:59', '2019-05-23 19:13:59');
INSERT INTO `dramascore` VALUES ('3811', '11510', '4', '1', '0', '0', '0', '2019-05-23 19:15:59', '2019-05-23 19:15:59');
INSERT INTO `dramascore` VALUES ('3813', '10652', '4', '3', '1', '0', '0', '2019-05-23 19:19:19', '2019-06-12 08:25:35');
INSERT INTO `dramascore` VALUES ('3815', '2404', '1', '0', '0', '0', '1', '2019-05-23 20:13:45', '2019-05-23 20:13:45');
INSERT INTO `dramascore` VALUES ('3817', '161078', '1', '2', '0', '0', '0', '2019-05-23 20:14:12', '2019-06-13 12:54:20');
INSERT INTO `dramascore` VALUES ('3819', '159863', '1', '1', '0', '0', '0', '2019-05-24 01:07:46', '2019-05-24 01:07:46');
INSERT INTO `dramascore` VALUES ('3821', '11043', '1', '1', '0', '0', '0', '2019-05-24 01:57:05', '2019-05-24 01:57:05');
INSERT INTO `dramascore` VALUES ('3823', '158836', '1', '1', '0', '0', '0', '2019-05-24 03:08:41', '2019-05-24 03:08:41');
INSERT INTO `dramascore` VALUES ('3825', '487247', '2', '11', '0', '0', '0', '2019-05-24 03:12:41', '2019-06-12 04:09:14');
INSERT INTO `dramascore` VALUES ('3827', '485581', '1', '3', '0', '0', '0', '2019-05-24 05:00:40', '2019-06-08 10:03:34');
INSERT INTO `dramascore` VALUES ('3829', '162187', '1', '0', '0', '0', '1', '2019-05-24 06:48:41', '2019-05-24 06:48:41');
INSERT INTO `dramascore` VALUES ('3831', '153356', '1', '1', '0', '0', '0', '2019-05-24 06:50:04', '2019-05-24 06:50:04');
INSERT INTO `dramascore` VALUES ('3833', '1519', '1', '1', '0', '0', '0', '2019-05-24 06:51:54', '2019-05-24 06:51:54');
INSERT INTO `dramascore` VALUES ('3835', '156253', '1', '1', '0', '0', '0', '2019-05-24 06:59:47', '2019-05-24 06:59:47');
INSERT INTO `dramascore` VALUES ('3837', '454589', '2', '1', '0', '0', '0', '2019-05-24 07:54:53', '2019-05-24 07:54:53');
INSERT INTO `dramascore` VALUES ('3839', '1994', '1', '0', '0', '1', '0', '2019-05-24 08:02:47', '2019-05-24 08:02:47');
INSERT INTO `dramascore` VALUES ('3841', '485535', '1', '0', '0', '0', '1', '2019-05-24 08:32:43', '2019-05-24 08:32:43');
INSERT INTO `dramascore` VALUES ('3843', '1350', '1', '1', '0', '0', '0', '2019-05-24 09:52:52', '2019-05-24 09:52:52');
INSERT INTO `dramascore` VALUES ('3845', '401', '1', '0', '0', '1', '0', '2019-05-24 10:02:59', '2019-05-24 10:02:59');
INSERT INTO `dramascore` VALUES ('3847', '11353', '2', '1', '0', '0', '1', '2019-05-24 10:29:56', '2019-06-04 20:42:44');
INSERT INTO `dramascore` VALUES ('3849', '159653', '1', '0', '0', '1', '0', '2019-05-24 10:37:08', '2019-05-24 10:37:08');
INSERT INTO `dramascore` VALUES ('3851', '10329', '2', '1', '0', '0', '0', '2019-05-24 11:42:28', '2019-05-24 11:42:28');
INSERT INTO `dramascore` VALUES ('3853', '10323', '2', '1', '0', '0', '0', '2019-05-24 11:42:41', '2019-05-24 11:42:41');
INSERT INTO `dramascore` VALUES ('3855', '10270', '2', '1', '0', '0', '0', '2019-05-24 11:43:35', '2019-05-24 11:43:35');
INSERT INTO `dramascore` VALUES ('3857', '471953', '1', '0', '2', '0', '0', '2019-05-24 22:37:49', '2019-06-07 10:32:01');
INSERT INTO `dramascore` VALUES ('3859', '153209', '1', '2', '0', '0', '0', '2019-05-25 00:12:12', '2019-06-12 07:26:15');
INSERT INTO `dramascore` VALUES ('3861', '485629', '1', '3', '0', '0', '1', '2019-05-25 00:42:16', '2019-06-09 06:38:28');
INSERT INTO `dramascore` VALUES ('3863', '10230', '2', '1', '0', '0', '0', '2019-05-25 01:36:02', '2019-05-25 01:36:02');
INSERT INTO `dramascore` VALUES ('3865', '158246', '1', '1', '0', '0', '0', '2019-05-25 04:00:27', '2019-05-25 04:00:27');
INSERT INTO `dramascore` VALUES ('3867', '160030', '1', '0', '0', '0', '1', '2019-05-25 05:29:23', '2019-05-25 05:29:23');
INSERT INTO `dramascore` VALUES ('3869', '494643', '2', '107', '1', '0', '1', '2019-05-25 05:55:48', '2019-06-12 20:42:03');
INSERT INTO `dramascore` VALUES ('3871', '712', '1', '1', '0', '0', '0', '2019-05-25 06:57:53', '2019-05-25 06:57:53');
INSERT INTO `dramascore` VALUES ('3873', '114248', '1', '0', '1', '0', '1', '2019-05-25 07:42:40', '2019-06-03 05:34:45');
INSERT INTO `dramascore` VALUES ('3875', '15208', '1', '1', '0', '0', '0', '2019-05-25 07:57:51', '2019-05-25 07:57:51');
INSERT INTO `dramascore` VALUES ('3877', '496327', '4', '15', '0', '0', '2', '2019-05-25 08:09:04', '2019-06-09 22:56:49');
INSERT INTO `dramascore` VALUES ('3879', '2358', '1', '1', '0', '0', '0', '2019-05-25 09:02:01', '2019-05-25 09:02:01');
INSERT INTO `dramascore` VALUES ('3881', '161868', '1', '1', '1', '0', '0', '2019-05-25 09:28:41', '2019-05-30 05:08:59');
INSERT INTO `dramascore` VALUES ('3883', '158248', '1', '0', '0', '0', '1', '2019-05-25 09:52:08', '2019-05-25 09:52:08');
INSERT INTO `dramascore` VALUES ('3885', '15132', '1', '1', '0', '0', '0', '2019-05-25 09:58:54', '2019-05-25 09:58:54');
INSERT INTO `dramascore` VALUES ('3887', '154938', '1', '1', '0', '0', '0', '2019-05-25 10:02:20', '2019-05-25 10:02:20');
INSERT INTO `dramascore` VALUES ('3889', '11152', '1', '1', '0', '0', '0', '2019-05-25 12:51:35', '2019-05-25 12:51:35');
INSERT INTO `dramascore` VALUES ('3891', '11101', '1', '1', '0', '0', '0', '2019-05-25 12:55:21', '2019-05-25 12:55:21');
INSERT INTO `dramascore` VALUES ('3893', '159390', '1', '0', '0', '0', '1', '2019-05-25 19:26:11', '2019-05-25 19:26:11');
INSERT INTO `dramascore` VALUES ('3895', '161313', '1', '0', '0', '0', '1', '2019-05-25 21:32:48', '2019-05-25 21:32:48');
INSERT INTO `dramascore` VALUES ('3897', '154454', '1', '1', '0', '0', '0', '2019-05-25 22:30:53', '2019-05-25 22:30:53');
INSERT INTO `dramascore` VALUES ('3899', '154511', '1', '1', '0', '0', '0', '2019-05-26 00:52:24', '2019-05-26 00:52:24');
INSERT INTO `dramascore` VALUES ('3901', '180', '1', '1', '0', '0', '0', '2019-05-26 01:57:33', '2019-05-26 01:57:33');
INSERT INTO `dramascore` VALUES ('3903', '15538', '1', '1', '0', '0', '0', '2019-05-26 02:02:40', '2019-05-26 02:02:40');
INSERT INTO `dramascore` VALUES ('3905', '154911', '1', '3', '0', '0', '0', '2019-05-26 02:20:34', '2019-05-30 21:11:36');
INSERT INTO `dramascore` VALUES ('3907', '1820', '1', '1', '0', '0', '0', '2019-05-26 04:28:30', '2019-05-26 04:28:30');
INSERT INTO `dramascore` VALUES ('3909', '1817', '1', '1', '0', '0', '0', '2019-05-26 04:28:55', '2019-05-26 04:28:55');
INSERT INTO `dramascore` VALUES ('3911', '1831', '1', '2', '0', '0', '0', '2019-05-26 04:55:10', '2019-06-10 03:04:10');
INSERT INTO `dramascore` VALUES ('3913', '813', '1', '2', '0', '0', '1', '2019-05-26 05:43:20', '2019-05-28 02:50:07');
INSERT INTO `dramascore` VALUES ('3915', '255', '1', '1', '0', '0', '0', '2019-05-26 05:46:21', '2019-05-26 05:46:21');
INSERT INTO `dramascore` VALUES ('3917', '498935', '1', '7', '2', '0', '4', '2019-05-26 07:37:49', '2019-06-11 04:59:12');
INSERT INTO `dramascore` VALUES ('3919', '156114', '1', '0', '2', '0', '0', '2019-05-26 09:15:09', '2019-06-12 20:59:25');
INSERT INTO `dramascore` VALUES ('3921', '10461', '2', '1', '0', '0', '0', '2019-05-26 10:01:52', '2019-05-26 10:01:52');
INSERT INTO `dramascore` VALUES ('3923', '162502', '1', '1', '0', '0', '0', '2019-05-26 10:22:58', '2019-05-26 10:22:58');
INSERT INTO `dramascore` VALUES ('3925', '34803', '1', '1', '0', '0', '0', '2019-05-26 10:27:19', '2019-05-26 10:27:19');
INSERT INTO `dramascore` VALUES ('3927', '498987', '1', '6', '1', '1', '2', '2019-05-26 10:46:12', '2019-06-07 01:14:27');
INSERT INTO `dramascore` VALUES ('3929', '10109', '2', '1', '0', '0', '0', '2019-05-26 11:00:36', '2019-05-26 11:00:36');
INSERT INTO `dramascore` VALUES ('3931', '159380', '1', '1', '0', '0', '0', '2019-05-26 11:50:24', '2019-05-26 11:50:24');
INSERT INTO `dramascore` VALUES ('3933', '498967', '1', '7', '3', '2', '2', '2019-05-26 12:19:11', '2019-06-12 15:58:45');
INSERT INTO `dramascore` VALUES ('3935', '424673', '1', '1', '1', '0', '0', '2019-05-26 12:27:57', '2019-06-07 08:24:46');
INSERT INTO `dramascore` VALUES ('3937', '161561', '1', '1', '0', '0', '0', '2019-05-26 12:31:23', '2019-05-26 12:31:23');
INSERT INTO `dramascore` VALUES ('3939', '498983', '1', '10', '0', '0', '1', '2019-05-26 12:31:39', '2019-06-04 00:53:25');
INSERT INTO `dramascore` VALUES ('3941', '440251', '1', '1', '0', '0', '0', '2019-05-26 12:33:19', '2019-05-26 12:33:19');
INSERT INTO `dramascore` VALUES ('3943', '498949', '1', '27', '1', '2', '76', '2019-05-26 12:33:50', '2019-06-12 22:09:40');
INSERT INTO `dramascore` VALUES ('3945', '156646', '1', '1', '0', '0', '0', '2019-05-26 15:26:29', '2019-05-26 15:26:29');
INSERT INTO `dramascore` VALUES ('3947', '25573', '1', '0', '0', '0', '1', '2019-05-26 15:33:03', '2019-05-26 15:33:03');
INSERT INTO `dramascore` VALUES ('3949', '499063', '1', '28', '4', '0', '6', '2019-05-26 16:02:01', '2019-06-07 13:03:47');
INSERT INTO `dramascore` VALUES ('3951', '499061', '1', '41', '3', '4', '8', '2019-05-26 16:02:08', '2019-06-13 07:43:47');
INSERT INTO `dramascore` VALUES ('3953', '499035', '1', '9', '0', '0', '1', '2019-05-26 16:02:14', '2019-06-12 23:55:34');
INSERT INTO `dramascore` VALUES ('3955', '496323', '4', '6', '0', '0', '1', '2019-05-26 16:02:48', '2019-06-07 20:44:13');
INSERT INTO `dramascore` VALUES ('3957', '11071', '1', '1', '0', '0', '0', '2019-05-26 18:59:45', '2019-05-26 18:59:45');
INSERT INTO `dramascore` VALUES ('3959', '1499', '1', '1', '0', '0', '0', '2019-05-26 19:12:45', '2019-05-26 19:12:45');
INSERT INTO `dramascore` VALUES ('3961', '15085', '1', '1', '0', '0', '0', '2019-05-26 22:27:29', '2019-05-26 22:27:29');
INSERT INTO `dramascore` VALUES ('3963', '154543', '1', '2', '0', '0', '0', '2019-05-26 23:54:36', '2019-06-09 01:36:40');
INSERT INTO `dramascore` VALUES ('3965', '166331', '1', '1', '0', '0', '0', '2019-05-27 01:01:23', '2019-05-27 01:01:23');
INSERT INTO `dramascore` VALUES ('3967', '155638', '1', '1', '0', '0', '0', '2019-05-27 01:06:50', '2019-05-27 01:06:50');
INSERT INTO `dramascore` VALUES ('3969', '499005', '1', '9', '1', '1', '0', '2019-05-27 01:40:13', '2019-06-02 23:51:09');
INSERT INTO `dramascore` VALUES ('3971', '498969', '1', '3', '0', '0', '3', '2019-05-27 01:41:34', '2019-06-09 07:09:48');
INSERT INTO `dramascore` VALUES ('3973', '499011', '1', '5', '0', '0', '2', '2019-05-27 02:06:12', '2019-06-02 00:43:39');
INSERT INTO `dramascore` VALUES ('3975', '1975', '1', '1', '0', '0', '0', '2019-05-27 02:22:47', '2019-05-27 02:22:47');
INSERT INTO `dramascore` VALUES ('3977', '154402', '1', '1', '0', '0', '0', '2019-05-27 02:32:42', '2019-05-27 02:32:42');
INSERT INTO `dramascore` VALUES ('3979', '160650', '1', '1', '0', '0', '0', '2019-05-27 03:31:48', '2019-05-27 03:31:48');
INSERT INTO `dramascore` VALUES ('3981', '156005', '1', '1', '0', '0', '1', '2019-05-27 03:34:24', '2019-06-09 17:26:41');
INSERT INTO `dramascore` VALUES ('3983', '1451', '1', '1', '0', '0', '0', '2019-05-27 03:42:33', '2019-05-27 03:42:33');
INSERT INTO `dramascore` VALUES ('3985', '498985', '1', '2', '4', '0', '1', '2019-05-27 03:44:10', '2019-06-12 15:58:35');
INSERT INTO `dramascore` VALUES ('3987', '485549', '1', '5', '0', '1', '0', '2019-05-27 03:46:49', '2019-06-11 07:13:37');
INSERT INTO `dramascore` VALUES ('3989', '1538', '1', '1', '0', '0', '0', '2019-05-27 03:51:43', '2019-05-27 03:51:43');
INSERT INTO `dramascore` VALUES ('3991', '498959', '1', '5', '0', '1', '3', '2019-05-27 04:51:44', '2019-06-11 08:43:52');
INSERT INTO `dramascore` VALUES ('3993', '141862', '1', '1', '0', '0', '0', '2019-05-27 06:37:16', '2019-05-27 06:37:16');
INSERT INTO `dramascore` VALUES ('3995', '486183', '2', '2', '0', '1', '0', '2019-05-27 08:02:49', '2019-06-11 07:42:38');
INSERT INTO `dramascore` VALUES ('3997', '156291', '1', '0', '0', '0', '1', '2019-05-27 09:10:27', '2019-05-27 09:10:27');
INSERT INTO `dramascore` VALUES ('3999', '159440', '1', '1', '0', '0', '0', '2019-05-27 09:58:11', '2019-05-27 09:58:11');
INSERT INTO `dramascore` VALUES ('4001', '159196', '1', '1', '0', '0', '0', '2019-05-27 10:04:34', '2019-05-27 10:04:34');
INSERT INTO `dramascore` VALUES ('4003', '471991', '1', '0', '0', '0', '1', '2019-05-27 10:52:47', '2019-05-27 10:52:47');
INSERT INTO `dramascore` VALUES ('4005', '32307', '1', '0', '0', '1', '0', '2019-05-27 12:54:29', '2019-05-27 12:54:29');
INSERT INTO `dramascore` VALUES ('4007', '15202', '1', '2', '0', '0', '0', '2019-05-27 14:00:21', '2019-06-02 11:35:58');
INSERT INTO `dramascore` VALUES ('4009', '495285', '4', '1', '0', '0', '0', '2019-05-27 18:53:43', '2019-05-27 18:53:43');
INSERT INTO `dramascore` VALUES ('4011', '151467', '1', '1', '0', '0', '0', '2019-05-27 23:04:49', '2019-05-27 23:04:49');
INSERT INTO `dramascore` VALUES ('4013', '137808', '1', '1', '0', '0', '0', '2019-05-28 01:51:55', '2019-05-28 01:51:55');
INSERT INTO `dramascore` VALUES ('4015', '25583', '1', '1', '0', '0', '0', '2019-05-28 02:07:10', '2019-05-28 02:07:10');
INSERT INTO `dramascore` VALUES ('4017', '158315', '1', '1', '0', '0', '0', '2019-05-28 05:06:28', '2019-05-28 05:06:28');
INSERT INTO `dramascore` VALUES ('4019', '2536', '1', '1', '0', '0', '0', '2019-05-28 06:39:24', '2019-05-28 06:39:24');
INSERT INTO `dramascore` VALUES ('4021', '1409', '1', '1', '0', '0', '0', '2019-05-28 06:39:45', '2019-05-28 06:39:45');
INSERT INTO `dramascore` VALUES ('4023', '2456', '1', '2', '0', '0', '0', '2019-05-28 09:22:21', '2019-06-10 06:56:34');
INSERT INTO `dramascore` VALUES ('4025', '156806', '1', '1', '0', '0', '0', '2019-05-28 11:15:41', '2019-05-28 11:15:41');
INSERT INTO `dramascore` VALUES ('4027', '74', '1', '1', '0', '0', '0', '2019-05-28 15:45:48', '2019-05-28 15:45:48');
INSERT INTO `dramascore` VALUES ('4029', '504149', '2', '9', '0', '0', '1', '2019-05-28 22:42:10', '2019-06-12 11:07:55');
INSERT INTO `dramascore` VALUES ('4031', '2705', '1', '1', '0', '0', '0', '2019-05-29 01:55:12', '2019-05-29 01:55:12');
INSERT INTO `dramascore` VALUES ('4033', '153185', '1', '1', '0', '0', '0', '2019-05-29 05:07:56', '2019-05-29 05:07:56');
INSERT INTO `dramascore` VALUES ('4035', '148563', '1', '0', '0', '0', '1', '2019-05-29 05:28:34', '2019-05-29 05:28:34');
INSERT INTO `dramascore` VALUES ('4037', '11158', '1', '3', '0', '0', '0', '2019-05-29 08:36:09', '2019-06-10 12:13:51');
INSERT INTO `dramascore` VALUES ('4039', '11131', '1', '4', '0', '0', '0', '2019-05-29 08:42:46', '2019-06-02 08:43:23');
INSERT INTO `dramascore` VALUES ('4041', '157649', '1', '4', '0', '0', '0', '2019-05-29 09:33:23', '2019-05-29 09:34:14');
INSERT INTO `dramascore` VALUES ('4043', '505467', '2', '3', '0', '0', '0', '2019-05-29 09:54:01', '2019-06-13 09:41:57');
INSERT INTO `dramascore` VALUES ('4045', '10523', '1', '1', '0', '0', '0', '2019-05-29 10:02:46', '2019-05-29 10:02:46');
INSERT INTO `dramascore` VALUES ('4047', '158033', '1', '1', '0', '0', '0', '2019-05-29 10:19:12', '2019-05-29 10:19:12');
INSERT INTO `dramascore` VALUES ('4049', '148447', '1', '0', '0', '0', '1', '2019-05-29 12:46:53', '2019-05-29 12:46:53');
INSERT INTO `dramascore` VALUES ('4051', '485561', '1', '4', '0', '0', '1', '2019-05-29 21:17:28', '2019-06-11 03:42:43');
INSERT INTO `dramascore` VALUES ('4053', '2488', '1', '2', '0', '0', '0', '2019-05-29 22:28:32', '2019-05-31 00:22:09');
INSERT INTO `dramascore` VALUES ('4055', '809', '1', '1', '0', '0', '0', '2019-05-30 03:05:55', '2019-05-30 03:05:55');
INSERT INTO `dramascore` VALUES ('4057', '152967', '1', '1', '0', '0', '0', '2019-05-30 03:06:20', '2019-05-30 03:06:20');
INSERT INTO `dramascore` VALUES ('4059', '155741', '1', '0', '1', '0', '0', '2019-05-30 04:31:00', '2019-05-30 04:31:00');
INSERT INTO `dramascore` VALUES ('4061', '10966', '1', '1', '0', '0', '0', '2019-05-30 06:16:13', '2019-05-30 06:16:13');
INSERT INTO `dramascore` VALUES ('4063', '150726', '1', '4', '0', '0', '0', '2019-05-30 06:23:02', '2019-05-30 06:23:04');
INSERT INTO `dramascore` VALUES ('4065', '10430', '2', '2', '0', '0', '0', '2019-05-30 07:52:47', '2019-06-01 02:57:46');
INSERT INTO `dramascore` VALUES ('4067', '10410', '2', '1', '0', '0', '0', '2019-05-30 08:04:43', '2019-05-30 08:04:43');
INSERT INTO `dramascore` VALUES ('4069', '11029', '1', '2', '0', '0', '0', '2019-05-30 08:18:09', '2019-06-01 03:24:20');
INSERT INTO `dramascore` VALUES ('4071', '248401', '2', '0', '0', '0', '1', '2019-05-30 09:44:22', '2019-05-30 09:44:22');
INSERT INTO `dramascore` VALUES ('4073', '359603', '2', '1', '0', '0', '0', '2019-05-30 09:52:51', '2019-05-30 09:52:51');
INSERT INTO `dramascore` VALUES ('4075', '10187', '2', '1', '0', '0', '0', '2019-05-30 11:21:05', '2019-05-30 11:21:05');
INSERT INTO `dramascore` VALUES ('4077', '156220', '1', '1', '0', '0', '0', '2019-05-30 12:53:22', '2019-05-30 12:53:22');
INSERT INTO `dramascore` VALUES ('4079', '156149', '1', '0', '0', '0', '1', '2019-05-30 13:02:35', '2019-05-30 13:02:35');
INSERT INTO `dramascore` VALUES ('4081', '1611', '1', '1', '0', '0', '0', '2019-05-30 13:28:30', '2019-05-30 13:28:30');
INSERT INTO `dramascore` VALUES ('4083', '66668', '1', '0', '0', '1', '0', '2019-05-31 00:21:41', '2019-05-31 00:21:41');
INSERT INTO `dramascore` VALUES ('4085', '644', '1', '0', '0', '1', '0', '2019-05-31 00:56:21', '2019-05-31 00:56:21');
INSERT INTO `dramascore` VALUES ('4087', '485559', '1', '1', '0', '0', '0', '2019-05-31 00:56:52', '2019-05-31 00:56:52');
INSERT INTO `dramascore` VALUES ('4089', '153481', '1', '2', '0', '0', '0', '2019-05-31 03:13:03', '2019-06-03 05:47:22');
INSERT INTO `dramascore` VALUES ('4091', '153293', '1', '0', '0', '0', '1', '2019-05-31 03:21:10', '2019-05-31 03:21:10');
INSERT INTO `dramascore` VALUES ('4093', '153194', '1', '0', '0', '0', '1', '2019-05-31 03:35:30', '2019-05-31 03:35:30');
INSERT INTO `dramascore` VALUES ('4095', '291', '1', '1', '0', '0', '0', '2019-05-31 03:39:40', '2019-05-31 03:39:40');
INSERT INTO `dramascore` VALUES ('4097', '153107', '1', '1', '0', '0', '0', '2019-05-31 03:49:45', '2019-05-31 03:49:45');
INSERT INTO `dramascore` VALUES ('4099', '153056', '1', '0', '0', '0', '1', '2019-05-31 03:55:30', '2019-05-31 03:55:30');
INSERT INTO `dramascore` VALUES ('4101', '153030', '1', '0', '0', '0', '1', '2019-05-31 04:04:01', '2019-05-31 04:04:01');
INSERT INTO `dramascore` VALUES ('4103', '153019', '1', '0', '0', '0', '1', '2019-05-31 04:09:53', '2019-05-31 04:09:53');
INSERT INTO `dramascore` VALUES ('4105', '533', '1', '3', '0', '0', '0', '2019-05-31 06:31:53', '2019-05-31 06:47:15');
INSERT INTO `dramascore` VALUES ('4107', '158064', '1', '2', '0', '0', '0', '2019-05-31 06:34:23', '2019-06-01 08:15:55');
INSERT INTO `dramascore` VALUES ('4109', '147845', '1', '5', '0', '0', '0', '2019-05-31 06:37:50', '2019-05-31 06:37:52');
INSERT INTO `dramascore` VALUES ('4111', '2244', '1', '2', '0', '0', '0', '2019-05-31 06:41:35', '2019-05-31 06:41:35');
INSERT INTO `dramascore` VALUES ('4113', '1804', '1', '1', '0', '0', '0', '2019-05-31 07:44:43', '2019-05-31 07:44:43');
INSERT INTO `dramascore` VALUES ('4115', '15113', '1', '1', '0', '0', '0', '2019-05-31 08:06:38', '2019-05-31 08:06:38');
INSERT INTO `dramascore` VALUES ('4117', '1965', '1', '1', '0', '0', '0', '2019-05-31 09:06:28', '2019-05-31 09:06:28');
INSERT INTO `dramascore` VALUES ('4119', '160020', '1', '0', '1', '0', '0', '2019-05-31 15:50:18', '2019-05-31 15:50:18');
INSERT INTO `dramascore` VALUES ('4121', '15157', '1', '2', '0', '0', '0', '2019-05-31 16:27:23', '2019-06-01 11:42:55');
INSERT INTO `dramascore` VALUES ('4123', '107766', '1', '0', '0', '0', '1', '2019-05-31 23:38:18', '2019-05-31 23:38:18');
INSERT INTO `dramascore` VALUES ('4125', '498965', '1', '5', '1', '0', '0', '2019-06-01 00:40:59', '2019-06-10 11:32:45');
INSERT INTO `dramascore` VALUES ('4127', '359663', '2', '0', '1', '0', '0', '2019-06-01 03:08:48', '2019-06-01 03:08:48');
INSERT INTO `dramascore` VALUES ('4129', '15133', '1', '0', '0', '0', '1', '2019-06-01 05:20:29', '2019-06-01 05:20:29');
INSERT INTO `dramascore` VALUES ('4131', '157770', '1', '1', '0', '0', '0', '2019-06-01 05:27:50', '2019-06-01 05:27:50');
INSERT INTO `dramascore` VALUES ('4133', '153090', '1', '0', '1', '0', '0', '2019-06-01 05:31:08', '2019-06-01 05:31:08');
INSERT INTO `dramascore` VALUES ('4135', '10604', '4', '1', '0', '0', '0', '2019-06-01 05:53:04', '2019-06-01 05:53:04');
INSERT INTO `dramascore` VALUES ('4137', '160221', '1', '1', '0', '0', '0', '2019-06-01 08:56:34', '2019-06-01 08:56:34');
INSERT INTO `dramascore` VALUES ('4139', '1980', '1', '1', '0', '0', '0', '2019-06-01 10:09:04', '2019-06-01 10:09:04');
INSERT INTO `dramascore` VALUES ('4141', '369203', '1', '1', '0', '0', '0', '2019-06-01 10:13:12', '2019-06-01 10:13:12');
INSERT INTO `dramascore` VALUES ('4143', '10184', '2', '1', '0', '0', '1', '2019-06-01 11:01:29', '2019-06-01 12:27:46');
INSERT INTO `dramascore` VALUES ('4145', '10465', '2', '1', '0', '0', '0', '2019-06-01 11:11:50', '2019-06-01 11:11:50');
INSERT INTO `dramascore` VALUES ('4147', '10189', '2', '1', '0', '0', '0', '2019-06-01 11:14:09', '2019-06-01 11:14:09');
INSERT INTO `dramascore` VALUES ('4149', '10343', '2', '1', '0', '0', '0', '2019-06-01 11:20:25', '2019-06-01 11:20:25');
INSERT INTO `dramascore` VALUES ('4151', '157954', '1', '1', '0', '0', '1', '2019-06-01 21:26:01', '2019-06-10 08:44:55');
INSERT INTO `dramascore` VALUES ('4153', '10632', '4', '1', '0', '0', '0', '2019-06-01 21:29:33', '2019-06-01 21:29:33');
INSERT INTO `dramascore` VALUES ('4155', '278', '1', '1', '0', '0', '0', '2019-06-01 22:39:55', '2019-06-01 22:39:55');
INSERT INTO `dramascore` VALUES ('4157', '154944', '1', '1', '0', '0', '0', '2019-06-01 23:41:03', '2019-06-01 23:41:03');
INSERT INTO `dramascore` VALUES ('4159', '154282', '1', '1', '0', '0', '0', '2019-06-01 23:42:25', '2019-06-01 23:42:25');
INSERT INTO `dramascore` VALUES ('4161', '161629', '1', '0', '0', '0', '1', '2019-06-01 23:52:12', '2019-06-01 23:52:12');
INSERT INTO `dramascore` VALUES ('4163', '10958', '1', '1', '0', '0', '0', '2019-06-02 02:19:12', '2019-06-02 02:19:12');
INSERT INTO `dramascore` VALUES ('4165', '154297', '1', '1', '0', '0', '0', '2019-06-02 02:48:56', '2019-06-02 02:48:56');
INSERT INTO `dramascore` VALUES ('4167', '154954', '1', '1', '0', '0', '0', '2019-06-02 04:48:29', '2019-06-02 04:48:29');
INSERT INTO `dramascore` VALUES ('4169', '154957', '1', '1', '0', '0', '0', '2019-06-02 04:50:35', '2019-06-02 04:50:35');
INSERT INTO `dramascore` VALUES ('4171', '515025', '2', '19', '0', '0', '1', '2019-06-02 05:45:30', '2019-06-13 09:00:16');
INSERT INTO `dramascore` VALUES ('4173', '331', '1', '1', '0', '0', '0', '2019-06-02 06:28:03', '2019-06-02 06:28:03');
INSERT INTO `dramascore` VALUES ('4175', '847', '1', '1', '0', '0', '0', '2019-06-02 06:34:24', '2019-06-02 06:34:24');
INSERT INTO `dramascore` VALUES ('4177', '1899', '1', '1', '0', '0', '0', '2019-06-02 07:14:56', '2019-06-02 07:14:56');
INSERT INTO `dramascore` VALUES ('4179', '515459', '1', '4', '0', '1', '0', '2019-06-02 07:26:14', '2019-06-13 08:16:27');
INSERT INTO `dramascore` VALUES ('4181', '948', '1', '1', '0', '0', '0', '2019-06-02 07:36:55', '2019-06-02 07:36:55');
INSERT INTO `dramascore` VALUES ('4183', '204813', '1', '1', '0', '0', '0', '2019-06-02 08:00:09', '2019-06-02 08:00:09');
INSERT INTO `dramascore` VALUES ('4185', '515531', '1', '3', '0', '0', '0', '2019-06-02 08:27:19', '2019-06-09 09:05:58');
INSERT INTO `dramascore` VALUES ('4187', '515015', '2', '5', '0', '0', '0', '2019-06-02 08:42:03', '2019-06-09 02:34:37');
INSERT INTO `dramascore` VALUES ('4189', '515629', '1', '2', '0', '0', '1', '2019-06-02 09:09:39', '2019-06-13 04:35:07');
INSERT INTO `dramascore` VALUES ('4191', '515523', '1', '5', '0', '2', '0', '2019-06-02 09:52:59', '2019-06-12 21:08:33');
INSERT INTO `dramascore` VALUES ('4193', '11338', '2', '1', '0', '0', '0', '2019-06-02 10:07:06', '2019-06-02 10:07:06');
INSERT INTO `dramascore` VALUES ('4195', '457981', '1', '1', '0', '0', '0', '2019-06-02 10:14:56', '2019-06-02 10:14:56');
INSERT INTO `dramascore` VALUES ('4197', '515401', '1', '2', '0', '0', '1', '2019-06-02 11:22:14', '2019-06-09 02:50:12');
INSERT INTO `dramascore` VALUES ('4199', '515007', '2', '2', '0', '0', '2', '2019-06-02 11:41:00', '2019-06-06 03:50:53');
INSERT INTO `dramascore` VALUES ('4201', '515625', '1', '5', '3', '0', '2', '2019-06-02 12:38:44', '2019-06-09 05:38:47');
INSERT INTO `dramascore` VALUES ('4203', '409863', '1', '2', '0', '0', '0', '2019-06-02 13:30:43', '2019-06-02 13:45:43');
INSERT INTO `dramascore` VALUES ('4205', '515631', '1', '3', '1', '1', '4', '2019-06-02 14:54:12', '2019-06-11 07:10:46');
INSERT INTO `dramascore` VALUES ('4207', '1989', '1', '1', '0', '0', '0', '2019-06-02 18:58:21', '2019-06-02 18:58:21');
INSERT INTO `dramascore` VALUES ('4209', '515327', '1', '1', '1', '0', '0', '2019-06-02 20:26:45', '2019-06-03 06:05:20');
INSERT INTO `dramascore` VALUES ('4211', '515593', '1', '5', '0', '0', '1', '2019-06-02 22:27:11', '2019-06-06 22:31:29');
INSERT INTO `dramascore` VALUES ('4213', '153345', '1', '0', '1', '0', '0', '2019-06-02 22:39:12', '2019-06-02 22:39:12');
INSERT INTO `dramascore` VALUES ('4215', '515359', '1', '4', '0', '0', '0', '2019-06-02 23:23:57', '2019-06-09 04:24:57');
INSERT INTO `dramascore` VALUES ('4217', '515517', '1', '8', '2', '0', '0', '2019-06-03 00:36:53', '2019-06-09 09:08:50');
INSERT INTO `dramascore` VALUES ('4219', '485551', '1', '2', '1', '0', '0', '2019-06-03 01:15:29', '2019-06-13 11:43:44');
INSERT INTO `dramascore` VALUES ('4221', '154343', '1', '1', '0', '0', '0', '2019-06-03 03:12:38', '2019-06-03 03:12:38');
INSERT INTO `dramascore` VALUES ('4223', '515705', '1', '1', '0', '1', '0', '2019-06-03 03:37:35', '2019-06-10 00:26:36');
INSERT INTO `dramascore` VALUES ('4225', '2446', '1', '1', '0', '0', '0', '2019-06-03 04:16:17', '2019-06-03 04:16:17');
INSERT INTO `dramascore` VALUES ('4227', '515541', '1', '5', '0', '0', '1', '2019-06-03 05:06:04', '2019-06-10 08:13:47');
INSERT INTO `dramascore` VALUES ('4229', '515651', '1', '0', '0', '0', '4', '2019-06-03 05:20:20', '2019-06-10 08:39:25');
INSERT INTO `dramascore` VALUES ('4231', '66666', '1', '1', '0', '0', '0', '2019-06-03 06:18:31', '2019-06-03 06:18:31');
INSERT INTO `dramascore` VALUES ('4233', '515733', '1', '11', '2', '0', '0', '2019-06-03 07:56:31', '2019-06-10 10:31:01');
INSERT INTO `dramascore` VALUES ('4235', '515423', '1', '1', '0', '1', '0', '2019-06-03 08:03:58', '2019-06-13 07:25:13');
INSERT INTO `dramascore` VALUES ('4237', '150696', '1', '1', '0', '0', '0', '2019-06-03 08:21:12', '2019-06-03 08:21:12');
INSERT INTO `dramascore` VALUES ('4239', '515725', '1', '7', '0', '0', '1', '2019-06-03 09:17:55', '2019-06-13 04:34:33');
INSERT INTO `dramascore` VALUES ('4241', '515471', '1', '2', '2', '0', '1', '2019-06-03 09:19:58', '2019-06-10 04:10:11');
INSERT INTO `dramascore` VALUES ('4243', '515413', '1', '3', '0', '0', '0', '2019-06-03 09:35:51', '2019-06-09 09:08:27');
INSERT INTO `dramascore` VALUES ('4245', '1348', '1', '1', '0', '0', '0', '2019-06-03 09:50:48', '2019-06-03 09:50:48');
INSERT INTO `dramascore` VALUES ('4247', '515709', '1', '10', '1', '0', '1', '2019-06-03 09:57:07', '2019-06-11 11:46:38');
INSERT INTO `dramascore` VALUES ('4249', '615', '1', '0', '0', '0', '1', '2019-06-03 10:11:13', '2019-06-03 10:11:13');
INSERT INTO `dramascore` VALUES ('4251', '158241', '1', '0', '0', '1', '0', '2019-06-03 10:43:20', '2019-06-03 10:43:20');
INSERT INTO `dramascore` VALUES ('4253', '410949', '1', '1', '0', '1', '0', '2019-06-03 10:57:21', '2019-06-11 07:23:26');
INSERT INTO `dramascore` VALUES ('4255', '515445', '1', '0', '0', '0', '1', '2019-06-03 12:07:07', '2019-06-03 12:07:07');
INSERT INTO `dramascore` VALUES ('4257', '504097', '2', '1', '0', '0', '0', '2019-06-03 12:57:39', '2019-06-03 12:57:39');
INSERT INTO `dramascore` VALUES ('4259', '10152', '2', '1', '0', '0', '0', '2019-06-03 22:38:37', '2019-06-03 22:38:37');
INSERT INTO `dramascore` VALUES ('4261', '1364', '1', '1', '0', '0', '0', '2019-06-04 01:25:01', '2019-06-04 01:25:01');
INSERT INTO `dramascore` VALUES ('4263', '1823', '1', '1', '0', '0', '0', '2019-06-04 02:03:57', '2019-06-04 02:03:57');
INSERT INTO `dramascore` VALUES ('4265', '158109', '1', '1', '0', '0', '0', '2019-06-04 02:59:26', '2019-06-04 02:59:26');
INSERT INTO `dramascore` VALUES ('4267', '456247', '1', '1', '0', '0', '0', '2019-06-04 03:08:12', '2019-06-04 03:08:12');
INSERT INTO `dramascore` VALUES ('4269', '158477', '1', '1', '0', '0', '0', '2019-06-04 04:18:43', '2019-06-04 04:18:43');
INSERT INTO `dramascore` VALUES ('4271', '204818', '1', '0', '0', '0', '1', '2019-06-04 04:33:16', '2019-06-04 04:33:16');
INSERT INTO `dramascore` VALUES ('4273', '390989', '1', '1', '0', '0', '0', '2019-06-04 05:00:30', '2019-06-04 05:00:30');
INSERT INTO `dramascore` VALUES ('4275', '1812', '1', '0', '0', '1', '0', '2019-06-04 06:01:12', '2019-06-04 06:01:12');
INSERT INTO `dramascore` VALUES ('4277', '515735', '1', '6', '1', '0', '1', '2019-06-04 06:35:53', '2019-06-09 03:01:38');
INSERT INTO `dramascore` VALUES ('4279', '515575', '1', '5', '0', '0', '0', '2019-06-04 06:39:14', '2019-06-08 12:56:40');
INSERT INTO `dramascore` VALUES ('4281', '160998', '1', '1', '0', '0', '0', '2019-06-04 06:56:04', '2019-06-04 06:56:04');
INSERT INTO `dramascore` VALUES ('4283', '504089', '2', '2', '0', '0', '2', '2019-06-04 07:19:49', '2019-06-11 07:29:34');
INSERT INTO `dramascore` VALUES ('4285', '59', '1', '3', '0', '0', '0', '2019-06-04 07:35:39', '2019-06-04 07:35:52');
INSERT INTO `dramascore` VALUES ('4287', '163757', '1', '1', '0', '0', '0', '2019-06-04 08:31:39', '2019-06-04 08:31:39');
INSERT INTO `dramascore` VALUES ('4289', '149489', '1', '0', '0', '0', '1', '2019-06-04 08:43:59', '2019-06-04 08:43:59');
INSERT INTO `dramascore` VALUES ('4291', '518039', '2', '10', '0', '0', '0', '2019-06-04 09:03:45', '2019-06-13 07:08:22');
INSERT INTO `dramascore` VALUES ('4293', '515693', '1', '1', '0', '0', '1', '2019-06-04 09:48:53', '2019-06-08 07:24:58');
INSERT INTO `dramascore` VALUES ('4295', '555', '1', '0', '0', '1', '1', '2019-06-04 10:12:20', '2019-06-06 12:01:28');
INSERT INTO `dramascore` VALUES ('4297', '411185', '1', '0', '0', '0', '1', '2019-06-04 11:34:21', '2019-06-04 11:34:21');
INSERT INTO `dramascore` VALUES ('4299', '2679', '1', '1', '1', '0', '0', '2019-06-04 13:34:16', '2019-06-05 03:02:58');
INSERT INTO `dramascore` VALUES ('4301', '515355', '1', '2', '0', '0', '2', '2019-06-04 13:45:15', '2019-06-08 09:46:25');
INSERT INTO `dramascore` VALUES ('4303', '1907', '1', '1', '0', '0', '0', '2019-06-04 14:00:45', '2019-06-04 14:00:45');
INSERT INTO `dramascore` VALUES ('4305', '11341', '2', '0', '0', '0', '1', '2019-06-04 20:42:11', '2019-06-04 20:42:11');
INSERT INTO `dramascore` VALUES ('4307', '10448', '2', '1', '0', '0', '0', '2019-06-05 01:32:46', '2019-06-05 01:32:46');
INSERT INTO `dramascore` VALUES ('4309', '35519', '1', '1', '0', '0', '0', '2019-06-05 02:32:03', '2019-06-05 02:32:03');
INSERT INTO `dramascore` VALUES ('4311', '21028', '1', '1', '0', '0', '0', '2019-06-05 04:18:56', '2019-06-05 04:18:56');
INSERT INTO `dramascore` VALUES ('4313', '1342', '1', '2', '0', '0', '0', '2019-06-05 06:48:57', '2019-06-08 06:17:58');
INSERT INTO `dramascore` VALUES ('4315', '163275', '1', '1', '0', '0', '0', '2019-06-05 07:10:27', '2019-06-05 07:10:27');
INSERT INTO `dramascore` VALUES ('4317', '494465', '4', '0', '0', '0', '2', '2019-06-05 17:15:14', '2019-06-05 17:15:15');
INSERT INTO `dramascore` VALUES ('4319', '523775', '1', '0', '0', '0', '1', '2019-06-06 00:37:33', '2019-06-06 00:37:33');
INSERT INTO `dramascore` VALUES ('4321', '515339', '1', '1', '0', '0', '1', '2019-06-06 01:11:52', '2019-06-08 17:12:05');
INSERT INTO `dramascore` VALUES ('4323', '532', '1', '1', '0', '0', '0', '2019-06-06 01:13:10', '2019-06-06 01:13:10');
INSERT INTO `dramascore` VALUES ('4325', '150678', '1', '1', '0', '0', '0', '2019-06-06 01:45:35', '2019-06-06 01:45:35');
INSERT INTO `dramascore` VALUES ('4327', '159184', '1', '1', '1', '0', '0', '2019-06-06 02:06:12', '2019-06-06 02:08:13');
INSERT INTO `dramascore` VALUES ('4329', '159823', '1', '2', '0', '0', '0', '2019-06-06 03:24:27', '2019-06-09 08:26:35');
INSERT INTO `dramascore` VALUES ('4331', '141', '1', '1', '0', '0', '0', '2019-06-06 03:43:31', '2019-06-06 03:43:31');
INSERT INTO `dramascore` VALUES ('4333', '10151', '2', '1', '0', '0', '0', '2019-06-06 03:56:13', '2019-06-06 03:56:13');
INSERT INTO `dramascore` VALUES ('4335', '529', '1', '0', '1', '0', '0', '2019-06-06 08:31:05', '2019-06-06 08:31:05');
INSERT INTO `dramascore` VALUES ('4337', '153089', '1', '0', '0', '1', '0', '2019-06-06 09:16:30', '2019-06-06 09:16:30');
INSERT INTO `dramascore` VALUES ('4339', '521413', '1', '1', '0', '0', '2', '2019-06-06 09:23:30', '2019-06-07 06:15:50');
INSERT INTO `dramascore` VALUES ('4341', '521257', '1', '2', '0', '0', '0', '2019-06-06 09:57:09', '2019-06-07 06:17:32');
INSERT INTO `dramascore` VALUES ('4343', '162072', '1', '0', '0', '0', '1', '2019-06-06 10:07:54', '2019-06-06 10:07:54');
INSERT INTO `dramascore` VALUES ('4345', '485647', '1', '0', '0', '1', '0', '2019-06-06 11:43:10', '2019-06-06 11:43:10');
INSERT INTO `dramascore` VALUES ('4347', '156294', '1', '1', '0', '0', '0', '2019-06-06 11:46:55', '2019-06-06 11:46:55');
INSERT INTO `dramascore` VALUES ('4349', '153093', '1', '0', '0', '0', '1', '2019-06-06 12:00:33', '2019-06-06 12:00:33');
INSERT INTO `dramascore` VALUES ('4351', '334', '1', '1', '0', '0', '0', '2019-06-06 14:46:55', '2019-06-06 14:46:55');
INSERT INTO `dramascore` VALUES ('4353', '525687', '1', '1', '0', '0', '1', '2019-06-06 19:05:33', '2019-06-09 10:34:28');
INSERT INTO `dramascore` VALUES ('4355', '158954', '1', '1', '0', '0', '0', '2019-06-06 22:10:53', '2019-06-06 22:10:53');
INSERT INTO `dramascore` VALUES ('4357', '526325', '1', '1', '0', '0', '0', '2019-06-06 23:43:10', '2019-06-06 23:43:10');
INSERT INTO `dramascore` VALUES ('4359', '51394', '1', '1', '0', '0', '0', '2019-06-07 00:48:05', '2019-06-07 00:48:05');
INSERT INTO `dramascore` VALUES ('4361', '156360', '1', '1', '0', '0', '0', '2019-06-07 01:35:07', '2019-06-07 01:35:07');
INSERT INTO `dramascore` VALUES ('4363', '162231', '1', '1', '0', '0', '0', '2019-06-07 02:44:56', '2019-06-07 02:44:56');
INSERT INTO `dramascore` VALUES ('4365', '1241', '1', '0', '0', '0', '1', '2019-06-07 03:12:19', '2019-06-07 03:12:19');
INSERT INTO `dramascore` VALUES ('4367', '161084', '1', '1', '0', '0', '0', '2019-06-07 04:07:29', '2019-06-07 04:07:29');
INSERT INTO `dramascore` VALUES ('4369', '817', '1', '1', '0', '0', '0', '2019-06-07 04:58:30', '2019-06-07 04:58:30');
INSERT INTO `dramascore` VALUES ('4371', '163692', '1', '1', '0', '0', '0', '2019-06-07 05:56:59', '2019-06-07 05:56:59');
INSERT INTO `dramascore` VALUES ('4373', '526919', '1', '2', '0', '0', '0', '2019-06-07 06:07:33', '2019-06-08 10:10:06');
INSERT INTO `dramascore` VALUES ('4375', '526845', '1', '4', '0', '0', '1', '2019-06-07 08:29:08', '2019-06-10 00:44:29');
INSERT INTO `dramascore` VALUES ('4377', '525963', '1', '1', '0', '0', '0', '2019-06-07 09:22:28', '2019-06-07 09:22:28');
INSERT INTO `dramascore` VALUES ('4379', '485627', '1', '2', '0', '0', '0', '2019-06-07 09:34:28', '2019-06-12 07:55:42');
INSERT INTO `dramascore` VALUES ('4381', '526693', '1', '3', '0', '0', '0', '2019-06-07 09:36:46', '2019-06-08 10:11:50');
INSERT INTO `dramascore` VALUES ('4383', '526911', '1', '3', '0', '0', '1', '2019-06-07 09:38:12', '2019-06-11 11:33:09');
INSERT INTO `dramascore` VALUES ('4385', '527007', '1', '4', '0', '0', '0', '2019-06-07 09:39:56', '2019-06-12 06:47:51');
INSERT INTO `dramascore` VALUES ('4387', '59609', '4', '1', '0', '0', '0', '2019-06-07 11:39:51', '2019-06-07 11:39:51');
INSERT INTO `dramascore` VALUES ('4389', '526317', '1', '2', '1', '0', '0', '2019-06-07 11:42:16', '2019-06-10 04:16:49');
INSERT INTO `dramascore` VALUES ('4391', '154467', '1', '0', '0', '0', '1', '2019-06-07 11:46:04', '2019-06-07 11:46:04');
INSERT INTO `dramascore` VALUES ('4393', '495403', '4', '0', '0', '0', '1', '2019-06-07 20:42:49', '2019-06-07 20:42:49');
INSERT INTO `dramascore` VALUES ('4395', '495317', '4', '0', '0', '0', '1', '2019-06-07 20:43:56', '2019-06-07 20:43:56');
INSERT INTO `dramascore` VALUES ('4397', '527257', '1', '2', '0', '0', '0', '2019-06-08 00:35:27', '2019-06-08 20:22:00');
INSERT INTO `dramascore` VALUES ('4399', '1219', '1', '1', '0', '0', '0', '2019-06-08 00:52:34', '2019-06-08 00:52:34');
INSERT INTO `dramascore` VALUES ('4401', '527501', '1', '1', '1', '0', '2', '2019-06-08 01:54:37', '2019-06-08 11:09:34');
INSERT INTO `dramascore` VALUES ('4403', '673', '1', '1', '0', '0', '0', '2019-06-08 04:15:53', '2019-06-08 04:15:53');
INSERT INTO `dramascore` VALUES ('4405', '523', '1', '1', '0', '0', '0', '2019-06-08 04:43:46', '2019-06-08 04:43:46');
INSERT INTO `dramascore` VALUES ('4407', '527271', '1', '0', '0', '1', '0', '2019-06-08 07:02:30', '2019-06-08 07:02:30');
INSERT INTO `dramascore` VALUES ('4409', '527425', '2', '3', '0', '0', '1', '2019-06-08 09:03:35', '2019-06-11 07:27:20');
INSERT INTO `dramascore` VALUES ('4411', '2040', '1', '1', '0', '0', '0', '2019-06-08 09:18:27', '2019-06-08 09:18:27');
INSERT INTO `dramascore` VALUES ('4413', '10397', '2', '1', '0', '0', '0', '2019-06-08 10:18:55', '2019-06-08 10:18:55');
INSERT INTO `dramascore` VALUES ('4415', '57657', '1', '1', '0', '0', '0', '2019-06-08 11:42:44', '2019-06-08 11:42:44');
INSERT INTO `dramascore` VALUES ('4417', '1842', '1', '0', '0', '1', '0', '2019-06-08 11:55:04', '2019-06-08 11:55:04');
INSERT INTO `dramascore` VALUES ('4419', '11525', '4', '1', '0', '0', '0', '2019-06-08 12:50:19', '2019-06-08 12:50:19');
INSERT INTO `dramascore` VALUES ('4421', '141844', '1', '1', '0', '0', '0', '2019-06-08 13:49:02', '2019-06-08 13:49:02');
INSERT INTO `dramascore` VALUES ('4423', '2539', '1', '1', '0', '0', '0', '2019-06-08 14:24:25', '2019-06-08 14:24:25');
INSERT INTO `dramascore` VALUES ('4425', '149274', '1', '0', '1', '0', '0', '2019-06-08 17:15:52', '2019-06-08 17:15:52');
INSERT INTO `dramascore` VALUES ('4427', '527305', '1', '2', '0', '0', '1', '2019-06-08 18:26:10', '2019-06-10 11:10:54');
INSERT INTO `dramascore` VALUES ('4429', '527419', '2', '1', '0', '0', '0', '2019-06-08 22:14:12', '2019-06-08 22:14:12');
INSERT INTO `dramascore` VALUES ('4431', '529211', '2', '4', '0', '0', '0', '2019-06-09 00:15:41', '2019-06-10 07:54:51');
INSERT INTO `dramascore` VALUES ('4433', '161166', '1', '1', '0', '0', '0', '2019-06-09 01:14:20', '2019-06-09 01:14:20');
INSERT INTO `dramascore` VALUES ('4435', '515389', '1', '1', '0', '0', '0', '2019-06-09 01:39:05', '2019-06-09 01:39:05');
INSERT INTO `dramascore` VALUES ('4437', '11623', '4', '1', '0', '0', '0', '2019-06-09 01:47:27', '2019-06-09 01:47:27');
INSERT INTO `dramascore` VALUES ('4439', '150606', '1', '1', '0', '0', '0', '2019-06-09 02:00:47', '2019-06-09 02:00:47');
INSERT INTO `dramascore` VALUES ('4441', '159444', '1', '2', '0', '0', '0', '2019-06-09 02:05:36', '2019-06-09 02:05:37');
INSERT INTO `dramascore` VALUES ('4443', '161165', '1', '1', '0', '0', '0', '2019-06-09 03:04:12', '2019-06-09 03:04:12');
INSERT INTO `dramascore` VALUES ('4445', '104143', '1', '0', '0', '0', '1', '2019-06-09 06:36:44', '2019-06-09 06:36:44');
INSERT INTO `dramascore` VALUES ('4447', '161327', '1', '1', '0', '0', '0', '2019-06-09 07:35:19', '2019-06-09 07:35:19');
INSERT INTO `dramascore` VALUES ('4449', '440163', '1', '1', '0', '0', '0', '2019-06-09 07:46:48', '2019-06-09 07:46:48');
INSERT INTO `dramascore` VALUES ('4451', '1765', '1', '1', '0', '0', '0', '2019-06-09 10:42:12', '2019-06-09 10:42:12');
INSERT INTO `dramascore` VALUES ('4453', '526927', '1', '1', '0', '0', '0', '2019-06-09 10:56:08', '2019-06-09 10:56:08');
INSERT INTO `dramascore` VALUES ('4455', '150980', '1', '1', '0', '0', '0', '2019-06-09 11:27:36', '2019-06-09 11:27:36');
INSERT INTO `dramascore` VALUES ('4457', '515613', '1', '2', '0', '0', '0', '2019-06-09 15:33:43', '2019-06-10 09:24:59');
INSERT INTO `dramascore` VALUES ('4459', '526565', '1', '0', '1', '0', '0', '2019-06-09 17:24:06', '2019-06-09 17:24:06');
INSERT INTO `dramascore` VALUES ('4461', '156189', '1', '1', '0', '0', '0', '2019-06-09 18:28:12', '2019-06-09 18:28:12');
INSERT INTO `dramascore` VALUES ('4463', '533563', '1', '2', '0', '0', '0', '2019-06-09 22:13:56', '2019-06-10 08:36:10');
INSERT INTO `dramascore` VALUES ('4465', '15534', '1', '1', '0', '0', '0', '2019-06-09 22:35:54', '2019-06-09 22:35:54');
INSERT INTO `dramascore` VALUES ('4467', '153330', '1', '2', '0', '0', '0', '2019-06-09 22:38:55', '2019-06-09 22:38:55');
INSERT INTO `dramascore` VALUES ('4469', '11008', '1', '0', '0', '0', '1', '2019-06-10 00:53:15', '2019-06-10 00:53:15');
INSERT INTO `dramascore` VALUES ('4471', '527411', '2', '2', '1', '0', '1', '2019-06-10 01:15:46', '2019-06-12 07:19:08');
INSERT INTO `dramascore` VALUES ('4473', '1215', '1', '1', '0', '0', '0', '2019-06-10 05:02:40', '2019-06-10 05:02:40');
INSERT INTO `dramascore` VALUES ('4475', '534157', '1', '6', '0', '0', '0', '2019-06-10 05:07:50', '2019-06-13 10:50:53');
INSERT INTO `dramascore` VALUES ('4477', '154512', '1', '0', '1', '0', '0', '2019-06-10 06:07:01', '2019-06-10 06:07:01');
INSERT INTO `dramascore` VALUES ('4479', '161143', '1', '0', '1', '0', '0', '2019-06-10 06:22:13', '2019-06-10 06:22:13');
INSERT INTO `dramascore` VALUES ('4481', '534083', '1', '2', '3', '1', '1', '2019-06-10 06:30:06', '2019-06-13 09:06:42');
INSERT INTO `dramascore` VALUES ('4483', '533917', '1', '0', '0', '0', '1', '2019-06-10 06:40:23', '2019-06-10 06:40:23');
INSERT INTO `dramascore` VALUES ('4485', '527407', '2', '4', '0', '0', '0', '2019-06-10 07:11:23', '2019-06-13 02:17:30');
INSERT INTO `dramascore` VALUES ('4487', '1579', '1', '0', '0', '0', '1', '2019-06-10 07:14:27', '2019-06-10 07:14:27');
INSERT INTO `dramascore` VALUES ('4489', '554', '1', '1', '0', '0', '0', '2019-06-10 07:26:02', '2019-06-10 07:26:02');
INSERT INTO `dramascore` VALUES ('4491', '534531', '1', '2', '2', '1', '0', '2019-06-10 08:12:57', '2019-06-12 02:02:24');
INSERT INTO `dramascore` VALUES ('4493', '529241', '2', '1', '0', '0', '0', '2019-06-10 08:27:42', '2019-06-10 08:27:42');
INSERT INTO `dramascore` VALUES ('4495', '11173', '1', '1', '0', '0', '0', '2019-06-10 08:32:13', '2019-06-10 08:32:13');
INSERT INTO `dramascore` VALUES ('4497', '534187', '1', '20', '0', '0', '1', '2019-06-10 08:35:42', '2019-06-13 14:43:15');
INSERT INTO `dramascore` VALUES ('4499', '157579', '1', '1', '0', '0', '0', '2019-06-10 08:38:42', '2019-06-10 08:38:42');
INSERT INTO `dramascore` VALUES ('4501', '526853', '1', '1', '0', '0', '0', '2019-06-10 08:42:22', '2019-06-10 08:42:22');
INSERT INTO `dramascore` VALUES ('4503', '10968', '1', '0', '0', '0', '1', '2019-06-10 08:49:19', '2019-06-10 08:49:19');
INSERT INTO `dramascore` VALUES ('4505', '2451', '1', '0', '0', '0', '1', '2019-06-10 08:50:01', '2019-06-10 08:50:01');
INSERT INTO `dramascore` VALUES ('4507', '2376', '1', '0', '0', '0', '1', '2019-06-10 08:51:32', '2019-06-10 08:51:32');
INSERT INTO `dramascore` VALUES ('4509', '2348', '1', '1', '0', '0', '0', '2019-06-10 08:52:08', '2019-06-10 08:52:08');
INSERT INTO `dramascore` VALUES ('4511', '2243', '1', '0', '0', '0', '1', '2019-06-10 08:52:24', '2019-06-10 08:52:24');
INSERT INTO `dramascore` VALUES ('4513', '938', '1', '0', '0', '0', '1', '2019-06-10 08:53:23', '2019-06-10 08:53:23');
INSERT INTO `dramascore` VALUES ('4515', '534537', '2', '126', '11', '7', '4', '2019-06-10 08:58:31', '2019-06-13 12:18:28');
INSERT INTO `dramascore` VALUES ('4517', '1445', '1', '1', '0', '0', '0', '2019-06-10 09:02:00', '2019-06-10 09:02:00');
INSERT INTO `dramascore` VALUES ('4519', '10920', '1', '1', '0', '0', '0', '2019-06-10 09:02:59', '2019-06-10 09:02:59');
INSERT INTO `dramascore` VALUES ('4521', '519', '1', '0', '0', '0', '1', '2019-06-10 09:03:24', '2019-06-10 09:03:24');
INSERT INTO `dramascore` VALUES ('4523', '529275', '2', '2', '0', '0', '1', '2019-06-10 09:47:20', '2019-06-11 07:26:45');
INSERT INTO `dramascore` VALUES ('4525', '533759', '1', '0', '1', '0', '1', '2019-06-10 10:17:37', '2019-06-11 08:57:41');
INSERT INTO `dramascore` VALUES ('4527', '154885', '1', '1', '0', '0', '0', '2019-06-10 11:53:29', '2019-06-10 11:53:29');
INSERT INTO `dramascore` VALUES ('4529', '494587', '4', '1', '0', '0', '0', '2019-06-10 20:55:34', '2019-06-10 20:55:34');
INSERT INTO `dramascore` VALUES ('4531', '534801', '1', '1', '0', '2', '1', '2019-06-10 22:36:49', '2019-06-12 06:46:36');
INSERT INTO `dramascore` VALUES ('4533', '527401', '2', '4', '0', '0', '0', '2019-06-10 22:57:34', '2019-06-12 00:14:41');
INSERT INTO `dramascore` VALUES ('4535', '156822', '1', '0', '0', '1', '0', '2019-06-11 00:07:48', '2019-06-11 00:07:48');
INSERT INTO `dramascore` VALUES ('4537', '534107', '1', '3', '0', '1', '0', '2019-06-11 03:36:05', '2019-06-12 09:49:54');
INSERT INTO `dramascore` VALUES ('4539', '495169', '4', '1', '0', '0', '0', '2019-06-11 05:14:51', '2019-06-11 05:14:51');
INSERT INTO `dramascore` VALUES ('4541', '533601', '1', '1', '0', '0', '0', '2019-06-11 06:24:38', '2019-06-11 06:24:38');
INSERT INTO `dramascore` VALUES ('4543', '2086', '1', '0', '0', '1', '0', '2019-06-11 07:26:25', '2019-06-11 07:26:25');
INSERT INTO `dramascore` VALUES ('4545', '529209', '2', '1', '0', '0', '1', '2019-06-11 07:27:33', '2019-06-11 07:27:53');
INSERT INTO `dramascore` VALUES ('4547', '529481', '2', '0', '1', '0', '0', '2019-06-11 07:28:30', '2019-06-11 07:28:30');
INSERT INTO `dramascore` VALUES ('4549', '504125', '2', '0', '1', '0', '0', '2019-06-11 07:28:54', '2019-06-11 07:28:54');
INSERT INTO `dramascore` VALUES ('4551', '534173', '1', '2', '0', '0', '0', '2019-06-11 07:30:30', '2019-06-12 04:26:20');
INSERT INTO `dramascore` VALUES ('4553', '536381', '2', '1', '0', '0', '0', '2019-06-11 07:37:48', '2019-06-11 07:37:48');
INSERT INTO `dramascore` VALUES ('4555', '161200', '1', '0', '1', '0', '0', '2019-06-11 09:31:09', '2019-06-11 09:31:09');
INSERT INTO `dramascore` VALUES ('4557', '15229', '1', '1', '0', '0', '0', '2019-06-11 11:34:41', '2019-06-11 11:34:41');
INSERT INTO `dramascore` VALUES ('4559', '32956', '1', '1', '0', '0', '0', '2019-06-11 13:37:44', '2019-06-11 13:37:44');
INSERT INTO `dramascore` VALUES ('4561', '160248', '1', '1', '0', '0', '0', '2019-06-11 21:00:46', '2019-06-11 21:00:46');
INSERT INTO `dramascore` VALUES ('4563', '153188', '1', '0', '0', '1', '0', '2019-06-11 21:01:04', '2019-06-11 21:01:04');
INSERT INTO `dramascore` VALUES ('4565', '485587', '1', '1', '0', '0', '0', '2019-06-11 23:05:50', '2019-06-11 23:05:50');
INSERT INTO `dramascore` VALUES ('4567', '301', '1', '1', '0', '0', '0', '2019-06-12 08:06:12', '2019-06-12 08:06:12');
INSERT INTO `dramascore` VALUES ('4569', '154890', '1', '1', '0', '0', '0', '2019-06-12 09:29:37', '2019-06-12 09:29:37');
INSERT INTO `dramascore` VALUES ('4571', '533575', '1', '0', '0', '0', '1', '2019-06-12 09:57:47', '2019-06-12 09:57:47');
INSERT INTO `dramascore` VALUES ('4573', '11024', '1', '1', '0', '0', '0', '2019-06-12 10:23:05', '2019-06-12 10:23:05');
INSERT INTO `dramascore` VALUES ('4575', '10344', '2', '1', '0', '0', '0', '2019-06-12 10:54:43', '2019-06-12 10:54:43');
INSERT INTO `dramascore` VALUES ('4577', '2678', '1', '1', '0', '0', '0', '2019-06-12 13:53:26', '2019-06-12 13:53:26');
INSERT INTO `dramascore` VALUES ('4579', '155904', '1', '1', '1', '0', '0', '2019-06-12 22:23:32', '2019-06-12 22:23:33');
INSERT INTO `dramascore` VALUES ('4581', '198', '1', '1', '0', '0', '0', '2019-06-12 22:49:53', '2019-06-12 22:49:53');
INSERT INTO `dramascore` VALUES ('4583', '10092', '2', '0', '0', '1', '0', '2019-06-12 23:01:40', '2019-06-12 23:01:40');
INSERT INTO `dramascore` VALUES ('4585', '10369', '2', '0', '0', '0', '1', '2019-06-13 05:31:55', '2019-06-13 05:31:55');
INSERT INTO `dramascore` VALUES ('4587', '957', '1', '1', '0', '0', '0', '2019-06-13 05:48:18', '2019-06-13 05:48:18');
INSERT INTO `dramascore` VALUES ('4589', '153271', '1', '1', '0', '0', '0', '2019-06-13 06:54:19', '2019-06-13 06:54:19');
INSERT INTO `dramascore` VALUES ('4591', '149299', '1', '1', '0', '0', '0', '2019-06-13 07:02:31', '2019-06-13 07:02:31');
INSERT INTO `dramascore` VALUES ('4593', '2185', '1', '1', '0', '0', '0', '2019-06-13 07:17:08', '2019-06-13 07:17:08');
INSERT INTO `dramascore` VALUES ('4595', '159313', '1', '1', '0', '0', '0', '2019-06-13 07:47:06', '2019-06-13 07:47:06');
INSERT INTO `dramascore` VALUES ('4597', '154855', '1', '1', '0', '0', '0', '2019-06-13 08:34:51', '2019-06-13 08:34:51');
INSERT INTO `dramascore` VALUES ('4599', '534127', '1', '1', '0', '0', '0', '2019-06-13 09:10:51', '2019-06-13 09:10:51');
INSERT INTO `dramascore` VALUES ('4601', '1825', '1', '1', '0', '0', '0', '2019-06-13 09:50:35', '2019-06-13 09:50:35');
INSERT INTO `dramascore` VALUES ('4603', '159886', '1', '1', '0', '0', '0', '2019-06-13 11:52:40', '2019-06-13 11:52:40');

-- ----------------------------
-- Table structure for dramaview
-- ----------------------------
DROP TABLE IF EXISTS `dramaview`;
CREATE TABLE `dramaview` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `dramaid` int(11) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT '1',
  `viewdate` varchar(100) DEFAULT NULL,
  `viewcount` int(11) DEFAULT '0',
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dramaview
-- ----------------------------

-- ----------------------------
-- Table structure for dvbbox
-- ----------------------------
DROP TABLE IF EXISTS `dvbbox`;
CREATE TABLE `dvbbox` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '盒子id',
  `mac` varchar(255) DEFAULT NULL,
  `orderid` varchar(255) DEFAULT NULL COMMENT '访问token',
  `provid` varchar(255) DEFAULT NULL,
  `system` varchar(255) DEFAULT NULL,
  `chip` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dvbbox
-- ----------------------------
INSERT INTO `dvbbox` VALUES ('1', '4C001B000027', null, 'AUDISAT_A5', 'AUDISAT_A5', 'SUN1507E', '1', '2017-07-17 16:08:33', '2017-07-17 16:08:31');
INSERT INTO `dvbbox` VALUES ('2', '4C001B000A03', null, 'AUDISAT_A5', 'AUDISAT_A5', 'SUN1507E', '1', '2017-07-17 16:08:33', '2017-07-17 16:08:31');
INSERT INTO `dvbbox` VALUES ('3', '4C001B000BE0', null, 'AUDISAT_A5', 'AUDISAT_A5', 'SUN1507E', '1', '2017-07-17 16:08:33', '2017-07-17 16:08:31');

-- ----------------------------
-- Table structure for playback
-- ----------------------------
DROP TABLE IF EXISTS `playback`;
CREATE TABLE `playback` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `channelId` int(10) DEFAULT NULL COMMENT '频道id',
  `categoryId` int(11) DEFAULT NULL COMMENT '类型标签id',
  `alias` varchar(100) DEFAULT NULL COMMENT '频道别名',
  `name` varchar(100) DEFAULT NULL COMMENT '频道名称',
  `enable` tinyint(1) DEFAULT '1' COMMENT '是否启用',
  `liveUrl` text COMMENT '直播地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of playback
-- ----------------------------
INSERT INTO `playback` VALUES ('13', '285', '47', 'Telecine_Pipoca', 'Telecine_Pipoca_FHD', '1', 'http://playhddigital.me:80/live/Alberto/oN8eR0dTek/125.ts,http://playhddigital.me:80/live/Alberto/oN8eR0dTek/146.ts');
INSERT INTO `playback` VALUES ('14', '33', '48', 'Cinemax', 'Cinemax_FHD', '1', 'http://playhddigital.me:80/live/Alberto/oN8eR0dTek/12.ts,http://playhddigital.me:80/live/Alberto/oN8eR0dTek/171.ts');
INSERT INTO `playback` VALUES ('15', '112', '49', 'FoxSports', 'FoxSports_FHD', '1', 'http://playhddigital.me:80/live/Alberto/oN8eR0dTek/45.ts,http://playhddigital.me:80/live/Alberto/oN8eR0dTek/151.ts,http://iplay.ddns.me:8080/live/Abto/RG2CyF9gyg/140.ts');
INSERT INTO `playback` VALUES ('16', '111', '50', 'FoxSports_2', 'FoxSports_2_FHD', '1', 'http://playhddigital.me:80/live/Alberto/oN8eR0dTek/44.ts,http://playhddigital.me:80/live/Alberto/oN8eR0dTek/152.ts,http://iplay.ddns.me:8080/live/Abto/RG2CyF9gyg/141.ts');
INSERT INTO `playback` VALUES ('17', '14', '51', 'Band', 'Band_TV_FHD', '1', 'http://playhddigital.me:80/ive/Alberto/oN8eR0dTek/153.ts,http://playhddigital.me:80/live/Alberto/oN8eR0dTek/187.ts');
INSERT INTO `playback` VALUES ('18', '35', '52', 'Combate', 'Combate_FHD', '1', 'http://playhddigital.me:80/live/Alberto/oN8eR0dTek/16.ts,http://playhddigital.me:80/live/Alberto/oN8eR0dTek/149.ts');
INSERT INTO `playback` VALUES ('19', '101', '53', 'Fox_Channel', 'Fox_FHD', '1', 'http://playhddigital.me:80/live/Alberto/oN8eR0dTek/40.ts,http://playhddigital.me:80/live/Alberto/oN8eR0dTek/142.ts');
INSERT INTO `playback` VALUES ('21', '154', '55', 'HBO_2', 'HBO_2_FHD', '1', 'http://playhddigital.me:80/live/Alberto/oN8eR0dTek/162.ts,http://playhddigital.me:80/live/Alberto/oN8eR0dTek/57.ts');
INSERT INTO `playback` VALUES ('22', '156', '56', 'HBO', 'HBO_FHD', '1', 'http://playhddigital.me:80/live/Alberto/oN8eR0dTek/59.ts,http://playhddigital.me:80/live/Alberto/oN8eR0dTek/161.ts');
INSERT INTO `playback` VALUES ('23', '8', '57', 'Animal_Planet', 'Animal_Planet_FHD', '1', 'http://playhddigital.me:80/live/Alberto/oN8eR0dTek/3.ts,http://playhddigital.me:80/live/Alberto/oN8eR0dTek/340.ts,http://iplay.ddns.me:8080/live/Abto/RG2CyF9gyg/192.ts');
INSERT INTO `playback` VALUES ('24', '59', '58', 'Discovery_World', 'Discovery_World_FHD', '1', 'http://playhddigital.me:80/live/Alberto/oN8eR0dTek/27.ts,http://playhddigital.me:80/live/Alberto/oN8eR0dTek/303.ts');
INSERT INTO `playback` VALUES ('26', '161', '60', 'HBO_Plus', 'HBO_Plus_FHD', '1', 'http://playhddigital.me:80/live/Alberto/oN8eR0dTek/61.ts,http://playhddigital.me:80/live/Alberto/oN8eR0dTek/163.ts');
INSERT INTO `playback` VALUES ('27', '163', '61', 'HBO_Signature', 'HBO_Signature_FHD', '1', 'http://playhddigital.me:80/live/Alberto/oN8eR0dTek/62.ts,http://playhddigital.me:80/live/Alberto/oN8eR0dTek/221.ts');
INSERT INTO `playback` VALUES ('30', '185', '65', 'Megapix', 'Mega_Pix_FHD', '1', 'http://playhddigital.me:80/live/Alberto/oN8eR0dTek/71.ts,http://playhddigital.me:80/live/Alberto/oN8eR0dTek/354.ts');
INSERT INTO `playback` VALUES ('31', '42', '66', 'Discovery_Channel', 'Discovery_Channel_FHD', '1', 'http://playhddigital.me:80/live/Alberto/oN8eR0dTek/20.ts,http://playhddigital.me:80/live/Alberto/oN8eR0dTek/344.ts,http://iplay.ddns.me:8080/live/Abto/RG2CyF9gyg/3116.ts,http://iplay.ddns.me:8080/live/Abto/RG2CyF9gyg/1131.ts,http://iplay.ddns.me:8080/live/Abto/RG2CyF9gyg/171.ts');
INSERT INTO `playback` VALUES ('32', '179', '67', 'Max', 'Max_FHD', '1', 'http://playhddigital.me:80/live/Alberto/oN8eR0dTek/299.ts,http://playhddigital.me:80/live/Alberto/oN8eR0dTek/351.ts');
INSERT INTO `playback` VALUES ('33', '55', '84', 'Discovery_Theater', 'Discovery_Theater_FHD', '1', 'http://playhddigital.me:80/live/Alberto/oN8eR0dTek/25.ts,http://playhddigital.me:80/live/Alberto/oN8eR0dTek/347.ts');
INSERT INTO `playback` VALUES ('35', '45', '88', 'Discovery_Civilization', 'Discovery_Civilization_FHD', '1', 'http://playhddigital.me:80/live/Alberto/oN8eR0dTek/306.ts,http://playhddigital.me:80/live/Alberto/oN8eR0dTek/21.ts');
INSERT INTO `playback` VALUES ('36', '47', '89', 'Discovery_Home_Health', 'Discovery_H_H_FHD', '1', 'http://playhddigital.me:80/live/Alberto/oN8eR0dTek/345.ts,http://playhddigital.me:80/live/Alberto/oN8eR0dTek/22.ts');
INSERT INTO `playback` VALUES ('38', '53', '91', 'Discovery_Science', 'Discovery_Science_FHD', '1', 'http://playhddigital.me:80/live/Alberto/oN8eR0dTek/305.ts,http://playhddigital.me:80/live/Alberto/oN8eR0dTek/24.ts');
INSERT INTO `playback` VALUES ('39', '57', '92', 'Discovery_Turbo', 'Discovery_Turbo_FHD', '1', 'http://playhddigital.me:80/live/Alberto/oN8eR0dTek/26.ts,http://playhddigital.me:80/live/Alberto/oN8eR0dTek/348.ts,http://iplay.ddns.me:8080/live/Abto/RG2CyF9gyg/165.ts');
INSERT INTO `playback` VALUES ('40', '276', '93', 'Telecine_Action', 'Telecine_Action_FHD', '1', 'http://playhddigital.me:80/live/Alberto/oN8eR0dTek/122.ts,http://playhddigital.me:80/live/Alberto/oN8eR0dTek/144.ts');
INSERT INTO `playback` VALUES ('41', '281', '94', 'Telecine_Fun', 'Telecine_Fun_FHD', '1', 'http://playhddigital.me:80/live/Alberto/oN8eR0dTek/124.ts,http://playhddigital.me:80/live/Albero/oN8eR0dTek/148.ts');
INSERT INTO `playback` VALUES ('42', '287', '95', 'Telecine_Premium', 'Telecine_Premium_FHD', '1', 'http://playhddigital.me:80/live/Alberto/oN8eR0dTek/126.ts,http://playhddigital.me:80/live/Alberto/oN8eR0dTek/143.ts');
INSERT INTO `playback` VALUES ('43', '290', '96', 'Telecine_Touch', 'Telecine_Touch_FHD', '1', 'http://playhddigital.me:80/live/Alberto/oN8eR0dTek/127.ts,http://playhddigital.me:80/live/Alberto/oN8eR0dTek/147.ts\r\n');
INSERT INTO `playback` VALUES ('44', '105', '97', 'Fox_Premium_1', 'FOX_PREMIUM1_FHD', '1', 'http://playhddigital.me:80/live/Alberto/oN8eR0dTek/42.ts,http://playhddigital.me:80/live/Alberto/oN8eR0dTek/570.ts,http://iplay.ddns.me:8080/live/Abto/RG2CyF9gyg/145.ts');
INSERT INTO `playback` VALUES ('45', '107', '98', 'Fox_Premium_2', 'FOX_PREMIUM2_FHD', '1', 'http://playhddigital.me:80/live/Alberto/oN8eR0dTek/43.ts,http://playhddigital.me:80/live/Alberto/oN8eR0dTek/571.ts,http://iplay.ddns.me:8080/live/Abto/RG2CyF9gyg/144.ts');
INSERT INTO `playback` VALUES ('47', '249', '100', 'SporTV', 'Sport_TV_FHD', '1', 'http://playhddigital.me:80/live/Alberto/oN8eR0dTek/156.ts,http://playhddigital.me:80/live/Alberto/oN8eR0dTek/107.ts,http://iplay.ddns.me:8080/live/Abto/RG2CyF9gyg/60.ts');
INSERT INTO `playback` VALUES ('50', '2', '103', 'AMC', 'AMC_FHD', '1', 'http://playhddigital.me:80/live/Alberto/oN8eR0dTek/451.ts,http://playhddigital.me:80/live/Alberto/oN8eR0dTek/467.ts,http://iplay.ddns.me:8080/live/Abto/RG2CyF9gyg/2906.ts,http://iplay.ddns.me:8080/live/Abto/RG2CyF9gyg/6182.ts');
INSERT INTO `playback` VALUES ('51', '4', '104', 'AXN', 'AXN_FHD', '1', 'http://playhddigital.me:80/live/Alberto/oN8eR0dTek/1.ts,http://playhddigital.me:80/live/Alberto/oN8eR0dTek/339.ts,http://iplay.ddns.me:8080/live/Abto/RG2CyF9gyg/191.ts');
INSERT INTO `playback` VALUES ('52', '239', '105', 'Sony', 'Sony_FHD', '1', 'http://playhddigital.me:80/live/Alberto/oN8eR0dTek/105.ts,http://playhddigital.me:80/live/Alberto/oN8eR0dTek/342.ts');
INSERT INTO `playback` VALUES ('53', '303', '106', 'Warner_Channel', 'Warner_FHD', '1', 'http://playhddigital.me:80/live/Alberto/oN8eR0dTek/135.ts,http://playhddigital.me:80/live/Alberto/oN8eR0dTek/378.ts');
INSERT INTO `playback` VALUES ('55', '6', '108', 'A_E', 'A_E_FHD', '1', 'http://playhddigital.me:80/live/Alberto/oN8eR0dTek/2.ts,http://playhddigital.me:80/live/Alberto/oN8eR0dTek/338.ts,http://iplay.ddns.me:8080/live/Abto/RG2CyF9gyg/193.ts,http://iplay.ddns.me:8080/live/Abto/RG2CyF9gyg/926.ts');
INSERT INTO `playback` VALUES ('57', '122', '117', 'GloboNews', 'Globo_News_FHD', '1', 'http://playhddigital.me:80/live/Alberto/oN8eR0dTek/48.ts,http://playhddigital.me:80/live/Alberto/oN8eR0dTek/396.ts,http://iplay.ddns.me:8080/live/Abto/RG2CyF9gyg/132.ts');
INSERT INTO `playback` VALUES ('58', '139', '118', 'Globo_SP', 'Globo_SP_FHD', '1', 'http://iplay.ddns.me:8080/live/Abto/RG2CyF9gyg/127.ts,http://playhddigital.me:80/live/Alberto/oN8eR0dTek/136.ts,http://playhddigital.me:80/live/Alberto/oN8eR0dTek/53.ts');
INSERT INTO `playback` VALUES ('59', '131', '119', 'TNT', 'TNT_FHD', '1', 'http://playhddigital.me:80/live/Alberto/oN8eR0dTek/114.ts,http://playhddigital.me:80/live/Alberto/oN8eR0dTek/114.ts,http://iplay.ddns.me:8080/live/Abto/RG2CyF9gyg/41.ts');
INSERT INTO `playback` VALUES ('60', '167', '120', 'History', 'History_FHD', '1', 'http://playhddigital.me:80/live/Alberto/oN8eR0dTek/128.ts,http://playhddigital.me:80/live/Alberto/oN8eR0dTek/374.ts');
INSERT INTO `playback` VALUES ('61', '246', '121', 'SBT', 'SBT_FHD', '1', 'http://playhddigital.me:80/live/Alberto/oN8eR0dTek/169.ts,http://playhddigital.me:80/live/Alberto/oN8eR0dTek/139.ts');
INSERT INTO `playback` VALUES ('62', '227', '122', 'RecordTV', 'Record_FHD', '1', 'http://iplay.ddns.me:8080/live/Abto/RG2CyF9gyg/1239.ts,http://playhddigital.me:80/live/Alberto/oN8eR0dTek/384.ts,http://playhddigital.me:80/live/Alberto/oN8eR0dTek/666.ts');
INSERT INTO `playback` VALUES ('68', '200', '135', 'Off', 'Off_FHD', '1', 'http://playhddigital.me:80/live/Alberto/oN8eR0dTek/80.ts,http://playhddigital.me:80/live/Alberto/oN8eR0dTek/376.ts');
INSERT INTO `playback` VALUES ('69', '190', '136', 'NatGeo', 'Nat_Geo_FHD', '1', 'http://playhddigital.me:80/live/Alberto/oN8eR0dTek/77.ts,http://playhddigital.me:80/live/Alberto/oN8eR0dTek/375.ts');
INSERT INTO `playback` VALUES ('71', '292', '227', 'Viva', 'Viva_FHD', '1', 'http://playhddigital.me:80/live/Alberto/oN8eR0dTek/134.ts,http://playhddigital.me:80/live/Alberto/oN8eR0dTek/473.ts');
INSERT INTO `playback` VALUES ('73', '286', '229', 'Universal_TV', 'Universal_Channel_FHD', '1', 'http://playhddigital.me:80/live/Alberto/oN8eR0dTek/130.ts,http://playhddigital.me:80/live/Alberto/oN8eR0dTek/235.ts');
INSERT INTO `playback` VALUES ('75', '102', '231', 'ESPN_Brasil', 'ESPN_Brasil_FHD', '1', 'http://playhddigital.me:80/live/Alberto/oN8eR0dTek/35.ts,http://playhddigital.me:80/live/Alberto/oN8eR0dTek/155.ts,http://iplay.ddns.me:8080/live/Abto/RG2CyF9gyg/151.ts');
INSERT INTO `playback` VALUES ('77', '59', '233', 'BandSports', 'Band_Sports_FHD', '1', 'http://playhddigital.me:80/live/Alberto/oN8eR0dTek/5.ts,http://playhddigital.me:80/live/Alberto/oN8eR0dTek/170.ts');
INSERT INTO `playback` VALUES ('79', '236', '235', 'Space', 'Space_FHD', '1', 'http://playhddigital.me:80/live/Alberto/oN8eR0dTek/106.ts,http://playhddigital.me:80/live/Alberto/oN8eR0dTek/356.ts');
INSERT INTO `playback` VALUES ('81', '71', '237', 'Comedy_Central', 'Comedy_Central_FHD', '1', 'http://playhddigital.me:80/live/Alberto/oN8eR0dTek/463.ts,http://playhddigital.me:80/live/Alberto/oN8eR0dTek/627.ts');
INSERT INTO `playback` VALUES ('83', '62', '239', 'BIS', 'Bis_FHD', '1', 'http://playhddigital.me:80/live/Alberto/oN8eR0dTek/7.ts,http://playhddigital.me:80/live/Alberto/oN8eR0dTek/341.ts');
INSERT INTO `playback` VALUES ('85', '237', '241', 'SporTV_2', 'Sportv_2_FHD', '1', 'http://playhddigital.me:80/live/Alberto/oN8eR0dTek/108.ts,http://playhddigital.me:80/live/Alberto/oN8eR0dTek/648.ts');
INSERT INTO `playback` VALUES ('87', '238', '243', 'SporTV_3', 'Sportv_3_FHD', '1', 'http://playhddigital.me:80/live/Alberto/oN8eR0dTek/109.ts,http://playhddigital.me:80/live/Alberto/oN8eR0dTek/158.ts');

-- ----------------------------
-- Table structure for rsaddr
-- ----------------------------
DROP TABLE IF EXISTS `rsaddr`;
CREATE TABLE `rsaddr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `boxtype` int(11) DEFAULT NULL,
  `mtype` int(11) DEFAULT NULL,
  `path` text,
  `addr` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rsaddr
-- ----------------------------
INSERT INTO `rsaddr` VALUES ('1', '1', '1', '/home/data/', 'http://vod.brphantom.com/');
INSERT INTO `rsaddr` VALUES ('2', '1', '2', '/home/data/', 'http://vod2.brphantom.com/');
INSERT INTO `rsaddr` VALUES ('3', '2', '1', '/home/data/', 'http://vod.brphantom.com/');
INSERT INTO `rsaddr` VALUES ('4', '2', '2', '/home/data/', 'http://vod2.brphantom.com/');
INSERT INTO `rsaddr` VALUES ('5', '2', '4', '/home/data/', 'http://vod3.brphantom.com/');
INSERT INTO `rsaddr` VALUES ('6', '2', '5', '/home/data/', 'http://vod4.brphantom.com:9010/');

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('1', 'Phantomaitak', '8168D5666A8DC834AE2EF6E16E15333E');

-- ----------------------------
-- Table structure for videoinfo
-- ----------------------------
DROP TABLE IF EXISTS `videoinfo`;
CREATE TABLE `videoinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  `videourl` text,
  `pageurl` text,
  `imageurl` text,
  `filepath` text,
  `subtitle` text,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  `cateid` int(11) DEFAULT NULL,
  `dramaid` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '1电影，2连续剧，3成人，4动漫，5回看',
  `num` int(11) DEFAULT '0' COMMENT '剧集',
  `temp` int(11) DEFAULT '0' COMMENT '季',
  `p2purl` text,
  `language` varchar(100) DEFAULT NULL COMMENT '语言(Legendado原音，Dublado配音)',
  `quality` varchar(100) DEFAULT NULL COMMENT '画面质量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=604965 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of videoinfo
-- ----------------------------
INSERT INTO `videoinfo` VALUES ('604931', '忍者神龟：变种时代 ', null, 'haiwaiyy.com', 'C:\\Users\\Administrator\\Desktop\\vod\\img\\1560423559845.jpg', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', null, '0', '2019-06-13 19:11:59', '2019-06-13 19:11:59', '251', '0', '1', '1', '1', null, '', '720p');
INSERT INTO `videoinfo` VALUES ('604932', '黑衣人：全球追缉 ', null, 'haiwaiyy.com', 'C:\\Users\\Administrator\\Desktop\\vod\\img\\黑衣人：全球追缉 .jpg', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', null, '1', '2019-06-14 13:35:49', '2019-06-14 13:35:49', '252', '0', '1', '1', '1', null, '英语', '720p');
INSERT INTO `videoinfo` VALUES ('604933', '黄大仙 ', null, 'haiwaiyy.com', 'https://www.haiwaiyy.comhttp://img1.doubanio.com/view/photo/l/public/p2159870098.webp', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', null, '1', '2019-06-14 13:36:24', '2019-06-14 13:36:24', '253', '0', '1', '1', '1', null, '国语', '720p');
INSERT INTO `videoinfo` VALUES ('604934', '我的一级兄弟 ', null, 'haiwaiyy.com', 'C:\\Users\\Administrator\\Desktop\\vod\\img\\我的一级兄弟 .jpg', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', null, '1', '2019-06-14 13:37:35', '2019-06-14 13:37:35', '253', '0', '1', '1', '1', null, '韩语', '720p');
INSERT INTO `videoinfo` VALUES ('604935', '翻不去的一页 ', null, 'haiwaiyy.com', 'C:\\Users\\Administrator\\Desktop\\vod\\img\\翻不去的一页 .jpg', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', null, '1', '2019-06-14 13:42:11', '2019-06-14 13:42:11', '255', '0', '1', '1', '1', null, '英语', '720p');
INSERT INTO `videoinfo` VALUES ('604936', '御龙王妃 ', null, 'haiwaiyy.com', 'C:\\Users\\Administrator\\Desktop\\vod\\img\\御龙王妃 .jpg', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', null, '1', '2019-06-14 13:49:32', '2019-06-14 13:49:32', '253', '0', '1', '1', '1', null, '国语', '720p');
INSERT INTO `videoinfo` VALUES ('604937', '追龙Ⅱ/追龍2：贼王 ', null, 'haiwaiyy.com', 'C:\\Users\\Administrator\\Desktop\\vod\\img\\追龙追龍2贼王.jpg', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', null, '1', '2019-06-14 14:24:36', '2019-06-14 14:24:36', '251', '0', '1', '1', '1', null, '国语', '720p');
INSERT INTO `videoinfo` VALUES ('604938', '马卡龙少女 ', null, 'haiwaiyy.com', 'C:\\Users\\Administrator\\Desktop\\Series\\img\\马卡龙少女.jpg', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', null, '1', '2019-06-14 14:29:45', '2019-06-14 14:29:45', '257', '0', '1', '1', '1', null, '原音', '720p');
INSERT INTO `videoinfo` VALUES ('604939', '马卡龙少女 ', null, 'haiwaiyy.com', 'C:\\Users\\Administrator\\Desktop\\Series\\img\\马卡龙少女.jpg', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', null, '1', '2019-06-14 14:29:46', '2019-06-14 14:29:46', '257', '0', '1', '1', '1', null, '原音', '720p');
INSERT INTO `videoinfo` VALUES ('604940', '马卡龙少女 ', null, 'haiwaiyy.com', 'C:\\Users\\Administrator\\Desktop\\Series\\img\\马卡龙少女.jpg', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', null, '1', '2019-06-14 14:29:46', '2019-06-14 14:29:46', '257', '0', '1', '1', '1', null, '原音', '720p');
INSERT INTO `videoinfo` VALUES ('604941', '马卡龙少女 ', null, 'haiwaiyy.com', 'C:\\Users\\Administrator\\Desktop\\Series\\img\\马卡龙少女.jpg', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', null, '1', '2019-06-14 14:29:46', '2019-06-14 14:29:46', '257', '0', '1', '1', '1', null, '原音', '720p');
INSERT INTO `videoinfo` VALUES ('604942', '马卡龙少女 ', null, 'haiwaiyy.com', 'C:\\Users\\Administrator\\Desktop\\Series\\img\\马卡龙少女.jpg', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', null, '1', '2019-06-14 14:29:47', '2019-06-14 14:29:47', '257', '0', '1', '1', '1', null, '原音', '720p');
INSERT INTO `videoinfo` VALUES ('604943', '马卡龙少女 ', null, 'haiwaiyy.com', 'C:\\Users\\Administrator\\Desktop\\Series\\img\\马卡龙少女.jpg', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', null, '1', '2019-06-14 14:29:47', '2019-06-14 14:29:47', '257', '0', '1', '1', '1', null, '原音', '720p');
INSERT INTO `videoinfo` VALUES ('604944', '马卡龙少女 ', null, 'haiwaiyy.com', 'C:\\Users\\Administrator\\Desktop\\Series\\img\\马卡龙少女.jpg', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', null, '1', '2019-06-14 14:29:47', '2019-06-14 14:29:47', '257', '0', '1', '1', '1', null, '原音', '720p');
INSERT INTO `videoinfo` VALUES ('604945', '马卡龙少女 ', null, 'haiwaiyy.com', 'C:\\Users\\Administrator\\Desktop\\Series\\img\\马卡龙少女.jpg', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', null, '1', '2019-06-14 14:29:47', '2019-06-14 14:29:47', '257', '0', '1', '1', '1', null, '原音', '720p');
INSERT INTO `videoinfo` VALUES ('604946', '马卡龙少女 ', null, 'haiwaiyy.com', 'C:\\Users\\Administrator\\Desktop\\Series\\img\\马卡龙少女.jpg', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', null, '1', '2019-06-14 14:29:48', '2019-06-14 14:29:48', '257', '0', '1', '1', '1', null, '原音', '720p');
INSERT INTO `videoinfo` VALUES ('604947', '马卡龙少女 ', null, 'haiwaiyy.com', 'C:\\Users\\Administrator\\Desktop\\Series\\img\\马卡龙少女.jpg', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', null, '1', '2019-06-14 14:29:48', '2019-06-14 14:29:48', '257', '0', '1', '1', '1', null, '原音', '720p');
INSERT INTO `videoinfo` VALUES ('604948', '马卡龙少女 ', null, 'haiwaiyy.com', 'C:\\Users\\Administrator\\Desktop\\Series\\img\\马卡龙少女.jpg', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', null, '1', '2019-06-14 14:29:48', '2019-06-14 14:29:48', '257', '0', '1', '1', '1', null, '原音', '720p');
INSERT INTO `videoinfo` VALUES ('604949', '马卡龙少女 ', null, 'haiwaiyy.com', 'C:\\Users\\Administrator\\Desktop\\Series\\img\\马卡龙少女.jpg', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', null, '1', '2019-06-14 14:29:48', '2019-06-14 14:29:48', '257', '0', '1', '1', '1', null, '原音', '720p');
INSERT INTO `videoinfo` VALUES ('604950', '马卡龙少女 ', null, 'haiwaiyy.com', 'C:\\Users\\Administrator\\Desktop\\Series\\img\\马卡龙少女.jpg', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', null, '1', '2019-06-14 14:29:49', '2019-06-14 14:29:49', '257', '0', '1', '1', '1', null, '原音', '720p');
INSERT INTO `videoinfo` VALUES ('604951', '马卡龙少女 ', null, 'haiwaiyy.com', 'C:\\Users\\Administrator\\Desktop\\Series\\img\\马卡龙少女.jpg', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', null, '1', '2019-06-14 14:29:49', '2019-06-14 14:29:49', '257', '0', '1', '1', '1', null, '原音', '720p');
INSERT INTO `videoinfo` VALUES ('604952', '马卡龙少女 ', null, 'haiwaiyy.com', 'C:\\Users\\Administrator\\Desktop\\Series\\img\\马卡龙少女.jpg', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', null, '1', '2019-06-14 14:29:49', '2019-06-14 14:29:49', '257', '0', '1', '1', '1', null, '原音', '720p');
INSERT INTO `videoinfo` VALUES ('604953', '马卡龙少女 ', null, 'haiwaiyy.com', 'C:\\Users\\Administrator\\Desktop\\Series\\img\\马卡龙少女.jpg', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', null, '1', '2019-06-14 14:29:51', '2019-06-14 14:29:51', '257', '0', '1', '1', '1', null, '原音', '720p');
INSERT INTO `videoinfo` VALUES ('604954', '马卡龙少女 ', null, 'haiwaiyy.com', 'C:\\Users\\Administrator\\Desktop\\Series\\img\\马卡龙少女.jpg', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', null, '1', '2019-06-14 14:29:52', '2019-06-14 14:29:52', '257', '0', '1', '1', '1', null, '原音', '720p');
INSERT INTO `videoinfo` VALUES ('604955', '马卡龙少女 ', null, 'haiwaiyy.com', 'C:\\Users\\Administrator\\Desktop\\Series\\img\\马卡龙少女.jpg', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', null, '1', '2019-06-14 14:29:52', '2019-06-14 14:29:52', '257', '0', '1', '1', '1', null, '原音', '720p');
INSERT INTO `videoinfo` VALUES ('604956', '马卡龙少女 ', null, 'haiwaiyy.com', 'C:\\Users\\Administrator\\Desktop\\Series\\img\\马卡龙少女.jpg', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', null, '1', '2019-06-14 14:29:52', '2019-06-14 14:29:52', '257', '0', '1', '1', '1', null, '原音', '720p');
INSERT INTO `videoinfo` VALUES ('604957', '马卡龙少女 ', null, 'haiwaiyy.com', 'C:\\Users\\Administrator\\Desktop\\Series\\img\\马卡龙少女.jpg', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', null, '1', '2019-06-14 14:29:52', '2019-06-14 14:29:52', '257', '0', '1', '1', '1', null, '原音', '720p');
INSERT INTO `videoinfo` VALUES ('604958', '洛城战警第一季 -第02集', null, 'haiwaiyy.com', 'C:\\Users\\Administrator\\Desktop\\Series\\img\\洛城战警第一季.jpg', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', null, '1', '2019-06-14 15:12:38', '2019-06-14 15:12:38', '256', '0', '2', '2', '1', null, '英语', '720p');
INSERT INTO `videoinfo` VALUES ('604959', '洛城战警第一季 -第01集', null, 'haiwaiyy.com', 'C:\\Users\\Administrator\\Desktop\\Series\\img\\洛城战警第一季.jpg', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', null, '1', '2019-06-14 15:12:38', '2019-06-14 15:12:38', '256', '0', '2', '1', '1', null, '英语', '720p');
INSERT INTO `videoinfo` VALUES ('604960', '洛城战警第一季 -第04集', null, 'haiwaiyy.com', 'C:\\Users\\Administrator\\Desktop\\Series\\img\\洛城战警第一季.jpg', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', null, '1', '2019-06-14 15:12:38', '2019-06-14 15:12:38', '256', '0', '2', '4', '1', null, '英语', '720p');
INSERT INTO `videoinfo` VALUES ('604961', '洛城战警第一季 -第03集', null, 'haiwaiyy.com', 'C:\\Users\\Administrator\\Desktop\\Series\\img\\洛城战警第一季.jpg', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', null, '1', '2019-06-14 15:12:38', '2019-06-14 15:12:38', '256', '0', '2', '3', '1', null, '英语', '720p');
INSERT INTO `videoinfo` VALUES ('604962', '洛城战警第一季 -第06集', null, 'haiwaiyy.com', 'C:\\Users\\Administrator\\Desktop\\Series\\img\\洛城战警第一季.jpg', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', null, '1', '2019-06-14 15:12:38', '2019-06-14 15:12:38', '256', '0', '2', '6', '1', null, '英语', '720p');
INSERT INTO `videoinfo` VALUES ('604963', '洛城战警第一季 -第05集', null, 'haiwaiyy.com', 'C:\\Users\\Administrator\\Desktop\\Series\\img\\洛城战警第一季.jpg', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', null, '1', '2019-06-14 15:12:38', '2019-06-14 15:12:38', '256', '0', '2', '5', '1', null, '英语', '720p');
INSERT INTO `videoinfo` VALUES ('604964', '洛城战警第一季 -第07集', null, 'haiwaiyy.com', 'C:\\Users\\Administrator\\Desktop\\Series\\img\\洛城战警第一季.jpg', 'C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv', null, '1', '2019-06-14 15:12:38', '2019-06-14 15:12:38', '256', '0', '2', '7', '1', null, '英语', '720p');

-- ----------------------------
-- Table structure for videotype
-- ----------------------------
DROP TABLE IF EXISTS `videotype`;
CREATE TABLE `videotype` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类型id',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `type` int(2) NOT NULL COMMENT '类型',
  `icon` varchar(255) DEFAULT NULL COMMENT 'url地址',
  `enable` tinyint(1) DEFAULT '1' COMMENT '是否可用',
  PRIMARY KEY (`id`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of videotype
-- ----------------------------
INSERT INTO `videotype` VALUES ('1', 'movies', '1', null, '1');
INSERT INTO `videotype` VALUES ('2', 'series', '2', null, '1');
INSERT INTO `videotype` VALUES ('3', '18+', '3', null, '0');
INSERT INTO `videotype` VALUES ('4', 'animes', '4', null, '1');
INSERT INTO `videotype` VALUES ('5', 'playback', '5', null, '1');

-- ----------------------------
-- Table structure for website
-- ----------------------------
DROP TABLE IF EXISTS `website`;
CREATE TABLE `website` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `weburl` text,
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  `parentid` int(11) DEFAULT '0',
  `type` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of website
-- ----------------------------
INSERT INTO `website` VALUES ('1', 'tube8.com', '0', 'https://www.tube8.com/categories.html', '2017-06-03 16:15:14', '2017-06-03 16:15:16', '0', '3');
INSERT INTO `website` VALUES ('2', 'youporn.com', '0', 'https://www.youporn.com/categories/', '2017-06-05 15:16:32', '2017-06-05 15:16:34', '0', '3');
INSERT INTO `website` VALUES ('3', 'assistirfilmesonline2.net', '1', 'http://afo2.net/', '2017-06-17 19:37:19', '2017-06-17 19:37:21', '2', '1');
INSERT INTO `website` VALUES ('4', 'megafilmesonline.net', '0', 'http://megafilmesonline.net/', '2017-09-18 15:39:17', '2017-09-18 15:39:19', '1', '1');
INSERT INTO `website` VALUES ('5', 'filmeseseriesonline.net', '0', 'http://filmeseseriesonline.net/', '2017-12-06 15:25:22', '2017-12-06 15:25:24', '1', '2');
INSERT INTO `website` VALUES ('6', 'megacinefilmes.net', '1', 'http://megacinefilmes.net/ultimos/page/1/', '2018-09-12 16:04:02', '2018-09-12 16:04:04', '2', '1');
INSERT INTO `website` VALUES ('7', 'thefilmestorrents.com', '1', 'https://www.thefilmestorrents.com/page/1/', '2018-10-13 11:28:48', '2018-10-13 11:28:57', '3', '1');
INSERT INTO `website` VALUES ('8', 'downloadlivre.net', '1', 'https://www.downloadlivre.net/category/bluray-1080p/', '2019-06-13 11:22:25', '2019-06-13 11:22:30', '2', '1');
INSERT INTO `website` VALUES ('9', 'filmesonlinehd1.net', '1', 'https://filmesonlinehd1.net', '2019-06-13 11:23:25', '2019-06-13 11:23:28', '2', '1');
INSERT INTO `website` VALUES ('10', 'mfilmeshd.com', '1', 'https://mfilmeshd.com/filmes/', '2019-06-13 11:24:52', '2019-06-13 11:24:56', '2', '1');
INSERT INTO `website` VALUES ('11', 'haiwaiyy.com', '1', 'https://www.haiwaiyy.com/', '2019-06-13 18:34:41', '2019-06-13 18:34:46', '2', '1');
