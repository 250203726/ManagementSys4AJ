USE [N_Bers_aj]
GO
/****** Object:  Table [dbo].[nbers_access]    Script Date: 2016/11/8 23:02:37 ******/
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
/****** Object:  Table [dbo].[nbers_articles]    Script Date: 2016/11/8 23:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nbers_articles]
    (
      [id] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [title] [NVARCHAR](100) NULL ,
      [art_type] [NVARCHAR](50) NULL ,
      [fkguid] [INT] NULL ,
      [content] [NTEXT] NULL ,
      [istop] [TINYINT] NULL ,
      [status] [INT] NULL ,
      [create_date] [DATETIME] NULL ,
      [createby] [INT] NULL ,
      [create_user] [NVARCHAR](50) NULL ,
      [ispublish] [TINYINT] NULL ,
      [remark] [TEXT] NULL ,
      [description] [NVARCHAR](500) NULL
    )
ON  [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[nbers_Attachments]    Script Date: 2016/11/8 23:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nbers_Attachments]
    (
      [id] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [DocName] [NVARCHAR](120) NULL ,
      [FkGUID] [INT] NULL ,
      [CreateBy] [INT] NULL ,
      [CreateUser] [NVARCHAR](20) NULL ,
      [CreateOn] [DATETIME] NULL ,
      [FileName] [NVARCHAR](300) NULL ,
      [Location] [NVARCHAR](300) NULL ,
      [Filesize] [NVARCHAR](MAX) NULL ,
      [URL] [NVARCHAR](200) NULL ,
      [DocType] [NVARCHAR](100) NULL ,
      [Remarks] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_nbers_Attachments] PRIMARY KEY CLUSTERED ( [id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[nbers_businessunit]    Script Date: 2016/11/8 23:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nbers_businessunit]
    (
      [id] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [unit_name] [NVARCHAR](100) NOT NULL ,
      [unit_fullname] [NVARCHAR](500) NULL ,
      [pid] [INT] NULL ,
      [unit_type] [INT] NULL ,
      [child_type] [NVARCHAR](50) NULL ,
      [unit_auditorname] [NVARCHAR](50) NULL ,
      [unit_auditor] [INT] NULL ,
      [createby] [INT] NULL ,
      [createon] [DATETIME] NULL ,
      [unit_figure] [TEXT] NULL ,
      [unit_duty] [TEXT] NULL ,
      [remark] [NVARCHAR](50) NULL ,
      CONSTRAINT [PK__nbers_bu__3213E83FD4BE07E6] PRIMARY KEY CLUSTERED
        ( [id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[nbers_form]    Script Date: 2016/11/8 23:02:37 ******/
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
/****** Object:  Table [dbo].[nbers_group]    Script Date: 2016/11/8 23:02:37 ******/
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
/****** Object:  Table [dbo].[nbers_node]    Script Date: 2016/11/8 23:02:37 ******/
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
      [version] [BIGINT] NULL ,
      [parentId] [INT] NOT NULL ,
      [name] [NVARCHAR](20) NOT NULL ,
      [url] [VARCHAR](500) NULL ,
      [params] [VARCHAR](200) NULL ,
      [icon] [VARCHAR](200) NULL ,
      [levels] [INT] NULL ,
      [sortCode] [INT] NULL ,
      [moduleId] [VARCHAR](32) NULL ,
      [enable] [VARCHAR](11) NULL ,
      [group_id] [INT] NULL ,
      PRIMARY KEY CLUSTERED ( [id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[nbers_role]    Script Date: 2016/11/8 23:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nbers_role]
    (
      [id] [INT] IDENTITY(0, 1)
                 NOT NULL ,
      [name] [NVARCHAR](20) NOT NULL ,
      [status] [INT] NULL ,
      PRIMARY KEY CLUSTERED ( [id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY]

GO
/****** Object:  Table [dbo].[nbers_role_user]    Script Date: 2016/11/8 23:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nbers_role_user]
    (
      [id] [INT] IDENTITY(0, 1)
                 NOT NULL ,
      [role_id] [INT] NULL ,
      [user_id] [INT] NULL ,
      PRIMARY KEY CLUSTERED ( [id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY]

GO
/****** Object:  Table [dbo].[nbers_user]    Script Date: 2016/11/8 23:02:37 ******/
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
      [bind_account] [VARCHAR](50) NULL ,
      [last_login_time] [INT] NULL ,
      [last_login_ip] [VARCHAR](40) NULL ,
      [login_count] [INT] NULL ,
      [verify] [NVARCHAR](32) NULL ,
      [email] [NVARCHAR](50) NULL ,
      [remark] [NVARCHAR](255) NULL ,
      [create_time] [INT] NULL ,
      [update_time] [INT] NULL ,
      [status] [INT] NULL ,
      [type_id] [INT] NULL ,
      [info] [TEXT] NULL ,
      [phone] [NVARCHAR](11) NULL ,
      [is_admin] [TINYINT] NULL ,
      [unit_id] [INT] NULL ,
      [isdisable] [TINYINT] NULL ,
      CONSTRAINT [PK__nbers_us__3213E83F5D436D18] PRIMARY KEY CLUSTERED
        ( [id] ASC )
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
INSERT  [dbo].[nbers_access]
        ( [id], [role_id], [node_id] )
VALUES  ( 11, 1, 13 )
GO
INSERT  [dbo].[nbers_access]
        ( [id], [role_id], [node_id] )
VALUES  ( 12, 1, 14 )
GO
INSERT  [dbo].[nbers_access]
        ( [id], [role_id], [node_id] )
VALUES  ( 13, 1, 15 )
GO
INSERT  [dbo].[nbers_access]
        ( [id], [role_id], [node_id] )
VALUES  ( 14, 1, 17 )
GO
INSERT  [dbo].[nbers_access]
        ( [id], [role_id], [node_id] )
VALUES  ( 15, 1, 8 )
GO
INSERT  [dbo].[nbers_access]
        ( [id], [role_id], [node_id] )
VALUES  ( 16, 1, 9 )
GO
SET IDENTITY_INSERT [dbo].[nbers_access] OFF
GO
SET IDENTITY_INSERT [dbo].[nbers_articles] ON 

GO
INSERT  [dbo].[nbers_articles]
        ( [id] ,
          [title] ,
          [art_type] ,
          [fkguid] ,
          [content] ,
          [istop] ,
          [status] ,
          [create_date] ,
          [createby] ,
          [create_user] ,
          [ispublish] ,
          [remark] ,
          [description]
        )
VALUES  ( 1 ,
          N'23131' ,
          N'岗位职责' ,
          NULL ,
          N'<em>312313</em><u><em></em></u>' ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          NULL
        )
GO
INSERT  [dbo].[nbers_articles]
        ( [id] ,
          [title] ,
          [art_type] ,
          [fkguid] ,
          [content] ,
          [istop] ,
          [status] ,
          [create_date] ,
          [createby] ,
          [create_user] ,
          [ispublish] ,
          [remark] ,
          [description]
        )
VALUES  ( 2 ,
          N'习近平谈新闻舆论工作:治国理政 定国安邦的大事' ,
          N'岗位职责' ,
          NULL ,
          N'<p class="MsoNormal" align="left">
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
</p>' ,
          NULL ,
          NULL ,
          CAST(0x0000A6B801703E33 AS DATETIME) ,
          1 ,
          N'管理员AA' ,
          NULL ,
          NULL ,
          NULL
        )
GO
INSERT  [dbo].[nbers_articles]
        ( [id] ,
          [title] ,
          [art_type] ,
          [fkguid] ,
          [content] ,
          [istop] ,
          [status] ,
          [create_date] ,
          [createby] ,
          [create_user] ,
          [ispublish] ,
          [remark] ,
          [description]
        )
VALUES  ( 3 ,
          N'外交部:有关国家不得向“港独”势力提供任何支持' ,
          N'岗位职责' ,
          NULL ,
          N'<p>
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
</p>' ,
          NULL ,
          NULL ,
          CAST(0x0000A6B8017AC3A9 AS DATETIME) ,
          1 ,
          N'管理员AA' ,
          NULL ,
          NULL ,
          NULL
        )
GO
INSERT  [dbo].[nbers_articles]
        ( [id] ,
          [title] ,
          [art_type] ,
          [fkguid] ,
          [content] ,
          [istop] ,
          [status] ,
          [create_date] ,
          [createby] ,
          [create_user] ,
          [ispublish] ,
          [remark] ,
          [description]
        )
VALUES  ( 4 ,
          N'test' ,
          N'岗位职责' ,
          NULL ,
          N'<p>
<pre class="prettyprint lang-js">//渲染文件名称为超链接  add by wonder4 2016年11月5日15:41:23
        function g_render4name(rowdata, index, colvalue) {
            var docname = colvalue.length &gt; 50 ? colvalue.substr(0, 50) +"...": colvalue;
            return "&lt;a href=''../Components/NBersEditor/EditorView.aspx?oid=" + rowdata.id + " ''rel=''" + rowdata.id + " ''target=''_blank''&gt;" + docname + "&lt;/a&gt;";
        }</pre>
</p>' ,
          NULL ,
          NULL ,
          CAST(0x0000A6B8017B3949 AS DATETIME) ,
          1 ,
          N'管理员AA' ,
          NULL ,
          NULL ,
          NULL
        )
GO
SET IDENTITY_INSERT [dbo].[nbers_articles] OFF
GO
SET IDENTITY_INSERT [dbo].[nbers_Attachments] ON 

GO
INSERT  [dbo].[nbers_Attachments]
        ( [id] ,
          [DocName] ,
          [FkGUID] ,
          [CreateBy] ,
          [CreateUser] ,
          [CreateOn] ,
          [FileName] ,
          [Location] ,
          [Filesize] ,
          [URL] ,
          [DocType] ,
          [Remarks]
        )
VALUES  ( 1 ,
          N'jqueryapi.zip' ,
          123456 ,
          1 ,
          N'管理员AA' ,
          CAST(0x0000A6B701783FA7 AS DATETIME) ,
          N'131230037927677937(5090).zip' ,
          N'/UpFiles/201611/' ,
          N'2301904' ,
          NULL ,
          N'上级来文' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_Attachments]
        ( [id] ,
          [DocName] ,
          [FkGUID] ,
          [CreateBy] ,
          [CreateUser] ,
          [CreateOn] ,
          [FileName] ,
          [Location] ,
          [Filesize] ,
          [URL] ,
          [DocType] ,
          [Remarks]
        )
VALUES  ( 2 ,
          N'01 标准化需求集成方案V1.4.xlsx' ,
          123456 ,
          1 ,
          N'管理员AA' ,
          CAST(0x0000A6B7017893BE AS DATETIME) ,
          N'131230038645275728(3764).xlsx' ,
          N'/UpFiles/201611/' ,
          N'2765412' ,
          NULL ,
          N'上级来文' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_Attachments]
        ( [id] ,
          [DocName] ,
          [FkGUID] ,
          [CreateBy] ,
          [CreateUser] ,
          [CreateOn] ,
          [FileName] ,
          [Location] ,
          [Filesize] ,
          [URL] ,
          [DocType] ,
          [Remarks]
        )
VALUES  ( 3 ,
          N'jqueryapi.zip' ,
          123456 ,
          1 ,
          N'管理员AA' ,
          CAST(0x0000A6B7017918E1 AS DATETIME) ,
          N'131230039781349617(1423).zip' ,
          N'/UpFiles/201611/' ,
          N'2301904' ,
          NULL ,
          N'上级来文' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_Attachments]
        ( [id] ,
          [DocName] ,
          [FkGUID] ,
          [CreateBy] ,
          [CreateUser] ,
          [CreateOn] ,
          [FileName] ,
          [Location] ,
          [Filesize] ,
          [URL] ,
          [DocType] ,
          [Remarks]
        )
VALUES  ( 4 ,
          N'01 标准化需求集成方案V1.4.xlsx' ,
          123456 ,
          1 ,
          N'管理员AA' ,
          CAST(0x0000A6B701791E10 AS DATETIME) ,
          N'131230039825589902(2906).xlsx' ,
          N'/UpFiles/201611/' ,
          N'2765412' ,
          NULL ,
          N'上级来文' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_Attachments]
        ( [id] ,
          [DocName] ,
          [FkGUID] ,
          [CreateBy] ,
          [CreateUser] ,
          [CreateOn] ,
          [FileName] ,
          [Location] ,
          [Filesize] ,
          [URL] ,
          [DocType] ,
          [Remarks]
        )
VALUES  ( 5 ,
          N'admin.png' ,
          123456 ,
          1 ,
          N'管理员AA' ,
          CAST(0x0000A6B7017B4A1C AS DATETIME) ,
          N'131230044570547718(6981).png' ,
          N'/UpFiles/201611/' ,
          N'2330' ,
          NULL ,
          N'上级来文' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_Attachments]
        ( [id] ,
          [DocName] ,
          [FkGUID] ,
          [CreateBy] ,
          [CreateUser] ,
          [CreateOn] ,
          [FileName] ,
          [Location] ,
          [Filesize] ,
          [URL] ,
          [DocType] ,
          [Remarks]
        )
VALUES  ( 6 ,
          N'01 标准化需求集成方案V1.4.xlsx' ,
          123456 ,
          1 ,
          N'管理员AA' ,
          CAST(0x0000A6B800ACD7B7 AS DATETIME) ,
          N'131230457580336464(2864).xlsx' ,
          N'/UpFiles/201611/' ,
          N'2765412' ,
          NULL ,
          N'上级来文' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_Attachments]
        ( [id] ,
          [DocName] ,
          [FkGUID] ,
          [CreateBy] ,
          [CreateUser] ,
          [CreateOn] ,
          [FileName] ,
          [Location] ,
          [Filesize] ,
          [URL] ,
          [DocType] ,
          [Remarks]
        )
VALUES  ( 7 ,
          N'Font-Awesome-3.2.1.zip' ,
          123456 ,
          1 ,
          N'管理员AA' ,
          CAST(0x0000A6B800AD1366 AS DATETIME) ,
          N'131230458089774059(8799).zip' ,
          N'/UpFiles/201611/' ,
          N'994312' ,
          NULL ,
          N'上级来文' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_Attachments]
        ( [id] ,
          [DocName] ,
          [FkGUID] ,
          [CreateBy] ,
          [CreateUser] ,
          [CreateOn] ,
          [FileName] ,
          [Location] ,
          [Filesize] ,
          [URL] ,
          [DocType] ,
          [Remarks]
        )
VALUES  ( 8 ,
          N'jqueryapi.zip' ,
          123456 ,
          1 ,
          N'管理员AA' ,
          CAST(0x0000A6B800AD1382 AS DATETIME) ,
          N'131230458090743143(5069).zip' ,
          N'/UpFiles/201611/' ,
          N'2301904' ,
          NULL ,
          N'上级来文' ,
          NULL
        )
GO
SET IDENTITY_INSERT [dbo].[nbers_Attachments] OFF
GO
SET IDENTITY_INSERT [dbo].[nbers_businessunit] ON 

GO
INSERT  [dbo].[nbers_businessunit]
        ( [id] ,
          [unit_name] ,
          [unit_fullname] ,
          [pid] ,
          [unit_type] ,
          [child_type] ,
          [unit_auditorname] ,
          [unit_auditor] ,
          [createby] ,
          [createon] ,
          [unit_figure] ,
          [unit_duty] ,
          [remark]
        )
VALUES  ( 1 ,
          N'安质管理工程局' ,
          N'1231' ,
          NULL ,
          0 ,
          N'农电' ,
          NULL ,
          NULL ,
          1 ,
          CAST(0x0000A6B1018A2467 AS DATETIME) ,
          N'3123' ,
          N'312' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_businessunit]
        ( [id] ,
          [unit_name] ,
          [unit_fullname] ,
          [pid] ,
          [unit_type] ,
          [child_type] ,
          [unit_auditorname] ,
          [unit_auditor] ,
          [createby] ,
          [createon] ,
          [unit_figure] ,
          [unit_duty] ,
          [remark]
        )
VALUES  ( 2 ,
          N'质量管理部' ,
          N'3132131' ,
          1 ,
          1 ,
          N'农电' ,
          NULL ,
          NULL ,
          1 ,
          CAST(0x0000A6B1018A343E AS DATETIME) ,
          N'312' ,
          N'32' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_businessunit]
        ( [id] ,
          [unit_name] ,
          [unit_fullname] ,
          [pid] ,
          [unit_type] ,
          [child_type] ,
          [unit_auditorname] ,
          [unit_auditor] ,
          [createby] ,
          [createon] ,
          [unit_figure] ,
          [unit_duty] ,
          [remark]
        )
VALUES  ( 3 ,
          N'安全管理部' ,
          N'安全管理部' ,
          1 ,
          1 ,
          N'农电' ,
          NULL ,
          NULL ,
          1 ,
          CAST(0x0000A6B301486793 AS DATETIME) ,
          N'312' ,
          N'123' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_businessunit]
        ( [id] ,
          [unit_name] ,
          [unit_fullname] ,
          [pid] ,
          [unit_type] ,
          [child_type] ,
          [unit_auditorname] ,
          [unit_auditor] ,
          [createby] ,
          [createon] ,
          [unit_figure] ,
          [unit_duty] ,
          [remark]
        )
VALUES  ( 4 ,
          N'主任' ,
          N'3' ,
          3 ,
          2 ,
          N'农电' ,
          NULL ,
          NULL ,
          1 ,
          CAST(0x0000A6B3015B7956 AS DATETIME) ,
          N'123' ,
          N'312' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_businessunit]
        ( [id] ,
          [unit_name] ,
          [unit_fullname] ,
          [pid] ,
          [unit_type] ,
          [child_type] ,
          [unit_auditorname] ,
          [unit_auditor] ,
          [createby] ,
          [createon] ,
          [unit_figure] ,
          [unit_duty] ,
          [remark]
        )
VALUES  ( 5 ,
          N'副主任' ,
          N'3131231' ,
          3 ,
          2 ,
          N'长工' ,
          NULL ,
          NULL ,
          1 ,
          CAST(0x0000A6B30174E0A2 AS DATETIME) ,
          N'3123' ,
          N'31231' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_businessunit]
        ( [id] ,
          [unit_name] ,
          [unit_fullname] ,
          [pid] ,
          [unit_type] ,
          [child_type] ,
          [unit_auditorname] ,
          [unit_auditor] ,
          [createby] ,
          [createon] ,
          [unit_figure] ,
          [unit_duty] ,
          [remark]
        )
VALUES  ( 6 ,
          N'安质专责' ,
          NULL ,
          3 ,
          2 ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          CAST(0x0000A6B3015B7956 AS DATETIME) ,
          NULL ,
          NULL ,
          NULL
        )
GO
INSERT  [dbo].[nbers_businessunit]
        ( [id] ,
          [unit_name] ,
          [unit_fullname] ,
          [pid] ,
          [unit_type] ,
          [child_type] ,
          [unit_auditorname] ,
          [unit_auditor] ,
          [createby] ,
          [createon] ,
          [unit_figure] ,
          [unit_duty] ,
          [remark]
        )
VALUES  ( 7 ,
          N'综合专责' ,
          NULL ,
          3 ,
          2 ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          CAST(0x0000A6B3015B7956 AS DATETIME) ,
          NULL ,
          NULL ,
          NULL
        )
GO
INSERT  [dbo].[nbers_businessunit]
        ( [id] ,
          [unit_name] ,
          [unit_fullname] ,
          [pid] ,
          [unit_type] ,
          [child_type] ,
          [unit_auditorname] ,
          [unit_auditor] ,
          [createby] ,
          [createon] ,
          [unit_figure] ,
          [unit_duty] ,
          [remark]
        )
VALUES  ( 8 ,
          N'测试部门' ,
          NULL ,
          1 ,
          1 ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          CAST(0x0000A6B3015B7956 AS DATETIME) ,
          NULL ,
          NULL ,
          NULL
        )
GO
INSERT  [dbo].[nbers_businessunit]
        ( [id] ,
          [unit_name] ,
          [unit_fullname] ,
          [pid] ,
          [unit_type] ,
          [child_type] ,
          [unit_auditorname] ,
          [unit_auditor] ,
          [createby] ,
          [createon] ,
          [unit_figure] ,
          [unit_duty] ,
          [remark]
        )
VALUES  ( 19 ,
          N'新增部门' ,
          N'新增部门_1103' ,
          1 ,
          1 ,
          N'农电' ,
          NULL ,
          NULL ,
          1 ,
          CAST(0x0000A6B30160B85C AS DATETIME) ,
          N'阿飞士大夫撒旦发' ,
          N'企鹅企鹅' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_businessunit]
        ( [id] ,
          [unit_name] ,
          [unit_fullname] ,
          [pid] ,
          [unit_type] ,
          [child_type] ,
          [unit_auditorname] ,
          [unit_auditor] ,
          [createby] ,
          [createon] ,
          [unit_figure] ,
          [unit_duty] ,
          [remark]
        )
VALUES  ( 20 ,
          N'新增岗位' ,
          N'新增岗位_1103' ,
          19 ,
          2 ,
          N'农电' ,
          NULL ,
          NULL ,
          1 ,
          CAST(0x0000A6B30160E69B AS DATETIME) ,
          N'qrqwr' ,
          N'rqerwerqerw' ,
          NULL
        )
GO
SET IDENTITY_INSERT [dbo].[nbers_businessunit] OFF
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
          N'' ,
          2 ,
          1 ,
          N'system' ,
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
VALUES  ( 3 ,
          1 ,
          1 ,
          N'角色管理' ,
          N'/SystemManage/RoleIndex.aspx?nodeid=3' ,
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
          N'部门管理' ,
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
          N'新增' ,
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
          N'编辑' ,
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
          N'新增' ,
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
          N'编辑' ,
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
          3 ,
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
VALUES  ( 13 ,
          1 ,
          1 ,
          N'菜单管理' ,
          N'/SystemManage/MenuIndex.aspx?nodeid=13' ,
          NULL ,
          NULL ,
          2 ,
          3 ,
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
VALUES  ( 14 ,
          1 ,
          13 ,
          N'新增' ,
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
VALUES  ( 15 ,
          1 ,
          13 ,
          N'编辑' ,
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
VALUES  ( 17 ,
          1 ,
          13 ,
          N'删除' ,
          NULL ,
          NULL ,
          NULL ,
          0 ,
          3 ,
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
VALUES  ( 18 ,
          1 ,
          4 ,
          N'用户管理' ,
          N'/UserManage/UserIndex.aspx?nodeid=18' ,
          NULL ,
          N'' ,
          2 ,
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
VALUES  ( 20 ,
          1 ,
          4 ,
          N'岗位管理' ,
          N'/UserManage/StationIndex.aspx?nodeid=20' ,
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
VALUES  ( 22 ,
          1 ,
          0 ,
          N'部门管理' ,
          NULL ,
          NULL ,
          NULL ,
          1 ,
          3 ,
          N'unit' ,
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
VALUES  ( 23 ,
          1 ,
          22 ,
          N'上级来文' ,
          N'/UnitManage/PaperOfSuperior.aspx?nodeid=23' ,
          NULL ,
          NULL ,
          2 ,
          1 ,
          N'unit' ,
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
VALUES  ( 24 ,
          NULL ,
          4 ,
          N'31' ,
          N'1231' ,
          NULL ,
          N'' ,
          0 ,
          NULL ,
          N'1' ,
          N'1' ,
          0
        )
GO
SET IDENTITY_INSERT [dbo].[nbers_node] OFF
GO
SET IDENTITY_INSERT [dbo].[nbers_role] ON 

GO
INSERT  [dbo].[nbers_role]
        ( [id], [name], [status] )
VALUES  ( 1, N'管理员', 1 )
GO
INSERT  [dbo].[nbers_role]
        ( [id], [name], [status] )
VALUES  ( 2, N'系统测试员', 1 )
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
          [info] ,
          [phone] ,
          [is_admin] ,
          [unit_id] ,
          [isdisable]
        )
VALUES  ( 1 ,
          N'admin' ,
          N'管理员AA' ,
          N'21232F297A57A5A743894A0E4A801FC3' ,
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
          N'2312' ,
          N'231' ,
          NULL ,
          4 ,
          NULL
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
          [info] ,
          [phone] ,
          [is_admin] ,
          [unit_id] ,
          [isdisable]
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
          N'' ,
          N'231' ,
          NULL ,
          7 ,
          NULL
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
          [info] ,
          [phone] ,
          [is_admin] ,
          [unit_id] ,
          [isdisable]
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
          N'' ,
          N'0' ,
          NULL ,
          5 ,
          NULL
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
          [info] ,
          [phone] ,
          [is_admin] ,
          [unit_id] ,
          [isdisable]
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
          N'' ,
          N'231' ,
          NULL ,
          20 ,
          NULL
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
ALTER TABLE [dbo].[nbers_node] ADD  DEFAULT (NULL) FOR [version]
GO
ALTER TABLE [dbo].[nbers_node] ADD  DEFAULT (NULL) FOR [params]
GO
ALTER TABLE [dbo].[nbers_node] ADD  DEFAULT (NULL) FOR [icon]
GO
ALTER TABLE [dbo].[nbers_node] ADD  DEFAULT ('0') FOR [levels]
GO
ALTER TABLE [dbo].[nbers_node] ADD  DEFAULT (NULL) FOR [sortCode]
GO
ALTER TABLE [dbo].[nbers_node] ADD  DEFAULT (NULL) FOR [moduleId]
GO
ALTER TABLE [dbo].[nbers_node] ADD  DEFAULT (NULL) FOR [enable]
GO
ALTER TABLE [dbo].[nbers_node] ADD  DEFAULT ('0') FOR [group_id]
GO
ALTER TABLE [dbo].[nbers_role] ADD  DEFAULT (NULL) FOR [status]
GO
ALTER TABLE [dbo].[nbers_role_user] ADD  DEFAULT (NULL) FOR [role_id]
GO
ALTER TABLE [dbo].[nbers_role_user] ADD  DEFAULT (NULL) FOR [user_id]
GO
ALTER TABLE [dbo].[nbers_user] ADD  CONSTRAINT [DF__nbers_use__last___17F790F9]  DEFAULT ('0') FOR [last_login_time]
GO
ALTER TABLE [dbo].[nbers_user] ADD  CONSTRAINT [DF__nbers_use__last___18EBB532]  DEFAULT (NULL) FOR [last_login_ip]
GO
ALTER TABLE [dbo].[nbers_user] ADD  CONSTRAINT [DF__nbers_use__login__19DFD96B]  DEFAULT ('0') FOR [login_count]
GO
ALTER TABLE [dbo].[nbers_user] ADD  CONSTRAINT [DF__nbers_use__verif__1AD3FDA4]  DEFAULT (NULL) FOR [verify]
GO
ALTER TABLE [dbo].[nbers_user] ADD  CONSTRAINT [DF__nbers_use__statu__1BC821DD]  DEFAULT ('0') FOR [status]
GO
ALTER TABLE [dbo].[nbers_user] ADD  CONSTRAINT [DF__nbers_use__type___1CBC4616]  DEFAULT ('0') FOR [type_id]
GO
