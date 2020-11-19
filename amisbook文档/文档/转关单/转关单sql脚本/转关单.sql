drop table if exists trn_make_manager;

/*==============================================================*/
/* Table: trn_make_manager                                      */
/*==============================================================*/
create table trn_make_manager 
(
   id                   varchar(40)                    not null
   	 comment '主键ID',
   dec_id               varchar(52)                    not null
   	 comment '转关单流水（用于列表显示）',
   company_name         varchar(40)                    not null
   	 comment '企业名称',
   percent              varchar(25)                    null
   	 comment '百分比',
   discern_count        varchar(25)                    null
   	 comment '识别数量(NO USE)',
   discern_time         date                           null
   	 comment '制单完成时间(非100%)',
   path                 varchar(255)                   null
   	 comment '图片路径',
   unfilled             varchar(25)                    null
   	 comment '未填数量(NO USE)',
   dif                  varchar(25)                    null
   	 comment '差异(NO USE)',
   rule                 varchar(25)                    null
   	 comment '规则(NO USE)',
   state                varchar(1)                     null
   	 comment '制单状态 0删除 1识别失败 2python识别 3制单中(填制100%) 4待审核 5已审核 6已驳回 7已申报 8已暂存(失败) 9已暂存(成功) 10已回执',
   customs_broker_id    varchar(36)                    null
   	 comment '报关行ID',
   login_user           varchar(64)                    null
   	 comment '上传者',
   begin_time           date                           null
   	 comment '识别时间',
   fail_reason          varchar(64)                    null
   	 comment '驳回原因',
   opr_time             date                           null
   	 comment '操作时间（审核）',
   opr_user             varchar(64)                    null
   	 comment '审核员',
   app_order_id         varchar(64)                    null
   	 comment '申报成功单号',
   temp_order_id        varchar(64)                    null
   	 comment '暂存单号',
   discern_complete_time date                           null
   	 comment '制单完成时间（100%）',
   in_out_type          varchar(1)                     null
   	 comment '进出口类型',
   project_id           varchar(36)                    null
   	 comment '小组id',
   entrust_company_id   varchar(36)                    null
   	 comment '委托单位ID',
   logger_record_path   varchar(1024)                  null
   	 comment '日志地址',
   source               varchar(1)                     null
   	 comment '来源 1制单 2新建 3复制',
   batch_file_name      varchar(500)                   null
   	 comment '批量上传文件名称',
   agent                varchar(128)                   null
   	 comment '代理商',
   template_id          varchar(36)                    null
   	 comment '所用模板ID',
   provider             varchar(255)                   null
   	 comment '供应商',
   dclcus_typecd        varchar(25)                    null
   	 comment '报关类型代码:1.关联报关2.对应报关；
            当报关标志为“1.报关”时，企业可选择“关联报关单”/“对应报关单”；
            当报关标志填写为“2.非报关”时，报关标志填写为“2.非报关”该项不可填。',
   created_date         datetime                       null
   	 comment '创建时间',
   modified_date        datetime                       null
   	 comment '修改时间',
   created_by           varchar(40)                    null
   	 comment '创建人',
   modified_by          varchar(40)                    null
   	 comment '操作人',
   constraint PK_TRN_MAKE_MANAGER primary key clustered (id)
);

alter table trn_make_manager comment '转关单识别表头列表';

drop table if exists trn_head;

