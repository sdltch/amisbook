-- 插入报关行

select * from sys_customs_broker where name ="陕西茂长通报关咨询服务有限公司";
INSERT INTO `sys_customs_broker` (
	`id`,
	`no`,
	`oper_cus_regcode`,
	`sccd`,
	`name`,
	`type`,
	`admin_name`,
	`client_no`,
	`ic_card_no`,
	`hd_model`,
	`created_date`,
	`modified_date`,
	`url`,
	`sys_name`
)
VALUES
	(
	'7823107e-7d90-4200-814a-a29d63ed9998',
		'610498000A',
		'610498000A',
		'91611101MA715KA815',
		'陕西茂长通报关咨询服务有限公司',
		'3',
		'SXMCT',
		'8930000098',
		'8930000052698',
		'0',
		'2020-04-10 17:22:19',
		'1970-01-01 00:00:00',
		NULL,
		NULL
	);

select * from sys_customs_broker WHERE id="7823107e-7d90-4200-814a-a29d63ed9998";

INSERT INTO `ami_customs_edge_dev`.`sys_user` (
`id`,
`login_name`,
`password`,
`name`,
`link`,
`status`,
`organization_id`,
`organization_name`,
`standard_organization_id`,
`standard_organization_name`,
`standard_role_id`,
`role_id`,
`role_name`,
`created_date`,
`modified_date`,
`post`,
`approve`,
`type`,
`customer_id`,
`customer_name`,
`mobile`,
`openid` 
)
VALUES
	(
	'1dc1a2ef-3429-4fdb-9361-dfef76bb9998',
	'SXMCT',
	'',
	'SXMCT',
	'123449998',
	NULL,
	'7823107e-7d90-4200-814a-a29d63ed9998',
	'SXMCT',
	'7823107e-7d90-4200-814a-a29d63ed9998',
	'SXMCT',
	'',
	'',
	'',
	'2020-08-22 10:45:54',
	'2020-08-22 10:45:54',
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
NULL 
	);

select * from sys_user WHERE organization_id="7823107e-7d90-4200-814a-a29d63ed9998";
select * from sys_user WHERE id="1dc1a2ef-3429-4fdb-9361-dfef76bb9998";

-- 7823107e-7d90-4200-814a-a29d63ed9999 组织
-- 初始化人员组织关系edge_dev    账号id、报关行id

INSERT INTO `sys_account_customs_broker`(`account_id`, `customs_broker_id`) VALUES 
('1dc1a2ef-3429-4fdb-9361-dfef76bb9998', '7823107e-7d90-4200-814a-a29d63ed9998');

select * from `sys_account_customs_broker` where account_id='1dc1a2ef-3429-4fdb-9361-dfef76bb9998';