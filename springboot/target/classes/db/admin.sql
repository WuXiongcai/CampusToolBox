CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `role` varchar(20) DEFAULT 'admin' COMMENT '角色',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态（0：禁用，1：启用）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='管理员表';

-- 插入默认管理员账号，密码为123456
INSERT INTO `admin` (`username`, `password`, `email`, `role`, `status`, `create_time`, `update_time`)
VALUES ('admin', 'e10adc3949ba59abbe56e057f20f883e', 'admin@example.com', 'admin', 1, NOW(), NOW()); 