/*==============================================================*/
/* Table: trn_head                                              */
/*==============================================================*/
create table trn_head 
(
   id                   varchar(40)                    not null
   	 comment '主键id',
   biz_id               varchar(52)                    not null
   	 comment '系统流水号',
   trans_preId          varchar(18)                    null
   	 comment '外部网统一编号,首次申报不填，退单后重新申报是填写',
   pre_no               varchar(13)                    null
   	 comment '转关预录入号,广东模式填写，非广东模式为空；
            录入13位载货清单号',
   valid_time           date                           null
   	 comment '预计运抵指运地时间',
   appl_name            varchar(60)                    null
   	 comment '申报单位',
   appl_code            varchar(10)                    not null
   	 comment '转关申报单位代码',
   contractor_code      varchar(10)                    null
   	 comment '转关承运单位代码，当运输方式为2-江海运输、4-汽车运输、A-全部运输方式、W-物流中心、X-物流园区、Y-保税港区时，填写承运转关货物运输工具在海关注册的10位编号。其他运输方式为空。',
   contractor           varchar(60)                    null
   	 comment '承运单位名称',
   traf_way             varchar(1)                     null
   	 comment '境内运输方式',
   customs_no           varchar(10)                    null
   	 comment '境内运输工具编号，在海关注册的运输工具名称，与运输工具海关编号对应。',
   trans_name           varchar(32)                    null
   	 comment '境内运输工具名称，当运输方式为2-江海运输、4-汽车运输、A-全部运输方式、W-物流中心、X-物流园区、Y-保税港区时，填写运输工具的航次编号。其他运输方式为空。',
   native_voyage_no     varchar(32)                    null
   	 comment '境内运输工具航次，进出口货物的提单号或运单号，无实际进出境的货物不填。',
   conta_empty_count    decimal(14,0)                  null
   	 comment '集装箱空箱数，用户录入空的“自然箱”数。无空箱填0。',
   input_opId           varchar(13)                    not null
   	 comment '录入员',
   input_time           datetime                       not null
   	 comment '录入时间',
   trn_mode             varchar(2)                     not null
   	 comment '转关类型，22-直转 33-批量中转 66-快件 77-退运 88-过境 99-沿海内支 YY-免税转展品 ZZ-其他',
   goods_note           varchar(255)                   null
   	 comment '备注',
   i_e_flag             varchar(1)                     not null
   	 comment '进出口标志，I：进口、E：出口',
   recv_port            varchar(4)                     not null
   	 comment '进出口岸，关区代码表',
   send_port            varchar(4)                     not null
   	 comment '申报口岸，关区代码表',
   e_seal_flag          varchar(1)                     not null
   	 comment '电子关锁启用标志 ，Y：启用电子关锁
            N：不启用电子关锁',
   cop_code             varchar(18)                    not null
   	 comment '操作企业组织机构代码',
   client_id            varchar(18)                    not null
   	 comment '客户端ID',
   conta_count          decimal(14,0)                  not null
   	 comment '集装箱总数',
   contaIni_count       decimal(14,0)                  not null
   	 comment '集装箱标箱数',
   mft_goods_piece      decimal(14,0)                  not null
   	 comment '总件数',
   mft_gross_weight     decimal(14,0)                  not null
   	 comment '总重量',
   trn_type             varchar(1)                     null
   	 comment '转关单类型，1代表无纸申报，0或空为普通有纸申报',
   appl_code_scc        varchar(18)                    not null
   	 comment '统一社会信用代码',
   status               varchar(1)                     null
   	 comment '1是删除 0是正常状态',
   created_date         datetime                       null
   	 comment '创建时间',
   modified_date        datetime                       null
   	 comment '修改时间',
   created_by           varchar(40)                    null
   	 comment '创建人',
   modified_by          varchar(40)                    null
   	 comment '操作人',
   constraint PK_TRN_HEAD primary key clustered (id)
);

alter table trn_head comment '转关单表头';

drop table if exists trn_bill_lists;

/*==============================================================*/
/* Table: trn_bill_lists                                        */
/*==============================================================*/
create table trn_bill_lists 
(
   id                   varchar(40)                    not null
   	 comment '主键id',
   biz_id               varchar(52)                    not null
   	 comment '系统流水号',
   record_number        varchar(3)                     not null
   	 comment '提运单序号，提运单表体编号，按自然数排列',
   traf_mode            varchar(1)                     null
   	 comment '进出境运输方式 ，运输方式代码表',
   shipId               varchar(15)                    null
   	 comment '运输工具编号',
   ship_name_en         varchar(19)                    null
   	 comment '运输工具英文名称',
   voyage_no            varchar(12)                    null
   	 comment '船次/车次/班次',
   bill_no              varchar(32)                    null
   	 comment '提单号',
   i_e_date             date                           null
   	 comment '进出境日期',
   entry_no             varchar(18)                    null
   	 comment '报关单号',
   pack_no              decimal(9,0)                   null
   	 comment '件数',
   gross_wt             decimal(13,4)                  null
   	 comment '重量',
   conta_c              decimal(9,0)                   null
   	 comment '集装箱数',
   owner_name           varchar(70)                    null
   	 comment '收货人',
   note                 varchar(255)                   null
   	 comment '备注',
   status               varchar(1)                     null
   	 comment '状态，1是删除 0是正常状态',
   created_date         datetime                       null
   	 comment '创建时间',
   modified_date        datetime                       null
   	 comment '修改时间',
   created_by           varchar(30)                    null
   	 comment '创建人',
   modified_by          varchar(30)                    null
   	 comment '操作人',
   constraint PK_TRN_BILL_LISTS primary key clustered (id)
);

