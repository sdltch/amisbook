select * from sys_account where id='1dc1a2ef-3429-4fdb-9361-dfef76bb9998'


-- 同步账号信息到基础库	  注意 ：`certified_mobile`,这个字段在开发存在，在v10不存在，
-- 有certified_mobile字段
-- INSERT INTO sys_account (
-- 	`id`,
-- 	`code`,
-- 	`name`,
-- 	`global_name`,
-- 	`display_name`,
-- 	`pinyin`,
-- 	`login_name`,
-- 	`password`,
-- 	`password_salt`,
-- 	`password_changed_date`,
-- 	`identity_card`,
-- 	`type`,
-- 	`certified_mobile`,
-- 	`certified_telephone`,
-- 	`certified_email`,
-- 	`certified_avatar`,
-- 	`enable_email`,
-- 	`locking`,
-- 	`order_id`,
-- 	`status`,
-- 	`remark`,
-- 	`ip`,
-- 	`login_date`,
-- 	`distinguished_name`,
-- 	`modified_date`,
-- 	`created_date`
-- )
-- VALUES
-- 	(
-- 		'1dc1a2ef-3429-4fdb-9361-dfef76bb9999',
-- 		'',
-- 		'XINOU',
-- 		'XINOU',
-- 		'XINOU',
-- 		'',
-- 		'XINOU',
-- 		'8c59096ed683fc994875f62680133485ed278edc',
-- 		'955095',
-- 		'1970-01-01 00:00:00',
-- 		'',
-- 		'8',
-- 		NULL,
-- 		'',
-- 		'',
-- 		'',
-- 		'0',
-- 		'1',
-- 		'',
-- 		'1',
-- 		'',
-- 		'106.84.196.83',
-- 		'2020-08-21 22:49:41',
-- 		'CN=%1$s,OU=%2$s%3$s',
-- 		'2020-02-20 10:49:44',
-- 		'2020-02-15 15:14:22'
-- 	);

-- 无certified_mobile字段
INSERT INTO `sys_account` (
	`id`,
	`code`,
	`name`,
	`global_name`,
	`display_name`,
	`pinyin`,
	`login_name`,
	`password`,
	`password_salt`,
	`password_changed_date`,
	`identity_card`,
	`type`,
	`certified_telephone`,
	`certified_email`,
	`certified_avatar`,
	`enable_email`,
	`locking`,
	`order_id`,
	`status`,
	`remark`,
	`ip`,
	`login_date`,
	`distinguished_name`,
	`modified_date`,
	`created_date`
)
VALUES
	(
		'1dc1a2ef-3429-4fdb-9361-dfef76bb9998',
		'',
		'SXMCT',
		'SXMCT',
		'SXMCT',
		'',
		'SXMCT',
		'8c59096ed683fc994875f62680133485ed278edc',
		'405609',
		'1970-01-01 00:00:00',
		'',
		'8',
		'',
		'',
		'',
		'0',
		'1',
		'',
		'1',
		'',
		'58.211.61.82',
		'2020-02-21 15:25:55',
		'CN=%1$s,OU=%2$s%3$s',
		'2020-02-17 11:57:29',
		'2020-02-14 09:59:08'
	);



-- 同步账号信息到基础库 查询
select * from sys_account where id='1dc1a2ef-3429-4fdb-9361-dfef76bb9998';

select * from sys_account

-- 初始化组织id 报关行id  ；parent_id 



