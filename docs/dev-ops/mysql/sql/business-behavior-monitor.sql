
# 转储表 monitor_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `monitor_data`;

CREATE TABLE `monitor_data` (
                                `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                `monitor_id` varchar(8) NOT NULL COMMENT '监控ID',
                                `monitor_name` varchar(64) DEFAULT NULL COMMENT '监控名称',
                                `monitor_node_id` varchar(8) NOT NULL COMMENT '节点ID',
                                `system_name` varchar(64) NOT NULL COMMENT '系统名称',
                                `clazz_name` varchar(256) NOT NULL COMMENT '类的名称',
                                `method_name` varchar(128) NOT NULL COMMENT '方法名称',
                                `attribute_name` varchar(32) NOT NULL COMMENT '属性名称',
                                `attribute_field` varchar(8) NOT NULL COMMENT '属性字段',
                                `attribute_value` varchar(128) NOT NULL COMMENT '属性的值',
                                `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='监控数据';


# 转储表 monitor_data_map
# ------------------------------------------------------------

DROP TABLE IF EXISTS `monitor_data_map`;

CREATE TABLE `monitor_data_map` (
                                    `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
                                    `monitor_id` varchar(8) NOT NULL COMMENT '监控ID',
                                    `monitor_name` varchar(64) NOT NULL COMMENT '监控名称',
                                    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
                                    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
                                    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='监控数据地图配置';


INSERT INTO `monitor_data_map` (`id`, `monitor_id`, `monitor_name`, `create_time`, `update_time`)
VALUES
    (1,'129009','测试监控流程','2024-05-24 14:51:45','2024-05-24 14:51:45');


# 转储表 monitor_data_map_node
# ------------------------------------------------------------

DROP TABLE IF EXISTS `monitor_data_map_node`;

CREATE TABLE `monitor_data_map_node` (
                                         `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                         `monitor_id` varchar(8) NOT NULL COMMENT '监控ID',
                                         `monitor_node_id` varchar(8) NOT NULL COMMENT '节点ID',
                                         `monitor_node_name` varchar(32) NOT NULL COMMENT '节点名称',
                                         `gather_system_name` varchar(64) NOT NULL COMMENT '采集，系统名称',
                                         `gather_clazz_name` varchar(256) NOT NULL COMMENT '采集，类的名称',
                                         `gather_method_name` varchar(128) NOT NULL COMMENT '采集，方法名称',
                                         `loc` varchar(32) NOT NULL COMMENT '渲染节点坐标',
                                         `color` varchar(8) NOT NULL DEFAULT '#2ECC40' COMMENT '节点颜色',
                                         `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                         `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                         PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='监控数据地图节点配置';


INSERT INTO `monitor_data_map_node` (`id`, `monitor_id`, `monitor_node_id`, `monitor_node_name`, `gather_system_name`, `gather_clazz_name`, `gather_method_name`, `loc`, `color`, `create_time`, `update_time`)
VALUES
    (1,'129009','1001','用户下单','big-market','cn.bugstack.monitor.test.ApiTest','test_log_00','210 110','#2ECC40','2024-05-24 14:51:15','2024-06-09 18:03:07'),
    (2,'129009','1002','支付完成','big-market','cn.bugstack.monitor.test.ApiTest','test_log_01','210 290','#2ECC40','2024-05-28 14:12:42','2024-06-09 18:03:08'),
    (3,'129009','1003','发货完成','big-market','cn.bugstack.monitor.test.ApiTest','test_log_02','210 430','#2ECC40','2024-05-28 14:12:42','2024-06-09 18:03:09'),
    (4,'129009','1004','发货失败','big-market','cn.bugstack.monitor.test.ApiTest','test_log_03','430 440','#2ECC40','2024-05-28 14:12:42','2024-06-09 18:03:10');



# 转储表 monitor_data_map_node_field
# ------------------------------------------------------------

DROP TABLE IF EXISTS `monitor_data_map_node_field`;

CREATE TABLE `monitor_data_map_node_field` (
                                               `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                               `monitor_id` varchar(8) NOT NULL COMMENT '监控ID',
                                               `monitor_node_id` varchar(8) NOT NULL COMMENT '节点ID',
                                               `log_name` varchar(64) NOT NULL COMMENT '日志名称；执行抽奖开始 userId',
                                               `log_index` int(11) NOT NULL DEFAULT '0' COMMENT '解析顺序；第几个字段',
                                               `log_type` varchar(8) NOT NULL DEFAULT 'Object' COMMENT '字段类型；Object、String',
                                               `attribute_name` varchar(32) NOT NULL COMMENT '属性名称',
                                               `attribute_field` varchar(8) NOT NULL COMMENT '属性字段',
                                               `attribute_ognl` varchar(16) NOT NULL COMMENT '解析公式',
                                               `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                               `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                               PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='监控数据地图节点字段配置';


INSERT INTO `monitor_data_map_node_field` (`id`, `monitor_id`, `monitor_node_id`, `log_name`, `log_index`, `log_type`, `attribute_name`, `attribute_field`, `attribute_ognl`, `create_time`, `update_time`)
VALUES
    (1,'129009','1001','测试日志00',3,'Object','用户ID','userId','userId','2024-05-21 08:38:01','2024-06-29 12:00:28'),
    (2,'129009','1001','测试日志00',3,'Object','订单ID','orderId','orderId','2024-05-21 08:38:01','2024-06-29 12:03:28'),
    (3,'129009','1002','测试日志01',3,'Object','用户ID','userId','userId','2024-05-21 08:38:01','2024-06-29 12:03:31'),
    (4,'129009','1003','测试日志02',3,'Object','用户ID','userId','userId','2024-05-21 08:38:01','2024-06-29 12:03:33');



# 转储表 monitor_data_map_node_link
# ------------------------------------------------------------

DROP TABLE IF EXISTS `monitor_data_map_node_link`;

CREATE TABLE `monitor_data_map_node_link` (
                                              `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
                                              `monitor_id` varchar(8) NOT NULL COMMENT '监控ID',
                                              `from_monitor_node_id` varchar(8) NOT NULL COMMENT 'from 监控ID',
                                              `to_monitor_node_id` varchar(8) NOT NULL COMMENT 'to 监控ID',
                                              `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                              `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                              PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='监控数据地图节点链路配置';


INSERT INTO `monitor_data_map_node_link` (`id`, `monitor_id`, `from_monitor_node_id`, `to_monitor_node_id`, `create_time`, `update_time`)
VALUES
    (1,'129009','1001','1002','2024-05-28 14:14:24','2024-05-28 14:14:24'),
    (2,'129009','1002','1003','2024-05-28 14:14:24','2024-05-28 14:14:24'),
    (3,'129009','1002','1004','2024-05-28 14:14:24','2024-05-28 14:14:24');