alter table trn_bill_lists comment '报关单提单信息（表体）';


drop table if exists trn_goods;

/*==============================================================*/
/* Table: trn_goods                                             */
/*==============================================================*/
create table trn_goods 
(
   id                   varchar(40)                    not null
   	 comment '主键id',
   biz_id               varchar(52)                    not null
   	 comment '系统流水号',
   record_number        varchar(3)                     null
   	 comment '提单单序号',
   g_no                 decimal(9,0)                   null
   	 comment '商品序号，商品表体编号，按自然数排列',
   code_ts              varchar(10)                    null
   	 comment '商品编码，商品综合分类表',
   g_name               varchar(50)                    null
   	 comment '商品名称及规格',
   pack_type            varchar(1)                     null
   	 comment '包装，包装代码表',
   goods_piece          decimal(9,0)                   null
   	 comment '件数',
   goods_amount         decimal(19,4)                  null
   	 comment '数量',
   goods_unit           varchar(3)                     null
   	 comment '单位，计量单位代码表',
   goods_weight         decimal(13,4)                  null
   	 comment '重量',
   goods_price          decimal(13,4)                  null
   	 comment '价格',
   goods_curr1       varchar(3)                     null
   	 comment '币制，币值代码表',
   status               varchar(1)                     null
   	 comment '状态，1是删除 0是正常状态',
   created_date         datetime                       null
   	 comment '创建时间',
   modified_date        datetime                       null
   	 comment '修改时间',
   created_by           varchar(40)                    null
   	 comment '创建人',
   modified_by          varchar(40)                    null
   	 comment '操作人',
   constraint PK_TRN_GOODS primary key clustered (id)
);

alter table trn_goods comment '转关商品信息';

drop table if exists trn_containers;

/*==============================================================*/
/* Table: trn_containers                                        */
/*==============================================================*/
create table trn_containers 
(
   id                   varchar(40)                    not null
   	 comment '主键id',
   biz_id               varchar(52)                    not null
   	 comment '系统流水号',
   record_number        varchar(3)                     not null
   	 comment '提运单序号',
   conta_seqno          varchar(3)                     not null
   	 comment '集装箱序号，集装箱表体编号，按自然数排列',
   conta_no             varchar(11)                    not null
   	 comment '集装箱号',
   trans_name           varchar(32)                    null
   	 comment '境内运输工具名称',
   trans_weight         decimal(19,4)                  null
   	 comment '运输工具实际重量',
   conta_model          varchar(1)                     null
   	 comment '集装箱规格，S—20英尺，
            L—40英尺，
            N—非集装箱',
   seal_no              varchar(128)                   null
   	 comment '电子关锁号',
   conta1               varchar(32)                    null
   	 comment '备注',
   eseal_id             varchar(128)                   null
   	 comment '关锁号',
   seal_num             decimal(9,0)                   null
   	 comment '关锁个数',
   status               varchar(1)                     null
   	 comment '状态，1是删除 0是正常状态',
   created_date         datetime                       null
   	 comment '创建时间',
   modified_date        datetime                       null
   	 comment '修改时间',
   created_by           varchar(40)                    null
   	 comment '创建人',
   modified_by          varchar(40)                    null
   	 comment '操作人',
   constraint PK_TRN_CONTAINERS primary key clustered (id)
);