INSERT INTO `sys_organization_unit` (
	`id`,
	`parent_id`,
	`code`,
	`name`,
	`global_name`,
	`full_name`,
	`pinyin`,
	`type`,
	`level`,
	`chief_role_id`,
	`standard_organization_unit_id`,
	`standard_organization_id`,
	`enable_email`,
	`effect_scope`,
	`tree_view_scope`,
	`locking`,
	`order_id`,
	`status`,
	`remark`,
	`full_path`,
	`distinguished_name`,
	`modified_date`,
	`created_date`
)
VALUES
	(
		'7823107e-7d90-4200-814a-a29d63ed9998',
		'00000000-0000-0000-0000-000000000001',
		'',
		'陕西茂长通报关咨询服务有限公司',
		'陕西茂长通报关咨询服务有限公司',
		'陕西茂长通报关咨询服务有限公司',
		'',
		0,
		0,
		'',
		'7823107e-7d90-4200-814a-a29d63ed9998',
		NULL,
		0,
		0,
		NULL,
		1,
		'1',
		1,
		'新建企业同步',
		'',
		'',
		'2020-04-01 14:26:44',
		'2020-02-15 15:14:22'
	);


-- 查询
select * from sys_organization_unit where id='7823107e-7d90-4200-814a-a29d63ed9999'

-- 7823107e-7d90-4200-814a-a29d63ed9999 组织
-- 初始化人员组织关系edge_dev    账号id、报关行id
-- 这个是edge库，要在得个库执行
INSERT INTO `sys_account_customs_broker`(`account_iddd`, `customs_broker_id`) VALUES 
('1dc1a2ef-3429-4fdb-9361-dfef76bb9998', '7823107e-7d90-4200-814a-a29d63ed9998');


select * `sys_account_customs_broker` where account_id='1dc1a2ef-3429-4fdb-9361-dfef76bb9998';

-- 角色权限表organization_unit_id=报关行id


INSERT INTO `sys_role` (
	`id`,
 	`code`,
	`name`,
  `global_name`,
	`pinyin`,
 	`type`,
	`parent_id`,
	`standard_role_id`,
 	`organization_unit_id`,
 	`general_role_id`,
 	`enable_email`,
 	`effect_scope`,
	`locking`,
 	`order_id`,
 	`status`,
 	`remark`,
 	`full_path`,
 	`distinguished_name`,
	`modified_date`,
 	`created_date`
)
 VALUES
 	(
		'0eb0acf8-b787-4ed1-8140-9078e9ad9998',
 		'10000998',
 		'系统管理员',
 		NULL,
 		NULL,
 		3,
 		'00000000-0000-0000-0000-000000000000',
 		NULL,
		'7823107e-7d90-4200-814a-a29d63ed9998',
 		NULL,
 		0,
		0,
 		1,
		NULL,
 		1,
 		'',
 		'组织结构\陕西茂长通报关咨询服务有限公司\系统管理员',
 		'cn=系统管理员,ou=陕西茂长通报关咨询服务有限公司,ou=Organizationals,dc=x3platform,dc=com',
		'2020-06-08 16:04:47',
 		'2020-02-15 15:17:16'
 	);
 
-- 
select * from sys_role where organization_unit_id='7823107e-7d90-4200-814a-a29d63ed9998'



-- -- 配置角色用户id

INSERT INTO `sys_account_role` (`account_id`, `role_id`, `is_default`, `begin_date`, `end_date`) VALUES 
('1dc1a2ef-3429-4fdb-9361-dfef76bb9998', '0eb0acf8-b787-4ed1-8140-9078e9ad9998', '\0', '2020-02-13 23:10:54', '9999-12-31 23:59:59');

select * from sys_account_role where account_id = "1dc1a2ef-3429-4fdb-9361-dfef76bb9998";

-- 初始化菜单权限 7823107e-7d90-4200-814a-a29d63ed9999    实际需求进行配置  这个语句会报错


--   authorization_object_id：0866c90eb1854864a92bd812b97054a2 已这个id为模板(v2);   authority_id：分配的id
insert into application_menu_scope (entity_id,entity_class_name,authority_id,authorization_object_type,authorization_object_id)
select entity_id,entity_class_name,authority_id,authorization_object_type,'1dc1a2ef-3429-4fdb-9361-dfef76bb9998' as authorization_object_id from application_menu_scope 
where authorization_object_id='0866c90eb1854864a92bd812b97054a2';

select * from application_menu_scope where authorization_object_id='1dc1a2ef-3429-4fdb-9361-dfef76bb9998';

