/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     2016/10/17 16:58:43                          */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('dbo.nbers_access') and o.name = 'FK_NBERS_AC_REFERENCE_NBERS_RO')
alter table dbo.nbers_access
   drop constraint FK_NBERS_AC_REFERENCE_NBERS_RO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('dbo.nbers_access') and o.name = 'FK_NBERS_AC_REFERENCE_NBERS_NO')
alter table dbo.nbers_access
   drop constraint FK_NBERS_AC_REFERENCE_NBERS_NO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('dbo.nbers_node') and o.name = 'FK_NBERS_NO_REFERENCE_NBERS_GR')
alter table dbo.nbers_node
   drop constraint FK_NBERS_NO_REFERENCE_NBERS_GR
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('dbo.nbers_role_user') and o.name = 'FK_NBERS_RO_REFERENCE_NBERS_US')
alter table dbo.nbers_role_user
   drop constraint FK_NBERS_RO_REFERENCE_NBERS_US
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('dbo.nbers_role_user') and o.name = 'FK_NBERS_RO_REFERENCE_NBERS_RO')
alter table dbo.nbers_role_user
   drop constraint FK_NBERS_RO_REFERENCE_NBERS_RO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.nbers_access')
            and   type = 'U')
   drop table dbo.nbers_access
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.nbers_form')
            and   type = 'U')
   drop table dbo.nbers_form
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.nbers_group')
            and   type = 'U')
   drop table dbo.nbers_group
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.nbers_node')
            and   type = 'U')
   drop table dbo.nbers_node
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.nbers_role')
            and   type = 'U')
   drop table dbo.nbers_role
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.nbers_role_user')
            and   type = 'U')
   drop table dbo.nbers_role_user
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.nbers_user')
            and   type = 'U')
   drop table dbo.nbers_user
go

execute sp_revokedbaccess dbo
go

/*==============================================================*/
/* User: dbo                                                    */
/*==============================================================*/
execute sp_grantdbaccess dbo
go

/*==============================================================*/
/* Table: nbers_access                                          */
/*==============================================================*/
create table dbo.nbers_access (
   role_id              smallint             not null,
   node_id              smallint             not null,
   module               nvarchar(50)         collate Chinese_PRC_CI_AS null constraint DF__nbers_acc__modul__251C81ED default null
)
on "PRIMARY"
go

/*==============================================================*/
/* Table: nbers_form                                            */
/*==============================================================*/
create table dbo.nbers_form (
   id                   smallint             identity(0, 1),
   title                nvarchar(255)        collate Chinese_PRC_CI_AS not null,
   content              nvarchar(255)        collate Chinese_PRC_CI_AS not null,
   create_time          timestamp            not null,
   status               tinyint              not null,
   constraint PK__nbers_fo__3213E83FBE35707B primary key (id)
         on "PRIMARY"
)
on "PRIMARY"
go

/*==============================================================*/
/* Table: nbers_group                                           */
/*==============================================================*/
create table dbo.nbers_group (
   id                   smallint             identity(0, 1),
   name                 nvarchar(25)         collate Chinese_PRC_CI_AS not null,
   title                nvarchar(50)         collate Chinese_PRC_CI_AS not null,
   create_time          int                  not null,
   update_time          int                  not null constraint DF__nbers_gro__updat__29E1370A default 0,
   status               tinyint              not null constraint DF__nbers_gro__statu__2AD55B43 default 0,
   sort                 tinyint              not null constraint DF__nbers_grou__sort__2BC97F7C default 0,
   show                 tinyint              not null constraint DF__nbers_grou__show__2CBDA3B5 default 0,
   constraint PK__nbers_gr__3213E83FFF145CAE primary key (id)
         on "PRIMARY"
)
on "PRIMARY"
go