alter table trn_containers comment '转关单集装箱';

drop table if exists trn_conta_goods;

/*==============================================================*/
/* Table: trn_conta_goods                                       */
/*==============================================================*/
create table trn_conta_goods 
(
   id                   varchar(40)                    not null
   	 comment '主键id',
   biz_id               varchar(52)                    not null
   	 comment '系统流水号',
   record_number        varchar(3)                     null
   	 comment '提运单序号',
   g_no                 varchar(9)                     null
   	 comment '商品序号',
   conta_seqno          varchar(3)                     null
   	 comment '集装箱序号',
   conta_goods_count    varchar(9)                     null
   	 comment '商品件数',
   conta_goods_weight   decimal(19,4)                  null
   	 comment '商品重量',
   conta_no             varchar(11)                    not null
   	 comment '集装箱号',
   status               varchar(1)                     null
   	 comment '状态，1是删除 0是正常状态',
   created_date         datetime                       null
   	 comment '创建时间',
   modified_date        datetime                       null
   	 comment '修改时间',
   created_by           varchar(40)                    null
   	 comment '创建人',
   modified_by          varchar(40)                    null
   	 comment '操作人',
   constraint PK_TRN_CONTA_GOODS primary key clustered (id, conta_no)
);

alter table trn_conta_goods comment '转关单集装箱商品关联信息';

drop table if exists trn_sign;

/*==============================================================*/
/* Table: trn_sign                                              */
/*==============================================================*/
create table trn_sign 
(
   id                   varchar(40)                    not null
   	 comment '主键id',
   biz_id               varchar(52)                    not null
   	 comment '系统流水号',
   sign                 varchar(200)                   not null
   	 comment '签名信息',
   iccard_id            varchar(13)                    null
   	 comment '签名者卡号，当前录入员或申报员卡号',
   iccard_unit_code     varchar(18)                    not null
   	 comment '签名者组织机构代码',
   sign_date            date                           null
   	 comment '签名日期',
   oper_type            varchar(1)                     null
   	 comment '操作类型，操作类型： B: 暂存 C: 申报',
   cert_seq_no          varchar(32)                    not null
   	 comment '签名证书号',
   domain_id            varchar(32)                    not null
   	 comment '签名人类型',
   cop_seq_no           varchar(18)                    null
   	 comment '企业内部编号，对每个传输通道要唯一',
   note                 varchar(100)                   null
   	 comment '备注',
   host_id              varchar(32)                    null
   	 comment '客户端邮箱的HostId',
   status               varchar(1)                     null
   	 comment '状态，1是删除 0是正常状态',
   created_date         datetime                       null
   	 comment '创建时间',
   modified_date        datetime                       null
   	 comment '修改时间',
   created_by           varchar(40)                    null
   	 comment '创建人',
   modified_by          varchar(40)                    null
   	 comment '操作人',
   constraint PK_TRN_SIGN primary key clustered (id)
);

alter table trn_sign comment '转关单签名信息部分';

drop table if exists trn_template;

/*==============================================================*/
/* Table: trn_template                                          */
/*==============================================================*/
create table trn_template 
(
   id                   varchar(40)                    not null
   	 comment '主键id',
   serial_num           varchar(5)                     null
   	 comment '序号',
   template_name        varchar(255)                   not null
   	 comment '模板名称',
   template_describe    varchar(255)                   null
   	 comment '模板描述',
   custom_master        varchar(4)                     null
   	 comment '申报地海关',
   is_lock              varchar(1)                     null
   	 comment '是否启用电子关锁',
   trn_Mode             varchar(2)                     null
   	 comment '转关方式',
   traf_mode            varchar(1)                     null
   	 comment '境内运输方式',
   contractor_name      varchar(255)                   null
   	 comment '承运单位名称',
   created_date         datetime                       null
   	 comment '创建时间',
   modified_date        datetime                       null
   	 comment '修改时间',
   created_by           varchar(40)                    null
   	 comment '创建人',
   modified_by          varchar(40)                    null
   	 comment '操作人',
   constraint PK_TRN_TEMPLATE primary key clustered (id)
);

alter table trn_template comment '转关单模板';