select * from application_menu
-- 初始化按钮权限 authorization_object_id：0866c90eb1854864a92bd812b97054a2 已这个id为模板(v2);   authority_id：分配的id
insert into application_feature_scope (entity_id,entity_class_name,authority_id,authorization_object_type,authorization_object_id)
select entity_id,entity_class_name,authority_id,authorization_object_type,'1dc1a2ef-3429-4fdb-9361-dfef76bb9998' as authorization_object_id from application_feature_scope 
where authorization_object_id='0866c90eb1854864a92bd812b97054a2';



select * from application_feature_scope where authorization_object_id = '1dc1a2ef-3429-4fdb-9361-dfef76bb9998';

-- 初始化按钮权限

INSERT INTO `application_feature_scope` (`entity_id`, `entity_class_name`, `authority_id`, `authorization_object_type`, `authorization_object_id`) VALUES 
('00000000-0000-0000-0002-010000000005', 'com.x3platform.apps.models.ApplicationFeature', '2-0001', 'Role', '1dc1a2ef-3429-4fdb-9361-dfef76bb9998');


select * from application_feature_scope where authorization_object_id="1dc1a2ef-3429-4fdb-9361-dfef76bb9998";

-- 业务库设置组织


INSERT INTO `ami_customs_edge_dev`.`sys_account_customs_broker` (`account_id`, `customs_broker_id`) VALUES 
('1dc1a2ef-3429-4fdb-9361-dfef76bb9998', '7823107e-7d90-4200-814a-a29d63ed9998');

select * from ami_customs_edge_dev.sys_account_customs_broker where customs_broker_id ="7823107e-7d90-4200-814a-a29d63ed9998";


-- 基础库设置组织 


INSERT INTO `sys_account_organization_unit` (`account_id`, `organization_unit_id`, `is_default`, `begin_date`, `end_date`) VALUES 
('1dc1a2ef-3429-4fdb-9361-dfef76bb9998', '7823107e-7d90-4200-814a-a29d63ed9998', '\0', '2019-11-09 16:36:28', NULL);

select * from ami_customs_base_dev.sys_account_organization_unit where organization_unit_id="7823107e-7d90-4200-814a-a29d63ed9998";

-- mq

INSERT INTO `ami_customs_edge_dev`.`sys_customs_mq` (`id`, `send_address`, `send_virhost`, `send_port`, `send_username`, `send_password`, `send_quene`, `recv_adress`, `recv_virhost`, `recv_port`, `recv_username`, `recv_password`, `recv_quene`, `worker_id`, `exchange`) VALUES 
('4F8EE81D23CC4CF28B58512DDBB998', 'rabbit.amiintellect.com', '/', '5672', 'rabbitadmin', 'rabbit#6f4b83a6', 'Q_SendZ', 'rabbit.amiintellect.com', '/', '5672', 'rabbitadmin', 'rabbit#6f4b83a6', 'Q_RecvZ', '7823107e-7d90-4200-814a-a29d63ed9998', NULL);

select * from `ami_customs_edge_dev`.`sys_customs_mq` where worker_id="7823107e-7d90-4200-814a-a29d63ed9998"

-- 配置报文路径

INSERT INTO `ami_customs_edge_dev`.`sys_customs_worker_path` (`id`, `worker_id`, `path_type`, `fail_box`, `in_box`, `send_box`, `out_box`, `temp_box`) VALUES 
('04533449b7a439da78e26455f61e998', '7823107e-7d90-4200-814a-a29d63ed9998', 'EML', 'D:\\singlewindow\\ImpPath\\Npts\\FailBox', 'D:\\singlewindow\\ImpPath\\Npts\\InBox', 'D:\\singlewindow\\ImpPath\\Npts\\SentBox', 'D:\\singlewindow\\ImpPath\\Npts\\OutBox', 'D:\\singlewindow\\ImpPath\\Npts\\TempBox');


select * from `ami_customs_edge_dev`.`sys_customs_worker_path` where worker_id="7823107e-7d90-4200-814a-a29d63ed9998"