/*==============================================================*/
/* Table: nbers_node                                            */
/*==============================================================*/
create table dbo.nbers_node (
   id                   tinyint              identity(0, 1),
   name                 nvarchar(20)         collate Chinese_PRC_CI_AS not null,
   title                nvarchar(50)         collate Chinese_PRC_CI_AS null constraint DF__nbers_nod__title__2EA5EC27 default null,
   status               tinyint              null constraint DF__nbers_nod__statu__2F9A1060 default 0,
   remark               nvarchar(255)        collate Chinese_PRC_CI_AS null constraint DF__nbers_nod__remar__308E3499 default null,
   sort                 tinyint              null constraint DF__nbers_node__sort__318258D2 default null,
   pid                  tinyint              not null,
   level                tinyint              not null,
   type                 tinyint              not null constraint DF__nbers_node__type__32767D0B default 0,
   group_id             tinyint              null constraint DF__nbers_nod__group__336AA144 default 0,
   url                  varchar(500)         null
)
on "PRIMARY"
go

/*==============================================================*/
/* Table: nbers_role                                            */
/*==============================================================*/
create table dbo.nbers_role (
   id                   tinyint              identity(0, 1),
   name                 nvarchar(20)         collate Chinese_PRC_CI_AS not null,
   pid                  tinyint              null constraint DF__nbers_role__pid__3552E9B6 default null,
   status               tinyint              null constraint DF__nbers_rol__statu__36470DEF default null,
   remark               nvarchar(255)        collate Chinese_PRC_CI_AS null constraint DF__nbers_rol__remar__373B3228 default null,
   ename                nvarchar(5)          collate Chinese_PRC_CI_AS null constraint DF__nbers_rol__ename__382F5661 default null,
   create_time          int                  not null,
   update_time          int                  not null
)
on "PRIMARY"
go

/*==============================================================*/
/* Table: nbers_role_user                                       */
/*==============================================================*/
create table dbo.nbers_role_user (
   role_id              int                  null constraint DF__nbers_rol__role___3A179ED3 default null,
   user_id              char(32)             collate Chinese_PRC_CI_AS null constraint DF__nbers_rol__user___3B0BC30C default null
)
on "PRIMARY"
go

/*==============================================================*/
/* Table: nbers_user                                            */
/*==============================================================*/
create table dbo.nbers_user (
   id                   tinyint              identity(0, 1),
   account              nvarchar(64)         collate Chinese_PRC_CI_AS not null,
   nickname             nvarchar(50)         collate Chinese_PRC_CI_AS not null,
   password             char(32)             collate Chinese_PRC_CI_AS not null,
   bind_account         varchar(50)          collate Chinese_PRC_CI_AS not null,
   last_login_time      int                  null constraint DF__nbers_use__last___3DE82FB7 default 0,
   last_login_ip        varchar(40)          collate Chinese_PRC_CI_AS null constraint DF__nbers_use__last___3EDC53F0 default null,
   login_count          int                  null constraint DF__nbers_use__login__3FD07829 default 0,
   verify               nvarchar(32)         collate Chinese_PRC_CI_AS null constraint DF__nbers_use__verif__40C49C62 default null,
   email                nvarchar(50)         collate Chinese_PRC_CI_AS not null,
   remark               nvarchar(255)        collate Chinese_PRC_CI_AS not null,
   create_time          int                  not null,
   update_time          int                  not null,
   status               tinyint              null constraint DF__nbers_use__statu__41B8C09B default 0,
   type_id              tinyint              null constraint DF__nbers_use__type___42ACE4D4 default 0,
   info                 text                 collate Chinese_PRC_CI_AS not null,
   constraint PK__nbers_us__3213E83FE07801A0 primary key (id)
         on "PRIMARY"
)
on "PRIMARY"
go

alter table dbo.nbers_access
   add constraint FK_NBERS_AC_REFERENCE_NBERS_RO foreign key (role_id)
      references dbo.nbers_role (id)
go

alter table dbo.nbers_access
   add constraint FK_NBERS_AC_REFERENCE_NBERS_NO foreign key (node_id)
      references dbo.nbers_node (id)
go

alter table dbo.nbers_node
   add constraint FK_NBERS_NO_REFERENCE_NBERS_GR foreign key (group_id)
      references dbo.nbers_group (id)
go

alter table dbo.nbers_role_user
   add constraint FK_NBERS_RO_REFERENCE_NBERS_US foreign key (user_id)
      references dbo.nbers_user (id)
go

alter table dbo.nbers_role_user
   add constraint FK_NBERS_RO_REFERENCE_NBERS_RO foreign key (role_id)
      references dbo.nbers_role (id)
go

