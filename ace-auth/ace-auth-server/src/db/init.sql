/*
Navicat MySQL Data Transfer

Source Server         : localhost_mysql
Source Server Version : 50549
Source Host           : localhost:3306
Source Database       : ag_auth_v1

Target Server Type    : MYSQL
Target Server Version : 50549
File Encoding         : 65001

Date: 2019-06-29 14:35:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_client
-- ----------------------------
DROP TABLE IF EXISTS `auth_client`;
CREATE TABLE `auth_client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL COMMENT '服务编码',
  `secret` varchar(255) DEFAULT NULL COMMENT '服务密钥',
  `name` varchar(255) DEFAULT NULL COMMENT '服务名',
  `locked` char(1) DEFAULT NULL COMMENT '是否锁定',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `crt_time` datetime DEFAULT NULL COMMENT '创建时间',
  `crt_user` varchar(255) DEFAULT NULL COMMENT '创建人',
  `crt_name` varchar(255) DEFAULT NULL COMMENT '创建人姓名',
  `crt_host` varchar(255) DEFAULT NULL COMMENT '创建主机',
  `upd_time` datetime DEFAULT NULL COMMENT '更新时间',
  `upd_user` varchar(255) DEFAULT NULL COMMENT '更新人',
  `upd_name` varchar(255) DEFAULT NULL COMMENT '更新姓名',
  `upd_host` varchar(255) DEFAULT NULL COMMENT '更新主机',
  `attr1` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of auth_client
-- ----------------------------
INSERT INTO `auth_client` VALUES ('1', 'ace-gateway', 'gateway', 'ace-gateway', '0', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `auth_client` VALUES ('3', 'ace-admin', 'admin', 'ace-admin', '0', '', null, null, null, null, '2019-06-21 16:49:39', '', '', '', null);
INSERT INTO `auth_client` VALUES ('6', 'ace-auth', '123456', 'ace-auth', '0', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `auth_client` VALUES ('11', 'ace-config', 'fXHsssa2', 'ace-config', '0', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `auth_client` VALUES ('13', 'ace-template', 'bZf8yvj8', 'ace-template', '0', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `auth_client` VALUES ('14', 'ace-trace', 'wKTl6GGE', 'ace-trace', '0', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `auth_client` VALUES ('15', 'ace-monitor', 'eEQBUcnW', 'ace-monitor', '0', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `auth_client` VALUES ('16', 'ace-vod', 'vod', 'ace-vod', '0', null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for auth_client_service
-- ----------------------------
DROP TABLE IF EXISTS `auth_client_service`;
CREATE TABLE `auth_client_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `crt_time` datetime DEFAULT NULL,
  `crt_user` varchar(255) DEFAULT NULL,
  `crt_name` varchar(255) DEFAULT NULL,
  `crt_host` varchar(255) DEFAULT NULL,
  `attr1` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of auth_client_service
-- ----------------------------
INSERT INTO `auth_client_service` VALUES ('21', '4', '5', null, null, null, null, null, null);
INSERT INTO `auth_client_service` VALUES ('23', '3', '6', null, null, null, null, null, null);
INSERT INTO `auth_client_service` VALUES ('41', '3', '1', null, null, null, null, null, null);
INSERT INTO `auth_client_service` VALUES ('42', '6', '1', null, null, null, null, null, null);
