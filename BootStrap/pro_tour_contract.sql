SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for pro_tour_contract
-- ----------------------------
DROP TABLE IF EXISTS `pro_tour_contract`;
CREATE TABLE `pro_tour_contract` (
  `contract_id` char(32) NOT NULL COMMENT '合同id',
  `contract_name` varchar(50) NOT NULL COMMENT '合同名称',
  `contract_price` decimal(10,2) NOT NULL COMMENT '合同价格',
  `contract_discount_price` decimal(10,2) DEFAULT NULL COMMENT '合同折扣价',
  `contract_title` varchar(500) NOT NULL COMMENT '合同标题',
  `contract_cover` varchar(50) NOT NULL COMMENT '合同首页图',
  `contract_summary` text NOT NULL COMMENT '合同简介',
  `contract_type` tinyint(4) DEFAULT NULL COMMENT '合同类型',
  `full_name` varchar(50) NOT NULL COMMENT '游客姓名',
  `gender` tinyint(4) NOT NULL COMMENT '游客性别',
  `nationality` varchar(50) NOT NULL COMMENT '游客国籍',
  `adults` tinyint(4) NOT NULL COMMENT '成人数量',
  `children` tinyint(4) NOT NULL COMMENT '儿童数量',
  `hotel_type` tinyint(4) DEFAULT NULL COMMENT '住宿标准',
  `start_date` datetime NOT NULL COMMENT '开始时间',
  `tour_days` tinyint(4) NOT NULL COMMENT '旅行天数',
  `email` varchar(50) NOT NULL COMMENT '游客email',
  `mobile_number` varchar(20) DEFAULT NULL COMMENT '游客手机',
  `others` text,
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`contract_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pro_tour_contract
-- ----------------------------

-- ----------------------------
-- Table structure for pro_tour_contract_detail
-- ----------------------------
DROP TABLE IF EXISTS `pro_tour_contract_detail`;
CREATE TABLE `pro_tour_contract_detail` (
  `contract_detail_id` char(32) NOT NULL COMMENT '明细id',
  `contract_id` char(32) NOT NULL COMMENT '合同id',
  `scenic_code` char(32) NOT NULL COMMENT '景点id',
  `sort_in_group` int(11) DEFAULT NULL COMMENT '线路景点排序',
  `is_enable` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否启用（1为启用，0不启用）',
  `create_time` datetime NOT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`contract_detail_id`),
  KEY `fk_pro_travelling_contract` (`contract_id`),
  CONSTRAINT `fk_pro_travelling_contract` FOREIGN KEY (`contract_id`) REFERENCES `pro_tour_contract` (`contract_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pro_tour_contract_detail
-- ----------------------------

-- ----------------------------
-- Table structure for pro_tour_intention
-- ----------------------------
DROP TABLE IF EXISTS `pro_tour_intention`;
CREATE TABLE `pro_tour_intention` (
  `id` char(32) NOT NULL,
  `member_id` char(32) NOT NULL,
  `destination` varchar(50) NOT NULL COMMENT '目的地',
  `know_about` tinyint(4) DEFAULT NULL COMMENT '对目的地了解程度',
  `adults` tinyint(4) NOT NULL COMMENT '成年人个数',
  `children` tinyint(4) NOT NULL COMMENT '儿童个数',
  `start_date` datetime NOT NULL COMMENT '旅行开始时间',
  `tour_days` tinyint(4) NOT NULL COMMENT '旅行天数',
  `interest` tinyint(4) DEFAULT NULL COMMENT '感兴趣的',
  `hotel_type` tinyint(4) DEFAULT NULL COMMENT '住宿条件',
  `full_name` varchar(50) NOT NULL COMMENT '姓名',
  `gender` tinyint(4) NOT NULL COMMENT '性比',
  `nationality` varchar(50) NOT NULL COMMENT '国籍',
  `email` varchar(50) NOT NULL COMMENT '邮箱地址',
  `mobile_number` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `others` text COMMENT '其他说明',
  `type` tinyint(4) NOT NULL COMMENT '类型（是否有效）',
  `create_time` datetime NOT NULL COMMENT '订单创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '订单修改时间',
  PRIMARY KEY (`id`),
  KEY `fk_usr_member` (`member_id`),
  CONSTRAINT `fk_usr_member` FOREIGN KEY (`member_id`) REFERENCES `usr_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pro_tour_intention
-- ----------------------------

-- ----------------------------
-- Table structure for pro_tour_intention_detail
-- ----------------------------
DROP TABLE IF EXISTS `pro_tour_intention_detail`;
CREATE TABLE `pro_tour_intention_detail` (
  `id` char(32) NOT NULL,
  `intention_id` char(32) NOT NULL COMMENT '意向id',
  `product_code` char(32) NOT NULL COMMENT '产品id（可能是单独景点，也可能是标准线路）',
  `product_type` tinyint(4) NOT NULL,
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_time` datetime NOT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pro_travelling_intention` (`intention_id`),
  KEY `fk_pro_travelling_scenic` (`product_code`),
  CONSTRAINT `fk_pro_travelling_intention` FOREIGN KEY (`intention_id`) REFERENCES `pro_tour_intention` (`id`),
  CONSTRAINT `fk_pro_travelling_scenic` FOREIGN KEY (`product_code`) REFERENCES `pro_tour_scenic` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pro_tour_intention_detail
-- ----------------------------

-- ----------------------------
-- Table structure for pro_tour_order
-- ----------------------------
DROP TABLE IF EXISTS `pro_tour_order`;
CREATE TABLE `pro_tour_order` (
  `id` char(32) NOT NULL COMMENT '订单id',
  `member_id` char(32) NOT NULL COMMENT '用户id',
  `contract_id` char(32) NOT NULL COMMENT '产品id',
  `order_price` decimal(10,2) NOT NULL COMMENT '订单价格',
  `order_discount_price` decimal(10,2) DEFAULT NULL,
  `order_describe` varchar(500) NOT NULL COMMENT '订单描述',
  `order_type` tinyint(4) NOT NULL COMMENT '订单类型（付款是否成功）',
  `is_enable` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否启用（1启用，0不启用）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `fk_usr_irematch` (`member_id`),
  KEY `fk_travelling_product` (`contract_id`),
  CONSTRAINT `fk_travelling_product` FOREIGN KEY (`contract_id`) REFERENCES `pro_tour_route` (`id`),
  CONSTRAINT `fk_usr_irematch` FOREIGN KEY (`member_id`) REFERENCES `usr_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pro_tour_order
-- ----------------------------

-- ----------------------------
-- Table structure for pro_tour_route
-- ----------------------------
DROP TABLE IF EXISTS `pro_tour_route`;
CREATE TABLE `pro_tour_route` (
  `id` char(32) NOT NULL COMMENT '产品id',
  `route_name` varchar(50) NOT NULL COMMENT '产品名称',
  `route_price` decimal(10,2) NOT NULL,
  `route_discount_price` decimal(10,2) DEFAULT NULL,
  `route_title` varchar(100) NOT NULL COMMENT '产品标题',
  `route_cover` varchar(50) NOT NULL COMMENT '产品封面',
  `route_summary` text NOT NULL COMMENT '产品简介',
  `route_type` tinyint(4) NOT NULL COMMENT '产品类型',
  `route_sort` int(11) NOT NULL COMMENT '排序',
  `is_enable` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否启用（1启用，0不启用）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `product_name` (`route_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pro_tour_route
-- ----------------------------

-- ----------------------------
-- Table structure for pro_tour_route_detail
-- ----------------------------
DROP TABLE IF EXISTS `pro_tour_route_detail`;
CREATE TABLE `pro_tour_route_detail` (
  `id` char(32) NOT NULL COMMENT '产品id',
  `route_id` char(32) NOT NULL COMMENT '产品id',
  `scenic_code` char(32) NOT NULL COMMENT '景点code',
  `sort_in_group` int(11) DEFAULT NULL COMMENT '线路景点排序',
  `is_enable` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否启用（1为启用，0不启用）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `fk_pro_trave_scenic` (`scenic_code`) USING BTREE,
  KEY `fk_pro_trave_product` (`route_id`) USING BTREE,
  CONSTRAINT `fk_pro_trave_product` FOREIGN KEY (`route_id`) REFERENCES `pro_tour_route` (`id`),
  CONSTRAINT `fk_pro_trave_scenic` FOREIGN KEY (`scenic_code`) REFERENCES `pro_tour_scenic` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pro_tour_route_detail
-- ----------------------------

-- ----------------------------
-- Table structure for pro_tour_scenic
-- ----------------------------
DROP TABLE IF EXISTS `pro_tour_scenic`;
CREATE TABLE `pro_tour_scenic` (
  `id` char(32) NOT NULL COMMENT '景点id',
  `scenic_name` varchar(50) NOT NULL COMMENT '景点名称',
  `scenic_price` decimal(10,2) NOT NULL COMMENT '景点票价',
  `scenic_discount_price` decimal(10,2) DEFAULT NULL COMMENT '折扣价',
  `scenic_title` varchar(500) NOT NULL COMMENT '标题',
  `scenic_cover` varchar(50) NOT NULL COMMENT '景点封面图片',
  `scenic_summary` text NOT NULL COMMENT '景点简介',
  `scenic_imgs` varchar(1000) NOT NULL COMMENT '旅游展示图',
  `scenic_sort` int(11) DEFAULT '0' COMMENT '排序',
  `scenic_city` varchar(50) NOT NULL,
  `days` tinyint(11) NOT NULL DEFAULT '0' COMMENT '天数',
  `hotel` text COMMENT '住宿酒店',
  `meals` varchar(100) DEFAULT NULL COMMENT '餐饮',
  `transportation` varchar(300) DEFAULT NULL COMMENT '交通',
  `remarks` text NOT NULL,
  `sales_volume` int(11) NOT NULL DEFAULT '0' COMMENT '销售数量',
  `is_enable` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否启用（1启用，0不启用）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `scenic_city` (`scenic_city`),
  KEY `scenic_name` (`scenic_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pro_tour_scenic
-- ----------------------------
