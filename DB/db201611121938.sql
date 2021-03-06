USE [N_Bers_aj]
GO
ALTER TABLE [dbo].[nbers_group] DROP CONSTRAINT [DF__nbers_grou__show__2C1E8537]
GO
ALTER TABLE [dbo].[nbers_group] DROP CONSTRAINT [DF__nbers_grou__sort__2B2A60FE]
GO
ALTER TABLE [dbo].[nbers_group] DROP CONSTRAINT [DF__nbers_gro__statu__2A363CC5]
GO
ALTER TABLE [dbo].[nbers_group] DROP CONSTRAINT [DF__nbers_gro__updat__2942188C]
GO
/****** Object:  Table [dbo].[nbers_user]    Script Date: 2016/11/12 19:39:07 ******/
DROP TABLE [dbo].[nbers_user]
GO
/****** Object:  Table [dbo].[nbers_role_user]    Script Date: 2016/11/12 19:39:07 ******/
DROP TABLE [dbo].[nbers_role_user]
GO
/****** Object:  Table [dbo].[nbers_role]    Script Date: 2016/11/12 19:39:07 ******/
DROP TABLE [dbo].[nbers_role]
GO
/****** Object:  Table [dbo].[nbers_node]    Script Date: 2016/11/12 19:39:07 ******/
DROP TABLE [dbo].[nbers_node]
GO
/****** Object:  Table [dbo].[nbers_group]    Script Date: 2016/11/12 19:39:07 ******/
DROP TABLE [dbo].[nbers_group]
GO
/****** Object:  Table [dbo].[nbers_form]    Script Date: 2016/11/12 19:39:07 ******/
DROP TABLE [dbo].[nbers_form]
GO
/****** Object:  Table [dbo].[nbers_businessunit]    Script Date: 2016/11/12 19:39:07 ******/
DROP TABLE [dbo].[nbers_businessunit]
GO
/****** Object:  Table [dbo].[nbers_Attachments]    Script Date: 2016/11/12 19:39:07 ******/
DROP TABLE [dbo].[nbers_Attachments]
GO
/****** Object:  Table [dbo].[nbers_articles]    Script Date: 2016/11/12 19:39:07 ******/
DROP TABLE [dbo].[nbers_articles]
GO
/****** Object:  Table [dbo].[nbers_access]    Script Date: 2016/11/12 19:39:07 ******/
DROP TABLE [dbo].[nbers_access]
GO
USE [master]
GO
/****** Object:  Database [N_Bers_aj]    Script Date: 2016/11/12 19:39:07 ******/
DROP DATABASE [N_Bers_aj]
GO
/****** Object:  Database [N_Bers_aj]    Script Date: 2016/11/12 19:39:07 ******/
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
/****** Object:  Table [dbo].[nbers_access]    Script Date: 2016/11/12 19:39:07 ******/
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
/****** Object:  Table [dbo].[nbers_articles]    Script Date: 2016/11/12 19:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nbers_articles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NULL,
	[art_type] [nvarchar](50) NULL,
	[fkguid] [int] NULL,
	[content] [ntext] NULL,
	[istop] [tinyint] NULL,
	[status] [int] NULL,
	[create_date] [datetime] NULL,
	[createby] [int] NULL,
	[create_user] [nvarchar](50) NULL,
	[ispublish] [tinyint] NULL,
	[remark] [text] NULL,
	[description] [nvarchar](500) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[nbers_Attachments]    Script Date: 2016/11/12 19:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nbers_Attachments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DocName] [nvarchar](120) NULL,
	[FkGUID] [int] NULL,
	[CreateBy] [int] NULL,
	[CreateUser] [nvarchar](20) NULL,
	[CreateOn] [datetime] NULL,
	[FileName] [nvarchar](300) NULL,
	[Location] [nvarchar](300) NULL,
	[Filesize] [nvarchar](max) NULL,
	[URL] [nvarchar](200) NULL,
	[DocType] [nvarchar](100) NULL,
	[Remarks] [nvarchar](500) NULL,
 CONSTRAINT [PK_nbers_Attachments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[nbers_businessunit]    Script Date: 2016/11/12 19:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nbers_businessunit](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[unit_name] [nvarchar](100) NOT NULL,
	[unit_fullname] [nvarchar](500) NULL,
	[pid] [int] NULL,
	[unit_type] [int] NULL,
	[child_type] [nvarchar](50) NULL,
	[unit_auditorname] [nvarchar](50) NULL,
	[unit_auditor] [int] NULL,
	[createby] [int] NULL,
	[createon] [datetime] NULL,
	[unit_figure] [text] NULL,
	[unit_duty] [text] NULL,
	[remark] [nvarchar](50) NULL,
 CONSTRAINT [PK__nbers_bu__3213E83FD4BE07E6] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[nbers_form]    Script Date: 2016/11/12 19:39:07 ******/
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
/****** Object:  Table [dbo].[nbers_group]    Script Date: 2016/11/12 19:39:07 ******/
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
/****** Object:  Table [dbo].[nbers_node]    Script Date: 2016/11/12 19:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[nbers_node](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[version] [bigint] NULL CONSTRAINT [DF__nbers_nod__versi__04E4BC85]  DEFAULT (NULL),
	[parentId] [int] NOT NULL CONSTRAINT [DF_nbers_node_parentId]  DEFAULT ((0)),
	[name] [nvarchar](20) NOT NULL,
	[url] [varchar](500) NULL,
	[params] [varchar](200) NULL CONSTRAINT [DF__nbers_nod__param__05D8E0BE]  DEFAULT (NULL),
	[icon] [varchar](200) NULL CONSTRAINT [DF__nbers_node__icon__06CD04F7]  DEFAULT (NULL),
	[levels] [int] NULL CONSTRAINT [DF__nbers_nod__level__07C12930]  DEFAULT ('0'),
	[sortCode] [int] NULL CONSTRAINT [DF__nbers_nod__sortC__08B54D69]  DEFAULT (NULL),
	[moduleId] [varchar](32) NULL CONSTRAINT [DF__nbers_nod__modul__09A971A2]  DEFAULT (NULL),
	[enable] [varchar](11) NULL CONSTRAINT [DF__nbers_nod__enabl__0A9D95DB]  DEFAULT (NULL),
	[group_id] [int] NULL CONSTRAINT [DF__nbers_nod__group__0B91BA14]  DEFAULT ('0'),
 CONSTRAINT [PK__nbers_no__3213E83FB171BB38] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[nbers_role]    Script Date: 2016/11/12 19:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nbers_role](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[name] [nvarchar](20) NOT NULL,
	[status] [int] NULL DEFAULT (NULL),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[nbers_role_user]    Script Date: 2016/11/12 19:39:07 ******/
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
/****** Object:  Table [dbo].[nbers_user]    Script Date: 2016/11/12 19:39:07 ******/
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
	[bind_account] [varchar](50) NULL,
	[last_login_time] [int] NULL CONSTRAINT [DF__nbers_use__last___17F790F9]  DEFAULT ('0'),
	[last_login_ip] [varchar](40) NULL CONSTRAINT [DF__nbers_use__last___18EBB532]  DEFAULT (NULL),
	[login_count] [int] NULL CONSTRAINT [DF__nbers_use__login__19DFD96B]  DEFAULT ('0'),
	[verify] [nvarchar](32) NULL CONSTRAINT [DF__nbers_use__verif__1AD3FDA4]  DEFAULT (NULL),
	[email] [nvarchar](50) NULL,
	[remark] [nvarchar](255) NULL,
	[create_time] [int] NULL,
	[update_time] [int] NULL,
	[status] [int] NULL CONSTRAINT [DF__nbers_use__statu__1BC821DD]  DEFAULT ('0'),
	[type_id] [int] NULL CONSTRAINT [DF__nbers_use__type___1CBC4616]  DEFAULT ('0'),
	[info] [text] NULL,
	[phone] [nvarchar](11) NULL,
	[is_admin] [tinyint] NULL,
	[unit_id] [int] NULL,
	[isdisable] [tinyint] NULL,
 CONSTRAINT [PK__nbers_us__3213E83F5D436D18] PRIMARY KEY CLUSTERED 
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
SET IDENTITY_INSERT [dbo].[nbers_articles] ON 

