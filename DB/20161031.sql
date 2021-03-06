USE [N_Bers_aj]
GO
ALTER TABLE [dbo].[nbers_group] DROP CONSTRAINT [DF__nbers_grou__show__5CD6CB2B]
GO
ALTER TABLE [dbo].[nbers_group] DROP CONSTRAINT [DF__nbers_grou__sort__5BE2A6F2]
GO
ALTER TABLE [dbo].[nbers_group] DROP CONSTRAINT [DF__nbers_gro__statu__5AEE82B9]
GO
ALTER TABLE [dbo].[nbers_group] DROP CONSTRAINT [DF__nbers_gro__updat__59FA5E80]
GO
/****** Object:  Table [dbo].[nbers_user]    Script Date: 2016/10/31 10:24:14 ******/
DROP TABLE [dbo].[nbers_user]
GO
/****** Object:  Table [dbo].[nbers_role_user]    Script Date: 2016/10/31 10:24:14 ******/
DROP TABLE [dbo].[nbers_role_user]
GO
/****** Object:  Table [dbo].[nbers_role]    Script Date: 2016/10/31 10:24:14 ******/
DROP TABLE [dbo].[nbers_role]
GO
/****** Object:  Table [dbo].[nbers_node]    Script Date: 2016/10/31 10:24:14 ******/
DROP TABLE [dbo].[nbers_node]
GO
/****** Object:  Table [dbo].[nbers_group]    Script Date: 2016/10/31 10:24:14 ******/
DROP TABLE [dbo].[nbers_group]
GO
/****** Object:  Table [dbo].[nbers_form]    Script Date: 2016/10/31 10:24:14 ******/
DROP TABLE [dbo].[nbers_form]
GO
/****** Object:  Table [dbo].[nbers_businessunit]    Script Date: 2016/10/31 10:24:14 ******/
DROP TABLE [dbo].[nbers_businessunit]
GO
/****** Object:  Table [dbo].[nbers_access]    Script Date: 2016/10/31 10:24:14 ******/
DROP TABLE [dbo].[nbers_access]
GO
USE [master]
GO
/****** Object:  Database [N_Bers_aj]    Script Date: 2016/10/31 10:24:14 ******/
DROP DATABASE [N_Bers_aj]
GO
/****** Object:  Database [N_Bers_aj]    Script Date: 2016/10/31 10:24:14 ******/
CREATE DATABASE [N_Bers_aj]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'N_Bers_aj', FILENAME = N'E:\DB\N_Bers_aj.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'N_Bers_aj_log', FILENAME = N'E:\DB\N_Bers_aj_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [N_Bers_aj] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [N_Bers_aj].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [N_Bers_aj] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [N_Bers_aj] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [N_Bers_aj] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [N_Bers_aj] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [N_Bers_aj] SET ARITHABORT OFF 
GO
ALTER DATABASE [N_Bers_aj] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [N_Bers_aj] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [N_Bers_aj] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [N_Bers_aj] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [N_Bers_aj] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [N_Bers_aj] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [N_Bers_aj] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [N_Bers_aj] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [N_Bers_aj] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [N_Bers_aj] SET  DISABLE_BROKER 
GO
ALTER DATABASE [N_Bers_aj] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [N_Bers_aj] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [N_Bers_aj] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [N_Bers_aj] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [N_Bers_aj] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [N_Bers_aj] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [N_Bers_aj] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [N_Bers_aj] SET RECOVERY FULL 
GO
ALTER DATABASE [N_Bers_aj] SET  MULTI_USER 
GO
ALTER DATABASE [N_Bers_aj] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [N_Bers_aj] SET DB_CHAINING OFF 
GO
ALTER DATABASE [N_Bers_aj] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [N_Bers_aj] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [N_Bers_aj] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'N_Bers_aj', N'ON'
GO
USE [N_Bers_aj]
GO
/****** Object:  Table [dbo].[nbers_access]    Script Date: 2016/10/31 10:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nbers_access](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_id] [int] NOT NULL,
	[node_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[nbers_businessunit]    Script Date: 2016/10/31 10:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nbers_businessunit](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[unit_name] [nvarchar](100) NOT NULL,
	[unit_fullname] [nvarchar](500) NULL,
	[pid] [int] NULL,
	[unit_auditorname] [nvarchar](50) NULL,
	[unit_auditor] [int] NULL,
	[createby] [int] NULL,
	[createon] [datetime] NULL,
	[unit_figure] [text] NULL,
	[unit_duty] [text] NULL,
	[unit_type] [nvarchar](50) NULL,
	[remark] [nvarchar](50) NULL,
 CONSTRAINT [PK__nbers_bu__3213E83FD4BE07E6] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[nbers_form]    Script Date: 2016/10/31 10:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nbers_form](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[content] [nvarchar](255) NOT NULL,
	[create_time] [timestamp] NOT NULL,
	[status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[nbers_group]    Script Date: 2016/10/31 10:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nbers_group](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[name] [nvarchar](25) NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[create_time] [int] NOT NULL,
	[update_time] [int] NOT NULL,
	[status] [int] NOT NULL,
	[sort] [int] NOT NULL,
	[show] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[nbers_node]    Script Date: 2016/10/31 10:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[nbers_node](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[version] [bigint] NULL DEFAULT (NULL),
	[parentId] [int] NOT NULL,
	[name] [nvarchar](20) NOT NULL,
	[url] [varchar](500) NULL,
	[params] [varchar](200) NULL DEFAULT (NULL),
	[icon] [varchar](200) NULL DEFAULT (NULL),
	[levels] [int] NULL DEFAULT ('0'),
	[sortCode] [int] NULL DEFAULT (NULL),
	[moduleId] [varchar](32) NULL DEFAULT (NULL),
	[enable] [varchar](11) NULL DEFAULT (NULL),
	[group_id] [int] NULL DEFAULT ('0'),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[nbers_role]    Script Date: 2016/10/31 10:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nbers_role](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[name] [nvarchar](20) NOT NULL,
	[pid] [int] NULL DEFAULT (NULL),
	[status] [int] NULL DEFAULT (NULL),
	[remark] [nvarchar](255) NULL DEFAULT (NULL),
	[ename] [nvarchar](5) NULL DEFAULT (NULL),
	[create_time] [int] NOT NULL,
	[update_time] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[nbers_role_user]    Script Date: 2016/10/31 10:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nbers_role_user](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[role_id] [int] NULL DEFAULT (NULL),
	[user_id] [int] NULL DEFAULT (NULL),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[nbers_user]    Script Date: 2016/10/31 10:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[nbers_user](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[account] [nvarchar](64) NOT NULL,
	[nickname] [nvarchar](50) NOT NULL,
	[password] [char](32) NOT NULL,
	[bind_account] [varchar](50) NOT NULL,
	[last_login_time] [int] NULL DEFAULT ('0'),
	[last_login_ip] [varchar](40) NULL DEFAULT (NULL),
	[login_count] [int] NULL DEFAULT ('0'),
	[verify] [nvarchar](32) NULL DEFAULT (NULL),
	[email] [nvarchar](50) NOT NULL,
	[remark] [nvarchar](255) NOT NULL,
	[create_time] [int] NOT NULL,
	[update_time] [int] NOT NULL,
	[status] [int] NULL DEFAULT ('0'),
	[type_id] [int] NULL DEFAULT ('0'),
	[info] [text] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[nbers_access] ON 

INSERT [dbo].[nbers_access] ([id], [role_id], [node_id]) VALUES (1, 1, 1)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id]) VALUES (2, 1, 2)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id]) VALUES (3, 1, 3)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id]) VALUES (4, 1, 4)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id]) VALUES (5, 1, 5)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id]) VALUES (6, 2, 4)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id]) VALUES (7, 2, 5)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id]) VALUES (8, 1, 6)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id]) VALUES (9, 1, 10)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id]) VALUES (11, 1, 13)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id]) VALUES (12, 1, 14)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id]) VALUES (13, 1, 15)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id]) VALUES (14, 1, 17)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id]) VALUES (15, 1, 8)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id]) VALUES (16, 1, 9)
SET IDENTITY_INSERT [dbo].[nbers_access] OFF
SET IDENTITY_INSERT [dbo].[nbers_businessunit] ON 

INSERT [dbo].[nbers_businessunit] ([id], [unit_name], [unit_fullname], [pid], [unit_auditorname], [unit_auditor], [createby], [createon], [unit_figure], [unit_duty], [unit_type], [remark]) VALUES (1, N'312', N'312', NULL, NULL, NULL, 1, CAST(N'2016-10-28 21:44:20.897' AS DateTime), N'232', N'231', N'农电', NULL)
SET IDENTITY_INSERT [dbo].[nbers_businessunit] OFF
SET IDENTITY_INSERT [dbo].[nbers_node] ON 

INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (1, 1, 0, N'系统设置', NULL, NULL, NULL, 1, 1, N'system', N'1', 0)
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (2, 1, 1, N'用户管理', N'/UserManage/UserIndex.aspx', NULL, NULL, 2, 1, N'system', N'1', 0)
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (3, 1, 1, N'角色管理', NULL, NULL, NULL, 2, 2, N'system', N'1', 0)
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (4, 1, 0, N'基础信息', NULL, NULL, NULL, 1, 2, N'base', N'1', 0)
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (5, 1, 4, N'部门', N'/UserManage/UnitIndex.aspx?nodeid=5', NULL, NULL, 2, 1, N'base', N'1', 0)
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (6, 1, 5, N'新增', NULL, NULL, NULL, 0, 1, NULL, N'1', 1)
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (8, 1, 5, N'编辑', NULL, NULL, NULL, 0, 2, NULL, N'1', 1)
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (9, 1, 5, N'删除', NULL, NULL, NULL, 0, 2, NULL, N'1', 1)
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (10, 1, 2, N'新增', NULL, NULL, NULL, 0, 1, NULL, N'1', 1)
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (11, 1, 2, N'编辑', NULL, NULL, NULL, 0, 2, NULL, N'1', 1)
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (12, 1, 2, N'删除', NULL, NULL, NULL, 0, 3, NULL, N'1', 1)
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (13, 1, 1, N'菜单管理', N'/SystemManage/MenuIndex.aspx?nodeid=13', NULL, NULL, 2, 3, N'system', N'1', 0)
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (14, 1, 13, N'新增', NULL, NULL, NULL, 0, 1, NULL, N'1', 1)
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (15, 1, 13, N'编辑', NULL, NULL, NULL, 0, 2, NULL, N'1', 1)
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (17, 1, 13, N'删除', NULL, NULL, NULL, 0, 3, NULL, N'1', 1)
SET IDENTITY_INSERT [dbo].[nbers_node] OFF
SET IDENTITY_INSERT [dbo].[nbers_role] ON 

INSERT [dbo].[nbers_role] ([id], [name], [pid], [status], [remark], [ename], [create_time], [update_time]) VALUES (1, N'管理员', 0, 1, N'', N'', 1208784792, 1254325558)
INSERT [dbo].[nbers_role] ([id], [name], [pid], [status], [remark], [ename], [create_time], [update_time]) VALUES (2, N'系统测试员', 0, 1, N'', N'', 1215496283, 1254325566)
SET IDENTITY_INSERT [dbo].[nbers_role] OFF
SET IDENTITY_INSERT [dbo].[nbers_role_user] ON 

INSERT [dbo].[nbers_role_user] ([id], [role_id], [user_id]) VALUES (8, 1, 1)
INSERT [dbo].[nbers_role_user] ([id], [role_id], [user_id]) VALUES (9, 2, 2)
INSERT [dbo].[nbers_role_user] ([id], [role_id], [user_id]) VALUES (10, 2, 3)
INSERT [dbo].[nbers_role_user] ([id], [role_id], [user_id]) VALUES (11, 2, 4)
SET IDENTITY_INSERT [dbo].[nbers_role_user] OFF
SET IDENTITY_INSERT [dbo].[nbers_user] ON 

INSERT [dbo].[nbers_user] ([id], [account], [nickname], [password], [bind_account], [last_login_time], [last_login_ip], [login_count], [verify], [email], [remark], [create_time], [update_time], [status], [type_id], [info]) VALUES (1, N'admin', N'管理员AA', N'21232f297a57a5a743894a0e4a801fc3', N'', 1326335612, N'127.0.0.1', 888, N'8888', N'liu21st@gmail.com', N'备注信息', 1222907803, 1326266696, 1, 0, N'')
INSERT [dbo].[nbers_user] ([id], [account], [nickname], [password], [bind_account], [last_login_time], [last_login_ip], [login_count], [verify], [email], [remark], [create_time], [update_time], [status], [type_id], [info]) VALUES (2, N'demo', N'演示', N'fe01ce2a7fbac8fafaed7c982a04e229', N'', 1254326091, N'127.0.0.1', 90, N'8888', N'', N'', 1239783735, 1254325770, 1, 0, N'')
INSERT [dbo].[nbers_user] ([id], [account], [nickname], [password], [bind_account], [last_login_time], [last_login_ip], [login_count], [verify], [email], [remark], [create_time], [update_time], [status], [type_id], [info]) VALUES (3, N'member', N'员工', N'aa08769cdcb26674c6706093503ff0a3', N'', 1326266720, N'127.0.0.1', 17, N'', N'', N'', 1253514375, 1254325728, 1, 0, N'')
INSERT [dbo].[nbers_user] ([id], [account], [nickname], [password], [bind_account], [last_login_time], [last_login_ip], [login_count], [verify], [email], [remark], [create_time], [update_time], [status], [type_id], [info]) VALUES (4, N'leader', N'领导', N'c444858e0aaeb727da73d2eae62321ad', N'', 1254325906, N'127.0.0.1', 15, N'', N'', N'领导', 1253514575, 1254325705, 1, 0, N'')
SET IDENTITY_INSERT [dbo].[nbers_user] OFF
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
