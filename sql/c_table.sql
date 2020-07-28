CREATE PROCEDURE create_table_every_mon()
BEGIN
DECLARE `@dataTime` VARCHAR(125);
DECLARE `@sqlstr` VARCHAR(2560);
SET `@dataTime` = DATE_FORMAT(DATE_ADD(NOW(), INTERVAL 1 MONTH),'%Y%m');
SET @sqlstr = CONCAT("CREATE TABLE IF NOT EXISTS sys_asset_log_",`@dataTime`,"(
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `log_uid` varchar(22) NOT NULL COMMENT '管理者ID',
  `log_uname` varchar(60) NOT NULL COMMENT '管理者名称',
  `log_act_id` tinyint(3) unsigned NOT NULL COMMENT '动作ID',
  `log_obj_id` tinyint(3) unsigned NOT NULL COMMENT '对象ID',
  `log_sname` varchar(255) NOT NULL DEFAULT '' COMMENT '源名称',
  `log_sid` varchar(22) NOT NULL COMMENT '目标ID',
  `log_time` int(10) unsigned NOT NULL COMMENT '添加时间',
  `log_ip` varchar(15) NOT NULL COMMENT '添加IP',
  PRIMARY KEY (`log_id`),
  KEY `index_1` (`log_sid`),
  KEY `index_2` (`log_sname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员操作日志';");
PREPARE stmt FROM @sqlstr;
EXECUTE stmt;
END;