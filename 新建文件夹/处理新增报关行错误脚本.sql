select * from sys_customs_broker order by created_date desc ; -- BJ-DHL 
select * from sys_user where login_name = 'BJ-DHL';-- id = 533e56ad-477c-4799-9a77-dd388fa60f37

select * from ami_customs_base_v2.sys_account where id='533e56ad-477c-4799-9a77-dd388fa60f37'

-- 同步账号信息到基础库 
insert into ami_customs_base_v2.sys_account(id,name,global_name,display_name,login_name,`password`,
type,enable_email,locking,`status`,created_date)
select id,name, name as global_name, name as display_name,login_name,`password`,8 as type , 0 as enable_email,1 as locking ,`status` ,created_date  from sys_user
where id='533e56ad-477c-4799-9a77-dd388fa60f37'

-- 初始化组织
select * from ami_customs_base_v2.sys_organization_unit where id='93182838-1b91-497c-b109-6836a463b5fd' order by created_date desc 

-- 93182838-1b91-497c-b109-6836a463b5fd 组织
-- 初始化人员组织关系
select * from sys_account_customs_broker where account_id='533e56ad-477c-4799-9a77-dd388fa60f37';
select * from ami_customs_base_v2.sys_role order by created_date desc  where organization_unit_id='93182838-1b91-497c-b109-6836a463b5fd'

-- 创建角色 
select * from ami_customs_base_v2.sys_role where id='0866c90eb1854864a92bd812b97054a2'

-- 初始化系统管理员角色
insert into ami_customs_base_v2.sys_role (id,code,name,global_name,pinyin,type,parent_id,
standard_role_id,organization_unit_id,enable_email,effect_scope,locking,status,created_date,modified_date)
select UUID() as id ,code,name,global_name,pinyin,type,parent_id,
standard_role_id,'93182838-1b91-497c-b109-6836a463b5fd' as organization_unit_id,enable_email, effect_scope,locking,status,created_date,modified_date
from ami_customs_base_v2.sys_role where id='0866c90eb1854864a92bd812b97054a2' 

-- 查询对应角色 
select * from ami_customs_base_v2.sys_role where organization_unit_id = '93182838-1b91-497c-b109-6836a463b5fd'

-- 配置人员角色控制
insert into ami_customs_base_v2.sys_account_role (account_id,role_id,is_default,begin_date,end_date)
VALUES ('533e56ad-477c-4799-9a77-dd388fa60f37','59cda37c-c1a9-11ea-8c47-0492264d4847',0,NOW(),date('9999-12-31 23:59:59'))

-- 59cda37c-c1a9-11ea-8c47-0492264d4847 

-- 初始化菜单权限 
insert into ami_customs_base_v2.application_menu_scope (entity_id,entity_class_name,authority_id,authorization_object_type,authorization_object_id)
select entity_id,entity_class_name,authority_id,authorization_object_type,'59cda37c-c1a9-11ea-8c47-0492264d4847' as authorization_object_id from ami_customs_base_v2.application_menu_scope 
where authorization_object_id='0866c90eb1854864a92bd812b97054a2'


-- 初始化按钮权限

insert into ami_customs_base_v2.application_feature_scope (entity_id,entity_class_name,authority_id,authorization_object_type,authorization_object_id)
select entity_id,entity_class_name,authority_id,authorization_object_type,'59cda37c-c1a9-11ea-8c47-0492264d4847' as authorization_object_id from ami_customs_base_v2.application_feature_scope 
where authorization_object_id='0866c90eb1854864a92bd812b97054a2'

-- 业务库设置组织
select * from sys_account_customs_broker
insert into sys_account_organization (account_id,organization_unit_id, status)
select *,1 from sys_account_customs_broker where account_id='533e56ad-477c-4799-9a77-dd388fa60f37'
-- 基础库设置组织 
select * from ami_customs_base_v2.sys_account_organization_unit 
insert into ami_customs_base_v2.sys_account_organization_unit 
select *,1,NOW(),date('9999-12-31 23:59:59') from sys_account_customs_broker where account_id='533e56ad-477c-4799-9a77-dd388fa60f37'

-- 设置 MQ信息 -- 修改队列 
select oper_cus_regcode from sys_customs_broker where id='93182838-1b91-497c-b109-6836a463b5fd' 
select * from sys_customs_mq where worker_id='93182838-1b91-497c-b109-6836a463b5fd'

-- 
select * from sys_customs_mq

update sys_customs_mq 
set send_quene = (select CONCAT('10000001_',oper_cus_regcode,'_out')  from sys_customs_broker where id='93182838-1b91-497c-b109-6836a463b5fd' ),
recv_quene = (select CONCAT('10000001_',oper_cus_regcode,'_in')  from sys_customs_broker where id='93182838-1b91-497c-b109-6836a463b5fd' ) 
where worker_id='93182838-1b91-497c-b109-6836a463b5fd'


select uuid() as  id from sys_customs_worker_path where worker_id='bdbe4467c68a46f88c8beb902ecf9ba3'


select CONCAT('10000001_',oper_cus_regcode,'_in') from sys_customs_broker where id='93182838-1b91-497c-b109-6836a463b5fd'

-- 配置报文路径 
insert into sys_customs_worker_path 
select uuid() as id,'93182838-1b91-497c-b109-6836a463b5fd' as worker_id,path_type,fail_box,in_box,send_box,out_box,temp_box
from sys_customs_worker_path where worker_id='bdbe4467c68a46f88c8beb902ecf9ba3'

select * from sys_customs_worker_path where worker_id='93182838-1b91-497c-b109-6836a463b5fd'



