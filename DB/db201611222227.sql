USE [N_Bers_aj]
GO
ALTER TABLE [dbo].[nbers_user] DROP CONSTRAINT [DF__nbers_use__type___1CBC4616]
GO
ALTER TABLE [dbo].[nbers_user] DROP CONSTRAINT [DF__nbers_use__statu__1BC821DD]
GO
ALTER TABLE [dbo].[nbers_user] DROP CONSTRAINT [DF__nbers_use__verif__1AD3FDA4]
GO
ALTER TABLE [dbo].[nbers_user] DROP CONSTRAINT [DF__nbers_use__login__19DFD96B]
GO
ALTER TABLE [dbo].[nbers_user] DROP CONSTRAINT [DF__nbers_use__last___18EBB532]
GO
ALTER TABLE [dbo].[nbers_user] DROP CONSTRAINT [DF__nbers_use__last___17F790F9]
GO
ALTER TABLE [dbo].[nbers_role_user] DROP CONSTRAINT [DF__nbers_rol__user___4959E263]
GO
ALTER TABLE [dbo].[nbers_role_user] DROP CONSTRAINT [DF__nbers_rol__role___4865BE2A]
GO
ALTER TABLE [dbo].[nbers_role] DROP CONSTRAINT [DF__nbers_rol__statu__4589517F]
GO
ALTER TABLE [dbo].[nbers_node] DROP CONSTRAINT [DF__nbers_nod__group__0B91BA14]
GO
ALTER TABLE [dbo].[nbers_node] DROP CONSTRAINT [DF__nbers_nod__enabl__0A9D95DB]
GO
ALTER TABLE [dbo].[nbers_node] DROP CONSTRAINT [DF__nbers_nod__modul__09A971A2]
GO
ALTER TABLE [dbo].[nbers_node] DROP CONSTRAINT [DF__nbers_nod__sortC__08B54D69]
GO
ALTER TABLE [dbo].[nbers_node] DROP CONSTRAINT [DF__nbers_nod__level__07C12930]
GO
ALTER TABLE [dbo].[nbers_node] DROP CONSTRAINT [DF__nbers_node__icon__06CD04F7]
GO
ALTER TABLE [dbo].[nbers_node] DROP CONSTRAINT [DF__nbers_nod__param__05D8E0BE]
GO
ALTER TABLE [dbo].[nbers_node] DROP CONSTRAINT [DF_nbers_node_parentId]
GO
ALTER TABLE [dbo].[nbers_node] DROP CONSTRAINT [DF__nbers_nod__versi__04E4BC85]
GO
ALTER TABLE [dbo].[nbers_netmap] DROP CONSTRAINT [DF_nbers_netmap_node_guid]
GO
ALTER TABLE [dbo].[nbers_group] DROP CONSTRAINT [DF__nbers_grou__show__54CB950F]
GO
ALTER TABLE [dbo].[nbers_group] DROP CONSTRAINT [DF__nbers_grou__sort__53D770D6]
GO
ALTER TABLE [dbo].[nbers_group] DROP CONSTRAINT [DF__nbers_gro__statu__52E34C9D]
GO
ALTER TABLE [dbo].[nbers_group] DROP CONSTRAINT [DF__nbers_gro__updat__51EF2864]
GO
/****** Object:  Table [dbo].[nbers_user]    Script Date: 2016/11/22 22:27:06 ******/
DROP TABLE [dbo].[nbers_user]
GO
/****** Object:  Table [dbo].[nbers_role_user]    Script Date: 2016/11/22 22:27:06 ******/
DROP TABLE [dbo].[nbers_role_user]
GO
/****** Object:  Table [dbo].[nbers_role]    Script Date: 2016/11/22 22:27:06 ******/
DROP TABLE [dbo].[nbers_role]
GO
/****** Object:  Table [dbo].[nbers_node]    Script Date: 2016/11/22 22:27:06 ******/
DROP TABLE [dbo].[nbers_node]
GO
/****** Object:  Table [dbo].[nbers_netmap]    Script Date: 2016/11/22 22:27:06 ******/
DROP TABLE [dbo].[nbers_netmap]
GO
/****** Object:  Table [dbo].[nbers_group]    Script Date: 2016/11/22 22:27:06 ******/
DROP TABLE [dbo].[nbers_group]
GO
/****** Object:  Table [dbo].[nbers_form]    Script Date: 2016/11/22 22:27:06 ******/
DROP TABLE [dbo].[nbers_form]
GO
/****** Object:  Table [dbo].[nbers_businessunit]    Script Date: 2016/11/22 22:27:06 ******/
DROP TABLE [dbo].[nbers_businessunit]
GO
/****** Object:  Table [dbo].[nbers_Attachments]    Script Date: 2016/11/22 22:27:06 ******/
DROP TABLE [dbo].[nbers_Attachments]
GO
/****** Object:  Table [dbo].[nbers_articles]    Script Date: 2016/11/22 22:27:06 ******/
DROP TABLE [dbo].[nbers_articles]
GO
/****** Object:  Table [dbo].[nbers_access]    Script Date: 2016/11/22 22:27:06 ******/
DROP TABLE [dbo].[nbers_access]
GO
/****** Object:  Table [dbo].[nbers_access]    Script Date: 2016/11/22 22:27:06 ******/
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
/****** Object:  Table [dbo].[nbers_articles]    Script Date: 2016/11/22 22:27:06 ******/
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
/****** Object:  Table [dbo].[nbers_Attachments]    Script Date: 2016/11/22 22:27:06 ******/
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
/****** Object:  Table [dbo].[nbers_businessunit]    Script Date: 2016/11/22 22:27:06 ******/
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
/****** Object:  Table [dbo].[nbers_form]    Script Date: 2016/11/22 22:27:06 ******/
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
/****** Object:  Table [dbo].[nbers_group]    Script Date: 2016/11/22 22:27:06 ******/
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
/****** Object:  Table [dbo].[nbers_netmap]    Script Date: 2016/11/22 22:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nbers_netmap]
    (
      [node_guid] [UNIQUEIDENTIFIER] NOT NULL ,
      [node_name] [NVARCHAR](50) NOT NULL ,
      [station_name] [NVARCHAR](50) NULL ,
      [auditor] [NVARCHAR](50) NULL ,
      [sort_order] [INT] NULL ,
      [parentguid] [UNIQUEIDENTIFIER] NULL ,
      [remark] [NVARCHAR](50) NULL
    )
ON  [PRIMARY]

GO
/****** Object:  Table [dbo].[nbers_node]    Script Date: 2016/11/22 22:27:06 ******/
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
      CONSTRAINT [PK__nbers_no__3213E83FB171BB38] PRIMARY KEY CLUSTERED
        ( [id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[nbers_role]    Script Date: 2016/11/22 22:27:06 ******/
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
/****** Object:  Table [dbo].[nbers_role_user]    Script Date: 2016/11/22 22:27:06 ******/
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
/****** Object:  Table [dbo].[nbers_user]    Script Date: 2016/11/22 22:27:06 ******/
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
VALUES  ( 6, 2, 4 )
GO
INSERT  [dbo].[nbers_access]
        ( [id], [role_id], [node_id] )
VALUES  ( 7, 2, 5 )
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
VALUES  ( 5 ,
          N'习近平与新闻工作者：那些难忘的瞬间' ,
          N'岗位职责' ,
          NULL ,
          N'<h1 class="articleTitle" style="font-size:38px;font-family:&quot;background-color:#FFFFFF;">
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
</p>' ,
          NULL ,
          NULL ,
          CAST(0x0000A6B9018518AE AS DATETIME) ,
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
VALUES  ( 6 ,
          N' 234dasfadf' ,
          N'分类一' ,
          NULL ,
          N'dfadfafas' ,
          NULL ,
          NULL ,
          CAST(0x0000A6BC001AF70B AS DATETIME) ,
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
VALUES  ( 7 ,
          N' 234dasfadf' ,
          N'分类一' ,
          NULL ,
          N'dfadfafas' ,
          NULL ,
          NULL ,
          CAST(0x0000A6BC001B0202 AS DATETIME) ,
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
VALUES  ( 8 ,
          N'adfasdfas' ,
          N'岗位职责' ,
          NULL ,
          N'asdfasf' ,
          NULL ,
          NULL ,
          CAST(0x0000A6BC001B680B AS DATETIME) ,
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
VALUES  ( 9 ,
          N'让职场人从此远离哮喘' ,
          N'岗位职责' ,
          NULL ,
          N'<p>
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
</p>' ,
          NULL ,
          NULL ,
          CAST(0x0000A6BC001C02F1 AS DATETIME) ,
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
VALUES  ( 10 ,
          N'- 1 -    2012年个人工作总结' ,
          N'工作总结' ,
          NULL ,
          N'<div class="mod reader-page complex reader-page-1" style="margin:0px 0px 6px;padding:0px;border:1px solid #D3D3D3;background-color:#FFFFFF;">
	<div class="inner" style="margin:0px 5px;padding:0px;">
		<div class="bd" id="pageNo-1" style="margin:0px;padding:0px;">
			<div class="reader-parent-d3c8d03b83c4bb4cf7ecd16b reader-parent " style="margin:0px;padding:0px;">
				<div class="reader-wrapd3c8d03b83c4bb4cf7ecd16b" style="margin:0px;padding:0px;">
					<div class="reader-main-d3c8d03b83c4bb4cf7ecd16b" style="margin:0px;padding:0px;">
						<div class="reader-txt-layer" style="margin:0px;padding:0px;">
							<div class="ie-fix" style="margin:0px;padding:0px;">
								<p class="reader-word-layer reader-word-s1-2" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0020001, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">2012</span>
								</p>
								<p class="reader-word-layer reader-word-s1-5" style="font-size:256px;font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030001, 仿宋_GB2312;">
									<span style="font-size:10px;">年，是安全生产年，是我项目大干的一年，也是我</span>
								</p>
								<p class="reader-word-layer reader-word-s1-5" style="font-size:256px;font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030001, 仿宋_GB2312;">
									<span style="font-size:10px;">项目开展以来重中之重的一年，同样也是我工作生涯中重要</span>
								</p>
								<p class="reader-word-layer reader-word-s1-7" style="font-size:256px;font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030001, 仿宋_GB2312;">
									<span style="font-size:10px;">的一年。一年中，在领导的关心鼓励下，我努力学习拓展业</span>
								</p>
								<p class="reader-word-layer reader-word-s1-5" style="font-size:256px;font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030001, 仿宋_GB2312;">
									<span style="font-size:10px;">务知识，配合部长工作，确保了我分部所有工点在</span>
								</p>
								<p class="reader-word-layer reader-word-s1-8" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0020001, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">2012</span>
								</p>
								<p class="reader-word-layer reader-word-s1-5" style="font-size:256px;font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030001, 仿宋_GB2312;">
									<span style="font-size:10px;">年</span>
								</p>
								<p class="reader-word-layer reader-word-s1-7" style="font-size:256px;font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030001, 仿宋_GB2312;">
									<span style="font-size:10px;">度内的安全、质量可控，完成了年初时制定的安全、质量目</span>
								</p>
								<p class="reader-word-layer reader-word-s1-9" style="font-size:256px;font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030001, 仿宋_GB2312;">
									<span style="font-size:10px;">标。我在安质部主要负责内业资料整理完善及配合部长做好</span>
								</p>
								<p class="reader-word-layer reader-word-s1-5" style="font-size:256px;font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030001, 仿宋_GB2312;">
									<span style="font-size:10px;">施工现场安全、质量监督检查工作，现将本人</span>
								</p>
								<p class="reader-word-layer reader-word-s1-8" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0020001, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">2012</span>
								</p>
								<p class="reader-word-layer reader-word-s1-5" style="font-size:256px;font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030001, 仿宋_GB2312;">
									<span style="font-size:10px;">年工作</span>
								</p>
								<p class="reader-word-layer reader-word-s1-10" style="font-size:256px;font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030001, 仿宋_GB2312;">
									<span style="font-size:10px;">情况总结如下：</span>
								</p>
								<p class="reader-word-layer reader-word-s1-2" style="font-family:simsun;font-size:256px;">
									<span style="font-size:10px;">&nbsp;</span>
								</p>
								<p class="reader-word-layer reader-word-s1-11" style="font-weight:600;font-size:256px;font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030001, 仿宋_GB2312;">
									<span style="font-size:10px;">一、</span>
								</p>
								<p class="reader-word-layer reader-word-s1-12" style="font-weight:600;font-size:256px;font-family:simsun;">
									<span style="font-size:10px;">&nbsp;</span>
								</p>
								<p class="reader-word-layer reader-word-s1-11" style="font-weight:600;font-size:256px;font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030001, 仿宋_GB2312;">
									<span style="font-size:10px;">内业资料方面</span>
								</p>
								<p class="reader-word-layer reader-word-s1-1" style="font-weight:600;font-family:simsun;font-size:256px;">
									<span style="font-size:10px;">&nbsp;</span>
								</p>
								<p class="reader-word-layer reader-word-s1-10" style="font-size:256px;font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030001, 仿宋_GB2312;">
									<span style="font-size:10px;">新的一年新的开始，从</span>
								</p>
								<p class="reader-word-layer reader-word-s1-8" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0020001, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">2012</span>
								</p>
								<p class="reader-word-layer reader-word-s1-5" style="font-size:256px;font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030001, 仿宋_GB2312;">
									<span style="font-size:10px;">年始，部长就教导我“一</span>
								</p>
								<p class="reader-word-layer reader-word-s1-9" style="font-size:256px;font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030001, 仿宋_GB2312;">
									<span style="font-size:10px;">个安质部人员工作能力好坏的评定，很大一部分取决于其内</span>
								</p>
								<p class="reader-word-layer reader-word-s1-5" style="font-size:256px;font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030001, 仿宋_GB2312;">
									<span style="font-size:10px;">业资料整理完善的好坏。</span>
								</p>
								<p class="reader-word-layer reader-word-s1-5" style="font-size:256px;font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030001, 仿宋_GB2312;">
									<span style="font-size:10px;">”一年中，在部长的指导帮助下，</span>
								</p>
								<p class="reader-word-layer reader-word-s1-5" style="font-size:256px;font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030001, 仿宋_GB2312;">
									<span style="font-size:10px;">我重点加强了自己的内业资料整理能力的学习：资料的分类</span>
								</p>
								<p class="reader-word-layer reader-word-s1-5" style="font-size:256px;font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030001, 仿宋_GB2312;">
									<span style="font-size:10px;">归档，建立卷内目录；各类检查的规范回复；项目安全质量</span>
								</p>
								<p class="reader-word-layer reader-word-s1-7" style="font-size:256px;font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030001, 仿宋_GB2312;">
									<span style="font-size:10px;">管理文件的编写，开展的各类活动过程资料的收集、整理与</span>
								</p>
								<p class="reader-word-layer reader-word-s1-7" style="font-size:256px;font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030001, 仿宋_GB2312;">
									<span style="font-size:10px;">总结；危险源的辨识与评估；应急预案的编写；各类安全质</span>
								</p>
								<p class="reader-word-layer reader-word-s1-5" style="font-size:256px;font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030001, 仿宋_GB2312;">
									<span style="font-size:10px;">量交底与培训材料的编写；特殊工种与特种设备资料的收集</span>
								</p>
								<p class="reader-word-layer reader-word-s1-7" style="font-size:256px;font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030001, 仿宋_GB2312;">
									<span style="font-size:10px;">整理；各类安全质量台账的建立等。经过一年的努力，在内</span>
								</p>
								<p class="reader-word-layer reader-word-s1-5" style="font-size:256px;font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030001, 仿宋_GB2312;">
									<span style="font-size:10px;">业资料整理与完善方面，较上一年有了很大的提高。</span>
								</p>
								<p class="reader-word-layer reader-word-s1-2" style="font-family:simsun;font-size:256px;">
									<span style="font-size:10px;">&nbsp;</span>
								</p>
								<p class="reader-word-layer reader-word-s1-11" style="font-weight:600;font-size:256px;font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030001, 仿宋_GB2312;">
									<span style="font-size:10px;">二、</span>
								</p>
								<p class="reader-word-layer reader-word-s1-12" style="font-weight:600;font-size:256px;font-family:simsun;">
									<span style="font-size:10px;">&nbsp;</span>
								</p>
								<p class="reader-word-layer reader-word-s1-6" style="font-weight:600;font-size:256px;font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030001, 仿宋_GB2312;">
									<span style="font-size:10px;">现场安全质量监督检查方面</span>
								</p>
								<p class="reader-word-layer reader-word-s1-1" style="font-weight:600;font-family:simsun;font-size:256px;">
									<span style="font-size:10px;">&nbsp;</span>
								</p>
								<p class="reader-word-layer reader-word-s1-2" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0020001, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">2012</span>
								</p>
								<p class="reader-word-layer reader-word-s1-10" style="font-size:256px;font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030001, 仿宋_GB2312;">
									<span style="font-size:10px;">年我项目各工点全面“开花”</span>
								</p>
								<p class="reader-word-layer reader-word-s1-5" style="font-size:256px;font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030001, 仿宋_GB2312;">
									<span style="font-size:10px;">，大干的热情燃烧着</span>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="html-reader-banner-3" class="banner-wrap" style="margin:0px auto 6px;padding:0px;border:1px solid #DEDEDE;">
	<div id="wkad21" style="margin:0px auto;padding:0px;">
		<div class="baichuan-slot" style="margin:0px;padding:0px;">
			<iframe id="ifrId_1434618420266_0" width="0" height="0" frameborder="0" style="width:960px;height:90px;">
			</iframe>
		</div>
	</div>
</div>
<div class="mod reader-page complex reader-page-2" style="margin:0px 0px 6px;padding:0px;border:1px solid #D3D3D3;background-color:#FFFFFF;">
	<div class="inner" style="margin:0px 5px;padding:0px;">
		<div class="bd" id="pageNo-2" style="margin:0px;padding:0px;">
			<div class="reader-parent-d3c8d03b83c4bb4cf7ecd16b reader-parent " style="margin:0px;padding:0px;">
				<div class="reader-wrapd3c8d03b83c4bb4cf7ecd16b" style="margin:0px;padding:0px;">
					<div class="reader-main-d3c8d03b83c4bb4cf7ecd16b" style="margin:0px;padding:0px;">
						<div class="reader-txt-layer" style="margin:0px;padding:0px;">
							<div class="ie-fix" style="margin:0px;padding:0px;">
								<p class="reader-word-layer reader-word-s2-11" style="font-family:Calibri, d3c8d03b83c4bb4cf7ecd16b0010002, Calibri;font-size:144px;">
									<span style="font-size:10px;">-&nbsp;2&nbsp;-&nbsp;</span>
								</p>
								<p class="reader-word-layer reader-word-s2-11" style="font-family:simsun;font-size:144px;">
									<span style="font-size:10px;">&nbsp;</span>
								</p>
								<p class="reader-word-layer reader-word-s2-2" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030002, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">着每一个参建者。</span>
								</p>
								<p class="reader-word-layer reader-word-s2-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030002, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">特别是我项目跨高速公路连续梁</span>
								</p>
								<p class="reader-word-layer reader-word-s2-4" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030002, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">（悬臂法）</span>
								</p>
								<p class="reader-word-layer reader-word-s2-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030002, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">、</span>
								</p>
								<p class="reader-word-layer reader-word-s2-5" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030002, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">跨既有铁路及</span>
								</p>
								<p class="reader-word-layer reader-word-s2-6" style="font-size:256px;font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0020002, 仿宋_GB2312;">
									<span style="font-size:10px;">320</span>
								</p>
								<p class="reader-word-layer reader-word-s2-4" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030002, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">国道连续梁</span>
								</p>
								<p class="reader-word-layer reader-word-s2-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030002, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">（悬臂法）</span>
								</p>
								<p class="reader-word-layer reader-word-s2-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030002, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">、</span>
								</p>
								<p class="reader-word-layer reader-word-s2-5" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030002, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">跨村道连续梁</span>
								</p>
								<p class="reader-word-layer reader-word-s2-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030002, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">（支</span>
								</p>
								<p class="reader-word-layer reader-word-s2-7" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030002, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">架现浇）进入到了关键阶段，路基施工也已全面开展，工点</span>
								</p>
								<p class="reader-word-layer reader-word-s2-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030002, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">多，战线长，工期紧，工艺复杂，施工难度大，安全质量隐</span>
								</p>
								<p class="reader-word-layer reader-word-s2-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030002, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">患多，现场安全、质量监督检查压力大，我也倍感压力，对</span>
								</p>
								<p class="reader-word-layer reader-word-s2-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030002, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">自己没有信心。年初时，项目领导及部长及时对我进行思想</span>
								</p>
								<p class="reader-word-layer reader-word-s2-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030002, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">上的疏导和鼓励，使我对新一年的工作开展充满了信心，一</span>
								</p>
								<p class="reader-word-layer reader-word-s2-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030002, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">年中，我配合部长，积极响应、认真贯彻国家、集团公司、</span>
								</p>
								<p class="reader-word-layer reader-word-s2-7" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030002, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">局指及公司各项文件、通知要求，结合我项目实际情况，按</span>
								</p>
								<p class="reader-word-layer reader-word-s2-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030002, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">照“有制度可依、落实安全质量责任、加强施工过程监控、</span>
								</p>
								<p class="reader-word-layer reader-word-s2-7" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030002, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">问题整改落实到位”的工作步骤，扎实有效地完成自己的工</span>
								</p>
								<p class="reader-word-layer reader-word-s2-7" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030002, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">作。为连续梁的顺利合拢，铁路既有线施工的顺利结束，路</span>
								</p>
								<p class="reader-word-layer reader-word-s2-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030002, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">基挖方、填筑，付出了我应有的贡献。在部长的指导下，经</span>
								</p>
								<p class="reader-word-layer reader-word-s2-7" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030002, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">过一年的工作，也使我视野得到了进一步的开阔，学习到客</span>
								</p>
								<p class="reader-word-layer reader-word-s2-8" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030002, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">专建设施工工艺、施工过程的大量知识，积累了更多的现场</span>
								</p>
								<p class="reader-word-layer reader-word-s2-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030002, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">管理经验，对我职业生涯的发展提供了更坚实的基础。</span>
								</p>
								<p class="reader-word-layer reader-word-s2-6" style="font-size:256px;font-family:simsun;">
									<span style="font-size:10px;">&nbsp;</span>
								</p>
								<p class="reader-word-layer reader-word-s2-10" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030002, 仿宋_GB2312;font-size:256px;font-weight:600;">
									<span style="font-size:10px;">三、</span>
								</p>
								<p class="reader-word-layer reader-word-s2-9" style="font-size:256px;font-weight:600;font-family:simsun;">
									<span style="font-size:10px;">&nbsp;</span>
								</p>
								<p class="reader-word-layer reader-word-s2-10" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030002, 仿宋_GB2312;font-size:256px;font-weight:600;">
									<span style="font-size:10px;">协调沟通方面</span>
								</p>
								<p class="reader-word-layer reader-word-s2-6 reader-word-s2-9" style="font-size:256px;font-family:simsun;font-weight:600;">
									<span style="font-size:10px;">&nbsp;</span>
								</p>
								<p class="reader-word-layer reader-word-s2-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030002, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">经过部长的教导，使我意识到：安全质量工作不是一味</span>
								</p>
								<p class="reader-word-layer reader-word-s2-8" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030002, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">的埋头苦干，好的工作方法创造高的工作效率，良好的沟通</span>
								</p>
								<p class="reader-word-layer reader-word-s2-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030002, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">有利用工作的快速开展。</span>
								</p>
								<p class="reader-word-layer reader-word-s2-6" style="font-size:256px;font-family:simsun;">
									<span style="font-size:10px;">&nbsp;</span>
								</p>
								<p class="reader-word-layer reader-word-s2-6" style="font-size:256px;font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0020002, 仿宋_GB2312;">
									<span style="font-size:10px;">1</span>
								</p>
								<p class="reader-word-layer reader-word-s2-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030002, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">、</span>
								</p>
								<p class="reader-word-layer reader-word-s2-1" style="font-size:256px;font-family:simsun;">
									<span style="font-size:10px;">&nbsp;</span>
								</p>
								<p class="reader-word-layer reader-word-s2-2" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030002, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">与施工队伍的配合</span>
								</p>
								<p class="reader-word-layer reader-word-s2-6" style="font-size:256px;font-family:simsun;">
									<span style="font-size:10px;">&nbsp;</span>
								</p>
								<p class="reader-word-layer reader-word-s2-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030002, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">还记得刚参加工作时，我自以为安全质量工作就是管理</span>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="html-reader-AD-5" class="banner-wrap test" style="margin:0px auto 6px;padding:0px;border:1px solid #DEDEDE;">
	<div id="wkad21-2" style="margin:0px;padding:0px;text-align:center;">
		<iframe src="http://entry.baidu.com/rp/home?psid=u2572954&amp;pswidth=966&amp;psheight=120&amp;ifr=infr%3A1_cross%3A0_drs%3A3_pcs%3A1920x952_pss%3A1903x4201_cfv%3A0_cpl%3A26_chi%3A1_cce%3A1_cec%3AGBK_tlm%3A1479208746_ecd%3A1_adw%3Aundefinedxundefined&amp;di=u2572954&amp;rsi0=966&amp;rsi1=120&amp;title=2012%E5%B9%B4%E5%AE%89%E8%B4%A8%E9%83%A8%E4%B8%AA%E4%BA%BA%E5%B7%A5%E4%BD%9C%E6%80%BB%E7%BB%93_%E7%99%BE%E5%BA%A6%E6%96%87%E5%BA%93&amp;ref=https%3A%2F%2Fwww.baidu.com%2Flink%3Furl%3DxYyQvssmVYKpKh4vpCnGzYd4SNPVqfwognKMZKTqrdmuMiL28Vnc7mNqbd98Clx_TQmzng9tgPygVUz9LkI3xER12i4sgKZ5XGkXip3A2ou%26wd%3D%26eqid%3Dcbf9bc38000268a900000005582aef1e&amp;ltu=http%3A%2F%2Fwenku.baidu.com%2Flink%3Furl%3DxYyQvssmVYKpKh4vpCnGzYd4SNPVqfwognKMZKTqrdmuMiL28Vnc7mNqbd98Clx_TQmzng9tgPygVUz9LkI3xER12i4sgKZ5XGkXip3A2ou&amp;t=1479208746795" width="966" height="120" frameborder="0" style="width:966px;height:120px;">
		</iframe>
	</div>
</div>
<div class="mod reader-page complex reader-page-3" style="margin:0px 0px 6px;padding:0px;border:1px solid #D3D3D3;background-color:#FFFFFF;">
	<div class="inner" style="margin:0px 5px;padding:0px;">
		<div class="bd" id="pageNo-3" style="margin:0px;padding:0px;">
			<div class="reader-parent-d3c8d03b83c4bb4cf7ecd16b reader-parent " style="margin:0px;padding:0px;">
				<div class="reader-wrapd3c8d03b83c4bb4cf7ecd16b" style="margin:0px;padding:0px;">
					<div class="reader-main-d3c8d03b83c4bb4cf7ecd16b" style="margin:0px;padding:0px;">
						<div class="reader-txt-layer" style="margin:0px;padding:0px;">
							<div class="ie-fix" style="margin:0px;padding:0px;">
								<p class="reader-word-layer reader-word-s3-9" style="font-family:Calibri, d3c8d03b83c4bb4cf7ecd16b0010003, Calibri;font-size:144px;">
									<span style="font-size:10px;">-&nbsp;3&nbsp;-&nbsp;</span>
								</p>
								<p class="reader-word-layer reader-word-s3-9" style="font-family:simsun;font-size:144px;">
									<span style="font-size:10px;">&nbsp;</span>
								</p>
								<p class="reader-word-layer reader-word-s3-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030003, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">工作，是发号指令的，施工队伍应该是服从与配合我们的。</span>
								</p>
								<p class="reader-word-layer reader-word-s3-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030003, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">残酷的现实给了我沉重的打击，也是我百思不得其解。经过</span>
								</p>
								<p class="reader-word-layer reader-word-s3-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030003, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">领导的点拨，我终于明白：安全质量工作不仅仅是检查与罚</span>
								</p>
								<p class="reader-word-layer reader-word-s3-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030003, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">款，施工的开展也同样需要我们的支持和配合，要深入到一</span>
								</p>
								<p class="reader-word-layer reader-word-s3-3" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030003, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">线施工现场，更多的了解施工队伍施工情况。一年来，我及</span>
								</p>
								<p class="reader-word-layer reader-word-s3-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030003, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">时调整了自己的心态，了解了一线工人的知识水平，思想状</span>
								</p>
								<p class="reader-word-layer reader-word-s3-3" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030003, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">态，才能更好的进行安全质量交底培训，了解了施工工人的</span>
								</p>
								<p class="reader-word-layer reader-word-s3-3" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030003, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">实际困难，才能够好的进行监控，和施工队伍交心，才能让</span>
								</p>
								<p class="reader-word-layer reader-word-s3-4" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030003, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">问题整改更好的落实。</span>
								</p>
								<p class="reader-word-layer reader-word-s3-5" style="font-size:256px;font-family:simsun;">
									<span style="font-size:10px;">&nbsp;</span>
								</p>
								<p class="reader-word-layer reader-word-s3-5" style="font-size:256px;font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0020003, 仿宋_GB2312;">
									<span style="font-size:10px;">2</span>
								</p>
								<p class="reader-word-layer reader-word-s3-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030003, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">、</span>
								</p>
								<p class="reader-word-layer reader-word-s3-6" style="font-size:256px;font-family:simsun;">
									<span style="font-size:10px;">&nbsp;</span>
								</p>
								<p class="reader-word-layer reader-word-s3-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030003, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">与项目各部室的协调</span>
								</p>
								<p class="reader-word-layer reader-word-s3-5" style="font-size:256px;font-family:simsun;">
									<span style="font-size:10px;">&nbsp;</span>
								</p>
								<p class="reader-word-layer reader-word-s3-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030003, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">一年来，我重点加强了和其他部室的协调配合，在信息</span>
								</p>
								<p class="reader-word-layer reader-word-s3-3" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030003, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">的传达，问题的整改、物资的管理、资金的落实上有了很大</span>
								</p>
								<p class="reader-word-layer reader-word-s3-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030003, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">的提高，为更好的完成安全质量工作建立了有效的保障。</span>
								</p>
								<p class="reader-word-layer reader-word-s3-5" style="font-size:256px;font-family:simsun;">
									<span style="font-size:10px;">&nbsp;</span>
								</p>
								<p class="reader-word-layer reader-word-s3-5" style="font-size:256px;font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0020003, 仿宋_GB2312;">
									<span style="font-size:10px;">&nbsp;&nbsp;&nbsp;</span>
								</p>
								<p class="reader-word-layer reader-word-s3-8" style="font-size:256px;font-family:simsun;font-weight:600;">
									<span style="font-size:10px;">&nbsp;</span>
								</p>
								<p class="reader-word-layer reader-word-s3-0 reader-word-s3-7" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030003, 仿宋_GB2312;font-size:256px;font-weight:600;">
									<span style="font-size:10px;">四、工作中存在的不足</span>
								</p>
								<p class="reader-word-layer reader-word-s3-8" style="font-size:256px;font-family:simsun;font-weight:600;">
									<span style="font-size:10px;">&nbsp;</span>
								</p>
								<p class="reader-word-layer reader-word-s3-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030003, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">一年的工作即将结束，经过一年的努力，我的视野、知</span>
								</p>
								<p class="reader-word-layer reader-word-s3-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030003, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">识、工作能力得到了一定的提高，同时，我也对自己一年中</span>
								</p>
								<p class="reader-word-layer reader-word-s3-4" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030003, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">工作存在的不足进行了反思。</span>
								</p>
								<p class="reader-word-layer reader-word-s3-5" style="font-size:256px;font-family:simsun;">
									<span style="font-size:10px;">&nbsp;</span>
								</p>
								<p class="reader-word-layer reader-word-s3-5" style="font-size:256px;font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0020003, 仿宋_GB2312;">
									<span style="font-size:10px;">1</span>
								</p>
								<p class="reader-word-layer reader-word-s3-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030003, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">、</span>
								</p>
								<p class="reader-word-layer reader-word-s3-6" style="font-size:256px;font-family:simsun;">
									<span style="font-size:10px;">&nbsp;</span>
								</p>
								<p class="reader-word-layer reader-word-s3-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030003, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">工作中存在惰性思想</span>
								</p>
								<p class="reader-word-layer reader-word-s3-5" style="font-size:256px;font-family:simsun;">
									<span style="font-size:10px;">&nbsp;</span>
								</p>
								<p class="reader-word-layer reader-word-s3-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030003, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">有的时候在工地辛苦了一天，回到办公室后，没有好好</span>
								</p>
								<p class="reader-word-layer reader-word-s3-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030003, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">的总结整理资料，时常存在“明天再做吧”的思想，结果造</span>
								</p>
								<p class="reader-word-layer reader-word-s3-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030003, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">成了思想上的懒惰性。如安全质量日志的填写，在大干的过</span>
								</p>
								<p class="reader-word-layer reader-word-s3-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030003, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">程中，自己给自己找了理由，觉得此项工作不重要，领导也</span>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="html-reader-AD-3t4" class="banner-wrap hidden-doc-banner" style="margin:0px auto 6px;padding:0px;border:1px solid #DEDEDE;">
	<div class="baichuan-slot" style="margin:0px;padding:0px;">
		<iframe id="ifrId_1441526611557_0" width="0" height="0" frameborder="0" style="width:960px;height:90px;">
		</iframe>
	</div>
</div>
<div class="mod reader-page complex hidden-doc-banner reader-page-4" style="margin:0px 0px 6px;padding:0px;border:1px solid #D3D3D3;background-color:#FFFFFF;">
	<div class="inner" style="margin:0px 5px;padding:0px;">
		<div class="bd" id="pageNo-4" style="margin:0px;padding:0px;">
			<div class="reader-parent-d3c8d03b83c4bb4cf7ecd16b reader-parent " style="margin:0px;padding:0px;">
				<div class="reader-wrapd3c8d03b83c4bb4cf7ecd16b" style="margin:0px;padding:0px;">
					<div class="reader-main-d3c8d03b83c4bb4cf7ecd16b" style="margin:0px;padding:0px;">
						<div class="reader-txt-layer" style="margin:0px;padding:0px;">
							<div class="ie-fix" style="margin:0px;padding:0px;">
								<p class="reader-word-layer reader-word-s4-8" style="font-family:Calibri, d3c8d03b83c4bb4cf7ecd16b0010004, Calibri;font-size:144px;">
									<span style="font-size:10px;">-&nbsp;4&nbsp;-&nbsp;</span>
								</p>
								<p class="reader-word-layer reader-word-s4-8" style="font-family:simsun;font-size:144px;">
									<span style="font-size:10px;">&nbsp;</span>
								</p>
								<p class="reader-word-layer reader-word-s4-2" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030004, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">不会检查，所有就先不写了，过两天再说吧，结果造成全年</span>
								</p>
								<p class="reader-word-layer reader-word-s4-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030004, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">大部分的安全质量日志的空白。</span>
								</p>
								<p class="reader-word-layer reader-word-s4-4" style="font-size:256px;font-family:simsun;">
									<span style="font-size:10px;">&nbsp;</span>
								</p>
								<p class="reader-word-layer reader-word-s4-4" style="font-size:256px;font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0020004, 仿宋_GB2312;">
									<span style="font-size:10px;">2</span>
								</p>
								<p class="reader-word-layer reader-word-s4-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030004, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">、</span>
								</p>
								<p class="reader-word-layer reader-word-s4-5" style="font-size:256px;font-family:simsun;">
									<span style="font-size:10px;">&nbsp;</span>
								</p>
								<p class="reader-word-layer reader-word-s4-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030004, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">业内资料的应付了事</span>
								</p>
								<p class="reader-word-layer reader-word-s4-4" style="font-size:256px;font-family:simsun;">
									<span style="font-size:10px;">&nbsp;</span>
								</p>
								<p class="reader-word-layer reader-word-s4-6" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030004, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">由于自己的惰性及应付检查的思想，有一部分内业资料</span>
								</p>
								<p class="reader-word-layer reader-word-s4-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030004, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">存在缺乏真实性的现象。总是在上级检查来临之前加班加点，</span>
								</p>
								<p class="reader-word-layer reader-word-s4-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030004, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">进行业内资料的整理和编写，因为时效性问题，造成部分内</span>
								</p>
								<p class="reader-word-layer reader-word-s4-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030004, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">业资料缺乏真实性，不能完全的反映安全质量工作开展的情</span>
								</p>
								<p class="reader-word-layer reader-word-s4-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030004, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">况。如危险源的辨识等。</span>
								</p>
								<p class="reader-word-layer reader-word-s4-4" style="font-size:256px;font-family:simsun;">
									<span style="font-size:10px;">&nbsp;</span>
								</p>
								<p class="reader-word-layer reader-word-s4-4" style="font-size:256px;font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0020004, 仿宋_GB2312;">
									<span style="font-size:10px;">3</span>
								</p>
								<p class="reader-word-layer reader-word-s4-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030004, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">、</span>
								</p>
								<p class="reader-word-layer reader-word-s4-5" style="font-size:256px;font-family:simsun;">
									<span style="font-size:10px;">&nbsp;</span>
								</p>
								<p class="reader-word-layer reader-word-s4-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030004, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">上级文件的传达和落实未到实处</span>
								</p>
								<p class="reader-word-layer reader-word-s4-4" style="font-size:256px;font-family:simsun;">
									<span style="font-size:10px;">&nbsp;</span>
								</p>
								<p class="reader-word-layer reader-word-s4-6" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030004, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">今年是安全生产年，年初以来上级单位下发了很多安全</span>
								</p>
								<p class="reader-word-layer reader-word-s4-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030004, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">质量方面的文件，包括针对安全生产年开展的各项整治活动</span>
								</p>
								<p class="reader-word-layer reader-word-s4-2" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030004, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">等，在今年的实际工作，并未全部开展。上级的各项文件精</span>
								</p>
								<p class="reader-word-layer reader-word-s4-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030004, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">神落实的也不够彻底，未达到预期效果。</span>
								</p>
								<p class="reader-word-layer reader-word-s4-4" style="font-size:256px;font-family:simsun;">
									<span style="font-size:10px;">&nbsp;</span>
								</p>
								<p class="reader-word-layer reader-word-s4-6" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030004, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">在项目领导和部长的指导下，今年的安全质量工作得到</span>
								</p>
								<p class="reader-word-layer reader-word-s4-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030004, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">了顺利的开展，我本人也得到了一定的提高，新的一年即将</span>
								</p>
								<p class="reader-word-layer reader-word-s4-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030004, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">开始，我将以崭新的面貌迎接新一年的挑战，牢记我是一个</span>
								</p>
								<p class="reader-word-layer reader-word-s4-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030004, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">安全质量工作者的同时也是一名共产党员，要起到先锋模范</span>
								</p>
								<p class="reader-word-layer reader-word-s4-2" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030004, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">带头左右，克服自己的惰性思想，更好的配合部长，努力工</span>
								</p>
								<p class="reader-word-layer reader-word-s4-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030004, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">作认真做好项目明年的安全质量工作。</span>
								</p>
								<p class="reader-word-layer reader-word-s4-4" style="font-size:256px;font-family:simsun;">
									<span style="font-size:10px;">&nbsp;</span>
								</p>
								<p class="reader-word-layer reader-word-s4-4" style="font-size:256px;font-family:simsun;">
									<span style="font-size:10px;">&nbsp;</span>
								</p>
								<p class="reader-word-layer reader-word-s4-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030004, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">安质部：</span>
								</p>
								<p class="reader-word-layer reader-word-s4-4" style="font-size:256px;font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0020004, 仿宋_GB2312;">
									<span style="font-size:10px;">xxx&nbsp;</span>
								</p>
								<p class="reader-word-layer reader-word-s4-7" style="font-size:256px;font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0020004, 仿宋_GB2312;">
									<span style="font-size:10px;">2012</span>
								</p>
								<p class="reader-word-layer reader-word-s4-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030004, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">年</span>
								</p>
								<p class="reader-word-layer reader-word-s4-7" style="font-size:256px;font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0020004, 仿宋_GB2312;">
									<span style="font-size:10px;">12</span>
								</p>
								<p class="reader-word-layer reader-word-s4-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030004, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">月</span>
								</p>
								<p class="reader-word-layer reader-word-s4-4" style="font-size:256px;font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0020004, 仿宋_GB2312;">
									<span style="font-size:10px;">9</span>
								</p>
								<p class="reader-word-layer reader-word-s4-0" style="font-family:仿宋_GB2312, d3c8d03b83c4bb4cf7ecd16b0030004, 仿宋_GB2312;font-size:256px;">
									<span style="font-size:10px;">日</span>
								</p>
								<div>
									<br />
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>' ,
          NULL ,
          NULL ,
          CAST(0x0000A6BF013EB2A6 AS DATETIME) ,
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
VALUES  ( 11 ,
          N'香港高等法院取消“港独”议员梁颂恒、游蕙桢资格' ,
          N'工作总结' ,
          NULL ,
          N'<h1 style="font-size:26px;font-weight:normal;font-family:&quot;background-color:#FFFFFF;">
	<p align="center" style="font-family:&quot;background-color:#FFFFFF;">
		<img alt="香港高等法院:取消“港独”议员梁颂恒、游蕙桢资格" src="http://img1.gtimg.com/news/pics/hv1/184/110/2155/140157109.jpg" />
	</p>
	<p style="font-family:&quot;text-indent:2em;background-color:#FFFFFF;">
		15日消息，11月15日下午3时半，香港高等法院就特区政府行政长官及律政司提请的“青年新政”候任议员梁颂恒、游蕙桢宣誓无效、取消议员资格司法复核案作出裁决：取消梁颂恒、游蕙桢议员资格。
	</p>
	<p style="font-family:&quot;text-indent:2em;background-color:#FFFFFF;">
		10月12日，在香港新一届立法会议员宣誓仪式上，“青年新政”候任议员梁颂恒、游蕙桢展示“HONGKONG IS NOT CHINA”(香港不是中国) “港独”标语，宣称效忠“香港民族”，并加入辱国辱华字眼将“CHINA”读作“支那”，游蕙桢更爆粗口将“REPUBLIC”(共和国)读作“REFXXXING”（脏话）。当天负责监誓的立法会秘书长陈维安随即表示不能为二人监誓，留待新当选的立法会主席重新安排。
	</p>
	<p style="font-family:&quot;text-indent:2em;background-color:#FFFFFF;">
		10月18日上午，立法会主席梁君彦裁定“青年新政”梁颂恒、游蕙祯等5人宣誓无效，但准许其于19日重新宣誓。对此裁定，香港特区政府立即表示异议。当天傍晚，特区政府行政长官联同律政司紧急入禀香港高等法院，要求复核立法会授予梁颂恒、游蕙祯等人重新宣誓的权利，同时申请临时禁制令，要求禁止二人明天于立法会大会上再宣誓。法院当晚紧急审理此案，裁决不予颁发临时禁制令，但接受司法复核申请，并决定于11月3日宣判。
	</p>
	<p style="font-family:&quot;text-indent:2em;background-color:#FFFFFF;">
		梁、游辱国辱华的言行引起了香港建制派议员的强烈不满。10月19日，立法会大会按照会议议程安排5人重新宣誓。在梁、游二人宣誓前，建制派议员集体抗议离场，触发流会，导致二人宣誓未成。
	</p>
	<p style="font-family:&quot;text-indent:2em;background-color:#FFFFFF;">
		10月22日，梁颂恒、游蕙祯赴台湾大学发表演讲，继续宣扬“港独”主张，并声称宣誓时展示的“香港不是中国”的标语纯属“事实”。
	</p>
	<p style="font-family:&quot;text-indent:2em;background-color:#FFFFFF;">
		10月25日，立法会主席梁君彦作出最新决定，押后“青年新政”两名议员梁颂恒、游蕙祯的重新宣誓程序，等候香港高等法院的司法复核裁决，且不容许二人在裁决前进入会议厅开会。
	</p>
	<p style="font-family:&quot;text-indent:2em;background-color:#FFFFFF;">
		10月26日，梁颂恒、游蕙桢在一些非建制派议员组成“人链”护送下，强行进入会议厅，最终因引发混乱导致休会。
	</p>
	<p style="font-family:&quot;text-indent:2em;background-color:#FFFFFF;">
		11月2日，梁颂恒、游蕙桢再次硬闯立法会会议厅，并自带扩音器试图自行宣誓，在混乱中致使多名保安人员受伤。立法会主席梁君彦宣布休会，并报警求助。事后，梁君彦强烈谴责梁、游二人，指其多次分批冲击会议厅系“有组织暴力行动”。
	</p>
	<p style="font-family:&quot;text-indent:2em;background-color:#FFFFFF;">
		11月3日，香港特区高等法院审理特区政府特区行政长官联同律政司提出的司法复核。主审法官听取各方陈词后，决定押后裁决。
	</p>
	<p style="font-family:&quot;text-indent:2em;background-color:#FFFFFF;">
		11月6日，梁颂恒、游蕙桢纠集一干人众违法冲击西区，损坏公共设施，向警方投掷杂物，导致主干道交通瘫痪，社会秩序遭受严重破坏。
	</p>
	<p style="font-family:&quot;text-indent:2em;background-color:#FFFFFF;">
		为维护国家安全，保障香港立法会正常运转、政府依法施政和特区长治久安，澄清香港社会对基本法所规定的特别行政区法定公职人员宣誓效忠制度的模糊认识，为依法处理有关问题提供有力指引，11月7日，十二届全国人大常委会第二十四次会议闭幕会表决通过了关于香港特别行政区基本法第一百零四条的解释，明确了依法宣誓的具体含义和不依法宣誓的法律后果以及监誓人的权力和责任等。
	</p>
	<p style="font-family:&quot;text-indent:2em;background-color:#FFFFFF;">
		11月10日，香港高等法院法官要求司法复核案各方针对释法对案件的影响提交补充陈词。特区政府补充陈词认为，根据人大释法梁颂恒、游蕙祯是拒绝及忽略宣誓，议员资格已被取消，要求法庭颁布命令该两个议席悬空。
	</p>
	<p style="font-family:&quot;text-indent:2em;background-color:#FFFFFF;">
		梁颂恒、游蕙桢辱国辱华及“港独”言行引起香港社会一致谴责和强烈愤慨。10月26日及11月13日，香港爱国爱港社团先后成立“反辱华、反港独”大联盟和“反港独、撑释法”大联盟，组织发起数万人参加的和平集会，表达反对“港独”的一致决心和支持人大释法的共同意愿。更有逾百万名市民在网上联署谴责梁、游二人的恶劣言行，要求他们退出立法会。
	</p>
</h1>' ,
          NULL ,
          NULL ,
          CAST(0x0000A6BF013F72A4 AS DATETIME) ,
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
VALUES  ( 10 ,
          N'jqueryapi.zip' ,
          123456 ,
          1 ,
          N'管理员AA' ,
          CAST(0x0000A6B9015C4C36 AS DATETIME) ,
          N'131231704867930523(9758).zip' ,
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
VALUES  ( 11 ,
          N'Font-Awesome-3.2.1.zip' ,
          123456 ,
          1 ,
          N'管理员AA' ,
          CAST(0x0000A6B9015C6D00 AS DATETIME) ,
          N'131231705147737763(5707).zip' ,
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
VALUES  ( 12 ,
          N'01 标准化需求集成方案V1.4.xlsx' ,
          123456 ,
          1 ,
          N'管理员AA' ,
          CAST(0x0000A6B9015C773C AS DATETIME) ,
          N'131231705235081087(9174).xlsx' ,
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
VALUES  ( 13 ,
          N'待优化清单（整合版）.xls' ,
          123456 ,
          1 ,
          N'管理员AA' ,
          CAST(0x0000A6BF0140930C AS DATETIME) ,
          N'131236828305456938(2107).xls' ,
          N'/UpFiles/201611/' ,
          N'36352' ,
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
VALUES  ( 14 ,
          N'file.log' ,
          123456 ,
          1 ,
          N'管理员AA' ,
          CAST(0x0000A6C200FBA90E AS DATETIME) ,
          N'131239269760441357(9415).log' ,
          N'/UpFiles/201611/' ,
          N'153759' ,
          NULL ,
          N'三体系' ,
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
VALUES  ( 15 ,
          N'base.xls' ,
          123456 ,
          1 ,
          N'管理员AA' ,
          CAST(0x0000A6C200FC875E AS DATETIME) ,
          N'131239271657519863(5049).xls' ,
          N'/UpFiles/201611/' ,
          N'5120' ,
          NULL ,
          N'三体系' ,
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
VALUES  ( 16 ,
          N'base.css' ,
          123456 ,
          1 ,
          N'管理员AA' ,
          CAST(0x0000A6C20100A9F9 AS DATETIME) ,
          N'131239280690936545(6497).css' ,
          N'/UpFiles/201611/' ,
          N'5511' ,
          NULL ,
          N'安全稽查' ,
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
VALUES  ( 17 ,
          N'BugReport.txt' ,
          123456 ,
          1 ,
          N'管理员AA' ,
          CAST(0x0000A6C20100C041 AS DATETIME) ,
          N'131239280881087421(6156).txt' ,
          N'/UpFiles/201611/' ,
          N'9' ,
          NULL ,
          N'考试考核' ,
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
VALUES  ( 18 ,
          N'file.log' ,
          123456 ,
          1 ,
          N'管理员AA' ,
          CAST(0x0000A6C20100C8D2 AS DATETIME) ,
          N'131239280954211604(6729).log' ,
          N'/UpFiles/201611/' ,
          N'153759' ,
          NULL ,
          N'教育培训' ,
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
VALUES  ( 19 ,
          N'base.xls' ,
          123456 ,
          1 ,
          N'管理员AA' ,
          CAST(0x0000A6C20100CC4F AS DATETIME) ,
          N'131239280983953305(5176).xls' ,
          N'/UpFiles/201611/' ,
          N'5120' ,
          NULL ,
          N'教育培训' ,
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
VALUES  ( 20 ,
          N'assetinfo1479386757516052.xls' ,
          123456 ,
          1 ,
          N'管理员AA' ,
          CAST(0x0000A6C20100D10C AS DATETIME) ,
          N'131239281024415619(1560).xls' ,
          N'/UpFiles/201611/' ,
          N'5120' ,
          NULL ,
          N'教育培训' ,
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
VALUES  ( 21 ,
          N'assetinfo1479382062614591.xls' ,
          123456 ,
          1 ,
          N'管理员AA' ,
          CAST(0x0000A6C2010104B2 AS DATETIME) ,
          N'131239281465140827(8814).xls' ,
          N'/UpFiles/201611/' ,
          N'5120' ,
          NULL ,
          N'资质审核' ,
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
VALUES  ( 22 ,
          N'assetinfo14793799946007266.xls' ,
          123456 ,
          1 ,
          N'管理员AA' ,
          CAST(0x0000A6C201011499 AS DATETIME) ,
          N'131239281600838589(3022).xls' ,
          N'/UpFiles/201611/' ,
          N'5120' ,
          NULL ,
          N'交通安全' ,
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
VALUES  ( 23 ,
          N'assetinfo1479381693984977.xls' ,
          123456 ,
          1 ,
          N'管理员AA' ,
          CAST(0x0000A6C2010424BC AS DATETIME) ,
          N'131239288292121308(3585).xls' ,
          N'/UpFiles/201611/' ,
          N'5120' ,
          NULL ,
          N'岗位人员信息' ,
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
VALUES  ( 24 ,
          N'assetinfo1479381943685348.xls' ,
          123456 ,
          1 ,
          N'管理员AA' ,
          CAST(0x0000A6C20104280E AS DATETIME) ,
          N'131239288320482930(1845).xls' ,
          N'/UpFiles/201611/' ,
          N'5120' ,
          NULL ,
          N'岗位人员信息' ,
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
VALUES  ( 25 ,
          N'assetinfo14793793769031186.xls' ,
          123456 ,
          1 ,
          N'管理员AA' ,
          CAST(0x0000A6C2010434FC AS DATETIME) ,
          N'131239288430809241(3533).xls' ,
          N'/UpFiles/201611/' ,
          N'5632' ,
          NULL ,
          N'安全稽查通报' ,
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
VALUES  ( 26 ,
          N'assetinfo14793798964055073.xls' ,
          123456 ,
          1 ,
          N'管理员AA' ,
          CAST(0x0000A6C20104380F AS DATETIME) ,
          N'131239288457020740(6024).xls' ,
          N'/UpFiles/201611/' ,
          N'5120' ,
          NULL ,
          N'安全稽查通报' ,
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
VALUES  ( 27 ,
          N'assetinfo14793798964055073.xls' ,
          123456 ,
          1 ,
          N'管理员AA' ,
          CAST(0x0000A6C201043DB4 AS DATETIME) ,
          N'131239288505213496(2536).xls' ,
          N'/UpFiles/201611/' ,
          N'5120' ,
          NULL ,
          N'工器具配置标准' ,
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
VALUES  ( 28 ,
          N'assetinfo14793799946007266.xls' ,
          123456 ,
          1 ,
          N'管理员AA' ,
          CAST(0x0000A6C201043FD3 AS DATETIME) ,
          N'131239288523284530(4615).xls' ,
          N'/UpFiles/201611/' ,
          N'5120' ,
          NULL ,
          N'工器具配置标准' ,
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
VALUES  ( 31 ,
          N'软件项目开发合同范本V1.0.doc' ,
          123456 ,
          1 ,
          N'管理员AA' ,
          CAST(0x0000A6C20104613A AS DATETIME) ,
          N'131239288808330834(4639).doc' ,
          N'/UpFiles/201611/' ,
          N'53760' ,
          NULL ,
          N'分公司考核兑现' ,
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
VALUES  ( 32 ,
          N'软件项目开发合同范本V1.1.doc' ,
          123456 ,
          1 ,
          N'管理员AA' ,
          CAST(0x0000A6C2010463ED AS DATETIME) ,
          N'131239288831352150(3931).doc' ,
          N'/UpFiles/201611/' ,
          N'53760' ,
          NULL ,
          N'分公司考核兑现' ,
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
VALUES  ( 33 ,
          N'26.swf' ,
          123456 ,
          1 ,
          N'管理员AA' ,
          CAST(0x0000A6C20104D2E1 AS DATETIME) ,
          N'131239289778166305(9884).swf' ,
          N'/UpFiles/201611/' ,
          N'11437' ,
          NULL ,
          N'工器具管理评价' ,
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
VALUES  ( 34 ,
          N'netmap.png' ,
          123456 ,
          1 ,
          N'管理员AA' ,
          CAST(0x0000A6C40161098B AS DATETIME) ,
          N'131241219221675050(9059).png' ,
          N'/UpFiles/201611/' ,
          N'199235' ,
          NULL ,
          N'安全稽查' ,
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
          CAST(0x0000A6C5016AA6FB AS DATETIME) ,
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
          N'安质专责' ,
          3 ,
          2 ,
          N'农电' ,
          NULL ,
          NULL ,
          1 ,
          CAST(0x0000A6C5016B31F7 AS DATETIME) ,
          NULL ,
          N'' ,
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
          N'测试部门' ,
          1 ,
          1 ,
          N'长工' ,
          NULL ,
          NULL ,
          1 ,
          CAST(0x0000A6C5016CD4EE AS DATETIME) ,
          N'' ,
          N'' ,
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
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'3594d3fa-7c87-43c3-90dd-820a2e8052ae' ,
          N'天门分公司' ,
          NULL ,
          N'' ,
          1 ,
          N'6b4c13f1-4691-4688-a8a8-34f07b857b06' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'07193c51-5530-4f3f-9208-6e59746962cc' ,
          N'钱江分公司' ,
          NULL ,
          N'' ,
          NULL ,
          N'6b4c13f1-4691-4688-a8a8-34f07b857b06' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'90b4fe32-708b-4405-abc6-fc01d98d4b7a' ,
          N'仙桃分公司' ,
          NULL ,
          N'' ,
          2 ,
          N'6b4c13f1-4691-4688-a8a8-34f07b857b06' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'93cbdde2-4d67-44ff-b5b4-7b23b78de097' ,
          N'安全第一责任人' ,
          N'' ,
          N'吴发清' ,
          NULL ,
          N'f881315c-6909-4c02-9154-98b310bd6e43' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'4f77870b-6451-45eb-9ca7-b342a3191c83' ,
          N'安全第一责任人' ,
          N'' ,
          N'许悦明' ,
          NULL ,
          N'e32bbf34-6490-4820-a73b-bf28689077ba' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'46594c40-0bd3-470d-a564-41826da481e7' ,
          N'安全第一责任人' ,
          N'' ,
          N'许勇' ,
          NULL ,
          N'758252f3-bc69-438e-a634-309e8914b42b' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'08aa1751-aa45-47a5-a0e4-b09009ba0660' ,
          N'安全第一责任人' ,
          N'' ,
          N'付新宇' ,
          NULL ,
          N'3594d3fa-7c87-43c3-90dd-820a2e8052ae' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'd6d07ab5-5853-4584-b757-6be1ab0e5e06' ,
          N'安全第一责任人' ,
          N'' ,
          N'黄保平' ,
          NULL ,
          N'07193c51-5530-4f3f-9208-6e59746962cc' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'a018cb68-f5b6-4059-be70-9df25d3c3a37' ,
          N'安全第一责任人' ,
          N'' ,
          N'潘亚琪' ,
          NULL ,
          N'8d26215f-d00f-4c2b-a491-73ea60b2a8b3' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'c266072d-13cf-4408-8640-f48eee1ff91f' ,
          N'安全第一责任人' ,
          N'' ,
          N'廖圣平' ,
          NULL ,
          N'8dabe4e7-c18a-4f64-8b9d-e46109d191c3' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'713b42b3-2651-4c25-baf8-cb9604f09c87' ,
          N'安全第一责任人' ,
          N'' ,
          N'' ,
          NULL ,
          N'8c172f05-23a9-4dbf-a10e-7f9511217b14' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'48faad10-f97b-4615-97cf-63973bdad4d7' ,
          N'安全第一责任人' ,
          N'' ,
          N'雷传兵' ,
          NULL ,
          N'90b4fe32-708b-4405-abc6-fc01d98d4b7a' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'879fe3f7-e064-4c21-b330-88157cdb78e2' ,
          N'公司网络安全第一责任人' ,
          NULL ,
          N'万亿' ,
          NULL ,
          N'00000000-0000-0000-0000-000000000000' ,
          N''
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'8efbe43d-ae07-41b0-9d07-1213c24f69bb' ,
          N'安全第一责任人' ,
          N'' ,
          N'' ,
          NULL ,
          N'0d8788e4-1414-4016-929d-24c59c66eabb' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'c9216d58-3414-4f8c-8285-8f93c049e151' ,
          N'安全第一责任人' ,
          N'' ,
          N'' ,
          NULL ,
          N'5e123f9b-397c-4513-b4fb-d25cd50a0b5b' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'e5b2d769-053f-474a-9981-af226d1a1173' ,
          N'安全第一责任人' ,
          N'' ,
          N'' ,
          NULL ,
          N'ddda4e36-3d45-4181-b904-8e19e2a53448' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'dc19950e-2a4b-4c1d-9f56-4a8e3c6c1df2' ,
          N'安全第一责任人' ,
          N'' ,
          N'' ,
          NULL ,
          N'a129adee-d2e9-4274-9ce9-9ad8b428e633' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'df497fdb-5d66-4f65-a80f-b0d42410e90c' ,
          N'安全第一责任人' ,
          N'' ,
          N'' ,
          NULL ,
          N'060d3544-1265-4420-a57c-b28d6a14e7c4' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'd47ba171-f76e-4ecc-accb-d93bf879680f' ,
          N'安全第一责任人' ,
          N'' ,
          N'' ,
          NULL ,
          N'78d876b0-e291-455e-9f28-c74981c9e853' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'a3cd3df9-e918-4704-87e1-a65a651b7eef' ,
          N'安全第一责任人' ,
          N'' ,
          N'' ,
          NULL ,
          N'41577573-aee6-4bf3-9483-8fe324b92e13' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'062801f8-f336-4fba-9c4f-ea7eb33ae284' ,
          N'安全第一责任人' ,
          N'' ,
          N'' ,
          NULL ,
          N'95f7fdcc-bd8e-4011-9530-54361eb36270' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'bcb1c048-41cb-41ae-8aef-89bd34d263f8' ,
          N'专职安全员' ,
          N'' ,
          N'李红波' ,
          NULL ,
          N'08aa1751-aa45-47a5-a0e4-b09009ba0660' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'a191fcc7-4f09-4b28-9068-f184fb54e2fb' ,
          N'安全第一责任人' ,
          N'' ,
          N'' ,
          NULL ,
          N'13c8cdfa-9296-4ad6-8efd-1d67635b08e5' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'2fd5d2a7-1ef1-448d-86e4-ced3261261e3' ,
          N'专职安全员' ,
          N'' ,
          N'王金林' ,
          NULL ,
          N'48faad10-f97b-4615-97cf-63973bdad4d7' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'f46e62ae-3e1a-4fb6-9d45-b247ad75939f' ,
          N'专职安全员' ,
          N'' ,
          N'杨正军' ,
          NULL ,
          N'd6d07ab5-5853-4584-b757-6be1ab0e5e06' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'38edaf9a-a919-4757-b417-71402e9c2b1a' ,
          N'业扩工程部' ,
          N'兼职安全员' ,
          N'袁传金' ,
          NULL ,
          N'f46e62ae-3e1a-4fb6-9d45-b247ad75939f' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'99665042-3b52-4cde-bf39-7c14912a18fc' ,
          N'农改工程部' ,
          N'兼职安全员' ,
          N'夏新平' ,
          NULL ,
          N'f46e62ae-3e1a-4fb6-9d45-b247ad75939f' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'7e428ba1-08a6-4b4b-a514-351af1cbc168' ,
          N'基建工程部' ,
          N'兼职安全员' ,
          N'江波' ,
          NULL ,
          N'f46e62ae-3e1a-4fb6-9d45-b247ad75939f' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'b73a2bc3-f048-44fd-b096-763bc8dbe9dd' ,
          N'基干队' ,
          N'兼职安全员' ,
          N'王兵' ,
          NULL ,
          N'f46e62ae-3e1a-4fb6-9d45-b247ad75939f' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'ba40ca36-b231-44ab-8f13-86fd5e3b7a7c' ,
          N'客户服务队' ,
          N'兼职安全员' ,
          N'罗贤龙' ,
          NULL ,
          N'f46e62ae-3e1a-4fb6-9d45-b247ad75939f' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'6089d161-b0c1-472f-9d26-438fd4554b65' ,
          N'公司安全协管人' ,
          N'' ,
          N'郑三' ,
          0 ,
          N'879fe3f7-e064-4c21-b330-88157cdb78e2' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'6b4c13f1-4691-4688-a8a8-34f07b857b06' ,
          N'公司安全质量部' ,
          NULL ,
          NULL ,
          0 ,
          N'6089d161-b0c1-472f-9d26-438fd4554b65' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'4bc324d9-329f-403f-9097-041a71501d3d' ,
          N'专职安全员' ,
          N'' ,
          N'梅组荣' ,
          NULL ,
          N'4f77870b-6451-45eb-9ca7-b342a3191c83' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'f881315c-6909-4c02-9154-98b310bd6e43' ,
          N'洪湖分公司' ,
          NULL ,
          N'' ,
          3 ,
          N'6b4c13f1-4691-4688-a8a8-34f07b857b06' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'e32bbf34-6490-4820-a73b-bf28689077ba' ,
          N'松枝分公司' ,
          NULL ,
          N'' ,
          4 ,
          N'6b4c13f1-4691-4688-a8a8-34f07b857b06' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'758252f3-bc69-438e-a634-309e8914b42b' ,
          N'公安分公司' ,
          NULL ,
          N'' ,
          5 ,
          N'6b4c13f1-4691-4688-a8a8-34f07b857b06' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'8d26215f-d00f-4c2b-a491-73ea60b2a8b3' ,
          N'监理分公司' ,
          NULL ,
          N'' ,
          6 ,
          N'6b4c13f1-4691-4688-a8a8-34f07b857b06' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'8dabe4e7-c18a-4f64-8b9d-e46109d191c3' ,
          N'江陵分公司' ,
          NULL ,
          N'' ,
          7 ,
          N'6b4c13f1-4691-4688-a8a8-34f07b857b06' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'8c172f05-23a9-4dbf-a10e-7f9511217b14' ,
          N'荆城分公司' ,
          N'' ,
          N'' ,
          8 ,
          N'6b4c13f1-4691-4688-a8a8-34f07b857b06' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'0d8788e4-1414-4016-929d-24c59c66eabb' ,
          N'石首分公司' ,
          NULL ,
          N'' ,
          10 ,
          N'6b4c13f1-4691-4688-a8a8-34f07b857b06' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'5e123f9b-397c-4513-b4fb-d25cd50a0b5b' ,
          N'运检分公司' ,
          N'' ,
          N'' ,
          11 ,
          N'6b4c13f1-4691-4688-a8a8-34f07b857b06' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'ddda4e36-3d45-4181-b904-8e19e2a53448' ,
          N'输变电分公司' ,
          NULL ,
          N'' ,
          12 ,
          N'6b4c13f1-4691-4688-a8a8-34f07b857b06' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'a129adee-d2e9-4274-9ce9-9ad8b428e633' ,
          N'安装分公司' ,
          NULL ,
          N'' ,
          13 ,
          N'6b4c13f1-4691-4688-a8a8-34f07b857b06' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'78d876b0-e291-455e-9f28-c74981c9e853' ,
          N'简装分公司' ,
          NULL ,
          N'' ,
          14 ,
          N'6b4c13f1-4691-4688-a8a8-34f07b857b06' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'060d3544-1265-4420-a57c-b28d6a14e7c4' ,
          N'城市照明分公司' ,
          NULL ,
          N'' ,
          14 ,
          N'6b4c13f1-4691-4688-a8a8-34f07b857b06' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'41577573-aee6-4bf3-9483-8fe324b92e13' ,
          N'通讯自动化分公司' ,
          NULL ,
          N'' ,
          15 ,
          N'6b4c13f1-4691-4688-a8a8-34f07b857b06' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'95f7fdcc-bd8e-4011-9530-54361eb36270' ,
          N'物业分公司' ,
          NULL ,
          N'' ,
          16 ,
          N'6b4c13f1-4691-4688-a8a8-34f07b857b06' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'13c8cdfa-9296-4ad6-8efd-1d67635b08e5' ,
          N'金凤皇冠大酒店' ,
          NULL ,
          N'' ,
          17 ,
          N'6b4c13f1-4691-4688-a8a8-34f07b857b06' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'b0c122e1-e523-4442-9d45-fed1ceafdee5' ,
          N'专职安全员' ,
          N'' ,
          N'龚军桥' ,
          NULL ,
          N'46594c40-0bd3-470d-a564-41826da481e7' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'51176cf4-78f7-402d-96d4-d01c7b92a96a' ,
          N'专职安全员' ,
          N'' ,
          N'刘亮' ,
          NULL ,
          N'a018cb68-f5b6-4059-be70-9df25d3c3a37' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'd604bc7b-d824-4b62-908b-35c3c1453504' ,
          N'专职安全员' ,
          N'' ,
          N'张光银' ,
          NULL ,
          N'c266072d-13cf-4408-8640-f48eee1ff91f' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'c9467f1e-c9cf-4539-89f3-ca5a26cf48c8' ,
          N'专职安全员' ,
          N'' ,
          N'陈勇' ,
          NULL ,
          N'713b42b3-2651-4c25-baf8-cb9604f09c87' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'2c57ea17-b3ab-40e3-88ed-2085425dee61' ,
          N'专职安全员' ,
          N'' ,
          N'刘劲' ,
          NULL ,
          N'8efbe43d-ae07-41b0-9d07-1213c24f69bb' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'cda5eb6e-09de-4661-bcff-8b6ac0b6a304' ,
          N'专职安全员' ,
          N'' ,
          N'王钝' ,
          NULL ,
          N'c9216d58-3414-4f8c-8285-8f93c049e151' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'36579892-d13f-4a8a-9fb9-ea3311be7f32' ,
          N'专职安全员' ,
          N'' ,
          N'邵元瑞' ,
          NULL ,
          N'e5b2d769-053f-474a-9981-af226d1a1173' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'6c1c3398-8dbd-400a-8516-ed8e1e0539c1' ,
          N'专职安全员' ,
          N'' ,
          N'刘腾' ,
          NULL ,
          N'dc19950e-2a4b-4c1d-9f56-4a8e3c6c1df2' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'c12ea4c2-974b-41fa-ae88-1812fec8adcd' ,
          N'专职安全员' ,
          N'' ,
          N'邓运军' ,
          NULL ,
          N'd47ba171-f76e-4ecc-accb-d93bf879680f' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'c72281f0-0cad-4827-ad98-0c664360e415' ,
          N'专职安全员' ,
          N'' ,
          N'黄明' ,
          NULL ,
          N'df497fdb-5d66-4f65-a80f-b0d42410e90c' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'72541665-49e0-40fd-855c-fd008a5cdf7b' ,
          N'专职安全员' ,
          N'' ,
          N'谢波' ,
          NULL ,
          N'a3cd3df9-e918-4704-87e1-a65a651b7eef' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'43bf2a4f-5096-4eb9-b643-aed2859e68d1' ,
          N'专职安全员' ,
          N'' ,
          N'冯志勇' ,
          NULL ,
          N'062801f8-f336-4fba-9c4f-ea7eb33ae284' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'bd8f3afa-3ce7-4ae3-8a20-aa3a47df1c5a' ,
          N'专职安全员' ,
          N'' ,
          N'王晓芹' ,
          NULL ,
          N'a191fcc7-4f09-4b28-9068-f184fb54e2fb' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'99fe800e-dbe4-4d20-9cc4-7d296566ffe4' ,
          N'工程一部' ,
          N'兼职安全员' ,
          N'许志斌' ,
          1 ,
          N'bcb1c048-41cb-41ae-8aef-89bd34d263f8' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'8f6056d8-6696-4b90-b1f3-39dc0cb193af' ,
          N'工程二部' ,
          N'兼职安全员' ,
          N'李茂' ,
          2 ,
          N'bcb1c048-41cb-41ae-8aef-89bd34d263f8' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'4ed5ebb1-9219-4329-887c-26f5031d9b28' ,
          N'工程三部' ,
          N'兼职安全员' ,
          N'邓江洪' ,
          3 ,
          N'bcb1c048-41cb-41ae-8aef-89bd34d263f8' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'360c212e-5e0f-4be0-bae0-aaaa86d272aa' ,
          N'变电工程部' ,
          N'兼职安全员' ,
          N'杨涛' ,
          1 ,
          N'2fd5d2a7-1ef1-448d-86e4-ced3261261e3' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'c060a139-7f79-451d-983c-46eeec21e009' ,
          N'线路工程部' ,
          N'兼职安全员' ,
          N'曾庆烟' ,
          2 ,
          N'2fd5d2a7-1ef1-448d-86e4-ced3261261e3' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'f20b7ae8-2372-43d2-9637-204af6d7863a' ,
          N'土建工程部' ,
          N'兼职安全员' ,
          N'苏峰' ,
          3 ,
          N'2fd5d2a7-1ef1-448d-86e4-ced3261261e3' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'52bc2633-5792-4788-a3de-e8a98814957d' ,
          N'配电工程部' ,
          N'兼职安全员' ,
          N'刘本会' ,
          4 ,
          N'2fd5d2a7-1ef1-448d-86e4-ced3261261e3' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'48b7de24-6572-486d-a435-91356bf993ff' ,
          N'专职安全员' ,
          N'' ,
          N'邓平' ,
          NULL ,
          N'93cbdde2-4d67-44ff-b5b4-7b23b78de097' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'b66a8967-c118-4747-8d1f-fa6c1407c1e8' ,
          N'工程一部' ,
          N'兼职安全员' ,
          N'邓平' ,
          1 ,
          N'48b7de24-6572-486d-a435-91356bf993ff' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'98df91e0-e63b-448b-860b-2504f43ab96e' ,
          N'工程二部' ,
          N'兼职安全员' ,
          N'赵超' ,
          2 ,
          N'48b7de24-6572-486d-a435-91356bf993ff' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'acf4cf4a-f390-45cf-a066-9e4a845a0e98' ,
          N'工程三部' ,
          N'兼职安全员' ,
          N'陈宏江' ,
          3 ,
          N'48b7de24-6572-486d-a435-91356bf993ff' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'2867001f-70fb-4ad7-a828-7ef85df5cd4d' ,
          N'客户工程部' ,
          N'兼职安全员' ,
          N'方均' ,
          NULL ,
          N'4bc324d9-329f-403f-9097-041a71501d3d' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'f152f1a7-95b4-451c-8d91-6c26459bdf1b' ,
          N'农网工程部' ,
          N'兼职安全员' ,
          N'李华' ,
          2 ,
          N'4bc324d9-329f-403f-9097-041a71501d3d' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'dfa0d5c7-44c4-4494-ab59-97f8e03a5e28' ,
          N'基建工程部' ,
          N'兼职安全员' ,
          N'吴勇' ,
          3 ,
          N'4bc324d9-329f-403f-9097-041a71501d3d' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'6cba1acd-924a-4cdd-a229-df9c1446cf6f' ,
          N'客户工程部' ,
          N'兼职安全员' ,
          N'高军' ,
          1 ,
          N'b0c122e1-e523-4442-9d45-fed1ceafdee5' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'2ed91cb6-dda6-407e-b022-6241efab34e0' ,
          N'配网工程部' ,
          N'兼职安全员' ,
          N'杨才美' ,
          1 ,
          N'b0c122e1-e523-4442-9d45-fed1ceafdee5' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'553c2377-41d4-4b8d-a10e-e8cb3a8020dd' ,
          N'基建工程部' ,
          N'兼职安全员' ,
          N'谢飞' ,
          3 ,
          N'b0c122e1-e523-4442-9d45-fed1ceafdee5' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'5bb5bb3d-74b9-4b22-9449-f1e8abd6645a' ,
          N'客户工程部' ,
          N'兼职安全员' ,
          N'刘开辉' ,
          1 ,
          N'51176cf4-78f7-402d-96d4-d01c7b92a96a' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'0b0c782f-a246-47af-88bc-8857596dc6e4' ,
          N'配网工程部' ,
          N'兼职安全员' ,
          N'付强' ,
          1 ,
          N'51176cf4-78f7-402d-96d4-d01c7b92a96a' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_netmap]
        ( [node_guid] ,
          [node_name] ,
          [station_name] ,
          [auditor] ,
          [sort_order] ,
          [parentguid] ,
          [remark]
        )
VALUES  ( N'e957a73c-5797-47a6-97fa-b6533ab274a3' ,
          N'基建工程部' ,
          N'兼职安全员' ,
          N'李新城' ,
          3 ,
          N'51176cf4-78f7-402d-96d4-d01c7b92a96a' ,
          NULL
        )
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
          N'' ,
          NULL ,
          N'' ,
          1 ,
          4 ,
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
          N'' ,
          2 ,
          5 ,
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
VALUES  ( 25 ,
          1 ,
          22 ,
          N'工作总结' ,
          N'/UnitManage/WorkSummary.aspx?nodeid=25' ,
          NULL ,
          N'' ,
          1 ,
          2 ,
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
VALUES  ( 26 ,
          1 ,
          0 ,
          N'部门概况' ,
          N'' ,
          NULL ,
          N'' ,
          1 ,
          3 ,
          N'unit_decription' ,
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
VALUES  ( 27 ,
          1 ,
          26 ,
          N'岗位职责' ,
          N'' ,
          NULL ,
          N'' ,
          2 ,
          3 ,
          N'unit_decription' ,
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
VALUES  ( 28 ,
          1 ,
          22 ,
          N'绩效考核' ,
          N'' ,
          NULL ,
          N'' ,
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
VALUES  ( 29 ,
          1 ,
          22 ,
          N'工作计划' ,
          N'' ,
          NULL ,
          N'' ,
          2 ,
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
VALUES  ( 30 ,
          1 ,
          22 ,
          N'管理制度' ,
          N'' ,
          NULL ,
          N'' ,
          2 ,
          4 ,
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
VALUES  ( 31 ,
          1 ,
          0 ,
          N'安全管理' ,
          N'' ,
          NULL ,
          N'' ,
          1 ,
          5 ,
          N'anquan' ,
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
VALUES  ( 32 ,
          1 ,
          31 ,
          N'安全稽查' ,
          N'/Safety/SafetyCheck.aspx?nodeid=42' ,
          NULL ,
          N'' ,
          2 ,
          1 ,
          N'anquan' ,
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
VALUES  ( 33 ,
          NULL ,
          26 ,
          N'形象及宗旨' ,
          N'' ,
          NULL ,
          N'' ,
          2 ,
          1 ,
          N'unit_decription' ,
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
VALUES  ( 34 ,
          NULL ,
          26 ,
          N'部门职责' ,
          N'' ,
          NULL ,
          N'' ,
          2 ,
          2 ,
          N'unit_decription' ,
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
VALUES  ( 36 ,
          NULL ,
          26 ,
          N'公司网络安全图' ,
          N'/UnitManage/NetworkMap.aspx' ,
          NULL ,
          N'' ,
          2 ,
          4 ,
          N'unit_decription' ,
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
VALUES  ( 37 ,
          NULL ,
          31 ,
          N'安全例会' ,
          N'' ,
          NULL ,
          N'' ,
          2 ,
          2 ,
          N'anquan' ,
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
VALUES  ( 38 ,
          NULL ,
          31 ,
          N'考试考核' ,
          N'/Safety/Examination.aspx?nodeid=38' ,
          NULL ,
          N'' ,
          2 ,
          3 ,
          N'anquan' ,
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
VALUES  ( 39 ,
          NULL ,
          31 ,
          N'教育培训' ,
          N'/Safety/EducationTraing.aspx?nodeid=39' ,
          NULL ,
          N'' ,
          2 ,
          4 ,
          N'anquan' ,
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
VALUES  ( 40 ,
          NULL ,
          31 ,
          N'资质审核' ,
          N'/Safety/Qualification.aspx?nodeid=40' ,
          NULL ,
          N'' ,
          2 ,
          5 ,
          N'anquan' ,
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
VALUES  ( 41 ,
          NULL ,
          31 ,
          N'交通安全' ,
          N'/Safety/Traffic.aspx?nodeid=41' ,
          NULL ,
          N'' ,
          2 ,
          6 ,
          N'anquan' ,
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
VALUES  ( 42 ,
          NULL ,
          0 ,
          N'质量管理' ,
          N'' ,
          NULL ,
          N'' ,
          1 ,
          6 ,
          N'qm' ,
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
VALUES  ( 43 ,
          NULL ,
          0 ,
          N'分公司管控' ,
          N'' ,
          NULL ,
          N'' ,
          1 ,
          7 ,
          N'fgs' ,
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
VALUES  ( 44 ,
          NULL ,
          42 ,
          N'三体系建设' ,
          N'/QM/ThreeTix.aspx?nodeid=44' ,
          NULL ,
          N'' ,
          2 ,
          1 ,
          N'qm' ,
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
VALUES  ( 45 ,
          NULL ,
          43 ,
          N'岗位人员信息' ,
          N'/OtherCompany/PersonalInformation.aspx?nodeid=45' ,
          NULL ,
          N'' ,
          2 ,
          1 ,
          N'fgs' ,
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
VALUES  ( 46 ,
          NULL ,
          43 ,
          N'安全稽查通报' ,
          N'/OtherCompany/CheckReport.aspx?nodeid=46' ,
          NULL ,
          N'' ,
          2 ,
          2 ,
          N'fgs' ,
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
VALUES  ( 47 ,
          NULL ,
          43 ,
          N'工器具配置标准' ,
          N'/OtherCompany/ToolsStandard.aspx?nodeid=47' ,
          NULL ,
          N'' ,
          2 ,
          3 ,
          N'fgs' ,
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
VALUES  ( 48 ,
          NULL ,
          43 ,
          N'工器具管理评价' ,
          N'/OtherCompany/ToolsEvaluate.aspx?nodeid=48' ,
          NULL ,
          N'' ,
          2 ,
          4 ,
          N'fgs' ,
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
VALUES  ( 49 ,
          NULL ,
          43 ,
          N'分公司考核兑现' ,
          N'/OtherCompany/KaoHeDuiXian.aspx?nodeid=49' ,
          NULL ,
          N'' ,
          2 ,
          5 ,
          N'fgs' ,
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
VALUES  ( 50 ,
          NULL ,
          26 ,
          N'网络安全图管理' ,
          N'/UnitManage/SaveNetworkMap.aspx' ,
          NULL ,
          NULL ,
          1 ,
          5 ,
          N'unit_decription' ,
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
VALUES  ( 10, 2, 3 )
GO
INSERT  [dbo].[nbers_role_user]
        ( [id], [role_id], [user_id] )
VALUES  ( 11, 2, 4 )
GO
INSERT  [dbo].[nbers_role_user]
        ( [id], [role_id], [user_id] )
VALUES  ( 13, 2, 2 )
GO
INSERT  [dbo].[nbers_role_user]
        ( [id], [role_id], [user_id] )
VALUES  ( 14, 3, 2 )
GO
INSERT  [dbo].[nbers_role_user]
        ( [id], [role_id], [user_id] )
VALUES  ( 15, 4, 2 )
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
VALUES  ( 5 ,
          N'12' ,
          N'1' ,
          N'E10ADC3949BA59ABBE56E057F20F883E' ,
          NULL ,
          0 ,
          NULL ,
          0 ,
          NULL ,
          N'' ,
          NULL ,
          NULL ,
          NULL ,
          0 ,
          0 ,
          N'' ,
          N'0' ,
          NULL ,
          4 ,
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
ALTER TABLE [dbo].[nbers_netmap] ADD  CONSTRAINT [DF_nbers_netmap_node_guid]  DEFAULT (NEWID()) FOR [node_guid]
GO
ALTER TABLE [dbo].[nbers_node] ADD  CONSTRAINT [DF__nbers_nod__versi__04E4BC85]  DEFAULT (NULL) FOR [version]
GO
ALTER TABLE [dbo].[nbers_node] ADD  CONSTRAINT [DF_nbers_node_parentId]  DEFAULT ((0)) FOR [parentId]
GO
ALTER TABLE [dbo].[nbers_node] ADD  CONSTRAINT [DF__nbers_nod__param__05D8E0BE]  DEFAULT (NULL) FOR [params]
GO
ALTER TABLE [dbo].[nbers_node] ADD  CONSTRAINT [DF__nbers_node__icon__06CD04F7]  DEFAULT (NULL) FOR [icon]
GO
ALTER TABLE [dbo].[nbers_node] ADD  CONSTRAINT [DF__nbers_nod__level__07C12930]  DEFAULT ('0') FOR [levels]
GO
ALTER TABLE [dbo].[nbers_node] ADD  CONSTRAINT [DF__nbers_nod__sortC__08B54D69]  DEFAULT (NULL) FOR [sortCode]
GO
ALTER TABLE [dbo].[nbers_node] ADD  CONSTRAINT [DF__nbers_nod__modul__09A971A2]  DEFAULT (NULL) FOR [moduleId]
GO
ALTER TABLE [dbo].[nbers_node] ADD  CONSTRAINT [DF__nbers_nod__enabl__0A9D95DB]  DEFAULT (NULL) FOR [enable]
GO
ALTER TABLE [dbo].[nbers_node] ADD  CONSTRAINT [DF__nbers_nod__group__0B91BA14]  DEFAULT ('0') FOR [group_id]
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
