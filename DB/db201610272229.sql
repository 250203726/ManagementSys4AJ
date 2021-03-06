
USE [N_Bers_aj]
GO
/****** Object:  Table [dbo].[nbers_access]    Script Date: 2016/10/27 22:27:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nbers_access]
    (
      [id] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [role_id] [INT] NOT NULL ,
      [node_id] [INT] NOT NULL ,
      PRIMARY KEY CLUSTERED ( [id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY]

GO

GO
/****** Object:  Table [dbo].[nbers_form]    Script Date: 2016/10/27 22:27:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nbers_form]
    (
      [id] [INT] IDENTITY(0, 1)
                 NOT NULL ,
      [title] [NVARCHAR](255) NOT NULL ,
      [content] [NVARCHAR](255) NOT NULL ,
      [create_time] [TIMESTAMP] NOT NULL ,
      [status] [INT] NOT NULL ,
      PRIMARY KEY CLUSTERED ( [id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY]

GO
/****** Object:  Table [dbo].[nbers_group]    Script Date: 2016/10/27 22:27:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nbers_group]
    (
      [id] [INT] IDENTITY(0, 1)
                 NOT NULL ,
      [name] [NVARCHAR](25) NOT NULL ,
      [title] [NVARCHAR](50) NOT NULL ,
      [create_time] [INT] NOT NULL ,
      [update_time] [INT] NOT NULL ,
      [status] [INT] NOT NULL ,
      [sort] [INT] NOT NULL ,
      [show] [INT] NOT NULL ,
      PRIMARY KEY CLUSTERED ( [id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY]

GO
/****** Object:  Table [dbo].[nbers_node]    Script Date: 2016/10/27 22:27:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[nbers_node]
    (
      [id] [INT] IDENTITY(0, 1)
                 NOT NULL ,
      [version] [BIGINT] NULL
                         DEFAULT ( NULL ) ,
      [parentId] [INT] NOT NULL ,
      [name] [NVARCHAR](20) NOT NULL ,
      [url] [VARCHAR](500) NULL ,
      [params] [VARCHAR](200) NULL
                              DEFAULT ( NULL ) ,
      [icon] [VARCHAR](200) NULL
                            DEFAULT ( NULL ) ,
      [levels] [INT] NULL
                     DEFAULT ( '0' ) ,
      [sortCode] [INT] NULL
                       DEFAULT ( NULL ) ,
      [moduleId] [VARCHAR](32) NULL
                               DEFAULT ( NULL ) ,
      [enable] [VARCHAR](11) NULL
                             DEFAULT ( NULL ) ,
      [group_id] [INT] NULL
                       DEFAULT ( '0' ) ,
      PRIMARY KEY CLUSTERED ( [id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[nbers_role]    Script Date: 2016/10/27 22:27:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nbers_role]
    (
      [id] [INT] IDENTITY(0, 1)
                 NOT NULL ,
      [name] [NVARCHAR](20) NOT NULL ,
      [pid] [INT] NULL
                  DEFAULT ( NULL ) ,
      [status] [INT] NULL
                     DEFAULT ( NULL ) ,
      [remark] [NVARCHAR](255) NULL
                               DEFAULT ( NULL ) ,
      [ename] [NVARCHAR](5) NULL
                            DEFAULT ( NULL ) ,
      [create_time] [INT] NOT NULL ,
      [update_time] [INT] NOT NULL ,
      PRIMARY KEY CLUSTERED ( [id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY]

GO
/****** Object:  Table [dbo].[nbers_role_user]    Script Date: 2016/10/27 22:27:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nbers_role_user]
    (
      [id] [INT] IDENTITY(0, 1)
                 NOT NULL ,
      [role_id] [INT] NULL
                      DEFAULT ( NULL ) ,
      [user_id] [INT] NULL
                      DEFAULT ( NULL ) ,
      PRIMARY KEY CLUSTERED ( [id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY]

GO
/****** Object:  Table [dbo].[nbers_user]    Script Date: 2016/10/27 22:27:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[nbers_user]
    (
      [id] [INT] IDENTITY(0, 1)
                 NOT NULL ,
      [account] [NVARCHAR](64) NOT NULL ,
      [nickname] [NVARCHAR](50) NOT NULL ,
      [password] [CHAR](32) NOT NULL ,
      [bind_account] [VARCHAR](50) NOT NULL ,
      [last_login_time] [INT] NULL
                              DEFAULT ( '0' ) ,
      [last_login_ip] [VARCHAR](40) NULL
                                    DEFAULT ( NULL ) ,
      [login_count] [INT] NULL
                          DEFAULT ( '0' ) ,
      [verify] [NVARCHAR](32) NULL
                              DEFAULT ( NULL ) ,
      [email] [NVARCHAR](50) NOT NULL ,
      [remark] [NVARCHAR](255) NOT NULL ,
      [create_time] [INT] NOT NULL ,
      [update_time] [INT] NOT NULL ,
      [status] [INT] NULL
                     DEFAULT ( '0' ) ,
      [type_id] [INT] NULL
                      DEFAULT ( '0' ) ,
      [info] [TEXT] NOT NULL ,
      PRIMARY KEY CLUSTERED ( [id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[nbers_access] ON 

GO
INSERT  [dbo].[nbers_access]
        ( [id], [role_id], [node_id] )
VALUES  ( 1, 1, 1 )
GO
INSERT  [dbo].[nbers_access]
        ( [id], [role_id], [node_id] )
VALUES  ( 2, 1, 2 )
GO
INSERT  [dbo].[nbers_access]
        ( [id], [role_id], [node_id] )
VALUES  ( 3, 1, 3 )
GO
INSERT  [dbo].[nbers_access]
        ( [id], [role_id], [node_id] )
VALUES  ( 4, 1, 4 )
GO
INSERT  [dbo].[nbers_access]
        ( [id], [role_id], [node_id] )
VALUES  ( 5, 1, 5 )
GO
INSERT  [dbo].[nbers_access]
        ( [id], [role_id], [node_id] )
VALUES  ( 6, 2, 4 )
GO
INSERT  [dbo].[nbers_access]
        ( [id], [role_id], [node_id] )
VALUES  ( 7, 2, 5 )
GO
INSERT  [dbo].[nbers_access]
        ( [id], [role_id], [node_id] )
VALUES  ( 8, 1, 6 )
GO
INSERT  [dbo].[nbers_access]
        ( [id], [role_id], [node_id] )
VALUES  ( 9, 1, 10 )
GO
SET IDENTITY_INSERT [dbo].[nbers_access] OFF
GO


SET IDENTITY_INSERT [dbo].[nbers_node] ON 

GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [version] ,
          [parentId] ,
          [name] ,
          [url] ,
          [params] ,
          [icon] ,
          [levels] ,
          [sortCode] ,
          [moduleId] ,
          [enable] ,
          [group_id]
        )
VALUES  ( 1 ,
          1 ,
          0 ,
          N'系统设置' ,
          NULL ,
          NULL ,
          NULL ,
          1 ,
          1 ,
          N'system' ,
          N'1' ,
          0
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [version] ,
          [parentId] ,
          [name] ,
          [url] ,
          [params] ,
          [icon] ,
          [levels] ,
          [sortCode] ,
          [moduleId] ,
          [enable] ,
          [group_id]
        )
VALUES  ( 2 ,
          1 ,
          1 ,
          N'用户管理' ,
          N'/UserManage/UserIndex.aspx' ,
          NULL ,
          NULL ,
          2 ,
          1 ,
          N'system' ,
          N'1' ,
          0
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [version] ,
          [parentId] ,
          [name] ,
          [url] ,
          [params] ,
          [icon] ,
          [levels] ,
          [sortCode] ,
          [moduleId] ,
          [enable] ,
          [group_id]
        )
VALUES  ( 3 ,
          1 ,
          1 ,
          N'角色管理' ,
          NULL ,
          NULL ,
          NULL ,
          2 ,
          2 ,
          N'system' ,
          N'1' ,
          0
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [version] ,
          [parentId] ,
          [name] ,
          [url] ,
          [params] ,
          [icon] ,
          [levels] ,
          [sortCode] ,
          [moduleId] ,
          [enable] ,
          [group_id]
        )
VALUES  ( 4 ,
          1 ,
          0 ,
          N'基础信息' ,
          NULL ,
          NULL ,
          NULL ,
          1 ,
          2 ,
          N'base' ,
          N'1' ,
          0
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [version] ,
          [parentId] ,
          [name] ,
          [url] ,
          [params] ,
          [icon] ,
          [levels] ,
          [sortCode] ,
          [moduleId] ,
          [enable] ,
          [group_id]
        )
VALUES  ( 5 ,
          1 ,
          4 ,
          N'部门' ,
          N'/UserManage/UnitIndex.aspx?nodeid=5' ,
          NULL ,
          NULL ,
          2 ,
          1 ,
          N'base' ,
          N'1' ,
          0
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [version] ,
          [parentId] ,
          [name] ,
          [url] ,
          [params] ,
          [icon] ,
          [levels] ,
          [sortCode] ,
          [moduleId] ,
          [enable] ,
          [group_id]
        )
VALUES  ( 6 ,
          1 ,
          5 ,
          N'增加' ,
          NULL ,
          NULL ,
          NULL ,
          0 ,
          1 ,
          NULL ,
          N'1' ,
          1
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [version] ,
          [parentId] ,
          [name] ,
          [url] ,
          [params] ,
          [icon] ,
          [levels] ,
          [sortCode] ,
          [moduleId] ,
          [enable] ,
          [group_id]
        )
VALUES  ( 8 ,
          1 ,
          5 ,
          N'修改' ,
          NULL ,
          NULL ,
          NULL ,
          0 ,
          2 ,
          NULL ,
          N'1' ,
          1
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [version] ,
          [parentId] ,
          [name] ,
          [url] ,
          [params] ,
          [icon] ,
          [levels] ,
          [sortCode] ,
          [moduleId] ,
          [enable] ,
          [group_id]
        )
VALUES  ( 9 ,
          1 ,
          5 ,
          N'删除' ,
          NULL ,
          NULL ,
          NULL ,
          0 ,
          2 ,
          NULL ,
          N'1' ,
          1
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [version] ,
          [parentId] ,
          [name] ,
          [url] ,
          [params] ,
          [icon] ,
          [levels] ,
          [sortCode] ,
          [moduleId] ,
          [enable] ,
          [group_id]
        )
VALUES  ( 10 ,
          1 ,
          2 ,
          N'增加' ,
          NULL ,
          NULL ,
          NULL ,
          0 ,
          1 ,
          NULL ,
          N'1' ,
          1
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [version] ,
          [parentId] ,
          [name] ,
          [url] ,
          [params] ,
          [icon] ,
          [levels] ,
          [sortCode] ,
          [moduleId] ,
          [enable] ,
          [group_id]
        )
VALUES  ( 11 ,
          1 ,
          2 ,
          N'修改' ,
          NULL ,
          NULL ,
          NULL ,
          0 ,
          2 ,
          NULL ,
          N'1' ,
          1
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [version] ,
          [parentId] ,
          [name] ,
          [url] ,
          [params] ,
          [icon] ,
          [levels] ,
          [sortCode] ,
          [moduleId] ,
          [enable] ,
          [group_id]
        )
VALUES  ( 12 ,
          1 ,
          2 ,
          N'删除' ,
          NULL ,
          NULL ,
          NULL ,
          0 ,
          2 ,
          NULL ,
          N'1' ,
          1
        )
GO
SET IDENTITY_INSERT [dbo].[nbers_node] OFF
GO
SET IDENTITY_INSERT [dbo].[nbers_role] ON 

GO
INSERT  [dbo].[nbers_role]
        ( [id] ,
          [name] ,
          [pid] ,
          [status] ,
          [remark] ,
          [ename] ,
          [create_time] ,
          [update_time]
        )
VALUES  ( 1 ,
          N'管理员' ,
          0 ,
          1 ,
          N'' ,
          N'' ,
          1208784792 ,
          1254325558
        )
GO
INSERT  [dbo].[nbers_role]
        ( [id] ,
          [name] ,
          [pid] ,
          [status] ,
          [remark] ,
          [ename] ,
          [create_time] ,
          [update_time]
        )
VALUES  ( 2 ,
          N'系统测试员' ,
          0 ,
          1 ,
          N'' ,
          N'' ,
          1215496283 ,
          1254325566
        )
GO
SET IDENTITY_INSERT [dbo].[nbers_role] OFF
GO
SET IDENTITY_INSERT [dbo].[nbers_role_user] ON 

GO
INSERT  [dbo].[nbers_role_user]
        ( [id], [role_id], [user_id] )
VALUES  ( 8, 1, 1 )
GO
INSERT  [dbo].[nbers_role_user]
        ( [id], [role_id], [user_id] )
VALUES  ( 9, 2, 2 )
GO
INSERT  [dbo].[nbers_role_user]
        ( [id], [role_id], [user_id] )
VALUES  ( 10, 2, 3 )
GO
INSERT  [dbo].[nbers_role_user]
        ( [id], [role_id], [user_id] )
VALUES  ( 11, 2, 4 )
GO
SET IDENTITY_INSERT [dbo].[nbers_role_user] OFF
GO
SET IDENTITY_INSERT [dbo].[nbers_user] ON 

GO
INSERT  [dbo].[nbers_user]
        ( [id] ,
          [account] ,
          [nickname] ,
          [password] ,
          [bind_account] ,
          [last_login_time] ,
          [last_login_ip] ,
          [login_count] ,
          [verify] ,
          [email] ,
          [remark] ,
          [create_time] ,
          [update_time] ,
          [status] ,
          [type_id] ,
          [info]
        )
VALUES  ( 1 ,
          N'admin' ,
          N'管理员AA' ,
          N'21232f297a57a5a743894a0e4a801fc3' ,
          N'' ,
          1326335612 ,
          N'127.0.0.1' ,
          888 ,
          N'8888' ,
          N'liu21st@gmail.com' ,
          N'备注信息' ,
          1222907803 ,
          1326266696 ,
          1 ,
          0 ,
          N''
        )
GO
INSERT  [dbo].[nbers_user]
        ( [id] ,
          [account] ,
          [nickname] ,
          [password] ,
          [bind_account] ,
          [last_login_time] ,
          [last_login_ip] ,
          [login_count] ,
          [verify] ,
          [email] ,
          [remark] ,
          [create_time] ,
          [update_time] ,
          [status] ,
          [type_id] ,
          [info]
        )
VALUES  ( 2 ,
          N'demo' ,
          N'演示' ,
          N'fe01ce2a7fbac8fafaed7c982a04e229' ,
          N'' ,
          1254326091 ,
          N'127.0.0.1' ,
          90 ,
          N'8888' ,
          N'' ,
          N'' ,
          1239783735 ,
          1254325770 ,
          1 ,
          0 ,
          N''
        )
GO
INSERT  [dbo].[nbers_user]
        ( [id] ,
          [account] ,
          [nickname] ,
          [password] ,
          [bind_account] ,
          [last_login_time] ,
          [last_login_ip] ,
          [login_count] ,
          [verify] ,
          [email] ,
          [remark] ,
          [create_time] ,
          [update_time] ,
          [status] ,
          [type_id] ,
          [info]
        )
VALUES  ( 3 ,
          N'member' ,
          N'员工' ,
          N'aa08769cdcb26674c6706093503ff0a3' ,
          N'' ,
          1326266720 ,
          N'127.0.0.1' ,
          17 ,
          N'' ,
          N'' ,
          N'' ,
          1253514375 ,
          1254325728 ,
          1 ,
          0 ,
          N''
        )
GO
INSERT  [dbo].[nbers_user]
        ( [id] ,
          [account] ,
          [nickname] ,
          [password] ,
          [bind_account] ,
          [last_login_time] ,
          [last_login_ip] ,
          [login_count] ,
          [verify] ,
          [email] ,
          [remark] ,
          [create_time] ,
          [update_time] ,
          [status] ,
          [type_id] ,
          [info]
        )
VALUES  ( 4 ,
          N'leader' ,
          N'领导' ,
          N'c444858e0aaeb727da73d2eae62321ad' ,
          N'' ,
          1254325906 ,
          N'127.0.0.1' ,
          15 ,
          N'' ,
          N'' ,
          N'领导' ,
          1253514575 ,
          1254325705 ,
          1 ,
          0 ,
          N''
        )
GO
SET IDENTITY_INSERT [dbo].[nbers_user] OFF
GO
ALTER TABLE [dbo].[nbers_group] ADD  DEFAULT ('0') FOR [update_time]
GO
ALTER TABLE [dbo].[nbers_group] ADD  DEFAULT ('0') FOR [status]
GO
ALTER TABLE [dbo].[nbers_group] ADD  DEFAULT ('0') FOR [sort]
GO
ALTER TABLE [dbo].[nbers_group] ADD  DEFAULT ('0') FOR [show]
GO
USE [master]
GO
ALTER DATABASE [N_Bers_aj] SET  READ_WRITE 
GO
