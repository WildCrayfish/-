--流失用户数
DROP TABLE IF EXISTS `ads_wastage_count`;
CREATE TABLE `ads_wastage_count`  (
	`dt` date NOT NULL,
    `wastage_count` bigint(255) NULL DEFAULT NULL,
    PRIMARY KEY (`dt`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;



--活跃设备数
DROP TABLE IF EXISTS `ads_uv_count`;
CREATE TABLE `ads_uv_count`  (
	`dt` date NOT NULL,
	`day_count` bigint(255) NULL DEFAULT NULL,
	`wk_count` bigint(255) NULL DEFAULT NULL,
	`mn_count` bigint(255) NULL DEFAULT NULL,
	`is_weekend` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`is_monthend` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	PRIMARY KEY (`dt`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;


--留存率
DROP TABLE IF EXISTS `ads_user_retention_day_rate`;
CREATE TABLE `ads_user_retention_day_rate`  (
	`stat_date` date NULL DEFAULT NULL,
	`create_date` varchar(255) NOT NULL,
	`retention_day` int(11) NOT NULL,
	`retention_count` bigint(255) NULL DEFAULT NULL,
	`new_mid_count` bigint(255) NULL DEFAULT NULL,
	`retention_ratio` double(255, 2) NULL DEFAULT NULL,
	PRIMARY KEY (`create_date`,`retention_day`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;


--漏斗分析
DROP TABLE IF EXISTS `ads_user_action_convert_day`;
CREATE TABLE `ads_user_action_convert_day`  (
	`dt` date NOT NULL,
	`home_count`  bigint(255) NULL DEFAULT NULL,
    `good_detail_count` bigint(255) NULL DEFAULT NULL,
    `home2good_detail_convert_ratio` double(255, 2) NULL DEFAULT NULL,
    `cart_count` bigint(255) NULL DEFAULT NULL,
    `good_detail2cart_convert_ratio` double(255, 2) NULL DEFAULT NULL,
    `order_count` bigint(255) NULL DEFAULT NULL,
    `cart2order_convert_ratio` double(255, 2) NULL DEFAULT NULL,
    `payment_amount` bigint(255) NULL DEFAULT NULL,
    `order2payment_convert_ratio` double(255, 2) NULL DEFAULT NULL,
	PRIMARY KEY (`dt`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;


--沉默用户数
DROP TABLE IF EXISTS `ads_silent_count`;
CREATE TABLE `ads_silent_count`  (
  	`dt` date NOT NULL,
	`silent_count` bigint(255) NULL DEFAULT NULL,
	PRIMARY KEY (`dt`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;


--品牌复购率
DROP TABLE IF EXISTS `ads_sale_tm_category1_stat_mn`;
CREATE TABLE `ads_sale_tm_category1_stat_mn`  (
	tm_id varchar(255) NOT NULL,
    category1_id varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    category1_name varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    buycount bigint(255) NULL DEFAULT NULL,
    buy_twice_last bigint(255) NULL DEFAULT NULL,
    buy_twice_last_ratio double(255, 2) NULL DEFAULT NULL,
    buy_3times_last bigint(255) NULL DEFAULT NULL,
    buy_3times_last_ratio double(255, 2) NULL DEFAULT NULL,
    stat_mn varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    stat_date varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`tm_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;



--商品个数信息
DROP TABLE IF EXISTS `ads_product_info`;
CREATE TABLE `ads_product_info`  (
	`dt` date NOT NULL,
	`sku_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
	`spu_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
	PRIMARY KEY (`dt`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;



--商品销量排名
DROP TABLE IF EXISTS `ads_product_sale_topN`;
CREATE TABLE `ads_product_sale_topN`  (
`dt` date NOT NULL,
	`sku_id` bigint(255) NULL DEFAULT NULL,
	`payment_amount` bigint(255) NULL DEFAULT NULL,
  PRIMARY KEY (`dt`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;


--商品退款率排名
DROP TABLE IF EXISTS `ads_product_refund_topN`;
CREATE TABLE `ads_product_refund_topN`  (
	`dt` date NOT NULL,
	`sku_id` bigint(255) NULL DEFAULT NULL,
	`refund_ratio` double(255, 2) NULL DEFAULT NULL,
	PRIMARY KEY (`dt`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;



--商品收藏排名
DROP TABLE IF EXISTS `ads_product_favor_topN`;
CREATE TABLE `ads_product_favor_topN`  (
	`dt` date NOT NULL,
    `sku_id` bigint(255) NULL DEFAULT NULL,
    `favor_count` bigint(255) NULL DEFAULT NULL,
  PRIMARY KEY (`dt`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;



--商品加入购物车排名
DROP TABLE IF EXISTS `ads_product_cart_topN`;
CREATE TABLE `ads_product_cart_topN`  (
	`dt` date NOT NULL,
	`sku_id` bigint(255) NULL DEFAULT NULL,
    `cart_count` bigint(255) NULL DEFAULT NULL,
  PRIMARY KEY (`dt`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;



--支付信息统计
DROP TABLE IF EXISTS `ads_payment_daycount`;
CREATE TABLE `ads_payment_daycount`  (
	`dt` date NOT NULL,
	order_count bigint(255) NULL DEFAULT NULL,
    order_amount bigint(255) NULL DEFAULT NULL,
    payment_user_count bigint(255) NULL DEFAULT NULL,
    payment_sku_count bigint(255) NULL DEFAULT NULL,
    payment_avg_time double(255, 2) NULL DEFAULT NULL,
	PRIMARY KEY (`dt`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;


--下单数目统计
DROP TABLE IF EXISTS `ads_order_daycount`;
CREATE TABLE `ads_order_daycount`  (
	`dt` date NOT NULL,
	order_count bigint(255) NULL DEFAULT NULL,
    order_amount bigint(255) NULL DEFAULT NULL,
    order_users bigint(255) NULL DEFAULT NULL,
  PRIMARY KEY (`dt`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;


--每日新增设备
DROP TABLE IF EXISTS `ads_new_mid_count`;
CREATE TABLE `ads_new_mid_count`  (
	`create_date` varchar(255) NOT NULL,
	`new_mid_count` bigint(255) NULL DEFAULT NULL, 
	PRIMARY KEY (`create_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;


--最近连续三周活跃用户数
DROP TABLE IF EXISTS `ads_continuity_wk_count`;
CREATE TABLE `ads_continuity_wk_count`  (
	`dt` date NOT NULL,
	`wk_dt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `continuity_count` bigint(255) NULL DEFAULT NULL,
	PRIMARY KEY (`dt`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;


--最近七天内连续三天活跃用户数
DROP TABLE IF EXISTS `ads_continuity_uv_count`;
CREATE TABLE `ads_continuity_uv_count`  (
	`dt` date NOT NULL,
	`wk_dt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `continuity_count` bigint(255) NULL DEFAULT NULL,
  PRIMARY KEY (`dt`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;


--本周回流用户数
DROP TABLE IF EXISTS `ads_back_count`;
CREATE TABLE `ads_back_count`  (
	`dt` date NOT NULL,
	`wk_dt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
	`wastage_count` bigint(255) NULL DEFAULT NULL,
	PRIMARY KEY (`dt`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;


--商品差评率
DROP TABLE IF EXISTS `ads_appraise_bad_topN`;
CREATE TABLE `ads_appraise_bad_topN`  (
	`dt` date NOT NULL,
	`sku_id` bigint(255) NULL DEFAULT NULL,
	`appraise_bad_ratio` double(255, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`dt`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;



--创建用户主题表
DROP TABLE IF EXISTS `ads_user_topic`;
CREATE TABLE `ads_user_topic`  (
  `dt` date NOT NULL,
  `day_users` bigint(255) NULL DEFAULT NULL,
  `day_new_users` bigint(255) NULL DEFAULT NULL,
  `day_new_payment_users` bigint(255) NULL DEFAULT NULL,
  `payment_users` bigint(255) NULL DEFAULT NULL,
  `users` bigint(255) NULL DEFAULT NULL,
  `day_users2users` double(255, 2) NULL DEFAULT NULL,
  `payment_users2users` double(255, 2) NULL DEFAULT NULL,
  `day_new_users2users` double(255, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`dt`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;


--地区主题信息
drop table if exists ads_area_topic;
create external table ads_area_topic(
    `dt` date NOT NULL,
    `id` bigint(255) NULL DEFAULT NULL,
    `province_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `area_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `iso_code` varchar(255) NOT NULL,
    `region_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `region_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `login_day_count` bigint(255) NULL DEFAULT NULL,
    `order_day_count` bigint(255) NULL DEFAULT NULL,
    `order_day_amount` double(255, 2) NULL DEFAULT NULL,
    `payment_day_count` bigint(255) NULL DEFAULT NULL,
    `payment_day_amount` double(255, 2) NULL DEFAULT NULL,
	PRIMARY KEY (`dt`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;