INSERT [dbo].[nbers_articles] ([id], [title], [art_type], [fkguid], [content], [istop], [status], [create_date], [createby], [create_user], [ispublish], [remark], [description]) VALUES (1, N'23131', N'岗位职责', NULL, N'<em>312313</em><u><em></em></u>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[nbers_articles] ([id], [title], [art_type], [fkguid], [content], [istop], [status], [create_date], [createby], [create_user], [ispublish], [remark], [description]) VALUES (2, N'习近平谈新闻舆论工作:治国理政 定国安邦的大事', N'岗位职责', NULL, N'<p class="MsoNormal" align="left">
	广州奥晨节前反馈了一个问题，当审批人收到协商的回复意见消息后，打开是只读模式，客户希望这种情况应该是可以继续审批的。这个问题是他们老大使用移动审批反馈的，我们认为需求合理，检查代码后发现需要<span>PC</span>小小的改动一下。 <span></span>
</p>
<p class="MsoNormal">
	<span>&nbsp;</span>
</p>
<p class="MsoNormal">
	<span>&nbsp;</span>
</p>
<p class="MsoNormal">
	总结：现在有二个问题<span></span>
</p>
<p class="MsoNormal">
	第一个问题：这个问题是<span>BUG</span>
</p>
<p class="MsoNormal">
	<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>原因：流程中多次发起协商给同一个人时，当此人回复协商后，会产生多条回复协商的消息<span></span>
</p>
<p class="MsoNormal">
	<span>&nbsp;</span>
</p>
<p class="MsoNormal">
	第二问题：客户希望回复协商以后，可以在回复协商的消息中点击进去直接处理流程
而是已查看模式进入<span>&nbsp; </span>这个点只需要调整下消息模式由通知变成待办就行<span></span>
</p>', NULL, NULL, CAST(N'2016-11-08 22:20:43.903' AS DateTime), 1, N'管理员AA', NULL, NULL, NULL)
INSERT [dbo].[nbers_articles] ([id], [title], [art_type], [fkguid], [content], [istop], [status], [create_date], [createby], [create_user], [ispublish], [remark], [description]) VALUES (3, N'外交部:有关国家不得向“港独”势力提供任何支持', N'岗位职责', NULL, N'<p>
	<img src="http://cms-bucket.nosdn.127.net/catchpic/1/18/1850adf675b082997ee00b56e8fbf9c8.jpg?imageView&thumbnail=550x0" alt="" />
</p>
<p>
	<p style="font-size:18px;text-indent:2em;font-family:&quot;color:#404040;text-align:justify;background-color:#FFFFFF;">
		资料图片
	</p>
	<p style="font-size:18px;text-indent:2em;font-family:&quot;color:#404040;text-align:justify;background-color:#FFFFFF;">
		<strong>人民日报记者 黄发红</strong>
	</p>
	<p style="font-size:18px;text-indent:2em;font-family:&quot;color:#404040;text-align:justify;background-color:#FFFFFF;">
		外交部发言人陆慷在8日举行的例行记者会上表示，港独”势力企图分裂国家，并公开寻求外部支持，我们要求有关国家遵守自己的公开承诺，谨言慎行，不得干预香港特区内部事务，不得向“港独”势力提供任何支持。
	</p>
	<p style="font-size:18px;text-indent:2em;font-family:&quot;color:#404040;text-align:justify;background-color:#FFFFFF;">
		有记者问，7日，英国外交部发言人称，英方承认中国全国人大常委会对香港基本法拥有解释权，同时对香港立法会近期动向以及人大常委会在此时决定释法表示关切。美国国务院发言人称，美方对近期香港立法会的相关动向感到失望，强烈支持香港立法会和独立司法机构。中方对上述言论有何评论?
	</p>
	<p style="font-size:18px;text-indent:2em;font-family:&quot;color:#404040;text-align:justify;background-color:#FFFFFF;">
		陆慷回答，全国人大常委会通过对香港基本法第104条的解释后，中国相关部门已就释法的必要性合理性作了详细的公开说明，我在此不再重复。
	</p>
	<p style="font-size:18px;text-indent:2em;font-family:&quot;color:#404040;text-align:justify;background-color:#FFFFFF;">
		陆慷强调，香港是中国的特别行政区，香港事务属于中国内政，全国人大释法是依法行使基本法赋予的权力，履行宪制责任，这完全是中国主权范围内的事，任何外国无权干涉。“港独”势力企图分裂国家，并公开寻求外部支持，他们的恶劣行径才是对“一国两制”的最大威胁。我们要求有关国家遵守自己的公开承诺，谨言慎行，不得干预香港特区内部事务，不得向“港独”势力提供任何支持。
	</p>
</p>', NULL, NULL, CAST(N'2016-11-08 22:59:02.323' AS DateTime), 1, N'管理员AA', NULL, NULL, NULL)
INSERT [dbo].[nbers_articles] ([id], [title], [art_type], [fkguid], [content], [istop], [status], [create_date], [createby], [create_user], [ispublish], [remark], [description]) VALUES (4, N'test', N'岗位职责', NULL, N'<p>
<pre class="prettyprint lang-js">//渲染文件名称为超链接  add by wonder4 2016年11月5日15:41:23
        function g_render4name(rowdata, index, colvalue) {
            var docname = colvalue.length &gt; 50 ? colvalue.substr(0, 50) +"...": colvalue;
            return "&lt;a href=''../Components/NBersEditor/EditorView.aspx?oid=" + rowdata.id + " ''rel=''" + rowdata.id + " ''target=''_blank''&gt;" + docname + "&lt;/a&gt;";
        }</pre>
</p>', NULL, NULL, CAST(N'2016-11-08 23:00:42.697' AS DateTime), 1, N'管理员AA', NULL, NULL, NULL)
INSERT [dbo].[nbers_articles] ([id], [title], [art_type], [fkguid], [content], [istop], [status], [create_date], [createby], [create_user], [ispublish], [remark], [description]) VALUES (5, N'习近平与新闻工作者：那些难忘的瞬间', N'岗位职责', NULL, N'<h1 class="articleTitle" style="font-size:38px;font-family:&quot;background-color:#FFFFFF;">
	<span style="font-family:楷体;font-size:18px;background-color:#FFFFFF;"><span style="font-family:楷体;font-size:18px;background-color:#FFFFFF;">[学习进行时]11月8日是第十七个中国记者节。习近平一直十分关心新闻工作者，近1年间，在人民日报社、新华社、中央电视台等媒体调研考察时，他接触最多的就是一线编辑记者。一个个难忘的瞬间，浓缩着总书记对广大新闻工作者的关爱，也寄托着殷切期待。新华网《学习进行时》为您一一梳理。</span></span>
</h1>
<p>
	<span style="font-family:楷体;font-size:18px;background-color:#FFFFFF;"><strong><strong>看望获奖者，要求新闻工作者坚持“四向”</strong></strong><br />
</span>
</p>
<p style="text-align:center;">
	<span style="font-family:楷体;font-size:18px;background-color:#FFFFFF;"><strong><strong><img src="http://images.china.cn/attachement/jpg/site1000/20161109/b8aeed9902c8198cb65e35.jpg" alt="" /><br />
</strong></strong></span>
</p>
<p style="text-align:left;">
	<span style="font-family:楷体;font-size:18px;background-color:#FFFFFF;"><strong><strong>
	<p style="font-family:&quot;font-size:18px;background-color:#FFFFFF;text-indent:30px;">
		<span>2016年11月7日，党和国家领导人习近平、刘云山等在北京人民大会堂会见中华全国新闻工作者协会第九届理事会全体代表和中国新闻奖、长江韬奋奖获奖者代表。新华社记者李学仁摄</span>
	</p>
	<p style="font-family:&quot;font-size:18px;background-color:#FFFFFF;text-indent:30px;">
		在第十七个中国记者节到来之际，习近平亲切会见中国记协第九届理事会全体代表和中国新闻奖、长江韬奋奖获奖者代表。他充分肯定新闻工作者为党的新闻舆论工作作出的重大贡献，深情地说“同志们工作很辛苦、很有成效，党和人民感谢你们”。
	</p>
	<p style="font-family:&quot;font-size:18px;background-color:#FFFFFF;text-indent:30px;">
		<strong>他要求广大新闻工作者坚持“四向”：</strong>
	</p>
	<p style="font-family:&quot;font-size:18px;background-color:#FFFFFF;text-indent:30px;">
		坚持正确政治方向，同党中央保持高度一致，坚持马克思主义新闻观，坚守党和人民立场，坚持中国特色社会主义，做政治坚定的新闻工作者。
	</p>
	<p style="font-family:&quot;font-size:18px;background-color:#FFFFFF;text-indent:30px;">
		坚持正确舆论导向，深入宣传党的理论和路线方针政策，深入宣传全国各族人民为实现“两个一百年”奋斗目标、实现中华民族伟大复兴中国梦进行的奋斗和取得的成就，弘扬主旋律，释放正能量，做引领时代的新闻工作者。
	</p>
	<p style="font-family:&quot;font-size:18px;background-color:#FFFFFF;text-indent:30px;">
		坚持正确新闻志向，提高业务水平，勇于改进创新，不断自我提高、自我完善，做业务精湛的新闻工作者。
	</p>
	<p style="font-family:&quot;font-size:18px;background-color:#FFFFFF;text-indent:30px;">
		坚持正确工作取向，以人民为中心，心系人民、讴歌人民，发扬职业精神，恪守职业道德，勤奋工作、甘于奉献，做作风优良的新闻工作者。一句话，就是要做党和人民信赖的新闻工作者。
	</p>
	<p style="font-family:&quot;font-size:18px;background-color:#FFFFFF;text-indent:30px;">
		<strong>贺新华社建社85周年，肯定新华社与人民同呼吸、与时代共进步</strong>
	</p>
	<p style="font-family:&quot;font-size:18px;background-color:#FFFFFF;text-indent:30px;">
		11月5日，在新华社建社85周年前夕，习近平专门发来贺信，代表党中央向新华社全体同志致以热烈的祝贺。在贺信中，习近平充分肯定了85年来新华社在宣传党的主张，反映群众呼声，为党团结带领全国各族人民不断取得革命、建设、改革重大胜利作出的重要贡献，并对新形势下新华社工作提出要求。
	</p>
	<p style="font-family:&quot;font-size:18px;background-color:#FFFFFF;text-indent:30px;">
		习近平强调，新形势下，新华社要不忘初心、继续前进，坚定不移跟党走，牢牢把握正确政治方向和舆论导向，传承红色基因，弘扬优良传统，锐意改革创新，加快融合发展，扩大对外交流，加快建设国际一流的新型世界性通讯社，更好服务于党和国家工作大局，更好服务于广大人民群众，不负党和人民重托。
	</p>
	<p style="font-family:&quot;font-size:18px;background-color:#FFFFFF;text-indent:30px;">
		<strong>到三家中央媒体调研，与新闻工作者座谈</strong>
	</p>
	<p style="font-family:&quot;font-size:18px;background-color:#FFFFFF;text-indent:30px;">
		2016年2月19日上午，习近平先后来到人民日报社、新华社、中央电视台三家中央媒体调研。他看展览、听汇报，实地体验新闻传播创新方法手段，与一线新闻工作者亲切交流。下午，习近平主持召开党的新闻舆论工作座谈会，认真听取三家央媒负责人和编辑、记者、主持人代表的发言，对新闻工作者提出希望和要求。
	</p>
<br />
</strong></strong></span>
</p>', NULL, NULL, CAST(N'2016-11-09 23:36:39.407' AS DateTime), 1, N'管理员AA', NULL, NULL, NULL)
INSERT [dbo].[nbers_articles] ([id], [title], [art_type], [fkguid], [content], [istop], [status], [create_date], [createby], [create_user], [ispublish], [remark], [description]) VALUES (6, N' 234dasfadf', N'分类一', NULL, N'dfadfafas', NULL, NULL, CAST(N'2016-11-12 01:38:10.597' AS DateTime), 1, N'管理员AA', NULL, NULL, NULL)
INSERT [dbo].[nbers_articles] ([id], [title], [art_type], [fkguid], [content], [istop], [status], [create_date], [createby], [create_user], [ispublish], [remark], [description]) VALUES (7, N' 234dasfadf', N'分类一', NULL, N'dfadfafas', NULL, NULL, CAST(N'2016-11-12 01:38:19.953' AS DateTime), 1, N'管理员AA', NULL, NULL, NULL)
INSERT [dbo].[nbers_articles] ([id], [title], [art_type], [fkguid], [content], [istop], [status], [create_date], [createby], [create_user], [ispublish], [remark], [description]) VALUES (8, N'adfasdfas', N'岗位职责', NULL, N'asdfasf', NULL, NULL, CAST(N'2016-11-12 01:39:47.023' AS DateTime), 1, N'管理员AA', NULL, NULL, NULL)
INSERT [dbo].[nbers_articles] ([id], [title], [art_type], [fkguid], [content], [istop], [status], [create_date], [createby], [create_user], [ispublish], [remark], [description]) VALUES (9, N'让职场人从此远离哮喘', N'岗位职责', NULL, N'<p>
	<span style="font-family:Arial, 宋体;font-size:16px;background-color:#FFFFFF;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;立冬刚过，哮喘这个冬季高发病即将开始迸发。自由地呼吸对于哮喘患者来讲是一种奢望，谢霆锋、郑秀文、何润东、朱孝天这些在舞台上光鲜亮丽的明星们都有过痛苦的患病经历，而一代歌后邓丽君、亚洲飞人柯受良，影视导演于晓阳更是被哮喘夺走了生命。除了遗传、感染等因素外，工作中过度劳累、情绪波动、特殊职业以及季节、环境等都会诱发哮喘的发作。哮喘也有职场偏好，它的发作是一个非常难受的过程，甚至非常危险，那可怕的哮喘到底能否除根呢？</span>
</p>
<p style="text-align:center;">
	<span style="font-family:Arial, 宋体;font-size:16px;background-color:#FFFFFF;"><img src="http://p1.img.cctvpic.com/photoworkspace/contentimg/2016/11/10/2016111011134355059.png" alt="" /><br />
</span>
</p>
<p style="text-align:left;">
	<span style="font-family:Arial, 宋体;font-size:16px;background-color:#FFFFFF;"><span style="font-family:Arial, 宋体;font-size:16px;background-color:#FFFFFF;">　本周六，北京大学人民医院呼吸与危重症医学科主任医师马艳良将到《职场健康课》带您一起打开“哮喘”这把锁。</span><br />
<br />
<span style="font-family:Arial, 宋体;font-size:16px;background-color:#FFFFFF;">　　哮喘，通俗地讲，就是过敏引起的气道慢性炎症，是一种常见的呼吸系统疾病。过敏原刺激气道发炎，引起气管变窄，还被分泌的黏液挤占。因为缺氧，人会大口喘气，导致二氧化碳过度地排出，引起呼吸性的碱中毒、酸中毒，甚至引发心跳骤停或呼吸衰竭。</span><br />
</span>
</p>', NULL, NULL, CAST(N'2016-11-12 01:41:59.203' AS DateTime), 1, N'管理员AA', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[nbers_articles] OFF
SET IDENTITY_INSERT [dbo].[nbers_Attachments] ON 

INSERT [dbo].[nbers_Attachments] ([id], [DocName], [FkGUID], [CreateBy], [CreateUser], [CreateOn], [FileName], [Location], [Filesize], [URL], [DocType], [Remarks]) VALUES (10, N'jqueryapi.zip', 123456, 1, N'管理员AA', CAST(N'2016-11-09 21:08:06.793' AS DateTime), N'131231704867930523(9758).zip', N'/UpFiles/201611/', N'2301904', NULL, N'上级来文', NULL)
INSERT [dbo].[nbers_Attachments] ([id], [DocName], [FkGUID], [CreateBy], [CreateUser], [CreateOn], [FileName], [Location], [Filesize], [URL], [DocType], [Remarks]) VALUES (11, N'Font-Awesome-3.2.1.zip', 123456, 1, N'管理员AA', CAST(N'2016-11-09 21:08:34.773' AS DateTime), N'131231705147737763(5707).zip', N'/UpFiles/201611/', N'994312', NULL, N'上级来文', NULL)
INSERT [dbo].[nbers_Attachments] ([id], [DocName], [FkGUID], [CreateBy], [CreateUser], [CreateOn], [FileName], [Location], [Filesize], [URL], [DocType], [Remarks]) VALUES (12, N'01 标准化需求集成方案V1.4.xlsx', 123456, 1, N'管理员AA', CAST(N'2016-11-09 21:08:43.507' AS DateTime), N'131231705235081087(9174).xlsx', N'/UpFiles/201611/', N'2765412', NULL, N'上级来文', NULL)
SET IDENTITY_INSERT [dbo].[nbers_Attachments] OFF
SET IDENTITY_INSERT [dbo].[nbers_businessunit] ON 

INSERT [dbo].[nbers_businessunit] ([id], [unit_name], [unit_fullname], [pid], [unit_type], [child_type], [unit_auditorname], [unit_auditor], [createby], [createon], [unit_figure], [unit_duty], [remark]) VALUES (1, N'安质管理工程局', N'1231', NULL, 0, N'农电', NULL, NULL, 1, CAST(N'2016-11-01 23:55:01.677' AS DateTime), N'3123', N'312', NULL)
INSERT [dbo].[nbers_businessunit] ([id], [unit_name], [unit_fullname], [pid], [unit_type], [child_type], [unit_auditorname], [unit_auditor], [createby], [createon], [unit_figure], [unit_duty], [remark]) VALUES (2, N'质量管理部', N'3132131', 1, 1, N'农电', NULL, NULL, 1, CAST(N'2016-11-01 23:55:15.193' AS DateTime), N'312', N'32', NULL)
INSERT [dbo].[nbers_businessunit] ([id], [unit_name], [unit_fullname], [pid], [unit_type], [child_type], [unit_auditorname], [unit_auditor], [createby], [createon], [unit_figure], [unit_duty], [remark]) VALUES (3, N'安全管理部', N'安全管理部', 1, 1, N'农电', NULL, NULL, 1, CAST(N'2016-11-03 19:55:41.077' AS DateTime), N'312', N'123', NULL)
INSERT [dbo].[nbers_businessunit] ([id], [unit_name], [unit_fullname], [pid], [unit_type], [child_type], [unit_auditorname], [unit_auditor], [createby], [createon], [unit_figure], [unit_duty], [remark]) VALUES (4, N'主任', N'3', 3, 2, N'农电', NULL, NULL, 1, CAST(N'2016-11-03 21:05:06.847' AS DateTime), N'123', N'312', NULL)
INSERT [dbo].[nbers_businessunit] ([id], [unit_name], [unit_fullname], [pid], [unit_type], [child_type], [unit_auditorname], [unit_auditor], [createby], [createon], [unit_figure], [unit_duty], [remark]) VALUES (5, N'副主任', N'3131231', 3, 2, N'长工', NULL, NULL, 1, CAST(N'2016-11-03 22:37:36.327' AS DateTime), N'3123', N'31231', NULL)
INSERT [dbo].[nbers_businessunit] ([id], [unit_name], [unit_fullname], [pid], [unit_type], [child_type], [unit_auditorname], [unit_auditor], [createby], [createon], [unit_figure], [unit_duty], [remark]) VALUES (6, N'安质专责', NULL, 3, 2, NULL, NULL, NULL, NULL, CAST(N'2016-11-03 21:05:06.847' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[nbers_businessunit] ([id], [unit_name], [unit_fullname], [pid], [unit_type], [child_type], [unit_auditorname], [unit_auditor], [createby], [createon], [unit_figure], [unit_duty], [remark]) VALUES (7, N'综合专责', NULL, 3, 2, NULL, NULL, NULL, NULL, CAST(N'2016-11-03 21:05:06.847' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[nbers_businessunit] ([id], [unit_name], [unit_fullname], [pid], [unit_type], [child_type], [unit_auditorname], [unit_auditor], [createby], [createon], [unit_figure], [unit_duty], [remark]) VALUES (8, N'测试部门', NULL, 1, 1, NULL, NULL, NULL, NULL, CAST(N'2016-11-03 21:05:06.847' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[nbers_businessunit] ([id], [unit_name], [unit_fullname], [pid], [unit_type], [child_type], [unit_auditorname], [unit_auditor], [createby], [createon], [unit_figure], [unit_duty], [remark]) VALUES (19, N'新增部门', N'新增部门_1103', 1, 1, N'农电', NULL, NULL, 1, CAST(N'2016-11-03 21:24:12.893' AS DateTime), N'阿飞士大夫撒旦发', N'企鹅企鹅', NULL)
INSERT [dbo].[nbers_businessunit] ([id], [unit_name], [unit_fullname], [pid], [unit_type], [child_type], [unit_auditorname], [unit_auditor], [createby], [createon], [unit_figure], [unit_duty], [remark]) VALUES (20, N'新增岗位', N'新增岗位_1103', 19, 2, N'农电', NULL, NULL, 1, CAST(N'2016-11-03 21:24:52.357' AS DateTime), N'qrqwr', N'rqerwerqerw', NULL)
SET IDENTITY_INSERT [dbo].[nbers_businessunit] OFF
SET IDENTITY_INSERT [dbo].[nbers_node] ON 

INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (1, 1, 0, N'系统设置', NULL, NULL, NULL, 1, 1, N'system', N'1', 0)
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (2, 1, 1, N'用户管理', N'/UserManage/UserIndex.aspx', NULL, N'', 2, 1, N'system', N'1', 0)
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (3, 1, 1, N'角色管理', N'/SystemManage/RoleIndex.aspx?nodeid=3', NULL, NULL, 2, 2, N'system', N'1', 0)
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (4, 1, 0, N'基础信息', NULL, NULL, NULL, 1, 2, N'base', N'1', 0)
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (5, 1, 4, N'部门管理', N'/UserManage/UnitIndex.aspx?nodeid=5', NULL, NULL, 2, 1, N'base', N'1', 0)
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
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (18, 1, 4, N'用户管理', N'/UserManage/UserIndex.aspx?nodeid=18', NULL, N'', 2, 2, N'base', N'1', 0)
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (20, 1, 4, N'岗位管理', N'/UserManage/StationIndex.aspx?nodeid=20', NULL, NULL, 2, 1, N'base', N'1', 0)
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (22, 1, 0, N'部门管理', N'', NULL, N'', 1, 4, N'unit', N'1', 0)
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (23, 1, 22, N'上级来文', N'/UnitManage/PaperOfSuperior.aspx?nodeid=23', NULL, N'', 2, 5, N'unit', N'1', 0)
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (25, 1, 22, N'工作总结', N'/UnitManage/WorkSummary.aspx?nodeid=25', NULL, N'', 1, 2, N'unit', N'1', 0)
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (26, 1, 0, N'部门概况', N'', NULL, N'', 1, 3, N'unit_decription', N'1', 0)
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (27, 1, 26, N'岗位职责', N'', NULL, N'', 2, 3, N'unit_decription', N'1', 0)
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (28, 1, 22, N'绩效考核', N'', NULL, N'', 2, 1, N'unit', N'1', 0)
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (29, 1, 22, N'工作计划', N'', NULL, N'', 2, 3, N'unit', N'1', 0)
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (30, 1, 22, N'管理制度', N'', NULL, N'', 2, 4, N'unit', N'1', 0)
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (31, 1, 0, N'安全管理', N'', NULL, N'', 1, 5, N'anquan', N'1', 0)
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (32, 1, 31, N'安全稽查', N'', NULL, N'', 2, 1, N'anquan', N'1', 0)
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (33, NULL, 26, N'形象及宗旨', N'', NULL, N'', 2, 1, N'unit_decription', N'1', 0)
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (34, NULL, 26, N'部门职责', N'', NULL, N'', 2, 2, N'unit_decription', N'1', 0)
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (36, NULL, 26, N'公司网络安全图', N'', NULL, N'', 2, 4, N'unit_decription', N'1', 0)
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (37, NULL, 31, N'安全例会', N'', NULL, N'', 2, 2, N'anquan', N'1', 0)
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (38, NULL, 31, N'考试考核', N'', NULL, N'', 2, 3, N'anquan', N'1', 0)
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (39, NULL, 31, N'教育培训', N'', NULL, N'', 2, 4, N'anquan', N'1', 0)
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (40, NULL, 31, N'资质审核', N'', NULL, N'', 2, 5, N'anquan', N'1', 0)
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (41, NULL, 31, N'交通安全', N'', NULL, N'', 2, 6, N'anquan', N'1', 0)
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (42, NULL, 0, N'质量管理', N'', NULL, N'', 1, 6, N'qm', N'1', 1)
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (43, NULL, 0, N'分公司管控', N'', NULL, N'', 1, 7, N'fgs', N'1', 0)
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (44, NULL, 42, N'三体系建设', N'', NULL, N'', 2, 1, N'qm', N'1', 0)
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (45, NULL, 43, N'岗位人员信息', N'', NULL, N'', 2, 1, N'fgs', N'1', 0)
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (46, NULL, 43, N'安全稽查通报', N'', NULL, N'', 2, 2, N'fgs', N'1', 0)
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (47, NULL, 43, N'工器具配置标准', N'', NULL, N'', 2, 3, N'fgs', N'1', 0)
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (48, NULL, 43, N'工器具管理评价', N'', NULL, N'', 2, 4, N'fgs', N'1', 0)
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (49, NULL, 43, N'分公司考核兑现', N'', NULL, N'', 2, 5, N'fgs', N'1', 0)
SET IDENTITY_INSERT [dbo].[nbers_node] OFF
SET IDENTITY_INSERT [dbo].[nbers_role] ON 

INSERT [dbo].[nbers_role] ([id], [name], [status]) VALUES (1, N'管理员', 1)
INSERT [dbo].[nbers_role] ([id], [name], [status]) VALUES (2, N'系统测试员', 1)
SET IDENTITY_INSERT [dbo].[nbers_role] OFF
SET IDENTITY_INSERT [dbo].[nbers_role_user] ON 

INSERT [dbo].[nbers_role_user] ([id], [role_id], [user_id]) VALUES (8, 1, 1)
INSERT [dbo].[nbers_role_user] ([id], [role_id], [user_id]) VALUES (9, 2, 2)
INSERT [dbo].[nbers_role_user] ([id], [role_id], [user_id]) VALUES (10, 2, 3)
INSERT [dbo].[nbers_role_user] ([id], [role_id], [user_id]) VALUES (11, 2, 4)
SET IDENTITY_INSERT [dbo].[nbers_role_user] OFF
SET IDENTITY_INSERT [dbo].[nbers_user] ON 

INSERT [dbo].[nbers_user] ([id], [account], [nickname], [password], [bind_account], [last_login_time], [last_login_ip], [login_count], [verify], [email], [remark], [create_time], [update_time], [status], [type_id], [info], [phone], [is_admin], [unit_id], [isdisable]) VALUES (1, N'admin', N'管理员AA', N'21232F297A57A5A743894A0E4A801FC3', N'', 1326335612, N'127.0.0.1', 888, N'8888', N'liu21st@gmail.com', N'备注信息', 1222907803, 1326266696, 1, 0, N'2312', N'231', NULL, 4, NULL)
INSERT [dbo].[nbers_user] ([id], [account], [nickname], [password], [bind_account], [last_login_time], [last_login_ip], [login_count], [verify], [email], [remark], [create_time], [update_time], [status], [type_id], [info], [phone], [is_admin], [unit_id], [isdisable]) VALUES (2, N'demo', N'演示', N'fe01ce2a7fbac8fafaed7c982a04e229', N'', 1254326091, N'127.0.0.1', 90, N'8888', N'', N'', 1239783735, 1254325770, 1, 0, N'', N'231', NULL, 7, NULL)
INSERT [dbo].[nbers_user] ([id], [account], [nickname], [password], [bind_account], [last_login_time], [last_login_ip], [login_count], [verify], [email], [remark], [create_time], [update_time], [status], [type_id], [info], [phone], [is_admin], [unit_id], [isdisable]) VALUES (3, N'member', N'员工', N'aa08769cdcb26674c6706093503ff0a3', N'', 1326266720, N'127.0.0.1', 17, N'', N'', N'', 1253514375, 1254325728, 1, 0, N'', N'0', NULL, 5, NULL)
INSERT [dbo].[nbers_user] ([id], [account], [nickname], [password], [bind_account], [last_login_time], [last_login_ip], [login_count], [verify], [email], [remark], [create_time], [update_time], [status], [type_id], [info], [phone], [is_admin], [unit_id], [isdisable]) VALUES (4, N'leader', N'领导', N'c444858e0aaeb727da73d2eae62321ad', N'', 1254325906, N'127.0.0.1', 15, N'', N'', N'领导', 1253514575, 1254325705, 1, 0, N'', N'231', NULL, 20, NULL)
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
