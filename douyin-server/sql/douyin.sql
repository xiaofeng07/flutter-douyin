/*
 Navicat Premium Data Transfer

 Source Server         : douyin
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Host           : localhost:3306
 Source Schema         : douyin

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 07/04/2023 15:43:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int NOT NULL COMMENT '评论id',
  `user_id` int NULL DEFAULT NULL COMMENT '评论者id',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '评论内容',
  `belong_id` int NULL DEFAULT NULL COMMENT '所属视频id',
  `reply_count` bigint NULL DEFAULT NULL COMMENT '回复数',
  `date` datetime NULL DEFAULT NULL COMMENT '评论id',
  `status` tinyint NULL DEFAULT NULL COMMENT '评论状态',
  `favorite_num` int NULL DEFAULT 0 COMMENT '评论点赞数',
  `no_favorite` tinyint(1) NULL DEFAULT 0 COMMENT '踩该评论，对该评论不敢兴趣',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply`  (
  `id` int NOT NULL COMMENT '回复id',
  `comment_id` int NULL DEFAULT NULL COMMENT '评论(父回复)id',
  `from_user_id` int NULL DEFAULT NULL COMMENT '回复者id',
  `to_user_id` int NULL DEFAULT NULL COMMENT '被回复者id',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '回复内容',
  `date` datetime NULL DEFAULT NULL COMMENT '回复日期',
  `status` tinyint NULL DEFAULT NULL COMMENT '回复状态',
  `favorite_num` int NULL DEFAULT 0 COMMENT '评论点赞数',
  `no_favorite` tinyint(1) NULL DEFAULT 0 COMMENT '踩该评论，对该评论不敢兴趣',
  PRIMARY KEY (`id`) USING BTREE,
  CONSTRAINT `comment_id` FOREIGN KEY (`id`) REFERENCES `comment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reply
-- ----------------------------

-- ----------------------------
-- Table structure for tb_video_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_video_info`;
CREATE TABLE `tb_video_info`  (
  `id` int NULL DEFAULT NULL,
	 `user_id` int NULL DEFAULT 0 COMMENT '作者id',
  `title` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `alias` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `picuser` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `picurl` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `playurl` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sec` int NULL DEFAULT NULL,
  `favorite_num` int NULL DEFAULT 0,
  `comment_num` int NULL DEFAULT 0,
  `collect_num` int NULL DEFAULT 0,
  `share_num` int NULL DEFAULT 0,
  `is_favorite` tinyint(1) NULL DEFAULT 0,
  `is_collected` tinyint(1) NULL DEFAULT 0
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_video_info
-- ----------------------------
INSERT INTO `tb_video_info` VALUES (52, 1,'点击报名报名完成✅', '唱将桃花小旺旺💕', 'https://vi1.6rooms.com/live/2021/08/06/13/1003v1628228888774577537.jpg', 'https://vi0.6rooms.com/live/2021/11/04/19/1032v1636023768777843271_l.jpg', 'https://minivideo.xiu123.cn/original/ee17c0546f2d4a83b9cca3c7adc076f5/1f7eebd-17cea9d8f78.mp4', 6, 15000, 2713, 2005, 2527, 0, 0);
INSERT INTO `tb_video_info` VALUES (192,1, '早安老铁们，，今天是', '二星恭贺窝窝荣升郡公', 'https://vi0.6rooms.com/live/2021/12/27/02/1003v1640542716141687289.jpg', 'https://vi1.6rooms.com/live/2021/12/24/10/1032v1640313278738098191_l.jpg', 'https://minivideo.xiu123.cn/original/aa7aee3644694464b435f0a04028ad3a/1a62556e-17dea478960.mp4', 12, 122000, 5038, 12000, 2203, 0, 0);
INSERT INTO `tb_video_info` VALUES (7, 1,'开心活着吧', '热舞倾城静静新年快乐', 'https://vi0.6rooms.com/live/2021/08/15/20/1003v1629031960152012725.jpg', 'https://vi2.6rooms.com/live/2021/12/26/11/1032v1640487774337565965_l.jpg', 'https://minivideo.xiu123.cn/original/fb3beffa2b214d149528e37adfc842da/4ec52e37-17df4b0dffb.mp4', 12, 4246, 232, 382, 537, 0, 0);
INSERT INTO `tb_video_info` VALUES (1355,1, '没有大哥好难熬呀要坚持不住了', '扬弟儿', 'https://vi2.6rooms.com/live/2022/08/18/04/1003v1660769490749839565.jpg', 'https://vi0.6rooms.com/live/2022/08/18/04/1032v1660769708650222824_l.jpg', 'https://minivideo.xiu123.cn/original/e035449a83fa4bfcb594fe1c86dd25cc/2652d269-182ad96a360.mp4', 8, 70000, 1665, 1767, 7621, 0, 0);
INSERT INTO `tb_video_info` VALUES (140, 1,'/飞吻/飞吻/飞吻', '四月❤用心把歌唱♪♫', 'https://vi2.6rooms.com/live/2021/11/11/03/1003v1636573646317280054.jpg', 'https://vi1.6rooms.com/live/2021/12/22/22/1032v1640182175403674310_l.jpg', 'https://minivideo.xiu123.cn/original/3f9d417f95544b9f9444a622820d805e/42e1f47a-17de279cb08.mp4', 30, 1668, 156, 28, 7, 0, 0);
INSERT INTO `tb_video_info` VALUES (664, 1,'求过任务', '红蔷薇︶有点可怜', 'https://vi3.6rooms.com/live/2021/11/30/22/1003v1638281986606745710.jpg', 'https://vi0.6rooms.com/live/2022/01/21/09/1032v1642727743002147393_l.jpg', 'https://minivideo.xiu123.cn/original/44ff9f0fa5af4b42ab8a14de66b1773f/35a8f8ad-17e7a34107c.mp4', 8, 2096, 450, 64, 72, 0, 0);
INSERT INTO `tb_video_info` VALUES (99, 1,'如果哪一天心动了，我', '✿周沫～', 'https://vi3.6rooms.com/live/2021/12/02/10/1003v1638412783777033614.jpg', 'https://vi3.6rooms.com/live/2021/12/13/07/1032v1639351563658363487_l.jpg', 'https://minivideo.xiu123.cn/original/bc712db610a34c8ea1664e7401609fd5/db93186-17db0f761ff.mp4', 8, 2512, 236, 61, 111, 0, 0);
INSERT INTO `tb_video_info` VALUES (983, 1,'感谢每个来到我身边的', '小雪糕♥7岁感恩你们', 'https://vi3.6rooms.com/live/2021/10/04/09/1003v1633309842786574309.jpg', 'https://vi0.6rooms.com/live/2022/04/18/16/1032v1650270371020686004_l.jpg', 'https://minivideo.xiu123.cn/original/ba4ebbbd6f6a4c2cad19a64791829bf8/2219d153-1803bc61609.mp4', 10, 6198, 403, 575, 290, 0, 0);
INSERT INTO `tb_video_info` VALUES (282, 1,'思嘉正常直播 嗨唱视频', '思嘉停播有缘见', 'https://vi0.6rooms.com/live/2021/07/27/14/1003v1627366889340653538.jpg', 'https://vi2.6rooms.com/live/2020/10/30/22/1032v1604068173765790373_l.jpg', 'https://minivideo.xiu123.cn/original/6e59b9d0f5c74d59be1f8ce40e9db44f/3dcd9842-17579e9c00d.mp4', 200, 6552, 503, 191, 1033, 0, 0);
INSERT INTO `tb_video_info` VALUES (976, 1,'你要坚定我 我才能发', '你的珍～👑', 'https://vi2.6rooms.com/live/2022/01/23/04/1003v1642883017395760003.jpg', 'https://vi1.6rooms.com/live/2022/04/14/02/1032v1649874276396017802_l.jpg', 'https://minivideo.xiu123.cn/original/6b65da56183d41ff836145fd4a699d4f/29f41b2d-180242b84ac.mp4', 9, 97000, 4369, 2284, 48000, 0, 0);

SET FOREIGN_KEY_CHECKS = 1;
